# Load necessary packages
library(dplyr)

# Step 1: Download and Unzip Data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "dataset.zip"
if (!file.exists(filename)) {
  download.file(url, filename, method = "curl")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip(filename)
}

# Step 2: Load Data
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id", "activity"))

# Load train and test datasets
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Step 3: Merge datasets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Step 4: Extract only mean and standard deviation columns
selected_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, selected_features]
names(x_data) <- features[selected_features, 2]

# Step 5: Use descriptive activity names
y_data <- merge(y_data, activity_labels, by.x = "V1", by.y = "activity_id")
names(y_data) <- c("activity_id", "activity")
y_data <- y_data["activity"]

# Step 6: Label dataset
names(subject_data) <- "subject"

# Combine all into one dataset
tidy_data <- cbind(subject_data, y_data, x_data)

# Debugging Step: Print column names to verify structure
print(colnames(tidy_data))

# Step 7: Create a second tidy dataset with the average of each variable per activity and subject
final_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Step 8: Save the tidy dataset
write.table(final_data, "tidy_dataset.txt", row.name = FALSE)

print("Analysis complete! Tidy dataset saved as 'tidy_dataset.txt'.")

