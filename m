Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2383020E3FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbgF2VTy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390813AbgF2VSk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 17:18:40 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685ACC03E97A
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 14:18:40 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id g13so14031379qtv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 14:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mgDv4Rf3fgP1WVv6wT9BRKGCzb8IU1E1hjosgtpH4Dg=;
        b=p0caMG0GHoHgtXzKN7ottzUgKH2/q3VOvMx4bzC+eaet/qXqPOffkTiytboZt+1Jh+
         g8wfsSjvMIXs5XhcR4mWXKiyu1uhFXruOXizFui1/+hhtFM22i++Hgyo/rGqNtrSDkWK
         UVPk/UjB8EO5F+pbGLVLB4WMbb6aVuDwvRv1LjwePi+O5cKuq1iHtdabkOB6YmKRTJ3M
         1x3gJiwGjZcLgCiFA6iJs7eN6Q5uXybsXnbWrT+1k/r2TrxR1Os1k8p1u9gtu25L9yS0
         577xYMPjWOVjsK1nKD85Ssx6cmpZsxYLJLXuBOpBzq8SWwDowxJlsaM3AwgQx25oMCLs
         H5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mgDv4Rf3fgP1WVv6wT9BRKGCzb8IU1E1hjosgtpH4Dg=;
        b=t3Z0L6Xf9Z1PNDK9RGBg6CpNna8sGvgNTt28POBCO+0F28HBhi3mDEwg4Ir2gwvWjs
         TjXUJLIGuPxbeRL5Tt4V3Ju6hH4R0S83E7z/mTK/zvO/25QcYhNdVf0RtjQFSjnKyQ+n
         YCX/3cVpkUm+zNfyW/QUsmkLvAwmTqykfqzhP1JzQtiMEclyXEbjWD3ci2JfPLx5s3Uv
         g6ibYc8agiraYLIhIjFbkJw1WtZztWUlJLfnKO1Pfywb4BGolvu8ElZ1tNwztIc0pEjK
         /uJLg9IEuIny3jYNeSXbqKxZK0tZbyKMSjtB3Itz9QjdjNe0EWIMogbU+mZFgF0iv2pp
         o1OQ==
X-Gm-Message-State: AOAM531q3nvrseDiV/esmVw9zzBxH+m3RXrM9CEQo+6ig2VIt8X7mwJJ
        2l/7hTiR40Bm6PykogwNk1/K6A8/Y0o=
X-Google-Smtp-Source: ABdhPJwc2KB8XFdBpA7aSQ1lJBfYOztDklAxhv4TNwc36jOvv+D+96NYAOC0YtrmrJ37Pco5WqJZsQ==
X-Received: by 2002:ac8:32fd:: with SMTP id a58mr16794454qtb.321.1593465519166;
        Mon, 29 Jun 2020 14:18:39 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id b196sm1169078qkg.11.2020.06.29.14.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:18:38 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v2 03/13] clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid
Date:   Mon, 29 Jun 2020 17:17:09 -0400
Message-Id: <20200629211725.2592-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629211725.2592-1-jonathan@marek.ca>
References: <20200629211725.2592-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixed ops were already identical, this adds support for non-fixed ops by
sharing between trion and lucid.

This also changes the names for trion ops to be consistent with the rest.

Note LUCID_PCAL_DONE is renamed to TRION_PCAL_DONE because it is wrong for
lucid, LUCID_PCAL_DONE should be BIT(27). Next patch will address this.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/clk-alpha-pll.c | 58 ++++++++++----------------------
 drivers/clk/qcom/clk-alpha-pll.h | 17 ++++++----
 drivers/clk/qcom/gcc-sm8150.c    |  8 ++---
 3 files changed, 32 insertions(+), 51 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 1325139173c9..be7ffeae21b1 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -101,21 +101,6 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_FRAC] = 0x38,
 	},
 	[CLK_ALPHA_PLL_TYPE_TRION] = {
-		[PLL_OFF_L_VAL] = 0x04,
-		[PLL_OFF_CAL_L_VAL] = 0x08,
-		[PLL_OFF_USER_CTL] = 0x0c,
-		[PLL_OFF_USER_CTL_U] = 0x10,
-		[PLL_OFF_USER_CTL_U1] = 0x14,
-		[PLL_OFF_CONFIG_CTL] = 0x18,
-		[PLL_OFF_CONFIG_CTL_U] = 0x1c,
-		[PLL_OFF_CONFIG_CTL_U1] = 0x20,
-		[PLL_OFF_TEST_CTL] = 0x24,
-		[PLL_OFF_TEST_CTL_U] = 0x28,
-		[PLL_OFF_STATUS] = 0x30,
-		[PLL_OFF_OPMODE] = 0x38,
-		[PLL_OFF_ALPHA_VAL] = 0x40,
-	},
-	[CLK_ALPHA_PLL_TYPE_LUCID] =  {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_CAL_L_VAL] = 0x08,
 		[PLL_OFF_USER_CTL] = 0x0c,
