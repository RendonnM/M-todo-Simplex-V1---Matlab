clc
clear all

% Ventana para definir la función objetivo
prompt  = {'Función objetivo = ','Numero de restricciones = '};
lineno  = 1;
title   = 'Ingreso de Datos';
def     = {'[ ]','0'};
options.Resize = 'on';
a       = char(inputdlg(prompt,title,lineno,def,options));
[m,n]   = size(a);
F1   = eval(a(1,:)); %Se transforman los valores (cadena de caracteres) ingresados en la FO a un vector de enteros
nbr     = eval(a(2,1)); %Se transforman los valores (cadena de caracteres) ingresados en el numero de restricciones a un entero
str1    = struct('vari',{},'Type',{});
str2    = struct('var_base',{},'valeur',{});
%=====================================================
C=[];
R=[];
% Ventana para definir coeficinetes de las restricciones
for i=1:nbr %Se definen los coeficientes de restricciones en orden
prompt          = {strcat('Ingrese los valores de los coeficientes para la restriccion  ', num2str(i))};
title           = 'Ingreso de Datos';
def             = {'[ ]'};
options.Resize  = 'on';
c               = char(inputdlg(prompt,title,lineno,def,options));
co              = eval(c);
C=[C;co];
end
% Ventana para definir resultados de las restricciones
for i=1:nbr %Se definen los resultados de restricciones en orden
prompt          = {strcat('Ingrese el resultado para la restriccion  ', num2str(i))};
title           = 'Ingreso de Datos';
def             = {''};
options.Resize  = 'on';
r               = char(inputdlg(prompt,title,lineno,def,options));
ro              = eval(r);
R=[R;ro];
end
Metodo_Simplex(F1,C,R);
