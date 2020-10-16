Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36AA7290B88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 20:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392778AbgJPSoC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 14:44:02 -0400
Received: from z5.mailgun.us ([104.130.96.5]:40009 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392573AbgJPSn7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 14:43:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602873837; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=DdEmyAt6OG47ZNCJBFAd5fFPBhGLg2K9By2LfTmzU3w=; b=PFKctBBD+mErcISGUqJPCO/1nNJf7/6hXsgZXkrsjX0OaDAreikiwed0td0KLovbriY+9Ccr
 rxQW64O+j5/8FW4aceS3T+Qe3mBCoQ6MhPIlaFv0z1focHh7ve70rbjl2c2jKMSvWto2uPs9
 MInPPwgAvYX/Ds+bdi+/uT6jMQE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f89e9ec06d81bc48d6eca67 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 18:43:56
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1CEDFC433FE; Fri, 16 Oct 2020 18:43:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 06226C433C9;
        Fri, 16 Oct 2020 18:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 06226C433C9
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
Subject: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: Add support for helper functions
Date:   Sat, 17 Oct 2020 00:13:32 +0530
Message-Id: <1602873815-1677-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602873815-1677-1-git-send-email-tdas@codeaurora.org>
References: <1602873815-1677-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce clk_alpha_pll_write_config and alpha_pll_check_rate_margin
helper functions to be across PLL configure functions and PLL set rate
functions.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 155 +++++++++++++++++----------------------
 1 file changed, 66 insertions(+), 89 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 5644311..f3b8b54 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -207,6 +207,13 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 #define wait_for_pll_update_ack_clear(pll) \
 	wait_for_pll(pll, ALPHA_PLL_ACK_LATCH, 1, "update_ack_clear")

+static void clk_alpha_pll_write_config(struct regmap *regmap, unsigned int reg,
+					unsigned int val)
+{
+	if (val)
+		regmap_write(regmap, reg, val);
+}
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
@@ -1004,33 +1011,19 @@ void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 {
 	u32 val, mask;

-	if (config->l)
-		regmap_write(regmap, PLL_L_VAL(pll), config->l);
-
-	if (config->alpha)
-		regmap_write(regmap, PLL_FRAC(pll), config->alpha);
-
-	if (config->config_ctl_val)
-		regmap_write(regmap, PLL_CONFIG_CTL(pll),
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
+	clk_alpha_pll_write_config(regmap, PLL_FRAC(pll), config->alpha);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll),
 						config->config_ctl_val);
-
-	if (config->config_ctl_hi_val)
-		regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll),
 						config->config_ctl_hi_val);
-
-	if (config->user_ctl_val)
-		regmap_write(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
-
-	if (config->user_ctl_hi_val)
-		regmap_write(regmap, PLL_USER_CTL_U(pll),
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll),
+						config->user_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll),
 						config->user_ctl_hi_val);
-
-	if (config->test_ctl_val)
-		regmap_write(regmap, PLL_TEST_CTL(pll),
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
 						config->test_ctl_val);
