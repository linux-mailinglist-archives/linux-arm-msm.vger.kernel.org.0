Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E791E3A09FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 04:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233787AbhFICZE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 22:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhFICZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 22:25:04 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10436C06178B
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 19:22:54 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id l3so4983724qvl.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 19:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ANjxXbWKEYVEXATsqAXpTcYFcsm+9L217AwPX8hWwm8=;
        b=Urfwy9n10oLvsRLU/+JfVwn4Rb5KWg3+PHhYGJuh05wHT4RTwVxM0EmmAHmFI3DX6P
         Us7hh64mA1I7N6FO0sA/f9GpT1Ivzj/RlF7u2/fUvg+wZmTbos6bbND2vaSE0ip08fSk
         L7JHHjts/4tPa9H7fV/Omo/e6DAXzpV84ayPA87OkiXi38n3nWYwaChGSPIsuQFI3/rl
         UpvmW8eeH+4C68iZmZjx1HdKTQMgFjQu8ruwiKgjKtYkRS3fswSR9epT/yhn9x6LYI+5
         ebaNpJxuym14tm6ynSSgxlNbdlDQIVWJ+WntZxxHQ/nE5N1B+eLfSgHBvrzZ1lxSLWYb
         pXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ANjxXbWKEYVEXATsqAXpTcYFcsm+9L217AwPX8hWwm8=;
        b=l6UUy7vXFxRzwIIrT1A5d5eRHTb+75PP6mRYVwfIK1BWhZgIZ4lVdtOFM0yGYEQ/iJ
         zGs9LGFAExy8hoy/HRW7dBBiYfGY5ldCV4odrt2635Kz7j05O/tEhkc+bR+gWLcN3Cn/
         YSvpJF0uCKE5HdJfmu0rGIDClYVs5fdP1QdQJxyt65MvJ5NTsvXtMLYABjXL5+FdSmli
         loselkyPoXATC6HSfw8Ks3hNhGWUffiRxkVWo3f1OfevX+8QyyyfNQBfYyJ2JpYEB+Tm
         m1CjIVRj1Q4FDKWRWRsovYyeg5S3Ub34qxAe4vL6i+neksufgEsx+DrOHrqsz6+qBkyR
         fLHw==
X-Gm-Message-State: AOAM532vPTMKmLXaGZPjwqVrVp9nq3gp327jMCbHtbkK/X9ERtvucJ9v
        zvbqnK0Q/ppgcyh/911HRCNo+RH5s6rL1Vu27G8zOg==
X-Google-Smtp-Source: ABdhPJwo7SLh1sJuJ/TdGwa60zxVh32bDokjWN/LdkLCSwF93BfMv3lfHUCQeUr6GxI7MYqmguNQeQ==
X-Received: by 2002:a05:6214:c42:: with SMTP id r2mr3500016qvj.35.1623205371388;
        Tue, 08 Jun 2021 19:22:51 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id h6sm7004657qtr.73.2021.06.08.19.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 19:22:51 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: add support for zonda pll
Date:   Tue,  8 Jun 2021 22:20:46 -0400
Message-Id: <20210609022051.2171-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210609022051.2171-1-jonathan@marek.ca>
References: <20210609022051.2171-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ported over from the downstream driver. Will be used by SM8250 CAMCC.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/clk-alpha-pll.c | 174 +++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |   6 ++
 2 files changed, 180 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index c6eb99169ddc7..94b53c7db2f7f 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -126,6 +126,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL_U] = 0x1c,
 		[PLL_OFF_STATUS] = 0x2c,
 	},
+	[CLK_ALPHA_PLL_TYPE_ZONDA] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_USER_CTL] = 0x0c,
+		[PLL_OFF_CONFIG_CTL] = 0x10,
+		[PLL_OFF_CONFIG_CTL_U] = 0x14,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x18,
+		[PLL_OFF_TEST_CTL] = 0x1c,
+		[PLL_OFF_TEST_CTL_U] = 0x20,
+		[PLL_OFF_TEST_CTL_U1] = 0x24,
+		[PLL_OFF_OPMODE] = 0x28,
+		[PLL_OFF_STATUS] = 0x38,
+	},
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 
@@ -162,6 +175,11 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define LUCID_5LPE_PLL_LATCH_INPUT	BIT(14)
 #define LUCID_5LPE_ENABLE_VOTE_RUN	BIT(21)
 
+/* ZONDA PLL specific */
+#define ZONDA_PLL_OUT_MASK	0xf
+#define ZONDA_STAY_IN_CFA	BIT(16)
+#define ZONDA_PLL_FREQ_LOCK_DET	BIT(29)
+
 #define pll_alpha_width(p)					\
 		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
 				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
@@ -208,6 +226,9 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 #define wait_for_pll_enable_lock(pll) \
 	wait_for_pll(pll, PLL_LOCK_DET, 0, "enable")
 
+#define wait_for_zonda_pll_freq_lock(pll) \
+	wait_for_pll(pll, ZONDA_PLL_FREQ_LOCK_DET, 0, "freq enable")
+
 #define wait_for_pll_disable(pll) \
 	wait_for_pll(pll, PLL_ACTIVE_FLAG, 1, "disable")
 
