-- NUMERO DE PERMISO QUE EXISTE EN CADA CUADRA 
SELECT COUNT("Record ID"), pathTable.block AS CUADRA 
FROM permit_table
INNER JOIN pathTable ON PathTable.ID = permit_table.pathID
GROUP BY block;

--NUMERO DE PERMISOS QUE TIENEN FECHA DE EXPEDISIÓN 
SELECT "Record ID", COUNT(dateTable."Permit Experation Date")
FROM permit_table
INNER JOIN dateTable ON dateTable.ID =  permit_table.DateID
GROUP BY "Record ID";



--COSTO TOTAL ESTIMADO POR EL TIPO DE PERMISO  MOSTRANDO LOS QUE TENGAN MAYOR A 5000 SU TOTAL 
SELECT permitType."permit Type Definition", SUM("Estimated Cost") AS TOTAL
FROM permit_table
INNER JOIN permitType ON permiteType."Permit Type" = permit_table."Permit Type"
GROUP BY permitType."permit Type Definition"
HAVING TOTAL >5000;


--COSTO revisaco DE las diferentes calles registradas.
SELECT street."Street Name", SUM(permit_table."Revised Cost")
FROM permit_table
INNNER JOIN pathTable ON  pathTable.ID = permit_table.PathID
INNER JOIN Street ON Street.ID =pathTable."Steet ID"
GROUP BY street."Street Name";


--CUANTAS PERMISOS ESTAN HABILITADOS CON LOS DIFERENTES TIPO DE CONTRUCCIÓN  EXISTENTE.
SELECT COUNT("Record ID"), contEx."Existing Costruction Type Description" AS Construcción
FROM permit_table
INNER JOIN contEx ON contEx."Existing Construction type" = permit_table."Existing Construction type"
GROUP BY Construcción;



