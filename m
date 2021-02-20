Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB832320601
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Feb 2021 16:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhBTP5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Feb 2021 10:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhBTP5T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Feb 2021 10:57:19 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B52BC06178A;
        Sat, 20 Feb 2021 07:56:38 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 3F3381F5D4;
        Sat, 20 Feb 2021 16:56:35 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/6] clk: qcom: gcc-sdm660: Add missing clocks and GDSCs
Date:   Sat, 20 Feb 2021 16:56:14 +0100
Message-Id: <20210220155618.176559-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210220155618.176559-1-konrad.dybcio@somainline.org>
References: <20210220155618.176559-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing clocks and GDSCs to make sure LPASS, UFS and
MSS can access their respective clock domains.

Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-sdm660.c               | 158 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdm660.h |   6 +
 2 files changed, 164 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 2bf4e29462e8..05664d6b612a 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -1580,6 +1580,19 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_gpll0_out_msscc = {
+	.halt_reg = 0x5200c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll0_out_msscc",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_gpu_gpll0_clk = {
 	.halt_reg = 0x5200c,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -1979,6 +1992,23 @@ static struct clk_branch gcc_ufs_axi_clk = {
 	},
 };
 
+static struct clk_branch gcc_ufs_axi_hw_ctl_clk = {
+	.halt_reg = 0x75008,
+	.clkr = {
+		.enable_reg = 0x75008,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_axi_hw_ctl_clk",
+			.parent_names = (const char *[]){
+				"gcc_ufs_axi_clk",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_clkref_clk = {
 	.halt_reg = 0x88008,
 	.halt_check = BRANCH_HALT,
@@ -2010,6 +2040,23 @@ static struct clk_branch gcc_ufs_ice_core_clk = {
 	},
 };
 
+static struct clk_branch gcc_ufs_ice_core_hw_ctl_clk = {
+	.halt_reg = 0x7600c,
+	.clkr = {
+		.enable_reg = 0x7600c,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_ice_core_hw_ctl_clk",
+			.parent_names = (const char *[]){
+				"gcc_ufs_ice_core_clk",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_phy_aux_clk = {
 	.halt_reg = 0x76040,
 	.halt_check = BRANCH_HALT,
@@ -2028,6 +2075,23 @@ static struct clk_branch gcc_ufs_phy_aux_clk = {
 	},
 };
 
+static struct clk_branch gcc_ufs_phy_aux_hw_ctl_clk = {
+	.halt_reg = 0x76040,
+	.clkr = {
+		.enable_reg = 0x76040,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_aux_hw_ctl_clk",
+			.parent_names = (const char *[]){
+				"gcc_ufs_phy_aux_clk",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_rx_symbol_0_clk = {
 	.halt_reg = 0x75014,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -2085,6 +2149,23 @@ static struct clk_branch gcc_ufs_unipro_core_clk = {
 	},
 };
 
+static struct clk_branch gcc_ufs_unipro_core_hw_ctl_clk = {
+	.halt_reg = 0x76008,
+	.clkr = {
+		.enable_reg = 0x76008,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_unipro_core_hw_ctl_clk",
+			.parent_names = (const char *[]){
+				"gcc_ufs_unipro_core_clk",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_usb20_master_clk = {
 	.halt_reg = 0x2f004,
 	.halt_check = BRANCH_HALT,
@@ -2240,6 +2321,45 @@ static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk = {
 	},
 };
 
+static struct clk_branch hlos1_vote_lpass_adsp_smmu_clk = {
+	.halt_reg = 0x7d014,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x7d014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "hlos1_vote_lpass_adsp_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch hlos1_vote_turing_adsp_smmu_clk = {
+	.halt_reg = 0x7d048,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x7d048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "hlos1_vote_turing_adsp_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch hlos2_vote_turing_adsp_smmu_clk = {
+	.halt_reg = 0x7e048,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x7e048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "hlos2_vote_turing_adsp_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc ufs_gdsc = {
 	.gdscr = 0x75004,
 	.gds_hw_ctrl = 0x0,
@@ -2270,6 +2390,33 @@ static struct gdsc pcie_0_gdsc = {
 	.flags = VOTABLE,
 };
 
+static struct gdsc hlos1_vote_lpass_adsp_gdsc = {
+	.gdscr = 0x7d034,
+	.pd = {
+		.name = "hlos1_vote_lpass_adsp",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_turing_adsp_gdsc = {
+	.gdscr = 0x7d04c,
+	.pd = {
+		.name = "hlos1_vote_turing_adsp",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos2_vote_turing_adsp_gdsc = {
+	.gdscr = 0x7e04c,
+	.pd = {
+		.name = "hlos2_vote_turing_adsp",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
 static struct clk_hw *gcc_sdm660_hws[] = {
 	&xo.hw,
 	&gpll0_early_div.hw,
@@ -2402,12 +2549,23 @@ static struct clk_regmap *gcc_sdm660_clocks[] = {
 	[USB30_MASTER_CLK_SRC] = &usb30_master_clk_src.clkr,
 	[USB30_MOCK_UTMI_CLK_SRC] = &usb30_mock_utmi_clk_src.clkr,
 	[USB3_PHY_AUX_CLK_SRC] = &usb3_phy_aux_clk_src.clkr,
+	[GPLL0_OUT_MSSCC] = &gcc_gpll0_out_msscc.clkr,
+	[GCC_UFS_AXI_HW_CTL_CLK] = &gcc_ufs_axi_hw_ctl_clk.clkr,
+	[GCC_UFS_ICE_CORE_HW_CTL_CLK] = &gcc_ufs_ice_core_hw_ctl_clk.clkr,
+	[GCC_UFS_PHY_AUX_HW_CTL_CLK] = &gcc_ufs_phy_aux_hw_ctl_clk.clkr,
+	[GCC_UFS_UNIPRO_CORE_HW_CTL_CLK] = &gcc_ufs_unipro_core_hw_ctl_clk.clkr,
+	[HLOS1_VOTE_LPASS_ADSP_SMMU_CLK] = &hlos1_vote_lpass_adsp_smmu_clk.clkr,
+	[HLOS1_VOTE_TURING_ADSP_SMMU_CLK] = &hlos1_vote_turing_adsp_smmu_clk.clkr,
+	[HLOS2_VOTE_TURING_ADSP_SMMU_CLK] = &hlos2_vote_turing_adsp_smmu_clk.clkr,
 };
 
 static struct gdsc *gcc_sdm660_gdscs[] = {
 	[UFS_GDSC] = &ufs_gdsc,
 	[USB_30_GDSC] = &usb_30_gdsc,
 	[PCIE_0_GDSC] = &pcie_0_gdsc,
+	[HLOS1_VOTE_LPASS_ADSP_GDSC] = &hlos1_vote_lpass_adsp_gdsc,
+	[HLOS1_VOTE_TURING_ADSP_GDSC] = &hlos1_vote_turing_adsp_gdsc,
+	[HLOS2_VOTE_TURING_ADSP_GDSC] = &hlos2_vote_turing_adsp_gdsc,
 };
 
 static const struct qcom_reset_map gcc_sdm660_resets[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-sdm660.h b/include/dt-bindings/clock/qcom,gcc-sdm660.h
index df8a6f3d367e..641f0f4d6139 100644
--- a/include/dt-bindings/clock/qcom,gcc-sdm660.h
+++ b/include/dt-bindings/clock/qcom,gcc-sdm660.h
@@ -138,10 +138,16 @@
 #define GCC_UFS_UNIPRO_CORE_HW_CTL_CLK		128
 #define GCC_RX0_USB2_CLKREF_CLK			129
 #define GCC_RX1_USB2_CLKREF_CLK			130
+#define HLOS1_VOTE_LPASS_ADSP_SMMU_CLK 131
+#define HLOS1_VOTE_TURING_ADSP_SMMU_CLK		132
+#define HLOS2_VOTE_TURING_ADSP_SMMU_CLK		133
 
 #define PCIE_0_GDSC	0
 #define UFS_GDSC	1
 #define USB_30_GDSC	2
+#define HLOS1_VOTE_LPASS_ADSP_GDSC		3
+#define HLOS1_VOTE_TURING_ADSP_GDSC		4
+#define HLOS2_VOTE_TURING_ADSP_GDSC		5
 
 #define GCC_QUSB2PHY_PRIM_BCR		0
 #define GCC_QUSB2PHY_SEC_BCR		1
-- 
2.30.1

