-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 17-Ago-2017 às 13:35
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pw1`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `cdcidade` int(11) NOT NULL,
  `nmcidade` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `ufcidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`cdcidade`, `nmcidade`, `ufcidade`) VALUES
(1, 'Pelotas', 1),
(2, 'Rio Grande', 1),
(3, 'Porto Alegre', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `cdcurso` int(11) NOT NULL,
  `nmcurso` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `semestres` int(2) NOT NULL,
  `horas` int(4) NOT NULL,
  `nivel` enum('tecnológico','técnico','','') COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`cdcurso`, `nmcurso`, `semestres`, `horas`, `nivel`) VALUES
(1, 'Informática', 6, 2400, 'tecnológico'),
(2, 'Eletrônica', 5, 2000, 'tecnológico'),
(3, 'química', 6, 2000, 'técnico');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `cdestado` int(2) NOT NULL,
  `nmestado` varchar(2) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`cdestado`, `nmestado`) VALUES
(1, 'RS'),
(2, 'SC'),
(3, 'PR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `cdpessoa` int(11) NOT NULL,
  `nome` varchar(100) CHARACTER SET latin1 NOT NULL,
  `nascimento` date NOT NULL,
  `sexo` varchar(1) CHARACTER SET latin1 NOT NULL,
  `cdcidadepessoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`cdpessoa`, `nome`, `nascimento`, `sexo`, `cdcidadepessoa`) VALUES
(26, 'Joana', '1982-01-01', 'F', 2),
(42, 'Rui', '2010-01-11', 'M', 1),
(43, 'André', '1973-01-13', 'M', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sexo`
--

CREATE TABLE `sexo` (
  `cdsexo` varchar(1) COLLATE utf8_swedish_ci NOT NULL,
  `nmsexo` varchar(10) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `sexo`
--

INSERT INTO `sexo` (`cdsexo`, `nmsexo`) VALUES
('F', 'Feminino'),
('M', 'Masculino');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `cdturma` int(11) NOT NULL,
  `cdcursoturma` int(11) NOT NULL,
  `nmturma` varchar(4) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`cdturma`, `cdcursoturma`, `nmturma`) VALUES
(1, 1, '1N1'),
(2, 2, '2N1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`cdcidade`),
  ADD KEY `ufcidade` (`ufcidade`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`cdcurso`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`cdestado`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`cdpessoa`),
  ADD KEY `fkcidadepessoa` (`cdcidadepessoa`);

--
-- Indexes for table `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`cdsexo`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`cdturma`),
  ADD KEY `fkcursoturma` (`cdcursoturma`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cidade`
--
ALTER TABLE `cidade`
  MODIFY `cdcidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `cdcurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `cdestado` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `cdpessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `turma`
--
ALTER TABLE `turma`
  MODIFY `cdturma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fkuf` FOREIGN KEY (`ufcidade`) REFERENCES `estado` (`cdestado`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `fkcidadepessoa` FOREIGN KEY (`cdcidadepessoa`) REFERENCES `cidade` (`cdcidade`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fkcursoturma` FOREIGN KEY (`cdcursoturma`) REFERENCES `curso` (`cdcurso`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
