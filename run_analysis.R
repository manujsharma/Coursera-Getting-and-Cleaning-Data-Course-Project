library(plyr)


# 1. Read the Training, Test and Subject data
#-------------------------------------------------------------

x_train <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")

y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")

subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

# 2. Merge the data (by rows) to create one data set each for "X", "Y" and "SUBJECT"
#----------------------------------------------------------------------

# Generate the "X" dataset
x_data <- rbind(x_train, x_test)

# Generate "Y" dataset
y_data <- rbind(y_train, y_test)

# Generate "SUBJECT" dataset
subject_data <- rbind(subject_train, subject_test)

# 3. Extract the mean and standard deviation 
#-----------------------------------------------------------------------

#Read features data
features <- read.table("features.txt")

# Extract rows with "mean" or "std" in the second column of the features dataset
mean_and_standard <- grep("-(mean|std)\\(\\)", features[, 2])

# Update the "X" dataset to have only the mean and standard columns
x_data <- x_data[, mean_and_standard]

# Update column names for "X" dataset to use the column names from the features datset
names(x_data) <- features[mean_and_standard, 2]

# 4. Update the "Y" dataset to use Activity names from the activity_labels data.
#-----------------------------------------------------------------------

#Read activity labels data
activity_desc <- read.table("activity_labels.txt")

# Update "Y" dataset values with activity description from the activity label data
y_data[, 1] <- activity_desc[y_data[, 1], 2]

# Update "Y" dataset column name 
names(y_data) <- "Activity"

# 5. Update subject data set with a descriptive column heading
#----------------------------------------------------------------------

names(subject_data) <- "Subject"

# 6. "Bind" all columns from the "X", "Y" and "SUBJECT" data into a single dataset 
#--------------------------------------------------------------------------------
final_data <- cbind(x_data, y_data, subject_data)

# 7. Create a data set with the average of each variable for each activity and each subject
#------------------------------------------------------------------------------------------

# Calculate Average of the first 66 columns in the final_data dataset. 
Averages_data <- ddply(final_data, .(Subject, Activity), function(x) colMeans(x[, 1:66]))

# 8. Write the Averages_data into a text file
#-----------------------------------------------------------------------------------------
write.table(Averages_data, "Averages_data.txt", row.name=FALSE)