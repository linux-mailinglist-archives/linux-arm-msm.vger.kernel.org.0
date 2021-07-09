Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF193C29F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 22:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhGIUHD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 16:07:03 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59429 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbhGIUHC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 16:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1625861059; x=1657397059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bb+oP/kltOF2lksQBHYEzZsUuRr0lNJSjMkzF7H4Ab4=;
  b=NzndfMm1XRtOAaEd7tRqahxvwUyQymxi2zdtJvSViZS+PneUrc1fYQzs
   GNYdDQ3ZJkQq4hJk4IuJ1eMNAOCHsx1MimwfaXG4CfyMYYfh6dCE8z4dC
   5nXxhSYINb2ajEfqWjcWYMXcG4wtDA+OUvSOxAMdEviXfgIl+7gOY/ppv
   I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 09 Jul 2021 13:04:18 -0700
X-QCInternal: smtphost
Received: from nalasexr03e.na.qualcomm.com ([10.49.195.114])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Jul 2021 13:04:18 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nalasexr03e.na.qualcomm.com (10.49.195.114) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 9 Jul 2021 13:04:17 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH 2/5] clk: qcom: Add SDX65 GCC support
Date:   Fri, 9 Jul 2021 13:03:36 -0700
Message-ID: <20210709200339.17638-3-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709200339.17638-1-quic_vamslank@quicinc.com>
References: <20210709200339.17638-1-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03d.na.qualcomm.com (10.85.0.91) To
 nalasexr03e.na.qualcomm.com (10.49.195.114)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

Add Global Clock Controller (GCC) support for SDX65 SoCs from Qualcomm.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
---
 drivers/clk/qcom/Kconfig         |    8 +
 drivers/clk/qcom/Makefile        |    1 +
 drivers/clk/qcom/clk-alpha-pll.c |  170 +++
 drivers/clk/qcom/clk-alpha-pll.h |    4 +
 drivers/clk/qcom/clk-rcg.h       |    4 +
 drivers/clk/qcom/gcc-sdx65.c     | 1648 ++++++++++++++++++++++++++++++
 6 files changed, 1835 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-sdx65.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 45646b867cdb..8b9b1ecf4089 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -483,6 +483,14 @@ config SDX_GCC_55
 	  Say Y if you want to use peripheral devices such as UART,
 	  SPI, I2C, USB, SD/UFS, PCIe etc.
 
+config SDX_GCC_65
+	tristate "SDX65 Global Clock Controller"
+	select QCOM_GDSC
+	help
+	  Support for the global clock controller on SDX65 devices.
+	  Say Y if you want to use peripheral devices such as UART,
+	  SPI, I2C, USB, SD/UFS, PCIe etc.
+
 config SM_DISPCC_8250
 	tristate "SM8150 and SM8250 Display Clock Controller"
 	depends on SM_GCC_8150 || SM_GCC_8250
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index c8291312e723..4735b885317a 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
 obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
 obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
 obj-$(CONFIG_SDX_GCC_55) += gcc-sdx55.o
+obj-$(CONFIG_SDX_GCC_65) += gcc-sdx65.o
 obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
 obj-$(CONFIG_SM_GCC_8150) += gcc-sm8150.o
 obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index c6eb99169ddc..93c8917b7273 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015, 2018, The Linux Foundation. All rights reserved.
  */
 
@@ -126,6 +127,20 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL_U] = 0x1c,
 		[PLL_OFF_STATUS] = 0x2c,
 	},
+        [CLK_ALPHA_PLL_TYPE_LUCID_EVO] = {
+                [PLL_OFF_OPMODE] = 0x04,
+                [PLL_OFF_STATUS] = 0x0c,
+                [PLL_OFF_L_VAL] = 0x10,
+                [PLL_OFF_ALPHA_VAL] = 0x14,
+                [PLL_OFF_USER_CTL] = 0x18,
+                [PLL_OFF_USER_CTL_U] = 0x1c,
+                [PLL_OFF_CONFIG_CTL] = 0x20,
+                [PLL_OFF_CONFIG_CTL_U] = 0x24,
+                [PLL_OFF_CONFIG_CTL_U1] = 0x28,
+                [PLL_OFF_TEST_CTL] = 0x2c,
+                [PLL_OFF_TEST_CTL_U] = 0x30,
+                [PLL_OFF_TEST_CTL_U1] = 0x34,
+        },
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 
@@ -155,12 +170,14 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 
 /* LUCID PLL specific settings and offsets */
 #define LUCID_PCAL_DONE		BIT(27)
