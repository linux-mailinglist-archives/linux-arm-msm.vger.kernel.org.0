Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64A3A5579C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 14:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbiFWME1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 08:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbiFWME0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:04:26 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CBB488B9
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:23 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y32so32970526lfa.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gdP9CJH7RxrDJbJ3aC/127OzAOgW3yLRRayvoCqdrNA=;
        b=R1CZ6pvPH1ojBxabn3YYwGDCnwCGWqBC9efsi1bRJkbBXiUC3PrEdeqYfgpEQZSFfO
         cQJlEkj4lR1x2Cl9j1LKOtLR8z3BZoO61cbvV3uM6TPsA1suM7cVgC6s0EC9IbiQ7Gef
         tV8GHB/jKGIqqY7glS3f8pCvlrD5w3br9guxiT3gALdtpWRw26WdU01GLd7r8xAZiVKk
         TOWGgrOFcbEoTocyibSE4PiToBlSRFgZs9fVvTivePKLaH+p7EGPwk47Cb2QiMVMBWeK
         IQueSNepQKSwmxWb9k9zXqTTr6m84yucp+h8WO525bKygIV5OmnuSlbect3F7SblEMCs
         pJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gdP9CJH7RxrDJbJ3aC/127OzAOgW3yLRRayvoCqdrNA=;
        b=eNlgT27ISQhJTO+9sRRyPxFweHpRPj3A/AICMcUbk/0Rb6YpZojKTqnyQ78g7AXW78
         hNr0WfYoLRghY/1G7rNgbYrgB5jrgG1npvo9zEIVNdoEM1y/qHHjTVr4MvjaPcMRGt6r
         GYxBg+CnUd8B/aLhJu69b+CvRIU3kpk9f8K4TwEHGyUQBLLZNaVhiH/eBU9UrwRym5qW
         FDtx7j+cbcrPeOr9W6ld97fREiGkrWf19YWWQujW5aLZcOotOydslHq45Y3t+WIADpaf
         LKT6iLFiKSFJT51qwmpyYx7nCdnbamJKY7nfJutoavEdMMwS3xu7ENinkZstV/S+5UEd
         LJIg==
X-Gm-Message-State: AJIora83cVT7APDhbPEdod6fys+e7f/1Kn16ukPNL57PE39MudgHXljN
        Wr9RRZbE6AwCDHLnG6i2+25rSg==
X-Google-Smtp-Source: AGRyM1u8JcEhvSorV+lIE5XDnPy70m/VkntPGziLhooM7PujgxP9emfPuYCB0KSO580pkxwNfmgNSw==
X-Received: by 2002:a05:6512:acc:b0:47f:769e:6aef with SMTP id n12-20020a0565120acc00b0047f769e6aefmr5242524lfu.26.1655985861974;
        Thu, 23 Jun 2022 05:04:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:21 -0700 (PDT)
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
Subject: [PATCH 03/15] clk: qcom: gcc-msm8960: use ARRAY_SIZE instead of specifying num_parents
Date:   Thu, 23 Jun 2022 15:04:06 +0300
Message-Id: <20220623120418.250589-4-dmitry.baryshkov@linaro.org>
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

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8960.c | 96 +++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index a6e13b91e4c8..cf1bccab2fa5 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -349,7 +349,7 @@ static struct clk_rcg gsbi1_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -400,7 +400,7 @@ static struct clk_rcg gsbi2_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -451,7 +451,7 @@ static struct clk_rcg gsbi3_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -502,7 +502,7 @@ static struct clk_rcg gsbi4_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -553,7 +553,7 @@ static struct clk_rcg gsbi5_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -604,7 +604,7 @@ static struct clk_rcg gsbi6_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -655,7 +655,7 @@ static struct clk_rcg gsbi7_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -706,7 +706,7 @@ static struct clk_rcg gsbi8_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi8_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -755,7 +755,7 @@ static struct clk_rcg gsbi9_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi9_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -804,7 +804,7 @@ static struct clk_rcg gsbi10_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi10_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -853,7 +853,7 @@ static struct clk_rcg gsbi11_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi11_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -902,7 +902,7 @@ static struct clk_rcg gsbi12_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi12_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -964,7 +964,7 @@ static struct clk_rcg gsbi1_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1013,7 +1013,7 @@ static struct clk_rcg gsbi2_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1062,7 +1062,7 @@ static struct clk_rcg gsbi3_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1111,7 +1111,7 @@ static struct clk_rcg gsbi4_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1160,7 +1160,7 @@ static struct clk_rcg gsbi5_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1209,7 +1209,7 @@ static struct clk_rcg gsbi6_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1258,7 +1258,7 @@ static struct clk_rcg gsbi7_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1307,7 +1307,7 @@ static struct clk_rcg gsbi8_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi8_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1356,7 +1356,7 @@ static struct clk_rcg gsbi9_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi9_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1405,7 +1405,7 @@ static struct clk_rcg gsbi10_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi10_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1454,7 +1454,7 @@ static struct clk_rcg gsbi11_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi11_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1503,7 +1503,7 @@ static struct clk_rcg gsbi12_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi12_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1565,7 +1565,7 @@ static struct clk_rcg gp0_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gp0_src",
 			.parent_names = gcc_pxo_pll8_cxo,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1614,7 +1614,7 @@ static struct clk_rcg gp1_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gp1_src",
 			.parent_names = gcc_pxo_pll8_cxo,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -1663,7 +1663,7 @@ static struct clk_rcg gp2_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gp2_src",
 			.parent_names = gcc_pxo_pll8_cxo,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -1715,7 +1715,7 @@ static struct clk_rcg prng_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "prng_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -1777,7 +1777,7 @@ static struct clk_rcg sdc1_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc1_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	}
