Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EEF474F9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238675AbhLOAyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:54:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235267AbhLOAyx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:54:53 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E146C06173E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:54:52 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id cf39so27930423lfb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jRXufLLyaETmRI1IXg55GGCdM+d6W6ypGDIGSr3HUhY=;
        b=MawIY315G9a7q/Yspewx8C/FeZjZYdrdHeZCnH5Bm2Tj6G9SfZloKJaJjx8Sb9Nr+s
         PzyZUvNa0fvqK9tK+gJ8WG+FQ3YMBAbu3eNkzw5mRDAsEcMTgi56D+md2eNaMYeIyQlU
         xPUUOUD58r7/c2qYTXVVcYCLTFPTyw1k62MfA/ZvHXZaPp7WD+JV+irz3IuIau5ybUF9
         UanUxoIkYItzv2zL9cgH2ootTO2kCX89CzvX818fJaHD4tnq2aZi1LZ2dD5HQbe8JSPF
         bjG3ShbAnIUZkzB117p7LzZYteK7r9SD9PQ3XC64zf/AM4gN7G3Z0Eb8vzzfftgb2Q1I
         5LyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jRXufLLyaETmRI1IXg55GGCdM+d6W6ypGDIGSr3HUhY=;
        b=3VcvV+ITlLPysXebGyDEovNWtyQF6NzvzfyYdPTH+8bLqTRIgU5yWitr6UzvjEaot+
         MaXQu6hZCbd9AusGas4uCSL7zhXMHNjbbpNT3HX0IjblSGMEQjVpfKCEMxqPpYzaMk7s
         Rj/RRNHMapY0WKTbA47ZzdDSyzYq85BTVOUs+lCCCY+1fK4uUtYbW0tkQ5FEOrBG803K
         xv+nEPhlIc4S+V36+PiAwrYA60ZG2EtPVsgtv48TOXP9xsfE9g2s7isGuB/PZViF8asO
         tx5rTIGBYTyth4ZTEdV036R0d0Kg27eL20m2WLgtDdDPEgOlzHnGF/fCXgNq1cj8Cu/g
         EYaA==
X-Gm-Message-State: AOAM53172tllF4IbSpI5YA9Vi/ChidgcK1vsotNvb8yA/sDZ4KocHdGk
        7ZlSC3xdDaxnuyCDkQsoaWUmXTIS7f/iwNzZ
X-Google-Smtp-Source: ABdhPJy61r7ulTOvNABcaZdWgrqYjU6btNv5zz7Bfl+gAqsaNh9NwHuHP85z569rxUR2BT6UmkcTwg==
X-Received: by 2002:a19:5214:: with SMTP id m20mr7077158lfb.180.1639529690732;
        Tue, 14 Dec 2021 16:54:50 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:54:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 04/15] clk: qcom: camcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
Date:   Wed, 15 Dec 2021 03:54:12 +0300
Message-Id: <20211215005423.2114261-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/camcc-sc7180.c | 50 ++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index ce73ee9037cb..f6e303976a0d 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -303,7 +303,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_bps_clk_src",
 		.parent_data = cam_cc_parent_data_2,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -324,7 +324,7 @@ static struct clk_rcg2 cam_cc_cci_0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cci_0_clk_src",
 		.parent_data = cam_cc_parent_data_5,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -338,7 +338,7 @@ static struct clk_rcg2 cam_cc_cci_1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cci_1_clk_src",
 		.parent_data = cam_cc_parent_data_5,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -359,7 +359,7 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cphy_rx_clk_src",
 		.parent_data = cam_cc_parent_data_3,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -378,7 +378,7 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi0phytimer_clk_src",
 		.parent_data = cam_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -392,7 +392,7 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi1phytimer_clk_src",
 		.parent_data = cam_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -406,7 +406,7 @@ static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi2phytimer_clk_src",
 		.parent_data = cam_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -420,7 +420,7 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi3phytimer_clk_src",
 		.parent_data = cam_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -442,7 +442,7 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_fast_ahb_clk_src",
 		.parent_data = cam_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -465,7 +465,7 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_icp_clk_src",
 		.parent_data = cam_cc_parent_data_2,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -487,7 +487,7 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_0_clk_src",
 		.parent_data = cam_cc_parent_data_4,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -509,7 +509,7 @@ static struct clk_rcg2 cam_cc_ife_0_csid_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_0_csid_clk_src",
 		.parent_data = cam_cc_parent_data_3,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -523,7 +523,7 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_1_clk_src",
 		.parent_data = cam_cc_parent_data_4,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -537,7 +537,7 @@ static struct clk_rcg2 cam_cc_ife_1_csid_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_1_csid_clk_src",
 		.parent_data = cam_cc_parent_data_3,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -551,7 +551,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_lite_clk_src",
 		.parent_data = cam_cc_parent_data_4,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -566,7 +566,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_lite_csid_clk_src",
 		.parent_data = cam_cc_parent_data_3,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -589,7 +589,7 @@ static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ipe_0_clk_src",
 		.parent_data = cam_cc_parent_data_2,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -612,7 +612,7 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_jpeg_clk_src",
 		.parent_data = cam_cc_parent_data_2,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -634,7 +634,7 @@ static struct clk_rcg2 cam_cc_lrme_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_lrme_clk_src",
 		.parent_data = cam_cc_parent_data_6,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_6),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -655,7 +655,7 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk0_clk_src",
 		.parent_data = cam_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -669,7 +669,7 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk1_clk_src",
 		.parent_data = cam_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -683,7 +683,7 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk2_clk_src",
 		.parent_data = cam_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -697,7 +697,7 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk3_clk_src",
 		.parent_data = cam_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -711,7 +711,7 @@ static struct clk_rcg2 cam_cc_mclk4_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk4_clk_src",
 		.parent_data = cam_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -730,7 +730,7 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_slow_ahb_clk_src",
 		.parent_data = cam_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.33.0

