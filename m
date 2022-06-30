Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB6ED5614D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 10:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbiF3IU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 04:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232215AbiF3IUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 04:20:02 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A464A1C92A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 01:18:28 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id f39so32408621lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/67JZPUMNboThTsSNO/thfQMRXM9nt+twZufbmKkUls=;
        b=TNBZxEeMm9UJYB5HUo6vYr90jEWyo1XzkAJdPxbvOKlpdyYrCkMpOMHK2qr6J7vEvD
         aSW04CJLFAkJmeRK+N0X6ZAUJNbR4eLl+wYRy2y3HJrEnTdrz002kvGf0o9ePCYUmcXV
         0TPMKLqv0Iq2raRxxPCrdMgGUHXFFf0UMuBzaM+oeEfIRZapFKZWG3pTopv3nvddr0jR
         0wBm+TRO3aSroQcUXMrB2tOrVtsv2EIKgSnza113ehi/xfrevKTJvw0lAeUFwwllIjNw
         PbOth3gehttR/phHqwcffE9PrjRTxYcBMR8vWAgBWaKoRQY7VtxTHo4dYVHNx+sRzNpX
         JpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/67JZPUMNboThTsSNO/thfQMRXM9nt+twZufbmKkUls=;
        b=mdqobgKTYQPjFPOBABaGx7EjwpIH3woKjKEgKKEl3x3YvfgQuLDHiBwZvGb26AsSJ6
         eaP2/qN6vypGAp9M+dGfsPFcIYHA2WUgOlqwArtpHaApw4Ukf9G9l0XXOz9AnSCWp6V0
         8RSWjePTavmHnWGju6KTqYjz8oWm+8xJvKqtSCbd3/v9Uns/42a24cR7AnSWytA/LkVq
         q+Aig+At6jr/IXzdbZcVO2RXzH3rtIWToNqYkX6cJe5hKaSBdIDLY9lTrkWqA6ZxIUga
         K2AepIZgR6C0k0LLkt2/+srbAP4FIHCrjEiUskoCFl7xla4vMWFjg3l50V5iv44qJuTv
         XYFA==
X-Gm-Message-State: AJIora+g+RzFQhFOkFedvEn6lsSZTVYCbrQWTCvQrFv2MZWbdYP8d2I1
        VZlvQbOSwwIlpNsUVpwhDGgKQA==
X-Google-Smtp-Source: AGRyM1sqPVYisQzWNm9x+EEjRaIr7Z/yldDLKue+3/1GbQM4lp2zF0KUtGR3AdetKOJ2gMwCIddjsQ==
X-Received: by 2002:a19:8c4a:0:b0:47d:7583:ef2f with SMTP id i10-20020a198c4a000000b0047d7583ef2fmr4474516lfj.20.1656577108213;
        Thu, 30 Jun 2022 01:18:28 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id p2-20020ac24ec2000000b0047255d210e8sm2973262lfr.23.2022.06.30.01.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 01:18:27 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v9 5/7] clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces
Date:   Thu, 30 Jun 2022 11:18:25 +0300
Message-Id: <20220630081825.2554069-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
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

Add controls for Lucid EVO PLL configuration and export control functions
to clock controller drivers.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v8 to v9:
* none.

Changes from v7 to v8:
* improved commit message per request from Stephen.

Changes from v3 to v7:
* none.

Changes from v2 to v3:
* improved commit subject and description per ask from Bjorn.

Changes from v1 to v2:
* none

 drivers/clk/qcom/clk-alpha-pll.c | 64 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  5 ++-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 47879ee5a677..cdb1035ae3ed 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -191,8 +191,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define LUCID_5LPE_ENABLE_VOTE_RUN	BIT(21)
 
 /* LUCID EVO PLL specific settings and offsets */
+#define LUCID_EVO_PCAL_NOT_DONE		BIT(8)
 #define LUCID_EVO_ENABLE_VOTE_RUN       BIT(25)
 #define LUCID_EVO_PLL_L_VAL_MASK        GENMASK(15, 0)
+#define LUCID_EVO_PLL_CAL_L_VAL_SHIFT	16
 
 /* ZONDA PLL specific */
 #define ZONDA_PLL_OUT_MASK	0xf
@@ -1994,6 +1996,32 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
 
+void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				 const struct alpha_pll_config *config)
+{
+	u32 lval = config->l;
+
+	lval |= TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), lval);
+	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), config->user_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
+
+	/* Disable PLL output */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
+
+	/* Set operation mode to STANDBY and de-assert the reset */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+}
+EXPORT_SYMBOL_GPL(clk_lucid_evo_pll_configure);
+
 static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
@@ -2079,6 +2107,31 @@ static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
 	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
 }
 
+static int alpha_pll_lucid_evo_prepare(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	struct clk_hw *p;
+	u32 val = 0;
+	int ret;
+
+	/* Return early if calibration is not needed. */
+	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
+	if (!(val & LUCID_EVO_PCAL_NOT_DONE))
+		return 0;
+
+	p = clk_hw_get_parent(hw);
+	if (!p)
+		return -EINVAL;
+
+	ret = alpha_pll_lucid_evo_enable(hw);
+	if (ret)
+		return ret;
+
+	alpha_pll_lucid_evo_disable(hw);
+
+	return 0;
+}
+
 static unsigned long alpha_pll_lucid_evo_recalc_rate(struct clk_hw *hw,
 						     unsigned long parent_rate)
 {
@@ -2114,3 +2167,14 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops = {
 	.set_rate = clk_lucid_evo_pll_postdiv_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_evo_ops);
+
+const struct clk_ops clk_alpha_pll_lucid_evo_ops = {
+	.prepare = alpha_pll_lucid_evo_prepare,
+	.enable = alpha_pll_lucid_evo_enable,
+	.disable = alpha_pll_lucid_evo_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = alpha_pll_lucid_5lpe_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_evo_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 6e9907deaf30..0b7a6859ca2c 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -152,6 +152,8 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
 
 extern const struct clk_ops clk_alpha_pll_zonda_ops;
 #define clk_alpha_pll_postdiv_zonda_ops clk_alpha_pll_postdiv_fabia_ops
+
+extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 
@@ -168,6 +170,7 @@ void clk_agera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 
 void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
-
+void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				 const struct alpha_pll_config *config);
 
 #endif
-- 
2.33.0

