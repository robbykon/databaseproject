CREATE TABLE Company_T
             (CompanyID          bigint          NOT NULL,
			  CompanyName        VARCHAR(50),
	          CompanyPhoneNumber     CHAR(10),
              CompanyStreet        VARCHAR(100),              
              CompanyCity       VARCHAR(50),
			  CompanyState		CHAR(2),
              CompanyZipCode  VARCHAR(10),
CONSTRAINT Company_PK PRIMARY KEY (CompanyID));


CREATE TABLE Employee_T
             (EmployeeID          bigint          NOT NULL,
			  EmployeeName        VARCHAR(50),
	          EmployeePhoneNumber     CHAR(10),
              EmployeeStreet        VARCHAR(100),
			  EmployeeCity			VARCHAR(50),              
              EmployeeState       CHAR(2),
              EmployeeZipCode  VARCHAR(10),
			  EmployeeDateofBirth   Date,
			  EmployeeType			CHAR(1),
CONSTRAINT Employee_PK PRIMARY KEY (EmployeeID));

Create TABLE Manager_T
			 (mEmployeeID         bigint           NOT NULL,
CONSTRAINT Manager_PK PRIMARY KEY (mEmployeeID),
CONSTRAINT Manager_FK1 FOREIGN KEY (mEmployeeID) REFERENCES Employee_T(EmployeeID));

Create TABLE Technician_T
			 (tEmployeeID         bigint           NOT NULL,
			  mEmployeeID         bigint,
CONSTRAINT Technician_PK PRIMARY KEY (tEmployeeID),
CONSTRAINT Technician_FK1 FOREIGN KEY (tEmployeeID) REFERENCES Employee_T(EmployeeID),
CONSTRAINT Tecnician_FK2 FOREIGN KEY (mEmployeeID) REFERENCES Manager_T(mEmployeeID));
			  
Create TABLE TechnicianCertificate_T
			 (tEmployeeID         bigint               NOT NULL,
			  Certification		  VARCHAR(100)		   NOT NULL,
CONSTRAINT TechnicianCertificate_PK PRIMARY KEY (tEmployeeID,Certification),
CONSTRAINT TechnicianCertificate_FK1 FOREIGN KEY (tEmployeeID) REFERENCES Technician_T(tEmployeeID));

Create TABLE ManagerInformation_T
			 (mEmployeeID         bigint           NOT NULL,
			  SupervisorID		  bigint		   NOT NULL,
CONSTRAINT ManagerInformation_PK PRIMARY KEY (mEmployeeID,SupervisorID),
CONSTRAINT ManagerInformation_FK1 FOREIGN KEY (mEmployeeID) REFERENCES Manager_T(mEmployeeID),
CONSTRAINT ManagerInformation_FK2 FOREIGN KEY (SupervisorID) REFERENCES Manager_T(mEmployeeID));


CREATE TABLE Plastic_T
             (PlasticID          bigint          NOT NULL,
			  PlasticName        VARCHAR(50),
	          PlasticDescription VARCHAR(100),
              PlasticPrice        Numeric(20,2),              
              mEmployeeID       bigint,
CONSTRAINT Plastic_PK PRIMARY KEY (PlasticID),
CONSTRAINT Plastic_FK1 FOREIGN KEY (mEmployeeID) REFERENCES Manager_T(mEmployeeID));

CREATE TABLE Orders_T
			 (CompanyID        bigint     NOT NULL,
	          PlasticID        bigint     NOT NULL, 
              OrderedQuantity        char(10),
			  OrderDate         DATE DEFAULT GETDATE(),              
CONSTRAINT Orders_PK PRIMARY KEY (CompanyID,PlasticID),
CONSTRAINT Orders_FK1 FOREIGN KEY (CompanyID) REFERENCES Company_T(CompanyID),
CONSTRAINT Orders_FK2 FOREIGN KEY (PlasticID) REFERENCES Plastic_T(PlasticID));

