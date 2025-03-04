
# Projeto de E-commerce - Banco de Dados

Este projeto tem como objetivo a modelagem e implementação de um banco de dados para um cenário de e-commerce. Abaixo, estão descritos os elementos principais do modelo lógico, incluindo entidades, relacionamentos e regras de integridade.

## Entidades

1. **Cliente**: 
    - Cada cliente pode ser Pessoa Física (PF) ou Pessoa Jurídica (PJ), mas não pode ter as duas informações.
    
2. **Produto**: 
    - Representa os produtos disponíveis no e-commerce.
    
3. **Fornecedor**: 
    - Empresas que fornecem os produtos ao e-commerce.

4. **Estoque**: 
    - Controla a quantidade disponível de cada produto.

5. **Pedido**: 
    - Cada pedido é realizado por um cliente e pode ter vários produtos.

6. **Pagamento**: 
    - Cada pedido pode ter um ou mais pagamentos associados.

7. **Entrega**: 
    - Acompanham o status e código de rastreio de cada pedido.

8. **Vendedor**: 
    - Responsáveis pela venda dos produtos.

9. **Relação Produto-Pedido**: 
    - Relacionamento muitos para muitos entre Produtos e Pedidos.

## Relacionamentos

- **Cliente → Pedido**: Um cliente pode realizar vários pedidos.
- **Pedido → Produto**: Um pedido pode ter vários produtos.
- **Pedido → Pagamento**: Um pedido pode ter várias formas de pagamento.
- **Pedido → Entrega**: Cada pedido tem um status de entrega.
- **Fornecedor → Produto**: Cada produto é fornecido por um único fornecedor.
- **Produto → Estoque**: Controla a quantidade de produtos disponíveis no estoque.
- **Vendedor → Pedido**: Um vendedor pode ser responsável por muitos pedidos.

## Queries de exemplo

1. **Quantos pedidos foram feitos por cada cliente?**
    ```sql
    SELECT c.nome, COUNT(p.pedido_id) AS total_pedidos
    FROM Cliente c
    LEFT JOIN Pedido p ON c.cliente_id = p.cliente_id
    GROUP BY c.cliente_id;
    ```

2. **Algum vendedor também é fornecedor?**
    ```sql
    SELECT v.nome AS vendedor_nome, f.nome AS fornecedor_nome
    FROM Vendedor v
    JOIN Fornecedor f ON v.fornecedor_id = f.fornecedor_id;
    ```

3. **Relação de produtos, fornecedores e estoques**
    ```sql
    SELECT p.nome AS produto_nome, f.nome AS fornecedor_nome, e.quantidade
    FROM Produto p
    JOIN Fornecedor f ON p.fornecedor_id = f.fornecedor_id
    JOIN Estoque e ON p.produto_id = e.produto_id;
    ```

## Estrutura das Tabelas e Modelagem Lógica

A modelagem lógica foi feita considerando integridade referencial, normalização de dados e consistência das informações entre as tabelas.

## Tecnologias

- **SQL**: Utilizado para criar, alterar e consultar as tabelas no banco de dados.
- **MySQL**: Sistema de gerenciamento de banco de dados relacional utilizado.

