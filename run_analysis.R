#Note for graders
#Working directory should contain the FOLDER for the UCI HAR Dataset;
#Currently library for dplyr is commented out - this needs to be loaded if your session
#does not have this library reference
#
#Step 1 - Merges the training and the test sets to create one data set.
#Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
#Step 3 - Uses descriptive activity names to name the activities in the data set
#Step 4 - Appropriately labels the data set with descriptive variable names.
#Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
#

###########################################################################################
#load all data sets
#setwd("~/Documents/DataScientistsToolBox/WDforCoursera/C3FinalProj")
#install.packages("dplyr")
#library(dplyr)
activity_lab <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

#load training dataset
raw_train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE)
train_data_heads <- read.table("./UCI HAR Dataset/train/Y_train.txt", stringsAsFactors = FALSE)
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)

#load test data set
raw_test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_data_heads <- read.table("./UCI HAR Dataset/test/Y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)

#Step 1 - Merges the training & test sets to create 1 data set

#merge datasets
train_data <- cbind(raw_train_data, train_data_heads, train_subject)
test_data <- cbind(raw_test_data, test_data_heads, test_subject)

combo_data <-rbind(train_data,test_data)

#Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
#Columns to keep are determined using two grep regular expressions. This vector is used to filter
#the combined data table.
m_cols <- grep("mean",features$V2)
s_cols <- grep("std", features$V2)
keep_cols <-c(m_cols,s_cols,ncol(combo_data)-1,ncol(combo_data))
combo_data2 <- combo_data[,keep_cols]

#Step 3 - Uses descriptive activity names to name the activities in the data set
#This step merges in the activity labels data which has a character description of the activity
combo_data3 <- merge(combo_data2, activity_lab, by.x = "V1.1", by.y = "V1")

#Step 4 - Appropriately labels the data set with descriptive variable names.
#The features data has very descriptive names. These are recycled as column names for this step.
m_col_names <- as.character(features[m_cols, 2])
s_col_names <- as.character(features[s_cols, 2])
desc_labels <- c("Activity_Code", m_col_names, s_col_names, "Subject", "Activity_Desc")

colnames(combo_data3) <- desc_labels

#Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
#Using dpylr, this tidy dataset is created by using group by on the Subject & Activity variables
#then the mean function is applied across all columns
#the output is written to a txt file per the project instructions
tidy_summary <- tbl_df(combo_data3) %>%
group_by (Subject, Activity_Desc) %>%
summarize_each(funs(mean(.))) %>%
select(-Activity_Code) %>%
write.table(file="./tidy_summary.txt",row.name=FALSE)
  
  
  
  
  
x