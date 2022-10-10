\c dres0
DROP DATABASE peliculas; --eliminar la base de datos "peliculas"
CREATE DATABASE peliculas; -- crear la base de datos "peliculas"
\c peliculas

CREATE TABLE peliculas( --creamos la tabla "peliculas" con los parametros adjuntos
    id SERIAL, 
    pelicula VARCHAR(70),
    agnoEstreno SMALLINT,
    director VARCHAR(30),
    PRIMARY KEY(id)
);
\copy peliculas FROM 'peliculas.csv' csv header; --copio la data del csv pelicular incluyendo cabezeras

CREATE TABLE reparto(
    peliculasId INT,
    actores VARCHAR(40),
    FOREIGN KEY(peliculasId) REFERENCES peliculas(id) --relacionamos la tabla reparto con la tabla pelicula a traves de los campos id y peliculasId
);
\copy reparto FROM 'reparto.csv' csv;

SELECT COUNT(id) AS nro_peliculas FROM peliculas;
SELECT COUNT(peliculasId) AS nro_reparto FROM reparto;

-- Obtener el ID de la película “Titanic”.
SELECT id FROM peliculas WHERE pelicula = 'Titanic';

-- Listar a todos los actores que aparecen en la película "Titanic"
SELECT actores FROM reparto WHERE peliculasId = 2;

-- Consultar en cuántas películas del top 100 participa Harrison Ford
SELECT COUNT(actores) AS HarrisonFord FROM reparto WHERE actores = 'Harrison Ford';

-- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente
SELECT pelicula, agnoEstreno FROM peliculas WHERE agnoEstreno BETWEEN 1990 AND 1999 ORDER BY pelicula ASC;

-- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;

-- Consultar cual es la longitud más grande entre todos los títulos de las películas
SELECT LENGTH(pelicula) AS longitud_titulo FROM peliculas ORDER BY LENGTH(pelicula) DESC LIMIT 1;