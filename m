Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652D8474FA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238691AbhLOAzC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238680AbhLOAzC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:55:02 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5330EC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:55:01 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id p8so30902420ljo.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8JXP9Vk3kkG5r29ivTxXE3u5HcYmRA0eQxva+MshCN8=;
        b=l4ZyilpFdjV7fYe8xBbQwvwzYCNzeIa1KCo6e/q+tOyUjrijPSPnc6hZnVzPDHvUhE
         PE+UnSLy3kvVB7m7wGBhq4WxdSUF4a4DcfGTZ0lFZBp/R3RM9QBe8XiRs2a7mkbQ7onG
         ij1tYET62kHtY6tOEzslHd45Bl9saGzKfX7FPN3JVyFlQufCDTt4UYOdInKzRZb0thbP
         atQXMXSV7cJYy6NbYRK1H3ZNTQQM1kijOowFLk225w0DIPjJrFgXNrouwAam4Wm94IOS
         JhhRO6UP38BOnBBHAsMpMVsiewErIlKGsmnlKDHUZeKR0ajco8Lsf3VrbmWMiJ5WJN26
         d+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8JXP9Vk3kkG5r29ivTxXE3u5HcYmRA0eQxva+MshCN8=;
        b=TEABLQPI+pqT32rU6hoI5H6z0KwJloR6iGiN7KeBsBg7Lmvm8387lYUxos5KudTS9u
         j1Jgd7d+U+/PI5ZH6QIc/dp7TcdEDkST/V/lB5DE5+VRWq8zl80JhfpQesmcV9WTdfui
         KxTZRpyp0o9j0s4TACERIMGXQaHcorWOFJyKXw3PCspemFAnM8jKwSftSuaVFJMEw4jV
         JK2Bv5KyK09T3pRqxiZaiUTuTMrdfQBSA0Jvj0ISXrNCKQWRYaeNVlwuBw1Vv2d2wiyr
         xTy2r6AmTh5E0He6fycpSx7JxNgWQJVKJLn0O/Xpy4qgUHEklGDYnm6QOj+gREChbBKQ
         hn0g==
X-Gm-Message-State: AOAM530PxXvXxrY/h3vlRskR90aZxqC02AcBfx/W0VNgef89nLQJggju
        DRkqCudehyx/7UqqlsVt6zcr8w==
X-Google-Smtp-Source: ABdhPJzkF7M6cz2AWI9k62WawCbP7K/2FRuwI8JB/Pi1kUGxli5oXwv4lk/6Guune059qDJU15K8RQ==
X-Received: by 2002:a2e:908b:: with SMTP id l11mr8080692ljg.208.1639529699452;
        Tue, 14 Dec 2021 16:54:59 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:54:58 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 10/15] clk: qcom: camcc-sdm845: convert to parent_hws/_data
Date:   Wed, 15 Dec 2021 03:54:18 +0300
Message-Id: <20211215005423.2114261-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the clock driver to specify parent hws/data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 238 +++++++++++++++++---------------
 1 file changed, 127 insertions(+), 111 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index bc2fb8453911..be3f95326965 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -31,7 +31,9 @@ static struct clk_alpha_pll cam_cc_pll0 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_pll0",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
