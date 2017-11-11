CREATE TABLE client_entity
(Id_client NUMBER(9),
Fname VARCHAR2(30),
Lname VARCHAR2(30),
Address VARCHAR2(100),
Tel VARCHAR2(30),
E_mail VARCHAR2(30),
SSN NUMBER(9),
STATUS VARCHAR2(30),
CONSTRAINT cl_ent_Id_client_pk PRIMARY KEY (Id_client));

CREATE TABLE Account_type
(Number_account NUMBER(9),
Type_account VARCHAR2(30),
Desc_account VARCHAR2(30),
CONSTRAINT ac_type_Number_account_pk PRIMARY KEY (Number_account));

CREATE TABLE Charge_type_insurance
(Type_charge VARCHAR2(30),
Desc_charge VARCHAR2(90),
Rate_charge FLOAT(9),
Period_calc_charge VARCHAR2(30),
Day_pay_charge VARCHAR2(30),
CONSTRAINT t_charge_Type_charge_pk PRIMARY KEY (Type_charge));

CREATE TABLE Commission_type
(Type_commission VARCHAR2(30),
Desc_commission VARCHAR2(90),
Rate_commission Float(9),
Period_calc_commission VARCHAR2(30),
Day_pay_commission VARCHAR2(130),
CONSTRAINT com_type_Type_commission_pk PRIMARY KEY (Type_commission));

CREATE TABLE Penalties_type
(Type_penalties VARCHAR2(30),
Desc_penalties VARCHAR2(90),
Rate_penalties Float(9),
Period_calc_penalties VARCHAR2(30),
Day_pay_penalties VARCHAR2(130),
CONSTRAINT penal_type_Type_penalties_pk PRIMARY KEY (Type_penalties));

CREATE TABLE Account_entity
(Id_client NUMBER(9),
Number_account NUMBER(9),
Type_account VARCHAR2(30),
Balance NUMBER(9), 
Limit_account NUMBER(9), 
Type_penalties VARCHAR2(30),
Amount_penalties NUMBER(9),
Type_charge VARCHAR2(30),
Amount_charge NUMBER(9),
Type_commission VARCHAR2(30),
Amount_commission Float(30),
CONSTRAINT ac_ent_Id_cl_Nacc_pk PRIMARY KEY (Id_client, Number_account),
CONSTRAINT ac_ent_Number_account_fk FOREIGN KEY (Number_account) REFERENCES Account_type(Number_account),
CONSTRAINT ac_ent_Id_client_fk FOREIGN KEY (Id_client) REFERENCES client_entity(Id_client),
CONSTRAINT ac_ent_Type_penalties_fk FOREIGN KEY (Type_penalties) REFERENCES Penalties_type(Type_penalties),
CONSTRAINT ac_ent_Type_charge_fk FOREIGN KEY (Type_charge) REFERENCES Charge_type_insurance(Type_charge),
CONSTRAINT ac_ent_Type_commission_fk FOREIGN KEY (Type_commission) REFERENCES Commission_type(Type_commission));


INSERT INTO client_entity VALUES
(1, 'Sola', 'Robertson', '10-123 1/2 MAIN STREET NW MONTREAL QC  H3Z 2Y7 CANADA','514-255-09-85', 'sRobert@gmail.com', 12345698, 'ACTIVE');
INSERT INTO client_entity VALUES
(2, 'Mukola', 'Maistrenko', '805 Saint Denis STREET NW MONTREAL QC  H1Z 1X3 CANADA','514-025-25-12', 'mMaistrenko@gmail.com', 89512363, 'ACTIVE');
INSERT INTO client_entity VALUES
(3, 'Ivan', 'Tuchenko', '2603 Jeanne DArc avenue NW MONTREAL QC  H1Z 2L8 CANADA','514-635-12-31', 'iTuchenko@gmail.com', 15963874, 'ACTIVE');
INSERT INTO client_entity VALUES
(4, 'Zoya', 'Kimenko', '1023 Saint Catherine Montreal QC  H2Z 2B7 CANADA','514-295-31-85', 'zKimenko@gmail.com', 12345698, 'ACTIVE');
INSERT INTO client_entity VALUES
(5, 'Kurulo', 'Karpenko', '361A Old Finch Avenue Toronto, Ontario M1B 5K7 CANADA','416-392-5929', 'kKarpenko@gmail.com', 59634856,'ACTIVE');
INSERT INTO client_entity VALUES
(6, 'Mousiy', 'Luvanenko', '500 Kingston Rd Toronto ON M4L 1V3 Toronto,Ontario','416-392-9114', 'mLuvanenko@gmail.com', 54698753, 'ACTIVE');
INSERT INTO client_entity VALUES
(7, 'John', 'Smith', '315 St Germain Ave Toronto ON M5M 1W4, Toronto ,Ontario','416-322-7518', 'jSmith.com', 45698756,'ACTIVE');

INSERT INTO Account_type VALUES
(26001, 'CA2600', 'cheking account');
INSERT INTO Account_type VALUES
(26002, 'CA2600', 'cheking account');
INSERT INTO Account_type VALUES
(28001, 'DA2800', 'deposit account');
INSERT INTO Account_type VALUES
(28002, 'DA2800', 'deposit account');
INSERT INTO Account_type VALUES
(29000, 'DA2900', 'credit account');
INSERT INTO Account_type VALUES
(29001, 'DA2900', 'credit account');
INSERT INTO Account_type VALUES
(29002, 'DA2900', 'credit account');
INSERT INTO Account_type VALUES
(29003, 'DA2900', 'credit account');
INSERT INTO Account_type VALUES
(29004, 'DA2900', 'credit account');
INSERT INTO Account_type VALUES
(30000, 'IA3000', 'investment account');
INSERT INTO Account_type VALUES
(30001, 'IA3000', 'investment account');

