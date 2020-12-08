Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311262D23E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 07:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgLHGsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 01:48:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:57582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726069AbgLHGsO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 01:48:14 -0500
From:   Vinod Koul <vkoul@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 4/5] clk: qcom: clk-alpha-pll: Add support for Lucid 5LPE PLL
Date:   Tue,  8 Dec 2020 12:17:01 +0530
Message-Id: <20201208064702.3654324-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208064702.3654324-1-vkoul@kernel.org>
References: <20201208064702.3654324-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vivek Aknurwar <viveka@codeaurora.org>

Lucid 5LPE is a slightly different Lucid PLL with different offsets and
porgramming sequence so add support for these

Signed-off-by: Vivek Aknurwar <viveka@codeaurora.org>
Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
[vkoul: rebase and tidy up for upstream]
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 223 +++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |   4 +
 2 files changed, 227 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 564431130a76..6a399663d564 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -146,6 +146,12 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 /* LUCID PLL specific settings and offsets */
 #define LUCID_PCAL_DONE		BIT(27)
 
+/* LUCID 5LPE PLL specific settings and offsets */
+#define LUCID_5LPE_PCAL_DONE		BIT(11)
+#define LUCID_5LPE_ENABLE_VOTE_RUN	BIT(21)
+#define LUCID_5LPE_PLL_LATCH_INPUT	BIT(14)
+#define LUCID_5LPE_ALPHA_PLL_ACK_LATCH	BIT(13)
+
 #define pll_alpha_width(p)					\
 		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
 				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
@@ -1561,3 +1567,220 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_ops = {
 	.set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_ops);
+
+static int alpha_pll_lucid_5lpe_enable(struct clk_hw *hw)
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
+	if (val & LUCID_5LPE_ENABLE_VOTE_RUN) {
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
+
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
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
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_OUT_MASK, PLL_OUT_MASK);
+	if (ret)
+		return ret;
+
+	/* Enable the global PLL outputs */
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
+	if (ret)
+		return ret;
+
+	/* Ensure that the write above goes through before returning. */
+	mb();
+	return ret;
+}
+
+static void alpha_pll_lucid_5lpe_disable(struct clk_hw *hw)
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
+	if (val & LUCID_5LPE_ENABLE_VOTE_RUN) {
+		clk_disable_regmap(hw);
+		return;
+	}
+
+	/* Disable the global PLL output */
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
+	if (ret)
+		return;
+
+	/* Disable the PLL outputs */
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_OUT_MASK, 0);
+	if (ret)
+		return;
+
+	/* Place the PLL mode in STANDBY */
+	regmap_write(pll->clkr.regmap, PLL_OPMODE(pll), PLL_STANDBY);
+}
+
+/*
+ * The Lucid 5LPE PLL requires a power-on self-calibration which happens
+ * when the PLL comes out of reset. Calibrate in case it is not completed.
+ */
+static int alpha_pll_lucid_5lpe_prepare(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	struct clk_hw *p;
+	u32 regval;
+	int ret;
+
+	/* Return early if calibration is not needed. */
+	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &regval);
+	if (regval & LUCID_5LPE_PCAL_DONE)
+		return 0;
+
+	p = clk_hw_get_parent(hw);
+	if (!p)
+		return -EINVAL;
+
+	ret = alpha_pll_lucid_5lpe_enable(hw);
+	if (ret)
+		return ret;
+
+	alpha_pll_lucid_5lpe_disable(hw);
+
+	return 0;
+}
+
+static int alpha_pll_lucid_5lpe_set_rate(struct clk_hw *hw, unsigned long rate,
+					 unsigned long prate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	unsigned long rrate;
+	u32 regval, l;
+	u64 a;
+	int ret;
+
+	rrate = alpha_pll_round_rate(rate, prate, &l, &a, ALPHA_REG_16BIT_WIDTH);
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
+				 LUCID_5LPE_PLL_LATCH_INPUT, LUCID_5LPE_PLL_LATCH_INPUT);
+	if (ret)
+		return ret;
+
+	/* Wait for 2 reference cycles before checking the ACK bit. */
+	udelay(1);
+	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &regval);
+	if (!(regval & LUCID_5LPE_ALPHA_PLL_ACK_LATCH)) {
+		pr_err("Lucid 5LPE PLL latch failed. Output may be unstable!\n");
+		return -EINVAL;
+	}
+
+	/* Return the latch input to 0 */
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), LUCID_5LPE_PLL_LATCH_INPUT, 0);
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
+static int clk_lucid_5lpe_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
+					       unsigned long parent_rate)
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
+	if (val & LUCID_5LPE_ENABLE_VOTE_RUN)
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
+				(BIT(pll->width) - 1) << pll->post_div_shift,
+				val << pll->post_div_shift);
+}
+
+const struct clk_ops clk_alpha_pll_lucid_5lpe_ops = {
+	.prepare = alpha_pll_lucid_5lpe_prepare,
+	.enable = alpha_pll_lucid_5lpe_enable,
+	.disable = alpha_pll_lucid_5lpe_disable,
+	.set_rate = alpha_pll_lucid_5lpe_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_5lpe_ops);
+
+const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
+	.enable = alpha_pll_lucid_5lpe_enable,
+	.disable = alpha_pll_lucid_5lpe_disable,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_5lpe_ops);
+
+const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
+	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
+	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
+	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index d3201b87c0cd..d983b1aab8c8 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -142,6 +142,10 @@ extern const struct clk_ops clk_alpha_pll_lucid_ops;
 #define clk_alpha_pll_fixed_lucid_ops clk_alpha_pll_fixed_trion_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_ops;
 
+extern const struct clk_ops clk_alpha_pll_lucid_5lpe_ops;
+extern const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops;
+extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
-- 
2.26.2

