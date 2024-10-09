drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
	id INt not null AUTO_INCREMENT primary key,
	telefone VARCHAR(14),
	nome VARCHAR(30),
	logradouro VARCHAR(30),
	numero DECIMAL(5,0),
	complemento VARCHAR(30),
	bairro VARCHAR(30),
	referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
    id INTEGER not null AUTO_INCREMENT primary key,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
    id INTEGER AUTO_INCREMENT primary key,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade int,
    valor DECIMAL(15 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizzas (id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos (id)
 );
 


INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);


INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

/* select [distinct] <colunas>
from <tabelas>
[where condição]
[group by <coluna>]
[having <condição>]
[order by <coluna>];
*/

select * from clientes;

-- Para lista em ordem alfabetica
select * from clientes order by bairro;

-- Para colocar alguma lista em ordem crescente ou decrescente (asc ou desc)
select * from clientes order by nome desc;

-- Selecionar todos os valores
select * from pizzas;
select id, nome, valor from pizzas;

-- A sequencia das colunas podem ser alteradas
select valor, id, nome from pizzas;

-- Nome da coluna exibido na resposta do comando pode ser alterado com a cláusula AS
select id as codigo, nome, valor as 'Valor R$' from pizzas;

-- operações aritiméticas
select 10 + 3, 10 - 3, 10/ 3, 10 * 3;
select 10+3 as soma, 10 - 3 as subtração, 10/3 as divisao, 10 * 3 as multiplicação;

select *, ((valor*10)/100) + valor as '+10%' from pizzas;
select *, (valor*0.10) + valor as '+10%' from pizzas;
select *, valor*1.1 + valor as '+10%' from pizzas;
select * from pizzas;

-- alterar a tabela de pizzas e adicionar uma coluna chamada cust0
alter table pizzas add column custo decimal(15,2);

-- atualizar a tabela e definir o custo
update pizzas set custo = valor * 0.60;

-- condição where
-- Selecionar as pizzas com o valor maior que R$ 17,00
select * from pizzas where valor > 17;

-- Selecionar as pizzas com o valor maior ou igual que R$ 17,00
select * from pizzas where valor >= 17;

-- Selecionar as pizzas com o valor menor que R$ 17,00
select * from pizzas where valor < 17;

-- Selecionar as pizzas com o valor menor ou igual que R$ 17,00
select * from pizzas where valor <= 17;

-- Selecionar as pizzas com o valor igual a R$ 17,00
select * from pizzas where valor = 17;

-- Selecionar as pizzas com o valor diferente de R$ 17,00
select * from pizzas where valor !=17;
-- ou
select * from pizzas where valor <> 17;

-- Selecionar todas as pizzas com a coluna valor nula;
select * from pizzas where valor <=> null;
-- ou
select * from pizzas where valor is null;

-- Para criar uma expressão lógica utilizam-se os operadores lógicos;
-- E (AND ou &&) OU (OR ou ||) e NÃO(NOT OU !)

-- selecionar todas as pizzas com valores entre $15,00 e $20,00
select * from pizzas where valor > 15 and valor <20;
select * from pizzas where valor between 16 and 19;

-- Selecionar as pizzas com o valores menores ou maiores de R$ 17,00
select * from pizzas where valor < 17 or valor >17;

-- Selecionar as pizzas com o valores não menores ou maiores de R$ 17,00
select * from pizzas where not (valor < 17 or valor >17);

-- Selecionar as pizzas com valores na faixa de R$ 17,00 a $20,00
select * from pizzas where valor >= 17 and valor <=20;
select * from pizzas where valor between 17 and 20;

-- selecionar todas as pizzas com valores fora da faixa entre R$17,00 e R$ 20,00
select * from pizzas where valor < 17 and valor > 20;
select * from pizzas where valor not between 17 and 20;
select * from pizzas where not (valor >=17 or valor <=20);

-- selecionar todas as pizzas com valores iguais a R$15,00 e R$20,00
select * from pizzas where valor = 15 or valor = 20;
select * from pizzas where valor in (15,20);

-- selecionar todas as pizzas com valores diferentes de R$15,00 e R$20,00
select * from pizzas where valor != 15 and valor != 20;
select * from pizzas where valor not in (15,20);

-- selecionar todas as pizzas com valor não nulo;
select * from pizzas where valor is not null;
select * from pizzas where valor > 0;

-- selecionar todas as pizzas que começam com a letra E;
select * from pizzas where nome like 'e%';

-- selecionar todas as pizzas que terminam com a letra A;
select * from pizzas where nome like '%a';

-- selecionar todas as pizzas que tenham as letras "ESA";
select * from pizzas where nome like '%esa%';

-- Cláusula ORDER BY
-- order by <colyna 1> [asc/desc], <coluna n> [asc/desc];

-- Listar todas as colunas da tabela pizza em ordem alfabética
select * from pizzas order by nome asc;

-- Listar todas as colunas da tabela pizza em ordem decrescente
select * from pizzas order by nome desc;

-- Listar o nome e o valor da tabela pizza respectivamente em ordem alfabetica e decrescente;
select * from pizzas order by valor desc, nome asc;

-- restringir o número de linhas retornadas pelo comando select;
select * from pizzas limit 2;

-- distinct é para valores distintos
-- order by é para colocar em ordem crescente ou decrescente

select distinct valor from pizzas order by valor;

-- questão 1.
SELECT * FROM pedidos LEFT JOIN clientes ON pedidos.cliente_id = clientes.id;
select * from pedidos;


-- questão 2.
select nome, telefone, count(pedidos.id) from clientes
left join pedidos on clientes.id = pedidos.cliente_id;

-- Questão 3.
select nome, pedidos.id from pedidos
 left join clientes on pedidos.cliente_id = clientes.id 
 where data >= 2016-12-15;
 
 select pedidos.id as pedido, pedidos.data, clientes.nome from pedidos 
 inner join clientes on pedidos.cliente_id = clientes.id
 where pedidos.data > '2016-12-15 23:59:59';

 
 -- Questão 4.
select nome, count(cliente_id) from clientes
inner join pedidos on pedidos.cliente_id = clientes.id
where nome = 'Alexandre Santos'
group by nome;


-- Questão 5.
select * from pedidos left join clientes on pedidos.cliente_id = clientes.id;

-- Questão 6.
select sum(valor) from itens_pedido;

-- Questão 7;
select cliente_id as cliente, sum(valor) as 'valor pedido' from pedidos group by cliente_id;

 
 -- Questão 8.
 select clientes.nome, pedidos.id as pedido, pedidos.data, pedidos.valor from clientes
 inner join pedidos on pedidos.cliente_id = clientes.id
 where pedidos.data between '2016-12-01' and '2016-12-31 23:59:59';
 
 -- Questão 9
 select avg(valor) as media from pedidos;
 
 -- Questão 10.
select clientes.id, clientes.nome, sum(pedidos.valor) as valor_total,
count(pedidos.id) as total_pedidos from pedidos
left join clientes on clientes.id = pedidos.cliente_id
group by clientes.id, clientes.nome;

-- Questão 11
select max(valor) as 'maior valor' from pedidos;

-- Questão 12
select min(valor) as 'menor valor' from pedidos;

-- Questão 13



-- Questão 15.
Select count(distinct pedido_id) as total_pedidos, avg(quantidade) as media_pizzas from itens_pedido;

-- Questão 16.
select sum(quantidade) as total_pizzas, count(pedidos.id) as total_pedido from itens_pedido 
inner join pedidos on itens_pedido.pedido_id = pedidos.id
inner join clientes on pedidos.cliente_id = clientes.id
where clientes.nome = 'Bruna Dantas';
