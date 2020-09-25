
create database hotel;



use hotel;


create table TBCliente(email varchar(100),nome varchar(100),primary key(email),endereco varchar(100));

create table TBTelefone(email varchar(100),telefone int,foreign key(email) references TBCliente(email));

create table TBJuridica(cnpj int,email varchar(100),foreign key (email) references TBCliente(email),primary key (cnpj));

create table TBFisica(cpf int,rg int, sexo varchar(100),email varchar(100),foreign key(email) references TBCliente(email));

create table TBFuncionarios(rg int,cpf int,nome varchar(100),sexo varchar(100),primary key(cpf));

create table TBAlugaJF(email varchar(100), cpf int, foreign key(email) references TBCliente(email),foreign key(cpf) references TBFuncionarios(cpf));

create table TBApartementos(numero_unico int, andar int ,numero_camas int ,preco int,primary key(numero_unico));

create table TBCheckin(hora_entrada varchar(100),hora_saida varchar(100),data_entrada date, data_saida date,reserva int,primary key(reserva),email varchar(100),foreign key(email) references TBCliente(email),numero_unico int,foreign key(numero_unico) references TBApartementos(numero_unico));

create table TBServico(codigo_servico int, tipo varchar(100),descricao varchar(100),valor int, primary key(codigo_servico));

create table TBConsome(reserva int, foreign key(reserva) references TBCheckin(reserva),codigo_servico int,foreign key(codigo_servico) references TBServico(codigo_servico));

insert into TBCliente values('felipe@hotmail.com','felipe','rua das coves');
insert into TBCliente values('marcelo@hotmail.com','marcelo','rua das arvores');
insert into TBCliente values('antonella@hotmail.com','antonella','rua das bosques');
insert into TBCliente values('fiat@hotmail.com','fiat','rua das predios');
insert into TBCliente values('mercedes@hotmail.com','mercedes','rua das escadas');
insert into TBCliente values('boticario@hotmail.com','boticario','rua das escadas');

insert into TBTelefone values('felipe@hotmail.com',992640280);
insert into TBTelefone values('marcelo@hotmail.com',992640281);
insert into TBTelefone values('antonella@hotmail.com',992640282);
insert into TBTelefone values('fiat@hotmail.com',992640283);
insert into TBTelefone values('mercedes@hotmail.com',992640284);
insert into TBTelefone values('boticario@hotmail.com',992640285);

insert into TBJuridica values(908387911,'fiat@hotmail.com');
insert into TBJuridica values(908387912,'mercedes@hotmail.com');
insert into TBJuridica values(908387913,'boticario@hotmail.com');

insert into TBFisica values(98321914,87413124,'masculino','felipe@hotmail.com');
insert into TBFisica values(98321915,87413125,'masculino','marcelo@hotmail.com');
insert into TBFisica values(98321916,87413126,'antonella','antonella@hotmail.com');

insert into TBFuncionarios values(412451,41234,'anjelo','masculino');
insert into TBFuncionarios values(412452,41235,'marcela','feminino');
insert into TBFuncionarios values(412453,41236,'caio','masculino');

insert into TBAlugaJF values('fiat@hotmail.com',41234);
insert into TBAlugaJF values('mercedes@hotmail.com',41235);
insert into TBAlugaJF values('boticario@hotmail.com',41236);

insert into TBApartementos values(20,3,6,1000);
insert into TBApartementos values(21,3,6,1000);
insert into TBApartementos values(22,3,6,1000);
insert into TBApartementos values(23,3,6,1000);
insert into TBApartementos values(24,3,6,1000);
insert into TBApartementos values(25,3,6,1000);

insert into TBCheckin values('12:40','6:40','2020-02-03','2020-03-03',48281,'felipe@hotmail.com',20);
insert into TBCheckin values('10:30','6:10','2020-02-03','2020-03-02',48282,'marcelo@hotmail.com',21);
insert into TBCheckin values('11:20','7:30','2019-06-03','2019-06-03',48283,'antonella@hotmail.com',22);
insert into TBCheckin values('09:10','8:40','2019-07-03','2018-07-04',48284,'fiat@hotmail.com',23);
insert into TBCheckin values('07:50','9:50','2018-08-03','2018-09-05',48285,'mercedes@hotmail.com',24);
insert into TBCheckin values('06:20','5:60','2018-09-03','2018-010-06',48286,'boticario@hotmail.com',25);

insert into TBServico values(5,'limpeza','arrumacao de quarto',50);
insert into TBServico values(6,'lavanderia','passar roupa',40);
insert into TBServico values(7,'piscina','diaria picina',60);
insert into TBServico values(8,'massagem','massagem',50);

insert into TBConsome values(48281,5);
insert into TBConsome values(48282,6);
insert into TBConsome values(48283,7);
insert into TBConsome values(48284,6);
insert into TBConsome values(48285,5);
insert into TBConsome values(48286,5);



SELECT COUNT(email)
FROM  TBCliente;



SELECT COUNT(data_entrada)
FROM TBCheckin
where year(data_entrada) =2020 and month(data_entrada) = 2;



SELECT SUM(preco + valor)
FROM  TBApartementos, TBCheckin, TBConsome ,TBServico
Where Year(data_entrada) = 2019 
	and TBApartementos.numero_unico = TBCheckin.numero_unico 
	and TBConsome.reserva = TBCheckin.reserva
	and	TBConsome.codigo_servico =  TBServico.codigo_servico;

