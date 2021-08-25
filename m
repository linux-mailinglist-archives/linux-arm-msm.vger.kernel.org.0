Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA753F7D4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 22:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242668AbhHYUov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 16:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbhHYUov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 16:44:51 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28C3C0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 13:44:04 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so580989otg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 13:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HIwkoR0ghCyix/crsnoBrPoR7F7iZVtHk/2HDYHMFH4=;
        b=C0nxA0AKRHsw0swGKo/6vhGqvO+7Nyfj3K5IYJi3UzQ/CnF1pyEil/YxRDGuRPFIwQ
         PCu2+PP45UvJ9Fs0L7qeuHs3yqYVKBGYP+3X4HOG2RKhbg9Dli4XzQfest5yxV4xBXVy
         1gn6kxcjgQ0JQgMPlCy+rJ4THEo5C1rddNooL1rg68YUtCqtA7HwbAwY32PIKB6fmMMb
         91OkUNOTTRigGxnwCn+zwBruHXYCY7j4HjQ8xhDmQSKX6U5mqzHtzSW8qNCqlY9xg8CJ
         HDQATFD5WScLwlTUFAepPR59K95J3bU7fy+HZfxluIpCv6fTijN7duIH9NundA5ok137
         B3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HIwkoR0ghCyix/crsnoBrPoR7F7iZVtHk/2HDYHMFH4=;
        b=JFuVSv9EDIP9gao+1hbS/gjB7vitbIFqh3Zq5zaQZFnwAUo1TUlizLISZ7hxx31AWA
         awMqJGrI2/8Q0RBdg8c6d3fA8pTIfwQtrrt/azRqJwptOKf/uRd5ilSAzAV/utLxNpk3
         3+O9NiDyzf7zTHLF7ILwRuS31d0tKCxp+5YKsJccKC2HMc5mPrSxWwnRiQzInTO5YI8v
         1j6i8YtWA0Emh6cNVgR38yFlN/+Rc5oSpLuTS++Ia2nraElHC0tlCgXo4eXWmo0j43ap
         trojxqSoxaOKn+2Df4SWKuNzYjtaSzi/434Yqlnna24MnFjaYJGg4OMgSGL3kKH2M1Ig
         kQNg==
X-Gm-Message-State: AOAM533pcaKUTZAkeaJSSI+3k8+RGCmP/yg8KeZTdSvOudMDvAGgZoDI
        pam6J3uoXEvUvXbQ1Kpi7tdWx+92PDnmiw==
X-Google-Smtp-Source: ABdhPJwrRDmUqsY7aNznWZJcfOkcmhzEnMbmxhmeaCv4n6GDela6WhLPvEBuRetvwHVq+wKaDdtoVg==
X-Received: by 2002:a9d:5d01:: with SMTP id b1mr252022oti.263.1629924243977;
        Wed, 25 Aug 2021 13:44:03 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 21sm204471oij.39.2021.08.25.13.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 13:44:03 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        angelogioacchino.delregno@somainline.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2] clk: qcom: gcc-sdm660: Replace usage of parent_names
Date:   Wed, 25 Aug 2021 13:45:17 -0700
Message-Id: <20210825204517.1278130-1-bjorn.andersson@linaro.org>
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

