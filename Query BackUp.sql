USE AdventureWorksDW2012
GO

BACKUP DATABASE AdventureWorksDW2012
TO DISK  = N'L:\BackUps\BkFull_AdventureWorksDW2012.bak'
WITH 
 NAME = 'BackUp Full base de datos AdventureWorksDW2012'
,DESCRIPTION = 'Copia generada como inicio  de Proceso'
,INIT, COMPRESSION 

RESTORE HEADERONLY FROM DISK = N'L:\BackUps\BkFull_AdventureWorksDW2012.bak'
RESTORE FILELISTONLY FROM DISK = N'L:\BackUps\BkFull_AdventureWorksDW2012.bak'

--USE master
--GO

--RESTORE DATABASE AdventureWorksDW2012
--FROM DISK = N'L:\BackUps\BkFull_AdventureWorksDW2012.bak'
--WITH RECOVERY