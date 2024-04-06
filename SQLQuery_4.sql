CREATE DATABASE [Hospital]
GO
USE [Hospital]
GO

CREATE TABLE [Departments] (
	[Id] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[Building] INT NOT NULL CHECK ([Building] BETWEEN 1 AND 5),
	[Financing] MONEY NOT NULL CHECK ([Financing] >= 0) DEFAULT 0,
	[Floor] INT NOT NULL CHECK ([Floor] >= 1),
	[Name] NVARCHAR(100) NOT NULL CHECK(LEN(Name) > 0) UNIQUE
);

CREATE TABLE [Diseases] (
	[Id] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(100) NOT NULL CHECK(LEN(Name) > 0) UNIQUE,
	[Severity] INT NOT NULL CHECK(Severity >= 1) DEFAULT 1
);

CREATE TABLE [Doctors] (
	[Id] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(MAX) NOT NULL CHECK(LEN(Name) > 0),
	[Phone] CHAR(10) NOT NULL,
	[Premium] MONEY NOT NULL CHECK([Premium] > 0) DEFAULT 0,
	[Salary] MONEY NOT NULL CHECK([Salary] > 0),
	[Surname] NVARCHAR(100) NOT NULL CHECK(LEN([Surname]) > 0)
);

CREATE TABLE [Examinations] (
    [Id] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    [DayOfWeek] INT NOT NULL CHECK (DayOfWeek >= 1 AND DayOfWeek <= 7),
	[StartTime] TIME NOT NULL CHECK (StartTime >= '08:00' AND StartTime <= '18:00'),
	[EndTime] TIME NOT NULL,
	[Name] NVARCHAR(100) NOT NULL CHECK(LEN(Name) > 0) UNIQUE,
	CONSTRAINT end_time CHECK (EndTime > StartTime)
);


CREATE TABLE [Wards] (
	[Id] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	[Building] INT NOT NULL CHECK ([Building] BETWEEN 1 AND 5),
	[Floor] INT NOT NULL CHECK ([Floor] >= 1),
	[Name] NVARCHAR(20) NOT NULL CHECK(LEN(Name) > 0) UNIQUE
);
