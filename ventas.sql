CREATE TABLE `Categoria`  (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  `descripcion` varchar(250) NULL,
  `estatus` tinyint(1) NULL,
  PRIMARY KEY (`id_categoria`)
);

CREATE TABLE `Detalle_ingreso`  (
  `id_detalle_ingreso` int NOT NULL AUTO_INCREMENT,
  `id_ingreso` int NULL,
  `id_producto` int NULL,
  `cantidad` int NULL,
  `precio_compra` decimal(11, 2) NULL,
  `precio_venta` decimal(11, 2) NULL,
  PRIMARY KEY (`id_detalle_ingreso`)
);

CREATE TABLE `Detalle_venta`  (
  `id_detalle_venta` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NULL,
  `id_producto` int NULL,
  `cantidad` int NULL,
  `precio_venta` decimal(11, 2) NULL,
  `descuento` decimal(10, 2) NULL,
  PRIMARY KEY (`id_detalle_venta`)
);

CREATE TABLE `Ingreso`  (
  `id_ingreso` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NULL,
  `tipo_comprobante` varchar(20) NULL,
  `num_comprobante` varchar(10) NULL,
  `fecha_hora` datetime NULL,
  `impuesto` decimal(10, 2) NULL,
  `estado` varchar(255) NULL,
  PRIMARY KEY (`id_ingreso`)
);

CREATE TABLE `Persona`  (
  `id_persona` int NOT NULL,
  `tipo_persona` varchar(20) NULL,
  `nombre` varchar(100) NULL,
  `tipo_documento` varchar(20) NULL,
  `num_documento` varchar(15) NULL,
  `direccion` varchar(70) NULL,
  `telefono` varchar(15) NULL,
  `email` varchar(50) NULL,
  PRIMARY KEY (`id_persona`)
);

CREATE TABLE `Producto`  (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `codigo` varchar(50) NULL,
  `nombre` varchar(100) NULL,
  `stock` int NULL,
  `descripcion` varchar(512) NULL,
  `imagen` varchar(50) NULL,
  `estatus` varchar(20) NULL,
  PRIMARY KEY (`id_producto`)
);

CREATE TABLE `Venta`  (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NULL,
  `tipo_comprobante` varchar(20) NULL,
  `num_comprobante` varchar(10) NULL,
  `fecha_hora` datetime NULL,
  `impuesto` decimal(4, 2) NULL,
  `total_venta` decimal(11, 2) NULL,
  `estado` varchar(20) NULL,
  PRIMARY KEY (`id_venta`)
);

ALTER TABLE `Categoria` ADD CONSTRAINT `fk_Categoria_Producto_1` FOREIGN KEY (`id_categoria`) REFERENCES `Producto` (`codigo`);
ALTER TABLE `Ingreso` ADD CONSTRAINT `fk_Ingreso_Detalle_ingreso_1` FOREIGN KEY (`id_ingreso`) REFERENCES `Detalle_ingreso` (`id_ingreso`);
ALTER TABLE `Persona` ADD CONSTRAINT `fk_Persona_Venta_1` FOREIGN KEY (`nombre`) REFERENCES `Venta` (`total_venta`);
ALTER TABLE `Persona` ADD CONSTRAINT `fk_Persona_Ingreso_1` FOREIGN KEY (`id_persona`) REFERENCES `Ingreso` (`tipo_comprobante`);
ALTER TABLE `Producto` ADD CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);
ALTER TABLE `Producto` ADD CONSTRAINT `fk_Producto_Detalle_venta_1` FOREIGN KEY (`stock`) REFERENCES `Detalle_venta` (`precio_venta`);
ALTER TABLE `Producto` ADD CONSTRAINT `fk_Producto_Detalle_ingreso_1` FOREIGN KEY (`id_producto`) REFERENCES `Detalle_ingreso` (`id_detalle_ingreso`);
ALTER TABLE `Venta` ADD CONSTRAINT `fk_Venta_Detalle_venta_1` FOREIGN KEY (`id_venta`) REFERENCES `Detalle_venta` (`cantidad`);

