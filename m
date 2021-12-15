Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7244761E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbhLOThX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhLOThX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:37:23 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FE0C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:22 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id k2so34898760lji.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d0IjJtuDg4rs9cwhxc+1koN51vx5SlVeaR3MQfkfr9U=;
        b=iuCaIkZVSaxMqnJmnSF4aCKZfdJhoCxFWIvbwmJ6hZONAo4Uq5rks7L1+NEdv43gor
         oE7uY4lMTYqRhwlsv9i5EZyq8J0/F0reptHk2i376tqaVd/tgk7lfb/xqpoUrNszVpUn
         +a6iWTeUR9019WatovqWHYXABOunGHcE/YpFGnUIfu05CPOtQm4stSh1jLjoudF4Lt8Y
         XnfFhjyO0xe73CsmxzGiHmuapESBjx24jVafLyAb77zPWGMDc1ZNwg0Z/DOPFxJTi8nc
         /tmPTdCcHOtPozR7kA4CzTs19NBnJuk6SY0vjHK6c8m9k84JVj5/bEjVoBpbns4dVEcR
         07KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d0IjJtuDg4rs9cwhxc+1koN51vx5SlVeaR3MQfkfr9U=;
        b=UusZqfgQrd7aQduv5lbEV+/beQaaQvaeV73CGJM5Pln0oAoseCLn+OKO+tTzcainLN
         S0uWjs/QP4hJwRZ0qPtK4t/D6CAYMMYprkllTBBx0NMnPmCpDQa/4xZlLtllBHWDXuNE
         Q7uv4PPfdWQFmmg8Tg21y/fIVlBsiBZt2s8fuOSuH3JE6qhEPgQ0JJA6+rhq/76Om4QX
         DDU5S92kqGzOvnWgkXT6C85hzLUjpZoeuz0+X7/EAFeX/1Lmip3vcmjkDKMFhos1Esjy
         /7SLwjLtTvOfwh2IcLanQXYKmgf9H5xKrFCR/N339gGf3h83R7DzTFCbkfSlVr9ziO5e
         9nEQ==
X-Gm-Message-State: AOAM530RIoCoaKWjJXKvuf6bHAn7/fW/fZBHzocsgAgpJhklNdXOAwBS
        1FdmM5KhgFn3sUJ41MZWuo9IcA==
X-Google-Smtp-Source: ABdhPJyLSFESy1wa1CuXCjYpVJrzmMGxhMS9GBUapZPDOaVmuyhmwU6f9gkBWkdcj3B5ZJtQYx8+aA==
X-Received: by 2002:a2e:9193:: with SMTP id f19mr12275835ljg.60.1639597040748;
        Wed, 15 Dec 2021 11:37:20 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 07/16] clk: qcom: camcc-sdm845: use ARRAY_SIZE instead of specifying num_parents
Date:   Wed, 15 Dec 2021 22:36:55 +0300
Message-Id: <20211215193704.2821775-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
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
2.33.0