INSERT INTO Charge_type_insurance VALUES
('CIP4000', 'Charge of personal insurance for credit account', 0.005, '365', '31.12.2017');
INSERT INTO Charge_type_insurance VALUES
('CIPL4000', 'Charge of pledge for credit account', 0.5, '365', '31.12.2017');
INSERT INTO Charge_type_insurance VALUES
('CIC4000', 'Charge of student for credit account', 0.003, '365', '31.12.2017');
INSERT INTO Charge_type_insurance VALUES
('CIC0', 'NO Charge', 0.0, '0', '0');


INSERT INTO Commission_type VALUES
('C500', 'Commission for using cheking account', 0.003, '30', '30.09.2017 30.10.2017');
INSERT INTO Commission_type VALUES
('C501', 'Commission for using credit account', 0.005, '30', '30.09.2017 30.10.2017');
INSERT INTO Commission_type VALUES
('C502', 'Commission for using investment account,', 0.004, '30', '30.09.2017 30.10.2017');
INSERT INTO Commission_type VALUES
('C0', 'NO Commission', 0.0, '0', '0');


INSERT INTO Penalties_type VALUES
('P3600', 'Penalties for late paying interest for credit account', 0.1, '1', '5 days after lated/missed paying');
INSERT INTO Penalties_type VALUES
('P3601', 'Penalties for late returning amount of credit for credit account', 0.2, '1', '5 days after lated/missed paying');
INSERT INTO Penalties_type VALUES
('P0', 'NO Penalties', 0, '0', '0');


INSERT INTO Account_entity VALUES
(1, 26001, 'CA2600', 10000, 0, 'P0', 0, 'CIC0', 0, 'C500', 30);
INSERT INTO Account_entity VALUES
(1, 29000, 'DA2900', 10000, 50000, 'P3600', 0, 'CIPL4000', 2500, 'C501', 50);
INSERT INTO Account_entity VALUES
(2, 29001, 'DA2900', 10000, 50000, 'P3600', 0, 'CIPL4000', 2500, 'C501', 50);
INSERT INTO Account_entity VALUES
(3, 29002, 'DA2900', 10000, 50000, 'P3600', 0, 'CIPL4000', 2500, 'C501', 50);
INSERT INTO Account_entity VALUES
(5, 29003, 'DA2900', 10000, 50000, 'P3600', 0, 'CIPL4000', 2500, 'C501', 50);
INSERT INTO Account_entity VALUES
(5, 29004, 'DA2900', 10000, 50000, 'P3600', 0, 'CIPL4000', 2500, 'C501', 50);
commit;

set linesize 350;

//////////////////////////////
DROP TABLE Account_entity CASCADE CONSTRAINTS;
DROP TABLE client_entity CASCADE CONSTRAINTS;
DROP TABLE Account_type CASCADE CONSTRAINTS;
DROP TABLE Charge_type_insurance CASCADE CONSTRAINTS;
DROP TABLE Commission_type CASCADE CONSTRAINTS;
DROP TABLE Penalties_type CASCADE CONSTRAINTS;

select table_name from user_tables;


select Id_client, Number_account, Type_account, Limit_account, Type_charge, Amount_charge
from Account_entity
where Id_client = 1
and Number_account = 26001;

select * from client_entity;
select * from Account_type;
select * from Charge_type_insurance;
select * from Commission_type;
select * from Penalties_type;
select * from Account_entity;

describe client_entity;
describe Account_type;
describe Charge_type_insurance;
describe Commission_type;
describe Penalties_type;
describe Account_entity;




'for testing:
insert new value client ID 5 number Account 29004 
Type account DA2900 Limit 500000 Type Charge CIP4000 

'testing seaching 1 29000

'for testing UPDATE:
 client ID 5 number Account 29004 
Type account DA2900 Limit 30000 Type Charge CIPL4000 


/////////////////////PART2  FOR TESTING CLIENT APPLICATION 

select client_entity.Id_client, client_entity.Fname, client_entity.Lname,
Account_entity.Number_account,Account_entity.Type_account, Account_type.Desc_account,
Account_entity.Balance, Account_entity.Limit_account 
from client_entity, Account_entity, Account_type
where client_entity.Id_client = Account_entity.Id_client and Account_entity.Number_account = Account_type.Number_account and client_entity.Id_client = 2;

//test / search info for clientusing client id
select Fname, Lname, Address, Tel, E_mail, SSN
from client_entity
where Id_client = 10;


////FOR TESTING COMMISSION APPLICATION
UPDATE : 1 26001 C500 
INSERT NEW: 5 26001 C500 (id client 5, 26001 type cheking account, C500 commission for cheking account)
			4 29004 C501 (id client 4, 29004 credit account, C501 commission for credit account)
			4 30001 C502 (id client 4, 30001 investment account, C502 C502 - Commission for using investment account, rate – 0.4% )
			
			
SELECT * FROM ACCOUNT_ENTITY;		

select client_entity.Id_client, client_entity.Fname, client_entity.Lname,
Account_entity.Number_account,Account_entity.Type_account, Account_type.Desc_account,
Account_entity.Balance, Account_entity.Limit_account, Account_entity.type_commission, Account_entity.amount_commission
from client_entity, Account_entity, Account_type
where client_entity.Id_client = Account_entity.Id_client and Account_entity.Number_account = Account_type.Number_account and Account_entity.type_commission = 'C501';


