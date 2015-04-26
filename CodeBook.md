## Explanation of the "run_analysis.R" code

The run_analysis.R code generates the "Averages_data" file in the following steps.

1. Read the Training, Test and Subject data.
2. Concatenate Training and Test datasets into one using rbind.
3. Extract only the measurements on the mean and standard deviation into a dataset.
4. After extracting the columns, update column headings in the dataset using the value from the "features" dataset.
5. Descriptive activity names from the "activity_labels" are substituted for numeric values.
6. In the final dataset, column headings are updated to make them more meaningful.
7. An Averages dataset is created with averages for each subject and activity type. 
8. This dataset is written to a text file.

------------------------------------------------------------------------------------------------------

## Variables used in the code

1. The following variables are used to read the data from the corresponding downloaded files:
a) x_train to read X_train.txt

b) x_test to read X_test.txt

c) y_train to read y_train.txt

d) y_test to read y_test.txt

e) subject_train to read subject_train.txt

f) subject_test to read subject_test.txt

2. x_data, y_data and subject_data varaiables are used to hold merged values of the "X", "Y" and "SUBJECT" datasets.

3. mean_and_standard variable is used to extract column names from the "features"" dataset. These column names are  applied to the x_data dataset.

4. activity_desc variable is used to read the activity_labels.txt file. The y_data dataset is updated with the descriptive values of the activities from activity_desc.

5. Averages_data variable contains the Averages of the each subject and activity type. This dataset is written to a text file.