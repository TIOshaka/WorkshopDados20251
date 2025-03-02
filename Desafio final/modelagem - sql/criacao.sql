CREATE DATABASE DESAFIO;
USE DESAFIO;

CREATE TABLE Cliente(
    id_cliente serial PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) unique NOT NULL,
    telefone VARCHAR(20),
    endereco TEXT
);

CREATE TABLE Produto(
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT null,
    descricao text,
    preco DECIMAL(10,2) NOT NULL,
    deposito VARCHAR(50)
);

CREATE TABLE Pedido(
    id_pedido SERIAL PRIMARY KEY,
    data_pedido DATE NOT NULL,
    id_cliente INT REFERENCES Cliente(id_cliente),
    id_produto INT REFERENCES Produto(id_produto),
    quantidade INT NOT NULL,
    total DECIMAL(10,2) NOT NULL
);

CREATE TABLE Fornecedor(
    id_fornecedor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato varchar(100),
    endereco TEXT,
    telefone varchar(20)
);

CREATE TABLE Estoque(
    id_produto INT REFERENCES Produto(id_produto),
    quantidade int NOT NULL,
    data_abastecimento DATE not NULL,
    deposito VARCHAR(50),
    id_fornecedor INT REFERENCES Fornecedor(id_fornecedor),
    PRIMARY KEY (id_produto,id_fornecedor)
);


INSERT INTO Cliente (nome,email,telefone, endereco) values
('Joao Silva', 'joao@email.com', '11999999999', 'Rua A, 123'),
('Maria oliveira', 'maria@email.com', '11888888888', 'Rua B, 456'),
('Carlos Santos', 'carlos@mail.com', '11777777777', 'Rua C, 789'),
('ana Souza', 'ana@email.com', '11666666666', 'Rua D, 101'),
('Bruno Lima', 'bruno@email.com', '11555555555', 'Rua E, 202'),
('Ppaula mendes','paula@email.com', '11444444444', 'Rua F, 303'),
('Ricardo Alves', 'ricardo@email.com', '11333333333', 'Rua G, 404'),
('fernanda Rocha', 'frnanda@email.com', '11222222222', 'Rua H, 505');

INSERT into Produto (nome, descricao, preco,deposito) VALUES
('Notebook Dell XPS', 'Notebook de alto desempenho', 7500.00, 'Depósito central');

INSERT INTO Pedido (data_pedido, id_cliente, id_produto,quantidade, total) VALUES
('2025-03-01',1,1, 2, 15000.00),
('2025-03-02', 2, 1, 1, 7500.00),
('2025-03-02', 3, 1,3, 22500.00),
('2025-03-03', 4,1, 1, 7500.00),
('2025-03-04', 5,1, 2,15000.00),
('2025-03-05', 6, 1, 1, 7500.00),
('2025-03-06',7, 1, 4, 30000.00),
('2025-03-07', 8, 1, 1,7500.00);

INSERT INTO Fornecedor (nome,contato, endereco,telefone) VALUES
('Tech supplier','contato@techsupplier.com', 'Av. industrial, 1234', '1130303030'),
('MegaTech distribuidora', 'contato@megatech.com', 'Rua comercial, 5678','1140404040');

INSERT INTO Estoque (id_produto, quantidade,data_abastecimento,deposito, id_fornecedor) VALUES
(1, 50, '2025-02-28', 'Depósito central',1),
(1, 30, '2025-02-20', 'deposito secundário', 2);
