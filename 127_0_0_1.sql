-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/02/2025 às 20:49
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `matheushenriquevieiraestoque`
--
DROP DATABASE IF EXISTS `matheushenriquevieiraestoque`;
CREATE DATABASE IF NOT EXISTS `matheushenriquevieiraestoque` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `matheushenriquevieiraestoque`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `cnpj` varchar(30) DEFAULT NULL,
  `ie` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cod_cliente`, `nome_cliente`, `endereco`, `cidade`, `cep`, `uf`, `cnpj`, `ie`) VALUES
(20, 'Beth', 'Av Climério n. 45', 'São Paulo', '25679300', '32', 'SP', 9280),
(110, 'Jorge', 'Rua Caiapó 13', 'Curitiba', '30078500', '14', 'PR', NULL),
(130, 'Edmar', 'Rua da Prais s/n', 'Salvador', '30079300', '23', 'BA', 7121),
(157, 'Paulo', 'Tv. Moraes c/3', 'Londrina', NULL, '32', 'PR', 1923),
(180, 'Livio', 'Av. Beira Mar n.1256', 'Florianópolis', '30077500', '12', 'SC', NULL),
(222, 'Lúcia', 'Rua Itabira 123 loja 09', 'Belo Horizonte', '22124391', '28', 'MG', 2985),
(234, 'José', 'Quadra 3 bl. 3 sl 1003', 'Brasilia', '22841650', '21', 'DF', 2931),
(260, 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '30046500', '21', 'RJ', 2530),
(290, 'Renato', 'Rua Meireles n. 123 bl.2 sl.345', 'São Paulo', '30225900', '13', 'SP', 1820),
(390, 'Sebastião', 'Rua da Igreja n. 10', 'Uberaba', '30438700', '32', 'MG', 9071),
(410, 'Rodolfo', 'Largo da Lapa 27 sobrado', 'Rio de Janeiro', '30078900', '12', 'RJ', 7431),
(720, 'Ana', 'Rua 17 n. 19', 'Niteroi', '24358310', '12', 'RJ', 2134),
(830, 'Mauricio', 'Av Paulista 1236 sl/2345', 'São Paulo', '3012683', '32', 'SP', 9343),
(870, 'Flavio', 'Av. Pres Vargas 10', 'São Paulo', '22763931', '22', 'SP', 4631);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_do_pedido`
--

CREATE TABLE `item_do_pedido` (
  `num_pedido` int(11) NOT NULL,
  `cod_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_do_pedido`
--

INSERT INTO `item_do_pedido` (`num_pedido`, `cod_produto`, `quantidade`) VALUES
(121, 25, 10),
(121, 31, 35),
(97, 77, 20),
(101, 31, 9),
(148, 45, 8),
(148, 31, 7),
(148, 77, 3),
(148, 25, 10),
(148, 78, 30),
(104, 53, 32),
(203, 31, 6),
(189, 78, 45),
(143, 31, 20),
(105, 78, 10),
(111, 25, 10),
(111, 78, 70),
(103, 53, 37),
(91, 77, 40),
(138, 22, 10),
(138, 77, 35),
(138, 53, 18),
(108, 13, 17),
(119, 77, 40),
(119, 13, 6),
(119, 22, 10),
(119, 53, 43),
(137, 13, 8),
(101, 78, 18),
(148, 78, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `num_pedido` int(11) NOT NULL,
  `prazo_entrega` int(10) DEFAULT NULL,
  `cod_cliente` int(11) NOT NULL,
  `cod_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`num_pedido`, `prazo_entrega`, `cod_cliente`, `cod_vendedor`) VALUES
(91, 20, 260, 11),
(97, 20, 720, 101),
(98, 20, 410, 209),
(101, 15, 720, 101),
(103, 20, 260, 11),
(104, 30, 110, 101),
(105, 15, 180, 240),
(108, 15, 290, 310),
(111, 20, 260, 240),
(119, 30, 390, 250),
(121, 20, 410, 209),
(127, 10, 410, 11),
(137, 20, 720, 720),
(138, 20, 260, 11),
(143, 30, 20, 111),
(148, 20, 720, 101),
(189, 15, 870, 213),
(203, 30, 830, 250);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `cod_produto` int(11) NOT NULL,
  `unidade_produto` varchar(10) DEFAULT NULL,
  `descricao_produto` varchar(50) DEFAULT NULL,
  `valor_unitario` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`cod_produto`, `unidade_produto`, `descricao_produto`, `valor_unitario`) VALUES
(13, 'G', 'Ouro', 6.18),
(22, 'M', 'Linho', 0.11),
(25, 'Kg', 'Queijo', 0.97),
(30, 'SAC', 'Açucar', 0.30),
(31, 'Bar', 'Chocolate', 0.87),
(45, 'M', 'Madeira', 0.25),
(53, 'M', 'Linha', 1.80),
(77, 'M', 'Papel', 1.05),
(78, 'L', 'Vinho', 2.00),
(87, 'M', 'Cano', 1.97);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `cod_vendedor` int(11) NOT NULL,
  `nome_vendedor` varchar(50) DEFAULT NULL,
  `salario_fixo` decimal(15,2) DEFAULT NULL,
  `faixa_comissao` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendedor`
--

INSERT INTO `vendedor` (`cod_vendedor`, `nome_vendedor`, `salario_fixo`, `faixa_comissao`) VALUES
(11, 'João', 2780.00, 'C'),
(101, 'João', 2650.32, 'C'),
(111, 'Carlos', 2490.00, 'A'),
(209, 'José', 1800.00, 'C'),
(213, 'Jonas', 2300.50, 'A'),
(240, 'Antonio', 9500.00, 'C'),
(250, 'Mauricío', 2930.00, 'B'),
(310, 'Josias', 870.00, 'B'),
(720, 'Felipe', 4600.00, 'A');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Índices de tabela `item_do_pedido`
--
ALTER TABLE `item_do_pedido`
  ADD KEY `Fk_num_pedido_pedido` (`num_pedido`),
  ADD KEY `Fk_cod_produto_produto` (`cod_produto`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`num_pedido`),
  ADD KEY `Fk_cliente_pedido` (`cod_cliente`),
  ADD KEY `Fk_vendedor_pedido` (`cod_vendedor`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`cod_produto`);

--
-- Índices de tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`cod_vendedor`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `item_do_pedido`
--
ALTER TABLE `item_do_pedido`
  ADD CONSTRAINT `Fk_cod_produto_produto` FOREIGN KEY (`cod_produto`) REFERENCES `produto` (`cod_produto`),
  ADD CONSTRAINT `Fk_num_pedido_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedido` (`num_pedido`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `Fk_cliente_pedido` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`),
  ADD CONSTRAINT `Fk_vendedor_pedido` FOREIGN KEY (`cod_vendedor`) REFERENCES `vendedor` (`cod_vendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