The "xo" fixed_factor clock is unused within the gcc driver, but
referenced from the DSI PHY. So it's left in place until the DSI driver
is updated.

Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Added "xo" back to avoid regression in the DSI PHY

 drivers/clk/qcom/gcc-sdm660.c | 524 ++++++++++++++++++----------------
 1 file changed, 271 insertions(+), 253 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 6394257ca8c0..24c544772f03 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -27,124 +27,14 @@
 
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
 static struct clk_fixed_factor xo = {
 	.mult = 1,
 	.div = 1,
 	.hw.init = &(struct clk_init_data){
 		.name = "xo",
-		.parent_names = (const char *[]){ "xo_board" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xo"
+		},
 		.num_parents = 1,
 		.ops = &clk_fixed_factor_ops,
 	},
@@ -158,7 +48,9 @@ static struct clk_alpha_pll gpll0_early = {
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
@@ -170,7 +62,9 @@ static struct clk_fixed_factor gpll0_early_div = {
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
@@ -181,7 +75,9 @@ static struct clk_alpha_pll_postdiv gpll0 = {
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
@@ -195,7 +91,9 @@ static struct clk_alpha_pll gpll1_early = {
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
@@ -207,7 +105,9 @@ static struct clk_fixed_factor gpll1_early_div = {
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
@@ -218,7 +118,9 @@ static struct clk_alpha_pll_postdiv gpll1 = {
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
@@ -232,7 +134,9 @@ static struct clk_alpha_pll gpll4_early = {
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
@@ -245,12 +149,126 @@ static struct clk_alpha_pll_postdiv gpll4 = {
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
@@ -265,7 +283,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -290,7 +308,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -304,7 +322,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -318,7 +336,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -332,7 +350,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -346,7 +364,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -360,7 +378,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -374,7 +392,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -407,7 +425,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -421,7 +439,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -435,7 +453,7 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -449,7 +467,7 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -463,7 +481,7 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -477,7 +495,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -491,7 +509,7 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -505,7 +523,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -519,7 +537,7 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -533,7 +551,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -547,7 +565,7 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart1_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -561,7 +579,7 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart2_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -582,7 +600,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.freq_tbl = ftbl_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
@@ -596,7 +614,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.freq_tbl = ftbl_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
@@ -610,7 +628,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.freq_tbl = ftbl_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_sleep_clk_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_sleep_clk_gpll0_early_div,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
@@ -630,7 +648,7 @@ static struct clk_rcg2 hmss_gpll0_clk_src = {
 	.freq_tbl = ftbl_hmss_gpll0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_gpll0_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -651,7 +669,7 @@ static struct clk_rcg2 hmss_gpll4_clk_src = {
 	.freq_tbl = ftbl_hmss_gpll4_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_gpll4_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll4,
+		.parent_data = gcc_parent_data_xo_gpll4,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -670,7 +688,7 @@ static struct clk_rcg2 hmss_rbcpr_clk_src = {
 	.freq_tbl = ftbl_hmss_rbcpr_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_rbcpr_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0,
+		.parent_data = gcc_parent_data_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -689,7 +707,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.freq_tbl = ftbl_pdm2_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -711,7 +729,7 @@ static struct clk_rcg2 qspi_ser_clk_src = {
 	.freq_tbl = ftbl_qspi_ser_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "qspi_ser_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div_gpll1_gpll4_gpll1_early_div,
 		.num_parents = 6,
 		.ops = &clk_rcg2_ops,
 	},
@@ -737,7 +755,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.freq_tbl = ftbl_sdcc1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll4_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll4_gpll0_early_div,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
@@ -759,7 +777,7 @@ static struct clk_rcg2 sdcc1_ice_core_clk_src = {
 	.freq_tbl = ftbl_sdcc1_ice_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_ice_core_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -785,7 +803,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.freq_tbl = ftbl_sdcc2_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div_gpll4,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div_gpll4,
 		.num_parents = 4,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -808,7 +826,7 @@ static struct clk_rcg2 ufs_axi_clk_src = {
 	.freq_tbl = ftbl_ufs_axi_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_axi_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -829,7 +847,7 @@ static struct clk_rcg2 ufs_ice_core_clk_src = {
 	.freq_tbl = ftbl_ufs_ice_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_ice_core_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -843,7 +861,7 @@ static struct clk_rcg2 ufs_phy_aux_clk_src = {
 	.freq_tbl = ftbl_hmss_rbcpr_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_phy_aux_clk_src",
-		.parent_names = gcc_parent_names_xo_sleep_clk,
+		.parent_data = gcc_parent_data_xo_sleep_clk,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -864,7 +882,7 @@ static struct clk_rcg2 ufs_unipro_core_clk_src = {
 	.freq_tbl = ftbl_ufs_unipro_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_unipro_core_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -885,7 +903,7 @@ static struct clk_rcg2 usb20_master_clk_src = {
 	.freq_tbl = ftbl_usb20_master_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb20_master_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -905,7 +923,7 @@ static struct clk_rcg2 usb20_mock_utmi_clk_src = {
 	.freq_tbl = ftbl_usb20_mock_utmi_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb20_mock_utmi_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -930,7 +948,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	.freq_tbl = ftbl_usb30_master_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_master_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -951,7 +969,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	.freq_tbl = ftbl_usb30_mock_utmi_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_mock_utmi_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
+		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
@@ -971,7 +989,7 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
 	.freq_tbl = ftbl_usb3_phy_aux_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb3_phy_aux_clk_src",
-		.parent_names = gcc_parent_names_xo_sleep_clk,
+		.parent_data = gcc_parent_data_xo_sleep_clk,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -985,8 +1003,8 @@ static struct clk_branch gcc_aggre2_ufs_axi_clk = {
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
@@ -1002,8 +1020,8 @@ static struct clk_branch gcc_aggre2_usb3_axi_clk = {
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
@@ -1071,8 +1089,8 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
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
@@ -1089,8 +1107,8 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
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
@@ -1107,8 +1125,8 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
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
@@ -1125,8 +1143,8 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
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
@@ -1143,8 +1161,8 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
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
@@ -1161,8 +1179,8 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
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
@@ -1179,8 +1197,8 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
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
@@ -1197,8 +1215,8 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
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
@@ -1215,8 +1233,8 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
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
@@ -1233,8 +1251,8 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
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
@@ -1264,8 +1282,8 @@ static struct clk_branch gcc_blsp2_qup1_i2c_apps_clk = {
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
@@ -1282,8 +1300,8 @@ static struct clk_branch gcc_blsp2_qup1_spi_apps_clk = {
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
@@ -1300,8 +1318,8 @@ static struct clk_branch gcc_blsp2_qup2_i2c_apps_clk = {
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
@@ -1318,8 +1336,8 @@ static struct clk_branch gcc_blsp2_qup2_spi_apps_clk = {
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
@@ -1336,8 +1354,8 @@ static struct clk_branch gcc_blsp2_qup3_i2c_apps_clk = {
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
@@ -1354,8 +1372,8 @@ static struct clk_branch gcc_blsp2_qup3_spi_apps_clk = {
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
@@ -1372,8 +1390,8 @@ static struct clk_branch gcc_blsp2_qup4_i2c_apps_clk = {
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
@@ -1390,8 +1408,8 @@ static struct clk_branch gcc_blsp2_qup4_spi_apps_clk = {
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
@@ -1408,8 +1426,8 @@ static struct clk_branch gcc_blsp2_uart1_apps_clk = {
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
@@ -1426,8 +1444,8 @@ static struct clk_branch gcc_blsp2_uart2_apps_clk = {
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
@@ -1457,8 +1475,8 @@ static struct clk_branch gcc_cfg_noc_usb2_axi_clk = {
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
@@ -1474,8 +1492,8 @@ static struct clk_branch gcc_cfg_noc_usb3_axi_clk = {
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
@@ -1503,8 +1521,8 @@ static struct clk_branch gcc_gp1_clk = {
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
@@ -1521,8 +1539,8 @@ static struct clk_branch gcc_gp2_clk = {
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
@@ -1539,8 +1557,8 @@ static struct clk_branch gcc_gp3_clk = {
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
@@ -1584,8 +1602,8 @@ static struct clk_branch gcc_gpu_gpll0_clk = {
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
@@ -1601,8 +1619,8 @@ static struct clk_branch gcc_gpu_gpll0_div_clk = {
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
@@ -1632,8 +1650,8 @@ static struct clk_branch gcc_hmss_rbcpr_clk = {
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
@@ -1650,8 +1668,8 @@ static struct clk_branch gcc_mmss_gpll0_clk = {
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
@@ -1667,8 +1685,8 @@ static struct clk_branch gcc_mmss_gpll0_div_clk = {
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
@@ -1767,8 +1785,8 @@ static struct clk_branch gcc_pdm2_clk = {
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
@@ -1824,8 +1842,8 @@ static struct clk_branch gcc_qspi_ser_clk = {
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
@@ -1881,8 +1899,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
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
@@ -1899,8 +1917,8 @@ static struct clk_branch gcc_sdcc1_ice_core_clk = {
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
@@ -1930,8 +1948,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
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
@@ -1961,8 +1979,8 @@ static struct clk_branch gcc_ufs_axi_clk = {
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
@@ -1992,8 +2010,8 @@ static struct clk_branch gcc_ufs_ice_core_clk = {
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
@@ -2010,8 +2028,8 @@ static struct clk_branch gcc_ufs_phy_aux_clk = {
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
@@ -2067,8 +2085,8 @@ static struct clk_branch gcc_ufs_unipro_core_clk = {
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
@@ -2085,8 +2103,8 @@ static struct clk_branch gcc_usb20_master_clk = {
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
@@ -2103,8 +2121,8 @@ static struct clk_branch gcc_usb20_mock_utmi_clk = {
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
@@ -2134,8 +2152,8 @@ static struct clk_branch gcc_usb30_master_clk = {
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
@@ -2152,8 +2170,8 @@ static struct clk_branch gcc_usb30_mock_utmi_clk = {
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
@@ -2196,8 +2214,8 @@ static struct clk_branch gcc_usb3_phy_aux_clk = {
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
-- 
2.29.2

