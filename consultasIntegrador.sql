-- Active: 1689649775463@@127.0.0.1@3306@nba


/* CANDADO A */
/* Posición: El candado A está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
Teniendo el máximo de asistencias por partido, muestre cuantas veces se logró dicho máximo.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)
Clave: La clave del candado A estará con formada por la/s siguientes consulta/s a la base de 
datos:
Muestre la suma total del peso de los jugadores, donde la conferencia sea Este y la posición sea 
centro o esté comprendida en otras posiciones */

SELECT MAX(Asistencias_por_partido) FROM estadisticas;

/* 2 */
SELECT COUNT(Asistencias_por_partido) FROM estadisticas WHERE Asistencias_por_partido =(SELECT MAX(Asistencias_por_partido) FROM estadisticas);

/* CLAVEEEEE AAAAAAAAAAAAAAAAAAAAAA 14043 */
SELECT SUM(j.Peso) FROM jugadores j JOIN equipos e ON e.Nombre = j.Nombre_equipo WHERE j.Posicion LIKE "%c%" AND e.Conferencia LIKE "%east%"; 


/* CANDADO B
Posición: El candado B está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
Muestre la cantidad de jugadores que poseen más asistencias por partidos, que el numero de 
jugadores que tiene el equipo Heat. 
Este resultado nos dará la posición del candado (1, 2, 3 o 4)
Clave: La clave del candado B estará con formada por la/s siguientes consulta/s a la base de 
datos:
La clave será igual al conteo de partidos jugados durante las temporadas del año 1999 */
SELECT COUNT(j.Nombre)FROM jugadores j WHERE j.Nombre_equipo LIKE "%heat%";
/* 3 posicion */
SELECT COUNT(j.Nombre) FROM jugadores j JOIN estadisticas e ON j.codigo = e.jugador WHERE e.Asistencias_por_partido > (SELECT COUNT(j.Nombre)FROM jugadores j WHERE j.Nombre_equipo LIKE "%heat%") ;

/* 3480 clave */
SELECT COUNT(codigo) FROM partidos WHERE temporada LIKE '%99%';

/* CANDADO C
Posición: El candado C está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
La posición del código será igual a la cantidad de jugadores que proceden de Michigan y forman 
parte de equipos de la conferencia oeste. 
Al resultado obtenido lo dividiremos por la cantidad de jugadores cuyo peso es mayor o igual a 
195, y a eso le vamos a sumar 0.9945.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)
Clave: La clave del candado B estará con formada por la/s siguientes consulta/s a la base de 
datos:
Para obtener el siguiente código deberás redondear hacia abajo el resultado que se devuelve de 
sumar: el promedio de puntos por partido, el conteo de asistencias por partido, y la suma de 
tapones por partido. Además, este resultado debe ser, donde la división sea central */

/* 1 */
SELECT * FROM jugadores WHERE `Procedencia` LIKE "%michigan%"; 

SELECT COUNT(j.Nombre) FROM jugadores j JOIN equipos e ON e.Nombre = j.Nombre_equipo 
    WHERE j.Procedencia LIKE "%michigan%" AND e.Conferencia LIKE "west";

SELECT COUNT(Nombre) FROM jugadores WHERE `Peso` >= 195;

SELECT (4/COUNT(Nombre)) + 0.9945 FROM jugadores WHERE Peso >= 195;

/* claveeeeeeeeeeeeeeeeeeee 631 */
/* consulta todo en uno */
SELECT AVG(Puntos_por_partido)+ COUNT(Asistencias_por_partido) + SUM(Tapones_por_partido) AS "Suma Completa" FROM estadisticas e JOIN jugadores j ON j.codigo = e.jugador JOIN equipos eq ON j.Nombre_equipo = eq.Nombre WHERE eq.Division LIKE "%central%";


SELECT AVG(Puntos_por_partido) FROM estadisticas e JOIN jugadores j ON j.codigo = e.jugador JOIN equipos eq ON j.Nombre_equipo = eq.Nombre WHERE eq.Division LIKE "%central%";
/* 9 + 384 + 237 = 631 */
SELECT COUNT(Asistencias_por_partido) FROM estadisticas e JOIN jugadores j ON j.codigo = e.jugador JOIN equipos eq ON j.Nombre_equipo = eq.Nombre WHERE eq.Division LIKE "%central%"; 

SELECT SUM(`Tapones_por_partido`) FROM estadisticas e JOIN jugadores j ON j.codigo = e.jugador JOIN equipos eq ON j.Nombre_equipo = eq.Nombre WHERE eq.Division LIKE "%central%";


/* CANDADO D */
/* Posición: El candado D está ubicado en la posición calculada a partir del número obtenido en la/s 
siguiente/s consulta/s: 
Muestre los tapones por partido del jugador Corey Maggette durante la temporada 00/01. Este 
resultado debe ser redondeado. Nota: el resultado debe estar redondeado
Este resultado nos dará la posición del candado (1, 2, 3 o 4)
 
Clave: La clave del candado D estará con formada por la/s siguientes consulta/s a la base de 
datos: 
Para obtener el siguiente código deberás redondear hacia abajo, la suma de puntos por partido 
de todos los jugadores de procedencia argentina */

/* Posicion 4 */
SELECT ROUND(SUM(Tapones_por_partido)) FROM estadisticas e JOIN jugadores j ON j.codigo = e.jugador WHERE j.Nombre LIKE "Corey Maggette" AND e.temporada LIKE "00/01";
/* Clave candado D 191 */
SELECT ROUND(SUM(Puntos_por_partido)) FROM estadisticas e JOIN jugadores j ON j.codigo = e.jugador WHERE j.Procedencia LIKE "%argentina%" ;
