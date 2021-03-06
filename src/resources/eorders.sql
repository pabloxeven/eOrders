-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 01, 2017 at 02:53 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eorders`
--
CREATE DATABASE IF NOT EXISTS `eorders` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `eorders`;

-- --------------------------------------------------------

--
-- Table structure for table `accesoriosPorLineaDetalle`
--

CREATE TABLE `accesoriosPorLineaDetalle` (
  `lineaID` int(11) NOT NULL,
  `accesorioID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accesoriosPorLineaDetalle`
--

INSERT INTO `accesoriosPorLineaDetalle` (`lineaID`, `accesorioID`) VALUES
(1, 11),
(3, 12);

-- --------------------------------------------------------

--
-- Table structure for table `accesoriosPorProducto`
--

CREATE TABLE `accesoriosPorProducto` (
  `prodID` int(11) NOT NULL,
  `accesorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accesoriosPorProducto`
--

INSERT INTO `accesoriosPorProducto` (`prodID`, `accesorio`) VALUES
(19, 1),
(20, 1),
(21, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `accesoriosview`
-- (See below for the actual view)
--
CREATE TABLE `accesoriosview` (
);

-- --------------------------------------------------------

--
-- Table structure for table `lineasDetalle`
--

CREATE TABLE `lineasDetalle` (
  `lineaID` int(11) NOT NULL,
  `prodID` int(11) NOT NULL,
  `tamanioElegido` varchar(50) DEFAULT NULL,
  `precioUnitario` double DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `idOrden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lineasDetalle`
--

INSERT INTO `lineasDetalle` (`lineaID`, `prodID`, `tamanioElegido`, `precioUnitario`, `cantidad`, `subtotal`, `total`, `idOrden`) VALUES
(1, 19, '2 personas', 430, 2, 860, 860, 1),
(2, 22, 'Unitario', 450, 2, 900, 900, 1),
(3, 19, '2 personas', 430, 1, 430, 430, 2),
(4, 22, 'Unitario', 450, 2, 900, 900, 2),
(5, 19, '2 personas', 430, 1, 430, 430, 3),
(6, 22, 'Unitario', 450, 2, 900, 900, 3),
(7, 19, '2 personas', 430, 1, 430, 430, 4),
(8, 22, 'Unitario', 450, 2, 900, 900, 4),
(9, 19, '2 personas', 430, 1, 430, 430, 5),
(10, 22, 'Unitario', 450, 3, 1350, 1350, 5),
(11, 1, 'Chica', 10, 2, 20, 20, 1),
(12, 1, 'Mediana', 20, 1, 20, 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ordenes`
--

