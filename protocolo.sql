-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Set-2022 às 00:12
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `protocolo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `protocolo_table`
--

CREATE TABLE `protocolo_table` (
  `numero` int(11) NOT NULL,
  `solicitante` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `ano` year(4) NOT NULL,
  `stats` tinyint(4) NOT NULL,
  `dataCadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `protocolo_table`
--

INSERT INTO `protocolo_table` (`numero`, `solicitante`, `descricao`, `email`, `ano`, `stats`, `dataCadastro`) VALUES
(1, 'joão', 'solicitação de credito', 'joão@joão.com', 2022, 1, '2022-09-16 23:24:13'),
(2, 'fabricio', 'solicitação de credito', 'fabricio@fabricio.com', 2022, 1, '2022-09-16 23:25:28'),
(3, 'fabricio', 'solicitação de credito', 'fabricio@fabricio.com', 2022, 1, '2022-09-16 23:25:53'),
(4, 'fabricio', 'solicitação de credito', 'fabricio@fabricio.com', 2022, 1, '2022-09-16 23:26:00'),
(5, 'teste', 'teste', 'teste', 2022, 1, '2022-09-16 23:27:06'),
(6, 'teste', 'teste', 'teste', 2022, 1, '2022-09-16 23:34:28'),
(7, 'kesley', 'solicitação de credito', 'kesley@kesley.com', 2022, 1, '2022-09-16 23:55:50'),
(8, 'teste1', 'teste1', 'teste1@teste', 2022, 1, '2022-09-17 00:08:33');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `protocolo_table`
--
ALTER TABLE `protocolo_table`
  ADD PRIMARY KEY (`numero`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `protocolo_table`
--
ALTER TABLE `protocolo_table`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