+#define LUCID_EVO_PLL_L_VAL_MASK        GENMASK(15, 0)
 
 /* LUCID 5LPE PLL specific settings and offsets */
 #define LUCID_5LPE_PCAL_DONE		BIT(11)
 #define LUCID_5LPE_ALPHA_PLL_ACK_LATCH	BIT(13)
 #define LUCID_5LPE_PLL_LATCH_INPUT	BIT(14)
 #define LUCID_5LPE_ENABLE_VOTE_RUN	BIT(21)
+#define LUCID_EVO_ENABLE_VOTE_RUN       BIT(25)
 
 #define pll_alpha_width(p)					\
 		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
@@ -1777,3 +1794,156 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
 	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
 };
 EXPORT_SYMBOL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
+
+static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
+	if (ret)
+		return ret;
+
+	/* If in FSM mode, just vote for it */
+	if (val & LUCID_EVO_ENABLE_VOTE_RUN) {
+		ret = clk_enable_regmap(hw);
+		if (ret)
+			return ret;
+		return wait_for_pll_enable_lock(pll);
+	}
+
+	/* Check if PLL is already enabled */
+	ret = trion_pll_is_enabled(pll, pll->clkr.regmap);
+	if (ret < 0)
+		return ret;
+	else if (ret) {
+		pr_warn("%s PLL is already enabled\n",
+				clk_hw_get_name(&pll->clkr.hw));
+		return 0;
+	}
+
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
+			PLL_RESET_N, PLL_RESET_N);
+	if (ret)
+		return ret;
+
+	/* Set operation mode to RUN */
+	regmap_write(pll->clkr.regmap, PLL_OPMODE(pll), PLL_RUN);
+
+	ret = wait_for_pll_enable_lock(pll);
+	if (ret)
+		return ret;
+
+	/* Enable the PLL outputs */
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
+			PLL_OUT_MASK, PLL_OUT_MASK);
+	if (ret)
+		return ret;
+
+	/* Enable the global PLL outputs */
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
+			PLL_OUTCTRL, PLL_OUTCTRL);
+	if (ret)
+		return ret;
+
+	/* Ensure that the write above goes through before returning. */
+	mb();
+	return ret;
+}
+
+static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
+	if (ret)
+		return;
+
+	/* If in FSM mode, just unvote it */
+	if (val & LUCID_EVO_ENABLE_VOTE_RUN) {
+		clk_disable_regmap(hw);
+		return;
+	}
+
+	/* Disable the global PLL output */
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
+			PLL_OUTCTRL, 0);
+	if (ret)
+		return;
+
+	/* Disable the PLL outputs */
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
+			PLL_OUT_MASK, 0);
+	if (ret)
+		return;
+
+	/* Place the PLL mode in STANDBY */
+	regmap_write(pll->clkr.regmap, PLL_OPMODE(pll),
+			PLL_STANDBY);
+}
+
+static unsigned long alpha_pll_lucid_evo_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 l, frac;
+
+	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
+	l &= LUCID_EVO_PLL_L_VAL_MASK;
+	regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac);
+
+	return alpha_pll_calc_rate(parent_rate, l, frac, ALPHA_REG_16BIT_WIDTH);
+}
+
+static int clk_lucid_evo_pll_postdiv_set_rate(struct clk_hw *hw,
+		unsigned long rate, unsigned long parent_rate)
+{
+	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
+	int i, val = 0, div, ret;
+
+	/*
+	 * If the PLL is in FSM mode, then treat set_rate callback as a
+	 * no-operation.
+	 */
+	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
+	if (ret)
+		return ret;
+
+	if (val & LUCID_EVO_ENABLE_VOTE_RUN)
+		return 0;
+
+	if (!pll->post_div_table) {
+		pr_err("Missing the post_div_table for the PLL\n");
+		return -EINVAL;
+	}
+
+	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	for (i = 0; i < pll->num_post_div; i++) {
+		if (pll->post_div_table[i].div == div) {
+			val = pll->post_div_table[i].val;
+			break;
+		}
+	}
+
+	return regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
+			(BIT(pll->width) - 1) << pll->post_div_shift,
+			val << pll->post_div_shift);
+}
+
+const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops = {
+	.enable = alpha_pll_lucid_evo_enable,
+	.disable = alpha_pll_lucid_evo_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_evo_ops);
+
+const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops = {
+	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
+	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
+	.set_rate = clk_lucid_evo_pll_postdiv_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_evo_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 6943e933be0f..c42299bf6f6f 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -16,6 +16,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_TRION,
 	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
 	CLK_ALPHA_PLL_TYPE_AGERA,
+	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
 	CLK_ALPHA_PLL_TYPE_MAX,
 };
 
