%Example on the use of AStar Algorithm in an occupancy grid. 
clear


%% Creacion de Mapa:
    % obstaculos o paredes = 1
    % lugares libres donde circular = 0
MAP=int8(zeros(150,120));  % definir tamaño del plano
%% Marcos del invernadero:
MAP(10:140,10)=1; %lateral izquierdo
MAP(10,10:110)=1; %superior
MAP(10:110,110)=1; MAP(110:120,40)=1;MAP(120:130,40)=0;MAP(130:140,40)=1; %lateral derecho
MAP(110,10:20)=1; MAP(110,20:30)=0;MAP(110,30:110)=1;MAP(140,10:40)=1;

    %% OBSTACULOS, SURCOS DE TOMATES:
%SURCO 1:
    MAP(20:50,20)=1; MAP(20:50,30)=1; MAP(20:50,40)=1; MAP(20:50,50)=1;
    MAP(20:50,60)=1; MAP(20:50,70)=1; MAP(20:50,80)=1; MAP(20:50,90)=1;
    MAP(20:50,100)=1;
%SURCO 2:
    MAP(70:100,20)=1; MAP(70:100,30)=1; MAP(70:100,40)=1; MAP(70:100,50)=1;
    MAP(70:100,60)=1; MAP(70:100,70)=1; MAP(70:100,80)=1; MAP(70:100,90)=1;
    MAP(70:100,100)=1;
%Start Positions
StartX=50;
StartY=125;

%Generating goal nodes, which is represented by a matrix. Several goals can be speciefied, in which case the pathfinder will find the closest goal. 
%a cell with the value 1 represent a goal cell
GoalRegister=int8(zeros(150,120));
GoalRegister(28,105)=1;

%Number of Neighboors one wants to investigate from each cell. A larger
%number of nodes means that the path can be alligned in more directions. 
%Connecting_Distance=1-> Path can  be alligned along 8 different direction.
%Connecting_Distance=2-> Path can be alligned along 16 different direction.
%Connecting_Distance=3-> Path can be alligned along 32 different direction.
%Connecting_Distance=4-> Path can be alligned along 56 different direction.
%ETC......

Connecting_Distance=8; %Avoid to high values Connecting_Distances for reasonable runtimes. 

% Running PathFinder
OptimalPath=ASTARPATH(StartX,StartY,MAP,GoalRegister,Connecting_Distance)
% End. 

if size(OptimalPath,2)>1
figure(10)
imagesc((MAP))
    colormap(flipud(gray));

hold on
plot(OptimalPath(1,2),OptimalPath(1,1),'*','color','k')
plot(OptimalPath(end,2),OptimalPath(end,1),'*','color','b')
plot(OptimalPath(:,2),OptimalPath(:,1),'o','color','r')
title("Algoritmo A*")
legend('Goal','Start','Path','location','southeast')

else 
     pause(1);
 h=msgbox('Sorry, No path exists to the Target!','warn');
 uiwait(h,5);
end
savefile='puntosA.mat';
x=OptimalPath(:,2);
xt=transpose(x);
y=OptimalPath(:,1);
yt=transpose(y);
xb=fliplr(xt);
yb=fliplr(yt);
xc=transpose(xb)
yc=transpose(yb)
save(savefile,'xc','yc')