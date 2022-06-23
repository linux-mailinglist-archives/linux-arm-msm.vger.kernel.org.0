Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C44005579E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 14:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbiFWMEq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 08:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbiFWMEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:04:38 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296EF488B8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:27 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g12so16969083ljk.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yYuR1cCC8HKeJ1OhnLrcFmMnHugyrgSMFrZGEVfsT54=;
        b=a67JNuiO4eJDBpE8H+bPE65Vc0oCFj4dS29eRi6JuGfb/41qftFmUhOkHmWrV2L/Zw
         VqkK1p91C/C6QaZwmaK+7E+EPkNHuurlSyb6Fu5duxPgP/BEr2aLPBVTvEcWUN/CQE44
         q/y8CFOOq6Ex5iPe4nJpfexEKPTfc4ao1SDhKoFMdYlbbCHfeA9R/O/JA4zvmRB8Ik3U
         8YuUvNUy5PgWrSFpkeWA0TLT6us9E6aZEjMK/4esO+qA2YHdTG7ZNNvEhYqxKUwnKFEO
         uTNI2pp4CQUG7ltSklZPJLdjDKeSoyu6XNX/WDBKMy587NUgfBQq1Zcl+YZzc6xVIynC
         v+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yYuR1cCC8HKeJ1OhnLrcFmMnHugyrgSMFrZGEVfsT54=;
        b=lnrmGTbVzzXCcVlzU/ylWQJ+2zYQwqjh0onWftX5vkThBNwSdOjCMfVvVYzwdaphYD
         WcsRTc1F/Aousr1RbUubl/DHK1/BEDl9RiNU7wpAL5pgJvxkkc2daOxFwjxn58R6Pj8E
         W3aDcU3eR6ZGJsjaI/qETCCcTWyVKQ+mmNQZFlvLwJfIObDLBKic1TpMH/k8Ff1w9dKM
         1yv/JwPQ7UV4q7kXvdBcgx6RuMq+L1OPDQ5VfoxT01iB4tdVUP2dBVZKfeOUkMpPTgZs
         iKEBkv5dhBh3Y399m8bqk6ZCW7OiRQzM5khro6QZciMuTGUYELsqT3YbyVGBVIVjWX4I
         YK6Q==
X-Gm-Message-State: AJIora/OrEsIhvr20OKDojB4D9/8v1TJpAMrmpWxoCsCC8ijd9dJWiT5
        rejiXixzzBfKFRe+FVG7LmfPtqGxoi8qmxWn
X-Google-Smtp-Source: AGRyM1sYZ6LCtZijR5ENaSgRdp+AyLV0oret3gH9CJft9sT/7v77rm6188rcQP28AORBd2tG5c3c1A==
X-Received: by 2002:a2e:702:0:b0:253:bc1a:8a8c with SMTP id 2-20020a2e0702000000b00253bc1a8a8cmr4398017ljh.128.1655985866517;
        Thu, 23 Jun 2022 05:04:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:26 -0700 (PDT)
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
Subject: [PATCH 09/15] clk: qcom: mmcc-msm8960: use parent_hws/_data instead of parent_names
Date:   Thu, 23 Jun 2022 15:04:12 +0300
Message-Id: <20220623120418.250589-10-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/mmcc-msm8960.c | 322 ++++++++++++++++++++------------
 1 file changed, 203 insertions(+), 119 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index 0cab41da80ff..6bf908a51f53 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -51,7 +51,9 @@ static struct clk_pll pll2 = {
 	.status_bit = 16,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pll2",
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "pxo", .name = "pxo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -67,7 +69,9 @@ static struct clk_pll pll15 = {
 	.status_bit = 16,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pll15",
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "pxo", .name = "pxo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -93,10 +97,10 @@ static const struct parent_map mmcc_pxo_pll8_pll2_map[] = {
 	{ P_PLL2, 1 }
 };
 
