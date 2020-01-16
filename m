Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B31C13FF33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 00:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391144AbgAPXkr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 18:40:47 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:40742 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391769AbgAPXkT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 18:40:19 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579218018; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=Y7TS7O4OOPizCMSc3nuJ6lFaNvlwd8VBQwIek2xeB84=; b=dtJByB1EV2ZyEEY/jXj4IMXnQadQpyWL6AjM7wRgw0SSNy5MhrAm2iLQmepYlSN2AvaSGbyV
 20uCQAKjacfsirTkfB76grpsy0SfnTOct5Kk1PtSLl0vCsyksax+mXB5YiFOHiBlSQxuxL3Z
 Gz/lA1rBZycGfKzCfUGQ3+R4AME=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e20f45f.7f760fedd4c8-smtp-out-n03;
 Thu, 16 Jan 2020 23:40:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2B1BDC447B0; Thu, 16 Jan 2020 23:40:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vgutta-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vgutta)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D6278C433CB;
        Thu, 16 Jan 2020 23:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6278C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vnkgutta@codeaurora.org
From:   Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, vinod.koul@linaro.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        vnkgutta@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] clk: qcom: clk-alpha-pll: Refactor and cleanup trion PLL
Date:   Thu, 16 Jan 2020 15:39:50 -0800
Message-Id: <1579217994-22219-4-git-send-email-vnkgutta@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

The PLL run and standby modes are similar across the PLLs, thus rename
and refactor the code accordingly.

Remove duplicate function for calculating the round rate of PLL and also
update the trion pll ops to use the common function.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 71 +++++++++++++---------------------------
 1 file changed, 22 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 7c2936d..1b073b2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -134,15 +134,10 @@
 #define PLL_HUAYRA_N_MASK		0xff
 #define PLL_HUAYRA_ALPHA_WIDTH		16
 
-#define FABIA_OPMODE_STANDBY	0x0
-#define FABIA_OPMODE_RUN	0x1
-
-#define FABIA_PLL_OUT_MASK	0x7
-#define FABIA_PLL_RATE_MARGIN	500
-
-#define TRION_PLL_STANDBY	0x0
-#define TRION_PLL_RUN		0x1
-#define TRION_PLL_OUT_MASK	0x7
+#define PLL_STANDBY		0x0
+#define PLL_RUN			0x1
+#define PLL_OUT_MASK		0x7
+#define PLL_RATE_MARGIN		500
 
 #define pll_alpha_width(p)					\
 		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
@@ -765,7 +760,7 @@ static int trion_pll_is_enabled(struct clk_alpha_pll *pll,
 	if (ret)
 		return 0;
 
-	return ((opmode_regval & TRION_PLL_RUN) && (mode_regval & PLL_OUTCTRL));
+	return ((opmode_regval & PLL_RUN) && (mode_regval & PLL_OUTCTRL));
 }
 
 static int clk_trion_pll_is_enabled(struct clk_hw *hw)
@@ -795,7 +790,7 @@ static int clk_trion_pll_enable(struct clk_hw *hw)
 	}
 
 	/* Set operation mode to RUN */
-	regmap_write(regmap, PLL_OPMODE(pll), TRION_PLL_RUN);
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
 
 	ret = wait_for_pll_enable_lock(pll);
 	if (ret)
@@ -803,7 +798,7 @@ static int clk_trion_pll_enable(struct clk_hw *hw)
 
 	/* Enable the PLL outputs */
 	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
-				 TRION_PLL_OUT_MASK, TRION_PLL_OUT_MASK);
+				 PLL_OUT_MASK, PLL_OUT_MASK);
 	if (ret)
 		return ret;
 
@@ -836,12 +831,12 @@ static void clk_trion_pll_disable(struct clk_hw *hw)
 
 	/* Disable the PLL outputs */
 	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
-				 TRION_PLL_OUT_MASK, 0);
+				 PLL_OUT_MASK, 0);
 	if (ret)
 		return;
 
 	/* Place the PLL mode in STANDBY */
-	regmap_write(regmap, PLL_OPMODE(pll), TRION_PLL_STANDBY);
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
 	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
 }
 
@@ -849,33 +844,12 @@ static void clk_trion_pll_disable(struct clk_hw *hw)
 clk_trion_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	struct regmap *regmap = pll->clkr.regmap;
