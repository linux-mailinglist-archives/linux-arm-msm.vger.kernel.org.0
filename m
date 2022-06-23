Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEBE95579CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 14:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbiFWMEd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 08:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbiFWME3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:04:29 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B66CA48E53
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:24 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id by38so1230382ljb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iJl5BONzxOkhlmaUzipjrDl632llpHk5cVygKFOOUkM=;
        b=bjLirSNG98q36Dzzf4jWjZzNnvUgRrd4qw11K7O4yOQ86PdLRJ704eQw5MUZhq88Iv
         jSQHR3hfLgsinqdU2vzs59i94i3Co1s9oE7UXzoOUSUoSpyAKbkZ2VVMlS6nEdiOkjpX
         Y2tMTQtdnMfl9pyFGJrHoTKLzgULQWPmcdFM2RXOYol2UN4lB2sDUXvVEIJa8NWVZP+y
         uLhBaNp8rr2kqJgILuq1kVZI0otrrFUgzTUJctKnYhtust/CkMaBpaDivza7Vac5RYs3
         mtgW3U0JmAu+aiD7g8ItFa7DeCTbrAALkGe/+akO0PtPy6QRcRi6YxdmARv1uwkNdLRq
         9G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iJl5BONzxOkhlmaUzipjrDl632llpHk5cVygKFOOUkM=;
        b=lNHMhUFTNhN9iNaWPVU7pZbBqiugkWkUaYzn4itatAfb+ZhM70mH5Tpi+p7+7GaRAH
         FMzW5DQyeB0WazGBDDodtdt2NFsgSRB9rWpMBEvWCGq0WXBZ4JQ3MRbth+NL6fdUUukt
         Zjavllz5Yin8gEos9GbnVHD5eHls5iMLZ1lCJaoCHdqWEH/xYunNTnMXa8mnUEajLSRG
         apF9VLDIiw0rOk8SNNNRt/atAKW4T1eU/An1tWFJl+Yh/ZuvoQ+WJOE7PeFDEutcUXoH
         ibcVaYmIJqoSoLotXMrie2cPDupaERb1Eq3lvULg0SlD8CvqibzeNoc54IphqzvTXmbK
         O0RA==
X-Gm-Message-State: AJIora+hCTDWS0nj6fACuXxKjtMc98SXAl8ft/LN+AEUq1X2JftbHc7H
        xjMX3VNXzxo/m1f5ijOIB2OzCw==
X-Google-Smtp-Source: AGRyM1u3o/ATMLAkV970jD2fpM902bz6Iu3ezKEUF/ER3cMacpixAtFoGSTRBVbxk1ODzmg/AajbsQ==
X-Received: by 2002:a2e:95d0:0:b0:25a:6f9b:f216 with SMTP id y16-20020a2e95d0000000b0025a6f9bf216mr4578505ljh.111.1655985862878;
        Thu, 23 Jun 2022 05:04:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 04/15] clk: qcom: gcc-msm8960: use parent_hws/_data instead of parent_names