@@ -154,9 +139,9 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define PLL_OUT_MASK		0x7
 #define PLL_RATE_MARGIN		500
 
-/* LUCID PLL specific settings and offsets */
-#define LUCID_PLL_CAL_VAL	0x44
-#define LUCID_PCAL_DONE		BIT(26)
+/* TRION PLL specific settings and offsets */
+#define TRION_PLL_CAL_VAL	0x44
+#define TRION_PCAL_DONE		BIT(26)
 
 #define pll_alpha_width(p)					\
 		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
@@ -910,14 +895,14 @@ const struct clk_ops clk_alpha_pll_hwfsm_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_hwfsm_ops);
 
-const struct clk_ops clk_trion_fixed_pll_ops = {
+const struct clk_ops clk_alpha_pll_fixed_trion_ops = {
 	.enable = clk_trion_pll_enable,
 	.disable = clk_trion_pll_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = clk_trion_pll_recalc_rate,
 	.round_rate = clk_alpha_pll_round_rate,
 };
-EXPORT_SYMBOL_GPL(clk_trion_fixed_pll_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_trion_ops);
 
 static unsigned long
 clk_alpha_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
@@ -1337,12 +1322,12 @@ clk_trion_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 				  val << PLL_POST_DIV_SHIFT);
 }
 
-const struct clk_ops clk_trion_pll_postdiv_ops = {
+const struct clk_ops clk_alpha_pll_postdiv_trion_ops = {
 	.recalc_rate = clk_trion_pll_postdiv_recalc_rate,
 	.round_rate = clk_trion_pll_postdiv_round_rate,
 	.set_rate = clk_trion_pll_postdiv_set_rate,
 };
-EXPORT_SYMBOL_GPL(clk_trion_pll_postdiv_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_trion_ops);
 
 static long clk_alpha_pll_postdiv_fabia_round_rate(struct clk_hw *hw,
 				unsigned long rate, unsigned long *prate)
@@ -1397,13 +1382,13 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
  * @regmap: register map
  * @config: configuration to apply for pll
  */
-void clk_lucid_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
 	if (config->l)
 		regmap_write(regmap, PLL_L_VAL(pll), config->l);
 
-	regmap_write(regmap, PLL_CAL_L_VAL(pll), LUCID_PLL_CAL_VAL);
+	regmap_write(regmap, PLL_CAL_L_VAL(pll), TRION_PLL_CAL_VAL);
 
 	if (config->alpha)
 		regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
@@ -1456,13 +1441,13 @@ void clk_lucid_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	/* Place the PLL in STANDBY mode */
 	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
 }
-EXPORT_SYMBOL_GPL(clk_lucid_pll_configure);
+EXPORT_SYMBOL_GPL(clk_trion_pll_configure);
 
 /*
- * The Lucid PLL requires a power-on self-calibration which happens when the
+ * The TRION PLL requires a power-on self-calibration which happens when the
  * PLL comes out of reset. Calibrate in case it is not completed.
  */
-static int alpha_pll_lucid_prepare(struct clk_hw *hw)
+static int alpha_pll_trion_prepare(struct clk_hw *hw)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 regval;
@@ -1470,7 +1455,7 @@ static int alpha_pll_lucid_prepare(struct clk_hw *hw)
 
 	/* Return early if calibration is not needed. */
 	regmap_read(pll->clkr.regmap, PLL_STATUS(pll), &regval);
-	if (regval & LUCID_PCAL_DONE)
+	if (regval & TRION_PCAL_DONE)
 		return 0;
 
 	/* On/off to calibrate */
