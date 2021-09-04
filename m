Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59554400C91
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Sep 2021 20:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237515AbhIDSb5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Sep 2021 14:31:57 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:41689 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237478AbhIDSbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Sep 2021 14:31:55 -0400
Received: from localhost.localdomain (83.6.166.194.neoplus.adsl.tpnet.pl [83.6.166.194])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 7CB8F3EBA1;
        Sat,  4 Sep 2021 20:30:47 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 4/9] clk: qcom: gcc-msm8994: Add missing NoC clocks
Date:   Sat,  4 Sep 2021 20:30:08 +0200
Message-Id: <20210904183014.43528-4-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210904183014.43528-1-konrad.dybcio@somainline.org>
References: <20210904183014.43528-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add necessary NoC clocks to provide frequency sources for
relevant branch clocks.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
[no changes since v2]

 drivers/clk/qcom/gcc-msm8994.c               | 101 ++++++++++++++++---
 include/dt-bindings/clock/qcom,gcc-msm8994.h |   3 +
 2 files changed, 92 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 78c06104854e..629ab6ab455f 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -106,6 +106,42 @@ static const struct clk_parent_data gcc_xo_gpll0_gpll4[] = {
 	{ .hw = &gpll4.clkr.hw },
 };
 
+static struct clk_rcg2 system_noc_clk_src = {
+	.cmd_rcgr = 0x0120,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "system_noc_clk_src",
+		.parent_data = gcc_xo_gpll0,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 config_noc_clk_src = {
+	.cmd_rcgr = 0x0150,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "config_noc_clk_src",
+		.parent_data = gcc_xo_gpll0,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 periph_noc_clk_src = {
+	.cmd_rcgr = 0x0190,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "periph_noc_clk_src",
+		.parent_data = gcc_xo_gpll0,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static struct freq_tbl ftbl_ufs_axi_clk_src[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
@@ -1089,6 +1125,8 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 		.enable_mask = BIT(17),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1372,6 +1410,8 @@ static struct clk_branch gcc_blsp2_ahb_clk = {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1699,6 +1739,8 @@ static struct clk_branch gcc_lpass_q6_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_lpass_q6_axi_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1711,6 +1753,8 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_q6_bimc_axi_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1738,6 +1782,9 @@ static struct clk_branch gcc_pcie_0_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_cfg_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &config_noc_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1750,6 +1797,9 @@ static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_mstr_axi_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1779,6 +1829,9 @@ static struct clk_branch gcc_pcie_0_slv_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_slv_axi_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1806,6 +1859,9 @@ static struct clk_branch gcc_pcie_1_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_cfg_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &config_noc_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1818,6 +1874,9 @@ static struct clk_branch gcc_pcie_1_mstr_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_mstr_axi_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1846,6 +1905,9 @@ static struct clk_branch gcc_pcie_1_slv_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_slv_axi_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1873,6 +1935,8 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1900,10 +1964,9 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1916,10 +1979,9 @@ static struct clk_branch gcc_sdcc2_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1947,10 +2009,9 @@ static struct clk_branch gcc_sdcc3_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc3_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1978,10 +2039,9 @@ static struct clk_branch gcc_sdcc4_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_ahb_clk",
-			.parent_names = (const char *[]){
-				"periph_noc_clk_src",
-			},
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2039,6 +2099,8 @@ static struct clk_branch gcc_tsif_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2066,6 +2128,8 @@ static struct clk_branch gcc_ufs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &config_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2109,6 +2173,8 @@ static struct clk_branch gcc_ufs_rx_symbol_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2122,6 +2188,8 @@ static struct clk_branch gcc_ufs_rx_symbol_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_symbol_1_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2150,6 +2218,8 @@ static struct clk_branch gcc_ufs_tx_symbol_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2163,6 +2233,8 @@ static struct clk_branch gcc_ufs_tx_symbol_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_1_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2254,6 +2326,8 @@ static struct clk_branch gcc_usb_hs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2331,6 +2405,9 @@ static struct clk_regmap *gcc_msm8994_clocks[] = {
 	[GPLL0] = &gpll0.clkr,
 	[GPLL4_EARLY] = &gpll4_early.clkr,
 	[GPLL4] = &gpll4.clkr,
+	[CONFIG_NOC_CLK_SRC] = &config_noc_clk_src.clkr,
+	[PERIPH_NOC_CLK_SRC] = &periph_noc_clk_src.clkr,
+	[SYSTEM_NOC_CLK_SRC] = &system_noc_clk_src.clkr,
 	[UFS_AXI_CLK_SRC] = &ufs_axi_clk_src.clkr,
 	[USB30_MASTER_CLK_SRC] = &usb30_master_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8994.h b/include/dt-bindings/clock/qcom,gcc-msm8994.h
index 507b8d6effd2..219d5441c0fa 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8994.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8994.h
@@ -148,6 +148,9 @@
 #define GCC_USB30_SLEEP_CLK			138
 #define GCC_USB_HS_AHB_CLK			139
 #define GCC_USB_PHY_CFG_AHB2PHY_CLK	140
+#define CONFIG_NOC_CLK_SRC			141
+#define PERIPH_NOC_CLK_SRC			142
+#define SYSTEM_NOC_CLK_SRC			143
 
 /* GDSCs */
 #define PCIE_GDSC			0
-- 
2.33.0

