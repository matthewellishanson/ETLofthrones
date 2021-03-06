create database ETLofThrones;
use ETLofThrones;

create table Characters (
Character_ID integer primary key auto_increment,
FirstName varchar(50),
LastName varchar(100),
Gender boolean,
Book1 boolean,
Book2 boolean,
Book3 boolean,
Book4 boolean,
Book5 boolean,
House varchar(50),
DeathStatus boolean,
Death_ID integer
);

create table Deaths (
Death_ID integer primary key auto_increment,
Character_ID integer,
FirstName varchar(50),
LastName varchar(50),
Book_of_Death integer,
DeathYear integer
);

create table Battles (
Battle_ID integer primary key auto_increment,
BattleName varchar(100),
Battle_Year integer,
Attacker varchar(150),
Defender varchar(150),
Attacker_Outcome varchar(10)
);

create table Discussion (
Discussion_ID integer primary key auto_increment,
Character_ID integer,
FirstName varchar(50),
LastName varchar(50),
Popularity float
);

alter table Characters drop column LastName;
alter table Characters 
change FirstName CharacterName varchar(150);

alter table Deaths drop column LastName;
alter table Deaths
change FirstName CharacterName varchar(150);

alter table Discussion drop column LastName;
alter table Discussion
change FirstName CharacterName varchar(150);

select * from Deaths;

#Turn safe mode off

UPDATE Deaths D
INNER JOIN Characters C ON D.CharacterName = C.CharacterName
SET D.Character_ID = C.Character_ID;

Update Characters C 
inner join Deaths D on D.CharacterName = C.CharacterName
set C.Death_ID = D.Death_ID;

UPDATE Discussion DS
INNER JOIN Characters C ON DS.CharacterName = C.CharacterName
SET DS.Character_ID = C.Character_ID;

select * from Discussion;

alter table Characters drop column DeathStatus;

select * from Characters;