Create TABLE TechnicianWork_T
			 (PlasticID         bigint           NOT NULL,
			  tEmployeeID		bigint		     NOT NULL,
CONSTRAINT TechnicianWork_PK PRIMARY KEY (PlasticID,tEmployeeID),
CONSTRAINT TechnicianWork_FK1 FOREIGN KEY (PlasticID) REFERENCES Plastic_T(PlasticID),
CONSTRAINT TechnicianWork_FK2 FOREIGN KEY (tEmployeeID) REFERENCES Technician_T(tEmployeeID));

CREATE TABLE Material_T
             (MaterialID          bigint          NOT NULL,
			  MaterialName        VARCHAR(50),
	          MaterialDescription   VARCHAR(100),
CONSTRAINT Material_PK PRIMARY KEY (MaterialID));

CREATE TABLE MaterialQuantity_T
             (PlasticID        bigint          NOT NULL,
			  MaterialID        bigint        NOT NULL, 
              MaterialQuantity      char(10),              
CONSTRAINT MaterialQuantity_PK PRIMARY KEY (PlasticID, MaterialID),
CONSTRAINT MaterialQuantity_FK1 FOREIGN KEY (PlasticID) REFERENCES Plastic_T(PlasticID),
CONSTRAINT MAterialQuantity_FK2 FOREIGN KEY (MaterialID) REFERENCES Material_T(MaterialID));

CREATE TABLE Supplier_T
             (SupplierID          bigint          NOT NULL,
			  SupplierName        VARCHAR(50),
CONSTRAINT Supplier_PK PRIMARY KEY (SupplierID));

CREATE TABLE ShippingInformation_T
             (ShippingNumber    bigint          NOT NULL,
			  SupplierID        bigint,         
              MaterialID      bigint,
			  ShippingDate    Date,
			  ArrivalDate     Date,
			  Cost			  Numeric(20,2),
			  Quantity        char(10),      
CONSTRAINT ShippingInformation_PK PRIMARY KEY (ShippingNumber),
CONSTRAINT ShippingInformation_FK1 FOREIGN KEY (SupplierID) REFERENCES Supplier_T(SupplierID),
CONSTRAINT ShippingInformation_FK2 FOREIGN KEY (MaterialID) REFERENCES Material_T(MaterialID));

Create TABLE ManagerNegotiation_T
			 (SupplierID           bigint           NOT NULL,
			  mEmployeeID			bigint           NOT NULL,  
CONSTRAINT ManagerNegotiation_PK PRIMARY KEY (SupplierID,mEmployeeID),
CONSTRAINT ManagerNegotiation_FK1 FOREIGN KEY (SupplierID) REFERENCES Supplier_T(SupplierID),
CONSTRAINT ManagerNegotiation_FK2 FOREIGN KEY (mEmployeeID) REFERENCES Manager_T(mEmployeeID));





select * from Company_T;

INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (1, 'Aeroflight', '4089607896', '6875 Skywalk Dr', 'Santa Clara','CA', '95050');

INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (2, 'Cool Products', '5124569045', '9854 Glitter Road', 'Austin','TX', '73301');

INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (3, 'Light Materials', '7864569234', '6875 Round Circle', 'Albany','NY', '80867');

INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (4, 'Fun Chemicals', '9876578493', '7654 Jason St', 'San Diego','CA', '45934');

INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (5, 'Small Boxes', '6573214221', '4325 Master Dr', 'Chicago','IL', '65434');

INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (6, 'Western Computers', '7869564109', '3456 Smallwood Dr', 'San Jose','CA', '95115');

INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (7, 'Eastern Supplies', '9878900796', '0987 Birchwood St', 'Memphis','TN', '87643');

INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (8, 'Lanterns Plus', '5809184836', '3632 Beach Road', 'Dallas','TX', '21478');
INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (9, 'Furniture Heaven', '4399331355', '9301 Line Circle', 'Miami','FL', '23171');
INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (10, 'Flight Specs', '4974445511', '7731 Rover St', 'Seattle','WA', '22256');
INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (11, 'Polished Materials', '8987884216', '0366 Mary Dr', 'San Antonio','TX', '65786');
INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (12, 'Smart Tech', '4901168651', '9550 Lucky Circle', 'Baltimore','MD', '47635');
INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (13, 'Whole Goods', '7162905521', '9094 Peach St', 'Detriot','MI', '14410');
INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (14, 'Amazing Bikes', '9979244785', '8684 Lonely Road', 'Cleveland','OH', '62855');
INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (15, 'Tiny Tots', '8168859607', '0612 West Circle', 'Charlotte','NC', '31889');
INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (16, 'Rad Metals ', '9102827676', '3912 Harry Dr', 'Dover','DE', '76520');
INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (17, 'Pinewood Products', '5373483686', '5387 Lolipop St', 'Boston','MA', '72287');
INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (18, 'Soutern Charm', '7689675867', '0373 Winner Dr', 'Santa Clara','CA', '76774');
INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (19, 'Lovely Tires', '3450967436', '0852 Terry Circle', 'Phoenix','AZ', '38379');
INSERT INTO Company_T (CompanyID, CompanyName, CompanyPhoneNumber, CompanyStreet, CompanyCity, CompanyState,CompanyZipCode)
VALUES  (20, 'Comfy Chairs', '2114657908', '3826 Youth Road', 'Jacksonville','FL', '64973');


select * from Employee_T;

INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (1, 'Bob Higgins', '4637935613', '5385 Apple Road', 'Austin','TX', '73301','8/27/87','M');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (2, 'Candice Lillins', '3459814839', '6272 Sunset St', 'San Marcos','TX', '73344','6/22/93','T');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (3, 'Joe Eons', '8102464375', '9955 Rose Circle', 'San Antonio','TX', '72356','3/13/82','T');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (4, 'Katrina Smith', '4805389337', '0752 Jerry Ave', 'Austin','TX', '73301','6/11/96','T');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (5, 'Wendy Nun', '2866636658', '7568 Hill St', 'Johnson City','TX', '73307','1/07/74','M');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (6, 'Travis Harden', '1106853801', '6739 Death Dr', 'Lockhart','TX', '73345','7/03/89','T');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (7, 'Paul Davis', '6672437008', '6755 Nancy Ave', 'Taylor','TX', '73423','4/26/81','M');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (8, 'Jill Poppins', '5996028585', '0847 Rocky Road', 'Liberty Hill','TX', '72576','9/30/85','M');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (9, 'Greg Benson', '2916819327', '2374 Skywalker Circle', 'SpiceWood','TX', '79876','11/16/76','T');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (10, 'Larry Samson', '7656487779', '5709 James Dr', 'Marble Falls','TX', '73301','11/09/79','M');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (11, 'Veronica Chung', '8130454504', '8530 Jones Ave', 'Austin','TX', '73301','12/28/66','M');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (12, 'Terrence Johnson', '4255141583', '6775 Tristan Ave', 'San Antonio','TX', '72356','3/18/87','T');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (13, 'Harry Williams', '4113948630', '4603 First St', 'Temple','TX', '73303','5/05/72','M');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (14, 'Grace Park', '6424042511', '4267 Shell Circle', 'San Marcos','TX', '71345','2/15/88','T');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (15, 'Danny Quinn', '0917871845', '2219 Billy Road', 'Austin','TX', '73301','1/24/76','M');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (16, 'Mary Conry', '8077784234', '5291 Lily St', 'Lockhart','TX', '73345','7/23/85','M');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (17, 'Susan Dill', '6081298324', '3785 Poison Ave', 'Lampasas','TX', '75423','5/12/78','T');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (18, 'Duncan Perry', '3976498839', '4352 Blue Road', 'Johnson City','TX', '73307','9/28/92','T');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (19, 'Emily Baker', '2008002287', '8174 Neat St', 'StockDale','TX', '77897','10/21/91','T');
INSERT INTO Employee_T (EmployeeID, EmployeeName, EmployeePhoneNumber, EmployeeStreet, EmployeeCity, EmployeeState,EmployeeZipCode,EmployeeDateofBirth,EmployeeType)
VALUES  (20, 'Patrick Gilbert', '8051955196', '0391 Velvet Dr', 'Nixon','TX', '72345','12/06/86','M');



