-- Cantidad de registros de la tabla de vuelos

USE `USAirlineFlights2`;
SELECT COUNT(flightID) FROM Flights ;

-- Retraso promedio de salida y llegada segun el aeropuerto de origen

SELECT Origin,
AVG(ArrDelay),
AVG(DepDelay) FROM Flights
GROUP BY Origin;

-- Retraso promedio de llegada de los vuelos, por meses, años y según el aeropuerto origen

SELECT Origin,
colYear,
colMonth,
AVG(ArrDelay) 
FROM Flights
GROUP BY Origin, colYear, colMonth;

-- Retraso promedio de llegada de los vuelos, por meses, años y según el aeropuerto origen (misma consulta que antes y con el mismo orden). Pero además, ahora quieren que en vez del código del aeropuerto se muestra el nombre de la ciudad

SELECT City,colYear,colMonth,AVG(ArrDelay) FROM Flights
LEFT JOIN USAirports ON Flights.Origin = USAirports.IATA
GROUP BY City, colYear, colMonth;

-- Las compañías con más vuelos cancelados, por meses y año. Además, deben estar ordenadas de forma que las compañías con más cancelaciones aparezcan las primeras.

select uniquecarrier,colYear,colMonth, avg (ArrDelay), sum(cancelled) as cancelaciones from flights
group by uniquecarrier,colyear,colmonth
order by cancelaciones DESC;

-- El identificador de los 10 aviones que más distancia han recorrido haciendo vuelos.

select tailnum, sum(distance) as distancia from flights 
group by tailnum
order by distancia DESC;

-- Compañías con su retraso promedio sólo de aquellas las que sus vuelos llegan a su destino con un retraso promedio mayor de 10 minutos.

select uniquecarrier, avg(ArrDelay) from flights 
group by uniquecarrier
having avg(ArrDelay) > 10
order by avg (arrDelay) DESC;

-- selects

select * from flights;
select * from Carriers;
select * from USAirports;