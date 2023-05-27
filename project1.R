setwd("D:\\BRACU\\14th Semester\\STA301\\Project 1")
load("D:\\BRACU\\14th Semester\\STA301\\Project 1\\algae.RData")


#Create a new variable by combining the small and medium size rivers in one category.
dataset_temp <- algae
dataset_temp <- dataset_temp[!is.na(dataset_temp$mnO2),]

dataset_temp$combined <- ifelse(dataset_temp$size == "large", "large", "small/medium")
#View(dataset_temp)

#Analyze chem2 value for rivers of small/medium and large sizes, separately, using summary statistics and different plots.

x1 <- dataset_temp$mnO2[dataset_temp$combined == "small/medium"]
x2 <- dataset_temp$mnO2[dataset_temp$combined == "large"]

y1 <- summary(x1)
y2 <- summary(x2)

#plot x1 and x2 in same graph with different color
#plot(x1, col = ("red"), pch = 16, main = "Overlaying graph of chem2 for small/medium and large rivers", xlab = "Observations", ylab = "Values")
#points(x2, col = ("blue"), pch = 15)
#legend("bottomleft", legend = c("small/medium", "large"), col = c("red", "blue"), pch = c(16, 15))

#Is there a significant difference in mean chem2 value for rivers of small/medium and large sizes? Carry out an appropriate test. Include the appropriate hypotheses, test statistic value, p-value, and conclusion.

test <- t.test(y1, y2, paired = TRUE)