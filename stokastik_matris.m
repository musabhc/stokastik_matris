clc;
clear;
n = randi([6,10]);
A = rand(n);
% 0.2den büyükleri 0 ile 0.2 arasında değiştiriyoruz
for x= 1:n
    for y=1:n
        while A(x,y) > 0.2
            A(x,y) = rand();
        end
    end
end
% Dönüştürülmüş matrise bakıyoruz
disp('Matrisin ilk hali')
disp(A)
% Burada dönüştürmeyi yapıyoruz
toplam = zeros(n,1);
degisenMiktari = 0;
maksimumDeger = max(A,[],2)
for x=1:n
    for y=1:n
        toplam(x) = toplam(x) + A(x,y);
    end
    disp(toplam);
    if(toplam(x) > 1.0000)
        z = n;
        while(toplam(x)>1.0000)
            while(maksimumDeger(x,1) ~= A(x,z))
                z = z - 1;
            end
            toplam(x) = toplam(x) - A(x,z);
            A(x,z) = 0
            maksimumDeger = max(A,[],2)
            if(toplam(x) ==1)
                degisenMiktari = degisenMiktari + 1;
            end
            z = n
        end
        if(toplam(x) < 1.0000)
            A(x,z) = 1-toplam(x);
            toplam(x) = toplam(x) + A(x,z);
            degisenMiktari = degisenMiktari + 1;
        end
    elseif(toplam(x) < 1.0000)
        deger = 1- toplam(x);
        degisenMiktari = degisenMiktari + 1;
        toplam(x) = toplam(x) - A(x,n);
        A(x,n) = A(x,n) + deger;
        toplam(x) = toplam(x) +A(x,n); 
    end
end
disp('Matrisin son hali')
disp(A)
disp('Toplam kontrolü')
disp(toplam)
disp('DEĞİŞEN MİKTARI!')
disp(degisenMiktari)
