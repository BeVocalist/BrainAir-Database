
/*SOURCE BrianAir_schema.sql;*/
delimiter $$
DROP PROCEDURE IF exists addYear;
DROP PROCEDURE IF EXISTS addDay;
DROP PROCEDURE IF EXISTS addDestination;
DROP PROCEDURE IF EXISTS addRoute;
DROP PROCEDURE IF EXISTS addFlight;

$$

delimiter ;

delimiter $$

CREATE PROCEDURE addYear(IN year INT,IN factor FLOAT)
BEGIN

INSERT INTO Year(year,yearfactor)
VALUES(year,factor);

END $$

delimiter ;


/*--------------------------------------------------------*/

delimiter $$

CREATE PROCEDURE addDay(IN year INT,IN day VARCHAR(10),IN factor FLOAT)
BEGIN

INSERT INTO Weekday(year,day,factor)
VALUES(year,day,factor);

END $$

delimiter ;
/*--------------------------------------------------------*/


delimiter $$
CREATE PROCEDURE addDestination(IN airportcode VARCHAR(3), IN airname VARCHAR(30), IN country VARCHAR(30))
BEGIN

INSERT INTO Destination(airport_code,airportname,country)
VALUES(airportcode,airname,country);

END $$
delimiter ;

/*--------------------------------------------------------*/

delimiter $$
CREATE PROCEDURE addRoute(IN departureairportcode VARCHAR(3), IN arrivalairportcode VARCHAR(3),IN year int, IN day varchar(10), IN routeprice float)
BEGIN

INSERT INTO Route(departure_airport_code,arrival_airport_code,year,day,route_price)
VALUES(departureairportcode,arrivalairportcode,year,day,routeprice);

END $$

delimiter ;
/*--------------------------------------------------------*/
delimiter $$
CREATE PROCEDURE addFlight(IN departure_airport_code VARCHAR(3),
IN arrival_airport_code VARCHAR(3),IN year INT,IN day VARCHAR(10), IN departure_time TIME)

BEGIN

INSERT INTO Weeklyflight(departure_airport_code,arrival_airport_code,year,day,departure_time)
VALUES(departure_airport_code,arrival_airport_code,year,day,departure_time);

END $$

delimiter ;

SELECT "Trying to add 4 weeklyschedule flights" AS "Message";
CALL addFlight("MIT","HOB", 2010, "Monday", "09:00:00");
CALL addFlight("HOB","MIT", 2010, "Tuesday", "10:00:00");
CALL addFlight("MIT","HOB", 2011, "Sunday", "11:00:00");
CALL addFlight("HOB","MIT", 2011, "Sunday", "12:00:00");
