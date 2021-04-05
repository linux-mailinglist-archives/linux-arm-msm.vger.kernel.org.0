Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56503548EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242896AbhDEWsR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242887AbhDEWsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:15 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3BFC0617AB
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:48:08 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id o16so14273844ljp.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z95NmUuR2KS6FIzDvpHEHaBdCuC6i94rrTVy1bjoCjw=;
        b=uAyhJd0IE79LkigJbtBgdo8qJ0w3Y2eSYRMngm8phZ/86NzO6EEE0dowLd+J5wDbOd
         Mrs4TLwDrOUWAAsSGqsJMAAYMg5c9hi7WcmB/06miVWpKM7BHajQ24w09QOI+6LQ9PUj
         hy9HblJ2eeRpN/Y/By/DR82mNPF600sqdYvCFHrxzhqBDqTKywCyOXWoZRthruw88wzy
         Xmd59m/bCypqhoe/xtFgWUYNNlSyVkgkeSMbLAEme8dAQvQJjmqYK3zdYXq3ewq+YlIG
         OTyBlVT/iHduFoFN0ToIsar1Qika2iY6J9lE/HReel2igQ4F/wN9+uPN9CDa+P5uNuAm
         6Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z95NmUuR2KS6FIzDvpHEHaBdCuC6i94rrTVy1bjoCjw=;
        b=KFmSv5LF9qPWzgGCAiWozW8+Fzl0oXy4zLqnOw859XaAMp8EFnNf4KibW7XF5DzR9H
         XnZ/IHqS/IB+FxrgYShXmvowqMH6WPnBxuEgicGN2v0CjVhmXDcyRTbHgX466/YlyG7s
         NZKsxtkiRCbZx0qRC55OOjg1SQGMisUMd/zX2xf02gsvktac+4NwBwq6qS4NSrjeVwaI
         3UBWjeYpe7oTgdFjpYBJSghqmJII1FCMPkvwspDTRKDQtuAfDp5dHXZtOPVIvSPUI5IW
         PXXmvCZfI3Zo0dT6lgJwMctmUssrW93imElJJ4pIA2tqyHFDDcsp3KmMr4DLlhm9rDlE
         LNGA==
X-Gm-Message-State: AOAM530IWMqN7NaJegbo3oJyHu9po+Q4e+DSFs32gTopAYfiA3zsB/r0
        kSkyX2czzOT5oFep5WNXLGTC3g==
X-Google-Smtp-Source: ABdhPJxP1Wd1Pmp4yYah8Fy0mtZ7bIL0OyMKY7gGTzgmGSZNJJUqVIoVV0fAvdAv1D2xzHd2Cqg2vQ==
X-Received: by 2002:a2e:b7c1:: with SMTP id p1mr17143932ljo.198.1617662886508;
        Mon, 05 Apr 2021 15:48:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 30/33] clk: qcom: gcc-sc8180x: use ARRAY_SIZE instead of specifying num_parents
