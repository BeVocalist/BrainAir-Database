-- $Id: company_schema.sql,v 1.4 2007/06/14 11:10:08 almhe Exp $
-- The Jonson Brothers Ltd. company database

-- To load this file many times, put the
-- following commands in the beginning of
-- the file:

DROP TABLE IF EXISTS Year;
DROP TABLE IF EXISTS Weekday;
DROP TABLE IF EXISTS Destination;
DROP TABLE IF EXISTS Route;
DROP TABLE IF EXISTS Weeklyflight;
DROP TABLE IF EXISTS Flight;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Passenger;
DROP TABLE IF EXISTS Contact;
DROP TABLE IF EXISTS Payment;



SELECT 'Creating tables' AS 'Message';

CREATE TABLE Year
(
  year int,
  yearfactor FLOAT,
  CONSTRAINT pk_Year primary key(year)

);

CREATE TABLE Weekday
(
  year int,
  day varchar(10),
  factor float,

  CONSTRAINT pk_Weekday primary key (day)

);


CREATE TABLE Destination
(
  airport_code varchar(3),
  airport_name varchar(30),
  country varchar(30),

  CONSTRAINT pk_Destination primary key(airport_code)
);


CREATE TABLE Route
(
  departure_airport_code varchar(3),
  arrival_airport_code varchar(3),
  year int,
  day varchar(10),
  route_price FLOAT,

  CONSTRAINT pk_Route primary key(departure_airport_code,arrival_airport_code)
);

CREATE TABLE Weeklyflight
(
  departure_airport_code varchar(3),
  arrival_airport_code varchar(3),
  year int,
  day varchar(10),
  departure_time TIME,

  CONSTRAINT pk_Route primary key(departure_airport_code,arrival_airport_code)
);

CREATE TABLE Flight
(
  departure_airport_code varchar(3),
  arrival_airport_code varchar(3),
  year int,
  day varchar(10),
  departure_time TIME,
  week int,
  flight_number int,
  existseat int,

  CONSTRAINT pk_Route primary key(flight_number)
);

CREATE TABLE Reservation
(
  departure_airport_code varchar(3),
  arrival_airport_code varchar(3),
  year int,
  week int,
  weekday varchar(10),
  flighttime TIME,
  passenger_number int,
  output_reservationnumber int,

  CONSTRAINT pk_Reservation primary key(output_reservationnumber)

);

CREATE TABLE Passenger
(
  reservation_num int,
  passport_num int,
  name varchar(30),
  CONSTRAINT pk_Passenger primary key(passport_num)
);

CREATE TABLE Contact
(
  reservation_num int,
  passport_num int,
  email varchar(30),
  phone bigint,
  CONSTRAINT pk_Contact primary key(passport_num)
);

CREATE TABLE Payment
(
  reservation_num int,
  cardholder varchar(30),
  creditcard bigint,
  totalprice float,

  CONSTRAINT pk_Payment primary key(reservation_num)
);


-- Add foreign keys
/*SELECT 'Creating foreign keys' AS 'Message';
ALTER TABLE weeklyflight ADD CONSTRAINT fk_weeklyflight_route FOREIGN KEY (route) REFERENCES route(id);
ALTER TABLE weeklyflight ADD CONSTRAINT fk_weeklyflight_year FOREIGN KEY (year) REFERENCES yearfactor(year);
ALTER TABLE weeklyfactor ADD CONSTRAINT fk_weeklyfactor_year FOREIGN KEY (year) REFERENCES yearfactor(year);

/*ALTER TABLE route ADD CONSTRAINT fk_route_arrivalairport FOREIGN KEY (arrivalairport) REFERENCES airport(code);
ALTER TABLE route ADD CONSTRAINT fk_route_departureairport FOREIGN KEY (departureairport) REFERENCES airport(code);
ALTER TABLE route ADD CONSTRAINT fk_route_year FOREIGN KEY (year) REFERENCES yearfactor(year);
/*ALTER TABLE flight ADD CONSTRAINT fk_flight_weeklyschedule FOREIGN KEY (weeklyschedule) REFERENCES weeklyflight(id);

ALTER TABLE ticket ADD CONSTRAINT fk_ticket_passengerid FOREIGN KEY (passengerid) REFERENCES passenger(passportnumber);
ALTER TABLE ticket ADD CONSTRAINT fk_ticket_paidid FOREIGN KEY (paidid) REFERENCES paidreservation(id);


ALTER TABLE passenger ADD CONSTRAINT fk_passenger_ticket FOREIGN KEY (ticket) REFERENCES ticket(ticketnumber);

ALTER TABLE contact ADD CONSTRAINT fk_contact_id FOREIGN KEY (id) REFERENCES passenger(passportnumber);

ALTER TABLE reservation ADD CONSTRAINT fk_reservation_contact FOREIGN KEY (contact) REFERENCES contact(id);
ALTER TABLE reservation ADD CONSTRAINT fk_reservation_flight FOREIGN KEY (flight) REFERENCES flight(flightnumber);

ALTER TABLE paidreservation ADD CONSTRAINT fk_paidreservation_id FOREIGN KEY (id) REFERENCES reservation(reservationnumber);
ALTER TABLE paidreservation ADD CONSTRAINT fk_paidreservation_creditcard FOREIGN KEY (creditcard) REFERENCES creditcard(cardnumber);*/
