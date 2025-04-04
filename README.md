# 📚 Desafio SQL - Livraria

Este projeto tem como objetivo a prática de comandos SQL com a criação de um banco de dados fictício de uma livraria. Ele cobre desde a criação e inserção de dados até consultas utilizando `JOIN`, `GROUP BY`, `WHERE`, `SUM()` e outras funções básicas e intermediárias do MySQL.

---

## 📦 Estrutura do Projeto

- `livraria.sql` – Script único contendo:
  - Criação do banco de dados e tabelas
  - Inserção de dados
  - Consultas que respondem os cases do desafio

---

## 🛠️ Como executar

### 1. Clone o repositório
```bash
git clone https://github.com/CaioSoares-V8/desafio-livraria-sql.git
cd livraria-sql
```

### 2. Acesse o MySQL via terminal
```bash
mysql -u root -p
```


### 3. Execute o script SQL
```bash
source caminho/para/livraria.sql;
```



## 🗃️ Estrutura do Banco de Dados
### 📘 Tabela livros
- id (INT, PK, auto_increment)

- titulo (VARCHAR(255))

- autor (VARCHAR(255))

- genero (VARCHAR(100))

- preco (DECIMAL(10,2))

- data_publicacao (DATE)

### 👤 Tabela clientes
- id (INT, PK, auto_increment)

- nome (VARCHAR(255))

- email (VARCHAR(255))

- endereco (VARCHAR(255))

### 🧾 Tabela vendas
- id (INT, PK, auto_increment)

- id_livro (INT, FK → livros.id)

- id_cliente (INT, FK → clientes.id)

- data_venda (DATE)

- quantidade (INT)

## 🧪 Cases do desafio
- Liste todos os livros da tabela livros.

- Liste todos os clientes da tabela clientes.

- Liste todas as vendas da tabela vendas.

- Encontre o livro mais caro da livraria.

- Liste todos os livros do gênero "Fantasia".

- Liste o nome e o email de todos os clientes que moram em "São Paulo".

- Liste todos os livros publicados após 2020.

- Calcule o total de vendas para cada livro.

- Liste os clientes que compraram o livro "A Guerra dos Tronos".

- Liste os livros que não foram vendidos.

- Calcule o valor total de todas as vendas realizadas.

- Liste os clientes que gastaram mais na livraria.

- Crie uma consulta que liste o nome do livro, o nome do cliente e a data da venda para todas as vendas realizadas.

## ✅ Requisitos
- MySQL Server instalado

- Acesso ao terminal mysql
