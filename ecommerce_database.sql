
-- Criação das tabelas

-- Tabela de Cliente
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    tipo_cliente ENUM('PF', 'PJ') NOT NULL,
    documento VARCHAR(20) UNIQUE,
    endereco VARCHAR(255)
);

-- Tabela de Produto
CREATE TABLE Produto (
    produto_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    descricao TEXT,
    preco DECIMAL(10,2),
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
);

-- Tabela de Fornecedor
CREATE TABLE Fornecedor (
    fornecedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    endereco VARCHAR(255)
);

-- Tabela de Estoque
CREATE TABLE Estoque (
    produto_id INT,
    quantidade INT,
    PRIMARY KEY (produto_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

-- Tabela de Pedido
CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data_pedido DATETIME,
    status ENUM('Pendente', 'Em Processamento', 'Finalizado') NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabela de Pagamento
CREATE TABLE Pagamento (
    pagamento_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    tipo_pagamento ENUM('Cartão', 'Boleto', 'Transferência', 'Pix'),
    valor DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);

-- Tabela de Entrega
CREATE TABLE Entrega (
    entrega_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    status ENUM('Pendente', 'Enviado', 'Entregue'),
    codigo_rastreio VARCHAR(255),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);

-- Tabela de Vendedor
CREATE TABLE Vendedor (
    vendedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
);

-- Tabela de Relação Produto-Pedido (muitos para muitos)
CREATE TABLE Produto_Pedido (
    produto_id INT,
    pedido_id INT,
    quantidade INT,
    PRIMARY KEY (produto_id, pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);

-- Tabela de Cliente-Conta (PJ ou PF)
CREATE TABLE Cliente_Conta (
    cliente_id INT,
    tipo_cliente ENUM('PF', 'PJ'),
    PRIMARY KEY (cliente_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);
