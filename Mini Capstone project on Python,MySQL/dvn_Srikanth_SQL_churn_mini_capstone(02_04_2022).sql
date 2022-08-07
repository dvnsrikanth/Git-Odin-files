create database teleco_churn;
use teleco_churn;
create table Customer_table
(Customer_id VARCHAR(100) NOT NULL,
Gender VARCHAR(20) NOT NULL,
Senior_Citizen VARCHAR(10) NOT NULL,
Partner VARCHAR(10) NOT NULL,
Dependents VARCHAR(10) NOT NULL,
Tenure_Month int not null,
contract varchar(20) not null,
Service_id int,
phoneservice_id int,
In_service_id int,
churn_id int,
PRIMARY KEY (Customer_id));



create table Address_table
(Address_id INT not null auto_increment,
customer_cid varchar(20),
state_id int,
Country_name VARCHAR(20) NOT NULL,
PRIMARY KEY(Address_id),
FOREIGN KEY (customer_cid) REFERENCES Customer_table(Customer_id));

Create table State_table
(State_id int not null auto_increment,
address_aid int,
State_name varchar(20) not null,
primary key(State_id),
FOREIGN KEY (address_aid) REFERENCES Address_table(Address_id));

Create table City_table
(City_id int not null auto_increment,
State_Cid int,
City_name varchar(20) not null,
primary key(City_id),
FOREIGN KEY (State_Cid) REFERENCES State_table(State_id));

Create table Zip_table
(Zip_id int not null auto_increment,
City_cid int,
Zip_Code int not null,
Latitude decimal(10,10) NOT NULL,
Longitude decimal(10,10) NOT NULL,
primary key(Zip_id),
FOREIGN KEY (City_cid) REFERENCES City_table(City_id));

create table phone_services_table
(phoneservice_id int not null auto_increment,
month_id int,
customer_cid varchar(20),
Phone_Service char(10) not null,
Multiple_Lines char(20) not null,
primary key(phoneservice_id),
FOREIGN KEY (customer_cid) REFERENCES Customer_table(Customer_id));

create table Internet_services_table
(In_service_id int not null auto_increment,
month_id int,
customer_cid varchar(20),
Internet_Service char(20) not null,
Online_Security char(20) not null,
Online_Backup char(20) not null,
Device_Protection char(20) not null,
Tech_Support char(20) not null,
Streaming_TV char(20) not null,
Streaming_Movies char(20) not null,
primary key(In_service_id),
FOREIGN KEY (customer_cid) REFERENCES Customer_table(Customer_id));


create table monthly_charges_table
(month_id int not null auto_increment,
phoneservice_cid int,
In_service_cid int,
monthly_charge decimal(10,2) not null,
primary key(month_id),
FOREIGN KEY (phoneservice_cid) REFERENCES phone_services_table(phoneservice_id),
FOREIGN KEY (In_service_cid) REFERENCES Internet_services_table(In_service_id));

create table total_charges_table
(total_id int not null auto_increment,
month_cid int,
Total_charges decimal(10,2) not null,
primary key(total_id),
FOREIGN KEY (month_cid) REFERENCES monthly_charges_table(month_id));


create table payments_table
(payment_id int not null auto_increment,
customer_cid varchar(20),
payment_method char(20) not null,
paperless_billing char(20) not null,
primary key(payment_id),
FOREIGN KEY (customer_cid) REFERENCES Customer_table(Customer_id));



create table churn_table
(churn_id int not null auto_increment,
customer_cid varchar(20),
Churn_Label	char(20) not null,
Churn_Score int not null,
Churn_Reason varchar(50) not null,
CLTV int not null,
primary key(churn_id),
FOREIGN KEY (customer_cid) REFERENCES Customer_table(Customer_id));



















