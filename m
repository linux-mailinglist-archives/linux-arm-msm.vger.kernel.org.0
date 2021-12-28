Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD565480614
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 05:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbhL1Ey0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Dec 2021 23:54:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234787AbhL1EyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Dec 2021 23:54:25 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D49C06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:25 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id h21so16887241ljh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2A7vrZ1DUpCfSJA15/jYIefdnyz83BpyxiBwQmycHs8=;
        b=PkV2FhjihRa0OF+Zt7JEx6AO9x4J/QY5uhWFo2v46Fff9YCaHkQBevIUwCI2YlaUg1
         CE5qxunXmmwr4N15zfojf1X8noe15C1t1xMerCDv7cj6Rr7vkVbUr7UjsXDcGrMBdjN3
         bMyJj++/Ud1WuJCFhskdNEZcicW9ysQoiLcTl7rheuOwXUDdpudHHA+zXQPzNgBOzIvF
         ZVTmKqtEXAfNWbplziyCH8/9W1sKWfyQYX7nQVu58ZEfnfsaeLhXEFSCpa+Qm3B3lz/1
         rGGl4kYUXIAiuUocQ2Diiv6tneZXmA0qAC2se38gd/Yu/Nvts0AtwDpihl0t7F0BUw72
         X9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2A7vrZ1DUpCfSJA15/jYIefdnyz83BpyxiBwQmycHs8=;
        b=8NeQfPC+2rQTwPWMB3NEjxLvBjJ8JjprRzAhRtf0uKIW7IHPV1alwVDM3yw5srz1dr
         4H+a4zj/jsH3WQKfmUPD8bCQ7lqpB+jEG7khfmG858bvj9Gj2mniHSRuHnf9WOrFDJHk
         TUVQcUdC2glO7hg45PHvAhtkYmBFtnSzW8sIqYY/gIZHXe1hUk1qccVzV8pfpHsyivpJ
         ADtGkm5FblZ9RRzWj7F3EbfB7+IRGpt/6PsF027SJp7actPvl2239Wo4kXBF6vJlDCoe
         fgxaqPRteGiUlmkOXoNrryLgDZhxdGpvMZTmDx6CzO9o8wkHZwSEYj4sh0dyju2YxiGZ
         TNhw==
X-Gm-Message-State: AOAM531v00OoWXGWE6684xwK3pBMGNIziyUBR4ikrMuPZUXzXnax5J2Q
        P09vPnW05gz4IQwyl9ujIitB4Q==
X-Google-Smtp-Source: ABdhPJyS3uJ4+y3eQEdcy15bJZxuDB06pMDLis/tWVEEVptqIXuhtlynK4SK2JPt8ZGYR+GxcC/s5g==
X-Received: by 2002:a2e:81d9:: with SMTP id s25mr11475331ljg.46.1640667263588;
        Mon, 27 Dec 2021 20:54:23 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:22 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 07/16] clk: qcom: camcc-sdm845: use ARRAY_SIZE instead of specifying num_parents
Date:   Tue, 28 Dec 2021 07:54:06 +0300
Message-Id: <20211228045415.20543-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 50 ++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 1b2cefef7431..97024e466dcd 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -190,7 +190,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_bps_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -213,7 +213,7 @@ static struct clk_rcg2 cam_cc_cci_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cci_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -233,7 +233,7 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cphy_rx_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -254,7 +254,7 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi0phytimer_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -269,7 +269,7 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi1phytimer_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -284,7 +284,7 @@ static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi2phytimer_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -299,7 +299,7 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi3phytimer_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -324,7 +324,7 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_fast_ahb_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -347,7 +347,7 @@ static struct clk_rcg2 cam_cc_fd_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_fd_core_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -370,7 +370,7 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_icp_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -394,7 +394,7 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_0_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -417,7 +417,7 @@ static struct clk_rcg2 cam_cc_ife_0_csid_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_0_csid_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -431,7 +431,7 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_1_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -446,7 +446,7 @@ static struct clk_rcg2 cam_cc_ife_1_csid_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_1_csid_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -460,7 +460,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_lite_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -475,7 +475,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_lite_csid_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -500,7 +500,7 @@ static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ipe_0_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -515,7 +515,7 @@ static struct clk_rcg2 cam_cc_ipe_1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ipe_1_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -530,7 +530,7 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_jpeg_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -555,7 +555,7 @@ static struct clk_rcg2 cam_cc_lrme_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_lrme_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -578,7 +578,7 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk0_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -593,7 +593,7 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk1_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -608,7 +608,7 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk2_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -623,7 +623,7 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk3_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -647,7 +647,7 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_slow_ahb_clk_src",
 		.parent_names = cam_cc_parent_names_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_names_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
-- 
2.34.1

