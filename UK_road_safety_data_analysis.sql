

SELECT accident_index, accident_year, accident_severity, longitude,latitude, number_of_casualties, number_of_vehicles, Borough 
FROM masterdatta 
ORDER BY accident_year;


SELECT DISTINCT accident_severity
FROM masterdatta;

/* Check for missing data */
SELECT count(*), count(borough),count(number_of_casualties)
FROM masterdatta;

/* Get the number of accidents per year and severity */
SELECT accident_year, count(number_of_casualties),count(accident_severity)
FROM masterdatta
GROUP BY accident_year,accident_severity;

/* Get the number of accidents by borough */
SELECT Borough,accident_severity,sum(number_of_vehicles) over(partition by accident_severity) FROM masterdatta;

/* Filter by wildcards */
SELECT Borough,number_of_casualties AS 'casualties', AVG(accident_severity) AS 'Average Severity', COUNT(number_of_vehicles) AS 'Number of Accidents'
FROM masterdatta
WHERE Borough LIKE '%m%';
