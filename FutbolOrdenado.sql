create database if not exists FutbolJDRY;
use FutbolJDRY;
-- Tablas.
CREATE TABLE Estadios (
    IdEstadio INT PRIMARY KEY AUTO_INCREMENT,
    NombreEstadio VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(100),
    Capacidad INT,
    Direccion VARCHAR(255),
    Superficie VARCHAR(50)  -- Por ejemplo, "césped natural", "césped artificial", etc.
);

CREATE TABLE Equipos (
    IdEquipo INT PRIMARY KEY AUTO_INCREMENT,
    NombreEquipo VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(100),
    Liga VARCHAR(100) NOT NULL,
    IdEstadio INT,
    FOREIGN KEY (IdEstadio) REFERENCES Estadios(IdEstadio)
);

CREATE TABLE Arbitros (
    IdArbitro INT PRIMARY KEY AUTO_INCREMENT,
    NombreArbitro VARCHAR(100),
    ApellidoArbitro VARCHAR(100),
    Nacionalidad VARCHAR(50) NOT NULL
);

CREATE TABLE Jugadores (
    IdJugador INT PRIMARY KEY AUTO_INCREMENT,
    NombreJugador VARCHAR(100) NOT NULL,
    ApellidoJugador VARCHAR(100) NOT NULL,
    FechaNacimiento DATE,
    Posicion VARCHAR(50),
    IdEquipo INT,
    FOREIGN KEY (IdEquipo) REFERENCES Equipos(IdEquipo)
);

CREATE TABLE Plantillas (
    IdPlantilla INT PRIMARY KEY AUTO_INCREMENT,
    IdEquipo INT,
    IdJugador INT,
    Temporada VARCHAR(20),
    FOREIGN KEY (IdEquipo) REFERENCES Equipos(IdEquipo),
    FOREIGN KEY (IdJugador) REFERENCES Jugadores(IdJugador)
);

CREATE TABLE Torneos (
    IdTorneo INT PRIMARY KEY AUTO_INCREMENT,
    NombreTorneo VARCHAR(100) NOT NULL,
    Temporada VARCHAR(20),  -- Ejemplo: "2023/2024"
    Pais VARCHAR(50),       -- País donde se realiza el torneo
    TipoTorneo VARCHAR(50)  -- Ejemplo: "Liga", "Copa", "Amistoso", etc.
);

CREATE TABLE Partidos (
    IdPartido INT PRIMARY KEY AUTO_INCREMENT,
    IdEstadio INT,
    IdEquipoLocal INT,
    IdEquipoVisitante INT,
    IdTorneo INT,   -- Nueva columna para la referencia al torneo
	FechaPartido DATETIME NOT NULL,
    IdArbitro INT,
    Resultado VARCHAR(10),
    FOREIGN KEY (IdEstadio) REFERENCES Estadios(IdEstadio),
    FOREIGN KEY (IdEquipoLocal) REFERENCES Equipos(IdEquipo),
    FOREIGN KEY (IdEquipoVisitante) REFERENCES Equipos(IdEquipo),
    FOREIGN KEY (IdTorneo) REFERENCES Torneos(IdTorneo),  -- Relación con Torneos
    FOREIGN KEY (IdArbitro) REFERENCES Arbitros(IdArbitro)
);
