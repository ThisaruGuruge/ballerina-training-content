DROP DATABASE IF EXISTS gq_bank_test;
CREATE DATABASE gq_bank_test;
USE gq_bank_test;
CREATE TABLE Employees(employee_id INT AUTO_INCREMENT, name  VARCHAR(255), position VARCHAR(255), PRIMARY KEY (employee_id));
CREATE TABLE Accounts(acc_number INT AUTO_INCREMENT, account_type VARCHAR(255), account_holder VARCHAR(255), address VARCHAR(255), opened_date VARCHAR(255), employee_id INT NOT NULL, PRIMARY KEY (acc_number), FOREIGN KEY (employee_id) REFERENCES Employees(employee_id));
INSERT INTO Employees(name, position) VALUES ("Mary Jones", "Operations Manager");
INSERT INTO Employees(name, position) VALUES ("Jennifer Davis", "Operations Manager");
INSERT INTO Employees(name, position) VALUES ("John Smith", "Lead Manager");
INSERT INTO Accounts(account_type, account_holder, address, opened_date, employee_id) VALUES ("Savings", "Robert Wilson", "101 Pine Road, Villagetown, TX 24680", "2022-10-01", (SELECT employee_id FROM Employees WHERE name="Mary Jones"));
INSERT INTO Accounts(account_type, account_holder, address, opened_date, employee_id) VALUES ("FD", "Emily Johnson", "234 Maple Lane Suburbia, FL 13579", "2023-08-16", (SELECT employee_id FROM Employees WHERE name="Mary Jones"));
INSERT INTO Accounts(account_type, account_holder, address, opened_date, employee_id) VALUES ("IRA", "Sarah Brown", "456 Elm Avenue Smalltown, CA 98765", "2010-10-22", (SELECT employee_id FROM Employees WHERE name="Jennifer Davis"));
INSERT INTO Accounts(account_type, account_holder, address, opened_date, employee_id) VALUES ("Savings", "Lisa Martinez", "789 Oak Street Cityville, NY 54321", "2022-10-01", (SELECT employee_id FROM Employees WHERE name="John Smith"));

SELECT a.acc_number, a.account_type, a.account_holder, a.address, a.opened_date, e.employee_id, e.position, e.name from Accounts a LEFT JOIN Employees e on a.employee_id  = e.employee_id; 
