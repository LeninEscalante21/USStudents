--CREACION DE VARIABLES EXTRAS QUE PUEDEN SERVIRNOS DE AYUDA

--1 PROMEDIO GENERAL POR ALUMNO A DOS DECIMALES DE PRECISION
SELECT math_score, reading_score, writing_score, ROUND((math_score+reading_score+writing_score)/(3.0),2) as promedio_total
FROM exams;
--du´plicamos la tabla exams
CREATE TABLE exams_modificable AS SELECT * FROM exams;
--AÑADIMOS LA VARIABLE DE PROMEDIO GENERAL POR ALUMNO
ALTER TABLE exams_modificable 
ADD avg_score float;
UPDATE exams_modificable
set avg_score =  ROUND((math_score+reading_score+writing_score)/(3.0),2);
select * from exams_modificable

CREATE TABLE ABT AS 
	SELECT *,
	CASE WHEN (avg_score >= 75) THEN 1 else 0
    END AS target
FROM exams_modificable;

SELECT * FROM ABT