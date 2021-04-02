Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328D735319F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Apr 2021 01:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235815AbhDBXjw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 19:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235598AbhDBXjv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 19:39:51 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367DFC0617A7
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 16:39:49 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s17so6970099ljc.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 16:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=epUG791kYYEEIxxSnaozCbMNGthNGyMeAQN6qH5t06E=;
        b=lpCujS5MoF34mW2Kx8seCB9lseYo9WeAgn/Vb04MdzuU9oCbrlMVgwClDWXGsfnOL+
         gtwMQF2TuHTZ41tgJeIme3xrHx0sqg3vH/EsIQOOW+xGORQdcayWa3VQAY+WEIwCZgGZ
         oJFtAggPYnMqiuNPdDUMfyD/JInQR0ZcCyRqMTPexnswOKSalDyNLUpB83gmgptDUMXY
         mefx2KYE2NVUMIT60A3xidPzGJtJKLgDEGUW9jAu7tQ4pmQXe5/WTLHJ94DQaeRzGCRn
         kZvZQ/bNLKAx55PyDB4OGfWb3CQ6hxM7gVFlg0W+T2NltbRDtCpgytbf+JTwxwRwdNtK
         qyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=epUG791kYYEEIxxSnaozCbMNGthNGyMeAQN6qH5t06E=;
        b=LED81Oof89pJSEFcwx8Pa2mVFEAKKmrS5yW24Cr4SZOcyNVWSpOXJ8Auvvv/RDicCP
         nG2DliSVuO/BWZqfMYZTUbY8vkar91lcIiZ77g4xQqi/U92sjFUCzqSOSclNn7q1UX5N
         KshcRBr9TyQeOrEZyhdjs0hMnLWx+A3NKr7KQdyp/vAmDvjP1ARzRct1Sye3wftDhIxc
         F+n44AqeL/Mu1AAiWJ8+FWIpg40W0BnEECUNJ4qJAsa0rcX8nW1p/rkTuQ+bc0yci0K9
         GAQ16UDbHj410vGpaTgzbXGZQp8Qw71vM055T4vr8fseIE+f7jCjVkkYEDk3s6Yefp2d
         laHg==
X-Gm-Message-State: AOAM532HiK6u4R1pgf951difMnm9lTXqY1ko3BcXUlP5bUrwWntGEgxC
        uOQjGdjSiTXpI/XYxgiKqGW/+w==
X-Google-Smtp-Source: ABdhPJznUO8fBKwP7s8lOoHdbHGngatkiZzBPyyLgmCIfUR+FYEDEe6dhRyIrQNoT1hAbdPv5hHUHg==
X-Received: by 2002:a2e:8ed4:: with SMTP id e20mr9325624ljl.129.1617406787578;
        Fri, 02 Apr 2021 16:39:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w30sm1013134lfq.210.2021.04.02.16.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 16:39:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v1 3/4] clk: qcom: gcc-sdm845: get rid of the test clock
Date:   Sat,  3 Apr 2021 02:39:43 +0300
Message-Id: <20210402233944.273275-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402233944.273275-1-dmitry.baryshkov@linaro.org>
References: <20210402233944.273275-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sdm845.c | 99 +++++++++++++++--------------------
 1 file changed, 42 insertions(+), 57 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 74800ed3c34a..61ef32622818 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -28,7 +28,6 @@
 enum {
 	P_BI_TCXO,
 	P_AUD_REF_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_EVEN,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL4_OUT_MAIN,
@@ -98,14 +97,12 @@ static const struct parent_map gcc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
@@ -113,7 +110,6 @@ static const struct parent_map gcc_parent_map_1[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_SLEEP_CLK, 5 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_1[] = {
@@ -121,41 +117,34 @@ static const struct clk_parent_data gcc_parent_data_1[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "sleep_clk", .name = "core_pi_sleep_clk" },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_SLEEP_CLK, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_2[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .fw_name = "sleep_clk", .name = "core_pi_sleep_clk" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_3[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_3[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .hw = &gpll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_6[] = {
@@ -163,7 +152,6 @@ static const struct parent_map gcc_parent_map_6[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_AUD_REF_CLK, 2 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_6[] = {
@@ -171,7 +159,6 @@ static const struct clk_parent_data gcc_parent_data_6[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "aud_ref_clk", .name = "aud_ref_clk" },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct clk_parent_data gcc_parent_data_7_ao[] = {
@@ -198,7 +185,6 @@ static const struct parent_map gcc_parent_map_10[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL4_OUT_MAIN, 5 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_10[] = {
@@ -206,7 +192,6 @@ static const struct clk_parent_data gcc_parent_data_10[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 
@@ -266,7 +251,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parent_data_1,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -280,7 +265,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parent_data_1,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -294,7 +279,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parent_data_1,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -314,7 +299,7 @@ static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_0_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 3,
+		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -328,7 +313,7 @@ static struct clk_rcg2 gcc_pcie_1_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_1_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 3,
+		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -348,7 +333,7 @@ static struct clk_rcg2 gcc_pcie_phy_refgen_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_phy_refgen_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -370,7 +355,7 @@ static struct clk_rcg2 gcc_qspi_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qspi_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -391,7 +376,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pdm2_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -418,7 +403,7 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
 static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s0_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -434,7 +419,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s1_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -450,7 +435,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s2_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -466,7 +451,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s3_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -482,7 +467,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s4_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -498,7 +483,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s5_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -514,7 +499,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s6_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -530,7 +515,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s7_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -546,7 +531,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s0_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -562,7 +547,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s1_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -578,7 +563,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s2_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -594,7 +579,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s3_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -610,7 +595,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s4_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -626,7 +611,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s5_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -642,7 +627,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s6_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -658,7 +643,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s7_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = 3,
 	.ops = &clk_rcg2_shared_ops,
 };
 
@@ -691,7 +676,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_10,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -715,7 +700,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc4_apps_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -734,7 +719,7 @@ static struct clk_rcg2 gcc_tsif_ref_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_tsif_ref_clk_src",
 		.parent_data = gcc_parent_data_6,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -757,7 +742,7 @@ static struct clk_rcg2 gcc_ufs_card_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_axi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -779,7 +764,7 @@ static struct clk_rcg2 gcc_ufs_card_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -793,7 +778,7 @@ static struct clk_rcg2 gcc_ufs_card_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_4,
-		.num_parents = 2,
+		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -814,7 +799,7 @@ static struct clk_rcg2 gcc_ufs_card_unipro_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_unipro_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -837,7 +822,7 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_axi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -851,7 +836,7 @@ static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -865,7 +850,7 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_4,
-		.num_parents = 2,
+		.num_parents = 1,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -879,7 +864,7 @@ static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_unipro_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -902,7 +887,7 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_master_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -924,7 +909,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_mock_utmi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -938,7 +923,7 @@ static struct clk_rcg2 gcc_usb30_sec_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_sec_master_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -952,7 +937,7 @@ static struct clk_rcg2 gcc_usb30_sec_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_sec_mock_utmi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -966,7 +951,7 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_prim_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 3,
+		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -980,7 +965,7 @@ static struct clk_rcg2 gcc_usb3_sec_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_sec_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 3,
+		.num_parents = 2,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -994,7 +979,7 @@ static struct clk_rcg2 gcc_vs_ctrl_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_vs_ctrl_clk_src",
 		.parent_data = gcc_parent_data_3,
-		.num_parents = 3,
+		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.30.2

