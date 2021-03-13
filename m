Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA33339B1C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 03:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbhCMCVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 21:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbhCMCUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 21:20:52 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC64C061574;
        Fri, 12 Mar 2021 18:20:51 -0800 (PST)
Received: from localhost.localdomain (abac242.neoplus.adsl.tpnet.pl [83.6.166.242])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 798F31F9BF;
        Sat, 13 Mar 2021 03:20:49 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] clk: qcom: gcc-msm8994: Add missing NoC clocks
Date:   Sat, 13 Mar 2021 03:19:13 +0100
Message-Id: <20210313021919.435332-4-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210313021919.435332-1-konrad.dybcio@somainline.org>
References: <20210313021919.435332-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add necessary NoC clocks to provide frequency sources for
relevant branch clocks.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-msm8994.c               | 101 ++++++++++++++++---
 include/dt-bindings/clock/qcom,gcc-msm8994.h |   3 +
 2 files changed, 92 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 0ebc827f0f05..f661e28ac14a 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -108,6 +108,42 @@ static const struct clk_parent_data gcc_xo_gpll0_gpll4[] = {
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
@@ -1097,6 +1133,8 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 		.enable_mask = BIT(17),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1380,6 +1418,8 @@ static struct clk_branch gcc_blsp2_ahb_clk = {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1707,6 +1747,8 @@ static struct clk_branch gcc_lpass_q6_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_lpass_q6_axi_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1719,6 +1761,8 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_q6_bimc_axi_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1746,6 +1790,9 @@ static struct clk_branch gcc_pcie_0_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_cfg_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &config_noc_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1758,6 +1805,9 @@ static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_mstr_axi_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1787,6 +1837,9 @@ static struct clk_branch gcc_pcie_0_slv_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_slv_axi_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1814,6 +1867,9 @@ static struct clk_branch gcc_pcie_1_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_cfg_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &config_noc_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1826,6 +1882,9 @@ static struct clk_branch gcc_pcie_1_mstr_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_mstr_axi_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1854,6 +1913,9 @@ static struct clk_branch gcc_pcie_1_slv_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_slv_axi_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1881,6 +1943,8 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1908,10 +1972,9 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
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
@@ -1924,10 +1987,9 @@ static struct clk_branch gcc_sdcc2_ahb_clk = {
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
@@ -1955,10 +2017,9 @@ static struct clk_branch gcc_sdcc3_ahb_clk = {
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
@@ -1986,10 +2047,9 @@ static struct clk_branch gcc_sdcc4_ahb_clk = {
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
@@ -2047,6 +2107,8 @@ static struct clk_branch gcc_tsif_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2074,6 +2136,8 @@ static struct clk_branch gcc_ufs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &config_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2117,6 +2181,8 @@ static struct clk_branch gcc_ufs_rx_symbol_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2130,6 +2196,8 @@ static struct clk_branch gcc_ufs_rx_symbol_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_rx_symbol_1_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2158,6 +2226,8 @@ static struct clk_branch gcc_ufs_tx_symbol_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2171,6 +2241,8 @@ static struct clk_branch gcc_ufs_tx_symbol_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_1_clk",
+			.parent_hws = (const struct clk_hw *[]){ &system_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2262,6 +2334,8 @@ static struct clk_branch gcc_usb_hs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]){ &periph_noc_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2339,6 +2413,9 @@ static struct clk_regmap *gcc_msm8994_clocks[] = {
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
2.30.2

