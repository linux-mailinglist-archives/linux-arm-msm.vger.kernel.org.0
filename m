Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A484761EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbhLOTh1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:37:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhLOTh0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:37:26 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF37C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:26 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id m6so33365230lfu.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kyKGFCrrctP5odpm5P/7yq8LrXwN1lgiaRUhdYgB+FA=;
        b=jJ7mvu4e2W4W/izJm5nEP1fnNa46Sgud/MT5qwOHuooUMuyjt6q31ChGQ2n6v+pquf
         /u2yahmeSti4gLXS8stOQfY/Jmo0BvgIVQi5Av4oV6HuoTzzBtHX3XSH6cE0QomBQrr4
         t9ma8woeUvFEz1iRYtxlhgV2OSXvDxF5W5BdBr+lshNzvCuBb8Vk+txQjCgWLZtYdKdM
         e98RA9uthCl27gamX86g5QsUidflSqlV1RRctb+yTtFk6hYM3X5wygKEMAkqv9/fjx7E
         TvenNFvejLXzLvvxG7Vx0/nWFWyoiNP3ymh4jkeDCIIHnogQ/oYWMDN5Ght+bkOlIXqd
         j9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kyKGFCrrctP5odpm5P/7yq8LrXwN1lgiaRUhdYgB+FA=;
        b=KKmAwvEGpg5nYb4IUuDP3+krrIucrXa8+79J4eD39AJjxcCuP6zqq4Tjd1+/Xeo2uU
         kiCDQzY3ychdD0b8IunD/ssPZWaskjlQ5jS2oOZWh02rj2qGk6vtvxqmj7blzTEtyZmF
         4+2kVCk/q8kMTMai7U8fD84KpXuXqVhfZlXfcJuzAifVq49DCkfmgxwtto669DLkBF+5
         aSgTgGy86GFVxn2j32/bLuLWRF1uyJ3Lb1sNUwDHjGQQqCsJEKvWBYW8BTCMyS+6YWvM
         ixsCO0/5EA0eWe+X3h4OLAZk9iaedqjHeK+X2uNWQS9+UZNpEyXw0uHHengHq1EtK2iL
         W5aQ==
X-Gm-Message-State: AOAM5335++NUQlb7DjpcrMYBqDcl1eb8uM0lzGGGMtcURBFyTZ3E1FM+
        rXRxcbdCd8MvSaBLnsAlZkYnZA==
X-Google-Smtp-Source: ABdhPJyIPFTLxL+9mUbIYNkxf1V3SbL912J+NJALyv3KPVuGLk7Voj+9UC93gX3Wwu8DSwoQumqWuQ==
X-Received: by 2002:a05:6512:4026:: with SMTP id br38mr10838759lfb.450.1639597044420;
        Wed, 15 Dec 2021 11:37:24 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 10/16] clk: qcom: camcc-sdm845: convert to parent_hws/_data
Date:   Wed, 15 Dec 2021 22:36:58 +0300
Message-Id: <20211215193704.2821775-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the clock driver to specify parent hws/data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 300 +++++++++++++++++---------------
 1 file changed, 158 insertions(+), 142 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index fd01ea53a07f..be3f95326965 100644
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
@@ -151,12 +167,12 @@ static const struct parent_map cam_cc_parent_map_0[] = {
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
 };
 
-static const char * const cam_cc_parent_names_0[] = {
-	"bi_tcxo",
-	"cam_cc_pll2_out_even",
-	"cam_cc_pll1_out_even",
-	"cam_cc_pll3_out_even",
-	"cam_cc_pll0_out_even",
+static const struct clk_parent_data cam_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &cam_cc_pll2_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll1_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll3_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
 };
 
 static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
@@ -186,8 +202,8 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
 	.freq_tbl = ftbl_cam_cc_bps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_bps_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -209,8 +225,8 @@ static struct clk_rcg2 cam_cc_cci_clk_src = {
 	.freq_tbl = ftbl_cam_cc_cci_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cci_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -229,8 +245,8 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
 	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cphy_rx_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -250,8 +266,8 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
 	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi0phytimer_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -265,8 +281,8 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
 	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi1phytimer_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -280,8 +296,8 @@ static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
 	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi2phytimer_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -295,8 +311,8 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
 	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi3phytimer_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -320,8 +336,8 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
 	.freq_tbl = ftbl_cam_cc_fast_ahb_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_fast_ahb_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -343,8 +359,8 @@ static struct clk_rcg2 cam_cc_fd_core_clk_src = {
 	.freq_tbl = ftbl_cam_cc_fd_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_fd_core_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -366,8 +382,8 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
 	.freq_tbl = ftbl_cam_cc_icp_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_icp_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -390,8 +406,8 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_0_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -413,8 +429,8 @@ static struct clk_rcg2 cam_cc_ife_0_csid_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_0_csid_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -427,8 +443,8 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_1_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -442,8 +458,8 @@ static struct clk_rcg2 cam_cc_ife_1_csid_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_1_csid_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -456,8 +472,8 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_lite_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -471,8 +487,8 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_lite_csid_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -496,8 +512,8 @@ static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ipe_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ipe_0_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -511,8 +527,8 @@ static struct clk_rcg2 cam_cc_ipe_1_clk_src = {
 	.freq_tbl = ftbl_cam_cc_ipe_0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ipe_1_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -526,8 +542,8 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
 	.freq_tbl = ftbl_cam_cc_bps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_jpeg_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -551,8 +567,8 @@ static struct clk_rcg2 cam_cc_lrme_clk_src = {
 	.freq_tbl = ftbl_cam_cc_lrme_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_lrme_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -574,8 +590,8 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
 	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk0_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -589,8 +605,8 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
 	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk1_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -604,8 +620,8 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
 	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk2_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -619,8 +635,8 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
 	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk3_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -643,8 +659,8 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
 	.freq_tbl = ftbl_cam_cc_slow_ahb_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_slow_ahb_clk_src",
-		.parent_names = cam_cc_parent_names_0,
-		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
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

