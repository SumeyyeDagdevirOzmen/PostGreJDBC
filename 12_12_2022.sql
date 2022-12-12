 
 drop table companies;
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
 --1. Örnek:Prepared statement kullanarak company adı IBM olan number_of_employees değerini
 --9999 olarak güncelleyin.
 UPDATE companies
 SET number_of_employees=9999
 WHERE company='IBM';
 
 --2 tane sayi toplayan fonksiyon olusturucagiz
 CREATE OR   REPLACE FUNCTION  toplamaF(x NUMERIC,y NUMERIC)
 RETURNS NUMERIC
 LANGUAGE plpgsql
 AS
 $$
 BEGIN
 
 RETURN x+y;
 
 END
 $$
 
 SELECT * FROM toplamaF(4,6) AS toplam;
 
 
 
 
 
 
 
 
 
 
 
 
 