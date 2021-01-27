Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55AC430542A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 08:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhA0HM6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 02:12:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:45580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232462AbhA0HJU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 02:09:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 333BF2072E;
        Wed, 27 Jan 2021 07:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611731315;
        bh=TXEgQVt6dpC9FtTT29E+AwUmoy6iV102b2j7ZJHxRv4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nOPd8Wp7s1/JvwdqWTz+H7QfjxACqD5kiynePuShnQw8iqKPgwyBuiKcQTga7EKw0
         1Qo80IzNA56qUoc9TvuEOFBqR+Y4cgebPiOYPt6F0fkKLpmyh3kOXWkNSjBeQ02/M1
         VgYUVhZyQUkwShAyuSvjWCi+it7qT/CBVVevq9s5M06yyLwdcBNhpVBJxlQk5+nnBY
         ZVZm9Eh38A6ryFn4MPoWN6eX8H880oIfiUQz9lOx1H/QBobRyOmC0JBwJ6JZRbgh53
         v6BB+3lThQk3fnJsFpyVRHvNWirrfRr3YPksMgBYEjOanmoPuLD9WNrglzqiynFRLL
         FO9zOnG+F8irw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v5 3/5] clk: qcom: clk-alpha-pll: Add support for Lucid 5LPE PLL
Date:   Wed, 27 Jan 2021 12:38:09 +0530
Message-Id: <20210127070811.152690-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127070811.152690-1-vkoul@kernel.org>
References: <20210127070811.152690-1-vkoul@kernel.org>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 173 +++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |   4 +
 2 files changed, 177 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index a30ea7b09224..c6eb99169ddc 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -156,6 +156,12 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 /* LUCID PLL specific settings and offsets */
 #define LUCID_PCAL_DONE		BIT(27)
 
+/* LUCID 5LPE PLL specific settings and offsets */
+#define LUCID_5LPE_PCAL_DONE		BIT(11)
+#define LUCID_5LPE_ALPHA_PLL_ACK_LATCH	BIT(13)
+#define LUCID_5LPE_PLL_LATCH_INPUT	BIT(14)
+#define LUCID_5LPE_ENABLE_VOTE_RUN	BIT(21)
+
 #define pll_alpha_width(p)					\
 		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
 				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
@@ -1604,3 +1610,170 @@ const struct clk_ops clk_alpha_pll_agera_ops = {
 	.set_rate = clk_alpha_pll_agera_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_agera_ops);
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
+	/* Check if PLL is already enabled, return if enabled */
+	ret = trion_pll_is_enabled(pll, pll->clkr.regmap);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+	if (ret)
+		return ret;
+
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
+	return regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
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
+	u32 val = 0;
+	int ret;
+
+	/* Return early if calibration is not needed. */
+	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
+	if (val & LUCID_5LPE_PCAL_DONE)
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
+	return __alpha_pll_trion_set_rate(hw, rate, prate,
+					  LUCID_5LPE_PLL_LATCH_INPUT,
+					  LUCID_5LPE_ALPHA_PLL_ACK_LATCH);
+}
+
+static int clk_lucid_5lpe_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
+					       unsigned long parent_rate)
+{
+	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
+	int i, val = 0, div, ret;
+	u32 mask;
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
+	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	for (i = 0; i < pll->num_post_div; i++) {
+		if (pll->post_div_table[i].div == div) {
+			val = pll->post_div_table[i].val;
+			break;
+		}
+	}
+
+	mask = GENMASK(pll->width + pll->post_div_shift - 1, pll->post_div_shift);
+	return regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
+				  mask, val << pll->post_div_shift);
+}
+
+const struct clk_ops clk_alpha_pll_lucid_5lpe_ops = {
+	.prepare = alpha_pll_lucid_5lpe_prepare,
+	.enable = alpha_pll_lucid_5lpe_enable,
+	.disable = alpha_pll_lucid_5lpe_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = clk_trion_pll_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = alpha_pll_lucid_5lpe_set_rate,
+};
+EXPORT_SYMBOL(clk_alpha_pll_lucid_5lpe_ops);
+
+const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
+	.enable = alpha_pll_lucid_5lpe_enable,
+	.disable = alpha_pll_lucid_5lpe_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = clk_trion_pll_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+};
+EXPORT_SYMBOL(clk_alpha_pll_fixed_lucid_5lpe_ops);
+
+const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
+	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
+	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
+	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
+};
+EXPORT_SYMBOL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 0ea30d2f3da1..6943e933be0f 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -144,6 +144,10 @@ extern const struct clk_ops clk_alpha_pll_lucid_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_ops;
 extern const struct clk_ops clk_alpha_pll_agera_ops;
 
+extern const struct clk_ops clk_alpha_pll_lucid_5lpe_ops;
+extern const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops;
+extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
-- 
2.26.2