@@ -53,7 +55,9 @@ static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll0_out_even",
-		.parent_names = (const char *[]){ "cam_cc_pll0" },
+		.parent_hws = (const struct clk_hw*[]){
+			&cam_cc_pll0.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -65,7 +69,9 @@ static struct clk_alpha_pll cam_cc_pll1 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_pll1",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
@@ -81,7 +87,9 @@ static struct clk_alpha_pll_postdiv cam_cc_pll1_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll1_out_even",
-		.parent_names = (const char *[]){ "cam_cc_pll1" },
+		.parent_hws = (const struct clk_hw*[]){
+			&cam_cc_pll1.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -93,7 +101,9 @@ static struct clk_alpha_pll cam_cc_pll2 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_pll2",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
@@ -109,7 +119,9 @@ static struct clk_alpha_pll_postdiv cam_cc_pll2_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll2_out_even",
-		.parent_names = (const char *[]){ "cam_cc_pll2" },
+		.parent_hws = (const struct clk_hw*[]){
+			&cam_cc_pll2.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -121,7 +133,9 @@ static struct clk_alpha_pll cam_cc_pll3 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_pll3",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
@@ -137,7 +151,9 @@ static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll3_out_even",
-		.parent_names = (const char *[]){ "cam_cc_pll3" },
+		.parent_hws = (const struct clk_hw*[]){
+			&cam_cc_pll3.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -186,7 +202,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
 	.freq_tbl = ftbl_cam_cc_bps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_bps_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
@@ -209,7 +225,7 @@ static struct clk_rcg2 cam_cc_cci_clk_src = {
 	.freq_tbl = ftbl_cam_cc_cci_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cci_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -229,7 +245,7 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
 	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cphy_rx_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -250,7 +266,7 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
 	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi0phytimer_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
@@ -265,7 +281,7 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
 	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi1phytimer_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
@@ -280,7 +296,7 @@ static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
 	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi2phytimer_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
@@ -295,7 +311,7 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
 	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi3phytimer_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
@@ -320,7 +336,7 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
 	.freq_tbl = ftbl_cam_cc_fast_ahb_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_fast_ahb_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -343,7 +359,7 @@ static struct clk_rcg2 cam_cc_fd_core_clk_src = {
 	.freq_tbl = ftbl_cam_cc_fd_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_fd_core_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -366,7 +382,7 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
 	.freq_tbl = ftbl_cam_cc_icp_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_icp_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -390,7 +406,7 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_0_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
@@ -413,7 +429,7 @@ static struct clk_rcg2 cam_cc_ife_0_csid_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_0_csid_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -427,7 +443,7 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_1_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
@@ -442,7 +458,7 @@ static struct clk_rcg2 cam_cc_ife_1_csid_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_1_csid_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -456,7 +472,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_lite_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
@@ -471,7 +487,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_lite_csid_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -496,7 +512,7 @@ static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ipe_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ipe_0_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
@@ -511,7 +527,7 @@ static struct clk_rcg2 cam_cc_ipe_1_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ipe_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ipe_1_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
@@ -526,7 +542,7 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
 	.freq_tbl = ftbl_cam_cc_bps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_jpeg_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
@@ -551,7 +567,7 @@ static struct clk_rcg2 cam_cc_lrme_clk_src = {
 	.freq_tbl = ftbl_cam_cc_lrme_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_lrme_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
@@ -574,7 +590,7 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
 	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk0_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
@@ -589,7 +605,7 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
 	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk1_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
@@ -604,7 +620,7 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
 	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk2_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
@@ -619,7 +635,7 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
 	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk3_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
@@ -643,7 +659,7 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
 	.freq_tbl = ftbl_cam_cc_slow_ahb_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_slow_ahb_clk_src",
-		.parent_names = cam_cc_parent_names_0,
+		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
@@ -658,8 +674,8 @@ static struct clk_branch cam_cc_bps_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_ahb_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_slow_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -676,8 +692,8 @@ static struct clk_branch cam_cc_bps_areg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_areg_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_fast_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -707,8 +723,8 @@ static struct clk_branch cam_cc_bps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_bps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_bps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -751,8 +767,8 @@ static struct clk_branch cam_cc_cci_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_cci_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cci_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cci_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -769,8 +785,8 @@ static struct clk_branch cam_cc_cpas_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_cpas_ahb_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_slow_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -787,8 +803,8 @@ static struct clk_branch cam_cc_csi0phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi0phytimer_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_csi0phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_csi0phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -805,8 +821,8 @@ static struct clk_branch cam_cc_csi1phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi1phytimer_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_csi1phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_csi1phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -823,8 +839,8 @@ static struct clk_branch cam_cc_csi2phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi2phytimer_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_csi2phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_csi2phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -841,8 +857,8 @@ static struct clk_branch cam_cc_csi3phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi3phytimer_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_csi3phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_csi3phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -859,8 +875,8 @@ static struct clk_branch cam_cc_csiphy0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy0_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -877,8 +893,8 @@ static struct clk_branch cam_cc_csiphy1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy1_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -895,8 +911,8 @@ static struct clk_branch cam_cc_csiphy2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy2_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -913,8 +929,8 @@ static struct clk_branch cam_cc_csiphy3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy3_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -931,8 +947,8 @@ static struct clk_branch cam_cc_fd_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_fd_core_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_fd_core_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_fd_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -949,8 +965,8 @@ static struct clk_branch cam_cc_fd_core_uar_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_fd_core_uar_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_fd_core_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_fd_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -992,8 +1008,8 @@ static struct clk_branch cam_cc_icp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_icp_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_icp_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_icp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1049,8 +1065,8 @@ static struct clk_branch cam_cc_ife_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1067,8 +1083,8 @@ static struct clk_branch cam_cc_ife_0_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_cphy_rx_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1085,8 +1101,8 @@ static struct clk_branch cam_cc_ife_0_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_csid_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_0_csid_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_0_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1103,8 +1119,8 @@ static struct clk_branch cam_cc_ife_0_dsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_dsp_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1133,8 +1149,8 @@ static struct clk_branch cam_cc_ife_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1151,8 +1167,8 @@ static struct clk_branch cam_cc_ife_1_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_cphy_rx_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1169,8 +1185,8 @@ static struct clk_branch cam_cc_ife_1_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_csid_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_1_csid_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_1_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1187,8 +1203,8 @@ static struct clk_branch cam_cc_ife_1_dsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_dsp_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1204,8 +1220,8 @@ static struct clk_branch cam_cc_ife_lite_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_lite_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_lite_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1222,8 +1238,8 @@ static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_cphy_rx_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_cphy_rx_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1240,8 +1256,8 @@ static struct clk_branch cam_cc_ife_lite_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_csid_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ife_lite_csid_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_lite_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1258,8 +1274,8 @@ static struct clk_branch cam_cc_ipe_0_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_ahb_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_slow_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1276,8 +1292,8 @@ static struct clk_branch cam_cc_ipe_0_areg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_areg_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_fast_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1307,8 +1323,8 @@ static struct clk_branch cam_cc_ipe_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ipe_0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ipe_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1325,8 +1341,8 @@ static struct clk_branch cam_cc_ipe_1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_1_ahb_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_slow_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1343,8 +1359,8 @@ static struct clk_branch cam_cc_ipe_1_areg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_1_areg_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_fast_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1374,8 +1390,8 @@ static struct clk_branch cam_cc_ipe_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_1_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_ipe_1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ipe_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1392,8 +1408,8 @@ static struct clk_branch cam_cc_jpeg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_jpeg_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_jpeg_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_jpeg_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1410,8 +1426,8 @@ static struct clk_branch cam_cc_lrme_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_lrme_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_lrme_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_lrme_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1428,8 +1444,8 @@ static struct clk_branch cam_cc_mclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk0_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_mclk0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1446,8 +1462,8 @@ static struct clk_branch cam_cc_mclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk1_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_mclk1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1464,8 +1480,8 @@ static struct clk_branch cam_cc_mclk2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk2_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_mclk2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1482,8 +1498,8 @@ static struct clk_branch cam_cc_mclk3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk3_clk",
-			.parent_names = (const char *[]){
-				"cam_cc_mclk3_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.33.0

