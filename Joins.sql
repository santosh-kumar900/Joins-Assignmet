Create database Ass_Joins;
use Ass_Joins;
Create Table Customers(
	Customer_ID int primary key,
    Customer_Name Varchar(50) not null,
    City Varchar(50) not null);
    
    Insert into Customers(Customer_ID, Customer_Name, City) Values
			(1, 'John Smith', 'New York'),
            (2, 'Mary Johson', 'Chicago'),
            (3, 'Peter Adams', 'Los Angles'),
            (4, 'Nancy Miler', 'Houston'),
            (5, 'Robert White', 'Miami');
            
Create Table Orders(
		Order_ID Int Primary Key,
        Customer_ID Int,
        Order_Date Date,
        Amount NUMERIC(10,2)
        );
        
Insert into Orders(Order_ID, Customer_ID, Order_Date, Amount) Values
		(101, 1, '2024-10-01', 250),
        (102, 2, '2024-10-05', 300),
        (103, 1, '2024-10-07', 150),
        (104, 3, '2024-10-10', 450),
		(105, 6, '2024-10-12', 400);

Create Table Payments( 
	Payment_ID varchar(5) Primary Key,
    Customer_ID Int,
    Payment_Date Date,
    Amount Numeric(10,2));
    
    Insert Into Payments(Payment_ID, Customer_ID, Payment_Date, Amount) Values
				( 'P001', 1, '2024-10-02', 250),
                ('P002', 2, '2024-10-11', 300),
                ('P003', 3, '2024-10-11', 450),
                ('P004', 4, '2024-10-15', 200);
                
                
Create Table Employees( 
		Employee_ID Int Primary Key,
        Employee_Name Varchar(50),
        Manager_ID Int);
        
Insert Into Employees(Employee_ID, Employee_Name, Manager_ID) Values 
			(1,'Alex Green', Null),
            (2, 'Brian Lee', 1),
            (3, 'Carol Ray', 1),
            (4, 'David Kim', 2),
            (5, 'Eva Smith', 2);
            
            
-- Question 1. Retrieve all customers who have placed at least one order.
-- Answer 1
Select c.Customer_ID, c.Customer_Name,o.Order_ID, o.Order_Date 
	From Customers c
    Join Orders o
    On c.Customer_ID = o.Customer_ID;
    
    
-- Question 2. Retrive all Customer and their orders, including customers who have not placed any orders.
-- Answer 2. 
    
Select c.Customer_ID, c.Customer_Name, o.Order_ID, o.Order_Date
From Customers c
Left Join Orders o
On c.Customer_ID = o.Customer_ID;

-- Question 3. Retrive all orders and their corresponding customers, including orders placed by unknown customers.
-- Answer 3

Select o.Order_ID, o.Customer_ID, o.Order_Date, c.Customer_Name
	From Customers c
    Right Join Orders o
    On c.Customer_ID = o.Customer_ID;
    
-- Question 4. Display all customers and orders, Whether matched or not
-- Answer 4

Select * From Customers c
Left Join Orders o
On c.Customer_ID = o.Customer_ID
UNION
Select * From Customers c
Right Join Orders o
On c.Customer_ID = o.Customer_ID;

-- Question 5. Find Customers who have not placed any orders.
-- Answer 5. 
Select *
From Customers c
Left Join Orders o On 
c.Customer_ID = o.Customer_ID WHERE o.Customer_ID IS Null;

-- Question 6. Retrieve Customers who made Payments but did not place any orders.
-- Answer 6

Select * From Payments p
Left Join Orders o
On p.Customer_ID = o.Customer_ID Where o.Customer_ID IS Null;

-- Question 7. Generate a list of all possible combinations betwwn Customers and Orders.
-- Answer 7

Select * from 
Customers 
cross Join Orders;

-- Question 8. Show all customers along with order and payment amounts in one table.
-- Answer 8

Select * From 
Customers c
Left Join Orders o
on c.Customer_ID = o.Customer_ID
Left Join Payments p
on o.Customer_ID = p.Customer_ID;

-- Question 9 Retrieve all Customers who have both placed orders and made payments
-- Answer 9
Select * From 
Customers c
Right Join Orders o
on c.Customer_ID = o.Customer_ID
Left Join Payments p
on o.Customer_ID = p.Customer_ID Where p.Payment_ID IS NOt Null;
