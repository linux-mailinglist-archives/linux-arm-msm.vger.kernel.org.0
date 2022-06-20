Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B81385516A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 13:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241340AbiFTLIJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 07:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241335AbiFTLHv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 07:07:51 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C45B15A04
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:07:47 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a2so16681794lfg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tRmXRGfFDUoAp1PR9MowKQeMqvzy3eMnXNFPiTLR9cI=;
        b=Lh5tI76QdgcD+o8GKOA2r/uYIxuNGL0oaCfCuzmuVBpOfA/Y6CZLzX+CIOoPEAFf/9
         9LkPt5ua7ktHDiJAX8z0GY03RotngOr/BCaFZFA3gwjngUKsCKvPTeZT129qgUF1DIqJ
         ictteXKQAbR5mLwR4UCmN+BNPEJggJ2eIj2ASy0Y3fCPDp3F8r0639Bj2hQJZ/zrYhzq
         rIK0vcJ8eyNN1Zzgu5OTF2ckQCxd0HEwGYHXsBs7CEAyDgPKRargDJiCSFBoALZAS+kE
         fL+HxVYP9gBQ+vOmZZcgdGIN+H+lCldpiO4KVTc52bBezAxwIqKQeg8kQvohmi9DLF4u
         m9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tRmXRGfFDUoAp1PR9MowKQeMqvzy3eMnXNFPiTLR9cI=;
        b=GGtnLvSfeNliPv+A3Y+xM7stYBO30ZJT1wCbS7lZdu8RUe3galMkKy/GVdro+hJ4wU
         J3V3xVRBOIii2VZS8nDLopn3+X9FEMQt5Dfnj5rmZf0FJKJFxnDJV7XCNhcgZSf0oqlk
         mM3lkdhOW+XQulTWze7FBavZqhOowpqer+6uNwH86KioCF7EsHWhoSXdHOVEp6nG2uV7
         O72dIp5i3jUCgnRP4zS7CvQlxJIYIA7+o1hs1J/LGFavyKWj2KXG/alMRekELk5MQ+XA
         X2IVi1g4oNyQZXj9MnBxZwy53+mPTMKjhn/cX3ob1x5/8kV2mf2ke8EKGZ8b4IcxEY49
         Ap8w==
X-Gm-Message-State: AJIora++Ohj0fXq7nMOjF46eGFyxpC73KzCuJK64Ip0+zoqevND65+G5
        TKUGvWIbmV4R3xSPWw4O4/piGw==
X-Google-Smtp-Source: AGRyM1u7KQWd8WB76sGEe9KGqyNNaRrqX/jd5XYj/5SzS/+QwTUQ1KLFid5S2BRp5+B1uOrM2hSuJA==
X-Received: by 2002:a05:6512:3b83:b0:47f:7419:5e58 with SMTP id g3-20020a0565123b8300b0047f74195e58mr1504565lfv.302.1655723265750;
        Mon, 20 Jun 2022 04:07:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d19-20020a194f13000000b00479a825aa5esm1722564lfb.154.2022.06.20.04.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:07:45 -0700 (PDT)
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
Subject: [PATCH 3/4] clk: qcom: gcc-msm8660: use parent_hws/_data instead of parent_names
Date:   Mon, 20 Jun 2022 14:07:38 +0300
Message-Id: <20220620110739.1598514-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
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

Convert the clock driver to specify parent data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names. Use parent_hws where possible to refer parent
clocks directly, skipping the lookup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8660.c | 264 ++++++++++++++++++++-------------
 1 file changed, 164 insertions(+), 100 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm8660.c
