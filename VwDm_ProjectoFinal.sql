USE AdventureWorksDW2012
GO

CREATE VIEW Dm_ProjectFinal
AS

SELECT 
		 DC.CustomerKey
		,DC.YearlyIncome						AS CUSTOMERSALARY
		,DATEDIFF(YEAR,DC.BirthDate,GETDATE())	AS AGE
		,DC.MaritalStatus						AS ESTADOCIVIL
		,DC.NumberCarsOwned						AS TieneCarro
		,DC.HouseOwnerFlag						AS TieneCasa
		,CASE WHEN DC.YearlyIncome > 50000
		AND DATEDIFF(YEAR,DC.BirthDate,GETDATE()) > 35		
		AND DC.NumberCarsOwned > 0 then 1 else 0 end	AS ProspectiveBuyer

FROM 	[dbo].[DimProductSubcategory]			AS DPSC
INNER JOIN [dbo].[DimProduct]					AS DM
ON DPSC.ProductSubcategoryKey = DM.ProductSubcategoryKey
INNER JOIN [dbo].[FactInternetSales]			AS FIS
ON DM.ProductKey =FIS.ProductKey
INNER JOIN [dbo].[DimCustomer]					AS DC
ON FIS.CustomerKey = DC.CustomerKey
INNER JOIN [dbo].[DimGeography]					AS DG
ON DC.GeographyKey = DG.GeographyKey
 
WHERE 
	[SpanishProductSubcategoryName]	IN ('Bicicleta de montaña','Bicicleta de carretera','Bicicleta de paseo')
AND [SpanishProductName]  <> 'Casco deportivo: 100, rojo' 
OR  [SpanishProductName]   <> 'Casco deportivo: 100, azul'
OR  [SpanishProductName]   <> 'Casco deportivo: 100, negro'
AND 
	DC.MaritalStatus	IN ('S','M')
AND 
	DC.HouseOwnerFlag	IN (0,1)
AND 
	DG.SpanishCountryRegionName		IN ('Estados Unidos','Australia','Canada','Alemania','Francia')
	
