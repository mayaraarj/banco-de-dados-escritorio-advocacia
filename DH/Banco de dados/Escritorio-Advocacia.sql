#Trata-se de banco de dados de cadastro de advogados, clientes e processos em um escritorio de advocacia.

CREATE DATABASE Escritorio_Advocacia;
USE Escritorio_Advocacia;


CREATE TABLE Especialidade_Advogado (
idEspecialidade_Advogado INT NOT NULL,
PRIMARY KEY (idEspecialidade_Advogado)
);

CREATE TABLE Advogados (
Advogado_id INT NOT NULL AUTO_INCREMENT,
Advogado_nome VARCHAR(45),
Advogado_sobrenome VARCHAR(45),
Advogado_OAB VARCHAR(45),
Advogado_Especialidade INT,
Advogado_telefone INT,
Advogado_email VARCHAR(45),
PRIMARY KEY (Advogado_id),
FOREIGN KEY (Advogado_Especialidade) REFERENCES Especialidade_Advogado(idEspecialidade_Advogado)
);

CREATE TABLE Clientes (
Cliente_id INT NOT NULL AUTO_INCREMENT,
Cliente_nome VARCHAR(45),
Cliente_sobrenome VARCHAR(45),
Cliente_telefone INT,
Cliente_email VARCHAR(45),
PRIMARY KEY (Cliente_id)
);

CREATE TABLE Processos (
Processo_id INT,
Advogado_id INT,
Cliente_id INT,
PRIMARY KEY (Processo_id),
FOREIGN KEY (Advogado_id) REFERENCES Advogados(Advogado_id)
); 

USE Escritorio_Advocacia;

ALTER TABLE Processos
ADD  FOREIGN KEY (Cliente_id) REFERENCES Clientes (Cliente_id);

ALTER TABLE Especialidade_Advogado
ADD Nome_Especialidade VARCHAR(45);

INSERT INTO Especialidade_Advogado (idEspecialidade_Advogado,Nome_Especialidade)
VALUES ('3','Tibutario');

INSERT INTO Advogados (Advogado_nome, Advogado_sobrenome , Advogado_OAB , Advogado_Especialidade , Advogado_telefone , Advogado_email )
VALUES ('Fulano','DeTal','135768 MA','3','876590753','fulanodetal@gmail.com');

SELECT *
FROM Advogados;

UPDATE Advogados SET Advogado_email = 'fulanodetal@hotmail.com'
WHERE Advogado_id = '1';

SELECT *
FROM Advogados;

INSERT INTO Clientes (Cliente_nome, Cliente_sobrenome, Cliente_email)
VALUES ('Maria','Da Paz','dapazmaria@gmail.com');

SELECT *
FROM Clientes;

DELETE FROM Clientes
WHERE Cliente_id='1';

SELECT *
FROM Clientes;

SELECT Nome_Especialidade
FROM Especialidade_Advogado;