@@ -1481,7 +1466,7 @@ static int alpha_pll_lucid_prepare(struct clk_hw *hw)
 	return ret;
 }
 
-static int alpha_pll_lucid_set_rate(struct clk_hw *hw, unsigned long rate,
+static int alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long prate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
@@ -1535,26 +1520,17 @@ static int alpha_pll_lucid_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-const struct clk_ops clk_alpha_pll_lucid_ops = {
-	.prepare = alpha_pll_lucid_prepare,
+const struct clk_ops clk_alpha_pll_trion_ops = {
+	.prepare = alpha_pll_trion_prepare,
 	.enable = clk_trion_pll_enable,
 	.disable = clk_trion_pll_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = clk_trion_pll_recalc_rate,
 	.round_rate = clk_alpha_pll_round_rate,
-	.set_rate = alpha_pll_lucid_set_rate,
+	.set_rate = alpha_pll_trion_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_ops);
 
-const struct clk_ops clk_alpha_pll_fixed_lucid_ops = {
-	.enable = clk_trion_pll_enable,
-	.disable = clk_trion_pll_disable,
-	.is_enabled = clk_trion_pll_is_enabled,
-	.recalc_rate = clk_trion_pll_recalc_rate,
-	.round_rate = clk_alpha_pll_round_rate,
-};
-EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_ops);
-
 const struct clk_ops clk_alpha_pll_postdiv_lucid_ops = {
 	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
 	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 704674a153b6..67f1fd271931 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -14,7 +14,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_BRAMMO,
 	CLK_ALPHA_PLL_TYPE_FABIA,
 	CLK_ALPHA_PLL_TYPE_TRION,
-	CLK_ALPHA_PLL_TYPE_LUCID,
+	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
 	CLK_ALPHA_PLL_TYPE_MAX,
 };
 
@@ -128,18 +128,23 @@ extern const struct clk_ops clk_alpha_pll_fabia_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_fabia_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_fabia_ops;
 
-extern const struct clk_ops clk_alpha_pll_lucid_ops;
-extern const struct clk_ops clk_alpha_pll_fixed_lucid_ops;
+extern const struct clk_ops clk_alpha_pll_trion_ops;
+extern const struct clk_ops clk_alpha_pll_fixed_trion_ops;
+extern const struct clk_ops clk_alpha_pll_postdiv_trion_ops;
+
+#define clk_alpha_pll_lucid_ops clk_alpha_pll_trion_ops
+#define clk_alpha_pll_fixed_lucid_ops clk_alpha_pll_fixed_trion_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_ops;
 
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				const struct alpha_pll_config *config);
-void clk_lucid_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
+#define clk_lucid_pll_configure(pll, regmap, config) \
+	clk_trion_pll_configure(pll, regmap, config)
+
 
-extern const struct clk_ops clk_trion_fixed_pll_ops;
-extern const struct clk_ops clk_trion_pll_postdiv_ops;
 
 #endif
diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 55e9d6d75a0c..d7778def37da 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -53,7 +53,7 @@ static struct clk_alpha_pll gpll0 = {
 				.name = "bi_tcxo",
 			},
 			.num_parents = 1,
-			.ops = &clk_trion_fixed_pll_ops,
+			.ops = &clk_alpha_pll_fixed_trion_ops,
 		},
 	},
 };
@@ -79,7 +79,7 @@ static struct clk_alpha_pll_postdiv gpll0_out_even = {
 			.hw = &gpll0.clkr.hw,
 		},
 		.num_parents = 1,
-		.ops = &clk_trion_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_trion_ops,
 	},
 };
 
@@ -98,7 +98,7 @@ static struct clk_alpha_pll gpll7 = {
 				.name = "bi_tcxo",
 			},
 			.num_parents = 1,
-			.ops = &clk_trion_fixed_pll_ops,
+			.ops = &clk_alpha_pll_fixed_trion_ops,
 		},
 	},
 };
@@ -118,7 +118,7 @@ static struct clk_alpha_pll gpll9 = {
 				.name = "bi_tcxo",
 			},
 			.num_parents = 1,
-			.ops = &clk_trion_fixed_pll_ops,
+			.ops = &clk_alpha_pll_fixed_trion_ops,
 		},
 	},
 };
-- 
2.26.1

