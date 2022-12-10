--1.Örnek: "workers" adında bir table oluşturup "worker_id,worker_name, worker_salary" 
--sütunlarını ekleyin.
CREATE TABLE workers(worker_id VARCHAR(20), worker_name VARCHAR(20), worker_salary INT);
 SELECT * FROM workers;	
drop table if exists workers;
--//2.Örnek: Table'a worker_address sütunu ekleyerek alter yapın.					 
ALTER TABLE workers
ADD worker_address VARCHAR(80);	

--//3.Örnek: Drop workers table
DROP TABLE workers;

drop table countries;
CREATE TABLE countries
(
    country_id CHAR(3),
    country_name VARCHAR(50),
    region_id SMALLINT
);
Insert into countries values ('AR','Argentina',2);
Insert into countries values ('AU','Australia',3);
Insert into countries values ('BE','Belgium',1);
Insert into countries values ('BR','Brazil',2);
Insert into countries values ('CA','Canada',2);
Insert into countries values ('CH','Switzerland',1);
Insert into countries values ('CN','China',3);
Insert into countries values ('DE','Germany',1);
Insert into countries values ('DK','Denmark',1);
Insert into countries values ('EG','Egypt',4);
Insert into countries values ('FR','France',1);
Insert into countries values ('IL','Israel',4);
Insert into countries values ('IN','India',3);
Insert into countries values ('IT','Italy',1);
Insert into countries values ('JP','Japan',3);
Insert into countries values ('KW','Kuwait',4);
Insert into countries values ('ML','Malaysia',3);
Insert into countries values ('MX','Mexico',2);
Insert into countries values ('NG','Nigeria',4);
Insert into countries values ('NL','Netherlands',1);
Insert into countries values ('SG','Singapore',3);
Insert into countries values ('UK','United Kingdom',1);
Insert into countries values ('US','United States of America',2);
Insert into countries values ('ZM','Zambia',4);
Insert into countries values ('ZW','Zimbabwe',4);

--//1. Örnek:  region id'si 1 olan "country name" değerlerini çağırın.
select * from countries;
select country_name from countries where region_id=1;

--//2.Örnek: "region_id"nin 2'den büyük olduğu "country_id" ve "country_name" değerlerini çağırın

select country_name,country_id from countries where  region_id>2;


CREATE TABLE companies
(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
SELECT * FROM companies;
--//3.Örnek: "number_of_employees" değeri en düşük olan satırın tüm değerlerini çağırın.
select * from companies where number_of_employees=(select min(number_of_employees) from companies);
--//1. Örnek: companies tablosundan en yüksek ikinci number_of_employees değeri olan 
--company ve number_of_employees değerlerini çağırın.
--1.Yol:
select company,number_of_employees from companies
order by number_of_employees desc offset 1 limit 1;

SELECT company, number_of_employees
FROM companies
ORDER BY number_of_employees DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;
--2.Yol:Subquery
select company,number_of_employees from companies
where number_of_employees=(select max(number_of_employees) from companies
where number_of_employees<(select max(number_of_employees) from companies));
--3.YOl
select max(number_of_employees) from companies where number_of_employees<>
(select max (number_of_employees) from companies);
--//1. Örnek: number_of_employees değeri ortalama çalışan sayısından 
--az olan number_of_employees değerlerini
--16000 olarak UPDATE edin.
update companies
set number_of_employees=16000
where number_of_employees<(select avg(number_of_employees) from companies);
drop table companies;
select * from companies;

