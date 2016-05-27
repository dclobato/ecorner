
Start transaction;
Create Database bdecorner;
Commit;

Use bdecorner;

Start Transaction;

Create Table Localizacao
(
	Localizacao_ID int auto_increment,
	Localizacao_Pais varchar(30),
	Localizacao_Estado varchar(30),
	Localizacao_Cidade varchar(30),
	Localizacao_Bairro varchar(30),
	Localizacao_Logradouro varchar(30),
	Localizacao_Numero varchar(30),
	Localizacao_Descricao varchar(100),
	primary key(Localizacao_ID)
);

Create Table Estacao
(
	Estacao_ID varchar(30) not null,
	Estacao_Observacao varchar(30),
	Estacao_Localizacao integer not null,
	primary key(Estacao_ID),
	foreign key(Estacao_Localizacao) references Localizacao(Localizacao_ID)
);

Create Table Usuario
(
	Usuario_ID varchar(30) not null,
	Usuario_Senha varchar(30) not null,
	Usuario_Nome varchar(50) not null,
	Usuario_DataNascimento date not null,
	Usuario_Sexo varchar(30) not null,
	Usuario_Email varchar(30),
	Usuario_UltimoLocal varchar(30),
	Usuario_Lar integer,
	primary key(Usuario_ID),
	foreign key (Usuario_UltimoLocal) references Estacao(Estacao_ID),
	foreign key (Usuario_Lar) references Localizacao(Localizacao_ID)
);

Create Table Dependente
(
	Dependente_ID varchar(30) not null,
	Dependente_Usuario varchar(30) not null,
	Dependente_Senha varchar(30) not null,
	Dependente_Nome varchar(50) not null,
	Dependente_DataNascimento date not null,
	Dependente_Sexo varchar(30) not null,
	Dependente_Email varchar(30),
	Dependente_UltimoLocal varchar(30),
	primary key(Dependente_ID,Dependente_Usuario),
	foreign key(Dependente_Usuario)references Usuario(Usuario_ID)
);

Create Table Telefone
(
	Telefone_Usuario varchar(30) not null,
	Telefone_Numero varchar(30) not null,
	Telefone_Descricao varchar(30) not null,
	Primary Key(Telefone_Usuario,Telefone_Numero),
	Foreign key(Telefone_Usuario) references Usuario(Usuario_ID)
);

Create Table Passeio
(
	Passeio_ID int auto_increment,
	Passeio_Status varchar(30) not null,
	Passeio_HoraRegistro datetime not null,
	Passeio_Usuario varchar(30) not null,
	Passeio_Comentario varchar(100),
	primary key(Passeio_ID),
	foreign key(Passeio_Usuario)references Usuario(Usuario_ID)
);

Create Table Trecho
(
	Trecho_Estacao varchar(30) not null,
	Trecho_HoraChegada time not null,
	Trecho_HoraPartida time not null,
	Trecho_Passeio integer not null,
	primary key(Trecho_HoraChegada,Trecho_Passeio),
	foreign key(Trecho_Passeio) references Passeio(Passeio_ID),
	foreign key(Trecho_Estacao)references Estacao(Estacao_ID)
);

Create Table Favorito
(
	Favorito_Localizacao integer not null,
	Favorito_Usuario varchar(30) not null,
	Favorito_DataInclusao date,
	Favorito_Comentario varchar(100),
	primary key(Favorito_Localizacao,Favorito_Usuario),
	foreign key(Favorito_Usuario)references Usuario(Usuario_ID),
	foreign key(Favorito_Localizacao)references Localizacao(Localizacao_ID)
);

Create Table Ocorrencia
(
	Ocorrencia_ID integer auto_increment,
	Ocorrencia_Descricao varchar(30) not null,
	Ocorrencia_TipoOcorrencia integer not null,
	Ocorrencia_Confirmacao integer not null,
	Ocorrencia_HoraInclusao datetime not null,
	Ocorrencia_HoraFinalizacao datetime,
	Ocorrencia_Localizacao integer not null,
	primary key(Ocorrencia_ID),
	foreign key(Ocorrencia_Localizacao)references Localizacao(Localizacao_ID)
);


Commit;
