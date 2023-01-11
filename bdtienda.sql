-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-01-2023 a las 21:55:04
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdtienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` bigint(20) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `dni` varchar(60) NOT NULL,
  `fecha_alta` date NOT NULL DEFAULT curdate(),
  `fecha_baja` date NOT NULL DEFAULT '9999-12-31',
  `nombre` varchar(60) NOT NULL,
  `telefono` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `apellido`, `direccion`, `dni`, `fecha_alta`, `fecha_baja`, `nombre`, `telefono`) VALUES
(1, 'Sosa', 'La Paz 232, CABA', '30988746', '2023-01-10', '9999-12-31', 'Ramon', '6748-9472'),
(2, 'Flores', '9 de Julio 123, CABA', '23654987', '2023-01-10', '9999-12-31', 'Raul', '6453-9537'),
(3, 'Cardozo', 'Quintana 43, CABA', '45235855', '2023-01-10', '9999-12-31', 'Analia', '6432-8888'),
(4, 'Gomez', 'Anchorena 432, CABA', '36754455', '2023-01-10', '9999-12-31', 'Jorge', '6345-5343');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_compra` date NOT NULL DEFAULT curdate(),
  `precio_total` decimal(10,2) NOT NULL,
  `id_producto` bigint(20) NOT NULL,
  `id_proveedor` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `cantidad`, `fecha_compra`, `precio_total`, `id_producto`, `id_proveedor`) VALUES
(1, 2, '2023-01-10', '2400.00', 1, 1),
(2, 10, '2023-01-10', '8500.00', 5, 1),
(3, 10, '2023-01-10', '20000.00', 3, 1),
(4, 5, '2023-01-10', '30000.00', 2, 2),
(5, 2, '2023-01-10', '3600.00', 6, 2),
(6, 3, '2023-01-10', '6000.00', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` bigint(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha_alta` date NOT NULL DEFAULT curdate(),
  `fecha_baja` date NOT NULL DEFAULT '9999-12-31',
  `nombre` varchar(60) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_proveedor` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `descripcion`, `fecha_alta`, `fecha_baja`, `nombre`, `precio`, `stock`, `id_proveedor`) VALUES
(1, 'Pack de 20 unidades de 1kg', '2023-01-10', '9999-12-31', 'Arroz doble fino', '1200.00', 15, 1),
(2, 'Pack de 9 botellas de 2l', '2023-01-10', '9999-12-31', 'Coca-Cola', '6000.00', 45, 2),
(3, 'Pack de 6 frascos de 200ml', '2023-01-10', '9999-12-31', 'Alcohol Etilico', '2000.00', 5, 1),
(4, 'Paquete de 3 rollos', '2023-01-10', '9999-12-31', 'Servilletas Susex', '380.00', 50, 2),
(5, 'Bolsa por 100 u.', '2023-01-10', '9999-12-31', 'Caramelos masticables Arcor', '850.00', 3, 1),
(6, 'Caja de 35u.', '2023-01-10', '9999-12-31', 'Barritas de Cereal', '1800.00', 30, 2),
(7, 'Caja por 10 paquetes', '2023-01-10', '9999-12-31', 'Galletitas Pepas', '2000.00', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` bigint(20) NOT NULL,
  `cuit` varchar(60) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `fecha_alta` date NOT NULL DEFAULT curdate(),
  `fecha_baja` date NOT NULL DEFAULT '9999-12-31',
  `nombre` varchar(60) NOT NULL,
  `telefono` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `cuit`, `direccion`, `fecha_alta`, `fecha_baja`, `nombre`, `telefono`) VALUES
(1, '27-43626423-4', '20 de Junio 650, CABA', '2023-01-10', '9999-12-31', 'Todo Suelto SA', '6234-7635'),
(2, '27-45666325-9', 'Ministro Carranza 324, CABA', '2023-01-10', '9999-12-31', 'Polirubro SRL', '6356-7425'),
(3, '27-42365475-9', 'Sarmiento 333, CABA', '2023-01-10', '2023-01-11', 'Consumo SA', '6532-1111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_venta` date NOT NULL DEFAULT curdate(),
  `precio_total` decimal(10,2) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `id_producto` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `cantidad`, `fecha_venta`, `precio_total`, `id_cliente`, `id_producto`) VALUES
(1, 1, '2023-01-11', '2000.00', 3, 1),
(2, 10, '2023-01-10', '6000.00', 2, 4),
(3, 5, '2023-01-12', '10000.00', 1, 1),
(4, 2, '2023-01-10', '3000.00', 1, 5),
(5, 3, '2023-01-10', '10000.00', 2, 3),
(6, 1, '2023-01-10', '3500.00', 3, 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `UK_m6ysdwsqke00e5piajbvgn6lg` (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `FK2f8u2ilf4ui6gktkvpkfc4j7t` (`id_producto`),
  ADD KEY `FKkypgd762ocsq30thp7sxxhd20` (`id_proveedor`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `FK146wfsn2op2nvbfuxae33xbim` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `UK_ercly2jrt4i29dmat88guxoxw` (`cuit`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `FKleerof1mym3gc1ah8hsarel3f` (`id_cliente`),
  ADD KEY `FK8gbcwhljqwt6c1gjvr09ipipd` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `FK2f8u2ilf4ui6gktkvpkfc4j7t` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `FKkypgd762ocsq30thp7sxxhd20` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK146wfsn2op2nvbfuxae33xbim` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `FK8gbcwhljqwt6c1gjvr09ipipd` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `FKleerof1mym3gc1ah8hsarel3f` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
