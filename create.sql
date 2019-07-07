-- Create a table
CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    origin VARCHAR NOT NULL,
    destination VARCHAR NOT NULL,
    duration INTEGER NOT NULL
);

CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    flight_id INTEGER REFERENCES flights
);

-- To insert a record into the database
INSERT INTO flights (origin, destination,duration) VALUES ('New York', 'London', 415);
INSERT INTO flights (origin, destination,duration) VALUES ('Shanghai', 'Paris', 760);
INSERT INTO flights (origin, destination,duration) VALUES ('Istanbul', 'Tokyo', 700);
INSERT INTO flights (origin, destination,duration) VALUES ('New York', 'Paris', 435);
INSERT INTO flights (origin, destination,duration) VALUES ('Moscow', 'Paris', 245);
INSERT INTO flights (origin, destination,duration) VALUES ('Lima', 'New York', 455);

INSERT INTO passengers (name, flight_id) VALUES ('Alice', 1)
INSERT INTO passengers (name, flight_id) VALUES ('Bob', 3)
INSERT INTO passengers (name, flight_id) VALUES ('Charlie', 4)
INSERT INTO passengers (name, flight_id) VALUES ('Dave', 2)
INSERT INTO passengers (name, flight_id) VALUES ('Erin', 1)
INSERT INTO passengers (name, flight_id) VALUES ('Frank', 2)
INSERT INTO passengers (name, flight_id) VALUES ('Gracie', 3)

-- Update data
UPDATE flights SET duration = 430 WHERE origin = 'New York' AND destination = 'London';

-- Delete data
DELETE FROM flights WHERE destination = 'Tokyo';

-- Inner joint tables, left join to see all flights even if they don't have a passenger
SELECT origin, destination, name FROM flights LEFT JOIN passengers ON passengers.flight_id = flights.id
