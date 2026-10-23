CREATE DATABASE IF NOT EXISTS bd_comanda_express DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE bd_comanda_express;

-- 1. CATEGORÍAS DEL MENÚ
CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    icono VARCHAR(50) DEFAULT 'bi-egg-fried'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. PRODUCTOS / PLATOS
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_producto_categoria FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. MESAS / ÁREAS DE SERVICIO
CREATE TABLE IF NOT EXISTS mesas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_mesa VARCHAR(20) NOT NULL UNIQUE,
    area VARCHAR(50) DEFAULT 'General', -- Ej. Terraza, Barra, Para Llevar
    estado ENUM('LIBRE', 'OCUPADA', 'RESERVADA') DEFAULT 'LIBRE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. CABECERA DE COMANDAS / PEDIDOS
CREATE TABLE IF NOT EXISTS comandas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_comanda VARCHAR(20) NOT NULL UNIQUE, -- Ej. COM-0012
    mesa_id INT DEFAULT NULL,
    tipo_pedido ENUM('MESA', 'PARA_LLEVAR', 'DELIVERY') DEFAULT 'MESA',
    estado ENUM('PENDIENTE', 'EN_PREPARACION', 'LISTO', 'ENTREGADO', 'CANCELADO') DEFAULT 'PENDIENTE',
    total DECIMAL(10, 2) DEFAULT 0.00,
    usuario_id INT NOT NULL, -- Mesero / Cajero que tomó el pedido
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. DETALLE DE LA COMANDA (Items)
CREATE TABLE IF NOT EXISTS comanda_detalles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comanda_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    observacion_cocina VARCHAR(255) DEFAULT NULL, -- Ej. "Sin mostaza, queso extra"
    CONSTRAINT fk_detalle_comanda FOREIGN KEY (comanda_id) REFERENCES comandas(id) ON DELETE CASCADE,
    CONSTRAINT fk_detalle_producto FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DATOS DE PRUEBA INICIALES
INSERT INTO categorias (nombre, icono) VALUES ('Hamburguesas', 'bi-cart'), ('Bebidas', 'bi-cup-straw');
INSERT INTO productos (categoria_id, nombre, precio) VALUES (1, 'Hamburguesa Doble Carne', 8.50), (2, 'Refresco 500ml', 1.50);
INSERT INTO mesas (numero_mesa, area) VALUES ('Mesa 01', 'Salón Principal'), ('Llevar', 'Caja');