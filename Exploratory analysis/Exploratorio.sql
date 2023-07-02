--PROYECTO CALIFICACIONES 
/* 
CREACION DE LA TABLA PRINCIPAL
*/
create table Exams(
	gender character varying, 
	ethnicity character varying,
	parent_level character varying,
	lunch character varying,
	test_preparation character varying, 
	math_score int,
	reading_score int, 
	writing_score int
)
/* visualizamos la tabla */
select * from exams;

/* COMENZAMOS EL ANALISIS EXPLORATORIO */

/* CONTAMOS EL NUMERO DE REGISTROS EN LA TABLA */
select count(*) from exams as Numero_Registros
-- TENEMOS 1000 REGISTROS EN TOTAL

/*NUMERO DE DATOS NULOS POR COLUMNA*/
SELECT COUNT(*)-COUNT(gender) As Gender_null, COUNT(*)-COUNT(ethnicity) As ethnicity_nuññ, COUNT(*)-COUNT(parent_level) As parent_null,
	COUNT(*) - COUNT(lunch) as Lunch_null, COUNT(*) - COUNT(test_preparation) as preparation_null, COUNT(*) - COUNT(math_score) as math_null, 
		COUNT(*) - COUNT(reading_score) as reading_null, COUNT(*)-COUNT(writing_score) as writing_null
FROM exams; 
--NO HAY VALORES NULOS

/* NO EXISTE CLAVE UNICA QUE IDENTIFIQUE A CADA ALUMNO */

/* ANALIZAMOS LA COLUMNA GENERO */
select count(*) from exams where(gender like 'male');
select count(*) from exams where(gender like 'female');
--TENEMOS 508 HOMBRES Y 492 MUJERES, LO CUAL ES CONSISTENTE 

/*ANALIZAMOS LA COLUMNA ETHNICITY*/
--Total de categorias
SELECT DISTINCT ethnicity
FROM exams;
--TENEMOS 5 CATEGORIAS TOTALES: GRUPO A, B, C, D & E
/* contamos el total de alumnos por categoria */
SELECT COUNT(ethnicity) from exams where(ethnicity like 'group A');
--79 ALUMNOS SON DEL GRUPO A
SELECT COUNT(ethnicity) from exams where(ethnicity like 'group B');
--198 ALUMNOS SON DEL GRUPO B
SELECT COUNT(ethnicity) from exams where(ethnicity like 'group C');
--323 SON DEL GRUPO C
SELECT COUNT(ethnicity) from exams where(ethnicity like 'group D');
--257 SON DEL GRUPO D
SELECT COUNT(ethnicity) from exams where(ethnicity like 'group E');
--143 SON DEL GRUPO E

/* ANALISIS DE PARENT_LEVEL */
SELECT DISTINCT parent_level
FROM exams;
--TENEMOS 6 CATEGORIAS TOTALES: "master's degree", "some college", "bachelor's degree", "high school", "associate's degree", "some high school"
SELECT COUNT(parent_level) from exams where(parent_level like 'master_s degree');
--75 ALUMNOS TIENEN PADRES CON MAESTRIA
SELECT COUNT(parent_level) from exams where(parent_level like 'some_college');
--224 ALUMNOS TIENEN PADRES QUE CURSARON LA UNIVERSIDAD, NO TIENEN TITULO
SELECT COUNT(parent_level) from exams where(parent_level like 'bachelor_s degree');
--105 ALUMNOS TIENEN PADRES CON LICENCIATURA TERMINADA
SELECT COUNT(parent_level) from exams where(parent_level like 'high_school');
--215 ALUMNOS TIENEN PADRES CON PREPARATORIA TERMINADA 
SELECT COUNT(parent_level) from exams where(parent_level like 'associate_s degree');
--204 ALUMNOS TIENEN PADRES CON CARRERA TECNICA TERMINADA
SELECT COUNT(parent_level) from exams where(parent_level like 'some_high_school');
--177 ALUMNOS TIENEN PADRES QUE CURSARON LA PREPARATORIA MAS NO LA TERMINARON

/* ANALISIS DE LUNCH */
SELECT DISTINCT lunch
FROM exams;
--TENEMOS DOS CATEGORIAS: FREE/REDUCED Y STANDARD
SELECT COUNT(lunch) FROM exams WHERE(lunch LIKE 'free_reduced');
--340 ALUMNOS RECIBEN APOYOS ALIMENTARIOS PARCIALES O TOTALES
SELECT COUNT(lunch) FROM exams WHERE(lunch LIKE 'standard')
--660 ALUMNOS NO RECIBEN APOYOS ALIMENTARIOS 

/* ANALISIS DE TEST_PREPARATION*/
SELECT DISTINCT test_preparation
FROM exams;
-- TENEMOS DOS CATEGORIAS, NONE Y COMPLETED
SELECT COUNT (test_preparation) FROM exams WHERE(test_preparation LIKE 'none');
--656 ALUMNOS NO ESTUDIARON PREVIAMENTE PARA SUS EXAMENES 
SELECT COUNT (test_preparation) FROM exams WHERE(test_preparation LIKE 'completed');
--344 ALUMNOS ESTUDIARON PARA SU EXAMEN

/*ANALISIS DE CALIFICACIONES*/
--PROMEDIOS DE CADA RAMA
select AVG(math_score) as promedio_mate, AVG(reading_score) as promedio_lectura, 
	AVG(writing_score) as promedio_redacc from exams;
/*
PROMEDIO MATEMATICAS: 67.81
PROMEDIO LECTURA: 70.38
PROMEDIO REDACCIO: 69.14
*/
--DESVIACIONES ESTANDAR:
/*ANALISIS DE CALIFICACIONES*/
select STDDEV(math_score) as DESVEST_mate, STDDEV(reading_score) as DESVEST_lectura, 
	STDDEV(writing_score) as DESVEST_redacc from exams;
/* 
DESVIACION ESTANDAR MATES: 15.25
DESVIACION ESTANDAR LECTURA: 14.1
DESVIACION ESTANDAR REDACCION: 15.02
*/
--VARIANZAS
select VARIANCE(math_score) as VARIANZA_mate, VARIANCE(reading_score) as VARIANZA_lectura, 
	VARIANCE(writing_score) as VARIANZA_redacc from exams;
/*
VARIANZA MATES: 232.56
VARIANZA LECTURA: 199.01
VARIANZA REDACCION: 225.77
*/

--MAXIMA CALIFICACION POR AREA
select MAX(math_score) as MAX_mate, MAX(reading_score) as MAX_lectura, 
	MAX(writing_score) as MAX_redacc from exams;
-- LA CALIFICACION MAXIMA EN CADA AREA ES DE 100

--MINIMA CALIFICACION POR AREA
select MIN(math_score) as MIN_mate, MIN(reading_score) as MIN_lectura, 
	MIN(writing_score) as MIN_redacc from exams;
/*
MINIMO MATEMATICAS: 15
MINIMO LECTURA: 25
MINIMO REDACCION: 15
*/