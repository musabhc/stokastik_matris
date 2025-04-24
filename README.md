# Matrix Transformation and Adjustment Script

This MATLAB script generates a random matrix, modifies its elements based on specific conditions, and ensures that the sum of each row equals 1. Here's a breakdown of the functionality:

## Description
The script performs the following operations:

1. **Random Matrix Generation**: 
   - A random square matrix of size `n x n` is generated, where `n` is a random integer between 6 and 10.
   - Each element of the matrix is a random value between 0 and 1.
   
2. **Modification of Matrix Elements**:
   - The script checks if any element in the matrix is greater than 0.2. If it is, the value of that element is replaced with a new random value between 0 and 1.

3. **Adjustment to Ensure Row Sums to 1**:
   - The script computes the sum of elements for each row. If the sum exceeds 1, it reduces the value of the largest element in that row (replacing it with 0) until the sum is exactly 1.
   - If the sum is less than 1, the script adds the difference to the last element in the row, adjusting it to ensure the sum equals 1.

4. **Display Results**:
   - The initial and final matrix are displayed.
   - The sum of each row after transformation is shown.
   - The number of changes made to the matrix is displayed.

## Code Explanation

```matlab
clc;
clear;

% Generate a random size for the matrix between 6 and 10
n = randi([6, 10]);

% Create a random n x n matrix
A = rand(n);

% Modify values greater than 0.2 to new random values between 0 and 1
for x = 1:n
    for y = 1:n
        while A(x,y) > 0.2
            A(x,y) = rand();
        end
    end
end

% Display the initial matrix
disp('Matrisin ilk hali');
disp(A);

% Initialize variables
toplam = zeros(n, 1); % Row sum array
degisenMiktari = 0;   % Counter for the number of changes
maksimumDeger = max(A, [], 2); % Maximum value in each row

% Row sum adjustment loop
for x = 1:n
    for y = 1:n
        toplam(x) = toplam(x) + A(x, y);
    end
    disp(toplam);
    
    % If the row sum exceeds 1, adjust by setting the largest element to 0
    if (toplam(x) > 1.0000)
        z = n;
        while (toplam(x) > 1.0000)
            while (maksimumDeger(x, 1) ~= A(x, z))
                z = z - 1;
            end
            toplam(x) = toplam(x) - A(x, z);
            A(x, z) = 0;
            maksimumDeger = max(A, [], 2);
            if (toplam(x) == 1)
                degisenMiktari = degisenMiktari + 1;
            end
            z = n;
        end
    % If the row sum is less than 1, add the difference to the last element
    elseif (toplam(x) < 1.0000)
        deger = 1 - toplam(x);
        degisenMiktari = degisenMiktari + 1;
        toplam(x) = toplam(x) - A(x, n);
        A(x, n) = A(x, n) + deger;
        toplam(x) = toplam(x) + A(x, n);
    end
end

% Display the transformed matrix
disp('Matrisin son hali');
disp(A);

% Display row sums after adjustment
disp('Toplam kontrolü');
disp(toplam);

% Display the number of changes made
disp('DEĞİŞEN MİKTARI!');
disp(degisenMiktari);
