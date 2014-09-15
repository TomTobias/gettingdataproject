gettingdataproject
==================

##Introduction to the data
The experiments have been carried out with a group of 30 volunteers within an age
bracket of 19-48 years. Each person performed six activities (WALKING,
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate
of 50Hz. The experiments have been video-recorded to label the data manually. The
obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers
was selected for generating the training data and 30% the test data. 

Our task in this project was to put this data back together into one set and then focus
on doing further processing on a subset of the data...to take the mean of all the columns
that have "mean" or "sd" in the column name. The raw data is located at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To run the code download and unzip the data above. Change the setwd() command in the
run_analysis.R to point to the data and then run it. The next section says how the data
is transformed by run_analysis.R.

## How the data was processed using **run_analysis.R**
The run_anaylsis.R code does the following things:
- read and combine the training and test Subject data into a dataframe
- read and combine the training and test Activity data into a dataframe
- read and combine the training and test human activity data into a single dataframe
- adds column names to the data
- Combine the Subject, Activity, and Human Activity data into a single dataframe
- Replace the activity codes numbers in the activity column into meaningful text
- Trim the data down from 561 data columns to the 79 that are labelled as mean or SD
- Summarize the remaining data by taking the mean for each Subject-Activity combination
- Save the summarized table to a file named tidydata.txt
- Use the following code to load this file
	> read.table("tidydata.txt", sep = "\t", header = TRUE)


## codebook.md
There is also a code book (codebook.md) in this github which describes the individual
data fields.


