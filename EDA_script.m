
% Load the dataset
data = readtable('retail_sales_dataset.csv');

% Summary statistics
disp('Summary of Numerical Data:');
summary(data);

% Missing values
disp('Checking Missing Values:');
disp(sum(ismissing(data)));

% Visualization: Age distribution
figure;
histogram(data.Age);
title('Age Distribution');
xlabel('Age');
ylabel('Frequency');

% Visualization: Total Amount distribution
figure;
histogram(data.("Total Amount"));
title('Total Amount Distribution');
xlabel('Total Amount');
ylabel('Frequency');

% Visualization: Gender Distribution
figure;
gender_counts = groupsummary(data.Gender);
bar(categorical(gender_counts.Group), gender_counts.GroupCount);
title('Gender Distribution');
xlabel('Gender');
ylabel('Count');

% Visualization: Product Category distribution
figure;
category_counts = groupsummary(data.("Product Category"));
bar(categorical(category_counts.Group), category_counts.GroupCount);
title('Product Category Distribution');
xlabel('Product Category');
ylabel('Count');

% Correlation Heatmap
numerical_data = data{:, {'Age', 'Quantity', 'Price per Unit', 'Total Amount'}};
correlation_matrix = corr(numerical_data, 'Rows', 'complete');
figure;
heatmap({'Age', 'Quantity', 'Price per Unit', 'Total Amount'}, ...
        {'Age', 'Quantity', 'Price per Unit', 'Total Amount'}, correlation_matrix);
title('Correlation Heatmap');