Date:   Thu, 23 Jun 2022 15:04:07 +0300
Message-Id: <20220623120418.250589-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the clock driver to specify parent data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names. Use parent_hws where possible to refer parent
clocks directly, skipping the lookup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8960.c | 364 +++++++++++++++++++++------------
 1 file changed, 232 insertions(+), 132 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index cf1bccab2fa5..9dd4e7ffa1f8 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -35,7 +35,9 @@ static struct clk_pll pll3 = {
 	.status_bit = 16,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pll3",
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pxo", .name = "pxo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -46,7 +48,9 @@ static struct clk_regmap pll4_vote = {
 	.enable_mask = BIT(4),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll4_vote",
-		.parent_names = (const char *[]){ "pll4" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pll4", .name = "pll4",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -62,7 +66,9 @@ static struct clk_pll pll8 = {
 	.status_bit = 16,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pll8",
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pxo", .name = "pxo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -73,7 +79,9 @@ static struct clk_regmap pll8_vote = {
 	.enable_mask = BIT(8),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll8_vote",
-		.parent_names = (const char *[]){ "pll8" },
+		.parent_hws = (const struct clk_hw*[]){
+			&pll8.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -96,7 +104,9 @@ static struct hfpll_data hfpll0_data = {
 static struct clk_hfpll hfpll0 = {
 	.d = &hfpll0_data,
 	.clkr.hw.init = &(struct clk_init_data){
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pxo", .name = "pxo_board",
+		},
 		.num_parents = 1,
 		.name = "hfpll0",
 		.ops = &clk_ops_hfpll,
@@ -136,7 +146,9 @@ static struct hfpll_data hfpll1_data = {
 static struct clk_hfpll hfpll1 = {
 	.d = &hfpll1_data,
 	.clkr.hw.init = &(struct clk_init_data){
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pxo", .name = "pxo_board",
+		},
 		.num_parents = 1,
 		.name = "hfpll1",
 		.ops = &clk_ops_hfpll,
@@ -162,7 +174,9 @@ static struct hfpll_data hfpll2_data = {
 static struct clk_hfpll hfpll2 = {
 	.d = &hfpll2_data,
 	.clkr.hw.init = &(struct clk_init_data){
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pxo", .name = "pxo_board",
+		},
 		.num_parents = 1,
 		.name = "hfpll2",
 		.ops = &clk_ops_hfpll,
@@ -188,7 +202,9 @@ static struct hfpll_data hfpll3_data = {
 static struct clk_hfpll hfpll3 = {
 	.d = &hfpll3_data,
 	.clkr.hw.init = &(struct clk_init_data){
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pxo", .name = "pxo_board",
+		},
 		.num_parents = 1,
 		.name = "hfpll3",
 		.ops = &clk_ops_hfpll,
@@ -228,7 +244,9 @@ static struct hfpll_data hfpll_l2_data = {
 static struct clk_hfpll hfpll_l2 = {
 	.d = &hfpll_l2_data,
 	.clkr.hw.init = &(struct clk_init_data){
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pxo", .name = "pxo_board",
+		},
 		.num_parents = 1,
 		.name = "hfpll_l2",
 		.ops = &clk_ops_hfpll,
@@ -247,7 +265,9 @@ static struct clk_pll pll14 = {
 	.status_bit = 16,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pll14",
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pxo", .name = "pxo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -258,7 +278,9 @@ static struct clk_regmap pll14_vote = {
 	.enable_mask = BIT(14),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll14_vote",
-		.parent_names = (const char *[]){ "pll14" },
+		.parent_hws = (const struct clk_hw*[]){
+			&pll14.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -276,9 +298,9 @@ static const struct parent_map gcc_pxo_pll8_map[] = {
 	{ P_PLL8, 3 }
 };
 
-static const char * const gcc_pxo_pll8[] = {
-	"pxo",
-	"pll8_vote",
+static const struct clk_parent_data gcc_pxo_pll8[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
+	{ .hw = &pll8_vote.hw },
 };
 
 static const struct parent_map gcc_pxo_pll8_cxo_map[] = {
@@ -287,10 +309,10 @@ static const struct parent_map gcc_pxo_pll8_cxo_map[] = {
 	{ P_CXO, 5 }
 };
 
-static const char * const gcc_pxo_pll8_cxo[] = {
-	"pxo",
-	"pll8_vote",
-	"cxo",
+static const struct clk_parent_data gcc_pxo_pll8_cxo[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
+	{ .hw = &pll8_vote.hw },
+	{ .fw_name = "cxo", .name = "cxo_board" },
 };
 
 static const struct parent_map gcc_pxo_pll8_pll3_map[] = {
@@ -299,10 +321,10 @@ static const struct parent_map gcc_pxo_pll8_pll3_map[] = {
 	{ P_PLL3, 6 }
 };
 
-static const char * const gcc_pxo_pll8_pll3[] = {
-	"pxo",
-	"pll8_vote",
-	"pll3",
+static const struct clk_parent_data gcc_pxo_pll8_pll3[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
+	{ .hw = &pll8_vote.hw },
+	{ .hw = &pll3.clkr.hw },
 };
 
 static struct freq_tbl clk_tbl_gsbi_uart[] = {
@@ -348,7 +370,7 @@ static struct clk_rcg gsbi1_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -364,8 +386,8 @@ static struct clk_branch gsbi1_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_uart_clk",
-			.parent_names = (const char *[]){
-				"gsbi1_uart_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi1_uart_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
@@ -399,7 +421,7 @@ static struct clk_rcg gsbi2_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -415,8 +437,8 @@ static struct clk_branch gsbi2_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_uart_clk",
-			.parent_names = (const char *[]){
-				"gsbi2_uart_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi2_uart_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
@@ -450,7 +472,7 @@ static struct clk_rcg gsbi3_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -466,8 +488,8 @@ static struct clk_branch gsbi3_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_uart_clk",
-			.parent_names = (const char *[]){
-				"gsbi3_uart_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi3_uart_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
@@ -501,7 +523,7 @@ static struct clk_rcg gsbi4_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -517,8 +539,8 @@ static struct clk_branch gsbi4_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_uart_clk",
-			.parent_names = (const char *[]){
-				"gsbi4_uart_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi4_uart_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
@@ -552,7 +574,7 @@ static struct clk_rcg gsbi5_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -568,8 +590,8 @@ static struct clk_branch gsbi5_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_uart_clk",
-			.parent_names = (const char *[]){
-				"gsbi5_uart_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi5_uart_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
@@ -603,7 +625,7 @@ static struct clk_rcg gsbi6_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -619,8 +641,8 @@ static struct clk_branch gsbi6_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_uart_clk",
-			.parent_names = (const char *[]){
-				"gsbi6_uart_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi6_uart_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
@@ -654,7 +676,7 @@ static struct clk_rcg gsbi7_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -670,8 +692,8 @@ static struct clk_branch gsbi7_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_uart_clk",
-			.parent_names = (const char *[]){
-				"gsbi7_uart_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi7_uart_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
@@ -705,7 +727,7 @@ static struct clk_rcg gsbi8_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi8_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -721,7 +743,9 @@ static struct clk_branch gsbi8_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi8_uart_clk",
-			.parent_names = (const char *[]){ "gsbi8_uart_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi8_uart_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -754,7 +778,7 @@ static struct clk_rcg gsbi9_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi9_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -770,7 +794,9 @@ static struct clk_branch gsbi9_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi9_uart_clk",
-			.parent_names = (const char *[]){ "gsbi9_uart_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi9_uart_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -803,7 +829,7 @@ static struct clk_rcg gsbi10_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi10_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -819,7 +845,9 @@ static struct clk_branch gsbi10_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi10_uart_clk",
-			.parent_names = (const char *[]){ "gsbi10_uart_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi10_uart_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -852,7 +880,7 @@ static struct clk_rcg gsbi11_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi11_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -868,7 +896,9 @@ static struct clk_branch gsbi11_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi11_uart_clk",
-			.parent_names = (const char *[]){ "gsbi11_uart_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi11_uart_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -901,7 +931,7 @@ static struct clk_rcg gsbi12_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi12_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -917,7 +947,9 @@ static struct clk_branch gsbi12_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi12_uart_clk",
-			.parent_names = (const char *[]){ "gsbi12_uart_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi12_uart_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -963,7 +995,7 @@ static struct clk_rcg gsbi1_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -979,7 +1011,9 @@ static struct clk_branch gsbi1_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_qup_clk",
-			.parent_names = (const char *[]){ "gsbi1_qup_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi1_qup_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1012,7 +1046,7 @@ static struct clk_rcg gsbi2_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1028,7 +1062,9 @@ static struct clk_branch gsbi2_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_qup_clk",
-			.parent_names = (const char *[]){ "gsbi2_qup_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi2_qup_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1061,7 +1097,7 @@ static struct clk_rcg gsbi3_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1077,7 +1113,9 @@ static struct clk_branch gsbi3_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_qup_clk",
-			.parent_names = (const char *[]){ "gsbi3_qup_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi3_qup_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1110,7 +1148,7 @@ static struct clk_rcg gsbi4_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1126,7 +1164,9 @@ static struct clk_branch gsbi4_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_qup_clk",
-			.parent_names = (const char *[]){ "gsbi4_qup_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi4_qup_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1159,7 +1199,7 @@ static struct clk_rcg gsbi5_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1175,7 +1215,9 @@ static struct clk_branch gsbi5_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_qup_clk",
-			.parent_names = (const char *[]){ "gsbi5_qup_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi5_qup_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1208,7 +1250,7 @@ static struct clk_rcg gsbi6_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1224,7 +1266,9 @@ static struct clk_branch gsbi6_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_qup_clk",
-			.parent_names = (const char *[]){ "gsbi6_qup_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi6_qup_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1257,7 +1301,7 @@ static struct clk_rcg gsbi7_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1273,7 +1317,9 @@ static struct clk_branch gsbi7_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_qup_clk",
-			.parent_names = (const char *[]){ "gsbi7_qup_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi7_qup_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1306,7 +1352,7 @@ static struct clk_rcg gsbi8_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi8_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1322,7 +1368,9 @@ static struct clk_branch gsbi8_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi8_qup_clk",
-			.parent_names = (const char *[]){ "gsbi8_qup_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi8_qup_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1355,7 +1403,7 @@ static struct clk_rcg gsbi9_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi9_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1371,7 +1419,9 @@ static struct clk_branch gsbi9_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi9_qup_clk",
-			.parent_names = (const char *[]){ "gsbi9_qup_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi9_qup_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1404,7 +1454,7 @@ static struct clk_rcg gsbi10_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi10_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1420,7 +1470,9 @@ static struct clk_branch gsbi10_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi10_qup_clk",
-			.parent_names = (const char *[]){ "gsbi10_qup_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi10_qup_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1453,7 +1505,7 @@ static struct clk_rcg gsbi11_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi11_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1469,7 +1521,9 @@ static struct clk_branch gsbi11_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi11_qup_clk",
-			.parent_names = (const char *[]){ "gsbi11_qup_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi11_qup_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1502,7 +1556,7 @@ static struct clk_rcg gsbi12_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi12_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1518,7 +1572,9 @@ static struct clk_branch gsbi12_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi12_qup_clk",
-			.parent_names = (const char *[]){ "gsbi12_qup_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gsbi12_qup_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1564,7 +1620,7 @@ static struct clk_rcg gp0_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp0_src",
-			.parent_names = gcc_pxo_pll8_cxo,
+			.parent_data = gcc_pxo_pll8_cxo,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1580,7 +1636,9 @@ static struct clk_branch gp0_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp0_clk",
-			.parent_names = (const char *[]){ "gp0_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gp0_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1613,7 +1671,7 @@ static struct clk_rcg gp1_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp1_src",
-			.parent_names = gcc_pxo_pll8_cxo,
+			.parent_data = gcc_pxo_pll8_cxo,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1629,7 +1687,9 @@ static struct clk_branch gp1_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp1_clk",
-			.parent_names = (const char *[]){ "gp1_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gp1_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1662,7 +1722,7 @@ static struct clk_rcg gp2_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp2_src",
-			.parent_names = gcc_pxo_pll8_cxo,
+			.parent_data = gcc_pxo_pll8_cxo,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1678,7 +1738,9 @@ static struct clk_branch gp2_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp2_clk",
-			.parent_names = (const char *[]){ "gp2_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gp2_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1714,7 +1776,7 @@ static struct clk_rcg prng_src = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "prng_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -1730,7 +1792,9 @@ static struct clk_branch prng_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "prng_clk",
-			.parent_names = (const char *[]){ "prng_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&prng_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 		},
@@ -1776,7 +1840,7 @@ static struct clk_rcg sdc1_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc1_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -1791,7 +1855,9 @@ static struct clk_branch sdc1_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc1_clk",
-			.parent_names = (const char *[]){ "sdc1_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&sdc1_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1824,7 +1890,7 @@ static struct clk_rcg sdc2_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc2_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -1839,7 +1905,9 @@ static struct clk_branch sdc2_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc2_clk",
-			.parent_names = (const char *[]){ "sdc2_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&sdc2_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1872,7 +1940,7 @@ static struct clk_rcg sdc3_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc3_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -1887,7 +1955,9 @@ static struct clk_branch sdc3_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc3_clk",
-			.parent_names = (const char *[]){ "sdc3_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&sdc3_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1920,7 +1990,7 @@ static struct clk_rcg sdc4_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc4_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -1935,7 +2005,9 @@ static struct clk_branch sdc4_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc4_clk",
-			.parent_names = (const char *[]){ "sdc4_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&sdc4_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1968,7 +2040,7 @@ static struct clk_rcg sdc5_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc5_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -1983,7 +2055,9 @@ static struct clk_branch sdc5_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc5_clk",
-			.parent_names = (const char *[]){ "sdc5_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&sdc5_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2021,7 +2095,7 @@ static struct clk_rcg tsif_ref_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "tsif_ref_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -2037,7 +2111,9 @@ static struct clk_branch tsif_ref_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "tsif_ref_clk",
-			.parent_names = (const char *[]){ "tsif_ref_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&tsif_ref_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2075,7 +2151,7 @@ static struct clk_rcg usb_hs1_xcvr_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_xcvr_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -2091,7 +2167,9 @@ static struct clk_branch usb_hs1_xcvr_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_xcvr_clk",
-			.parent_names = (const char *[]){ "usb_hs1_xcvr_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hs1_xcvr_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2124,7 +2202,7 @@ static struct clk_rcg usb_hs3_xcvr_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs3_xcvr_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -2140,7 +2218,9 @@ static struct clk_branch usb_hs3_xcvr_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs3_xcvr_clk",
-			.parent_names = (const char *[]){ "usb_hs3_xcvr_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hs3_xcvr_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2173,7 +2253,7 @@ static struct clk_rcg usb_hs4_xcvr_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs4_xcvr_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -2189,7 +2269,9 @@ static struct clk_branch usb_hs4_xcvr_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs4_xcvr_clk",
-			.parent_names = (const char *[]){ "usb_hs4_xcvr_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hs4_xcvr_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2222,7 +2304,7 @@ static struct clk_rcg usb_hsic_xcvr_fs_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_xcvr_fs_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -2230,8 +2312,6 @@ static struct clk_rcg usb_hsic_xcvr_fs_src = {
 	}
 };
 
-static const char * const usb_hsic_xcvr_fs_src_p[] = { "usb_hsic_xcvr_fs_src" };
-
 static struct clk_branch usb_hsic_xcvr_fs_clk = {
 	.halt_reg = 0x2fc8,
 	.halt_bit = 2,
@@ -2240,8 +2320,10 @@ static struct clk_branch usb_hsic_xcvr_fs_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_xcvr_fs_clk",
-			.parent_names = usb_hsic_xcvr_fs_src_p,
-			.num_parents = ARRAY_SIZE(usb_hsic_xcvr_fs_src_p),
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hsic_xcvr_fs_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -2255,8 +2337,10 @@ static struct clk_branch usb_hsic_system_clk = {
 		.enable_reg = 0x292c,
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = usb_hsic_xcvr_fs_src_p,
-			.num_parents = ARRAY_SIZE(usb_hsic_xcvr_fs_src_p),
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hsic_xcvr_fs_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.name = "usb_hsic_system_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2271,7 +2355,9 @@ static struct clk_branch usb_hsic_hsic_clk = {
 		.enable_reg = 0x2b44,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = (const char *[]){ "pll14_vote" },
+			.parent_hws = (const struct clk_hw*[]){
+				&pll14_vote.hw
+			},
 			.num_parents = 1,
 			.name = "usb_hsic_hsic_clk",
 			.ops = &clk_branch_ops,
@@ -2317,7 +2403,7 @@ static struct clk_rcg usb_fs1_xcvr_fs_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs1_xcvr_fs_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -2325,8 +2411,6 @@ static struct clk_rcg usb_fs1_xcvr_fs_src = {
 	}
 };
 
-static const char * const usb_fs1_xcvr_fs_src_p[] = { "usb_fs1_xcvr_fs_src" };
-
 static struct clk_branch usb_fs1_xcvr_fs_clk = {
 	.halt_reg = 0x2fcc,
 	.halt_bit = 15,
@@ -2335,8 +2419,10 @@ static struct clk_branch usb_fs1_xcvr_fs_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs1_xcvr_fs_clk",
-			.parent_names = usb_fs1_xcvr_fs_src_p,
-			.num_parents = ARRAY_SIZE(usb_fs1_xcvr_fs_src_p),
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_fs1_xcvr_fs_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -2350,8 +2436,10 @@ static struct clk_branch usb_fs1_system_clk = {
 		.enable_reg = 0x296c,
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = usb_fs1_xcvr_fs_src_p,
-			.num_parents = ARRAY_SIZE(usb_fs1_xcvr_fs_src_p),
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_fs1_xcvr_fs_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.name = "usb_fs1_system_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2384,7 +2472,7 @@ static struct clk_rcg usb_fs2_xcvr_fs_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs2_xcvr_fs_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -2392,8 +2480,6 @@ static struct clk_rcg usb_fs2_xcvr_fs_src = {
 	}
 };
 
-static const char * const usb_fs2_xcvr_fs_src_p[] = { "usb_fs2_xcvr_fs_src" };
-
 static struct clk_branch usb_fs2_xcvr_fs_clk = {
 	.halt_reg = 0x2fcc,
 	.halt_bit = 12,
@@ -2402,8 +2488,10 @@ static struct clk_branch usb_fs2_xcvr_fs_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs2_xcvr_fs_clk",
-			.parent_names = usb_fs2_xcvr_fs_src_p,
-			.num_parents = ARRAY_SIZE(usb_fs2_xcvr_fs_src_p),
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_fs2_xcvr_fs_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -2418,8 +2506,10 @@ static struct clk_branch usb_fs2_system_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs2_system_clk",
-			.parent_names = usb_fs2_xcvr_fs_src_p,
-			.num_parents = ARRAY_SIZE(usb_fs2_xcvr_fs_src_p),
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_fs2_xcvr_fs_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -2872,7 +2962,7 @@ static struct clk_rcg ce3_src = {
 		.enable_mask = BIT(7),
 		.hw.init = &(struct clk_init_data){
 			.name = "ce3_src",
-			.parent_names = gcc_pxo_pll8_pll3,
+			.parent_data = gcc_pxo_pll8_pll3,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_pll3),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -2888,7 +2978,9 @@ static struct clk_branch ce3_core_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "ce3_core_clk",
-			.parent_names = (const char *[]){ "ce3_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ce3_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2904,7 +2996,9 @@ static struct clk_branch ce3_h_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "ce3_h_clk",
-			.parent_names = (const char *[]){ "ce3_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ce3_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2934,7 +3028,7 @@ static struct clk_rcg sata_clk_src = {
 		.enable_mask = BIT(7),
 		.hw.init = &(struct clk_init_data){
 			.name = "sata_clk_src",
-			.parent_names = gcc_pxo_pll8_pll3,
+			.parent_data = gcc_pxo_pll8_pll3,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_pll3),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -2950,7 +3044,9 @@ static struct clk_branch sata_rxoob_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "sata_rxoob_clk",
-			.parent_names = (const char *[]){ "sata_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&sata_clk_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2966,7 +3062,9 @@ static struct clk_branch sata_pmalive_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "sata_pmalive_clk",
-			.parent_names = (const char *[]){ "sata_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&sata_clk_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2982,7 +3080,9 @@ static struct clk_branch sata_phy_ref_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "sata_phy_ref_clk",
-			.parent_names = (const char *[]){ "pxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "pxo", .name = "pxo_board",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 		},
-- 
2.35.1

