# Course3FinalProj
Final Project for Coursera Course 3

# Description of run_analysis.R
This code does 5 things to create the tidy data set:

Step 1 - Merges the training and the test sets to create one data set.
  This step first combines the 3 training files (subject, measurements and activity) into one dataset, the 3 test files (subject,measurements and activity) into one dataset, then stacks these two tables on top of each other to create one combined dataset.
  
Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
  Columns to keep are determined using two grep regular expressions. This vector is used to filter the combined data table.
  
Step 3 - Uses descriptive activity names to name the activities in the data set
  This step merges in the activity labels data which has a character description of the activity

Step 4 - Appropriately labels the data set with descriptive variable names.
  The features data has very descriptive names. These are recycled as column names for this step.

Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  Using dpylr, this tidy dataset is created by using group by on the Subject & Activity variables then the mean function is applied across all columns the output is written to a txt file per the project instructions


# Code Book
The following is a list of columns for the dataset tidy_summary.txt. This file is a summary by Subject (1-30) and their Activity that shows the mean of a particular metric gathered by Samsung. For more details on which metrics the remaining columns represent, please refer to the metadata here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Subject

Activity_Desc 

tBodyAcc-mean()-X	

tBodyAcc-mean()-Y	

tBodyAcc-mean()-Z	

tGravityAcc-mean()-X	

tGravityAcc-mean()-Y	

tGravityAcc-mean()-Z	

tBodyAccJerk-mean()-X	

tBodyAccJerk-mean()-Y	

tBodyAccJerk-mean()-Z	

tBodyGyro-mean()-X	

tBodyGyro-mean()-Y	

tBodyGyro-mean()-Z	

tBodyGyroJerk-mean()-X	

tBodyGyroJerk-mean()-Y	

tBodyGyroJerk-mean()-Z	

tBodyAccMag-mean()	

tGravityAccMag-mean()	

tBodyAccJerkMag-mean()	

tBodyGyroMag-mean()	

tBodyGyroJerkMag-mean()	

fBodyAcc-mean()-X	

fBodyAcc-mean()-Y	

fBodyAcc-mean()-Z	

fBodyAcc-meanFreq()-X	

fBodyAcc-meanFreq()-Y	

fBodyAcc-meanFreq()-Z	

fBodyAccJerk-mean()-X	

fBodyAccJerk-mean()-Y	

fBodyAccJerk-mean()-Z	

fBodyAccJerk-meanFreq()-X	

fBodyAccJerk-meanFreq()-Y	

fBodyAccJerk-meanFreq()-Z	

fBodyGyro-mean()-X	

fBodyGyro-mean()-Y	

fBodyGyro-mean()-Z	

fBodyGyro-meanFreq()-X	

fBodyGyro-meanFreq()-Y	

fBodyGyro-meanFreq()-Z	

fBodyAccMag-mean()	

fBodyAccMag-meanFreq()	

fBodyBodyAccJerkMag-mean()	

fBodyBodyAccJerkMag-meanFreq()	

fBodyBodyGyroMag-mean()	

fBodyBodyGyroMag-meanFreq()	

fBodyBodyGyroJerkMag-mean()	

fBodyBodyGyroJerkMag-meanFreq()	

tBodyAcc-std()-X	

tBodyAcc-std()-Y	

tBodyAcc-std()-Z	

tGravityAcc-std()-X	

tGravityAcc-std()-Y	

tGravityAcc-std()-Z	

tBodyAccJerk-std()-X	

tBodyAccJerk-std()-Y	

tBodyAccJerk-std()-Z	

tBodyGyro-std()-X	

tBodyGyro-std()-Y	

tBodyGyro-std()-Z	

tBodyGyroJerk-std()-X	

tBodyGyroJerk-std()-Y	

tBodyGyroJerk-std()-Z	

tBodyAccMag-std()	

tGravityAccMag-std()	

tBodyAccJerkMag-std()	

tBodyGyroMag-std()	

tBodyGyroJerkMag-std()	

fBodyAcc-std()-X	

fBodyAcc-std()-Y	

fBodyAcc-std()-Z	

fBodyAccJerk-std()-X	

fBodyAccJerk-std()-Y	

fBodyAccJerk-std()-Z	

fBodyGyro-std()-X	

fBodyGyro-std()-Y	

fBodyGyro-std()-Z	

fBodyAccMag-std()	

fBodyBodyAccJerkMag-std()	

fBodyBodyGyroMag-std()	

fBodyBodyGyroJerkMag-std()


