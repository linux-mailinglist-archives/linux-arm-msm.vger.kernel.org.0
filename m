Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D05FFDA0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 10:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbfKOJ4g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 04:56:36 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56008 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOJ4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 04:56:36 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C5B5D61015; Fri, 15 Nov 2019 09:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573811794;
        bh=HPcD4vqWRFeCaLkIBldaig+SjzzI6wuB40PAzaERMx8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HG1+cb6hz3LVjNpIcS1z5geBfapH9WI+T6IwTEM/qJknzsFiokfaDjjXozc6i8GdD
         NARS9u+6cWpVg+uZp2SLAkPXdOc1GeBq1xP8fZ7iu+5RKZPZloL6h9ypibEzQp6qHd
         B8WnaYYwqU3vrFCh1raDQg1dISn7KfxcxJeoWt8Q=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8BFBC60CEB;
        Fri, 15 Nov 2019 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573811793;
        bh=HPcD4vqWRFeCaLkIBldaig+SjzzI6wuB40PAzaERMx8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hj2TQ6P0j4Xq3bN+sATIR/bvaea951nxSNZwHXdfEXNEokpCm2O1MNIVgl2ekLqhv
         63IrnEltfgP+ITlR5IN9ebRDpRbIngZvrrDHSpU1zRS3MJGh6VaF13DqGrg8SDIgv7
         2Zm6V+mJQ/BVZUTU/J1RViibX0Pwm4xeMC67jDrg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8BFBC60CEB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 2/8] clk: qcom: clk-alpha-pll: Add support for Fabia PLL calibration
Date:   Fri, 15 Nov 2019 15:26:02 +0530
Message-Id: <1573811768-21462-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573811768-21462-1-git-send-email-tdas@codeaurora.org>
References: <1573811768-21462-1-git-send-email-tdas@codeaurora.org>
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
 drivers/clk/qcom/clk-alpha-pll.c | 76 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  4 +++
 2 files changed, 80 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index e39034d..15ddcfe 100644
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
@@ -1162,7 +1181,64 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
 	return __clk_alpha_pll_update_latch(pll);
 }

+static int alpha_pll_fabia_prepare(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	const struct pll_vco *vco;
+	struct clk_hw *parent_hw;
+	unsigned long cal_freq, rrate;
+	u32 cal_l, val, alpha_width = pll_alpha_width(pll);
+	u64 a;
+	int ret;
+
+	/* Check if calibration needs to be done i.e. PLL is in reset */
+	ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
+	if (ret)
+		return ret;
+
+	/* Return early if calibration is not needed. */
+	if (val & PLL_RESET_N)
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
+	if (rrate > (cal_freq + FABIA_PLL_RATE_MARGIN) || rrate < cal_freq)
+		return -EINVAL;
+
+	/* Setup PLL for calibration frequency */
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), cal_l);
+
+	/* Bringup the PLL at calibration frequency */
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