@@ -148,6 +149,9 @@ extern const struct clk_ops clk_alpha_pll_lucid_5lpe_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
 
+extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
+extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 99efcc7f8d88..33a7fe992207 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -149,6 +149,10 @@ struct clk_rcg2 {
 	const struct freq_tbl	*freq_tbl;
 	struct clk_regmap	clkr;
 	u8			cfg_off;
+	u8                      flags;
+#define FORCE_ENABLE_RCG        BIT(0)
+#define HW_CLK_CTRL_MODE        BIT(1)
+#define DFS_SUPPORT             BIT(2)
 };
 
 #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
diff --git a/drivers/clk/qcom/gcc-sdx65.c b/drivers/clk/qcom/gcc-sdx65.c
new file mode 100644
index 000000000000..3f07ed50a7ca
--- /dev/null
+++ b/drivers/clk/qcom/gcc-sdx65.c
@@ -0,0 +1,1648 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,gcc-sdx65.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	P_BI_TCXO,
+	P_CORE_BI_PLL_TEST_SE,
+	P_GPLL0_OUT_EVEN,
+	P_GPLL0_OUT_MAIN,
+	P_PCIE_PIPE_CLK,
+	P_SLEEP_CLK,
+	P_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK,
+};
+
+static struct clk_alpha_pll gpll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
+	.clkr = {
+		.enable_reg = 0x6d000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll0",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_gpll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll0_out_even",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &gpll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
+	},
+};
+
+static const struct parent_map gcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL0_OUT_EVEN, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gcc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_even.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct clk_parent_data gcc_parent_data_0_ao[] = {
+	{ .fw_name = "bi_tcxo_ao" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_even.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map gcc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gcc_parent_data_1[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map gcc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_GPLL0_OUT_EVEN, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gcc_parent_data_2[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .fw_name = "sleep_clk" },
+	{ .hw = &gpll0_out_even.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map gcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gcc_parent_data_3[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "sleep_clk" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map gcc_parent_map_4[] = {
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct parent_map gcc_parent_map_5[] = {
+	{ P_PCIE_PIPE_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_5[] = {
+	{ .fw_name = "pcie_pipe_clk"},
+	{ .fw_name = "bi_tcxo"},
+};
+
+static const struct parent_map gcc_parent_map_6[] = {
+	{ P_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_6[] = {
+	{ .fw_name = "usb3_phy_wrapper_gcc_usb30_pipe_clk"},
+	{ .fw_name = "bi_tcxo"},
+};
+
+static struct clk_regmap_mux gcc_pcie_aux_clk_src = {
+	.reg = 0x43060,
+	.shift = 0,
+	.width = 2,
+	.parent_map = gcc_parent_map_4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_aux_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
+static struct clk_regmap_mux gcc_pcie_pipe_clk_src = {
+	.reg = 0x43044,
+	.shift = 0,
+	.width = 2,
+	.parent_map = gcc_parent_map_5,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_pipe_clk_src",
+			.parent_data = gcc_parent_data_5,
+			.num_parents = 2,
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
+static struct clk_regmap_mux gcc_usb3_phy_pipe_clk_src = {
+	.reg = 0x1706c,
+	.shift = 0,
+	.width = 2,
+	.parent_map = gcc_parent_map_6,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_phy_pipe_clk_src",
+			.parent_data = gcc_parent_data_6,
+			.num_parents = 2,
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_blsp1_qup1_i2c_apps_clk_src[] = {
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_blsp1_qup1_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x1c024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_i2c_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup1_i2c_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_blsp1_qup1_spi_apps_clk_src[] = {
+	F(960000, P_BI_TCXO, 10, 1, 2),
+	F(4800000, P_BI_TCXO, 4, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(15000000, P_GPLL0_OUT_EVEN, 5, 1, 4),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24000000, P_GPLL0_OUT_MAIN, 12.5, 1, 2),
+	F(25000000, P_GPLL0_OUT_MAIN, 12, 1, 2),
+	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_blsp1_qup1_spi_apps_clk_src = {
+	.cmd_rcgr = 0x1c00c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_spi_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup1_spi_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_qup2_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x1e024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_i2c_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup2_i2c_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_qup2_spi_apps_clk_src = {
+	.cmd_rcgr = 0x1e00c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_spi_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup2_spi_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_qup3_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x20024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_i2c_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup3_i2c_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_qup3_spi_apps_clk_src = {
+	.cmd_rcgr = 0x2000c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_spi_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup3_spi_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_qup4_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x22024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_i2c_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup4_i2c_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_qup4_spi_apps_clk_src = {
+	.cmd_rcgr = 0x2200c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_qup1_spi_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_qup4_spi_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_blsp1_uart1_apps_clk_src[] = {
+	F(3686400, P_GPLL0_OUT_EVEN, 1, 192, 15625),
+	F(7372800, P_GPLL0_OUT_EVEN, 1, 384, 15625),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(14745600, P_GPLL0_OUT_EVEN, 1, 768, 15625),
+	F(16000000, P_GPLL0_OUT_EVEN, 1, 4, 75),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(19354839, P_GPLL0_OUT_MAIN, 15.5, 1, 2),
+	F(20000000, P_GPLL0_OUT_MAIN, 15, 1, 2),
+	F(20689655, P_GPLL0_OUT_MAIN, 14.5, 1, 2),
+	F(21428571, P_GPLL0_OUT_MAIN, 14, 1, 2),
+	F(22222222, P_GPLL0_OUT_MAIN, 13.5, 1, 2),
+	F(23076923, P_GPLL0_OUT_MAIN, 13, 1, 2),
+	F(24000000, P_GPLL0_OUT_MAIN, 5, 1, 5),
+	F(25000000, P_GPLL0_OUT_MAIN, 12, 1, 2),
+	F(26086957, P_GPLL0_OUT_MAIN, 11.5, 1, 2),
+	F(27272727, P_GPLL0_OUT_MAIN, 11, 1, 2),
+	F(28571429, P_GPLL0_OUT_MAIN, 10.5, 1, 2),
+	F(32000000, P_GPLL0_OUT_MAIN, 1, 4, 75),
+	F(40000000, P_GPLL0_OUT_MAIN, 15, 0, 0),
+	F(46400000, P_GPLL0_OUT_MAIN, 1, 29, 375),
+	F(48000000, P_GPLL0_OUT_MAIN, 12.5, 0, 0),
+	F(51200000, P_GPLL0_OUT_MAIN, 1, 32, 375),
+	F(56000000, P_GPLL0_OUT_MAIN, 1, 7, 75),
+	F(58982400, P_GPLL0_OUT_MAIN, 1, 1536, 15625),
+	F(60000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	F(63157895, P_GPLL0_OUT_MAIN, 9.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_blsp1_uart1_apps_clk_src = {
+	.cmd_rcgr = 0x1d00c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_uart1_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_uart1_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_uart2_apps_clk_src = {
+	.cmd_rcgr = 0x1f00c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_uart1_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_uart2_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_uart3_apps_clk_src = {
+	.cmd_rcgr = 0x2100c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_uart1_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_uart3_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_blsp1_uart4_apps_clk_src = {
+	.cmd_rcgr = 0x2300c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_blsp1_uart1_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_blsp1_uart4_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(133333333, P_GPLL0_OUT_MAIN, 4.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
+	.cmd_rcgr = 0x3000c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_cpuss_ahb_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_cpuss_ahb_clk_src",
+		.parent_data = gcc_parent_data_0_ao,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_gp1_clk_src = {
+	.cmd_rcgr = 0x37004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_gp1_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = 5,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_gp2_clk_src = {
+	.cmd_rcgr = 0x38004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_gp2_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = 5,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_gp3_clk_src = {
+	.cmd_rcgr = 0x39004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_gp3_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = 5,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie_aux_phy_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie_aux_phy_clk_src = {
+	.cmd_rcgr = 0x43048,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_pcie_aux_phy_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_pcie_aux_phy_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie_rchng_phy_clk_src[] = {
+	F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie_rchng_phy_clk_src = {
+	.cmd_rcgr = 0x43064,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_pcie_rchng_phy_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_pcie_rchng_phy_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = 5,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pdm2_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(60000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pdm2_clk_src = {
+	.cmd_rcgr = 0x24010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pdm2_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_pdm2_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk_src[] = {
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0x1a010,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_sdcc1_apps_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_sdcc1_apps_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb30_master_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_EVEN, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb30_master_clk_src = {
+	.cmd_rcgr = 0x17030,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_usb30_master_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_usb30_master_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_usb30_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x17048,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pcie_aux_phy_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_usb30_mock_utmi_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb3_phy_aux_clk_src[] = {
+	F(1000000, P_BI_TCXO, 1, 5, 96),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb3_phy_aux_clk_src = {
+	.cmd_rcgr = 0x17070,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_usb3_phy_aux_clk_src,
+	.flags = HW_CLK_CTRL_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_usb3_phy_aux_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_cpuss_ahb_postdiv_clk_src = {
+	.reg = 0x30024,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "gcc_cpuss_ahb_postdiv_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &gcc_cpuss_ahb_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_usb30_mock_utmi_postdiv_clk_src = {
+	.reg = 0x17060,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "gcc_usb30_mock_utmi_postdiv_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &gcc_usb30_mock_utmi_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gcc_ahb_pcie_link_clk = {
+	.halt_reg = 0x2e004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ahb_pcie_link_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_ahb_clk = {
+	.halt_reg = 0x1b004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6d008,
+		.enable_mask = BIT(14),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
+	.halt_reg = 0x1c008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1c008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup1_i2c_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_blsp1_qup1_i2c_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
+	.halt_reg = 0x1c004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1c004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup1_spi_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_blsp1_qup1_spi_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
+	.halt_reg = 0x1e008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup2_i2c_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_blsp1_qup2_i2c_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
+	.halt_reg = 0x1e004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup2_spi_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_blsp1_qup2_spi_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
+	.halt_reg = 0x20008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup3_i2c_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_blsp1_qup3_i2c_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
+	.halt_reg = 0x20004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup3_spi_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_blsp1_qup3_spi_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
+	.halt_reg = 0x22008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x22008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup4_i2c_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_blsp1_qup4_i2c_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
+	.halt_reg = 0x22004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x22004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup4_spi_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_blsp1_qup4_spi_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_sleep_clk = {
+	.halt_reg = 0x1b00c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6d008,
+		.enable_mask = BIT(15),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart1_apps_clk = {
+	.halt_reg = 0x1d004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1d004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart1_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_blsp1_uart1_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart2_apps_clk = {
+	.halt_reg = 0x1f004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1f004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart2_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_blsp1_uart2_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart3_apps_clk = {
+	.halt_reg = 0x21004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart3_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_blsp1_uart3_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart4_apps_clk = {
+	.halt_reg = 0x23004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x23004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_uart4_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_blsp1_uart4_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_boot_rom_ahb_clk = {
+	.halt_reg = 0x27004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x27004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d008,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_boot_rom_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp1_clk = {
+	.halt_reg = 0x37000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x37000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_gp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp2_clk = {
+	.halt_reg = 0x38000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x38000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp2_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_gp2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp3_clk = {
+	.halt_reg = 0x39000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x39000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gp3_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_gp3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_0_clkref_en = {
+	.halt_reg = 0x88004,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x88004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_0_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_aux_clk = {
+	.halt_reg = 0x43034,
+	.halt_check = BRANCH_HALT_DELAY,
+	.hwcg_reg = 0x43034,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_aux_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_pcie_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_cfg_ahb_clk = {
+	.halt_reg = 0x4302c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x4302c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_mstr_axi_clk = {
+	.halt_reg = 0x43024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x43024,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_pipe_clk = {
+	.halt_reg = 0x4303c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.hwcg_reg = 0x4303c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_pipe_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_pcie_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_rchng_phy_clk = {
+	.halt_reg = 0x43030,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x43030,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_rchng_phy_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_pcie_rchng_phy_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_sleep_clk = {
+	.halt_reg = 0x43038,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x43038,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(6),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_sleep_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_pcie_aux_phy_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_slv_axi_clk = {
+	.halt_reg = 0x4301c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x4301c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_slv_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_slv_q2a_axi_clk = {
+	.halt_reg = 0x43018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x43018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x6d010,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie_slv_q2a_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm2_clk = {
+	.halt_reg = 0x2400c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2400c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm2_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_pdm2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_ahb_clk = {
+	.halt_reg = 0x24004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x24004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x24004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_xo4_clk = {
+	.halt_reg = 0x24008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x24008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pdm_xo4_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_rx1_usb2_clkref_en = {
+	.halt_reg = 0x88008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x88008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_rx1_usb2_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ahb_clk = {
+	.halt_reg = 0x1a00c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1a00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_apps_clk = {
+	.halt_reg = 0x1a004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_apps_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_sdcc1_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_master_clk = {
+	.halt_reg = 0x17018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_master_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_usb30_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_mock_utmi_clk = {
+	.halt_reg = 0x1702c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1702c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_mock_utmi_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw =
+					&gcc_usb30_mock_utmi_postdiv_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_mstr_axi_clk = {
+	.halt_reg = 0x17020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_sleep_clk = {
+	.halt_reg = 0x17028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb30_slv_ahb_clk = {
+	.halt_reg = 0x17024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb30_slv_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_phy_aux_clk = {
+	.halt_reg = 0x17064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17064,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_phy_aux_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_usb3_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc usb30_gdsc = {
+	.gdscr = 0x17004,
+	.pd = {
+		.name = "usb30_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc pcie_gdsc = {
+	.gdscr = 0x43004,
+	.pd = {
+		.name = "pcie_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct clk_branch gcc_usb3_phy_pipe_clk = {
+	.halt_reg = 0x17068,
+	.halt_check = BRANCH_HALT_DELAY,
+	.hwcg_reg = 0x17068,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x17068,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_phy_pipe_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gcc_usb3_phy_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb3_prim_clkref_en = {
+	.halt_reg = 0x88000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x88000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb3_prim_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk = {
+	.halt_reg = 0x19008,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x19008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x19008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb_phy_cfg_ahb2phy_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_xo_div4_clk = {
+	.halt_reg = 0x2e010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_xo_div4_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_xo_pcie_link_clk = {
+	.halt_reg = 0x2e008,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x2e008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2e008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_xo_pcie_link_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *gcc_sdx65_clocks[] = {
+	[GCC_AHB_PCIE_LINK_CLK] = &gcc_ahb_pcie_link_clk.clkr,
+	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
+	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP1_I2C_APPS_CLK_SRC] =
+		&gcc_blsp1_qup1_i2c_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP1_SPI_APPS_CLK_SRC] =
+		&gcc_blsp1_qup1_spi_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_I2C_APPS_CLK_SRC] =
+		&gcc_blsp1_qup2_i2c_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_SPI_APPS_CLK_SRC] =
+		&gcc_blsp1_qup2_spi_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP3_I2C_APPS_CLK] = &gcc_blsp1_qup3_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_I2C_APPS_CLK_SRC] =
+		&gcc_blsp1_qup3_i2c_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP3_SPI_APPS_CLK] = &gcc_blsp1_qup3_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_SPI_APPS_CLK_SRC] =
+		&gcc_blsp1_qup3_spi_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP4_I2C_APPS_CLK] = &gcc_blsp1_qup4_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_I2C_APPS_CLK_SRC] =
+		&gcc_blsp1_qup4_i2c_apps_clk_src.clkr,
+	[GCC_BLSP1_QUP4_SPI_APPS_CLK] = &gcc_blsp1_qup4_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_SPI_APPS_CLK_SRC] =
+		&gcc_blsp1_qup4_spi_apps_clk_src.clkr,
+	[GCC_BLSP1_SLEEP_CLK] = &gcc_blsp1_sleep_clk.clkr,
+	[GCC_BLSP1_UART1_APPS_CLK] = &gcc_blsp1_uart1_apps_clk.clkr,
+	[GCC_BLSP1_UART1_APPS_CLK_SRC] = &gcc_blsp1_uart1_apps_clk_src.clkr,
+	[GCC_BLSP1_UART2_APPS_CLK] = &gcc_blsp1_uart2_apps_clk.clkr,
+	[GCC_BLSP1_UART2_APPS_CLK_SRC] = &gcc_blsp1_uart2_apps_clk_src.clkr,
+	[GCC_BLSP1_UART3_APPS_CLK] = &gcc_blsp1_uart3_apps_clk.clkr,
+	[GCC_BLSP1_UART3_APPS_CLK_SRC] = &gcc_blsp1_uart3_apps_clk_src.clkr,
+	[GCC_BLSP1_UART4_APPS_CLK] = &gcc_blsp1_uart4_apps_clk.clkr,
+	[GCC_BLSP1_UART4_APPS_CLK_SRC] = &gcc_blsp1_uart4_apps_clk_src.clkr,
+	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
+	[GCC_CPUSS_AHB_CLK_SRC] = &gcc_cpuss_ahb_clk_src.clkr,
+	[GCC_CPUSS_AHB_POSTDIV_CLK_SRC] = &gcc_cpuss_ahb_postdiv_clk_src.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP2_CLK_SRC] = &gcc_gp2_clk_src.clkr,
+	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_GP3_CLK_SRC] = &gcc_gp3_clk_src.clkr,
+	[GCC_PCIE_0_CLKREF_EN] = &gcc_pcie_0_clkref_en.clkr,
+	[GCC_PCIE_AUX_CLK] = &gcc_pcie_aux_clk.clkr,
+	[GCC_PCIE_AUX_CLK_SRC] = &gcc_pcie_aux_clk_src.clkr,
+	[GCC_PCIE_AUX_PHY_CLK_SRC] = &gcc_pcie_aux_phy_clk_src.clkr,
+	[GCC_PCIE_CFG_AHB_CLK] = &gcc_pcie_cfg_ahb_clk.clkr,
+	[GCC_PCIE_MSTR_AXI_CLK] = &gcc_pcie_mstr_axi_clk.clkr,
+	[GCC_PCIE_PIPE_CLK] = &gcc_pcie_pipe_clk.clkr,
+	[GCC_PCIE_PIPE_CLK_SRC] = &gcc_pcie_pipe_clk_src.clkr,
+	[GCC_PCIE_RCHNG_PHY_CLK] = &gcc_pcie_rchng_phy_clk.clkr,
+	[GCC_PCIE_RCHNG_PHY_CLK_SRC] = &gcc_pcie_rchng_phy_clk_src.clkr,
+	[GCC_PCIE_SLEEP_CLK] = &gcc_pcie_sleep_clk.clkr,
+	[GCC_PCIE_SLV_AXI_CLK] = &gcc_pcie_slv_axi_clk.clkr,
+	[GCC_PCIE_SLV_Q2A_AXI_CLK] = &gcc_pcie_slv_q2a_axi_clk.clkr,
+	[GCC_PDM2_CLK] = &gcc_pdm2_clk.clkr,
+	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
+	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
+	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_RX1_USB2_CLKREF_EN] = &gcc_rx1_usb2_clkref_en.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC1_APPS_CLK_SRC] = &gcc_sdcc1_apps_clk_src.clkr,
+	[GCC_USB30_MASTER_CLK] = &gcc_usb30_master_clk.clkr,
+	[GCC_USB30_MASTER_CLK_SRC] = &gcc_usb30_master_clk_src.clkr,
+	[GCC_USB30_MOCK_UTMI_CLK] = &gcc_usb30_mock_utmi_clk.clkr,
+	[GCC_USB30_MOCK_UTMI_CLK_SRC] = &gcc_usb30_mock_utmi_clk_src.clkr,
+	[GCC_USB30_MOCK_UTMI_POSTDIV_CLK_SRC] =
+		&gcc_usb30_mock_utmi_postdiv_clk_src.clkr,
+	[GCC_USB30_MSTR_AXI_CLK] = &gcc_usb30_mstr_axi_clk.clkr,
+	[GCC_USB30_SLEEP_CLK] = &gcc_usb30_sleep_clk.clkr,
+	[GCC_USB30_SLV_AHB_CLK] = &gcc_usb30_slv_ahb_clk.clkr,
+	[GCC_USB3_PHY_AUX_CLK] = &gcc_usb3_phy_aux_clk.clkr,
+	[GCC_USB3_PHY_AUX_CLK_SRC] = &gcc_usb3_phy_aux_clk_src.clkr,
+	[GCC_USB3_PHY_PIPE_CLK] = &gcc_usb3_phy_pipe_clk.clkr,
+	[GCC_USB3_PHY_PIPE_CLK_SRC] = &gcc_usb3_phy_pipe_clk_src.clkr,
+	[GCC_USB3_PRIM_CLKREF_EN] = &gcc_usb3_prim_clkref_en.clkr,
+	[GCC_USB_PHY_CFG_AHB2PHY_CLK] = &gcc_usb_phy_cfg_ahb2phy_clk.clkr,
+	[GCC_XO_DIV4_CLK] = &gcc_xo_div4_clk.clkr,
+	[GCC_XO_PCIE_LINK_CLK] = &gcc_xo_pcie_link_clk.clkr,
+	[GPLL0] = &gpll0.clkr,
+	[GPLL0_OUT_EVEN] = &gpll0_out_even.clkr,
+};
+
+static const struct qcom_reset_map gcc_sdx65_resets[] = {
+	[GCC_BLSP1_QUP1_BCR] = { 0x1c000 },
+	[GCC_BLSP1_QUP2_BCR] = { 0x1e000 },
+	[GCC_BLSP1_QUP3_BCR] = { 0x20000 },
+	[GCC_BLSP1_QUP4_BCR] = { 0x22000 },
+	[GCC_BLSP1_UART1_BCR] = { 0x1d000 },
+	[GCC_BLSP1_UART2_BCR] = { 0x1f000 },
+	[GCC_BLSP1_UART3_BCR] = { 0x21000 },
+	[GCC_BLSP1_UART4_BCR] = { 0x23000 },
+	[GCC_PCIE_BCR] = { 0x43000 },
+	[GCC_PCIE_LINK_DOWN_BCR] = { 0x77000 },
+	[GCC_PCIE_NOCSR_COM_PHY_BCR] = { 0x78008 },
+	[GCC_PCIE_PHY_BCR] = { 0x44000 },
+	[GCC_PCIE_PHY_CFG_AHB_BCR] = { 0x78000 },
+	[GCC_PCIE_PHY_COM_BCR] = { 0x78004 },
+	[GCC_PCIE_PHY_NOCSR_COM_PHY_BCR] = { 0x7800c },
+	[GCC_PDM_BCR] = { 0x24000 },
+	[GCC_QUSB2PHY_BCR] = { 0x19000 },
+	[GCC_SDCC1_BCR] = { 0x1a000 },
+	[GCC_TCSR_PCIE_BCR] = { 0x57000 },
+	[GCC_USB30_BCR] = { 0x17000 },
+	[GCC_USB3_PHY_BCR] = { 0x18000 },
+	[GCC_USB3PHY_PHY_BCR] = { 0x18004 },
+	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x19004 },
+};
+
+static struct gdsc *gcc_sdx65_gdscs[] = {
+	[USB30_GDSC] = &usb30_gdsc,
+	[PCIE_GDSC] = &pcie_gdsc,
+};
+
+static const struct regmap_config gcc_sdx65_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1f101c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc gcc_sdx65_desc = {
+	.config = &gcc_sdx65_regmap_config,
+	.clks = gcc_sdx65_clocks,
+	.num_clks = ARRAY_SIZE(gcc_sdx65_clocks),
+	.resets = gcc_sdx65_resets,
+	.num_resets = ARRAY_SIZE(gcc_sdx65_resets),
+	.gdscs = gcc_sdx65_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_sdx65_gdscs),
+};
+
+static const struct of_device_id gcc_sdx65_match_table[] = {
+	{ .compatible = "qcom,gcc-sdx65" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gcc_sdx65_match_table);
+
+static int gcc_sdx65_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	regmap = qcom_cc_map(pdev, &gcc_sdx65_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+	/*
+	 * Keep the clocks always-ON as they are critical to the functioning
+	 * of the system:
+	 * GCC_SYS_NOC_CPUSS_AHB_CLK, GCC_CPUSS_AHB_CLK, GCC_CPUSS_GNOC_CLK
+	 */
+	regmap_update_bits(regmap, 0x6d008, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21));
+	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22));
+
+	ret = qcom_cc_really_probe(pdev, &gcc_sdx65_desc, regmap);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register GCC clocks\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static struct platform_driver gcc_sdx65_driver = {
+	.probe = gcc_sdx65_probe,
+	.driver = {
+		.name = "gcc-sdx65",
+		.of_match_table = gcc_sdx65_match_table,
+	},
+};
+
+static int __init gcc_sdx65_init(void)
+{
+	return platform_driver_register(&gcc_sdx65_driver);
+}
+subsys_initcall(gcc_sdx65_init);
+
+static void __exit gcc_sdx65_exit(void)
+{
+	platform_driver_unregister(&gcc_sdx65_driver);
+}
+module_exit(gcc_sdx65_exit);
+
+MODULE_DESCRIPTION("QTI GCC SDX65 Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.32.0

