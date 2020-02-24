Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50EBE169D37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 05:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgBXEuj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Feb 2020 23:50:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:38368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727186AbgBXEuj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Feb 2020 23:50:39 -0500
Received: from localhost.localdomain (unknown [122.182.199.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15BE120661;
        Mon, 24 Feb 2020 04:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582519837;
        bh=PRckWdB92UdYb7omVzijIP+OkcFCh7oeNo2j+xNWpdk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cMMTtx5EMa9euX3WNUdGifeZFfMhEFiAogVp0yVs8Dq4TFZSuf0oZCNhV9lLNHUCS
         UQdcSSX0Yfb4kcVhC8m1duycG4zPi/ZI7JGd1SYRJkzT0WSla0OF9HEn1RkzB7O85c
         IBf+v3do/IT81BqPbGJGMCi0Ec43ry7YH+vkQdK8=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, vnkgutta@codeaurora.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 3/5] clk: qcom: clk-alpha-pll: Add support for controlling Lucid PLLs
Date:   Mon, 24 Feb 2020 10:20:01 +0530
Message-Id: <20200224045003.3783838-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224045003.3783838-1-vkoul@kernel.org>
References: <20200224045003.3783838-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

Add programming sequence support for managing the Lucid PLLs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 193 +++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  12 ++
 2 files changed, 205 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 0adec585eb4f..9b2dfa08acb2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -52,6 +52,7 @@
 #define PLL_CONFIG_CTL_U1(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U1])
 #define PLL_TEST_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_TEST_CTL])
 #define PLL_TEST_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U])
+#define PLL_TEST_CTL_U1(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U1])
 #define PLL_STATUS(p)		((p)->offset + (p)->regs[PLL_OFF_STATUS])
 #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
 #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
@@ -116,6 +117,22 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_ALPHA_VAL] = 0x40,
 		[PLL_OFF_CAL_VAL] = 0x44,
 	},
+	[CLK_ALPHA_PLL_TYPE_LUCID] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_CAL_L_VAL] = 0x08,
+		[PLL_OFF_USER_CTL] = 0x0c,
+		[PLL_OFF_USER_CTL_U] = 0x10,
+		[PLL_OFF_USER_CTL_U1] = 0x14,
+		[PLL_OFF_CONFIG_CTL] = 0x18,
+		[PLL_OFF_CONFIG_CTL_U] = 0x1c,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x20,
+		[PLL_OFF_TEST_CTL] = 0x24,
+		[PLL_OFF_TEST_CTL_U] = 0x28,
+		[PLL_OFF_TEST_CTL_U1] = 0x2c,
+		[PLL_OFF_STATUS] = 0x30,
+		[PLL_OFF_OPMODE] = 0x38,
+		[PLL_OFF_ALPHA_VAL] = 0x40,
+	},
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 
@@ -139,6 +156,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define PLL_OUT_MASK		0x7
 #define PLL_RATE_MARGIN		500
 
+/* LUCID PLL specific settings and offsets */
+#define LUCID_PLL_CAL_VAL	0x44
+#define LUCID_PCAL_DONE		BIT(26)
+
 #define pll_alpha_width(p)					\
 		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
 				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
