data <- readRDS("/Users/jacksonmacdonald/Downloads/ngs_2023_receiving.rds")

# Filter data for TE and WR
wr_data <- subset(data, player_position == "WR" & week == 0)
te_data <- subset(data, player_position == "TE"& week == 0)
wr_yac <- wr_data$avg_expected_yac
te_yac <- te_data$avg_expected_yac
difference <- wr_yac - te_yac
var(difference)

hist(wr_yac,
     main = "Distribution of WR Average xYAC",
     xlab = "WR xYAC",
     ylab = "Frequency",
     col = "skyblue",
     border = "black")

hist(te_yac,
     breaks = 5,
     main = "Distribution of TE Average xYAC",
     xlab = "TE xYAC",
     ylab = "Frequency",
     col = "#abf7b1",
     border = "black")


# Calculate the CI
t.test(x = wr_yac, y = te_yac, conf.level = .95)
var(te_yac)
var(wr_yac)
shapiro.test(wr_yac)
shapiro.test(te_yac)


