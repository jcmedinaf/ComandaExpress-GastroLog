comanda_express/
├── backend/
│   ├── config/
│   │   └── conexion.php           # Conexión MySQLi con charset UTF-8
│   ├── categorias/
│   │   └── get_categorias.php     # Obtener menú por categorías
│   ├── productos/
│   │   └── get_productos.php      # Catalogo de platos activos
│   ├── comandas/
│   │   ├── get_comandas_kds.php   # Obtener comandas activas para pantalla de cocina
│   │   ├── save_comanda.php       # Registrar nueva comanda con su detalle
│   │   └── update_estado.php      # Cambiar estado (Pendiente -> Preparación -> Listo)
│   └── reportes/
│       ├── ticket_pdf.php         # Generación de ticket térmico en PDF
│       └── cierre_caja.php        # Resumen de ventas diarias para Excel/PDF
├── src/
│   ├── app/
│   │   ├── componentes/           # Controladores JavaScript (Lógica AJAX)
│   │   │   ├── pos/               # Toma de pedidos rápida
│   │   │   │   └── index.js
│   │   │   ├── cocina/            # KDS (Kitchen Display System)
│   │   │   │   └── index.js
│   │   │   └── mesas/
│   │   │       └── index.js
│   │   └── vistas/                # Vistas dinámicas HTML
│   │       ├── pos/
│   │       │   └── index.html
│   │       ├── cocina/
│   │       │   └── index.html
│   │       └── mesas/
│   │           └── index.html
│   └── assets/
│       ├── css/
│       │   └── estilos.css
│       └── js/
├── app.js                         # Enrutador principal de la SPA
├── db_schema.sql                  # Script SQL de la base de datos
├── index.html                     # Punto de entrada principal (Bootstrap 5)
└── README.md                      # Documentación del proyecto