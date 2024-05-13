# First-Query-Practice
Course: Computación Industrial/database Management
I Parte. Operaciones con tablas
1. Crear la tabla “PruebaCrear” con los valores Id_Prueba, Nombre_Prueba
CREATE TABLE PruebaCrear (Id_Prueba int Not Null, Nombre_Prueba
Varchar(20));
2. Eliminar la tabla “PruebaCrear”.
Drop table PruebaCrear;
3. Modificar la estructura de la tabla compras, cambiando el nombre de la
columna “Descuento” por “ Descuento_Compra”.
Alter table compras change Descuento Descuento_Compra Decimal(10,2);
4. Agregue la columna “Comentarios” a la tabla Materia prima
Alter table compras Add Comentarios Varchar(30);
5. Borre la columna “Comentarios” de la tabla Materia Prima
Alter table compras Drop Comentarios;
II Parte. Operaciones con registros
1. Insertar dos registros a la tabla “Materia prima” utilizando la sintaxis:
Insert Into materia_prima
(Id_MateriaPrima,Nombre_Mp,Id_TipoMP,CostoMP)VALUES (14,”Harina de
banano”, 1, 3500), (15,”Almendras”,2, 5500);
Ejercicio para el estudiante
Inserte tres nuevos registros a la tabla “Proveedores”.
2. En la tabla proveedores, modifique el nombre del proveedor con el código 3,
por “Tierra verde S.A”.
Update Proveedores SET NombreProveedores=” Tierra verde S.A” where
IdProveedores =3;
Ejercicio para el estudiante
Cambie el código del proveedor a 3 en aquellas compras con descuentos igual
o mayores a 5000.
3. Cuando un registro es agregado a la tabla productos, se requiere actualizar el
valor del producto agregándole el 13% del impuesto, pero únicamente a
aquellos con precios mayores a 3000.
UPDATE Productos SET PrecioProducto=PrecioProducto *1,13 WHERE
PrecioProducto >3000;
Ejercicio para el estudiante
Se requiere aplicar un aumento del 5% al costo de la materia prima sin
ninguna excepción.
4. Elimine la compra del “2020-03-15”.
DELETE FROM Compras Where Fecha=” 2020-03-15”;
Ejercicio para el estudiante
Se requiere eliminar los registros de materia prima que pertenezcan a la
categoría de lácteos.
5. Visualizar la lista completa de proveedores con su información.
Select * from Proveedores;
6. Muestre únicamente la fecha de la compra y el monto de aquellas compras
con descuentos mayores o iguales a 3000.
Select Fecha,Monto_Compra From Proveedores Where Descuento>=3000;
Ejercicio para el estudiante:
• Se requiere ver todos los datos de todos los productos que pertenecen a la
categoría de “Panadería”.
• A partir de la tabla “Detalle_Compra”, muestre las cantidades de materia
prima compradas y de la compra número 2.
III Parte. Consultas avanzadas
1. Uso de la cláusula Order By. Se requiere visualizar la lista del nombre y costo
de la materia, sin embargo, se desea que sea presentada de forma descendente
según su costo, es decir empezando por la de mayor costo a la de menor costo.
SELECT Nombre_Mp, CostoMP FROM Materia_Prima ORDER BY CostoMP DESC
Ejercicio para el estudiante:
Se necesita elaborar un informe que muestre una lista ordenada del nombre y
precio de los productos que ofrece su empresa, mostrándolos del más barato al
más caro.
2. Uso de cláusula Group By, Count y Count -Where.
Determine
• ¿Cuántos registros de materia prima se encuentran almacenados en la
base de datos?
Select Count * from Materia_Prima;
• ¿Cuánta materia prima tiene almacenada la empresa del tipo “Frutas y
Vegetales?
Select Count * from Materia_Prima Where Id_TipoMP = 3;
• Muestre la cantidad de registros de materia prima según el tipo al que
pertenecen.
Select Id_TipoMP, Count * from Materia_Prima Group by Id_TipoMP;
Ejercicio para el estudiante:
• ¿Cuántas compras se han realizado hasta el momento?
• ¿Cuántas compras de fresas ha realizado la empresa? Use la tabla
detalle_compras.
• Muestre la cantidad de compras que se han realizado según materia
prima.
3. Uso de Sum, Where y Group By.
• Muestre la suma total de los montos de la tabla “Detalle_Compra”.
Select Sum(Subtotal) from Detalle_Compra;
• Muestre el doble de la suma total, de los montos de la tabla
“Detalle_Compra”
Select Sum(Subtotal*2) from Detalle_Compra;
• ¿Cuánto es el monto total de las compras realizadas de arándanos?
Considere que el arándano en la base de datos se identifica con el código
Select Sum(Subtotal) from Detalle_Compra Where Id_MateriaPrima=7;
• ¿De cuánto es el monto total de las compras realizadas según materia
prima?
Select Id_MateriaPrima, Sum(Subtotal) from Detalle_Compra Group by
Id_MateriaPrima;
Ejercicio para el estudiante.
• ¿Cuál es el monto total de las compras realizadas?
• ¿Qué pasa con las compras si el monto total aumenta en 200.000?
• ¿Cuál es el monto total de las compras realizadas el 1 de febrero del
2020?
• ¿Cuál es el monto total de las compras agrupadas por fecha?
4. Uso de AVG, Where y Group by
• ¿Cuál es en promedio el precio de todos los productos que ofrece la
empresa?
Select AVG(PrecioProducto) from Producto;
• ¿Cuál es en promedio el precio de los productos de panadería? Considere
que en la base de datos se reconoce la panadería con el identificador
Select AVG(PrecioProducto) from Producto where Id_TipoProducto=1;
• Muestre el costo promedio de la materia prima organizándolo por tipo
de materia prima.
Select Id_TipoMP, AVG(CostoMP) from Materia_Prima Group by
Id_TipoMP;
Ejercicio para el estudiante
• ¿Cuál es en promedio el costo de la materia prima que utiliza la empresa?
• ¿Cuál es en promedio el costo de los productos relacionados a “Granos y
Semillas?
• Muestre el precio promedio de los productos que ofrece la empresa
organizados por tipo de producto.
5. Uso de función Max y MIN
• ¿Cuál es el nombre y precio del producto que ofrece la empresa con el
precio más alto?
*Antes de ejecutar esta sentencia vaya a la tabla PRODUCTO – click
derecho opción ALTER TABLE. A la columna “PrecioProducto” cambie el
tipo de datos por “decimal (10,2) ya que el mismo se encuentra como
tipo texto y el resultado no sería adecuado”
Select NombreProducto, Max(PrecioProducto) from Producto;
• ¿Cuál es el nombre y precio del producto que ofrece la empresa con el
precio más bajo?
Select NombreProducto, MIN(PrecioProducto) from Producto;
• Obtenga el nombre y costo de la materia prima con el mayor costo
registrado agrúpelo por tipo de materia prima.
Select Id_TipoMP, Nombre_Mp, CostoMP, Max(CostoMP) from
Materia_Prima GROUP BY Id_TipoMP;
• Obtenga el nombre y costo de la materia prima de la categoría “Granos
y Semillas” con el menor costo registrado. Considere que en la BD ese
tipo se encuentra identificado con 2
Select Nombre_Mp, CostoMP, Max(CostoMP) from Materia_Prima where
Id_TipoMP=2;
Ejercicio para el estudiante
• ¿Cuál es el nombre y costo de la materia prima en la que incurre más
gastos para la empresa?
• ¿En qué fecha se realizó la compra con el menor monto?
• Por tipo de producto, ¿Cuál es el nombre y precio del producto más caro
• Para la compra número 2, obtenga la cantidad comprada del menor
monto de subtotal registrado en detalle_Compra.
6. Uso de los operadores AND y OR
• Muestre el nombre de los productos con precios mayores a 2000 y que
sean del tipo “Panaderia”.
Select NombreProducto from Producto Where PrecioProducto>2000
AND Id_TipoProducto=1;
• Muestre el nombre de la materia prima que pertenece a la categoría
“Dulces” o que tenga un costo igual menor a 5000.
Select Nombre_Mp from Materia_Prima where Id_TipoMp=2 OR
CostoMP<=5000;
Ejercicio para el estudiante
• ¿En qué fecha se realizaron las compras que tienen montos de compra
menor a 21.000 y descuentos mayores a 5000?
• De la tabla detalle_compra, muestre aquellos registros donde el subtotal
sea mayor a 15 mil o sean registros de Bolsas personalizadas.
7. Uso de Between
• Obtenga el nombre y precio de los productos con precios entre los 1000
a los 3000 colones
Select NombreProducto,PrecioProducto from Producto Where
PrecioProducto Between 1000 AND 3000;
Ejercicio para el estudiante:
• Muestre la fecha y el monto de las compras que se encuentren entre los
15 mil a los 20 mil.
• Muestre el nombre de la materia prima cuyo costo se encuentra entre
los 2100 a los 4000 y pertenezca al tipo “Granos y semillas”.
8. Consultas de unión
• De la tabla producto se desea visualizar la siguiente información:
Id_Producto, nombre del producto, precio del producto y el nombre de
la categoría a la que pertenece. Considere que debe utilizar la tabla
Producto y la tabla Tipo_Producto para la consulta.
Select Id_Producto,Nombre_Producto,Precio_Producto,
Nombre_Categoria from Producto Inner Join Categoria_Producto Where
Producto.Id_TipoProducto=Categoria_Producto.Id_TipoProducto;
• Muestre el Código nombre de materia prima y la cantidad que se utiliza
para la elaboración de las Galletas de avena y frutas. Considere que en la
base de datos se identifica por el Id 1. Debe utilizar las tablas Materia
Prima, Detalle Materia Prima y Productos.
Select Nombre_MP,Cantidad_Usada From Detalle_MP Inner Join
Producto ON Detalle_MP.Id_Producto=Producto.Id_Producto Inner Join
Materia_Prima ON
Detalle_MP.Id_MateriaPrima=MateriaPrima.Id_MateriaPrima Where
Id_Producto =1;
Ejercicio para el estudiante
• Se requiere un informe que muestre todos los datos de las compras
realizadas incluyendo: Número de compra, fecha de compra, el nombre
del proveedor, el descuento y monto de la compra.
• Muestre el detalle de la compra realizada el 15 de marzo del 2020,
incluyendo el nombre de la materia prima, la cantidad comprada y el
subtotal.
