Create Table Passengers(
Id int identity(1,1) Primary key,
[Name] varchar(30),
[Surname] varchar(50),
Age int Not null,
Check(Age>0)
)

ON

Create Table AirLines(
Id int identity(1,1) Primary key,
[Name] varchar(50) not null,
Concourse char not null
)

ON

Create Table Flights(
Id int identity(1,1) Primary key,
FlightNumber int not null,
AirportCodeFrom varchar(10),
AirportCodeTo varchar(10),
DepartureTime DateTime,
ArrivalTime DateTime,
AirlIneId int Foreign Key References AirLines(Id)
)

ON

Create Table CheckIns(
Id int identity(1,1) Primary key,
FlightId int Foreign Key References Flights(Id),
PassengerId int Foreign Key References Passengers(Id),
CheckInTime DateTime
)

ON

Select * From Passengers
Where Passengers.Name='Amelia' And Passengers.Surname='Earhart' And Age=39

ON

Select * From AirLines
Where AirLines.Name='Delta' And AirLines.Concourse not in ('A','B','C','D','T')

ON

Select * From Flights
Join AirLines on Flights.AirlIneId=AirLines.Id
Where AirLines.Name='Delta'
And Flights.FlightNumber=300
And Flights.AirportCodeFrom='ATL'
And Flights.AirportCodeTo='BOS'
And Flights.DepartureTime= '2023-08-03 15:00:00' 
AND Flights.ArrivalTime= '2023-08-03 22:00:00';

ON

Select * From CheckIns
Join Passengers on CheckIns.PassengerId=Passengers.Id
Join Flights on CheckIns.FlightId=Flights.Id
Join AirLines on Flights.AirlIneId=AirLines.Id
Where Passengers.Name='Amelia'
And Passengers.Surname='Earhart'
And AirLines.Name='Delta'
And Flights.FlightNumber=300
And CheckIns.CheckInTime='2023-08-03 15:03:00'
