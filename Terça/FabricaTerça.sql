create database loja;
use loja;

CREATE TABLE Cliente (
    ID_Cliente int  PRIMARY KEY,
    Nome VARCHAR(50),
    Endereco VARCHAR(80),
    Telefone int ,
    E_mail VARCHAR(50),
    fk_Pedido_ID_Pedido int 
);

CREATE TABLE Produto (
    ID_Produto int  PRIMARY KEY,
    Nome VARCHAR(50),
    Descricao VARCHAR(500),
    Preco FLOAT,
    QTD_estoque int 
);

CREATE TABLE Pedido (
    ID_Pedido int  PRIMARY KEY,
    DataPedido DATE,
    StatusPedido VARCHAR(20),
    TotalPedido int ,
    fk_Nota_Fiscal_Num_Nota int ,
    fk_Nota_Fiscal_ID_Cliente int 
);

CREATE TABLE Funcionario (
    ID_funcionario int  PRIMARY KEY,
    Nome VARCHAR(50),
    Cargo VARCHAR(50),
    Data_contratacao DATE,
    Salario FLOAT,
    fk_Pedido_ID_Pedido int 
);

CREATE TABLE Fornecedor (
    ID_fornecedor int  PRIMARY KEY,
    NomeEmpresa VARCHAR(50),
    Endereco VARCHAR(80),
    Telefone int ,
    E_mail VARCHAR(50)
);

CREATE TABLE Categoria_de_Produto (
    ID_Categoria int  PRIMARY KEY,
    NomeCategoria VARCHAR(50),
    DescricaoCategoria VARCHAR(50),
    fk_Produto_ID_Produto int 
);

CREATE TABLE Nota_Fiscal (
    Num_Nota int ,
    ID_Cliente int ,
    Nome VARCHAR(50),
    Produtos VARCHAR(50),
    Preco FLOAT,
    Data DATE,
    PRIMARY KEY (Num_Nota, ID_Cliente)
);

CREATE TABLE Contem (
    fk_Pedido_ID_Pedido int ,
    fk_Produto_ID_Produto int 
);

CREATE TABLE Fornece (
    fk_Fornecedor_ID_fornecedor int ,
    fk_Produto_ID_Produto int 
);

-- Inserts

insert into produto
values
(21,"Treloso","Alimento",3.00,30),
(22,"Pão Maria","Alimento",9.30,50),
(23,"Água sanitaria","Protudo de limpeza",2.00,35),
(24,"Caderno","Máterial Escolar",20.00,30),
(25,"Refrigerante","Alimento",8.00,31);

insert into Nota_Fiscal 
values
(101, 1, 'Carlos Silva', 'Notebook', 2500.00, '2024-08-01'),
(102, 2, 'Ana Souza', 'Smartphone', 1500.00, '2024-08-03'),
(103, 3, 'Marcos Pereira', 'Tablet', 800.00, '2024-08-05'),
(104, 4, 'Julia Oliveira', 'Televisão', 2200.00, '2024-08-07'),
(105, 5, 'Fernanda Lima', 'Fone de Ouvido', 300.00, '2024-08-10');

insert into Pedido
values
(31, '2024-08-01', 'Pendente', 500, 101, 1),
(32, '2024-08-03', 'Concluído', 750, 102, 2),
(33, '2024-08-05', 'Cancelado', 0, 103, 3),
(34, '2024-08-07', 'Concluído', 1200, 104, 4),
(35, '2024-08-10', 'Pendente', 300, 105, 5);

insert into cliente
values
(1,"Cayan Lucas","Rua maria",999009900,'cayan.com',31),
(2,"Marcelo Lucas","Rua deuza",999009901,'Marcelo.com',32),
(3,"Erivaldo Lucas","Rua oregon",999009902,'Erivaldo.com',33),
(4,"Milera Lucas","Rua boston",999009903,'Milera.com',34),
(5,"Bianca Lucas","Rua mexico",999009904,'Bianca.com',35);

insert into Funcionario 
values
(1, 'João Santos', 'Gerente', '2023-05-15', 5000.00, 31),
(2, 'Maria Oliveira', 'Vendedor', '2023-06-20', 3000.00, 32),
(3, 'Carlos Pereira', 'Assistente', '2023-07-10', 2500.00, 33),
(4, 'Ana Souza', 'Vendedor', '2023-08-01', 3000.00, 34),
(5, 'Fernanda Lima', 'Gerente', '2023-09-05', 5500.00, 35);

insert into Fornecedor 
values
(1, 'Tech Solutions', 'Av. Paulista, 1000, São Paulo, SP',555555555, 'contato@techsolutions.com'),
(2, 'Global Electronics', 'Rua das Flores, 250, Rio de Janeiro, RJ', 444444444, 'suporte@globalelectronics.com'),
(3, 'InovaTec', 'Praça da Liberdade, 50, Belo Horizonte, MG', 333333333, 'vendas@inovatec.com'),
(4, 'NetComputers', 'Rua XV de Novembro, 123, Curitiba, PR', 222222222, 'info@netcomputers.com'),
(5, 'FastTech', 'Av. das Nações, 300, Brasília, DF', 111111111, 'contato@fasttech.com');

insert into fornece
values
(1,21),
(2,22),
(3,23),
(4,24),
(5,25);

insert into contem
values
(31,21),
(32,22),
(33,23),
(34,24),
(35,25);

INSERT INTO Categoria_de_Produto 
VALUES
(101, 'Eletrônicos', 'Produtos eletrônicos e gadgets', 21),
(102, 'Eletrodomésticos', 'Aparelhos para uso doméstico', 22),
(103, 'Móveis', 'Móveis para casa e escritório', 23),
(104, 'Roupas', 'Vestuário masculino e feminino', 24),
(105, 'Esportes', 'Equipamentos e roupas esportivas', 25);

-- 1. SELECT

select * from cliente where nome like 'c%';

-- 2. Função  de agregação

select count(*) from cliente;

-- 3. Update

update cliente set nome = 'Carlos' where ID_Cliente = 2;

-- teste maroto
select * from cliente;
