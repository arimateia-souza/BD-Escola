create database escola;

use escola;
####Criação de tabelas####

create table aluno(
	nome_aluno varchar (255) not null,
	cpf_aluno char (11) not null unique,
	sexo_aluno enum ('f', 'm') not null,
	dataNas_aluno date not null,
	telefoneCel_aluno varchar(11) not null,
	telefoneFix_aluno varchar(8),
	logradouro_aluno varchar(255) not null,
	bairro_aluno varchar(255) not null,
	estado_aluno char(2) not null,
primary key (cpf_aluno)
);
describe aluno;

create table professor (
	nome_professor varchar (255) not null,
	cpf_professor char (11) not null unique,
	sexo_professor enum ('f', 'm') not null,
	telefoneCel_prof varchar(11) not null,
	telefoneFix_prof varchar(8),
primary key (cpf_professor)
);
describe professor;

create table curso (
cod_curso int auto_increment not null,
nome_curso varchar(255) not null,
valor_curso decimal(10,2) not null,
primary key (cod_curso)
);
describe curso;

create table CursoAluno (
cpf_aluno char(11) not null,
cod_curso int not null,
nota_aluno float,
primary key (cpf_aluno, cod_curso),
foreign key (cpf_aluno) references aluno (cpf_aluno),
foreign key (cod_curso) references curso (cod_curso)
);
describe CursoAluno;

create table ProfessorEnsina (
cpf_professor char(11) not null, #1:N
cod_curso int not null,
primary key (cpf_professor, cod_curso),
foreign key (cpf_professor) references professor (cpf_professor),
foreign key (cod_curso) references curso (cod_curso)
);
describe ProfessorEnsina;

#####Inserção na tabela ALUNOS#####
insert into aluno values
('João', '11111111111', 'm', '2000-06-08', '84555574888', '77777777', 'pajuçara', 'santo antonio', 'RJ'  ),
('Guilhermino', '12345678945', 'm', '1995-08-15', '96852123475', '78945612', 'sao camilo', 'los angeles', 'PB' )
;
insert into aluno (nome_aluno, cpf_aluno, sexo_aluno, dataNas_aluno, telefoneCel_aluno, logradouro_aluno, bairro_aluno, estado_aluno)
values 
('Antonieta', '95546547858', 'f', '2002-12-18', '78559871547', 'esmeralda','macaiba', 'RN' ),
('Joaquina', '66655544478', 'f', '1988-01-13', '19157897844', 'av. olavo lacerda', 'parnamirim', 'RN' ),
('Maria antonieta', '12565588874', 'f', '2000-04-13', '84969875938', 'sao camilo', 'los angeles', 'PB');

#####Inserção na tabela PROFESSOR#####

insert into professor values
('Josean', '50505050505', 'm', '84998877425', '88554499');
insert into professor (nome_professor, cpf_professor, sexo_professor, telefoneCel_prof) values
('Josefina Farias', '40404040404','f','84965782475'),
('Calos Andre', '99855566575', 'm','81594463984'),
('Geovanna', '85632147520', 'f', '66985472155');

#####Inserção na tabela CURSO#####
insert into curso (nome_curso, valor_curso) values
('Ingles', 179.97),
('Espanhol', 189.97),
('Italiano', 259.88),
('Francês', 594.80),
('Russo', 629.40);

#####Inserção na tabela CURSOALUNO#####
####AS NOTAS DOS ALUNOS SÃO IGUAIS AS DO ENEM####
insert into cursoaluno  values
('11111111111', 1, 594.6),
('12565588874', 4, 847.2),
('95546547858', 1, 364.9),
('11111111111', 4, 762.4);
insert into cursoaluno (cpf_aluno, cod_curso) values
('12345678945', 2),
('66655544478', 2);

#####Inserção na tabela PROFESSORENSINA#####
insert into professorensina values
('40404040404', 1),
('50505050505', 2),
('85632147520', 4),
('85632147520', 3),
('99855566575', 5);

#####VISUALIZAR O QUE TEM CADASTRADO EM CADA TABELA#####
select * from aluno;
select * from professor;
select * from curso;
select * from cursoaluno;
select * from professorensina;

#####VISUALIZAR O QUE TEM RELACIONAMENTO DAS TABELAS (SABER O QUE CADA PROFESSOR ENSINA)#####

select nome_professor as 'Professor', nome_curso as 'Ensina' from professor, curso, professorensina
where curso.cod_curso = professorensina.cod_curso
and professorensina.cpf_professor = professor.cpf_professor;



#####VISUALIZAR O QUE TEM RELACIONAMENTO DAS TABELAS (SABER O QUE CADA ALUNO ESTUDA)#####
select nome_aluno as 'Discente', nome_curso 'Curso'
from aluno, curso, cursoaluno
where aluno.cpf_aluno = cursoaluno.cpf_aluno and curso.cod_curso = cursoaluno.cod_curso;


#####VISUALIZAR O QUE TEM RELACIONAMENTO DAS TABELAS (SABER APENAS QUEM ESTUDA UM CURSO + NOTA)#####

