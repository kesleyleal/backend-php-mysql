<?php
$conteudo_pesquisa = "";
$conteudo_enviar = "";
try{
    $pdo = new PDO('mysql:host=localhost;dbname=protocolo', 'root','');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    if(isset($_POST['action'])){
        if($_POST['action'] == "enviar"){
            $stmt = $pdo->prepare('INSERT INTO protocolo_table (solicitante,descricao,email,ano,stats,dataCadastro) VALUES(:solicitante,:descricao,:email,:ano,:stats,:dataCadastro)');
            $stmt->execute(array(
                ":solicitante" => $_POST['solicitante'],
                ":descricao" => $_POST['descricao'],
                ":email" => $_POST['email'],
                ":ano" => date("Y"),
                ":stats" => $_POST['stats'],
                ":dataCadastro" => date("Y-m-d H:i:s"),
            ));
            
            $conteudo_enviar .= "Sua solicitação foi enviada, seu numero de protocolo é: " . $pdo->lastInsertId(); 
        }elseif($_POST['action'] == "pesquisar"){
            $query = $pdo->query("SELECT * FROM protocolo_table WHERE numero = {$_POST['numero']}");
            while ($protocolo = $query->fetch(PDO::FETCH_ASSOC)) {
                $conteudo_pesquisa = "<b>Suas informações de Solicitação:</b> <br>";
                $conteudo_pesquisa .= "Nome: " . $protocolo['solicitante'] . '<br>';
                $conteudo_pesquisa .= "Descrição da Solicitação: " .$protocolo['descricao'] . '<br>';
                $conteudo_pesquisa .= "Email: " . $protocolo['email'] . '<br>';
                $conteudo_pesquisa .= "Ano da Solicitação: " . $protocolo['ano'] . '<br>';
                if($protocolo['stats'] == 1){
                    $conteudo_pesquisa .="Status: Aguardando Analise <br>";
                }else{
                    $conteudo_pesquisa .="Status: Sem Status <br>";
                }
                $conteudo_pesquisa .= "Data do Registro da Solicitação: " . $protocolo['dataCadastro'] . '<br>';
            }
        }
    }
} catch(PDOException $e) {
    echo 'Error:' . $e->getMessage();
}

echo 
'<form method="post"> <br>
Abra sua solicitação: <br>
    Nome<input type="text" name="solicitante"> <br>
    Descrição<input type="text" name="descricao"> <br>
    Email<input type="email" name="email"> <br>
     aguardar analise <input type="radio" name="stats" value=1>
    <input type="hidden" name="action" value="enviar"> <br>  
    <input type="submit" value="enviar"> 
</form>';

echo $conteudo_enviar;

echo '<br><br><br>';
echo '<p>Procure a sua solicitação abaixo, informe o seu protocolo:</p>';
echo '<form method="post">
        <input type="text" name="numero">
        <input type="hidden" name="action" value="pesquisar"> <br> <br>
        <input type="submit" value="pesquisar">
      </form>';
echo $conteudo_pesquisa;
?>
