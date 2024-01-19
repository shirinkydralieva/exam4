create database air_travel
    with
    owner = postgres
    encoding = 'UTF8'
    connection limit = -1
    is_template = False;

create table company (
    id integer primary key,
    name varchar(255) not null
);

create table passenger (
    id integer primary key,
    name varchar(255) not null
);

create table trip(
    id integer primary key,
    company integer,
    plane varchar(255) not null,
    town_from varchar(255) not null,
    town_to varchar(255) not null,
    time_out timestamp,
    time_in timestamp,
    constraint company_fk foreign key(company) references company(id)
);

create table pass_in_trip (
    id integer primary key,
    trip integer,
    passenger integer,
    place varchar,
    constraint trip_fk foreign key(trip) references trip(id),
    constraint passenger_fk foreign key(passenger) references passenger(id)
);

insert into company (id, name) values (1, 'Don_avia'), (2, 'Aeroflot'), (3, 'Dale_avia'), (4, 'air_France'), (5, 'British_AW');

insert into passenger (id, name) values (1, 'Bruce Willis'), (2, 'George Clooney'), (3, 'Kevin Costner'), (4, 'Donald Sutherland'), (5, 'Jennifer Lopez'), (6, 'Ray Liotta'), (7, 'Samuel L. Jackson'), (8, 'Nikole Kidman'), (9, 'Alan Rickman'), (10, 'Kurt Russell'),
                                        (11, 'Harrison Ford'), (12, 'Russell Crowe'),(13, 'Steve Martin'),(14, 'Michael Caine'),(15, 'Angelina Jolie'),(16, 'Mel Gibson'),(17, 'Michael Douglas'),(18, 'John Travolta' ),(19, 'Sylvester Stallone'),(20, 'Tommy Lee Jones'),
                                        (21, 'Catherine Zeta-Jones'),(22, 'Antonio Banderas'),(23, 'Kim Basinger'),(24, 'Sam Neill'),(25, 'Gary Oldman'),(26, 'ClINT Eastwood'),(27, 'Brad Pitt'),(28, 'Johnny Depp'),(29, 'Pierce Brosnan'),(30, 'Sean Connery'),
                                        (31, 'Bruce Willis'), (37, 'Mullah Omar');

insert into trip (id, company, plane, town_from, town_to, time_out, time_in) values (1100, 4 , 'Boeing', 'Rostov', 'Paris', '1900-01-01 14:30:00.00','1900-01-01 17:50:00.00'),
                                                                                    (1101, 4, 'Boeing', 'Paris',	'Rostov', '1900-01-01 08:12:00.00', '1900-01-01 11:45:00.00'),
                                                                                    (1123, 3, 'TU-154', 'Rostov',	'Vladivostok', '1900-01-01 16:20:00.00', '1900-01-02 03:40:00.00'),
                                                                                    (1124, 3, 'TU-154', 'Vladivostok', 'Rostov'	, '1900-01-01 09:00:00.00',	 '1900-01-01 19:50:00.00'),
                                                                                    (1145,	2, 'IL-86',		'Moscow',			'Rostov',			'1900-01-01 09:35:00.00',		'1900-01-01 11:23:00.00'),
                                                                                    (1146,	2, 'IL-86',		'Rostov',			'Moscow',			'1900-01-01 17:55:00.00',		'1900-01-01 20:01:00.00'),
                                                                                    (1181,	1, 'TU-134',	'Rostov',			'Moscow',			'1900-01-01 06:12:00.00',		'1900-01-01 08:01:00.00'),
                                                                                    (1182,	1, 'TU-134',	'Moscow',			'Rostov',			'1900-01-01 12:35:00.00',		'1900-01-01 14:30:00.00'),
                                                                                    (1187,	1, 'TU-134',	'Rostov',			'Moscow',			'1900-01-01 15:42:00.00',		'1900-01-01 17:39:00.00'),
                                                                                    (1188,	1, 'TU-134',	'Moscow',			'Rostov',			'1900-01-01 22:50:00.00',		'1900-01-02 00:48:00.00'),
                                                                                    (1195,	1, 'TU-154',	'Rostov',			'Moscow',			'1900-01-01 23:30:00.00',		'1900-01-02 01:11:00.00'),
                                                                                    (1196,	1, 'TU-154',	'Moscow',			'Rostov',			'1900-01-01 04:00:00.00',		'1900-01-01 05:45:00.00'),
                                                                                    (7771,	5, 'Boeing',	'London',			'Singapore',		'1900-01-01 01:00:00.00',		'1900-01-01 11:00:00.00'),
                                                                                    (7772,	5, 'Boeing',	'Singapore',		'London',			'1900-01-01 12:00:00.00',		'1900-01-02 02:00:00.00'),
                                                                                    (7773,	5, 'Boeing',	'London',			'Singapore',		'1900-01-01 03:00:00.00',		'1900-01-01 13:00:00.00'),
                                                                                    (7774,	5, 'Boeing',	'Singapore',		'London',			'1900-01-01 14:00:00.00',		'1900-01-02 06:00:00.00'),
                                                                                    (7775,	5, 'Boeing',	'London',			'Singapore',		'1900-01-01 09:00:00.00',		'1900-01-01 20:00:00.00'),
                                                                                    (7776,	5, 'Boeing',	'Singapore',		'London',			'1900-01-01 18:00:00.00',		'1900-01-02 08:00:00.00'),
                                                                                    (7777,	5, 'Boeing',	'London',			'Singapore',		'1900-01-01 18:00:00.00',		'1900-01-02 06:00:00.00'),
                                                                                    (7778,	5, 'Boeing',	'Singapore',		'London',		'1900-01-01 22:00:00.00',		    '1900-01-02 12:00:00.00'),
                                                                                    (8881,	5, 'Boeing',	'London',			'Paris',			'1900-01-01 03:00:00.00',		'1900-01-01 04:00:00.00'),
                                                                                    (8882,	5, 'Boeing',	'Paris',			'London',			'1900-01-01 22:00:00.00',		'1900-01-01 23:00:00.00');