-
-	if (config->test_ctl_hi_val)
-		regmap_write(regmap, PLL_TEST_CTL_U(pll),
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
 						config->test_ctl_hi_val);

 	if (config->post_div_mask) {
@@ -1145,25 +1138,38 @@ static unsigned long alpha_pll_fabia_recalc_rate(struct clk_hw *hw,
 	return alpha_pll_calc_rate(parent_rate, l, frac, alpha_width);
 }

+/*
+ * Due to limited number of bits for fractional rate programming, the
+ * rounded up rate could be marginally higher than the requested rate.
+ */
+static int alpha_pll_check_rate_margin(struct clk_hw *hw,
+			unsigned long rrate, unsigned long rate)
+{
+	unsigned long rate_margin = rate + PLL_RATE_MARGIN;
+
+	if (rrate > rate_margin || rrate < rate) {
+		pr_err("%s: Rounded rate %lu not within range [%lu, %lu)\n",
+		       clk_hw_get_name(hw), rrate, rate, rate_margin);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
 						unsigned long prate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l, alpha_width = pll_alpha_width(pll);
+	unsigned long rrate;
+	int ret;
 	u64 a;
-	unsigned long rrate, max = rate + PLL_RATE_MARGIN;

 	rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);

-	/*
-	 * Due to limited number of bits for fractional rate programming, the
-	 * rounded up rate could be marginally higher than the requested rate.
-	 */
-	if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
-		pr_err("%s: Rounded rate %lu not within range [%lu, %lu)\n",
-		       clk_hw_get_name(hw), rrate, rate, max);
-		return -EINVAL;
-	}
+	ret = alpha_pll_check_rate_margin(hw, rrate, rate);
+	if (ret < 0)
+		return ret;

 	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
 	regmap_write(pll->clkr.regmap, PLL_FRAC(pll), a);
@@ -1206,12 +1212,10 @@ static int alpha_pll_fabia_prepare(struct clk_hw *hw)

 	rrate = alpha_pll_round_rate(cal_freq, clk_hw_get_rate(parent_hw),
 					&cal_l, &a, alpha_width);
-	/*
-	 * Due to a limited number of bits for fractional rate programming, the
-	 * rounded up rate could be marginally higher than the requested rate.
-	 */
-	if (rrate > (cal_freq + PLL_RATE_MARGIN) || rrate < cal_freq)
-		return -EINVAL;
+
+	ret = alpha_pll_check_rate_margin(hw, rrate, cal_freq);
+	if (ret < 0)
+		return ret;

 	/* Setup PLL for calibration frequency */
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), cal_l);
@@ -1388,49 +1392,27 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
-	if (config->l)
-		regmap_write(regmap, PLL_L_VAL(pll), config->l);
-
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
 	regmap_write(regmap, PLL_CAL_L_VAL(pll), TRION_PLL_CAL_VAL);
-
-	if (config->alpha)
-		regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
-
-	if (config->config_ctl_val)
-		regmap_write(regmap, PLL_CONFIG_CTL(pll),
-			     config->config_ctl_val);
-
-	if (config->config_ctl_hi_val)
-		regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
-			     config->config_ctl_hi_val);
-
-	if (config->config_ctl_hi1_val)
-		regmap_write(regmap, PLL_CONFIG_CTL_U1(pll),
-			     config->config_ctl_hi1_val);
-
-	if (config->user_ctl_val)
-		regmap_write(regmap, PLL_USER_CTL(pll),
-			     config->user_ctl_val);
-
-	if (config->user_ctl_hi_val)
-		regmap_write(regmap, PLL_USER_CTL_U(pll),
-			     config->user_ctl_hi_val);
-
-	if (config->user_ctl_hi1_val)
-		regmap_write(regmap, PLL_USER_CTL_U1(pll),
-			     config->user_ctl_hi1_val);
-
-	if (config->test_ctl_val)
-		regmap_write(regmap, PLL_TEST_CTL(pll),
-			     config->test_ctl_val);
-
-	if (config->test_ctl_hi_val)
-		regmap_write(regmap, PLL_TEST_CTL_U(pll),
-			     config->test_ctl_hi_val);
-
-	if (config->test_ctl_hi1_val)
-		regmap_write(regmap, PLL_TEST_CTL_U1(pll),
-			     config->test_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll),
+				     config->config_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll),
+				     config->config_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll),
+				     config->config_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll),
+					config->user_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll),
+					config->user_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U1(pll),
+					config->user_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
+					config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
+					config->test_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll),
+					config->test_ctl_hi1_val);

 	regmap_update_bits(regmap, PLL_MODE(pll), PLL_UPDATE_BYPASS,
 			   PLL_UPDATE_BYPASS);
@@ -1490,14 +1472,9 @@ static int alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,

 	rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);

-	/*
-	 * Due to a limited number of bits for fractional rate programming, the
-	 * rounded up rate could be marginally higher than the requested rate.
-	 */
-	if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
-		pr_err("Call set rate on the PLL with rounded rates!\n");
-		return -EINVAL;
-	}
+	ret = alpha_pll_check_rate_margin(hw, rrate, rate);
+	if (ret < 0)
+		return ret;

 	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