select * from Manager_T;

INSERT INTO Manager_T(mEmployeeID)
VALUES  (1);
INSERT INTO Manager_T(mEmployeeID)
VALUES  (5);
INSERT INTO Manager_T(mEmployeeID)
VALUES  (7);
INSERT INTO Manager_T(mEmployeeID)
VALUES  (8);
INSERT INTO Manager_T(mEmployeeID)
VALUES  (10);
INSERT INTO Manager_T(mEmployeeID)
VALUES  (11);
INSERT INTO Manager_T(mEmployeeID)
VALUES  (13);
INSERT INTO Manager_T(mEmployeeID)
VALUES  (15);
INSERT INTO Manager_T(mEmployeeID)
VALUES  (16);
INSERT INTO Manager_T(mEmployeeID)
VALUES  (20);

select * from Technician_T;
INSERT INTO Technician_T(tEmployeeID,mEmployeeID)
VALUES  (2,1);
INSERT INTO Technician_T(tEmployeeID,mEmployeeID)
VALUES  (3,1);
INSERT INTO Technician_T(tEmployeeID,mEmployeeID)
VALUES  (4,5);
INSERT INTO Technician_T(tEmployeeID,mEmployeeID)
VALUES  (6,7);
INSERT INTO Technician_T(tEmployeeID,mEmployeeID)
VALUES  (9,8);
INSERT INTO Technician_T(tEmployeeID,mEmployeeID)
VALUES  (12,8);
INSERT INTO Technician_T(tEmployeeID,mEmployeeID)
VALUES  (14,10);
INSERT INTO Technician_T(tEmployeeID,mEmployeeID)
VALUES  (17,11);
INSERT INTO Technician_T(tEmployeeID,mEmployeeID)
VALUES  (18,16);
INSERT INTO Technician_T(tEmployeeID,mEmployeeID)
VALUES  (19,20);

select * from TechnicianCertificate_T;

INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (2,'Thermodynamics');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (2,'Organic Chemistry');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (2,'Heat Displacement');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (3,'Alternate Chemical Processes');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (3,'Materials Chemistry');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (3,'Analytical Spectroscopy');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (4,'Materials Chemistry');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (4,'Thermodynamics');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (4,'Analytical Methods Development');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (6,'Chromatography');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (6,'Materials Chemistry');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (6,'Regulatory Science');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (9,'Materials Chemistry');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (9,'Analytical Spectroscopy');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (9,'Laboratory Testing');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (12,'Laboratory Management');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (12,'Analytical Methods Development');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (12,'Thermodynamics');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (14,'Laboratory Testing');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (14,'Materials Chemistry');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (14,'Analytical Spectroscopy');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (17,'Materials Chemistry');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (17,'Laboratory Testing');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (17,'Analytical Chemistry');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (18,'Materials Chemistry');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (18,'Molecular Diagnostics');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (18,'Organic Chemistry');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (19,'Thermoplastics');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (19,'Laboratory Management');
INSERT INTO TechnicianCertificate_T(tEmployeeID,Certification)
VALUES  (19,'Laboratory Testing');

select * from ManagerInformation_T;
select * from Manager_T;


INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (1,5);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (1,7);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (1,8);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (5,20);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (5,7);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (5,8);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (5,10);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (7,13);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (7,20);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (7,10);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (7,8);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (10,15);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (10,13);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (10,11);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (11,13);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (11,15);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (11,8);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (13,8);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (13,15);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (15,8);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (15,7);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (16,8);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (16,15);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (16,7);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (16,1);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (15,1);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (20,1);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (11,1);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (20,8);
INSERT INTO ManagerInformation_T(mEmployeeID,SupervisorID)
VALUES  (20,15);

