--1
SELECT 
	doc.[Name] +' '+ doc.[Surname] AS [Full Name],
	sp.[Name] AS Specialisation
FROM 
	[Doctors] doc, 
	[Specializations] sp, 
	[DoctorsSpecializations] doc_sp
WHERE 
	doc.[Id] = doc_sp.[DoctorId] AND doc_sp.[SpecializationId] = sp.[Id]


--2
SELECT 
	doc.[Surname] AS Surname, 
	doc.[Salary] + doc.[Premium] AS Salary
FROM 
	[Doctors] doc,
	[Vacations] v
WHERE
	doc.[Id] = v.[DoctorId] AND v.DoctorId IS NULL;


--3
SELECT w.[Name]
FROM 
	[Wards] w,
	[Departments] d
WHERE d.[Id] = w.[DepartmentId] AND d.[Name] = 'Intensive Treatment'


--4
SELECT dep.[Name]
FROM 
	[Departments] dep, 
	[Donations] don, 
	[Sponsors] sp
WHERE 
	sp.[Id] = don.[SponsorId] AND dep.[Id] = don.[DepartmentId]
	AND sp.[Name] = 'Umbrella Corporation'


--5
SELECT dep.[Name], s.[Name], don.[Amount], don.[Date]
FROM 
	[Donations] don,
	[Departments] dep,
	[Sponsors] s
WHERE 
	dep.[Id] = don.[DepartmentId] AND s.[Id] = don.[SponsorId]
	AND don.[Date] BETWEEN DATEADD (MONTH, DATEDIFF(MONTH, 0, GETDATE()) - 1, 0) AND (GETDATE()); -- не дуже зрозум≥ла €к знаходити щось за останн≥й м≥с€ць тому знайшла формули в ≥нтернет≥


--6
