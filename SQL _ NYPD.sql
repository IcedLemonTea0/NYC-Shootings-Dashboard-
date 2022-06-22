-- CREATE DATABASE
CREATE DATABASE nypd_shootings;
USE nypd_shootings;

-- IMPORT 
SELECT * FROM shootings;
SELECT * FROM population;

------- DATA CLEANING ---------

-- DISTINCT BORO 
SELECT 
	DISTINCT boro 
FROM 
	shootings ;

SELECT
	DISTINCT geography
FROM
	population
ORDER BY 1;

-- UPDATE BOROUGHS 
UPDATE population
SET Geography = 'MANHATTAN'
WHERE geography = 'New York County';

UPDATE population
SET Geography = 'BRONX'
WHERE geography = 'Bronx County';

UPDATE population
SET Geography = 'STATEN ISLAND'
WHERE geography = 'Richmond County';

UPDATE population
SET Geography = 'BROOKLYN'
WHERE geography = 'Kings County';

UPDATE population
SET Geography = 'QUEENS'
WHERE geography = 'Queens County';

---- FILTERING OUT NYC COUNTIES ---- 
DELETE FROM population
WHERE geography NOT LIKE 'MANHATTAN' 
AND geography NOT LIKE 'BRONX' 
AND geography NOT LIKE 'STATEN ISLAND'
AND geography NOT LIKE 'BROOKLYN' 
AND geography NOT LIKE 'QUEENS' ;

--------- JOINING TABLE ------------
-- boro and population -- 
WITH 
	boro_year AS 
(
	
SELECT 
	boro,
	CAST(YEAR(OCCUR_DATE) AS VARCHAR) AS year 
FROM 
	shootings AS s
	)
SELECT  
	 DISTINCT b.BORO,
	 CAST(b.year AS VARCHAR) AS year,
	p.Population
INTO
	#yearlyPopp
FROM 
	population AS p
JOIN
	boro_year AS b ON b.BORO = p.Geography AND b.year = p.Year

ORDER BY 
	2,1

-- result -- 
SELECT * FROM #yearlyPopp;

-- CALCULATE num of case 
SELECT * FROM shootings;

WITH 
	total_incidents AS 
	(
	SELECT
		s.boro,
		YEAR(s.occur_date) AS incident_year ,
		COUNT(*) AS total_incident
	FROM shootings AS s
	GROUP BY s.boro,YEAR(s.occur_date)
	),

	join_incidents AS 
	(
SELECT t.boro, p.year, t.total_incident,p.Population FROM total_incidents AS t
JOIN
	#yearlyPopp AS p ON p.BORO = t.BORO AND p.year = t.incident_year
	)
SELECT
	*,
	ROUND (CAST(total_incident AS FLOAT) / CAST(Population AS FLOAT) * 100000.00,0) AS p_hundred_k
INTO shootingsPerK
FROM
	join_incidents
ORDER BY 
	2,1;

-- Final Table
SELECT * FROM shootingsPerK;

