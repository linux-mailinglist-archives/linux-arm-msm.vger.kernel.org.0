Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAA25464A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 12:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346960AbiFJKy2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 06:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349316AbiFJKxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 06:53:30 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7CA248005
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 03:49:55 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id w20so20546856lfa.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DM/nIs/IKkNMeW47XBT24VkP7Vv3YRenARerqJeGNwk=;
        b=RCrqHNiDI0o3C8RVEGuaZH+tsOUtDUyWk30FEbhLgLRX9qX2hLxABgxvqYslGFy+gh
         0mVWk9658k/fBTW0MDXfu25or2FNd3AUrTfHjiiPkRAY27OLocqZVX9BpMF804LL7xKH
         jZHxBIaZe5jzi5+HUNO2u+CyfU0tUUIP96JLZNXFBQM/VGTpoY4m7cKrCam5JKIqX14b
         GdAV2eMGrd0UJNezAwVzhnjpi7yr5gd5omTtjNgizg15TDTOIsbP1ebzWJ53yWQpl/8i
         qT1r3MH6ruiZzLOtD9Mw7Gk7EFp3Vl4g/ulPMTfihETv0QpH5EKVKVWDc/nPKWzc9Bqc
         ZkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DM/nIs/IKkNMeW47XBT24VkP7Vv3YRenARerqJeGNwk=;
        b=nOv+o+DcucSPBfaodJMj2iIGHfPUqjPM7NDZUxF4PDTpZKa6cpOwu3+qCed+ulLFQQ
         twCekvPyiZtC54Ci3MIK/p4M9NSecnoGszglOhSNaZYLxeVBSiV8azIo0cXyts2ZB1wB
         eKxtXxziVcYtIq6iCPyXefCm8c9Vc/0l0Jl4X4E0B8y5yFnJdHKaLubFGlBULvO+hWt4
         A201uI4jwmAYYEPZBL6iMWaO/CS3dcJf2M/CWit6rTM75oK5AFKl7qCjj2qiM0J+yHrS
         CuuIZGpaggwqjt4+PRT8NYCNNJsDZ/BfGU4GcQYUt2O2UoEEJZg07BCL9elRQW2AfsVU
         7QIw==
X-Gm-Message-State: AOAM530ne+9Cv6ici08tuN2hmZoIWc17U4AO8nKDi108r9c9yBXG72Mx
        ooc3gy9NErwoivl1Az/9o47vbA==
X-Google-Smtp-Source: ABdhPJyVhq3bQ6XWWpN4PzRS+UB+ZuAVye1pvnY69WeuGkvBoCFEhMttjHZjCZ4C/D/rG/1KBHd0lQ==
X-Received: by 2002:a19:7907:0:b0:479:165c:3842 with SMTP id u7-20020a197907000000b00479165c3842mr24838166lfc.552.1654858193387;
        Fri, 10 Jun 2022 03:49:53 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id c2-20020ac244a2000000b00478f2a09100sm4658945lfm.184.2022.06.10.03.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 03:49:53 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v7 5/7] clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces
Date:   Fri, 10 Jun 2022 13:49:51 +0300
Message-Id: <20220610104951.2296533-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220610104911.2296472-1-vladimir.zapolskiy@linaro.org>
References: <20220610104911.2296472-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The change adds controls for Lucid EVO PLL configuration and exports
control functions to clock controller drivers.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v3 to v7:
* none.

Changes from v2 to v3:
* improved commit subject and description per ask from Bjorn.

 drivers/clk/qcom/clk-alpha-pll.c | 65 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  5 ++-
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 47879ee5a677..54bad5277802 100644
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
@@ -1994,6 +1996,33 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
 
+void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				 const struct alpha_pll_config *config)
+{
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l |
+			(TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT));
+
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
+	/* Set operation mode to STANDBY */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+
+	/* Place the PLL in STANDBY mode */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+}
+EXPORT_SYMBOL_GPL(clk_lucid_evo_pll_configure);
+
 static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
@@ -2079,6 +2108,31 @@ static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
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
@@ -2114,3 +2168,14 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops = {
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

