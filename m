Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D5948060E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 05:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbhL1EyY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Dec 2021 23:54:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234777AbhL1EyX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Dec 2021 23:54:23 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36E4C06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:22 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id x4so11270895ljc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fzm+fAfZcksY7ALzmZSmOUT45EvDMYyF8rjxu1TJkXY=;
        b=Aj6YAUv2DXSg+MQpk69d0dmtC/JhycHEbJgHsuXkbKslrvOlkqo5RcWxs6GQGHHwp6
         PSQhJfP1PhVW9+Erf9Cs7urlAbxewdQseI/DYBbM7UeWTAraVGZn3eZmRqYXzHCQstDt
         IKfqijxCd0l22sIwkBB28IvEsBSyzSYGOUq2dDjbPXia0P6cC/0zD8EGkWpGD84wRAVl
         9K0WXWf9Ujc8tNG5vuAxvqeUJKjWFIvdK0SUBLQWg3pN4qxyo9am6Wv+g2W/b9I26I99
         OgkBkUjVick+ZAMYQ9BQOffdnfpc2vv1gT+RQYBtbY551bYnyzkkPMOTQkHuDoo8lXP8
         Ojag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fzm+fAfZcksY7ALzmZSmOUT45EvDMYyF8rjxu1TJkXY=;
        b=mSEZzJSUwSpPULLmQGK0braelBmZ29yNbDFTtnT9sF+gMdT1VNOaDru4G6GLN9VuAq
         DRsMnA66T2BIfc4Hya+tYEMqXuwNP1pNGclNfWlcq9OT6phjZ4TyXtsT70RP07s9dfuI
         33ZzZY3gL/NFioK4UCYPOXJEjJN3AfEXQ/kmyGtcDwIWsKiu4ZEz+p9sR4XRRCOF/dxr
         QxrU0FBjeaC3zap1kt9DCcgr0k5Xjt/xUoYF8XGQQRIiVGqNOy3vnWZVHQDndd+u8z2i
         ObuN4ETxYHM/4Tr7pOWP6zCPzF9hjjwNjq08j/8+dcEpYIKUGDL01tyok2LYKtCmfN+L
         kgfw==
X-Gm-Message-State: AOAM530vtODP53CxCkW9QGqaJVtUFQ0af1zMDB3K4CQBjg/K1/E1gBcF
        aa2MquS3uPGiqxiVzvuhbQeLnw==
X-Google-Smtp-Source: ABdhPJwAXeagQ6S5QFVozp1YLTXxv5eVxuCAS49GNrHxeD80bnQqHv+64XMpCnJSxpjTo0POe63hXw==
X-Received: by 2002:a2e:7c0b:: with SMTP id x11mr11890399ljc.198.1640667261059;
        Mon, 27 Dec 2021 20:54:21 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 04/16] clk: qcom: camcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
Date:   Tue, 28 Dec 2021 07:54:03 +0300
Message-Id: <20211228045415.20543-5-dmitry.baryshkov@linaro.org>
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
2.34.1

