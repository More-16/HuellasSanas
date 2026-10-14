    USE HuellasSanas;
CREATE TABLE if not exists Mascota (
    idMascota INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(20),
    Especie VARCHAR(20) NOT NULL,
    Raza VARCHAR(40),
    Edad INT NOT NULL,
    Foto BLOB NOT NULL,
    Adopcion BOOLEAN NOT NULL,
    idAdoptante INT,
	FOREIGN KEY (idAdoptante) 
        REFERENCES adoptante(idAdoptante),
    PRIMARY KEY (idMascota)
);
CREATE TABLE if not exists adoptante (
    idAdoptante INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(20) NOT NULL,
    Contrasena INT NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Email VARCHAR(40),
    NumeroTelefono INT NOT NULL,
    PRIMARY KEY (idAdoptante)
);
CREATE TABLE if not exists Veterinario (
    idVeterinario INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(20) NOT NULL,
    Contrasena INT NOT NULL,
    FechaNacimiento DATE NOT NULL,
    FechaContratacion DATE NOT NULL,
    Email VARCHAR(40),
    NumeroTelefono INT NOT NULL,
    PRIMARY KEY (idVeterinario)
);
CREATE TABLE if not exists consulta (
    idConsulta INT AUTO_INCREMENT NOT NULL,
    Fecha DATE NOT NULL,
    hora TIME NOT NULL,
    Razon TEXT,
    Observacion TEXT NOT NULL,
    Tratamiento TEXT NOT NULL,
    idVeterinario INT,
    idMascota INT,
    PRIMARY KEY (idconsulta),
    FOREIGN KEY (idVeterinario)
        REFERENCES Veterinario (idVeterinario),
    FOREIGN KEY (idMascota)
        REFERENCES Mascota (idMascota)
);
CREATE TABLE if not exists Vacuna (
    idVacuna INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    componentes VARCHAR(100),
    objetivo TEXT NOT NULL,
    primary key (idVacuna)
);
CREATE TABLE if not exists Vacunacion (
    idVacunacion INT AUTO_INCREMENT NOT NULL,
    idVacuna int,
    fechaAplicacion DATE NOT NULL,
    proximaDosis DATE,
    dosis VARCHAR(20),
    idMascota INT,
    FOREIGN KEY (idVacuna)
        REFERENCES Vacuna (idVacuna),
    FOREIGN KEY (idMascota)
        REFERENCES Mascota (idMascota),
	primary key(idVacunacion)
);