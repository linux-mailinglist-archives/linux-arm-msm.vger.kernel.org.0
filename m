Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B50D46DA7F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 18:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238394AbhLHR6N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 12:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238346AbhLHR6M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 12:58:12 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB2DC0617A1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 09:54:39 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b1so7041392lfs.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 09:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oe0MOvbMkSKePo3V/wIFVW5cAdAHDAcQGkD4YhLPwM4=;
        b=ReEw3Bps7Li7cIrlusj7+qR7Ph0G1h4h07N1L3Aieu6fWQqv5iQVrFm3zFfNRg/Tpr
         gtsvH49RV9OH9TUs8/lfsdXDTcX9KVZdzpS0G0215sFaH/9bgjXrtJO2H9XXY/XnmhoD
         XxL4GGBRQhFlLnpaXGRQT3PlgCL70peRoKu2jYmr7wdgePBi+BDuStpULvcoUhQN0THV
         76hdvzSeDnRX8U3ZY0ebXyZGHGrjaHhOu1nSF0qSy1NrJOK9QVZM/7Beqy64M5n8Gub7
         tRyQbA17k+F1uIfQhnIt3tcPcbGAQ480pqPfTF67ayyT28liti+KijMQ2Ej4/XDtYBQR
         OaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oe0MOvbMkSKePo3V/wIFVW5cAdAHDAcQGkD4YhLPwM4=;
        b=XDD0n3ZWZ5jmLYoBkXsW1StvgxkrW1/0ZnOq6UrM3+aadjxLYQUJxCdepC8BV/YeI8
         4QeT0gf4K+IxYvLrTiCDWGru9pZ5hw2kWq6IoFMWw9XEo5XllE1APrmDTY/cwdgBBykw
         i/zM9PMGqyDcbOlxTxRHEKYr9bQ9snclHCEc554jNKTqIAdeTURbM4cqWkNv/AvfPhmi
         X7rDXV0n9f2lhjGb2lAIRzJDWZ+5tXhUfJFQt68liWjV4dAWFUdhr5qk4AK3LCK/yEkk
         oY9o2XMPtiBiw/dwOJWnP2krlVinpmR4Y+Lo8fydMR8Wvte2tQxmPhmKHQtYFIBCOPTr
         iThQ==
X-Gm-Message-State: AOAM530sEuihov/HwcIFYcHgp96sPF97Vyw64dIgOe4bE6nEcAvGkZQz
        Rnl0bXUBeQqswLno99WewGwGfw==
X-Google-Smtp-Source: ABdhPJxqRCZSTI8p0LpE+n9TpHyZEv8T2ULJb0ROCVovvAtfCi3zDcjJhvXm7iBh7u9y60u57mkUJA==
X-Received: by 2002:a05:6512:224d:: with SMTP id i13mr949622lfu.432.1638986077859;
        Wed, 08 Dec 2021 09:54:37 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm388903ljg.90.2021.12.08.09.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:54:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 06/11] clk: qcom: camcc-sc7180: use parent_hws instead of parent_data
Date:   Wed,  8 Dec 2021 20:54:25 +0300
Message-Id: <20211208175430.1333594-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If all parents are specified as clk_hw, we can use parent_hws instead of
parent_data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/camcc-sc7180.c | 156 ++++++++++++++++----------------
 1 file changed, 79 insertions(+), 77 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index 3c15e551419f..e2b4804695f3 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -126,7 +126,9 @@ static struct clk_fixed_factor cam_cc_pll2_out_early = {
 	.div = 2,
 	.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll2_out_early",
-		.parent_names = (const char *[]){ "cam_cc_pll2" },
+		.parent_hws = (const struct clk_hw*[]){
+			&cam_cc_pll2.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_fixed_factor_ops,
 	},
@@ -146,8 +148,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll2_out_aux = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_AGERA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll2_out_aux",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &cam_cc_pll2.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&cam_cc_pll2.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -729,8 +731,8 @@ static struct clk_branch cam_cc_bps_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -747,8 +749,8 @@ static struct clk_branch cam_cc_bps_areg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_areg_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -778,8 +780,8 @@ static struct clk_branch cam_cc_bps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_bps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_bps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -809,8 +811,8 @@ static struct clk_branch cam_cc_cci_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_cci_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cci_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cci_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -827,8 +829,8 @@ static struct clk_branch cam_cc_cci_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_cci_1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cci_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cci_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -845,8 +847,8 @@ static struct clk_branch cam_cc_core_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_core_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -863,8 +865,8 @@ static struct clk_branch cam_cc_cpas_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_cpas_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -881,8 +883,8 @@ static struct clk_branch cam_cc_csi0phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi0phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_csi0phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_csi0phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -899,8 +901,8 @@ static struct clk_branch cam_cc_csi1phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi1phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_csi1phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_csi1phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -917,8 +919,8 @@ static struct clk_branch cam_cc_csi2phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi2phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_csi2phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_csi2phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -935,8 +937,8 @@ static struct clk_branch cam_cc_csi3phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi3phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_csi3phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_csi3phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -953,8 +955,8 @@ static struct clk_branch cam_cc_csiphy0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -971,8 +973,8 @@ static struct clk_branch cam_cc_csiphy1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -989,8 +991,8 @@ static struct clk_branch cam_cc_csiphy2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1007,8 +1009,8 @@ static struct clk_branch cam_cc_csiphy3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1025,8 +1027,8 @@ static struct clk_branch cam_cc_icp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_icp_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_icp_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_icp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1056,8 +1058,8 @@ static struct clk_branch cam_cc_ife_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1074,8 +1076,8 @@ static struct clk_branch cam_cc_ife_0_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_cphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1092,8 +1094,8 @@ static struct clk_branch cam_cc_ife_0_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_csid_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_0_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_0_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1110,8 +1112,8 @@ static struct clk_branch cam_cc_ife_0_dsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_dsp_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1141,8 +1143,8 @@ static struct clk_branch cam_cc_ife_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1159,8 +1161,8 @@ static struct clk_branch cam_cc_ife_1_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_cphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1177,8 +1179,8 @@ static struct clk_branch cam_cc_ife_1_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_csid_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_1_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_1_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1195,8 +1197,8 @@ static struct clk_branch cam_cc_ife_1_dsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_dsp_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1213,8 +1215,8 @@ static struct clk_branch cam_cc_ife_lite_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_lite_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_lite_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1231,8 +1233,8 @@ static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_cphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1249,8 +1251,8 @@ static struct clk_branch cam_cc_ife_lite_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_csid_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_lite_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ife_lite_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1267,8 +1269,8 @@ static struct clk_branch cam_cc_ipe_0_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1285,8 +1287,8 @@ static struct clk_branch cam_cc_ipe_0_areg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_areg_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1316,8 +1318,8 @@ static struct clk_branch cam_cc_ipe_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ipe_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_ipe_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1334,8 +1336,8 @@ static struct clk_branch cam_cc_jpeg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_jpeg_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_jpeg_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_jpeg_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1352,8 +1354,8 @@ static struct clk_branch cam_cc_lrme_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_lrme_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_lrme_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_lrme_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1370,8 +1372,8 @@ static struct clk_branch cam_cc_mclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_mclk0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1388,8 +1390,8 @@ static struct clk_branch cam_cc_mclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_mclk1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1406,8 +1408,8 @@ static struct clk_branch cam_cc_mclk2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_mclk2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1424,8 +1426,8 @@ static struct clk_branch cam_cc_mclk3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_mclk3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1442,8 +1444,8 @@ static struct clk_branch cam_cc_mclk4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_mclk4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cam_cc_mclk4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.33.0