index 3c623dc4977b..657e1154bb9b 100644
--- a/drivers/clk/qcom/gcc-msm8660.c
+++ b/drivers/clk/qcom/gcc-msm8660.c
@@ -34,7 +34,9 @@ static struct clk_pll pll8 = {
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
@@ -45,7 +47,9 @@ static struct clk_regmap pll8_vote = {
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
@@ -62,9 +66,9 @@ static const struct parent_map gcc_pxo_pll8_map[] = {
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
@@ -73,10 +77,10 @@ static const struct parent_map gcc_pxo_pll8_cxo_map[] = {
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
 
 static struct freq_tbl clk_tbl_gsbi_uart[] = {
@@ -122,7 +126,7 @@ static struct clk_rcg gsbi1_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -138,8 +142,8 @@ static struct clk_branch gsbi1_uart_clk = {
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
@@ -173,7 +177,7 @@ static struct clk_rcg gsbi2_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -189,8 +193,8 @@ static struct clk_branch gsbi2_uart_clk = {
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
@@ -224,7 +228,7 @@ static struct clk_rcg gsbi3_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -240,8 +244,8 @@ static struct clk_branch gsbi3_uart_clk = {
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
@@ -275,7 +279,7 @@ static struct clk_rcg gsbi4_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -291,8 +295,8 @@ static struct clk_branch gsbi4_uart_clk = {
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
@@ -326,7 +330,7 @@ static struct clk_rcg gsbi5_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -342,8 +346,8 @@ static struct clk_branch gsbi5_uart_clk = {
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
@@ -377,7 +381,7 @@ static struct clk_rcg gsbi6_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -393,8 +397,8 @@ static struct clk_branch gsbi6_uart_clk = {
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
@@ -428,7 +432,7 @@ static struct clk_rcg gsbi7_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -444,8 +448,8 @@ static struct clk_branch gsbi7_uart_clk = {
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
@@ -479,7 +483,7 @@ static struct clk_rcg gsbi8_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi8_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -495,7 +499,9 @@ static struct clk_branch gsbi8_uart_clk = {
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
@@ -528,7 +534,7 @@ static struct clk_rcg gsbi9_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi9_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -544,7 +550,9 @@ static struct clk_branch gsbi9_uart_clk = {
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
@@ -577,7 +585,7 @@ static struct clk_rcg gsbi10_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi10_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -593,7 +601,9 @@ static struct clk_branch gsbi10_uart_clk = {
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
@@ -626,7 +636,7 @@ static struct clk_rcg gsbi11_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi11_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -642,7 +652,9 @@ static struct clk_branch gsbi11_uart_clk = {
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
@@ -675,7 +687,7 @@ static struct clk_rcg gsbi12_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi12_uart_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -691,7 +703,9 @@ static struct clk_branch gsbi12_uart_clk = {
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
@@ -737,7 +751,7 @@ static struct clk_rcg gsbi1_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -753,7 +767,9 @@ static struct clk_branch gsbi1_qup_clk = {
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
@@ -786,7 +802,7 @@ static struct clk_rcg gsbi2_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -802,7 +818,9 @@ static struct clk_branch gsbi2_qup_clk = {
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
@@ -835,7 +853,7 @@ static struct clk_rcg gsbi3_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -851,7 +869,9 @@ static struct clk_branch gsbi3_qup_clk = {
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
@@ -884,7 +904,7 @@ static struct clk_rcg gsbi4_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -900,7 +920,9 @@ static struct clk_branch gsbi4_qup_clk = {
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
@@ -933,7 +955,7 @@ static struct clk_rcg gsbi5_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -949,7 +971,9 @@ static struct clk_branch gsbi5_qup_clk = {
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
@@ -982,7 +1006,7 @@ static struct clk_rcg gsbi6_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -998,7 +1022,9 @@ static struct clk_branch gsbi6_qup_clk = {
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
@@ -1031,7 +1057,7 @@ static struct clk_rcg gsbi7_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1047,7 +1073,9 @@ static struct clk_branch gsbi7_qup_clk = {
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
@@ -1080,7 +1108,7 @@ static struct clk_rcg gsbi8_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi8_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1096,7 +1124,9 @@ static struct clk_branch gsbi8_qup_clk = {
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
@@ -1129,7 +1159,7 @@ static struct clk_rcg gsbi9_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi9_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1145,7 +1175,9 @@ static struct clk_branch gsbi9_qup_clk = {
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
@@ -1178,7 +1210,7 @@ static struct clk_rcg gsbi10_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi10_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1194,7 +1226,9 @@ static struct clk_branch gsbi10_qup_clk = {
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
@@ -1227,7 +1261,7 @@ static struct clk_rcg gsbi11_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi11_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1243,7 +1277,9 @@ static struct clk_branch gsbi11_qup_clk = {
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
@@ -1276,7 +1312,7 @@ static struct clk_rcg gsbi12_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi12_qup_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1292,7 +1328,9 @@ static struct clk_branch gsbi12_qup_clk = {
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
@@ -1338,7 +1376,7 @@ static struct clk_rcg gp0_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp0_src",
-			.parent_names = gcc_pxo_pll8_cxo,
+			.parent_data = gcc_pxo_pll8_cxo,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -1354,7 +1392,9 @@ static struct clk_branch gp0_clk = {
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
@@ -1387,7 +1427,7 @@ static struct clk_rcg gp1_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp1_src",
-			.parent_names = gcc_pxo_pll8_cxo,
+			.parent_data = gcc_pxo_pll8_cxo,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1403,7 +1443,9 @@ static struct clk_branch gp1_clk = {
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
@@ -1436,7 +1478,7 @@ static struct clk_rcg gp2_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp2_src",
-			.parent_names = gcc_pxo_pll8_cxo,
+			.parent_data = gcc_pxo_pll8_cxo,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1452,7 +1494,9 @@ static struct clk_branch gp2_clk = {
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
@@ -1488,7 +1532,7 @@ static struct clk_rcg prng_src = {
 	.clkr.hw = {
 		.init = &(struct clk_init_data){
 			.name = "prng_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -1504,7 +1548,9 @@ static struct clk_branch prng_clk = {
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
@@ -1547,7 +1593,7 @@ static struct clk_rcg sdc1_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc1_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -1562,7 +1608,9 @@ static struct clk_branch sdc1_clk = {
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
@@ -1595,7 +1643,7 @@ static struct clk_rcg sdc2_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc2_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -1610,7 +1658,9 @@ static struct clk_branch sdc2_clk = {
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
@@ -1643,7 +1693,7 @@ static struct clk_rcg sdc3_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc3_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -1658,7 +1708,9 @@ static struct clk_branch sdc3_clk = {
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
@@ -1691,7 +1743,7 @@ static struct clk_rcg sdc4_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc4_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -1706,7 +1758,9 @@ static struct clk_branch sdc4_clk = {
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
@@ -1739,7 +1793,7 @@ static struct clk_rcg sdc5_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc5_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -1754,7 +1808,9 @@ static struct clk_branch sdc5_clk = {
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
@@ -1792,7 +1848,7 @@ static struct clk_rcg tsif_ref_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "tsif_ref_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1808,7 +1864,9 @@ static struct clk_branch tsif_ref_clk = {
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
@@ -1846,7 +1904,7 @@ static struct clk_rcg usb_hs1_xcvr_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_xcvr_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1862,7 +1920,9 @@ static struct clk_branch usb_hs1_xcvr_clk = {
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
@@ -1895,7 +1955,7 @@ static struct clk_rcg usb_fs1_xcvr_fs_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs1_xcvr_fs_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1903,8 +1963,6 @@ static struct clk_rcg usb_fs1_xcvr_fs_src = {
 	}
 };
 
-static const char * const usb_fs1_xcvr_fs_src_p[] = { "usb_fs1_xcvr_fs_src" };
-
 static struct clk_branch usb_fs1_xcvr_fs_clk = {
 	.halt_reg = 0x2fcc,
 	.halt_bit = 15,
@@ -1913,8 +1971,10 @@ static struct clk_branch usb_fs1_xcvr_fs_clk = {
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
@@ -1928,8 +1988,10 @@ static struct clk_branch usb_fs1_system_clk = {
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
@@ -1962,7 +2024,7 @@ static struct clk_rcg usb_fs2_xcvr_fs_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs2_xcvr_fs_src",
-			.parent_names = gcc_pxo_pll8,
+			.parent_data = gcc_pxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1970,8 +2032,6 @@ static struct clk_rcg usb_fs2_xcvr_fs_src = {
 	}
 };
 
-static const char * const usb_fs2_xcvr_fs_src_p[] = { "usb_fs2_xcvr_fs_src" };
-
 static struct clk_branch usb_fs2_xcvr_fs_clk = {
 	.halt_reg = 0x2fcc,
 	.halt_bit = 12,
@@ -1980,8 +2040,10 @@ static struct clk_branch usb_fs2_xcvr_fs_clk = {
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
@@ -1996,8 +2058,10 @@ static struct clk_branch usb_fs2_system_clk = {
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
-- 
2.35.1