Date:   Tue,  6 Apr 2021 01:47:40 +0300
Message-Id: <20210405224743.590029-31-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sc8180x.c | 122 ++++++++++++++++-----------------
 1 file changed, 61 insertions(+), 61 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 90525ae1bb3a..c41b9f010585 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -277,7 +277,7 @@ static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_cpuss_ahb_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -300,7 +300,7 @@ static struct clk_rcg2 gcc_emac_ptp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_emac_ptp_clk_src",
 		.parent_data = gcc_parents_6,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_6),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -326,7 +326,7 @@ static struct clk_rcg2 gcc_emac_rgmii_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_emac_rgmii_clk_src",
 		.parent_data = gcc_parents_6,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_6),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -350,7 +350,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parents_1,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -365,7 +365,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parents_1,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -380,7 +380,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parents_1,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -395,7 +395,7 @@ static struct clk_rcg2 gcc_gp4_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp4_clk_src",
 		.parent_data = gcc_parents_1,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -410,7 +410,7 @@ static struct clk_rcg2 gcc_gp5_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp5_clk_src",
 		.parent_data = gcc_parents_1,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -436,7 +436,7 @@ static struct clk_rcg2 gcc_npu_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_npu_axi_clk_src",
 		.parent_data = gcc_parents_3,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -457,7 +457,7 @@ static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_0_aux_clk_src",
 		.parent_data = gcc_parents_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parents_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -472,7 +472,7 @@ static struct clk_rcg2 gcc_pcie_1_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_1_aux_clk_src",
 		.parent_data = gcc_parents_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parents_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -487,7 +487,7 @@ static struct clk_rcg2 gcc_pcie_2_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_2_aux_clk_src",
 		.parent_data = gcc_parents_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parents_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -502,7 +502,7 @@ static struct clk_rcg2 gcc_pcie_3_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_3_aux_clk_src",
 		.parent_data = gcc_parents_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parents_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -523,7 +523,7 @@ static struct clk_rcg2 gcc_pcie_phy_refgen_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_phy_refgen_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -545,7 +545,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pdm2_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -568,7 +568,7 @@ static struct clk_rcg2 gcc_qspi_1_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qspi_1_core_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -583,7 +583,7 @@ static struct clk_rcg2 gcc_qspi_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qspi_core_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -619,7 +619,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap0_s0_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -634,7 +634,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap0_s1_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -649,7 +649,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap0_s2_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -664,7 +664,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap0_s3_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -679,7 +679,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap0_s4_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -694,7 +694,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap0_s5_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -709,7 +709,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap0_s6_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -724,7 +724,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap0_s7_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -739,7 +739,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap1_s0_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -754,7 +754,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap1_s1_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -769,7 +769,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap1_s2_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -784,7 +784,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap1_s3_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -799,7 +799,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap1_s4_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -814,7 +814,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap1_s5_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -829,7 +829,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap2_s0_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -844,7 +844,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap2_s1_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -859,7 +859,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap2_s2_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -874,7 +874,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap2_s3_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -889,7 +889,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap2_s4_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -904,7 +904,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s5_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qupv3_wrap2_s5_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -930,7 +930,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parents_7,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parents_7),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -955,7 +955,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc4_apps_clk_src",
 		.parent_data = gcc_parents_5,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_5),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -975,7 +975,7 @@ static struct clk_rcg2 gcc_tsif_ref_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_tsif_ref_clk_src",
 		.parent_data = gcc_parents_8,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_8),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -998,7 +998,7 @@ static struct clk_rcg2 gcc_ufs_card_2_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_2_axi_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1013,7 +1013,7 @@ static struct clk_rcg2 gcc_ufs_card_2_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_2_ice_core_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1033,7 +1033,7 @@ static struct clk_rcg2 gcc_ufs_card_2_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_2_phy_aux_clk_src",
 		.parent_data = gcc_parents_4,
-		.num_parents = 1,
+		.num_parents = ARRAY_SIZE(gcc_parents_4),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1048,7 +1048,7 @@ static struct clk_rcg2 gcc_ufs_card_2_unipro_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_2_unipro_core_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1072,7 +1072,7 @@ static struct clk_rcg2 gcc_ufs_card_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_axi_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1094,7 +1094,7 @@ static struct clk_rcg2 gcc_ufs_card_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_ice_core_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1109,7 +1109,7 @@ static struct clk_rcg2 gcc_ufs_card_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_phy_aux_clk_src",
 		.parent_data = gcc_parents_4,
-		.num_parents = 1,
+		.num_parents = ARRAY_SIZE(gcc_parents_4),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1131,7 +1131,7 @@ static struct clk_rcg2 gcc_ufs_card_unipro_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_unipro_core_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1155,7 +1155,7 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_axi_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1170,7 +1170,7 @@ static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_ice_core_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1185,7 +1185,7 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_phy_aux_clk_src",
 		.parent_data = gcc_parents_4,
-		.num_parents = 1,
+		.num_parents = ARRAY_SIZE(gcc_parents_4),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1200,7 +1200,7 @@ static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_unipro_core_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1224,7 +1224,7 @@ static struct clk_rcg2 gcc_usb30_mp_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_mp_master_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1247,7 +1247,7 @@ static struct clk_rcg2 gcc_usb30_mp_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_mp_mock_utmi_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1262,7 +1262,7 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_master_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1277,7 +1277,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_mock_utmi_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1292,7 +1292,7 @@ static struct clk_rcg2 gcc_usb30_sec_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_sec_master_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1307,7 +1307,7 @@ static struct clk_rcg2 gcc_usb30_sec_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_sec_mock_utmi_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1322,7 +1322,7 @@ static struct clk_rcg2 gcc_usb3_mp_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_mp_phy_aux_clk_src",
 		.parent_data = gcc_parents_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parents_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1337,7 +1337,7 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_prim_phy_aux_clk_src",
 		.parent_data = gcc_parents_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parents_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1352,7 +1352,7 @@ static struct clk_rcg2 gcc_usb3_sec_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_sec_phy_aux_clk_src",
 		.parent_data = gcc_parents_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parents_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
-- 
2.30.2

