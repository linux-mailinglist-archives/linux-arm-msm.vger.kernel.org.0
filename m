Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB6D3D2EC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 23:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhGVU3j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 16:29:39 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:3934 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231521AbhGVU3j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 16:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1626988213; x=1658524213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RY/HHyb8lBWGBzU0knNiM5SJ3gZZxU0RzQxff+DmOoY=;
  b=w/d6nUbdc4C7/RPNmkfoIcNlcHkVKFzwk8QVmsxE3G7mluKm5DCd57ja
   yh4gMz/aOdtK8XElGgWu/PniuUMjN+JST35otraHOkyjR1KP7bCVMDbji
   qTJz9gC4U8Hz7xUJUL918FGXpLCFDxlwqzUAjeFLtJp5OTfRoQOVaQueH
   w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jul 2021 14:10:13 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Jul 2021 14:10:13 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 22 Jul 2021 14:10:12 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vamsi Krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v2 2/6] clk: qcom: Add new PLL type for SDX65
Date:   Thu, 22 Jul 2021 14:09:39 -0700
Message-ID: <223a1d8020d50c35ff2621f95d69b4a626b6893b.1626986805.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626986805.git.quic_vamslank@quicinc.com>
References: <cover.1626986805.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Add a new PLL type for SDX65 SoC from Qualcomm.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 170 +++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |   4 +
 2 files changed, 174 insertions(+)

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
-- 
2.32.0

