Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D25A0EB001
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 13:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfJaMVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 08:21:37 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37966 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJaMVh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 08:21:37 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D184B601C4; Thu, 31 Oct 2019 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572524495;
        bh=uZOwBG4WgcqkJxRDDfEuw3f5BcUKk8vqQ4PMrPSN908=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i6UA0zmvO2+PU2asX1vFmJ6wrQn0kl+JP2GtZXdA437IwvxJ4w+H4Xs/mrLMGZMML
         UJcr42h6E/dm9aCUgf348dbflJ7IFk00rDqMAoKBOLmmbI7n3JsluQeO03IaKFIxQ+
         jfFm+8gxLAwYheXhUMpUwSjSzsE60aO4aAy4Lxck=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DBB760931;
        Thu, 31 Oct 2019 12:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572524494;
        bh=uZOwBG4WgcqkJxRDDfEuw3f5BcUKk8vqQ4PMrPSN908=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n5DupnFSXk82IXMOlYcTGvO5ToS02ySbOE+A3DTalFYUuzfVfn/qW8jMMZCB96t7S
         cihRUnXUU8S4FltOA0kk3rO5qZmCbemmQq3jKiCg9oh33Se7cFFMsS9qP2lPujdeSb
         1FOoV1pBGv+pOdFWPHxPbdqPoeqKTiP/NwWSL11E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9DBB760931
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
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
Subject: [PATCH v1 1/7] clk: qcom: clk-alpha-pll: Add support for Fabia PLL calibration
Date:   Thu, 31 Oct 2019 17:51:07 +0530
Message-Id: <1572524473-19344-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the cases where the PLL is not calibrated the PLL could fail to lock.
Add support for prepare ops which would take care of the same.

Fabia PLL user/test control registers might required to be configured, so
add support for configuring them.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 84 +++++++++++++++++++++++++++++++++++++---
 drivers/clk/qcom/clk-alpha-pll.h |  4 ++
 2 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 055318f..8cb77ca 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1024,6 +1024,25 @@ void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 		regmap_write(regmap, PLL_CONFIG_CTL(pll),
 						config->config_ctl_val);

+	if (config->config_ctl_hi_val)
+		regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
+						config->config_ctl_hi_val);
+
+	if (config->user_ctl_val)
+		regmap_write(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
+
+	if (config->user_ctl_hi_val)
+		regmap_write(regmap, PLL_USER_CTL_U(pll),
+						config->user_ctl_hi_val);
+
+	if (config->test_ctl_val)
+		regmap_write(regmap, PLL_TEST_CTL(pll),
+						config->test_ctl_val);
+
+	if (config->test_ctl_hi_val)
+		regmap_write(regmap, PLL_TEST_CTL_U(pll),
+						config->test_ctl_hi_val);
+
 	if (config->post_div_mask) {
 		mask = config->post_div_mask;
 		val = config->post_div_val;
@@ -1141,15 +1160,11 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
 						unsigned long prate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 val, l, alpha_width = pll_alpha_width(pll);
+	u32 l, alpha_width = pll_alpha_width(pll);
 	u64 a;
 	unsigned long rrate;
 	int ret = 0;

-	ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
-	if (ret)
-		return ret;
-
 	rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);

 	/*
@@ -1167,7 +1182,66 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
 	return __clk_alpha_pll_update_latch(pll);
 }

+static int alpha_pll_fabia_prepare(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	const struct pll_vco *vco;
+	struct clk_hw *parent_hw;
+	unsigned long cal_freq, rrate;
+	u32 cal_l, regval, alpha_width = pll_alpha_width(pll);
+	u64 a;
+	int ret;
+
+	/* Check if calibration needs to be done i.e. PLL is in reset */
+	ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &regval);
+	if (ret)
+		return ret;
+
+	/* Return early if calibration is not needed. */
+	if (regval & PLL_RESET_N)
+		return 0;
+
+	vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
+	if (!vco) {
+		pr_err("alpha pll: not in a valid vco range\n");
+		return -EINVAL;
+	}
+
+	cal_freq = DIV_ROUND_CLOSEST((pll->vco_table[0].min_freq +
+				pll->vco_table[0].max_freq) * 54, 100);
+
+	parent_hw = clk_hw_get_parent(hw);
+	if (!parent_hw)
+		return -EINVAL;
+
+	rrate = alpha_pll_round_rate(cal_freq, clk_hw_get_rate(parent_hw),
+					&cal_l, &a, alpha_width);
+	/*
+	 * Due to a limited number of bits for fractional rate programming, the
+	 * rounded up rate could be marginally higher than the requested rate.
+	 */
+	if (rrate > (cal_freq + FABIA_PLL_RATE_MARGIN) || rrate < cal_freq) {
+		pr_err("Call set rate on the PLL with rounded rates!\n");
+		return -EINVAL;
+	}
+
+	/* Setup PLL for calibration frequency */
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), cal_l);
+
+	/* Bringup the pll at calibration frequency */
+	ret = clk_alpha_pll_enable(hw);
+	if (ret) {
+		pr_err("alpha pll calibration failed\n");
+		return ret;
+	}
+
+	clk_alpha_pll_disable(hw);
+
+	return 0;
+}
+
 const struct clk_ops clk_alpha_pll_fabia_ops = {
+	.prepare = alpha_pll_fabia_prepare,
 	.enable = alpha_pll_fabia_enable,
 	.disable = alpha_pll_fabia_disable,
 	.is_enabled = clk_alpha_pll_is_enabled,
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 15f27f4..b03eea0 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -94,6 +94,10 @@ struct alpha_pll_config {
 	u32 alpha_hi;
 	u32 config_ctl_val;
 	u32 config_ctl_hi_val;
+	u32 user_ctl_val;
+	u32 user_ctl_hi_val;
+	u32 test_ctl_val;
+	u32 test_ctl_hi_val;
 	u32 main_output_mask;
 	u32 aux_output_mask;
 	u32 aux2_output_mask;
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

