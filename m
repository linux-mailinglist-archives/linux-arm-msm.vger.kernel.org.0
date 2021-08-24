Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC6B3F613E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 17:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238059AbhHXPFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 11:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238042AbhHXPFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 11:05:36 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA7CC061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 08:04:52 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso46835559ott.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 08:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TWEMFNwr7e1JgPspoy/rWuf+AXK1mx9SVtQacyrpZEM=;
        b=Pod3/f+okx2EjsyCogTEgFpJpEVAK+Cr3FhuRUW1jDsrfXLAYZ/jnsaxZ5GQT3oNd8
         q5kcyv3a92dbH0V9GtmImwpLch8yNXnhOM/8hM1PFJ6Dz13UFMS/BoJlyciPE6tU8EH5
         mMdtc+nwjXsH4PLHIPdg04PZmKSy41M3AOMUDovsEQ6Pk6nWdWPEWOLgRFtLo/f4cTIS
         HJnDlTn7uFnXZGpOgF5PbvT9Y4wgsU9BaVB+qkItCGazhUz5XJ8q2HlWxbvozeS5D2vd
         l1kcUYnZKC7qouEJ4JI6KlObYo2QdnB9kiexD7ApPuuMfIWZq+uG1rCUDu9z7c7i0ULm
         djZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TWEMFNwr7e1JgPspoy/rWuf+AXK1mx9SVtQacyrpZEM=;
        b=OfCAAwV4+0mFMTtyzlTVpFvYuowBP/4mNA3bpCy4aGdHqA0ufVnm0vLb2/F9Y49Qi1
         cJ2Vck8btuip2shKrAUQ8gdVH6DITbCw4UIKe4966U95bK/iB0IlzCp120zOIi+dXzMx
         syVvZ8DD6qgtIiWCFSMAQAriV9xVz7mIsB3PP4MpXDdYb90ZmuO+ztprwe8nt8as8t/6
         1i++q3ZvGi9LkoACEcRO9I4Bnyxm8hCQIllISRH5y1Nef6zLfMZ5vES2vdtL0/EBK1cf
         WAk1iX8+FXnDvifz9LA05U68ASIifT4JS4ilLB/83Nd8OnhaMoMduGXwKooK+0OqfBDe
         h1vQ==
X-Gm-Message-State: AOAM530A8v5uw3YLdM2JMpBaCfiQrsnInHBP0+x7IOPGdLZlPUqKT80n
        I1VWByQ+5wV6jiTmix5UxkbUKhk5F3TQwA==
X-Google-Smtp-Source: ABdhPJxkP2jLSDeulhybwo8G8w4U9YwDC/BTnEoGmzxsGF6y+QYFzmDnlSkzLeelu6n+uT6otNxo6w==
X-Received: by 2002:aca:1b0b:: with SMTP id b11mr3136694oib.1.1629817491186;
        Tue, 24 Aug 2021 08:04:51 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e11sm1779066oiw.18.2021.08.24.08.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 08:04:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        angelogioacchino.delregno@somainline.org
Subject: [PATCH] clk: qcom: gcc-sdm660: Replace usage of parent_names
Date:   Tue, 24 Aug 2021 08:06:06 -0700
Message-Id: <20210824150606.678666-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using parent_data and parent_hws, instead of parent_names, does protect
against some cases of incompletely defined clock trees. While it turns
out that the bug being chased this time was totally unrelated, this
patch converts the SDM660 GCC driver to avoid such issues.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/gcc-sdm660.c | 532 +++++++++++++++++-----------------
 1 file changed, 268 insertions(+), 264 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 6394257ca8c0..60e41f92d616 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -27,129 +27,6 @@
 
 #define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
 
