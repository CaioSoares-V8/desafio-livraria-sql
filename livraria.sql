create database livraria;
use livraria;

create table livros (
id int primary key auto_increment,
titulo varchar(255),
autor varchar(255),
genero varchar(255),
preco decimal(10, 2),
data_publicacao date
);

create table clientes (
id int primary key auto_increment,
nome varchar(255),
email varchar(255),
endereco varchar(255)
);

create table vendas (
id int primary key auto_increment,
id_livro int,
foreign key (id_livro) references livros (id),
id_cliente int,
foreign key (id_cliente) references clientes (id),
data_venda date,
quantidade int
);

-- Inserindo dados na tabela livros
INSERT INTO livros (titulo, autor, genero, preco, data_publicacao) VALUES
('O Cortiço', 'Aluísio Azevedo', 'Romance', 28.50, '1890-01-01'),
('O Auto da Compadecida', 'Ariano Suassuna', 'Comédia', 26.00, '1955-01-01'),
('A Guerra dos Tronos', 'George R. R. Martin', 'Fantasia', 69.90, '1996-07-01'),
('O Poder do Hábito', 'Charles Duhigg', 'Autoajuda', 56.00, '2012-02-28'),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Fantasia', 45.00, '1997-06-26'),
('1984', 'George Orwell', 'Ficção Científica', 42.50, '1949-06-08'),
('Dom Casmurro', 'Machado de Assis', 'Romance', 30.00, '1899-01-01'),
('Como Fazer Amigos e Influenciar Pessoas', 'Dale Carnegie', 'Autoajuda', 35.00, '1936-08-17'),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Infantil', 25.00, '1943-04-06'),
('Nunca minta', 'Freida McFadden', 'Suspense', 67.90, '2025-01-06');

-- Inserindo dados na tabela clientes
INSERT INTO clientes (nome, email, endereco) VALUES
('Caio Soares', 'caio.soares@email.com', 'São Paulo'),
('Nicolas Ferreira', 'nicolas.ferreira@email.com', 'Rio de Janeiro'),
('Marcus Abranches', 'marcus.abranches@email.com', 'Minas Gerais'),
('Thiago Machado', 'thiago.machado@email.com', 'Bahia'),
('Gustavo Damasceno', 'gustavo.damasceno@email.com', 'Manaus');

-- Inserindo dados na tabela vendas
INSERT INTO vendas (id_livro, id_cliente, data_venda, quantidade) VALUES
(1, 5, '2024-03-01', 1),
(2, 4, '2024-03-02', 2),
(3, 3, '2024-02-03', 1),
(4, 2, '2024-04-01', 1),
(5, 1, '2024-04-02', 3),
(6, 3, '2024-04-03', 2),
(7, 2, '2024-04-04', 1),
(8, 5, '2024-04-05', 1),
(9, 4, '2024-04-06', 2),
(10, 1, '2024-04-07', 3),
(3, 2, '2024-04-08', 1),
(6, 4, '2024-04-09', 2);

-- Liste todos os livros da tabela livros.
select * from livros;

-- Liste todos os clientes da tabela clientes.
select * from clientes;

-- Liste todas as vendas da tabela vendas.
select * from vendas;

-- Encontre o livro mais caro da livraria.
select * from livros 
where preco = (select MAX(preco) from livros);

-- Liste todos os livros do gênero "Fantasia".
select * from livros where genero = "Fantasia";

-- Liste o nome e o email de todos os clientes que moram em "São Paulo".
select nome, email from clientes 
where endereco = "São Paulo";

-- Liste todos os livros publicados após 2020.
select * from livros
where data_publicacao > "2020-01-01";

-- Calcule o total de vendas para cada livro.
select livros.titulo, sum(vendas.quantidade) AS 'Total de vendas'
from vendas 
join livros on vendas.id_livro = livros.id
group by livros.id;

-- Liste os clientes que compraram o livro "A Guerra dos Tronos".
select clientes.nome
from vendas
join clientes on vendas.id_cliente = clientes.id
join livros on vendas.id_livro = livros.id
where livros.titulo = 'A Guerra dos Tronos'
group by clientes.nome;

-- Liste os livros que não foram vendidos.
select livros.*
from livros
left join vendas on livros.id = vendas.id_livro
where vendas.id_livro is null;

-- Calcule o valor total de todas as vendas realizadas.
select sum(livros.preco * vendas.quantidade) as 'Total das vendas'
from vendas
join livros on vendas.id_livro = livros.id;

-- Liste os clientes que gastaram mais na livraria.
select clientes.nome, sum(livros.preco * vendas.quantidade) as 'Mais gastaram'
from vendas
join clientes on vendas.id_cliente = clientes.id
join livros on vendas.id_livro = livros.id
group by clientes.nome
order by sum(livros.preco * vendas.quantidade) desc;

-- Crie uma consulta que liste o nome do livro, o nome do cliente e a data da venda para todas as vendas realizadas.
select livros.titulo, clientes.nome, vendas.data_venda
from vendas
join livros on vendas.id_livro = livros.id
join clientes on vendas.id_cliente = clientes.id;







