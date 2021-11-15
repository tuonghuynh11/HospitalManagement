﻿CREATE DATABASE QUANLYBENHVIEN
GO
USE QUANLYBENHVIEN
GO
CREATE TABLE BACSI (
	CMND_CCCD	NVARCHAR(100) PRIMARY KEY,
	HO			NVARCHAR(100),
	TEN			NVARCHAR(100),
	SDT			VARCHAR(20),
	EMAIL		NVARCHAR(100),
	QUOCTICH	NVARCHAR(100),
	DIACHI		NVARCHAR(MAX),
	NGSINH		SMALLDATETIME,
	GIOITINH	BIT,
	VAITRO		NVARCHAR(100),
	CHUYENKHOA	NVARCHAR(100),
	GHICHU		NVARCHAR(MAX),
	IDTO		INT
)
GO
CREATE TABLE YTA (
	CMND_CCCD	NVARCHAR(100) PRIMARY KEY,
	HO			NVARCHAR(100),
	TEN			NVARCHAR(100),
	SDT			VARCHAR(20),
	EMAIL		NVARCHAR(100),
	QUOCTICH	NVARCHAR(100),
	DIACHI		NVARCHAR(MAX),
	NGSINH		SMALLDATETIME,
	GIOITINH	BIT,
	VAITRO		NVARCHAR(100),
	CHUYENKHOA	NVARCHAR(100),
	GHICHU		NVARCHAR(MAX),
	IDTO		INT
)
GO
CREATE TABLE [TO] (
	ID			INT IDENTITY(1,1) PRIMARY KEY,
	IDTANG		INT
)
GO
CREATE TABLE VATTU (
	ID			INT IDENTITY(1,1) PRIMARY KEY,
	DISPLAYNAME	NVARCHAR(100),
	LOAIVATTU	NVARCHAR(100),
	NGSX		SMALLDATETIME,
	SLUONG		INT,
	DVTINH		NVARCHAR(MAX),
	GHICHU		NVARCHAR(MAX),
)
GO
CREATE TABLE TANG (
	ID			INT IDENTITY(1,1) PRIMARY KEY,
	SOTANG		INT,
	SLPHONG		INT
)
GO
CREATE TABLE PHONG (
	ID			INT IDENTITY(1,1) PRIMARY KEY,
	SOPHONG		INT,
	SUCCHUA	INT,
	GHICHU		NVARCHAR(MAX),
	IDTANG		INT
)
GO
CREATE TABLE BENHNHAN (
	CMND_CCCD	NVARCHAR(100) PRIMARY KEY,
	HO			NVARCHAR(100),
	TEN			NVARCHAR(100),
	MABENHNHAN	NVARCHAR(20),
	SDT			VARCHAR(20),
	EMAIL		NVARCHAR(100),
	DIACHI		NVARCHAR(MAX),
	NGSINH		SMALLDATETIME,
	GIOITINH	BIT,
	GIUONGBENH	NVARCHAR(20),
	NGNHAPVIEN	SMALLDATETIME,
	QUOCTICH	NVARCHAR(100),
	GHICHU		NVARCHAR(MAX),
	TINHTRANG	NVARCHAR(MAX),
	BENHNEN		NVARCHAR(MAX),
)
GO
CREATE TABLE [USER] (
	ID			INT IDENTITY(1,1) PRIMARY KEY,
	HO			NVARCHAR(100),
	TEN			NVARCHAR(100),
	USERNAME	NVARCHAR(100),
	[PASSWORD]	NVARCHAR(32),
	EMAIL		NVARCHAR(100),
	NGSINH		SMALLDATETIME,
	GIOITINH	BIT
)
GO
--Thêm ràng buộc
--BACSI
ALTER TABLE BACSI ADD CONSTRAINT BACSI_IDTO_FK FOREIGN KEY (IDTO) REFERENCES [TO](ID)
--YTA
ALTER TABLE YTA ADD CONSTRAINT YTA_IDTO_FK FOREIGN KEY (IDTO) REFERENCES [TO](ID)
--TO
ALTER TABLE [TO] ADD CONSTRAINT TO_IDTANG_FK FOREIGN KEY (IDTANG) REFERENCES [TANG](ID)
--PHONG
ALTER TABLE PHONG ADD CONSTRAINT PHONG_IDTANG_FK FOREIGN KEY (IDTANG) REFERENCES [TANG](ID)
--BENHNHAN
ALTER TABLE BENHNHAN ADD IDPHONG INT
ALTER TABLE BENHNHAN ADD CONSTRAINT BENHNHAN_IDPHONG_FK FOREIGN KEY (IDPHONG) REFERENCES [PHONG](ID)
GO
--Mối kết hợp
CREATE TABLE CHIDINH (
	IDTO		INT,
	IDVATTU		INT,
	CONSTRAINT CHIDINH_PK PRIMARY KEY (IDTO,IDVATTU),
	CONSTRAINT CHIDINH_IDTO_FK FOREIGN KEY (IDTO) REFERENCES [TO](ID),
	CONSTRAINT CHIDINH_IDVATTU_FK FOREIGN KEY (IDVATTU) REFERENCES VATTU(ID)
)
GO

CREATE TABLE SUDUNG (
	IDVATTU		INT,
	IDBENHNHAN	NVARCHAR(100),
	CONSTRAINT SUDUNG_PK PRIMARY KEY (IDVATTU,IDBENHNHAN),
	CONSTRAINT SUDUNG_IDVATTU_FK FOREIGN KEY (IDVATTU) REFERENCES VATTU(ID),
	CONSTRAINT SUDUNG_IDBENHNHAN_FK FOREIGN KEY (IDBENHNHAN) REFERENCES BENHNHAN(CMND_CCCD)
)
