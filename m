Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECBF51BF02
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 14:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359629AbiEEMRJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 08:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359614AbiEEMRH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 08:17:07 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFBEC6457
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 05:13:27 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id g16so5333029lja.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8aGLO+9BnY7wmiY7FHT8CtDrv7XOkUYuM3orNUYouck=;
        b=J7tznWOSJj/Ihm/F32X0SoqGUsrEZCP2CwAWdGFaZDCY7ALiXbcPwqee8US9oeiUMR
         1A2ik7pw2GTJ5LHIZkt+yWbLsdtLW1eXyAHH40oGltdHClOKEsEPT12+FqIYBmai3orc
         PvUK5WEBAN2OgEYOBUH7QltyghRIMKufyP63/i3mQBiFrnxJBz84hl3HP28xR6S8T6zO
         +QiTqj4i/Wjt7uD0wpcoDp51LgnhGPxcYgL5tNiNOTpBefU+llAYMN0Jc1Q3Kps5sQD6
         7PpyZ++2US8keFqNBmwZKz0VUE4NyHLMaZD4OcUzHYFW7V3lsLVZeEonoWZuJ3fLGb0m
         ws8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8aGLO+9BnY7wmiY7FHT8CtDrv7XOkUYuM3orNUYouck=;
        b=TWCSsoRuy9vqO+BgaWFPrAzUtxxWpXhIQgzxAIGBnoOpx94DHGTQHjN6ucIVzh/Urb
         L+NaomvQS4gT19qTdC+NhgHr5bK0E2cyDWlXE1qJcU+er05/KFI1+KLFr+26NxK/CFqe
         cV5KEhwZgEp5SmEfSE1KctQO4DATwkY3SarvzqUGOMuhN1EjQ5AdA/zlIxSk3dCuWQjQ
         xrCMefRQPItHNKmEbQbp7iQXKHKXAU8AToFYG4bA4nP4g9mdfcfzA8XxWfB2LkyoSNs1
         45kdyw96nzfZxzXFUHWEcJSOE28WVrDfNoHJHQXVyL4ak/kUBRV+AdCLcR4TD86xHSWG
         WG6w==
X-Gm-Message-State: AOAM533xhsWQEJXsKvQ53FuFM9qPy2nLCdmEgUBrZKpU0f0Cs0mchCED
        8iA3EjKFvAX9W4qd6Z+P5090/2odx1p77w==
X-Google-Smtp-Source: ABdhPJzublldiwJzKb6wgESbEuDZHRNPUy+NmDDhtvKdfx6tfv2R7xyt1FGpslcRPPuxcqgZCbgDfA==
X-Received: by 2002:a05:651c:c8:b0:24f:1639:dd4e with SMTP id 8-20020a05651c00c800b0024f1639dd4emr15611907ljr.503.1651752805773;
        Thu, 05 May 2022 05:13:25 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5672eb-224.dhcp.inet.fi. [86.114.235.224])
        by smtp.gmail.com with ESMTPSA id i4-20020ac25d24000000b0047255d21140sm195143lfb.111.2022.05.05.05.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 05:13:25 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 6/7] clk: qcom: clk-alpha-pll: add Rivian EVO PLL configuration interfaces
Date:   Thu,  5 May 2022 15:13:23 +0300
Message-Id: <20220505121323.4121892-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220505121213.4121802-1-vladimir.zapolskiy@linaro.org>
References: <20220505121213.4121802-1-vladimir.zapolskiy@linaro.org>
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

The change adds and exports Rivian EVO PLL configuration and control
functions to clock controller drivers.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 70 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  6 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 54bad5277802..ab4f0fc15a48 100644
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
 
@@ -2179,3 +2191,61 @@ const struct clk_ops clk_alpha_pll_lucid_evo_ops = {
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