###Curso de ingles

select nome_aluno as 'Discente', nome_curso 'Curso', nota_aluno as 'Média'
from aluno, curso, cursoaluno
where aluno.cpf_aluno = cursoaluno.cpf_aluno
and curso.cod_curso = cursoaluno.cod_curso
and curso.cod_curso = 1; 
###Curso de Espanhol

select nome_aluno as 'Discente', nome_curso 'Curso', nota_aluno as 'Média'
from aluno, curso, cursoaluno
where aluno.cpf_aluno = cursoaluno.cpf_aluno
and curso.cod_curso = cursoaluno.cod_curso
and curso.cod_curso = 2; 
###Curso de Italiano

select nome_aluno as 'Discente', nome_curso 'Curso', nota_aluno as 'Média'
from aluno, curso, cursoaluno
where aluno.cpf_aluno = cursoaluno.cpf_aluno
and curso.cod_curso = cursoaluno.cod_curso
and curso.cod_curso = 3;
###Curso de Francês

select nome_aluno as 'Discente', nome_curso 'Curso', nota_aluno as 'Média'
from aluno, curso, cursoaluno
where aluno.cpf_aluno = cursoaluno.cpf_aluno
and curso.cod_curso = cursoaluno.cod_curso
and curso.cod_curso = 4;
###Curso de Russo
select nome_aluno as 'Discente', nome_curso 'Curso', nota_aluno as 'Média'
from aluno, curso, cursoaluno
where aluno.cpf_aluno = cursoaluno.cpf_aluno
and curso.cod_curso = cursoaluno.cod_curso
and curso.cod_curso = 5;



#####VISUALIZAR O QUE TEM RELACIONAMENTO DAS TABELAS (SABER ESTADO DE CADA ESTUDANTE)#####
###essa tabela se relaciona consigo mesma###
select nome_aluno as 'Discente', estado_aluno as 'UF'
from aluno
where estado_aluno = 'RN';
###Pra ver os outros estados é só mudar RN pra o estado que quer###

use escola;
#####VIEWS#####

####View para aluno####
create view v_aluno as 
select
	nome_aluno as 'Aluno',
	nome_curso as 'Curso', 
    nota_aluno as 'Nota',
    valor_curso as 'Mensalidade',
    nome_professor as 'Professor'
from curso
inner join cursoaluno
inner join professor
inner join professorensina
inner join aluno
where aluno.cpf_aluno = cursoaluno.cpf_aluno
and curso.cod_curso = cursoaluno.cod_curso
and curso.cod_curso = professorensina.cod_curso
and professorensina.cpf_professor = professor.cpf_professor
;

select * from v_aluno;

###Simulação do aluno acessando para ver as informaçoes###
select * from v_aluno
where aluno = 'Joao';
###########################################################

####View para professor####

create view v_professor as 
select
	nome_professor as 'Professor',
    nome_curso as 'Curso',
    nome_aluno as 'Discente',
    nota_aluno as 'Nota'
from professor, curso, aluno, professorensina, cursoaluno

where curso.cod_curso = professorensina.cod_curso
and professorensina.cpf_professor = professor.cpf_professor
and aluno.cpf_aluno = cursoaluno.cpf_aluno
and curso.cod_curso = cursoaluno.cod_curso;


select * from v_professor;

select * from v_professor
where professor = 'Josean';
#############################################################
####View para direção####
############################################################

####stored procedure####
delimiter $$
create procedure sp_valores (codCurso int)
begin
	select nome_curso as 'Curso', valor_curso as 'Valor'
    from curso
    where cod_curso = codCurso;
end$$
delimiter ;
call sp_valores(1);

####stored function####
SET GLOBAL log_bin_trust_function_creators = 1;
####Estava dando um erro que me deixou mais de 2 horas preso tive que fazer o comando acima####

delimiter $$
create function fn_situaçao_aluno(
nota float
)returns varchar(255)
begin
	declare media varchar(255);
    set media = case
		when nota <= 499.9 then ('Abaixo da média')
        when nota < 600.0 and nota >= 500.0 then ('Na media')
        when nota >= 600.0 then ('Acima da média')
	end;
    return media; 
end $$
delimiter ;

use escola;

select nome_aluno 'Aluno', nome_curso as 'Curso', fn_situaçao_aluno(nota_aluno) as 'Média'
from cursoaluno inner join aluno using (cpf_aluno)
inner join curso
where aluno.cpf_aluno = cursoaluno.cpf_aluno
and curso.cod_curso = cursoaluno.cod_curso;

####stored trigger####
DELIMITER $$

create trigger tgr_professor_ensina_insert after insert
ON professor
for each row
begin
	update professorensina SET cpf_professor = NEW.cpf_professor
where professorensina.cpf_professor = null; 
end$$

DELIMITER ;
insert into professor values
('Tiago', '50505050204', 'm', 8452562115, null);

insert into curso (nome_curso, valor_curso) values
('Sérvio', 597.97),
('Alemão', 758.00);

select * from professor;
select * from professorensina;
select * from curso;
















