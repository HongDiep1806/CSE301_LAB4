use salemanagerment;
-- 1. Show the all-clients details who lives in “Binh Duong”
select * 
from clients
where province = 'Binh Duong';
-- 2.Find the client’s number and client’s name who do not live in “Hanoi”.
select client_number, client_name
from clients
where province != 'Hanoi';
-- 3.Identify the names of all products with less than 25 in stock.
select product_name from product
where quantity_on_hand < 25;
-- 4.Find the product names where company making losses.  
select product_name from product
where sell_price < cost_price;
-- 5.Find the salesman’s details who are able achieved their target
select * from salesman
where target_achieved >= sales_target;
-- 6.Select the names and city of salesman who are not received salary between 10000 and 17000.
select salesman_name, city from salesman
where salary not between 10000 and 17000;
-- 7. Show order date and the clients_number of who bought the product between '2022-01-01' and '2022-02-15'.
select order_date, client_number from salesorder
where order_date between '2022-01-01' and '2022-02-15';
-- 8. Find the names of cities in clients table where city name starts with "N"
select city from clients where city like 'N%';
-- 9.Display clients’ information whose names have "u" in third position.
select * from clients where Client_Name like '__u%';
-- 10. Find the details of clients whose names have "u" in second last position.
Select *
from clients
where Client_Name like '%u_';
-- 11. Find the names of cities in clients table where city name starts with "D" and ends with “n”
Select city
from clients
where city like 'D%n';
-- 12. Select all clients details who belongs from Ho Chi Minh, Hanoi and Da Lat.
select *
from clients
where city in ('Ho Chi Minh', 'Hanoi', 'Da Lat');
-- 13. Choose all clients data who do not reside in Ho Chi Minh, Hanoi and Da Lat
select *
from clients
where city not in ('Ho Chi Minh', 'Hanoi', 'Da Lat');
-- 14. Find the average salesman’s salary.
select avg(s.salary) from salesman s;
-- 15. Find the name of the highest paid salesman.
select salesman_name from salesman where salary = (select max(salary) from salesman);
-- 16. Find the name of the salesman who is paid the lowest salary.
select salesman_name from salesman where salary = (select min(salary) from salesman);
-- 17. Determine the total number of salespeople employed by the company.
select count(*) from salesman;
-- 18. Compute the total salary paid to the company's salesman.
select sum(salary) from salesman;
 -- 19. Select the salesman’s details sorted by their salary
SELECT 
    *
FROM
    SALESMAN
ORDER BY SALARY;

 -- 20. Display salesman names and phone numbers based on their target achieved (in ascending order) and their city (in descending order).
SELECT salesman_name,phone
FROM salesman
ORDER BY target_achieved ASC,city DESC;

-- 21. Display 3 first names of the salesman table and the salesman’s names in descending order.
SELECT SALESMAN_NAME FROM SALESMAN
ORDER BY SALESMAN_NAME DESC
LIMIT 3;

-- 22. Find salary and the salesman’s names who is getting the highest salary
SELECT SALARY, SALESMAN_NAME FROM SALESMAN
ORDER BY SALARY DESC
LIMIT 1;

-- 23. Find salary and the salesman’s names who is getting second lowest salary.
SELECT SALARY, SALESMAN_NAME FROM SALESMAN
ORDER BY SALARY
LIMIT 1
OFFSET 1;

-- 24. Display the first five sales orders information from the sales order table.
SELECT 
    *
FROM
    SALESORDER
LIMIT 5;

-- 25. Display next ten sales order information from sales order table except first five sales order
SELECT * FROM SALESORDER
LIMIT 10
OFFSET 5;

-- 26. If there are more than one client, find the name of the province and the number of clients in each 
-- province, ordered high to low.
select province, count(client_number) as number_of_clients from clients
group by province
having count(client_number) > 1
order by number_of_clients desc;

-- 27. Display information clients have number of sales order more than 1.
select * from clients
where client_number in (select client_number 
						from salesorder 
                        group by client_number 
                        having count(order_number)>1);

-- 28. Display the name and due amount of those clients who lives in “Hanoi”.
select client_name, Amount_Due from clients
where city ='Hanoi';

-- 29. Find the clients details who has due more than 3000.
select * from clients
where Amount_Due > 3000;

-- 30. Find the clients name and their province who has no due.
select client_name from clients
where Amount_Due = 0;

-- 31. Show details of all clients paying between 10,000 and 13,000.
select * from clients
where Amount_Paid between 10000 and 13000;