-	u32 l, frac;
-	u64 prate = parent_rate;
-
-	regmap_read(regmap, PLL_L_VAL(pll), &l);
-	regmap_read(regmap, PLL_ALPHA_VAL(pll), &frac);
-
-	return alpha_pll_calc_rate(prate, l, frac, ALPHA_REG_16BIT_WIDTH);
-}
-
-static long clk_trion_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
-{
-	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	unsigned long min_freq, max_freq;
-	u32 l;
-	u64 a;
-
-	rate = alpha_pll_round_rate(rate, *prate,
-				    &l, &a, ALPHA_REG_16BIT_WIDTH);
-	if (!pll->vco_table || alpha_pll_find_vco(pll, rate))
-		return rate;
+	u32 l, frac, alpha_width = pll_alpha_width(pll);
 
-	min_freq = pll->vco_table[0].min_freq;
-	max_freq = pll->vco_table[pll->num_vco - 1].max_freq;
+	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
+	regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac);
 
-	return clamp(rate, min_freq, max_freq);
+	return alpha_pll_calc_rate(parent_rate, l, frac, alpha_width);
 }
 
 const struct clk_ops clk_alpha_pll_fixed_ops = {
@@ -921,7 +895,7 @@ static long clk_trion_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	.disable = clk_trion_pll_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = clk_trion_pll_recalc_rate,
-	.round_rate = clk_trion_pll_round_rate,
+	.round_rate = clk_alpha_pll_round_rate,
 };
 EXPORT_SYMBOL_GPL(clk_trion_fixed_pll_ops);
 
@@ -1088,14 +1062,14 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
 		return ret;
 
 	/* Skip If PLL is already running */
-	if ((opmode_val & FABIA_OPMODE_RUN) && (val & PLL_OUTCTRL))
+	if ((opmode_val & PLL_RUN) && (val & PLL_OUTCTRL))
 		return 0;
 
 	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
 	if (ret)
 		return ret;
 
-	ret = regmap_write(regmap, PLL_OPMODE(pll), FABIA_OPMODE_STANDBY);
+	ret = regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
 	if (ret)
 		return ret;
 
@@ -1104,7 +1078,7 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
 	if (ret)
 		return ret;
 
-	ret = regmap_write(regmap, PLL_OPMODE(pll), FABIA_OPMODE_RUN);
+	ret = regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
 	if (ret)
 		return ret;
 
@@ -1113,7 +1087,7 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
 		return ret;
 
 	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
-				 FABIA_PLL_OUT_MASK, FABIA_PLL_OUT_MASK);
+				 PLL_OUT_MASK, PLL_OUT_MASK);
 	if (ret)
 		return ret;
 
@@ -1143,13 +1117,12 @@ static void alpha_pll_fabia_disable(struct clk_hw *hw)
 		return;
 
 	/* Disable main outputs */
-	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll), FABIA_PLL_OUT_MASK,
-				 0);
+	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll), PLL_OUT_MASK, 0);
 	if (ret)
 		return;
 
 	/* Place the PLL in STANDBY */
-	regmap_write(regmap, PLL_OPMODE(pll), FABIA_OPMODE_STANDBY);
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
 }
 
 static unsigned long alpha_pll_fabia_recalc_rate(struct clk_hw *hw,
@@ -1178,7 +1151,7 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * Due to limited number of bits for fractional rate programming, the
 	 * rounded up rate could be marginally higher than the requested rate.
 	 */
-	if (rrate > (rate + FABIA_PLL_RATE_MARGIN) || rrate < rate) {
+	if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
 		pr_err("Call set rate on the PLL with rounded rates!\n");
 		return -EINVAL;
 	}
@@ -1227,7 +1200,7 @@ static int alpha_pll_fabia_prepare(struct clk_hw *hw)
 	 * Due to a limited number of bits for fractional rate programming, the
 	 * rounded up rate could be marginally higher than the requested rate.
 	 */
-	if (rrate > (cal_freq + FABIA_PLL_RATE_MARGIN) || rrate < cal_freq)
+	if (rrate > (cal_freq + PLL_RATE_MARGIN) || rrate < cal_freq)
 		return -EINVAL;
 
 	/* Setup PLL for calibration frequency */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