CREATE TABLE `ordenes` (
  `idOrden` int(11) NOT NULL,
  `nombreContacto` varchar(60) NOT NULL,
  `telefonoContacto` varchar(20) DEFAULT NULL,
  `detallesAdicionales` text,
  `fechaEntrega` date DEFAULT NULL,
  `detallesEntrega` text,
  `montoAbonado` double DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordenes`
--

INSERT INTO `ordenes` (`idOrden`, `nombreContacto`, `telefonoContacto`, `detallesAdicionales`, `fechaEntrega`, `detallesEntrega`, `montoAbonado`, `descuento`, `status`) VALUES
(1, 'Pablo Acevedo A', '+541553473440', 'N/A', '2017-09-29', 'Retira por local', 100, 50, 'Preparado'),
(2, 'Pablo Areco', '2344555', 'asdfasf', '2017-09-28', 'Retira por local', 0, 0, 'Cancelado'),
(3, 'Pablo Acevedo Areco', '+5491123456789', 'Profe JavaSE8', '2017-10-19', 'Retira por local 13hs', 10, 5, 'Entregado'),
(4, 'Richard Stallman', '+3445566', 'GNU dad', '2017-07-31', 'Entregar por DHL a USA', 2, 3, 'Cancelado'),
(5, 'Linus Torvalds', '+358 91911', 'GIT and Linux dad', '2017-07-30', 'Entregar por DHL a Finlandia', 1, 0, 'Confirmado');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `prodID` int(11) NOT NULL,
  `nombreProducto` varchar(50) NOT NULL,
  `detallesProducto` text NOT NULL,
  `precioPorTamanio` text COMMENT 'serializado del hashmap',
  `fechaModificacionPrecio` date DEFAULT NULL,
  `soloAccesorio` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'define si se muestra el producto en la lista principal o no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`prodID`, `nombreProducto`, `detallesProducto`, `precioPorTamanio`, `fechaModificacionPrecio`, `soloAccesorio`) VALUES
(1, 'Bandeja artesanal', 'Bandeja comestible a base de pan.', '{\"Chica\":10.0,\"Mediana\":20.0,\"Grande\":30.0}', '2017-09-24', 1),
(19, 'Picada especial criolla', 'Jamón cocido\nJamón crudo\nBondiola\nLomito ahumado\nSalame\nLonganiza calabresa\nSalamin \nMortadela\nCantimpalo\nQueso tybo\nQueso pategras \nAceitunas descarozadas\nTomates cherry\nEspaditas de copetin', '{\"Individual\":200.0,\"2 personas\":430.0,\"3 personas \":550.0,\"4 personas \":680.0,\"5 personas \":810.0,\"6 personas \":935.0,\"7 personas \":1060.0,\"8 personas \":1180.0,\"9 personas \":1300.0,\"10 personas \":1420.0,\"11 personas\":1540.0}', '2017-09-26', 0),
(20, 'Picada XEVEN', 'Queso roquefort\nCantimpalo\nQueso tybo\nQueso pategras\nJamón crudo\nLomito ahumado\nSalamin \nLonganiza\nAceitunas descarozadas\nTomates cherry\nEspaditas de copetin ', '{\"individual\":190.0,\"2 personas \":380.0,\"3 personas \":430.0,\"4 personas \":500.0,\"5 personas \":625.0}', '2017-09-26', 0),
(21, 'Picada economica ', 'queso tybo\njamon cocido\nmortadela \nsalame milan \nsalamin \nbondiola \nqueso pategras \naceitunas descarozadas\nespaditas de copetin ', '{\"individual\":165.0,\"2 personas \":330.0,\"3 personas \":380.0,\"4 personas \":480.0,\"5 personas \":580.0}', '2017-09-26', 0),
(22, 'Matambre', 'Cortado en 22 rodajas ', '{\"Unitario\":450.0}', '2017-09-26', 0),
(23, 'Sanwhiches de chips ', 'jamon y queso ', '{\"la docena \":75.0}', '2017-09-26', 0);

-- --------------------------------------------------------

--
-- Structure for view `accesoriosview`
--
DROP TABLE IF EXISTS `accesoriosview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `accesoriosview`  AS  select concat('Accesorios para ',`P`.`nombreProducto`,' (prodID=',`P`.`prodID`,')') AS `Producto`,`O`.`prodID` AS `prodID`,`O`.`nombreProducto` AS `nombreProducto`,`O`.`detallesProducto` AS `detallesProducto`,`O`.`precioPorTamanio` AS `precioPorTamanio`,`O`.`fechaModificacionPrecio` AS `fechaModificacionPrecio`,`o`.`accesorios` AS `accesorios` from ((`productos` `P` join `accesoriosporproducto` `A` on((`a`.`prodID` = `p`.`prodID`))) join `productos` `O` on((`a`.`accesorio` = `o`.`prodID`))) where (`p`.`prodID` = 4) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesoriosPorLineaDetalle`
--
ALTER TABLE `accesoriosPorLineaDetalle`
  ADD PRIMARY KEY (`lineaID`,`accesorioID`);

--
-- Indexes for table `accesoriosPorProducto`
--
ALTER TABLE `accesoriosPorProducto`
  ADD PRIMARY KEY (`prodID`,`accesorio`),
  ADD UNIQUE KEY `prodID` (`prodID`,`accesorio`);

--
-- Indexes for table `lineasDetalle`
--
ALTER TABLE `lineasDetalle`
  ADD PRIMARY KEY (`lineaID`);

--
-- Indexes for table `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`idOrden`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`prodID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lineasDetalle`
--
ALTER TABLE `lineasDetalle`
  MODIFY `lineaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `prodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