-- 32. Find the details of clients whose name is “Dat”.
select * from clients
where client_name like '%Dat';

-- 33. Display all product name and their corresponding selling price.
select product_name,Sell_Price from product;

-- 34. How many TVs are in stock?
select Quantity_On_Hand from product
where Product_Name = 'TV';

-- 35. Find the salesman’s details who are not able achieved their target.
select * from salesman
where Target_Achieved < Sales_Target;

-- 36. Show all the product details of product number ‘P1005’.
select * from product
where Product_Number = 'P1005';

-- 37. Find the buying price and sell price of a Mouse.
select Cost_Price,Sell_Price from product
where Product_Name = 'Mouse';

-- 38. Find the salesman names and phone numbers who lives in Thu Dau Mot.
select Salesman_Name, Phone from salesman
where city = 'Thu Dau Mot';

-- 39. Find all the salesman’s name and salary.
select Salesman_Name, Salary from salesman;

-- 40. Select the names and salary of salesman who are received between 10000 and 17000.
select Salesman_Name, Salary from salesman
where Salary between 10000 and 17000;

-- 41. Display all salesman details who are received salary between 10000 and 20000 and achieved 
-- their target.
select * from salesman
where Salary between 10000 and 20000 
and Target_Achieved >= Sales_Target;

-- 42. Display all salesman details who are received salary between 20000 and 30000 and not achieved 
-- their target.
select * from salesman
where Salary between 20000 and 30000
and Target_Achieved < Sales_Target;

-- 43. Find information about all clients whose names do not end with "h".
select * from clients
where Client_Name not like '%h';

-- 44. Find client names whose second letter is 'r' or second last letter 'a'.
select Client_Name from clients
where Client_Name like '_r%' or '%a_';

-- 45. Select all clients where the city name starts with "D" and at least 3 characters in length.
select * from clients
where city like 'D%' and length(client_name) >=3;

-- 46. Select the salesman name, salaries and target achieved sorted by their target_achieved in 
-- descending order.
select Salesman_Name, Salary, Target_Achieved from salesman
order by Target_Achieved desc;

-- 47. Select the salesman’s details sorted by their sales_target and target_achieved in ascending order.
select * from salesman
order by Sales_Target, Target_Achieved asc;

-- 48. Select the salesman’s details sorted ascending by their salary and descending by achieved target.
select * from salesman
order by Salary asc, Target_Achieved desc;

-- 49. Display salesman names and phone numbers in descending order based on their sales target.
select Salesman_Name, Phone from salesman
order by Sales_Target desc;

-- 50. Display the product name, cost price, and sell price sorted by quantity in hand
select Product_Name, Cost_Price,Sell_Price from product
order by Quantity_On_Hand;

-- 51. Retrieve the clients’ names in ascending order.
select client_name from clients
order by Client_Name asc;

-- 52. Display client information based on order by their city
select * from clients
order by city;

-- 53. Display client information based on order by their address and city
select * from clients
order by Address, City;

-- 54. Display client information based on their city, sorted high to low based on amount due.
select * from clients
order by City, Amount_Due desc;

-- 55. Display the data of sales orders depending on their delivery status from the current date to the 
-- old date.
select * from salesorder
order by Delivery_Status, Delivery_Date desc;

-- 56. Display last five sales order information from sales order table.
select * from salesorder
order by Order_Number desc
limit 5;

-- 57. Count the pincode in client table.
select count(pincode) as count_pincode from clients;

-- 58. How many clients are living in Binh Duong?
select count(client_number) as num_of_clients from clients
where province = 'Binh Duong'
group by province;

-- 59. Count the clients for each province.
select Province, count(Client_Number) as num_of_clients from clients
group by province;

-- 60. If there are more than three clients, find the name of the province and the number of clients in each 
-- province.
select province, count(client_number) from clients
group by province
having count(Client_Number) > 3 ;

-- 61. Display product number and product name and count number orders of each product more than 1 
-- (in ascending order).
with tableA as (
  select Product_Number, count(order_number) as countOrder
  from salesorderdetails
  group by Product_Number
)
select t.Product_Number, p.Product_Name, t.countOrder
from product p
left join tableA t
  on p.Product_Number = t.Product_Number
  where t.countOrder > 1
  order by t.countOrder;
  
--   62. Find products which have more quantity on hand than 20 and less than the sum of average.

select * from product
where Quantity_On_Hand > 20 and Quantity_On_Hand < (select avg(Quantity_On_Hand) as avgQ from product);