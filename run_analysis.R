# run_analysis.R   Getting Data Project

# setwd("~/coursera/gettingdata/gettingdataproject/UCI HAR Dataset")
library(dplyr)
library(tidyr)

# Objective 1: Merge the training and the test sets to create one data set
# Create a Subject (Person doing the test) Column with name "Subject"
subject_train <- read.table("train/subject_train.txt", sep = "", header = FALSE)
subject_test <- read.table("test/subject_test.txt", sep = "", header = FALSE)
subjectdf <- rbind(subject_train, subject_test)
names(subjectdf) <- c("Subject") # subject column heading

# Create an Activity (what the person is doing) Column with name "Activity"
y_train <- read.table("train/y_train.txt", sep = "", header = FALSE)
y_test <- read.table("test/y_test.txt", sep = "", header = FALSE)
activitydf <- rbind(y_train, y_test)
names(activitydf) <- c("Activity") # activity column heading

# Combine the test results data columns
X_train <- read.table("train/X_train.txt", sep = "", header = FALSE)
X_test <- read.table("test/X_test.txt", sep = "", header = FALSE)
featuresdf <- rbind(X_train, X_test)

# Objective 4: Appropriately label the data set with descriptive variable names
features <- read.table("features.txt", sep = "", header = FALSE) # colume names file
names(featuresdf) <- as.character(features$V2) # data column headings

# Bind the 3 dataframes together by columns into one full dataframe
fulldf <- cbind(subjectdf, activitydf, featuresdf)

# Objective 3: Uses descriptive activity names to name the activities in the data set
# (replace activity numbers with meaningful names from the activity_labels.txt file)
activitylabels <- read.table("activity_labels.txt", sep = "", header = FALSE)
activitylist <- as.character(activitylabels[,2])
fulldf$Activity <- activitylist[fulldf$Activity]

# list the names in the df that contain std or mean
# names(fulldf[grep(".*mean().*|.*std().*", names(fulldf))])

# Objective 2: Extract only the measurements on the mean and standard deviation for each measurement.
# (make a new df out of the first two columns of fulldf and just the columns containing names 
#  with "std" or "mean")
tempsubdf<-fulldf[grep(".*mean().*|.*std().*", names(fulldf))]
subdf <- cbind(fulldf[1], fulldf[2], tempsubdf)

# Objective 5: From the resulting data set, creates a second, independent tidy data set with the
# average of each variable for each activity and each subject
tidydataset <-subdf %>%
              group_by(Subject, Activity, add = FALSE) %>%
              summarise_each(funs(mean))

# write out the table
write.table(tidydataset, "tidydata.txt", sep = "\t", row.name=FALSE)

# example of how to read the tidydata.txt file into R
#  testread<-read.table("tidydata.txt", sep = "\t", header = TRUE)
