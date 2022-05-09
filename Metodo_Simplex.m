function Metodo_Simplex(F1,A,b)
iterM=100; %Máximo de iteraciones (100)
In=size(A,1); %%Cantidad de inecuaciones
Fo=F1.*-1; 
Tabla= [Fo zeros(1,In) 0       %Tabla
      A eye(In) b];

for iter=1: 1: iterM             %Finalizacion del código
    fin=Tabla (1,1: end-1) <0;
     if fin==0
         break
     end

     [a,c]=min (Tabla (1,:));    %Determina columna pivote
     razones=Tabla(:,end)./Tabla(:,c); %Columna pivote dividida en las respectivas soluciones
     i=razones<=0;
     d=razones;
     d(i)=inf;
     [b,f]=min(d);             %Número menor de las razones
     Tabla(f,1:end)=Tabla(f,:)/Tabla(f,c);%Fila pivote dividida en el elemente pivote
     
     for i= 1:1:size(Tabla,1)

         if i~=f
             Tabla(i,:)=Tabla(i,:)-(Tabla(i,c)*Tabla(f,:));
         end
     end
     
     format rational
     Tabla;
     %Mostrar las iteraciones realizadas.
     Tablaiter=Tabla; %Se copia la tabla con la que se esta trabajando.
     control=Tabla(1,:); %Se copia la fila control.
     Tablaiter(1,:)=[ ]; %Se agrega la fila control al final de la tabla.
     Tablaiter=[Tablaiter;control] %Se muestra la tabla segun la iteracion.
end
