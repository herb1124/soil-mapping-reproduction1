# Soil Organic Carbon Mapping

library(sf)
library(ggplot2)

# 读取数据
pts <- st_read("D:/R/library/sol_chem.pnts_horizons.gpkg")

# 提取表层SOC
pts_top <- pts[!is.na(pts$organic_carbon_1), ]

# 绘图
p <- ggplot(pts_top) +
  geom_sf(aes(color = organic_carbon_1), size = 1) +
  scale_color_viridis_c(name = "SOC") +
  theme_minimal()

# 保存结果
ggsave("SOC_map.png", plot = p, width = 8, height = 5, dpi = 300)