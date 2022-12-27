### Stage 1 - Preparation ###


# Load required package.

        library(dplyr)

        
# Set file name for the data set zip file.

        filename <- "UCI_data_set.zip"


# Check that zip file with the data set doesn't already exist and download if TRUE. 

        if (!file.exists(filename)){
                fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                download.file(fileURL, filename, method="curl")
                message("\n Data set zip file downloaded successfully. \n")
        }


# Check that unzipped folder doesn't already exist and unzip if TRUE.

        if (!file.exists("UCI HAR Dataset")) { 
                unzip(filename)
                message("\n Data set unzipped successfully. \n")
        }


## Create and populate data frames from required files.

        features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("n","functions"))
        activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

        subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
        x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
        y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "code")

        subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
        x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
        y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "code")


### Stage 2 - Execution ###


# Step 1: Merges the training and the test sets to create one data set.

        xdata <- rbind(x_train, x_test)
        ydata <- rbind(y_train, y_test)
        subject_data <- rbind(subject_train, subject_test)
        merged_data <- cbind(subject_data, ydata, xdata)


# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

        final_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))


# Step 3: Uses descriptive activity names to name the activities in the data set.

        final_data$code <- activities[final_data$code, 2]


# Step 4: Appropriately labels the data set with descriptive variable names.

        names(final_data)[2] = "activity"
        names(final_data)<-gsub("Acc", "Accelerometer", names(final_data))
        names(final_data)<-gsub("Gyro", "Gyroscope", names(final_data))
        names(final_data)<-gsub("BodyBody", "Body", names(final_data))
        names(final_data)<-gsub("Mag", "Magnitude", names(final_data))
        names(final_data)<-gsub("freq", "Frequency", names(final_data), ignore.case = TRUE)
        names(final_data)<-gsub("mean", "Mean", names(final_data), ignore.case = TRUE)
        names(final_data)<-gsub("std", "STD", names(final_data), ignore.case = TRUE)
        names(final_data)<-gsub("angle", "Angle", names(final_data))
        names(final_data)<-gsub("gravity", "Gravity", names(final_data))
        names(final_data)<-gsub("tBody", "TimeBody", names(final_data))
        names(final_data)<-gsub("^t", "Time", names(final_data))
        names(final_data)<-gsub("^f", "Frequency", names(final_data))


# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

        tidy_data <- final_data %>%
                group_by(subject, activity) %>%
                summarise_all(list(mean))
        write.table(tidy_data, "TidyData.txt", row.name=FALSE)
