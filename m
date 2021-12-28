Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E296480610
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 05:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234783AbhL1EyZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Dec 2021 23:54:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbhL1EyY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Dec 2021 23:54:24 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E843C06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:24 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id k21so39005735lfu.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2e6O/DXhlXn1qqGrAYrTpn0ya8HtaQ735kfekSr+evk=;
        b=NP9wcOCNsAhM7nuxUqq0++D+c4blL5JfDy1+saHWoVkhxR4Ta/PD1S9qc7hDYujKvm
         liXO90g9d/lk2qf6dsXhPmrFOLNv68mKyHcXOVMnbaNqjq+6FeGm5JKtI4Ft1ERvpaRv
         cRx+PerIcgeVk35wh3RFErmBMoGa9RAu+1pe7E4tY71DPX/vrY9Tx7Y+8kJxqzLg7132
         jiYlOZb1JlG9RJLWXVgXPro+8WYL2EkXuja/LRXvbK7AMiSFPdo+CLNf44YjUqhh/Eys
         OjheYXvyyWJWCj+sWhwt0v1OrONt25kHswIp/L4Q5pW2ctX2SdUPfWU8XjuzcXox5iDN
         6z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2e6O/DXhlXn1qqGrAYrTpn0ya8HtaQ735kfekSr+evk=;
        b=FWl7u4IUO43JdSe9lE4JR1EcGniqf17hOAHCTLvmwt1iWCfn1t8IS8voAin6txyrqk
         ITQRz9Wpeo+Z6IpCr+hs/R4KsVSNvsvFkE+M6J8ivDbOFC+zhqV9r7gnYrceCW3uiDwj
         L5o9LfED3Q5DhTZExFKBhLCU4n1P1EUTo1dXCqJN3bBIJIaEnSHsm0Sln3/012BTfpxG
         6OJPqR+ItdZafvkny2jX6n29HJbPwlSQh34iWdOiXYeyNK8EYeVSDcYJKT8YoGVY0Zxa
         ALzyabEKhIG8nJoaTQoPUy5Zb4Fa5DtZ++vi5fCfmBUYypNCCZCB8jsDTnnIruhSAtaM
         fmQA==
X-Gm-Message-State: AOAM531zmSx/LEo7ozWifipe9Mw1mTe2Ew0v96iF2LNf4UepQgTzJ11z
        ACAQS3UmrtgVfoZigKm2OhnTHw==
X-Google-Smtp-Source: ABdhPJyuT9A7ozsEsLgJZwTISfRJXoYZz3scPaelO0xeIEKuv6FLHPfhvDwt2kdFH/mhKG5pKExacg==
X-Received: by 2002:ac2:5b43:: with SMTP id i3mr17748470lfp.647.1640667262535;
        Mon, 27 Dec 2021 20:54:22 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:22 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 06/16] clk: qcom: camcc-sc7180: use parent_hws instead of parent_data
Date:   Tue, 28 Dec 2021 07:54:05 +0300
Message-Id: <20211228045415.20543-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If all parents are specified as clk_hw, we can use parent_hws instead of
parent_data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
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
2.34.1

