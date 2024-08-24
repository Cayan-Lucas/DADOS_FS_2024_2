create database clinica;
use clinica;

-- criando tabelas
CREATE TABLE Pacientes (
    paciente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    telefone VARCHAR(15)
);

CREATE TABLE Medicos (
    medico_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Consultas (
    consulta_id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    data_consulta DATE NOT NULL,
    hora_consulta VARCHAR(5) NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(paciente_id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(medico_id)
);

CREATE TABLE Exames (
    exame_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

CREATE TABLE Resultados_Exames (
    resultado_id INT AUTO_INCREMENT PRIMARY KEY,
    consulta_id INT,
    exame_id INT,
    data_exame DATE NOT NULL,
    resultado VARCHAR(255),
    FOREIGN KEY (consulta_id) REFERENCES Consultas(consulta_id),
    FOREIGN KEY (exame_id) REFERENCES Exames(exame_id)
);

CREATE TABLE Receitas (
    receita_id INT AUTO_INCREMENT PRIMARY KEY,
    consulta_id INT,
    medicamento VARCHAR(100) NOT NULL,
    dosagem VARCHAR(50) NOT NULL,
    data_receita DATE NOT NULL,
    FOREIGN KEY (consulta_id) REFERENCES Consultas(consulta_id)
);


### adicionando uma coluna em uma tabela <paciente>

ALTER TABLE Pacientes 
ADD email VARCHAR(20) NOT NULL;

-- teste para varificar se deu certo
-- select * from pacientes;


### adicionando os dados <insert into>
-- atributos que botei como auto-increment, não irei adicionar aqui.
INSERT INTO Pacientes (nome, data_nascimento, sexo, telefone, email)
VALUES
('Cayan Lucas', '2003-11-10', 'Masculino', '8399922221', 'Cayan.@cs.unipe'),
('Vitoria Carla', '2005-11-15', 'Feminina', '8399925221', 'Vitoria.@cs.unipe'),
('Geovanna Mendes', '2003-08-12', 'Feminina', '8399972221', 'Geovanna.@cs.unipe'),
('Patrick', '2004-05-15', 'Masculino', '8399922281', 'Patrick.@cs.unipe');

INSERT INTO Medicos (nome, especialidade, telefone, email)
VALUES
('Erivaldo','cardiologista','8599921236','erivaldo.@gmail'),
('José','Dermatologista','8599921236','José.@gmail'),
('Nivaldo','Oftalmologista','8599921236','Nilvado.@gmail'),
('Daniel','cardiologista','8599921236','Daniel.@gmail');

select * from Pacientes;

INSERT INTO Consultas (paciente_id, medico_id, data_consulta, hora_consulta)
VALUES
(1, 2, '2024-08-25', '09:00'),
(2, 3, '2024-08-26', '10:30'),
(3, 1, '2024-08-27', '14:00'),
(4, 4, '2024-08-28', '15:30');

INSERT INTO Exames (nome, descricao)
VALUES
('Hemograma', 'Exame de sangue completo que avalia as células sanguíneas.'),
('Glicemia', 'Teste que mede a quantidade de glicose no sangue.'),
('Colesterol Total', 'Exame que mede o nível total de colesterol no sangue.'),
('Triglicerídeos', 'Exame que mede o nível de triglicerídeos no sangue.');

INSERT INTO Resultados_Exames (consulta_id, exame_id, data_exame, resultado)
VALUES
(8, 3, '2024-08-20', 'Resultado Normal'),
(7, 4, '2024-08-21', 'Resultado Alterado'),
(5, 2, '2024-08-22', 'Resultado Normal'),
(6, 1, '2024-08-23', 'Resultado Normal');

INSERT INTO Receitas (consulta_id, medicamento, dosagem, data_receita)
VALUES
(7, 'Paracetamol', '500 mg', '2024-08-25'),
(6, 'Ibuprofeno', '200 mg', '2024-08-26'),
(8, 'Amoxicilina', '500 mg', '2024-08-27'),
(5, 'Losartana', '50 mg', '2024-08-28');


### Mostrando o conteudo final de cada tabela


select * from Pacientes;

select * from Medicos;

select * from Consultas;

select * from Exames;

select * from resultados_exames;

select * from receitas;

