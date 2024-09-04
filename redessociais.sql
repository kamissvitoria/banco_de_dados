create database redes_sociais;
use redes_sociais;

create table usuarios (
id int not null auto_increment primary key,
 nome varchar(255) not null,
email varchar(255) not null,
data_criacao DATE not null
);

create table postagens(
id int not null auto_increment primary key,
texto varchar(255) not null,
data_publicacao date not null,
imagens varchar(45),
usuarios_id int not null,
foreign key (usuarios_id) references usuarios (id)
);

create table comentarios(
id int not null auto_increment primary key,
texto varchar(255)not null,
data_criacao date not null,
usuarios_id int not null,
postagens_id int not null,
foreign key (usuarios_id) references usuarios (id),
foreign key (postagens_id) references postagens (id)
);

create table curtidas(
usuarios_id int not null,
postagens_id int not null,
primary key (usuarios_id, postagens_id),
foreign key (usuarios_id) references usuarios (id),
foreign key (postagens_id) references postagens (id)
);

insert into usuarios (nome, email, data_criacao)
values ('kamilly', 'kamilly@gmail.com', '2011/04/23');


