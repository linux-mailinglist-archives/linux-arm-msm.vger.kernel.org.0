Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D195261669
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 19:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732090AbgIHRH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 13:07:58 -0400
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:60186
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731817AbgIHRHx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 13:07:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599584872;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=bZEmMytqxn4kWANtqg4eCYokeY63ldxomhOzIQHADBM=;
        b=BXC2F2wKK9zXrFdvqTcc4KRL/5ZusZrvpwejLyFDjiyvHlDYq6KOocRPkChAr1NQ
        tfh9vmCO/hATlkH/BtwYgoMSVKn+OvAlqnOx0omVlOQQcTxemWsWjLleXivEDmj/D8A
        h6asTgbbZEuEMojgogstXSiqygwJmsfQr8CzIf6I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599584872;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=bZEmMytqxn4kWANtqg4eCYokeY63ldxomhOzIQHADBM=;
        b=TNI/I6C4AnhsCgalruJNZ4w4qrutaF+F3QGBEYnjnt3Yj/oBfQQy8VcMoRltbwuK
        4pSoU4IzxB+QXMXWQX3mynRZdleTakUKmnuXnzlrlp/TKVQ+JyZprexz0UzJmcG3PzX
        xUk3nFCg58SFXg7lvH7wwXAU8EyfoE7YJMfVYQ9k=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9677CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 1/3] clk: qcom: clk-alpha-pll: Add support for controlling Agera PLLs
Date:   Tue, 8 Sep 2020 17:07:52 +0000
Message-ID: <010101746eb0276a-510c98e1-9db0-4bbb-a0f4-51e9536d68ca-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599584848-15530-1-git-send-email-tdas@codeaurora.org>
References: <1599584848-15530-1-git-send-email-tdas@codeaurora.org>
X-SES-Outgoing: 2020.09.08-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add programming sequence support for managing the Agera PLLs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 82 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  4 ++
 2 files changed, 86 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 26139ef..fb27fcf 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -116,6 +116,16 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_OPMODE] = 0x38,
 		[PLL_OFF_ALPHA_VAL] = 0x40,
 	},
+	[CLK_ALPHA_PLL_TYPE_AGERA] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_USER_CTL] = 0x0c,
+		[PLL_OFF_CONFIG_CTL] = 0x10,
+		[PLL_OFF_CONFIG_CTL_U] = 0x14,
+		[PLL_OFF_TEST_CTL] = 0x18,
+		[PLL_OFF_TEST_CTL_U] = 0x1c,
+		[PLL_OFF_STATUS] = 0x2c,
+	},
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);

@@ -1561,3 +1571,75 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_ops = {
 	.set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_ops);
+
+void clk_agera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+			const struct alpha_pll_config *config)
+{
+	if (config->l)
+		regmap_write(regmap, PLL_L_VAL(pll), config->l);
+
+	if (config->alpha)
+		regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+
+	if (config->user_ctl_val)
+		regmap_write(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
+
+	if (config->config_ctl_val)
+		regmap_write(regmap, PLL_CONFIG_CTL(pll),
+						config->config_ctl_val);
+
+	if (config->config_ctl_hi_val)
+		regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
+						config->config_ctl_hi_val);
+
+	if (config->test_ctl_val)
+		regmap_write(regmap, PLL_TEST_CTL(pll),
+						config->test_ctl_val);
+
+	if (config->test_ctl_hi_val)
+		regmap_write(regmap,  PLL_TEST_CTL_U(pll),
+						config->test_ctl_hi_val);
+}
+EXPORT_SYMBOL_GPL(clk_agera_pll_configure);
+
+static int alpha_pll_agera_set_rate(struct clk_hw *hw, unsigned long rate,
+							unsigned long prate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 l, alpha_width = pll_alpha_width(pll);
+	unsigned long rrate;
+	u64 a;
+
+	rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
+
+	/*
+	 * Due to limited number of bits for fractional rate programming, the
+	 * rounded up rate could be marginally higher than the requested rate.
+	 */
+	if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
+		pr_err("Call set rate on the PLL with rounded rates!\n");
+		return -EINVAL;
+	}
+
+	/* change L_VAL without having to go through the power on sequence */
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
+
+	/* Ensure that the write above goes through before proceeding. */
+	mb();
+
+	if (clk_hw_is_enabled(hw))
+		return wait_for_pll_enable_lock(pll);
+
+	return 0;
+}
+
+const struct clk_ops clk_alpha_pll_agera_ops = {
+	.enable = clk_alpha_pll_enable,
+	.disable = clk_alpha_pll_disable,
+	.is_enabled = clk_alpha_pll_is_enabled,
+	.recalc_rate = alpha_pll_fabia_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = alpha_pll_agera_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_agera_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index d3201b8..0ea30d2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -15,6 +15,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_FABIA,
 	CLK_ALPHA_PLL_TYPE_TRION,
 	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
+	CLK_ALPHA_PLL_TYPE_AGERA,
 	CLK_ALPHA_PLL_TYPE_MAX,
 };

@@ -141,6 +142,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_trion_ops;
 extern const struct clk_ops clk_alpha_pll_lucid_ops;
 #define clk_alpha_pll_fixed_lucid_ops clk_alpha_pll_fixed_trion_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_ops;
+extern const struct clk_ops clk_alpha_pll_agera_ops;

 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
@@ -148,6 +150,8 @@ void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				const struct alpha_pll_config *config);
 void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
+void clk_agera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				const struct alpha_pll_config *config);
 #define clk_lucid_pll_configure(pll, regmap, config) \
 	clk_trion_pll_configure(pll, regmap, config)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

