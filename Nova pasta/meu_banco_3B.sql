CREATE DATABASE kart_gt_bd;
USE kart_gt_bd;

CREATE TABLE bacterias(
id_bateria INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
valor DECIMAL (8,2) NOT NULL,
duracao_minutos INT NOT NULL
);

CREATE TABLE  pilotos(
id_piloto INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (100) NOT NULL,
cpf VARCHAR (14) UNIQUE NOT NULL,
telefone VARCHAR (20),
data_nascimento DATE NOT NULL
);

CREATE TABLE karts(
id_kart INT AUTO_INCREMENT PRIMARY KEY,
numero INT NOT NULL UNIQUE,
categoria VARCHAR(50) NOT NULL,
potencia_hp VARCHAR(20)
);
CREATE TABLE reservas(
id_reserva INT AUTO_INCREMENT PRIMARY KEY,
id_piloto INT NOT NULL,
id_bateria INT NOT NULL,
id_kart INT,
data_corrida DATE DEFAULT (CURRENT_DATE),
status VARCHAR(20) DEFAULT 'confirmada',
FOREIGN KEY (id_piloto) REFERENCES pilotos(id_piloto),
FOREIGN KEY (id_bateria) REFERENCES baterias(id_bateria),
FOREIGN KEY (id_kart) REFERENCES karts(id_kart)
);

INSERT INTO baterias (nome, valor, duracao_minutos) VALUES
('treino livre', 99.90, 15),
('sprint Race', 149.90, 25),
('Grand Prinx GP', 199.90, 40);

INSERT INTO karts(numero, categoria, potencia_hp) VALUES
(12, 'Rental Padrao', '6.5 HP'),
(27, 'Rental Padrao', '6.5 HP'),
(44, 'Profissional 2T', '13 HP');

INSERT INTO karts(numero, categoria, potencia_hp) VALUES
('Lucas Mendes', '111.333.444-77' , '44-6666-8888' , '1987-09-12'),
('Mariana Lima' , '222.444.888.11' , '41-5555-9999' , '1999-10-21'),
('Juliana ferreira' , '333.222.666.99' , '41-3333-7777' , '1996-05-10');

INSERT INTO reservas (id_pilotos, id_bateria, id_kart) VALUES
(1,2,3),
(2,3,1),
(3,2,1);