-enum {
-	P_XO,
-	P_SLEEP_CLK,
-	P_GPLL0,
-	P_GPLL1,
-	P_GPLL4,
-	P_GPLL0_EARLY_DIV,
-	P_GPLL1_EARLY_DIV,
-};
-
-static const struct parent_map gcc_parent_map_xo_gpll0_gpll0_early_div[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL0_EARLY_DIV, 6 },
-};
-
-static const char * const gcc_parent_names_xo_gpll0_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll0_early_div",
-};
-
-static const struct parent_map gcc_parent_map_xo_gpll0[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-};
-
-static const char * const gcc_parent_names_xo_gpll0[] = {
-	"xo",
-	"gpll0",
-};
-
-static const struct parent_map gcc_parent_map_xo_gpll0_sleep_clk_gpll0_early_div[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_SLEEP_CLK, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 },
-};
-
-static const char * const gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"sleep_clk",
-	"gpll0_early_div",
-};
-
-static const struct parent_map gcc_parent_map_xo_sleep_clk[] = {
-	{ P_XO, 0 },
-	{ P_SLEEP_CLK, 5 },
-};
-
-static const char * const gcc_parent_names_xo_sleep_clk[] = {
-	"xo",
-	"sleep_clk",
-};
-
-static const struct parent_map gcc_parent_map_xo_gpll4[] = {
-	{ P_XO, 0 },
-	{ P_GPLL4, 5 },
-};
-
-static const char * const gcc_parent_names_xo_gpll4[] = {
-	"xo",
-	"gpll4",
-};
-
-static const struct parent_map gcc_parent_map_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL0_EARLY_DIV, 3 },
-	{ P_GPLL1, 4 },
-	{ P_GPLL4, 5 },
-	{ P_GPLL1_EARLY_DIV, 6 },
-};
-
-static const char * const gcc_parent_names_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll0_early_div",
-	"gpll1",
-	"gpll4",
-	"gpll1_early_div",
-};
-
-static const struct parent_map gcc_parent_map_xo_gpll0_gpll4_gpll0_early_div[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 },
-};
-
-static const char * const gcc_parent_names_xo_gpll0_gpll4_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll4",
-	"gpll0_early_div",
-};
-
-static const struct parent_map gcc_parent_map_xo_gpll0_gpll0_early_div_gpll4[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL0_EARLY_DIV, 2 },
-	{ P_GPLL4, 5 },
-};
-
-static const char * const gcc_parent_names_xo_gpll0_gpll0_early_div_gpll4[] = {
-	"xo",
-	"gpll0",
-	"gpll0_early_div",
-	"gpll4",
-};
-
-static struct clk_fixed_factor xo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data){
-		.name = "xo",
-		.parent_names = (const char *[]){ "xo_board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 static struct clk_alpha_pll gpll0_early = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -158,7 +35,9 @@ static struct clk_alpha_pll gpll0_early = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_early",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -170,7 +49,9 @@ static struct clk_fixed_factor gpll0_early_div = {
 	.div = 2,
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll0_early_div",
-		.parent_names = (const char *[]){ "gpll0_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0_early.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_fixed_factor_ops,
 	},
@@ -181,7 +62,9 @@ static struct clk_alpha_pll_postdiv gpll0 = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
-		.parent_names = (const char *[]){ "gpll0_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0_early.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 	},
@@ -195,7 +78,9 @@ static struct clk_alpha_pll gpll1_early = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll1_early",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -207,7 +92,9 @@ static struct clk_fixed_factor gpll1_early_div = {
 	.div = 2,
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll1_early_div",
-		.parent_names = (const char *[]){ "gpll1_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll1_early.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_fixed_factor_ops,
 	},
@@ -218,7 +105,9 @@ static struct clk_alpha_pll_postdiv gpll1 = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll1",
-		.parent_names = (const char *[]){ "gpll1_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll1_early.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 	},
@@ -232,7 +121,9 @@ static struct clk_alpha_pll gpll4_early = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll4_early",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -245,12 +136,126 @@ static struct clk_alpha_pll_postdiv gpll4 = {
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "gpll4",
-		.parent_names = (const char *[]) { "gpll4_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll4_early.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 	},
 };
 
+enum {
+	P_XO,
+	P_SLEEP_CLK,
+	P_GPLL0,
+	P_GPLL1,
+	P_GPLL4,
+	P_GPLL0_EARLY_DIV,
+	P_GPLL1_EARLY_DIV,
+};
+
+static const struct parent_map gcc_parent_map_xo_gpll0_gpll0_early_div[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL0_EARLY_DIV, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_xo_gpll0_gpll0_early_div[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_early_div.hw },
+};
+
+static const struct parent_map gcc_parent_map_xo_gpll0[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+};
+
+static const struct clk_parent_data gcc_parent_data_xo_gpll0[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_xo_gpll0_sleep_clk_gpll0_early_div[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_GPLL0_EARLY_DIV, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .fw_name = "sleep_clk" },
+	{ .hw = &gpll0_early_div.hw },
+};
+
+static const struct parent_map gcc_parent_map_xo_sleep_clk[] = {
+	{ P_XO, 0 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data gcc_parent_data_xo_sleep_clk[] = {
+	{ .fw_name = "xo" },
+	{ .fw_name = "sleep_clk" },
+};
+
+static const struct parent_map gcc_parent_map_xo_gpll4[] = {
+	{ P_XO, 0 },
+	{ P_GPLL4, 5 },
+};
+
+static const struct clk_parent_data gcc_parent_data_xo_gpll4[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll4.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL0_EARLY_DIV, 3 },
+	{ P_GPLL1, 4 },
+	{ P_GPLL4, 5 },
+	{ P_GPLL1_EARLY_DIV, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_early_div.hw },
+	{ .hw = &gpll1.clkr.hw },
+	{ .hw = &gpll4.clkr.hw },
+	{ .hw = &gpll1_early_div.hw },
+};
+
+static const struct parent_map gcc_parent_map_xo_gpll0_gpll4_gpll0_early_div[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 },
+	{ P_GPLL0_EARLY_DIV, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_xo_gpll0_gpll4_gpll0_early_div[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll4.clkr.hw },
+	{ .hw = &gpll0_early_div.hw },
+};
+
+static const struct parent_map gcc_parent_map_xo_gpll0_gpll0_early_div_gpll4[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL0_EARLY_DIV, 2 },
+	{ P_GPLL4, 5 },
+};
+
+static const struct clk_parent_data gcc_parent_data_xo_gpll0_gpll0_early_div_gpll4[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_early_div.hw },
+	{ .hw = &gpll4.clkr.hw },
+};
+
 static const struct freq_tbl ftbl_blsp1_qup1_i2c_apps_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 12, 0, 0),
@@ -265,7 +270,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -290,7 +295,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -304,7 +309,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -318,7 +323,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -332,7 +337,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -346,7 +351,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -360,7 +365,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -374,7 +379,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -407,7 +412,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -421,7 +426,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -435,7 +440,7 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -449,7 +454,7 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -463,7 +468,7 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -477,7 +482,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -491,7 +496,7 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -505,7 +510,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -519,7 +524,7 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -533,7 +538,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -547,7 +552,7 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart1_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -561,7 +566,7 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart2_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -582,7 +587,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.freq_tbl = ftbl_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
@@ -596,7 +601,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.freq_tbl = ftbl_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
@@ -610,7 +615,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.freq_tbl = ftbl_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
@@ -630,7 +635,7 @@ static struct clk_rcg2 hmss_gpll0_clk_src = {
 	.freq_tbl = ftbl_hmss_gpll0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_gpll0_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -651,7 +656,7 @@ static struct clk_rcg2 hmss_gpll4_clk_src = {
 	.freq_tbl = ftbl_hmss_gpll4_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_gpll4_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll4,
+		.parent_data = gcc_parent_data_xo_gpll4,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -670,7 +675,7 @@ static struct clk_rcg2 hmss_rbcpr_clk_src = {
 	.freq_tbl = ftbl_hmss_rbcpr_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_rbcpr_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0,
+		.parent_data = gcc_parent_data_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -689,7 +694,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.freq_tbl = ftbl_pdm2_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -711,7 +716,7 @@ static struct clk_rcg2 qspi_ser_clk_src = {
 	.freq_tbl = ftbl_qspi_ser_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "qspi_ser_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div,
 		.num_parents = 6,
 		.ops = &clk_rcg2_ops,
 	},
@@ -737,7 +742,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.freq_tbl = ftbl_sdcc1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll4_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll4_gpll0_early_div,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
@@ -759,7 +764,7 @@ static struct clk_rcg2 sdcc1_ice_core_clk_src = {
 	.freq_tbl = ftbl_sdcc1_ice_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_ice_core_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -785,7 +790,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.freq_tbl = ftbl_sdcc2_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div_gpll4,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div_gpll4,
 		.num_parents = 4,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -808,7 +813,7 @@ static struct clk_rcg2 ufs_axi_clk_src = {
 	.freq_tbl = ftbl_ufs_axi_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_axi_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -829,7 +834,7 @@ static struct clk_rcg2 ufs_ice_core_clk_src = {
 	.freq_tbl = ftbl_ufs_ice_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_ice_core_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -843,7 +848,7 @@ static struct clk_rcg2 ufs_phy_aux_clk_src = {
 	.freq_tbl = ftbl_hmss_rbcpr_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_phy_aux_clk_src",
-		.parent_names = gcc_parent_names_xo_sleep_clk,
+		.parent_data = gcc_parent_data_xo_sleep_clk,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -864,7 +869,7 @@ static struct clk_rcg2 ufs_unipro_core_clk_src = {
 	.freq_tbl = ftbl_ufs_unipro_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_unipro_core_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -885,7 +890,7 @@ static struct clk_rcg2 usb20_master_clk_src = {
 	.freq_tbl = ftbl_usb20_master_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb20_master_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -905,7 +910,7 @@ static struct clk_rcg2 usb20_mock_utmi_clk_src = {
 	.freq_tbl = ftbl_usb20_mock_utmi_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb20_mock_utmi_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -930,7 +935,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	.freq_tbl = ftbl_usb30_master_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_master_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -951,7 +956,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	.freq_tbl = ftbl_usb30_mock_utmi_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_mock_utmi_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -971,7 +976,7 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
 	.freq_tbl = ftbl_usb3_phy_aux_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb3_phy_aux_clk_src",
-		.parent_names = gcc_parent_names_xo_sleep_clk,
+		.parent_data = gcc_parent_data_xo_sleep_clk,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -985,8 +990,8 @@ static struct clk_branch gcc_aggre2_ufs_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre2_ufs_axi_clk",
-			.parent_names = (const char *[]){
-				"ufs_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ufs_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1002,8 +1007,8 @@ static struct clk_branch gcc_aggre2_usb3_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre2_usb3_axi_clk",
-			.parent_names = (const char *[]){
-				"usb30_master_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1071,8 +1076,8 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup1_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup1_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1089,8 +1094,8 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup1_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup1_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1107,8 +1112,8 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup2_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup2_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1125,8 +1130,8 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup2_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup2_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1143,8 +1148,8 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup3_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup3_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1161,8 +1166,8 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup3_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup3_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1179,8 +1184,8 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup4_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup4_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1197,8 +1202,8 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup4_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup4_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1215,8 +1220,8 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart1_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart1_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_uart1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1233,8 +1238,8 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart2_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart2_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_uart2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1264,8 +1269,8 @@ static struct clk_branch gcc_blsp2_qup1_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup1_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_qup1_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1282,8 +1287,8 @@ static struct clk_branch gcc_blsp2_qup1_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup1_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup1_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_qup1_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1300,8 +1305,8 @@ static struct clk_branch gcc_blsp2_qup2_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup2_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_qup2_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1318,8 +1323,8 @@ static struct clk_branch gcc_blsp2_qup2_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup2_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup2_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_qup2_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1336,8 +1341,8 @@ static struct clk_branch gcc_blsp2_qup3_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup3_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_qup3_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1354,8 +1359,8 @@ static struct clk_branch gcc_blsp2_qup3_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup3_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup3_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_qup3_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1372,8 +1377,8 @@ static struct clk_branch gcc_blsp2_qup4_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup4_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_qup4_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1390,8 +1395,8 @@ static struct clk_branch gcc_blsp2_qup4_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup4_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup4_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_qup4_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1408,8 +1413,8 @@ static struct clk_branch gcc_blsp2_uart1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart1_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_uart1_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_uart1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1426,8 +1431,8 @@ static struct clk_branch gcc_blsp2_uart2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart2_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_uart2_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_uart2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1457,8 +1462,8 @@ static struct clk_branch gcc_cfg_noc_usb2_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_cfg_noc_usb2_axi_clk",
-			.parent_names = (const char *[]){
-				"usb20_master_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb20_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1474,8 +1479,8 @@ static struct clk_branch gcc_cfg_noc_usb3_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_cfg_noc_usb3_axi_clk",
-			.parent_names = (const char *[]){
-				"usb30_master_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1503,8 +1508,8 @@ static struct clk_branch gcc_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp1_clk",
-			.parent_names = (const char *[]){
-				"gp1_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1521,8 +1526,8 @@ static struct clk_branch gcc_gp2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp2_clk",
-			.parent_names = (const char *[]){
-				"gp2_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gp2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1539,8 +1544,8 @@ static struct clk_branch gcc_gp3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp3_clk",
-			.parent_names = (const char *[]){
-				"gp3_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gp3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1584,8 +1589,8 @@ static struct clk_branch gcc_gpu_gpll0_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_gpll0_clk",
-			.parent_names = (const char *[]){
-				"gpll0",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpll0.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1601,8 +1606,8 @@ static struct clk_branch gcc_gpu_gpll0_div_clk = {
 		.enable_mask = BIT(3),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_gpll0_div_clk",
-			.parent_names = (const char *[]){
-				"gpll0_early_div",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpll0_early_div.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1632,8 +1637,8 @@ static struct clk_branch gcc_hmss_rbcpr_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_hmss_rbcpr_clk",
-			.parent_names = (const char *[]){
-				"hmss_rbcpr_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&hmss_rbcpr_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1650,8 +1655,8 @@ static struct clk_branch gcc_mmss_gpll0_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mmss_gpll0_clk",
-			.parent_names = (const char *[]){
-				"gpll0",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpll0.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1667,8 +1672,8 @@ static struct clk_branch gcc_mmss_gpll0_div_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mmss_gpll0_div_clk",
-			.parent_names = (const char *[]){
-				"gpll0_early_div",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpll0_early_div.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1767,8 +1772,8 @@ static struct clk_branch gcc_pdm2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm2_clk",
-			.parent_names = (const char *[]){
-				"pdm2_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pdm2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1824,8 +1829,8 @@ static struct clk_branch gcc_qspi_ser_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qspi_ser_clk",
-			.parent_names = (const char *[]){
-				"qspi_ser_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&qspi_ser_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1881,8 +1886,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_apps_clk",
-			.parent_names = (const char *[]){
-				"sdcc1_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&sdcc1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1899,8 +1904,8 @@ static struct clk_branch gcc_sdcc1_ice_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ice_core_clk",
-			.parent_names = (const char *[]){
-				"sdcc1_ice_core_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&sdcc1_ice_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1930,8 +1935,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_apps_clk",
-			.parent_names = (const char *[]){
-				"sdcc2_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&sdcc2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1961,8 +1966,8 @@ static struct clk_branch gcc_ufs_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_axi_clk",
-			.parent_names = (const char *[]){
-				"ufs_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ufs_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1992,8 +1997,8 @@ static struct clk_branch gcc_ufs_ice_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_ice_core_clk",
-			.parent_names = (const char *[]){
-				"ufs_ice_core_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ufs_ice_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2010,8 +2015,8 @@ static struct clk_branch gcc_ufs_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_aux_clk",
-			.parent_names = (const char *[]){
-				"ufs_phy_aux_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ufs_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2067,8 +2072,8 @@ static struct clk_branch gcc_ufs_unipro_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_unipro_core_clk",
-			.parent_names = (const char *[]){
-				"ufs_unipro_core_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ufs_unipro_core_clk_src.clkr.hw,
 			},
 			.flags = CLK_SET_RATE_PARENT,
 			.num_parents = 1,
@@ -2085,8 +2090,8 @@ static struct clk_branch gcc_usb20_master_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb20_master_clk",
-			.parent_names = (const char *[]){
-				"usb20_master_clk_src"
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb20_master_clk_src.clkr.hw,
 			},
 			.flags = CLK_SET_RATE_PARENT,
 			.num_parents = 1,
@@ -2103,8 +2108,8 @@ static struct clk_branch gcc_usb20_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb20_mock_utmi_clk",
-			.parent_names = (const char *[]){
-				"usb20_mock_utmi_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb20_mock_utmi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2134,8 +2139,8 @@ static struct clk_branch gcc_usb30_master_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_master_clk",
-			.parent_names = (const char *[]){
-				"usb30_master_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2152,8 +2157,8 @@ static struct clk_branch gcc_usb30_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_mock_utmi_clk",
-			.parent_names = (const char *[]){
-				"usb30_mock_utmi_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb30_mock_utmi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2196,8 +2201,8 @@ static struct clk_branch gcc_usb3_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_phy_aux_clk",
-			.parent_names = (const char *[]){
-				"usb3_phy_aux_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb3_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2263,7 +2268,6 @@ static struct gdsc pcie_0_gdsc = {
 };
 
 static struct clk_hw *gcc_sdm660_hws[] = {
-	&xo.hw,
 	&gpll0_early_div.hw,
 	&gpll1_early_div.hw,
 };
-- 
2.29.2

