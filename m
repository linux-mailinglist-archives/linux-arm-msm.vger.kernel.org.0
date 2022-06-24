Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0732559900
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 14:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbiFXMAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 08:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbiFXMAJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 08:00:09 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688176F7B4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 05:00:08 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so4081668lfg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VuEzk8i1YWKI4gCXUQGz4FINR145fQPRN3C1XXRRgW0=;
        b=XiUMSaA9qsicpIaIWWiVPDFq8AROCKw/iWat40ON1+oJN899yemF4t7qJzqE6htnhF
         iRr9QbwmnktPoSMntS+PjK/qXyJWBVqbjM/o6pE8dO+R17B97J8ucLb/KUpbxtYCWr1Y
         HWokAp2HKKG9TdHqMTpFaKTjZtzeBjkzDGQClbbg1rKpMZKMfgsisiyl7QvWVfemHOAc
         WAmLZikBQ3QuD1k1+26MI8rs+zBiKWjf+Nfx1ysFFXs8RFuKENkpVBhh10oGAnrHrjjG
         +nTxOjDjId97X8izXEYuiUnLAa8zcV9tPv3DwWmgzTFUigyPGG8UvLM2LUqHJdr8jZ3g
         JjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VuEzk8i1YWKI4gCXUQGz4FINR145fQPRN3C1XXRRgW0=;
        b=qvz8zRVzN1M6vuUdVshrYcG5mJCQB2K5tLewPy8qxUi/Noj35zDtCKnsoPHHo0IpC2
         5QLutOfj15xYDhtwN4ZJ6VNFylQo+CNKUwdUvRaDNRfgCY1XRiwIBQKWRZxSpchf8nc5
         +zVmoRHnz1qehkXtNN8hw/Aj45ZoQjNpv+9GW5owHhd4pNYzLG57qkEXiB9/ll81ox4H
         Bg8DzS880rclTMmcqEfut+MfFSFHdJ+FFjaRi/csxGJOcVtge8q5z6uRoOOEmZ3hjLFh
         qpAuYUryAw0QG+3qmxhfsgXLl0wgIVQ8pcSe03WYtW2RxQsoET3R/0C3Xvun/XBmFb9c
         CMoA==
X-Gm-Message-State: AJIora8e620q0L1BOjTFqghHPHswZOqcuQaquPgWbqnaE3tMqheyL8TC
        +ZWsTCf8DNT+r9EMouMEYe4KUA==
X-Google-Smtp-Source: AGRyM1u6DrFOAWKKTswbjpyXSxRx8UrqvMk2hqpKFBtfBazh30c2kcuh4bwucLsURwYBAlFoj1WyzQ==
X-Received: by 2002:a05:6512:3fa7:b0:47f:7387:926c with SMTP id x39-20020a0565123fa700b0047f7387926cmr8751406lfa.98.1656072006743;
        Fri, 24 Jun 2022 05:00:06 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id b9-20020a056512070900b00479478d59c7sm340084lfs.101.2022.06.24.05.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 05:00:06 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v8 6/7] clk: qcom: clk-alpha-pll: add Rivian EVO PLL configuration interfaces
Date:   Fri, 24 Jun 2022 15:00:05 +0300
Message-Id: <20220624120005.2524949-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
References: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add and export Rivian EVO PLL configuration and control functions to
clock controller drivers.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v7 to v8:
* Corrected a comment and added a local variable to improve readability.

Changes from v1 to v7:
* none.

 drivers/clk/qcom/clk-alpha-pll.c | 70 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  6 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index cdb1035ae3ed..b42684703fbb 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -154,6 +154,18 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL_U] = 0x30,
 		[PLL_OFF_TEST_CTL_U1] = 0x34,
 	},
+	[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO] = {
+		[PLL_OFF_OPMODE] = 0x04,
+		[PLL_OFF_STATUS] = 0x0c,
+		[PLL_OFF_L_VAL] = 0x10,
+		[PLL_OFF_USER_CTL] = 0x14,
+		[PLL_OFF_USER_CTL_U] = 0x18,
+		[PLL_OFF_CONFIG_CTL] = 0x1c,
+		[PLL_OFF_CONFIG_CTL_U] = 0x20,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x24,
+		[PLL_OFF_TEST_CTL] = 0x28,
+		[PLL_OFF_TEST_CTL_U] = 0x2c,
+	},
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 
@@ -2178,3 +2190,61 @@ const struct clk_ops clk_alpha_pll_lucid_evo_ops = {
 	.set_rate = alpha_pll_lucid_5lpe_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_evo_ops);
+
+void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				  const struct alpha_pll_config *config)
+{
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), config->user_ctl_hi_val);
+
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+
+	regmap_update_bits(regmap, PLL_MODE(pll),
+			   PLL_RESET_N | PLL_BYPASSNL | PLL_OUTCTRL,
+			   PLL_RESET_N | PLL_BYPASSNL);
+}
+EXPORT_SYMBOL_GPL(clk_rivian_evo_pll_configure);
+
+static unsigned long clk_rivian_evo_pll_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 l;
+
+	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
+
+	return parent_rate * l;
+}
+
+static long clk_rivian_evo_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long *prate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	unsigned long min_freq, max_freq;
+	u32 l;
+	u64 a;
+
+	rate = alpha_pll_round_rate(rate, *prate, &l, &a, 0);
+	if (!pll->vco_table || alpha_pll_find_vco(pll, rate))
+		return rate;
+
+	min_freq = pll->vco_table[0].min_freq;
+	max_freq = pll->vco_table[pll->num_vco - 1].max_freq;
+
+	return clamp(rate, min_freq, max_freq);
+}
+
+const struct clk_ops clk_alpha_pll_rivian_evo_ops = {
+	.enable = alpha_pll_lucid_5lpe_enable,
+	.disable = alpha_pll_lucid_5lpe_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = clk_rivian_evo_pll_recalc_rate,
+	.round_rate = clk_rivian_evo_pll_round_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_rivian_evo_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 0b7a6859ca2c..447efb82fe59 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -18,6 +18,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_AGERA,
 	CLK_ALPHA_PLL_TYPE_ZONDA,
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
+	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_MAX,
 };
 
@@ -157,6 +158,9 @@ extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 
+extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
+#define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
@@ -172,5 +176,7 @@ void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				 const struct alpha_pll_config *config);
+void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				  const struct alpha_pll_config *config);
 
 #endif
-- 
2.33.0

