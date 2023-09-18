-- Criar um banco de dados (database):

CREATE DATABASE teste;

-- Conectar-se ao database criado:

USE teste;

-- Criar uma tabela dentro do database com os nomes dos campos, tipo de dados, se Primary Key e se permite nulo ou não:

CREATE TABLE CadPessoas (
ID INT PRIMARY KEY,
Nome VARCHAR (50) NOT NULL,
Sobrenome VARCHAR (50) NOT NULL,
Idade INT NOT NULL,
Cidade VARCHAR (50) NOT NULL
);

-- Verificar se a tabela com os campos foram criados:

SELECT * FROM CadPessoas;

-- Verificar a estrutura (schema) da tabela:

EXEC sp_columns CadPessoas;

-- Inserir registros na tabela:

INSERT INTO CadPessoas
VALUES
(6, 'Rodrigo', 'Joze', 25, 'Mauá'),
(7, 'Igor', 'Silva', 50, 'Ribeirão'),
(11, 'Felipe', 'José', 40, 'Santo André'),
(50, 'Maria', 'Pereira', 30, 'ONU'),
(20, 'Rick', 'Felipo', 18, 'Mauá');

-- Adicionar uma nova coluna à tabela:

ALTER TABLE CadPessoas
ADD
	Nome_da_Mae VARCHAR (50),
	Regiao VARCHAR (20)
;

-- Deletar uma coluna:

ALTER TABLE CadPessoas
DROP COLUMN Nome_da_Mae;

-- Alterar o tipo de dado do campo/coluna:

ALTER TABLE CadPessoas
ALTER COLUMN Nome VARCHAR (20);

-- Alterar o nome de uma coluna (nomeantigo, nomenovo):

EXEC sp_rename 'CadPessoas.Sobrenome', 'Surname', 'COLUMN';

-- Consultar a tabela:

SELECT * FROM CadPessoas;

-- Atualizar/alterar um registro de uma coluna:

UPDATE CadPessoas
SET Nome = 'Rodrigao', Idade = 27
WHERE ID = 1;

-- Apagar registros dentro de uma tabela:

DELETE FROM CadPessoas
WHERE ID = 3;

-- Apagar todos os registros de uma tabela:

DELETE FROM CadPessoas;

-- Inserir valores para continuar as consultas:

INSERT INTO CadPessoas
VALUES
(5, 'Rodrigo', 'Joze', 25, 'Mauá', 'ABC'),
(9, 'Igor', 'Silva', 50, 'Ribeirão', 'Leste'),
(12, 'Felipe', 'José', 40, 'Santo André', 'Norte'),
(53, 'Maria', 'Pereira', 30, 'ONU', 'Praia'),
(100, 'Rodrigo', 'Joze', 25, 'Mauá', 'ABC'),
(2, 'Igor', 'Silva', 50, 'Ribeirão', 'Leste'),
(99, 'Felipe', 'José', 40, 'Santo André', 'Norte'),
(80, 'Raria', 'Pereira', 30, 'ONU', 'Praia'),
(51, 'Fodrigo', 'Joze', 25, 'Mauá', 'ABC'),
(52, 'Egor', 'Silva', 50, 'Ribeirão', 'Leste'),
(85, 'Helipe', 'José', 40, 'Santo André', 'Norte'),
(73, 'Paria', 'Pereira', 30, 'ONU', 'Praia'),
(19, 'Sodrigo', 'Joze', 25, 'Mauá', 'ABC'),
(14, 'Wgor', 'Silva', 50, 'Ribeirão', 'Leste'),
(3, 'Zelipe', 'José', 40, 'Santo André', 'Norte'),
(37, 'Naria', 'Pereira', 30, 'ONU', 'Praia'),
(38, 'Rick', 'Felipo', 18, 'Mauá', 'ABC');

-- Selecionar ordenando por ordem alfabética (o padrão é ascendente):

SELECT Nome, Cidade
FROM CadPessoas
ORDER BY Cidade, Nome;

-- Selecionar ordenando por ordem alfabética decrescente:

SELECT Nome, Cidade
FROM CadPessoas
ORDER BY Cidade, Nome DESC;

-- Selecionar registros utilizando uma condição (WHERE):

SELECT * FROM CadPessoas
WHERE Regiao = 'ABC';

-- Selecionar registros utilizando operadores:

SELECT * FROM CadPessoas
WHERE Idade < 40;

-- Selecionar registros utilizando operadores BETWEEN e AND:

SELECT * FROM CadPessoas
WHERE Idade BETWEEN 18 and 25;

-- Selecionar registros utilizando o operador IN:

SELECT * FROM CadPessoas
WHERE Idade IN (40, 50);

-- Selecionar registros utilizando o operador AND:

SELECT * FROM CadPessoas
WHERE Idade > 40 AND ID < 20;

-- Selecionar registros utilizando o operador OR:

SELECT * FROM CadPessoas
WHERE Idade > 40 OR ID < 20;

-- Selecionar utilizando o operador LIKE pra selecionar tudo que COMEÇA com F:

SELECT * FROM CadPessoas
WHERE Nome LIKE 'F%';

-- Selecionar utilizando o operador LIKE pra selecionar tudo que TERMINA com E:

SELECT * FROM CadPessoas
WHERE Nome LIKE '%E';

-- Selecionar utilizando o operador LIKE pra selecionar tudo que POSSUI a letra R:

SELECT * FROM CadPessoas
WHERE Nome LIKE '%R%';

-- Selecionar utilizando o operador LIKE pra selecionar tudo que COMEÇA com a letra R e TERMINA com a letra O:

SELECT * FROM CadPessoas
WHERE Nome LIKE 'R%O';

-- Mostrar a tabela com os dados atuais:

SELECT * FROM CadPessoas;

-- Selecionar apenas valores distintos:

SELECT DISTINCT Surname
FROM CadPessoas;

-- FUNÇÕES DE AGREGAÇÃO

--- Count:

SELECT COUNT(*) FROM CadPessoas;

SELECT COUNT(*) FROM CadPessoas
WHERE Idade > 40;

--- Valor máximo:

SELECT MAX(Idade) FROM CadPessoas;

--- Valor mínimo:

SELECT MIN(Idade) FROM CadPessoas;

--- Somar variáveis numéricas:

SELECT SUM(Idade) FROM CadPessoas;

--- Calcular a média de variáveis numéricas:

SELECT AVG(Idade) FROM CadPessoas;