1,5,7,10,8,16,15,20,11
select * from Plastic_T;
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (1,'Polypropylene','Very flexible thermoplastic polymer',0.30,1);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (2,'Polymethyl Methacrylate','More resistant type of glass',0.65,1);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (3,'Polycarbonate','Tough, stable plastic used in DVDS and sunglasses',0.37,7);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (4,'Low-Density Polyethylene','Used to make disposable packaging',0.49,8);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (5,'Medium-Density Polyethylene','Plastic used in gas pipes',0.48,10);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (6,'High-Density Polyethylene','Rigid plasitc used in water bottles',0.46,16);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (7,'Ultra-High Molecular Weight Polyethylene','Abrasion resistant material used in military body armor',0.61,7);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (8,'Polyethylene Terephthalate','Strong chemical resistance to organic materials  and used in food containers',0.44,20);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (9,'Rigid Polyvinyl Chloride','Rigid material used in many construction applications',0.55,11);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (10,'Flexible Polyvinyl Chloride','Flexible material used in plumbing and electrical applications',0.48,8);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (11,'ABS','Impact Resistant materials used in automotive industries',0.36,5);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (12,'Polystyrene','Known as styrofoam',0.25,1);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (13,'Polyactic Acid','Highly biodegradable plastic',0.85,20);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (14,'Acrylic','Used in optical devices',0.37,16);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (15,'Nylon','High strength materials used commonly in rope',0.42,7);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (16,'Acetal','High tensile strength plastic used in gears ',1.1,8);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (17,'Polyurethanes','Used in car materials',1.2,11);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (18,'Polyepoxide','Adhesive in electrical components',0.7,1);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (19,'Silicone','Used in cooking instruments',0.45,5);
INSERT INTO Plastic_T(PlasticID,PlasticName,PlasticDescription,PlasticPrice,mEmployeeID)
VALUES  (20,'Polysulfone','Used in filtration devices and membranes',0.39,7);


