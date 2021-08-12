

% Init control polygon
figure;
hold on
plot(xc,yc,'b')
axis([0 140 0 140]);
[x, y] = getpts();
x = x';
y = y';
canManipulatePts = false;

%while (true)
%     clf;
    % Plot control polygon
    plot(x, y, 'g');
    hold on;

    % Allocate Memory for curve
    stepSize = 0.01; % hundreds pts + 1
    u = 0: stepSize: 1;
    numOfU = length(u);
    c = zeros(2, numOfU);

    % Iterate over curve and apply deCasteljau
    numOfPts = length(x);
    pts = [x; y];
    for i = 1: numOfU
        ui = u(i);
        c(:, i) = deCasteljau(ui, pts, numOfPts, numOfPts);
    end

    % Plot curve
    axis([0 140 0 140]);
    plot(c(1, :), c(2, :), '*','color','r');
    canManipulatePts = true;
    varx=c(1, :);
    vary= c(2, :);
    varz=c
savefile='interpolador.mat';
save(savefile,'varz')
%     % Manipulate points
%     if (canManipulatePts)
%         pts = reposition(pts);
%         x = pts(1, :);
%         y = pts(2, :);
%     end
    %end
