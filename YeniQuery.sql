create database SqlNewTask2
use SqlNewTask2

create table Brands
(
Id int primary key identity,
[Name] nvarchar(50) not null
)

create table Notebooks
(
Id int primary key identity,
[Name] nvarchar(40),
Price decimal (6,2),
BrandId int foreign key references Brands(Id)
)

create table Phones
(
Id int primary key identity,
[Name] nvarchar(50),
Price decimal (6,2),
BrandId int foreign key references Brands(Id)
)


insert into Brands([Name])
values('MSI'),
('ACER'),
('ASUS'),
('DELL'),
('HP'),
('Samsung'),
('Xiaomi'),
('IPhone'),
('Nokia'),
('RealMe')

insert into Notebooks([Name],Price)
values(
'MSI Gaming 2016',1299.99
),
(
'MSI Force 2018',1499.99
)
,
(
'ASUS TUF Gaming 2018',1999.99
)
,
(
'ASUS ROG Strix',2799.99
)
,
(
'Acer Lavon 2016',1399.99
)
,
(
'HP Pavilion 15',1799.39
),
(
'DELL Vostro',2580.39
)


insert into Phones([Name],Price)
values(
'Samsung Galaxy',599.99
),
(
'Xiaomi Redmi Note 8 Pro',499.99
),
(
'Iphone X',1699.99
),
(
'Nokia 6300',99.99
),
(
'RealMe Pro QU',1299.99
)

select n.name , b.name as BrandName from Notebooks as n
join Brands as b
on n.BrandId = n.Id

select n.Name, b.name as BrandName from Notebooks as n

select Notebooks.Name,Brands.Name as BrandName from Notebooks
join Brands
on Notebooks.BrandId = Brands.Id


Select CONCAT(Notebooks.Name,' ,',Brands.Name) as BrandName, Notebooks.Price from Notebooks
inner join Brands
on Notebooks.BrandId = Brands.Id

Select CONCAT(Phones.Name,' ,',Brands.Name) as BrandName, Phones.Price from Phones
inner join Brands
on Phones.BrandId = Brands.Id

Select CONCAT(Notebooks.Name,' ,',Brands.Name) as BrandName, Notebooks.Price from Notebooks
inner join Brands
on Notebooks.BrandId = Brands.Id

select Brands.Name as NoteBookBrand from Brands
join Notebooks
on Brands.Id = Notebooks.BrandId
where Brands.Name like '%s%' and Notebooks.BrandId = Brands.Id

select Name,Price from Notebooks
where Price between 1000 and 2000

select Name,Price from Phones
where Price between 1000 and 1500 or Price>1500

select Brands.Name,COUNT(Brands.Id) as CountOfNotebooks from Brands
join Notebooks
on Notebooks.BrandId = Brands.Id
group by Brands.Name

insert into Brands([Name])
values('ASUS')

insert into Notebooks([Name],Price)
values(
'MSI Gaming Max Pro',2499.99
),
(
'MSI Force GTX',4499.99
)



select Brands.Name,COUNT(Brands.Id) as CountOfPhones from Brands
join Phones
on Phones.BrandId = Brands.Id
group by Brands.Name

insert into Phones([Name])
values('Xiami'),('Xiami'),('Xiami')

insert into Phones([Name])
values('Xiaomi'),('Xiaomi'),('Xiaomi')


select Notebooks.Name as NoteBookName,Phones.Name as PhoneName,Notebooks.Id as NotebooksId,Notebooks.Price as NotebookPrice,Notebooks.BrandId, Phones.BrandId,Phones.Id as PhonesId,Phones.Price as PhonePrice from Notebooks
full outer join Phones
on Notebooks.Id = Phones.Id

select Notebooks.Name as NoteBookName,Phones.Name as PhoneName,Notebooks.Id as NotebooksId,Brands.Name as BrandName ,Notebooks.Price as NotebookPrice,Notebooks.BrandId, Phones.BrandId,Phones.Id as PhonesId,Phones.Price as PhonePrice from Notebooks
full outer join Phones
on Notebooks.Id = Phones.Id
full join Brands
on Brands.Id = Phones.Id

insert into Notebooks([Name],Price)
values(
'Test Intersect',2499.99
)

insert into Phones([Name],Price)
values(
'Test Intersect',2499.99
)

select n.Name NotebookName, p.name as PhoneName,n.brandId,p.brandId from Notebooks as n
 join Phones as p
on n.Id = p.Id

select n.Name NotebookName,n.BrandId from Notebooks n
intersect
select p.Name as PhoneName,p.BrandId from Phones p

select Notebooks.Name as NoteBookName,Phones.Name as PhoneName,Notebooks.Id as NotebooksId,Brands.Name as BrandName ,Notebooks.Price as NotebookPrice,Notebooks.BrandId, Phones.BrandId,Phones.Id as PhonesId,Phones.Price as PhonePrice from Notebooks
full outer join Phones
on Notebooks.Id = Phones.Id
full join Brands
on Brands.Id = Phones.Id
where Notebooks.Price>1000 and Phones.Price >1000


select Notebooks.Id,Notebooks.Name,Notebooks.BrandId,Notebooks.Price from Notebooks
union
select Phones.Id,Phones.Name,Phones.BrandId,Phones.Price from Phones --union ile de yazmaq olar deye dusundum--

select Phones.Name as BrandName,SUM(Phones.Price) as TotalPrice,COUNT(Id) as ProductCount from Phones
group by Phones.Name,Phones.Price

select Notebooks.Name as BrandName,SUM(Notebooks.Price) as TotalPrice,COUNT(Id) as ProductCount from Notebooks
group by Notebooks.Name,Notebooks.Price
having COUNT(Id)>=3