@@ -1777,3 +1798,156 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
 	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
 };
 EXPORT_SYMBOL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
+
+void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+			     const struct alpha_pll_config *config)
+{
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
+	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), config->user_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U1(pll), config->user_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
+
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_BYPASSNL, 0);
+
+	/* Disable PLL output */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
+
+	/* Set operation mode to OFF */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+
+	/* Place the PLL in STANDBY mode */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+}
+EXPORT_SYMBOL_GPL(clk_zonda_pll_configure);
+
+static int clk_zonda_pll_enable(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	struct regmap *regmap = pll->clkr.regmap;
+	u32 val;
+	int ret;
+
+	regmap_read(regmap, PLL_MODE(pll), &val);
+
+	/* If in FSM mode, just vote for it */
+	if (val & PLL_VOTE_FSM_ENA) {
+		ret = clk_enable_regmap(hw);
+		if (ret)
+			return ret;
+		return wait_for_pll_enable_active(pll);
+	}
+
+	/* Get the PLL out of bypass mode */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_BYPASSNL, PLL_BYPASSNL);
+
+	/*
+	 * H/W requires a 1us delay between disabling the bypass and
+	 * de-asserting the reset.
+	 */
+	udelay(1);
+
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+
+	/* Set operation mode to RUN */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
+
+	regmap_read(regmap, PLL_TEST_CTL(pll), &val);
+
+	/* If cfa mode then poll for freq lock */
+	if (val & ZONDA_STAY_IN_CFA)
+		ret = wait_for_zonda_pll_freq_lock(pll);
+	else
+		ret = wait_for_pll_enable_lock(pll);
+	if (ret)
+		return ret;
+
+	/* Enable the PLL outputs */
+	regmap_update_bits(regmap, PLL_USER_CTL(pll), ZONDA_PLL_OUT_MASK, ZONDA_PLL_OUT_MASK);
+
+	/* Enable the global PLL outputs */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
+
+	return 0;
+}
+
+static void clk_zonda_pll_disable(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	struct regmap *regmap = pll->clkr.regmap;
+	u32 val;
+
+	regmap_read(regmap, PLL_MODE(pll), &val);
+
+	/* If in FSM mode, just unvote it */
+	if (val & PLL_VOTE_FSM_ENA) {
+		clk_disable_regmap(hw);
+		return;
+	}
+
+	/* Disable the global PLL output */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
+
+	/* Disable the PLL outputs */
+	regmap_update_bits(regmap, PLL_USER_CTL(pll), ZONDA_PLL_OUT_MASK, 0);
+
+	/* Put the PLL in bypass and reset */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N | PLL_BYPASSNL, 0);
+
+	/* Place the PLL mode in OFF state */
+	regmap_write(regmap, PLL_OPMODE(pll), 0x0);
+}
+
+static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long prate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	unsigned long rrate;
+	u32 test_ctl_val;
+	u32 l, alpha_width = pll_alpha_width(pll);
+	u64 a;
+	int ret;
+
+	rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
+
+	ret = alpha_pll_check_rate_margin(hw, rrate, rate);
+	if (ret < 0)
+		return ret;
+
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+
+	/* Wait before polling for the frequency latch */
+	udelay(5);
+
+	/* Read stay in cfa mode */
+	regmap_read(pll->clkr.regmap, PLL_TEST_CTL(pll), &test_ctl_val);
+
+	/* If cfa mode then poll for freq lock */
+	if (test_ctl_val & ZONDA_STAY_IN_CFA)
+		ret = wait_for_zonda_pll_freq_lock(pll);
+	else
+		ret = wait_for_pll_enable_lock(pll);
+	if (ret)
+		return ret;
+
+	/* Wait for PLL output to stabilize */
+	udelay(100);
+	return 0;
+}
+
+const struct clk_ops clk_alpha_pll_zonda_ops = {
+	.enable = clk_zonda_pll_enable,
+	.disable = clk_zonda_pll_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = clk_trion_pll_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = clk_zonda_pll_set_rate,
+};
+EXPORT_SYMBOL(clk_alpha_pll_zonda_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 6943e933be0f7..55e4fa47912f4 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -16,6 +16,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_TRION,
 	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
 	CLK_ALPHA_PLL_TYPE_AGERA,
+	CLK_ALPHA_PLL_TYPE_ZONDA,
 	CLK_ALPHA_PLL_TYPE_MAX,
 };
 
@@ -148,6 +149,9 @@ extern const struct clk_ops clk_alpha_pll_lucid_5lpe_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
 
+extern const struct clk_ops clk_alpha_pll_zonda_ops;
+#define clk_alpha_pll_postdiv_zonda_ops clk_alpha_pll_postdiv_fabia_ops
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
@@ -159,6 +163,8 @@ void clk_agera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 #define clk_lucid_pll_configure(pll, regmap, config) \
 	clk_trion_pll_configure(pll, regmap, config)
 
+void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+			     const struct alpha_pll_config *config);
 
 
 #endif
-- 
2.26.1