select * from Orders_T;
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (1,1,2000,'8/27/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (2,11,6000,'7/23/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (3,13,8000,'6/28/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (4,16,10000,'5/13/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (5,18,12000,'2/07/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (6,19,2000,'3/18/17');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (7,14,14000,'5/05/17');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (8,15,11000,'6/06/18');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (9,1,9000,'9/14/17');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (10,3,5000,'10/13/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (11,7,3000,'11/16/17');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (12,8,8000,'8/14/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (13,11,13000,'8/23/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (14,15,15000,'5/21/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (15,17,17000,'4/06/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (16,9,18000,'10/23/18');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (17,8,15000,'4/24/18');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (18,4,13000,'2/11/18');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (19,12,20000,'7/15/18');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (20,17,2000,'8/29/18');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (1,14,6000,'8/27/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (2,16,8000,'7/23/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (3,17,7000,'6/28/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (4,18,3000,'5/13/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (5,19,4000,'2/07/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (6,20,8000,'7/27/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (7,9,2000,'6/30/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (8,4,5000,'4/13/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (9,3,9000,'3/28/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (10,6,11000,'11/29/16');
INSERT INTO Orders_T(CompanyID,PlasticID,OrderedQuantity,OrderDate)
VALUES  (11,9,17000,'12/12/16');

2,3,4,6,9,12,14,17,18,19
select * from TechnicianWork_T;
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (1,2);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (1,3);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (2,2);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (2,6);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (2,9);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (3,19);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (4,19);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (5,18);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (6,6);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (7,12);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (7,3);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (8,2);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (9,2);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (10,2);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (11,6);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (12,9);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (13,9);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (14,3);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (15,2);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (15,3);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (15,9);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (15,4);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (16,9);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (16,3);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (17,4);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (18,17);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (18,18);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (18,19);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (19,17);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (19,18);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (19,19);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (20,4);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (20,6);
INSERT INTO TechnicianWork_T(PlasticID,tEmployeeID)
VALUES  (20,9);

select * from Plastic_T;
select * from Material_T;
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (1,'Ethylene','monomer used in polyethlyene');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (2,'Polybutadiene','Used to help create ABS');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (3,'Acrylontrile','Used in polymeriation of ABS');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (4,'Benzoyl Peroxide','Intiates process to make Low-Density Polythylene');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (5,'Starch','Used in polyactic');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (6,'Propylene','USed to make polypropylene');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (7,'Butane','Used on process to make things like styrene');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (8,'Coal','helps start some of the processes');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (9,'Cellulose','Biodegradable plant tissue');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (10,'Peroxide','catalyzes stuff together');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (11,'Chlorine','helps make PVC');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (12,'Carbon','Used in creation of many polymers');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (13,'Hydrogen','Used in creation of many polymers');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (14,'Nitrogen','USed in the creation of many polymers');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (15,'Sulfur','Used in the creation of many polymers');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (16,'Hydrocarbon chemicals','Seperated in a process then used in forming monomers');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (17,'Xylene','Reactes with chemicals to form momers for nylon, polystyrene');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (18,'Chemical Mixers','Specialized to mix some chemicals together');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (19,'Containers','Helps with mixing product');
INSERT INTO Material_T(MaterialID,MaterialName,MaterialDescription)
VALUES  (20,'Stirring Spoons','Help with the mixing process');

select * from Plastic_T;
select * from MaterialQuantity_T;
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (1,1,5);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (1,19,2);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (1,14,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (1,13,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (2,13,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (2,14,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (3,12,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (3,13,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (4,1,10);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (4,4,5);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (5,1,4);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (5,18,4);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (6,1,5);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (7,1,7);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (8,10,5);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (9,11,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (9,18,3);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (10,11,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (11,2,4);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (11,3,4);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (12,7,7);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (13,5,5);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (13,9,5);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (14,15,4);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (14,16,3);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (15,13,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (15,17,2);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (16,13,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (17,1,4);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (18,8,3);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (18,14,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (19,13,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (19,12,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (19,14,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (20,15,2);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (20,16,1);
INSERT INTO MaterialQuantity_T(PlasticID,MaterialID,MaterialQuantity)
VALUES  (20,20,2);

select * from Supplier_T;
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (1,'Crazy Chemicals');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (2,'Mass Produced Parts');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (3,'Lucky Materials');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (4,'Manufactured Greatness');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (5,'Rad Raw Materials');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (6,'Positive Vibes');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (7,'Amazing Materials');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (8,'Parts Galore');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (9,'Maker Corporaton');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (10,'Raw Mats Inc');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (11,'Top Chemicals');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (12,'Best Products');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (13,'Custom Manufacturing');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (14,'Custom Parts Inc');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (15,'Top Parts');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (16,'Parts R US');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (17,'Big Materials');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (18,'Best Chemicals');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (19,'MD Enterprises');
INSERT INTO Supplier_T(SupplierID,SupplierName)
VALUES  (20,'National Materials');

1,5,7,8,10,11,15,16,20
select * from ManagerNegotiation_T;
select * from Manager_T;
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (1,1);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (1,5);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (2,7);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (2,8);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (3,5);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (3,16);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (4,1);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (4,16);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (5,20);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (6,1);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (6,5);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (7,8);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (7,10);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (8,11);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (9,16);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (10,20);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (11,1);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (11,15);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (11,16);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (12,7);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (13,5);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (13,20);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (14,1);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (15,16);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (16,7);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (17,11);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (18,5);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (19,20);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (20,5);
INSERT INTO ManagerNegotiation_T(SupplierID,mEmployeeID)
VALUES  (20,8);

select * from Plastic_T;
select * from ShippingInformation_T;
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (1,1,1,'8/23/19','8/30/19',200,100);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (2,2,4,'4/12/19','4/19/19',400,500);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (3,3,3,'5/14/18','5/21/19',700,1000);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (4,4,7,'6/21/18','6/30/18',1000,2000);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (5,5,9,'2/12/18','2/17/18',2000,3000);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (6,6,10,'3/11/19','3/17/19',2500,4000);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (7,7,14,'9/07/17','9/13/17',4500,6000);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (8,8,18,'10/14/19','10/24/19',200,300);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (9,9,19,'1/13/17','1/17/17',200,400);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (10,10,11,'4/12/19','4/18/19',350,700);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (11,11,13,'3/13/17','3/15/17',900,1500);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (12,12,16,'8/12/19','8/16/19',550,1300);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (13,13,9,'4/04/18','4/06/18',450,1700);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (14,14,5,'6/19/17','6/25/17',1475,2500);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (15,15,8,'12/12/18','12/17/18',2550,3500);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (16,16,10,'3/13/17','3/25/17',2600,4500);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (17,17,11,'6/05/19','6/12/19',3750,6500);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (18,18,15,'7/12/18','7/18/18',30,80);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (19,19,19,'2/24/19','3/05/19',22,40);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (20,20,2,'3/14/17','3/18/17',12,20);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (21,1,3,'8/23/19','8/30/19',122,200);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (22,1,6,'3/04/19','3/09/19',234,500);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (23,2,12,'4/05/18','4/11/18',256,400);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (24,5,10,'6/14/17','6/23/17',478,800);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (25,7,14,'3/05/18','3/20/18',400,1000);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (26,8,19,'3/12/18','3/16/18',20,60);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (27,10,20,'8/12/17','8/19/17',23,50);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (28,11,11,'8/14/19','8/21/19',204,500);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (29,16,7,'1/01/19','1/08/19',365,750);
INSERT INTO ShippingInformation_T(ShippingNumber,SupplierID,MaterialID,ShippingDate,ArrivalDate,Cost,Quantity)
VALUES  (30,18,8,'5/17/18','5/22/18',546,890);



select * from Employee_T;

	CREATE VIEW Employee_V 
	as
	Select EmployeeID, EmployeeName,EmployeePhoneNumber,EmployeeState,EmployeeType
	From Employee_T;

select * from
Employee_V;

 CREATE VIEW Revenue_V
 as
 select Orders_T.PlasticID,PlasticName,PlasticPrice,OrderedQuantity, (PlasticPrice*OrderedQuantity) as TotalRevenue, OrderDate 
 from Plastic_T INNER JOIN Orders_T
 ON Plastic_T.PlasticID= Orders_T.PlasticID;

 select * from Revenue_V;

 select * from TechnicianWork_T;
 select * from Plastic_T;

  CREATE VIEW Plastic_Manager_Technician
  as
  select Plastic_T.PlasticID, PlasticName, mEmployeeID,tEmployeeID 
  from Plastic_T INNER JOIN TechnicianWork_T
  ON Plastic_T.PlasticID=TechnicianWork_T.PlasticID; 

 select * from Plastic_Manager_Technician;

DELETE FROM Orders_T;

select * from Technician_T;


DROP TABLE ManagerNegotiation_T;
DROP TABLE ShippingInformation_T;
DROP TABLE Supplier_T;
DROP TABLE MaterialQuantity_T;
DROP TABLE Material_T;
DROP TABLE TechnicianWork_T;
DROP TABLE Orders_T;
DROP TABLE Plastic_T;
DROP TABLE TechnicianCertificate_T;
DROP TABLE ManagerInformation_T;
DROP TABLE Manager_T;
DROP TABLE Technician_T;
DROP TABLE Employee_T;
DROP TABLE Company_T;



select * from Company_T;
select * from Employee_T;
select * from Technician_T;
select * from TechnicianCertificate_T;
select * from ManagerInformation_T;
select * from Manager_T;
select * from Orders_T;
select * from Plastic_T;
select * from TechnicianWork_T;
select * from Material_T;
select * from MaterialQuantity_T;
select * from Supplier_T;
select * from ShippingInformation_T;
select * from ManagerNegotiation_T;

select * from Employee_V;

select * from Revenue_V;

select * from Plastic_Manager_Technician;