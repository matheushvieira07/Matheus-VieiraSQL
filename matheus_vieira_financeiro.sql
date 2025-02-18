-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/02/2025 às 21:07
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `matheus_financeiro`
--
DROP DATABASE IF EXISTS `matheus_financeiro`;
CREATE DATABASE IF NOT EXISTS `matheus_financeiro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `matheus_financeiro`;

DELIMITER $$
--
-- Procedimentos
--
DROP PROCEDURE IF EXISTS `mySp_correntistaDelete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_correntistaDelete` (`v_id` INT)   BEGIN
IF((v_id>0)&&(v_id!=''))THEN
delete from tbl_correntista WHERE correntista_id=v_id;
ELSE
SELECT'O identificador do registro não foi informado!' as Msg;
END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_correntistaInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_correntistaInsert` (IN `v_nome` VARCHAR(60), IN `v_cpf` VARCHAR(20))   BEGIN 
IF ((v_nome!='')&&(v_cpf!=''))THEN
INSERT INTO tbl_correntista
(correntista_nome,correntista_cpf)
VALUES
(v_nome,v_cpf);
ELSE
SELECT'Nome e cpf devem ser fornecidos para o cadastro!'
AS Msg;
END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_correntistaUpdate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_correntistaUpdate` (IN `v_id` INT, IN `v_nome` VARCHAR(60), IN `v_cpf` VARCHAR(20))   begin 
    if (((v_id>0)&&(v_id!=''))&&(v_nome!='')&&(v_cpf!='')) then 
    update tbl_correntista set correntista_nome = v_nome, correntista_cpf = v_cpf
    where correntista_id=v_id;
    ELSE
    SELECT 'Os novos nome e CPF devem ser informados!'
    AS Msg;
    END IF;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itensvenda`
--

DROP TABLE IF EXISTS `itensvenda`;
CREATE TABLE `itensvenda` (
  `Venda` int(11) DEFAULT NULL,
  `Produto` varchar(3) DEFAULT NULL,
  `Quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Acionadores `itensvenda`
--
DROP TRIGGER IF EXISTS `Tgr_itensvenda_Insert`;
DELIMITER $$
CREATE TRIGGER `Tgr_itensvenda_Insert` AFTER INSERT ON `itensvenda` FOR EACH ROW BEGIN
UPDATE produtos set estoque=estoque - new.quantidade
WHERE referencia = new.produto;
end
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `Tgr_itensvenda_delete`;
DELIMITER $$
CREATE TRIGGER `Tgr_itensvenda_delete` AFTER DELETE ON `itensvenda` FOR EACH ROW BEGIN
UPDATE produtos set estoque = estoque+old.quantidade
WHERE referencia= old.produto;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `Referencia` varchar(3) NOT NULL,
  `Descricao` varchar(50) DEFAULT NULL,
  `Estoque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`Referencia`, `Descricao`, `Estoque`) VALUES
('001', 'Feijão', 10),
('002', 'Arroz', 5),
('003', 'Farinha', 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbl_correntista`
--

DROP TABLE IF EXISTS `tbl_correntista`;
CREATE TABLE `tbl_correntista` (
  `correntista_id` int(11) NOT NULL,
  `correntista_nome` varchar(60) NOT NULL,
  `correntista_cpf` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbl_correntista`
--

INSERT INTO `tbl_correntista` (`correntista_id`, `correntista_nome`, `correntista_cpf`) VALUES
(1, 'Matheus Henrique Vieira', '023.456.789-10'),
(2, 'Ary Stark', '023.456.789-12');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `v`;
CREATE TABLE `v` (
`Qtde` int(11)
,`Preco` decimal(10,2)
,`Valor` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

DROP TABLE IF EXISTS `vendas`;
CREATE TABLE `vendas` (
  `Qtde` int(11) NOT NULL,
  `Preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`Qtde`, `Preco`) VALUES
(3, 5.45),
(10, 45.00),
(20, 3.50),
(8, 9.87);

-- --------------------------------------------------------

--
-- Estrutura para view `v`
--
DROP TABLE IF EXISTS `v`;

DROP VIEW IF EXISTS `v`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v`  AS SELECT `vendas`.`Qtde` AS `Qtde`, `vendas`.`Preco` AS `Preco`, `vendas`.`Qtde`* `vendas`.`Preco` AS `Valor` FROM `vendas` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`Referencia`),
  ADD UNIQUE KEY `Descricao` (`Descricao`);

--
-- Índices de tabela `tbl_correntista`
--
ALTER TABLE `tbl_correntista`
  ADD PRIMARY KEY (`correntista_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbl_correntista`
--
ALTER TABLE `tbl_correntista`
  MODIFY `correntista_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