insert into pass_in_trip (id, trip, passenger, place) values (1, 1100, 1, '1a'), (2, 1123, 3, '2a'),(3, 1123, 1,'4c'),(4,1123, 6, '4b' ),(5, 1124,    2, '2d'),(6, 1145,  3,  '2c'),(7,1181, 1, '1a') ,(8, 1181, 6, '1b' ),(9, 1181, 8, '3c'),(10, 1181,  5, '1b'),
                                                             (11,     1182,    5,  '4b'),(12,     1187,    8,   '3a'),(13,     1188,    8,  '3a'),(14,     1182,    9,  '6d'),(15,     1145,    5, '1d'),(16,     1187,    10, '3d'),( 17,     8882,    37,   '1a'),(18,     7771,   37,   '1c'),(19,     7772,    37, '1a'),(20,     8881,    37,  '1d'),
                                                             (21 ,    7778,    10,  '2a'),(22,     7772,    10,  '3a'),(23,     7771,    11, '4a'),(24,     7771,    11, '1b'),(25,     7771,    11,  '5a'),(26,     7772,   12, '1d'),(27,     7773,    13,   '2d'),( 28,     7772,    13,  '1b'),(29,    8882,    14, '3d'),(30,     7771,    14, '4d'),(31,     7771,    14, '5d'),(32, 7772,    14, '1c');

-- 1 Вывести имена всех людей, которые есть в базе данных авиакомпаний
select name from passenger;
-- 2 Вывести названия всеx авиакомпаний
select name from company;
-- 3 Вывести все рейсы, совершенные из Москвы
select * from trip where town_from = 'Moscow';
-- 4 Вывести имена людей, которые заканчиваются на "man"
select name from passenger where name like '%man';
-- 5 Вывести количество рейсов, совершенных на TU-134
select count(plane), plane from trip group by plane having plane = 'TU-134' ;
-- 6 Какие компании совершали перелеты на Boeing
select distinct cy.name from company cy join trip tp on cy.id = tp.company where plane = 'Boeing';
-- 7 Вывести все названия самолётов, на которых можно улететь в Москву (Moscow)
select distinct plane from trip where town_to = 'Moscow';
-- 9 Какие компании организуют перелеты с Владивостока (Vladivostok)?
select distinct cy.name from company cy join trip tp on cy.id = tp.company where tp.town_from = 'Vladivostok';
-- 12 Вывести id и количество пассажиров для всех прошедших полётов
-- -
-- 14 В какие города летал Bruce Willis
select town_to from trip tp
    join pass_in_trip pit on tp.id = pit.trip
    join passenger p on pit.passenger = p.id where p.name = 'Bruce Willis';
-- 15 Выведите дату и время прилёта пассажира Стив Мартин (Steve Martin) в Лондон (London)
select tp.time_in, tp.time_out from pass_in_trip pit
    join trip tp on  pit.trip = tp.id
    join passenger p on p.id = pit.passenger where p.name = 'Steve Martin' and tp.town_to = 'London' ;
-- 16 Сколько рейсов совершили авиакомпании с Ростова (Rostov) в Москву (Moscow) ?

-- 17 Вывести пассажиров с самым длинным именем

-- 18 Вывести имена людей, у которых есть полный тёзка среди пассажиров

-- 19 Вывести отсортированный по количеству перелетов (по убыванию) и имени (по возрастанию) список пассажиров, совершивших хотя бы 1 полет.

-- 20 Сколько рейсов совершили авиакомпании с Ростова (Rostov) в Москву (Moscow) ?

-- 21 Удалить все перелеты, совершенные из Москвы (Moscow).