@@ -1825,7 +1825,7 @@ static struct clk_rcg sdc2_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc2_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	}
@@ -1873,7 +1873,7 @@ static struct clk_rcg sdc3_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc3_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	}
@@ -1921,7 +1921,7 @@ static struct clk_rcg sdc4_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc4_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	}
@@ -1969,7 +1969,7 @@ static struct clk_rcg sdc5_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc5_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	}
@@ -2022,7 +2022,7 @@ static struct clk_rcg tsif_ref_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "tsif_ref_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -2076,7 +2076,7 @@ static struct clk_rcg usb_hs1_xcvr_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_xcvr_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -2125,7 +2125,7 @@ static struct clk_rcg usb_hs3_xcvr_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs3_xcvr_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -2174,7 +2174,7 @@ static struct clk_rcg usb_hs4_xcvr_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs4_xcvr_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -2223,7 +2223,7 @@ static struct clk_rcg usb_hsic_xcvr_fs_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_xcvr_fs_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -2241,7 +2241,7 @@ static struct clk_branch usb_hsic_xcvr_fs_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_xcvr_fs_clk",
 			.parent_names = usb_hsic_xcvr_fs_src_p,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(usb_hsic_xcvr_fs_src_p),
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -2256,7 +2256,7 @@ static struct clk_branch usb_hsic_system_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.parent_names = usb_hsic_xcvr_fs_src_p,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(usb_hsic_xcvr_fs_src_p),
 			.name = "usb_hsic_system_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2318,7 +2318,7 @@ static struct clk_rcg usb_fs1_xcvr_fs_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs1_xcvr_fs_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -2336,7 +2336,7 @@ static struct clk_branch usb_fs1_xcvr_fs_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs1_xcvr_fs_clk",
 			.parent_names = usb_fs1_xcvr_fs_src_p,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(usb_fs1_xcvr_fs_src_p),
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -2351,7 +2351,7 @@ static struct clk_branch usb_fs1_system_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.parent_names = usb_fs1_xcvr_fs_src_p,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(usb_fs1_xcvr_fs_src_p),
 			.name = "usb_fs1_system_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2385,7 +2385,7 @@ static struct clk_rcg usb_fs2_xcvr_fs_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs2_xcvr_fs_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -2403,7 +2403,7 @@ static struct clk_branch usb_fs2_xcvr_fs_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs2_xcvr_fs_clk",
 			.parent_names = usb_fs2_xcvr_fs_src_p,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(usb_fs2_xcvr_fs_src_p),
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -2419,7 +2419,7 @@ static struct clk_branch usb_fs2_system_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs2_system_clk",
 			.parent_names = usb_fs2_xcvr_fs_src_p,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(usb_fs2_xcvr_fs_src_p),
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -2873,7 +2873,7 @@ static struct clk_rcg ce3_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "ce3_src",
 			.parent_names = gcc_pxo_pll8_pll3,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_pll3),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -2935,7 +2935,7 @@ static struct clk_rcg sata_clk_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sata_clk_src",
 			.parent_names = gcc_pxo_pll8_pll3,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_pll3),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
-- 
2.35.1

