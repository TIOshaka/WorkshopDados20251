-- contar a quantidade de cliente cadastrado
SELECT COUNT(*) AS total_clientes FROM Cliente;

-- media de preco dos produtos
SELECT AVG(preco) AS preco_medio FROM Produto;

-- yotal de pedidos por cliente
SELECT id_cliente, COUNT(*) AS total_pedidos FROM Pedido GROUP BY id_cliente;

-- qntd total de produtos em estoque por deposito
SELECT deposito, SUM(quantidade) AS total_estoque FROM Estoque GROUP BY deposito;

-- numero de fornecedores cadastrado
SELECT COUNT(*) AS total_fornecedores FROM Fornecedor;

-- Operações de JOIN

-- listar pedidos com detalhrs do cliente e produto
SELECT p.id_pedido, c.nome AS cliente, pr.nome AS produto, p.quantidade, p.total 
FROM Pedido p
JOIN Cliente c ON p.id_cliente = c.id_cliente
JOIN Produto pr ON p.id_produto = pr.id_produto;

--  produtos com seus fornecedores
SELECT pr.nome AS produto, f.nome AS fornecedor, e.quantidade 
FROM Estoque e
JOIN Produto pr ON e.id_produto = pr.id_produto
JOIN Fornecedor f ON e.id_fornecedor = f.id_fornecedor;