-static const char * const mmcc_pxo_pll8_pll2[] = {
-	"pxo",
-	"pll8_vote",
-	"pll2",
+static const struct clk_parent_data mmcc_pxo_pll8_pll2[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
+	{ .fw_name = "pll8_vote", .name = "pll8_vote" },
+	{ .hw = &pll2.clkr.hw },
 };
 
 static const struct parent_map mmcc_pxo_pll8_pll2_pll3_map[] = {
@@ -106,11 +110,11 @@ static const struct parent_map mmcc_pxo_pll8_pll2_pll3_map[] = {
 	{ P_PLL3, 3 }
 };
 
-static const char * const mmcc_pxo_pll8_pll2_pll15[] = {
-	"pxo",
-	"pll8_vote",
-	"pll2",
-	"pll15",
+static const struct clk_parent_data mmcc_pxo_pll8_pll2_pll15[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
+	{ .fw_name = "pll8_vote", .name = "pll8_vote" },
+	{ .hw = &pll2.clkr.hw },
+	{ .hw = &pll15.clkr.hw },
 };
 
 static const struct parent_map mmcc_pxo_pll8_pll2_pll15_map[] = {
@@ -120,11 +124,11 @@ static const struct parent_map mmcc_pxo_pll8_pll2_pll15_map[] = {
 	{ P_PLL15, 3 }
 };
 
-static const char * const mmcc_pxo_pll8_pll2_pll3[] = {
-	"pxo",
-	"pll8_vote",
-	"pll2",
-	"pll3",
+static const struct clk_parent_data mmcc_pxo_pll8_pll2_pll3[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
+	{ .fw_name = "pll8_vote", .name = "pll8_vote" },
+	{ .hw = &pll2.clkr.hw },
+	{ .fw_name = "pll3", .name = "pll3" },
 };
 
 static const struct parent_map mmcc_pxo_dsi2_dsi1_map[] = {
@@ -133,10 +137,10 @@ static const struct parent_map mmcc_pxo_dsi2_dsi1_map[] = {
 	{ P_DSI1_PLL_DSICLK, 3 },
 };
 
-static const char * const mmcc_pxo_dsi2_dsi1[] = {
-	"pxo",
-	"dsi2pll",
-	"dsi1pll",
+static const struct clk_parent_data mmcc_pxo_dsi2_dsi1[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
+	{ .fw_name = "dsi2pll", .name = "dsi2pll" },
+	{ .fw_name = "dsi1pll", .name = "dsi1pll" },
 };
 
 static const struct parent_map mmcc_pxo_dsi1_dsi2_byte_map[] = {
@@ -145,10 +149,10 @@ static const struct parent_map mmcc_pxo_dsi1_dsi2_byte_map[] = {
 	{ P_DSI2_PLL_BYTECLK, 2 },
 };
 
-static const char * const mmcc_pxo_dsi1_dsi2_byte[] = {
-	"pxo",
-	"dsi1pllbyte",
-	"dsi2pllbyte",
+static const struct clk_parent_data mmcc_pxo_dsi1_dsi2_byte[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
+	{ .fw_name = "dsi1pllbyte", .name = "dsi1pllbyte" },
+	{ .fw_name = "dsi2pllbyte", .name = "dsi2pllbyte" },
 };
 
 static struct freq_tbl clk_tbl_cam[] = {
@@ -192,7 +196,7 @@ static struct clk_rcg camclk0_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "camclk0_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
@@ -207,7 +211,9 @@ static struct clk_branch camclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camclk0_clk",
-			.parent_names = (const char *[]){ "camclk0_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&camclk0_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 		},
@@ -241,7 +247,7 @@ static struct clk_rcg camclk1_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "camclk1_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
@@ -256,7 +262,9 @@ static struct clk_branch camclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camclk1_clk",
-			.parent_names = (const char *[]){ "camclk1_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&camclk1_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 		},
@@ -290,7 +298,7 @@ static struct clk_rcg camclk2_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "camclk2_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
@@ -305,7 +313,9 @@ static struct clk_branch camclk2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camclk2_clk",
-			.parent_names = (const char *[]){ "camclk2_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&camclk2_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 		},
@@ -345,7 +355,7 @@ static struct clk_rcg csi0_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "csi0_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
@@ -359,7 +369,9 @@ static struct clk_branch csi0_clk = {
 		.enable_reg = 0x0040,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = (const char *[]){ "csi0_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_src.clkr.hw
+			},
 			.num_parents = 1,
 			.name = "csi0_clk",
 			.ops = &clk_branch_ops,
@@ -375,7 +387,9 @@ static struct clk_branch csi0_phy_clk = {
 		.enable_reg = 0x0040,
 		.enable_mask = BIT(8),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = (const char *[]){ "csi0_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_src.clkr.hw
+			},
 			.num_parents = 1,
 			.name = "csi0_phy_clk",
 			.ops = &clk_branch_ops,
@@ -409,7 +423,7 @@ static struct clk_rcg csi1_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "csi1_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
@@ -423,7 +437,9 @@ static struct clk_branch csi1_clk = {
 		.enable_reg = 0x0024,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = (const char *[]){ "csi1_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_src.clkr.hw
+			},
 			.num_parents = 1,
 			.name = "csi1_clk",
 			.ops = &clk_branch_ops,
@@ -439,7 +455,9 @@ static struct clk_branch csi1_phy_clk = {
 		.enable_reg = 0x0024,
 		.enable_mask = BIT(8),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = (const char *[]){ "csi1_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_src.clkr.hw
+			},
 			.num_parents = 1,
 			.name = "csi1_phy_clk",
 			.ops = &clk_branch_ops,
@@ -473,7 +491,7 @@ static struct clk_rcg csi2_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "csi2_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
@@ -487,7 +505,9 @@ static struct clk_branch csi2_clk = {
 		.enable_reg = 0x022c,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = (const char *[]){ "csi2_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi2_src.clkr.hw
+			},
 			.num_parents = 1,
 			.name = "csi2_clk",
 			.ops = &clk_branch_ops,
@@ -503,7 +523,9 @@ static struct clk_branch csi2_phy_clk = {
 		.enable_reg = 0x022c,
 		.enable_mask = BIT(8),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = (const char *[]){ "csi2_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi2_src.clkr.hw
+			},
 			.num_parents = 1,
 			.name = "csi2_phy_clk",
 			.ops = &clk_branch_ops,
@@ -602,10 +624,10 @@ static const struct clk_ops clk_ops_pix_rdi = {
 	.determine_rate = __clk_mux_determine_rate,
 };
 
-static const char * const pix_rdi_parents[] = {
-	"csi0_clk",
-	"csi1_clk",
-	"csi2_clk",
+static const struct clk_hw *pix_rdi_parents[] = {
+	&csi0_clk.clkr.hw,
+	&csi1_clk.clkr.hw,
+	&csi2_clk.clkr.hw,
 };
 
 static struct clk_pix_rdi csi_pix_clk = {
@@ -618,7 +640,7 @@ static struct clk_pix_rdi csi_pix_clk = {
 		.enable_mask = BIT(26),
 		.hw.init = &(struct clk_init_data){
 			.name = "csi_pix_clk",
-			.parent_names = pix_rdi_parents,
+			.parent_hws = pix_rdi_parents,
 			.num_parents = ARRAY_SIZE(pix_rdi_parents),
 			.ops = &clk_ops_pix_rdi,
 		},
@@ -635,7 +657,7 @@ static struct clk_pix_rdi csi_pix1_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "csi_pix1_clk",
-			.parent_names = pix_rdi_parents,
+			.parent_hws = pix_rdi_parents,
 			.num_parents = ARRAY_SIZE(pix_rdi_parents),
 			.ops = &clk_ops_pix_rdi,
 		},
@@ -652,7 +674,7 @@ static struct clk_pix_rdi csi_rdi_clk = {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "csi_rdi_clk",
-			.parent_names = pix_rdi_parents,
+			.parent_hws = pix_rdi_parents,
 			.num_parents = ARRAY_SIZE(pix_rdi_parents),
 			.ops = &clk_ops_pix_rdi,
 		},
@@ -669,7 +691,7 @@ static struct clk_pix_rdi csi_rdi1_clk = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "csi_rdi1_clk",
-			.parent_names = pix_rdi_parents,
+			.parent_hws = pix_rdi_parents,
 			.num_parents = ARRAY_SIZE(pix_rdi_parents),
 			.ops = &clk_ops_pix_rdi,
 		},
@@ -686,7 +708,7 @@ static struct clk_pix_rdi csi_rdi2_clk = {
 		.enable_mask = BIT(6),
 		.hw.init = &(struct clk_init_data){
 			.name = "csi_rdi2_clk",
-			.parent_names = pix_rdi_parents,
+			.parent_hws = pix_rdi_parents,
 			.num_parents = ARRAY_SIZE(pix_rdi_parents),
 			.ops = &clk_ops_pix_rdi,
 		},
@@ -725,15 +747,13 @@ static struct clk_rcg csiphytimer_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "csiphytimer_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
 	},
 };
 
-static const char * const csixphy_timer_src[] = { "csiphytimer_src" };
-
 static struct clk_branch csiphy0_timer_clk = {
 	.halt_reg = 0x01e8,
 	.halt_bit = 17,
@@ -741,8 +761,10 @@ static struct clk_branch csiphy0_timer_clk = {
 		.enable_reg = 0x0160,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = csixphy_timer_src,
-			.num_parents = ARRAY_SIZE(csixphy_timer_src),
+			.parent_hws = (const struct clk_hw*[]){
+				&csiphytimer_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.name = "csiphy0_timer_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -757,8 +779,10 @@ static struct clk_branch csiphy1_timer_clk = {
 		.enable_reg = 0x0160,
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = csixphy_timer_src,
-			.num_parents = ARRAY_SIZE(csixphy_timer_src),
+			.parent_hws = (const struct clk_hw*[]){
+				&csiphytimer_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.name = "csiphy1_timer_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -773,8 +797,10 @@ static struct clk_branch csiphy2_timer_clk = {
 		.enable_reg = 0x0160,
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = csixphy_timer_src,
-			.num_parents = ARRAY_SIZE(csixphy_timer_src),
+			.parent_hws = (const struct clk_hw*[]){
+				&csiphytimer_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.name = "csiphy2_timer_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -835,7 +861,7 @@ static struct clk_dyn_rcg gfx2d0_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx2d0_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_dyn_rcg_ops,
 		},
@@ -850,7 +876,9 @@ static struct clk_branch gfx2d0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx2d0_clk",
-			.parent_names = (const char *[]){ "gfx2d0_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx2d0_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -895,7 +923,7 @@ static struct clk_dyn_rcg gfx2d1_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx2d1_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_dyn_rcg_ops,
 		},
@@ -910,7 +938,9 @@ static struct clk_branch gfx2d1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx2d1_clk",
-			.parent_names = (const char *[]){ "gfx2d1_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx2d1_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -996,7 +1026,7 @@ static struct clk_dyn_rcg gfx3d_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx3d_src",
-			.parent_names = mmcc_pxo_pll8_pll2_pll3,
+			.parent_data = mmcc_pxo_pll8_pll2_pll3,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2_pll3),
 			.ops = &clk_dyn_rcg_ops,
 		},
@@ -1005,7 +1035,7 @@ static struct clk_dyn_rcg gfx3d_src = {
 
 static const struct clk_init_data gfx3d_8064_init = {
 	.name = "gfx3d_src",
-	.parent_names = mmcc_pxo_pll8_pll2_pll15,
+	.parent_data = mmcc_pxo_pll8_pll2_pll15,
 	.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2_pll15),
 	.ops = &clk_dyn_rcg_ops,
 };
@@ -1018,7 +1048,9 @@ static struct clk_branch gfx3d_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx3d_clk",
-			.parent_names = (const char *[]){ "gfx3d_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx3d_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1074,7 +1106,7 @@ static struct clk_dyn_rcg vcap_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "vcap_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_dyn_rcg_ops,
 		},
@@ -1089,7 +1121,9 @@ static struct clk_branch vcap_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vcap_clk",
-			.parent_names = (const char *[]){ "vcap_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vcap_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1105,7 +1139,9 @@ static struct clk_branch vcap_npl_clk = {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "vcap_npl_clk",
-			.parent_names = (const char *[]){ "vcap_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vcap_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1153,7 +1189,7 @@ static struct clk_rcg ijpeg_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "ijpeg_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
@@ -1168,7 +1204,9 @@ static struct clk_branch ijpeg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "ijpeg_clk",
-			.parent_names = (const char *[]){ "ijpeg_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ijpeg_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1201,7 +1239,7 @@ static struct clk_rcg jpegd_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "jpegd_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
@@ -1216,7 +1254,9 @@ static struct clk_branch jpegd_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "jpegd_clk",
-			.parent_names = (const char *[]){ "jpegd_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&jpegd_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1281,7 +1321,7 @@ static struct clk_dyn_rcg mdp_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdp_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_dyn_rcg_ops,
 		},
@@ -1296,7 +1336,9 @@ static struct clk_branch mdp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdp_clk",
-			.parent_names = (const char *[]){ "mdp_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&mdp_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1311,7 +1353,9 @@ static struct clk_branch mdp_lut_clk = {
 		.enable_reg = 0x016c,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = (const char *[]){ "mdp_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&mdp_src.clkr.hw
+			},
 			.num_parents = 1,
 			.name = "mdp_lut_clk",
 			.ops = &clk_branch_ops,
@@ -1328,7 +1372,9 @@ static struct clk_branch mdp_vsync_clk = {
 		.enable_mask = BIT(6),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdp_vsync_clk",
-			.parent_names = (const char *[]){ "pxo" },
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "pxo", .name = "pxo_board" },
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops
 		},
@@ -1380,7 +1426,7 @@ static struct clk_dyn_rcg rot_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "rot_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_dyn_rcg_ops,
 		},
@@ -1395,7 +1441,9 @@ static struct clk_branch rot_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "rot_clk",
-			.parent_names = (const char *[]){ "rot_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&rot_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1408,9 +1456,9 @@ static const struct parent_map mmcc_pxo_hdmi_map[] = {
 	{ P_HDMI_PLL, 3 }
 };
 
-static const char * const mmcc_pxo_hdmi[] = {
-	"pxo",
-	"hdmi_pll",
+static const struct clk_parent_data mmcc_pxo_hdmi[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
+	{ .fw_name = "hdmipll", .name = "hdmi_pll" },
 };
 
 static struct freq_tbl clk_tbl_tv[] = {
@@ -1443,7 +1491,7 @@ static struct clk_rcg tv_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "tv_src",
-			.parent_names = mmcc_pxo_hdmi,
+			.parent_data = mmcc_pxo_hdmi,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_hdmi),
 			.ops = &clk_rcg_bypass_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1451,8 +1499,6 @@ static struct clk_rcg tv_src = {
 	},
 };
 
-static const char * const tv_src_name[] = { "tv_src" };
-
 static struct clk_branch tv_enc_clk = {
 	.halt_reg = 0x01d4,
 	.halt_bit = 9,
@@ -1460,8 +1506,10 @@ static struct clk_branch tv_enc_clk = {
 		.enable_reg = 0x00ec,
 		.enable_mask = BIT(8),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = tv_src_name,
-			.num_parents = ARRAY_SIZE(tv_src_name),
+			.parent_hws = (const struct clk_hw*[]){
+				&tv_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.name = "tv_enc_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1476,8 +1524,10 @@ static struct clk_branch tv_dac_clk = {
 		.enable_reg = 0x00ec,
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = tv_src_name,
-			.num_parents = ARRAY_SIZE(tv_src_name),
+			.parent_hws = (const struct clk_hw*[]){
+				&tv_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.name = "tv_dac_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1492,8 +1542,10 @@ static struct clk_branch mdp_tv_clk = {
 		.enable_reg = 0x00ec,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = tv_src_name,
-			.num_parents = ARRAY_SIZE(tv_src_name),
+			.parent_hws = (const struct clk_hw*[]){
+				&tv_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.name = "mdp_tv_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1508,8 +1560,10 @@ static struct clk_branch hdmi_tv_clk = {
 		.enable_reg = 0x00ec,
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = tv_src_name,
-			.num_parents = ARRAY_SIZE(tv_src_name),
+			.parent_hws = (const struct clk_hw*[]){
+				&tv_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.name = "hdmi_tv_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1524,8 +1578,10 @@ static struct clk_branch rgb_tv_clk = {
 		.enable_reg = 0x0124,
 		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = tv_src_name,
-			.num_parents = ARRAY_SIZE(tv_src_name),
+			.parent_hws = (const struct clk_hw*[]){
+				&tv_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.name = "rgb_tv_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1540,8 +1596,10 @@ static struct clk_branch npl_tv_clk = {
 		.enable_reg = 0x0124,
 		.enable_mask = BIT(16),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = tv_src_name,
-			.num_parents = ARRAY_SIZE(tv_src_name),
+			.parent_hws = (const struct clk_hw*[]){
+				&tv_src.clkr.hw,
+			},
+			.num_parents = 1,
 			.name = "npl_tv_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1556,7 +1614,9 @@ static struct clk_branch hdmi_app_clk = {
 		.enable_reg = 0x005c,
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = (const char *[]){ "pxo" },
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "pxo", .name = "pxo_board" },
+			},
 			.num_parents = 1,
 			.name = "hdmi_app_clk",
 			.ops = &clk_branch_ops,
@@ -1614,7 +1674,7 @@ static struct clk_dyn_rcg vcodec_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "vcodec_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_dyn_rcg_ops,
 		},
@@ -1629,7 +1689,9 @@ static struct clk_branch vcodec_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vcodec_clk",
-			.parent_names = (const char *[]){ "vcodec_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vcodec_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1665,7 +1727,7 @@ static struct clk_rcg vpe_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "vpe_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
@@ -1680,7 +1742,9 @@ static struct clk_branch vpe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vpe_clk",
-			.parent_names = (const char *[]){ "vpe_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vpe_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1733,7 +1797,7 @@ static struct clk_rcg vfe_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "vfe_src",
-			.parent_names = mmcc_pxo_pll8_pll2,
+			.parent_data = mmcc_pxo_pll8_pll2,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
@@ -1748,7 +1812,9 @@ static struct clk_branch vfe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vfe_clk",
-			.parent_names = (const char *[]){ "vfe_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1763,7 +1829,9 @@ static struct clk_branch vfe_csi_clk = {
 		.enable_reg = 0x0104,
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = (const char *[]){ "vfe_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe_src.clkr.hw
+			},
 			.num_parents = 1,
 			.name = "vfe_csi_clk",
 			.ops = &clk_branch_ops,
@@ -2067,7 +2135,7 @@ static struct clk_rcg dsi1_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi1_src",
-			.parent_names = mmcc_pxo_dsi2_dsi1,
+			.parent_data = mmcc_pxo_dsi2_dsi1,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi2_dsi1),
 			.ops = &clk_rcg_bypass2_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2083,7 +2151,9 @@ static struct clk_branch dsi1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi1_clk",
-			.parent_names = (const char *[]){ "dsi1_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&dsi1_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2115,7 +2185,7 @@ static struct clk_rcg dsi2_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_src",
-			.parent_names = mmcc_pxo_dsi2_dsi1,
+			.parent_data = mmcc_pxo_dsi2_dsi1,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi2_dsi1),
 			.ops = &clk_rcg_bypass2_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2131,7 +2201,9 @@ static struct clk_branch dsi2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_clk",
-			.parent_names = (const char *[]){ "dsi2_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&dsi2_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2154,7 +2226,7 @@ static struct clk_rcg dsi1_byte_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi1_byte_src",
-			.parent_names = mmcc_pxo_dsi1_dsi2_byte,
+			.parent_data = mmcc_pxo_dsi1_dsi2_byte,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi1_dsi2_byte),
 			.ops = &clk_rcg_bypass2_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2170,7 +2242,9 @@ static struct clk_branch dsi1_byte_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi1_byte_clk",
-			.parent_names = (const char *[]){ "dsi1_byte_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&dsi1_byte_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2193,7 +2267,7 @@ static struct clk_rcg dsi2_byte_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_byte_src",
-			.parent_names = mmcc_pxo_dsi1_dsi2_byte,
+			.parent_data = mmcc_pxo_dsi1_dsi2_byte,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi1_dsi2_byte),
 			.ops = &clk_rcg_bypass2_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2209,7 +2283,9 @@ static struct clk_branch dsi2_byte_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_byte_clk",
-			.parent_names = (const char *[]){ "dsi2_byte_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&dsi2_byte_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2232,7 +2308,7 @@ static struct clk_rcg dsi1_esc_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi1_esc_src",
-			.parent_names = mmcc_pxo_dsi1_dsi2_byte,
+			.parent_data = mmcc_pxo_dsi1_dsi2_byte,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi1_dsi2_byte),
 			.ops = &clk_rcg_esc_ops,
 		},
@@ -2247,7 +2323,9 @@ static struct clk_branch dsi1_esc_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi1_esc_clk",
-			.parent_names = (const char *[]){ "dsi1_esc_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&dsi1_esc_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2270,7 +2348,7 @@ static struct clk_rcg dsi2_esc_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_esc_src",
-			.parent_names = mmcc_pxo_dsi1_dsi2_byte,
+			.parent_data = mmcc_pxo_dsi1_dsi2_byte,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi1_dsi2_byte),
 			.ops = &clk_rcg_esc_ops,
 		},
@@ -2285,7 +2363,9 @@ static struct clk_branch dsi2_esc_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_esc_clk",
-			.parent_names = (const char *[]){ "dsi2_esc_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&dsi2_esc_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2317,7 +2397,7 @@ static struct clk_rcg dsi1_pixel_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi1_pixel_src",
-			.parent_names = mmcc_pxo_dsi2_dsi1,
+			.parent_data = mmcc_pxo_dsi2_dsi1,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi2_dsi1),
 			.ops = &clk_rcg_pixel_ops,
 		},
@@ -2332,7 +2412,9 @@ static struct clk_branch dsi1_pixel_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdp_pclk1_clk",
-			.parent_names = (const char *[]){ "dsi1_pixel_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&dsi1_pixel_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2364,7 +2446,7 @@ static struct clk_rcg dsi2_pixel_src = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_pixel_src",
-			.parent_names = mmcc_pxo_dsi2_dsi1,
+			.parent_data = mmcc_pxo_dsi2_dsi1,
 			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi2_dsi1),
 			.ops = &clk_rcg_pixel_ops,
 		},
@@ -2379,7 +2461,9 @@ static struct clk_branch dsi2_pixel_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdp_pclk2_clk",
-			.parent_names = (const char *[]){ "dsi2_pixel_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&dsi2_pixel_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.35.1

