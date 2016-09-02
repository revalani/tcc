-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 29-Ago-2016 às 16:33
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sge`
--
CREATE DATABASE IF NOT EXISTS `sge` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sge`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `disciplina_id` varchar(5) NOT NULL,
  `disciplina_nome` varchar(16) NOT NULL,
  `materia_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materia`
--

CREATE TABLE `materia` (
  `materia_id` varchar(5) NOT NULL,
  `nome` text NOT NULL,
  `descricao` text NOT NULL,
  `disciplina_id` varchar(5) NOT NULL,
  `ano` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prof_turma`
--

CREATE TABLE `prof_turma` (
  `matricula` varchar(10) NOT NULL,
  `cod_turma` varchar(5) NOT NULL,
  `ano_letivo` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor_disciplinas`
--

CREATE TABLE `professor_disciplinas` (
  `matricula` varchar(10) NOT NULL,
  `disciplina_id` varchar(5) NOT NULL,
  `ano` varchar(5) NOT NULL,
  `ano_letivo` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `profs`
--

CREATE TABLE `profs` (
  `matricula` varchar(10) NOT NULL,
  `nome` tinytext NOT NULL,
  `data_nasc` date NOT NULL,
  `cpf` tinyint(11) NOT NULL,
  `telefone_residencia` varchar(15) NOT NULL,
  `telefone_celular` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `endereco` text NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prova_questoes`
--

CREATE TABLE `prova_questoes` (
  `cod_prova` varchar(5) NOT NULL,
  `cod_quest` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `provas`
--

CREATE TABLE `provas` (
  `cod_prova` varchar(5) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `cod_disciplina` varchar(5) NOT NULL,
  `ano` varchar(4) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `questoes`
--

CREATE TABLE `questoes` (
  `cod_quest` int(12) NOT NULL COMMENT 'codigo associado a questao ( cahave primaria)',
  `autor` varchar(50) NOT NULL COMMENT 'autor da questao; ou cod_prof ou enem,uff etc ',
  `nivel` char(1) NOT NULL COMMENT 'a dificuldade da questao: b>baixo,m>medio,a>alto',
  `tipo` char(1) NOT NULL COMMENT 'd>discursiva e o>objetivas',
  `disciplina_id` varchar(5) NOT NULL,
  `materia_id` varchar(5) NOT NULL,
  `enunciado` text NOT NULL,
  `op1` text NOT NULL,
  `op2` text NOT NULL,
  `op3` text NOT NULL,
  `op4` text NOT NULL,
  `op5` text NOT NULL,
  `gabarito` text NOT NULL,
  `direitos` varchar(3) NOT NULL COMMENT 'pub:publico ou pri:privado(disponivel somente para o prof criador da questao)',
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `cod_turma` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `matricula` varchar(10) NOT NULL,
  `senha` tinytext NOT NULL,
  `permicao` varchar(10) NOT NULL,
  `data_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`disciplina_id`);

--
-- Indexes for table `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`materia_id`);

--
-- Indexes for table `profs`
--
ALTER TABLE `profs`
  ADD PRIMARY KEY (`matricula`);

--
-- Indexes for table `provas`
--
ALTER TABLE `provas`
  ADD PRIMARY KEY (`cod_prova`);

--
-- Indexes for table `questoes`
--
ALTER TABLE `questoes`
  ADD PRIMARY KEY (`cod_quest`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`cod_turma`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`matricula`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `profs` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
