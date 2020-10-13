Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A23628D2E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 19:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387867AbgJMRM3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 13:12:29 -0400
Received: from z5.mailgun.us ([104.130.96.5]:62609 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726572AbgJMRM1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 13:12:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602609146; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=eb0NAhGFz6u/fTm/M8+jx77aIinYJ9lpUcZd+0H9vr4=; b=kCbxVvdvbijUsPmjz8ZNIaQ4nSgE2/mllw7fY8hUnwotWXGte9K2vLVcd+UR0ThBdukx/yq7
 LDUbXAHtYJ/llnWaU4SwUaXwSAZBUYgmDJz70A3UzlM3cVnAvCMZHXntGAuKs0BNnHAissud
 yQNOeBjXK0w5/kSWYz9w4Wd/MQQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f85dfe94f8cc67c31127930 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 17:12:09
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0A950C433FF; Tue, 13 Oct 2020 17:12:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 183DDC433CB;
        Tue, 13 Oct 2020 17:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 183DDC433CB
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
Subject: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: Add support for controlling Agera PLLs
Date:   Tue, 13 Oct 2020 22:41:48 +0530
Message-Id: <1602609110-11504-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602609110-11504-1-git-send-email-tdas@codeaurora.org>
References: <1602609110-11504-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add programming sequence support for managing the Agera PLLs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 80 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  4 ++
 2 files changed, 84 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 26139ef..17e1fc0 100644
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

@@ -1561,3 +1571,73 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_ops = {
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
+static int clk_alpha_pll_agera_set_rate(struct clk_hw *hw, unsigned long rate,
+							unsigned long prate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 l, alpha_width = pll_alpha_width(pll);
+	unsigned long rrate, max = rate + PLL_RATE_MARGIN;
+	u64 a;
+
+	rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
+
+	/*
+	 * Due to limited number of bits for fractional rate programming, the
+	 * rounded up rate could be marginally higher than the requested rate.
+	 */
+	if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
+		pr_err("%s: Rounded rate %lu not within range [%lu, %lu)\n",
+		       clk_hw_get_name(hw), rrate, rate, max);
+		return -EINVAL;
+	}
+
+	/* change L_VAL without having to go through the power on sequence */
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
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
+	.set_rate = clk_alpha_pll_agera_set_rate,
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