@@ -1370,3 +1391,175 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 	.set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
+
+/**
+ * clk_lucid_pll_configure - configure the lucid pll
+ *
+ * @pll: clk alpha pll
+ * @regmap: register map
+ * @config: configuration to apply for pll
+ */
+void clk_lucid_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+			     const struct alpha_pll_config *config)
+{
+	if (config->l)
+		regmap_write(regmap, PLL_L_VAL(pll), config->l);
+
+	regmap_write(regmap, PLL_CAL_L_VAL(pll), LUCID_PLL_CAL_VAL);
+
+	if (config->alpha)
+		regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+
+	if (config->config_ctl_val)
+		regmap_write(regmap, PLL_CONFIG_CTL(pll),
+			     config->config_ctl_val);
+
+	if (config->config_ctl_hi_val)
+		regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
+			     config->config_ctl_hi_val);
+
+	if (config->config_ctl_hi1_val)
+		regmap_write(regmap, PLL_CONFIG_CTL_U1(pll),
+			     config->config_ctl_hi1_val);
+
+	if (config->user_ctl_val)
+		regmap_write(regmap, PLL_USER_CTL(pll),
+			     config->user_ctl_val);
+
+	if (config->user_ctl_hi_val)
+		regmap_write(regmap, PLL_USER_CTL_U(pll),
+			     config->user_ctl_hi_val);
+
+	if (config->user_ctl_hi1_val)
+		regmap_write(regmap, PLL_USER_CTL_U1(pll),
+			     config->user_ctl_hi1_val);
+
+	if (config->test_ctl_val)
+		regmap_write(regmap, PLL_TEST_CTL(pll),
+			     config->test_ctl_val);
+
+	if (config->test_ctl_hi_val)
+		regmap_write(regmap, PLL_TEST_CTL_U(pll),
+			     config->test_ctl_hi_val);
+
+	if (config->test_ctl_hi1_val)
+		regmap_write(regmap, PLL_TEST_CTL_U1(pll),
+			     config->test_ctl_hi1_val);
+
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_UPDATE_BYPASS,
+			   PLL_UPDATE_BYPASS);
+
+	/* Disable PLL output */
+	regmap_update_bits(regmap, PLL_MODE(pll),  PLL_OUTCTRL, 0);
+
+	/* Set operation mode to OFF */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+
+	/* Place the PLL in STANDBY mode */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+}
+EXPORT_SYMBOL_GPL(clk_lucid_pll_configure);
+
+/*
+ * The Lucid PLL requires a power-on self-calibration which happens when the
+ * PLL comes out of reset. Calibrate in case it is not completed.
+ */
+static int alpha_pll_lucid_prepare(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 regval;
+	int ret;
+
+	/* Return early if calibration is not needed. */
+	regmap_read(pll->clkr.regmap, PLL_STATUS(pll), &regval);
+	if (regval & LUCID_PCAL_DONE)
+		return 0;
+
+	/* On/off to calibrate */
+	ret = clk_trion_pll_enable(hw);
+	if (!ret)
+		clk_trion_pll_disable(hw);
+
+	return ret;
+}
+
+static int alpha_pll_lucid_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long prate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	unsigned long rrate;
+	u32 regval, l, alpha_width = pll_alpha_width(pll);
+	u64 a;
+	int ret;
+
+	rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
+
+	/*
+	 * Due to a limited number of bits for fractional rate programming, the
+	 * rounded up rate could be marginally higher than the requested rate.
+	 */
+	if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
+		pr_err("Call set rate on the PLL with rounded rates!\n");
+		return -EINVAL;
+	}
+
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
+
+	/* Latch the PLL input */
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
+				 PLL_UPDATE, PLL_UPDATE);
+	if (ret)
+		return ret;
+
+	/* Wait for 2 reference cycles before checking the ACK bit. */
+	udelay(1);
+	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &regval);
+	if (!(regval & ALPHA_PLL_ACK_LATCH)) {
+		pr_err("Lucid PLL latch failed. Output may be unstable!\n");
+		return -EINVAL;
+	}
+
+	/* Return the latch input to 0 */
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
+				 PLL_UPDATE, 0);
+	if (ret)
+		return ret;
+
+	if (clk_hw_is_enabled(hw)) {
+		ret = wait_for_pll_enable_lock(pll);
+		if (ret)
+			return ret;
+	}
+
+	/* Wait for PLL output to stabilize */
+	udelay(100);
+	return 0;
+}
+
+const struct clk_ops clk_alpha_pll_lucid_ops = {
+	.prepare = alpha_pll_lucid_prepare,
+	.enable = clk_trion_pll_enable,
+	.disable = clk_trion_pll_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = clk_trion_pll_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = alpha_pll_lucid_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_ops);
+
+const struct clk_ops clk_alpha_pll_fixed_lucid_ops = {
+	.enable = clk_trion_pll_enable,
+	.disable = clk_trion_pll_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = clk_trion_pll_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_ops);
+
+const struct clk_ops clk_alpha_pll_postdiv_lucid_ops = {
+	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
+	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
+	.set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index fbc1f67c7a26..704674a153b6 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -14,6 +14,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_BRAMMO,
 	CLK_ALPHA_PLL_TYPE_FABIA,
 	CLK_ALPHA_PLL_TYPE_TRION,
+	CLK_ALPHA_PLL_TYPE_LUCID,
 	CLK_ALPHA_PLL_TYPE_MAX,
 };
 
@@ -30,6 +31,7 @@ enum {
 	PLL_OFF_CONFIG_CTL_U1,
 	PLL_OFF_TEST_CTL,
 	PLL_OFF_TEST_CTL_U,
+	PLL_OFF_TEST_CTL_U1,
 	PLL_OFF_STATUS,
 	PLL_OFF_OPMODE,
 	PLL_OFF_FRAC,
@@ -94,10 +96,13 @@ struct alpha_pll_config {
 	u32 alpha_hi;
 	u32 config_ctl_val;
 	u32 config_ctl_hi_val;
+	u32 config_ctl_hi1_val;
 	u32 user_ctl_val;
 	u32 user_ctl_hi_val;
+	u32 user_ctl_hi1_val;
 	u32 test_ctl_val;
 	u32 test_ctl_hi_val;
+	u32 test_ctl_hi1_val;
 	u32 main_output_mask;
 	u32 aux_output_mask;
 	u32 aux2_output_mask;
@@ -123,10 +128,17 @@ extern const struct clk_ops clk_alpha_pll_fabia_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_fabia_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_fabia_ops;
 
+extern const struct clk_ops clk_alpha_pll_lucid_ops;
+extern const struct clk_ops clk_alpha_pll_fixed_lucid_ops;
+extern const struct clk_ops clk_alpha_pll_postdiv_lucid_ops;
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				const struct alpha_pll_config *config);
+void clk_lucid_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+			     const struct alpha_pll_config *config);
+
 extern const struct clk_ops clk_trion_fixed_pll_ops;
 extern const struct clk_ops clk_trion_pll_postdiv_ops;
 
-- 
2.24.1

