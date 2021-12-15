Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9AC4761DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbhLOThT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhLOThT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:37:19 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA4CC06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:18 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id k2so34898520lji.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BUrIIpyK+NSghJY0zCzLPe1b8UVdChccjZ8oCE+1tOc=;
        b=MX6SUrYerTpgGMiOspDFF9WPHdpRCIwltIrUyN0OQZ2wSEU1SxvRsumHYd36arkqqA
         1DPWoPgevk3jr3SrGDIz5klnuooTs93TS/prRhB/0lHP7lBj0HCX4l+1jf5yhuqV5CTo
         MOPf54m4Y1Vfm6zYjZ33wwLPN/N6Qj3OuJgCKjjnyMMGQJIVhvmuTY7Y0uB5J4xp1tMY
         A+r0Vfx1jdDS/yMAxbWOjMgnyUqVYmCsQgj8ktqs5dWS0veAwUMIMUiKnMgBNE+tUa6U
         FIBkwVp/6oxQmudvKkLweqf8SID2UQ1Pc4G785FUzcJzf41lqbB/xMptvRW7byjg5JHp
         DAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BUrIIpyK+NSghJY0zCzLPe1b8UVdChccjZ8oCE+1tOc=;
        b=BFu0FT9DFd626SteOqvv76n51qXkZxd2QA0pbdclbtfUOTLClmEcVZyglbqNo/S/0m
         pLU26prR5UbcNtnL8HQ/dBnA/O1G2aSSPNTHWf/7cPJmmWupxnwGAbye77pJDFBplm5B
         QFP9wDooaZKzC8OO89ZU4UlqIm3wZ3am+YyrZ9XO7b9yuXG6bstthHid1UOG/6+Nbm+S
         aL0VtILPGkTcCLIg5dYi72SWkCEK9JocshEg7LMGfWqNU/lThGfT+cC/imBz76RjIl1V
         PvkCHLT5lrHzUeCNL2dQPpzwc91UVBKjvTsLtSDj9wUINyrIcy5A9GayIK0jNCe4sZzy
         YJvA==
X-Gm-Message-State: AOAM533BU2d0gz+X+xriFazMZgU+gdC+j9Hxw72BetNJjEWG0CzzG54V
        hKXS5CmX7afFN8Q79LJOUfk/sQ==
X-Google-Smtp-Source: ABdhPJwSA/tKS6KU4lBStnW5ExsvuneI9c809LSEwco3AWMSOHFd+GJtHGxxUUHUinvGNYi4Szydrw==
X-Received: by 2002:a2e:8396:: with SMTP id x22mr11622753ljg.255.1639597036879;
        Wed, 15 Dec 2021 11:37:16 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 04/16] clk: qcom: camcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
Date:   Wed, 15 Dec 2021 22:36:52 +0300
Message-Id: <20211215193704.2821775-5-dmitry.baryshkov@linaro.org>
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

