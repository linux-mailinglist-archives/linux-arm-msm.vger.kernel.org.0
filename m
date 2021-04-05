Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCDFE3548E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242892AbhDEWsO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242883AbhDEWsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:10 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD986C061788
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:48:02 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 12so19531642lfq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ijKynGdnSW5WGlfUmFMSn3n0R5WrELq2xL8N2jSibAU=;
        b=OBmPSOeIs0ZZrTB7Zev64S5HDUi7IkZKajwUOMfGnJHwO1uiwyzNyLnT0RdjUg/GrU
         SBM/WdxmGN48MTK07wbONkIBJhfGv9NJk0cCDYEaPWRJ0/9KafCAP1+y0U6baz2dN5ET
         +I06WuKEwmJIPxLAQoki95GRWB54map81eNNdqFNxBcvnpB9I/KuaoULlCzdKrvW5ZG7
         0wjm4pMeeNMm+YpQ6KGt3RSws5tFYRrrDtlOKkXlFYpreHEOSz3jkh/u2RyLGl4purPV
         ZACvlSgqNc5kvKBVKMyTEKV4jAqUwfMeocD0z539rmTYUf6EWzxJxFl9cj/0O/eRTHWH
         riew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ijKynGdnSW5WGlfUmFMSn3n0R5WrELq2xL8N2jSibAU=;
        b=DyUpyd2xlLJyr+JN9LjCGJpwUIwwl8n+rUrDfORTmoYmWcRN3p2oNu69Gh4T7OhFPl
         KyrvdNKJ8wvQARFpUojBmvr1TDz8oG/8nnbKI0sdz7sMZg5j9Zk4Sp+EX61ZhO6mM376
         pEtKL0p9Zga3z3aQ1rY1nsu0I77GJluGnYpHmsJniHdDgJST6+wrwcjIkh35jQvUhlxn
         4p4EzMa2UmJuYsOfPGweaMAdn3QgWnFiYR+TJoLUhpVUI7Cq9u/MpldwrGDjixBjbXpz
         8YfLtC9gqMcj3Y5xXWELGDFuu0wxTu5wK6vWsxsS8WgDliOVV3N+PZxVV/23JyRRmDsY
         lv3g==
X-Gm-Message-State: AOAM531xIfJjiUtipCUNXzO8KdzyV5KeTJiRK0VsNzcM40Zm3eeWcCIw
        x8pwmp3u4WJGLSTwm4GgWAIVJg==
X-Google-Smtp-Source: ABdhPJzICUOYpuTiCnWEYmbo+mAAoKVZ867srj5FhG158fWjWyR8QHWO+P6mb+XfGmaLO/0KeRxOpw==
X-Received: by 2002:ac2:4ec6:: with SMTP id p6mr17774627lfr.163.1617662881339;
        Mon, 05 Apr 2021 15:48:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 23/33] clk: qcom: gcc-sm8250: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:33 +0300
Message-Id: <20210405224743.590029-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch to using parent_hws instead of parent_data when parents are
defined in this driver and so accessible using clk_hw.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8250.c | 252 +++++++++++++++++-----------------
 1 file changed, 126 insertions(+), 126 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 86626a027f6f..5ceadb35289f 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -63,8 +63,8 @@ static struct clk_alpha_pll_postdiv gpll0_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gpll0.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_lucid_ops,
@@ -1015,8 +1015,8 @@ static struct clk_regmap_div gcc_cpuss_ahb_postdiv_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "gcc_cpuss_ahb_postdiv_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gcc_cpuss_ahb_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gcc_cpuss_ahb_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1030,8 +1030,8 @@ static struct clk_regmap_div gcc_usb30_prim_mock_utmi_postdiv_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "gcc_usb30_prim_mock_utmi_postdiv_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1045,8 +1045,8 @@ static struct clk_regmap_div gcc_usb30_sec_mock_utmi_postdiv_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "gcc_usb30_sec_mock_utmi_postdiv_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gcc_usb30_sec_mock_utmi_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gcc_usb30_sec_mock_utmi_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1077,8 +1077,8 @@ static struct clk_branch gcc_aggre_ufs_card_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre_ufs_card_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_card_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_card_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1097,8 +1097,8 @@ static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre_ufs_phy_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1115,8 +1115,8 @@ static struct clk_branch gcc_aggre_usb3_prim_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre_usb3_prim_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1133,8 +1133,8 @@ static struct clk_branch gcc_aggre_usb3_sec_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre_usb3_sec_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_sec_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_sec_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1205,8 +1205,8 @@ static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_cfg_noc_usb3_prim_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1223,8 +1223,8 @@ static struct clk_branch gcc_cfg_noc_usb3_sec_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_cfg_noc_usb3_sec_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_sec_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_sec_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1241,8 +1241,8 @@ static struct clk_branch gcc_cpuss_ahb_clk = {
 		.enable_mask = BIT(21),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_cpuss_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
@@ -1337,8 +1337,8 @@ static struct clk_branch gcc_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gp1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1355,8 +1355,8 @@ static struct clk_branch gcc_gp2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gp2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gp2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1373,8 +1373,8 @@ static struct clk_branch gcc_gp3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gp3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gp3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1390,8 +1390,8 @@ static struct clk_branch gcc_gpu_gpll0_clk_src = {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_gpll0_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gpll0.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gpll0.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1407,8 +1407,8 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
 		.enable_mask = BIT(16),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_gpll0_div_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gpll0_out_even.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gpll0_out_even.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1530,8 +1530,8 @@ static struct clk_branch gcc_npu_gpll0_clk_src = {
 		.enable_mask = BIT(18),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_npu_gpll0_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gpll0.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gpll0.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1547,8 +1547,8 @@ static struct clk_branch gcc_npu_gpll0_div_clk_src = {
 		.enable_mask = BIT(19),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_npu_gpll0_div_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gpll0_out_even.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gpll0_out_even.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1565,8 +1565,8 @@ static struct clk_branch gcc_pcie0_phy_refgen_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie0_phy_refgen_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_phy_refgen_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_phy_refgen_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1583,8 +1583,8 @@ static struct clk_branch gcc_pcie1_phy_refgen_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie1_phy_refgen_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_phy_refgen_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_phy_refgen_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1601,8 +1601,8 @@ static struct clk_branch gcc_pcie2_phy_refgen_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie2_phy_refgen_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_phy_refgen_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_phy_refgen_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1619,8 +1619,8 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
 		.enable_mask = BIT(3),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_0_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_0_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1706,8 +1706,8 @@ static struct clk_branch gcc_pcie_1_aux_clk = {
 		.enable_mask = BIT(29),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_1_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_1_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1793,8 +1793,8 @@ static struct clk_branch gcc_pcie_2_aux_clk = {
 		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_2_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_2_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_2_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1893,8 +1893,8 @@ static struct clk_branch gcc_pcie_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_phy_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_0_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_0_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1937,8 +1937,8 @@ static struct clk_branch gcc_pdm2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pdm2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pdm2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2097,8 +2097,8 @@ static struct clk_branch gcc_qupv3_wrap0_s0_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2115,8 +2115,8 @@ static struct clk_branch gcc_qupv3_wrap0_s1_clk = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2133,8 +2133,8 @@ static struct clk_branch gcc_qupv3_wrap0_s2_clk = {
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2151,8 +2151,8 @@ static struct clk_branch gcc_qupv3_wrap0_s3_clk = {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2169,8 +2169,8 @@ static struct clk_branch gcc_qupv3_wrap0_s4_clk = {
 		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2187,8 +2187,8 @@ static struct clk_branch gcc_qupv3_wrap0_s5_clk = {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s5_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2205,8 +2205,8 @@ static struct clk_branch gcc_qupv3_wrap0_s6_clk = {
 		.enable_mask = BIT(16),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s6_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s6_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s6_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2223,8 +2223,8 @@ static struct clk_branch gcc_qupv3_wrap0_s7_clk = {
 		.enable_mask = BIT(17),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s7_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s7_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s7_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2267,8 +2267,8 @@ static struct clk_branch gcc_qupv3_wrap1_s0_clk = {
 		.enable_mask = BIT(22),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2285,8 +2285,8 @@ static struct clk_branch gcc_qupv3_wrap1_s1_clk = {
 		.enable_mask = BIT(23),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2303,8 +2303,8 @@ static struct clk_branch gcc_qupv3_wrap1_s2_clk = {
 		.enable_mask = BIT(24),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2321,8 +2321,8 @@ static struct clk_branch gcc_qupv3_wrap1_s3_clk = {
 		.enable_mask = BIT(25),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2339,8 +2339,8 @@ static struct clk_branch gcc_qupv3_wrap1_s4_clk = {
 		.enable_mask = BIT(26),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2357,8 +2357,8 @@ static struct clk_branch gcc_qupv3_wrap1_s5_clk = {
 		.enable_mask = BIT(27),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s5_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2401,8 +2401,8 @@ static struct clk_branch gcc_qupv3_wrap2_s0_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap2_s0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2419,8 +2419,8 @@ static struct clk_branch gcc_qupv3_wrap2_s1_clk = {
 		.enable_mask = BIT(5),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap2_s1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2437,8 +2437,8 @@ static struct clk_branch gcc_qupv3_wrap2_s2_clk = {
 		.enable_mask = BIT(6),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap2_s2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2455,8 +2455,8 @@ static struct clk_branch gcc_qupv3_wrap2_s3_clk = {
 		.enable_mask = BIT(7),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap2_s3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2473,8 +2473,8 @@ static struct clk_branch gcc_qupv3_wrap2_s4_clk = {
 		.enable_mask = BIT(8),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap2_s4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2491,8 +2491,8 @@ static struct clk_branch gcc_qupv3_wrap2_s5_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s5_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s5_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap2_s5_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2606,8 +2606,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_sdcc2_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_sdcc2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2637,8 +2637,8 @@ static struct clk_branch gcc_sdcc4_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_sdcc4_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_sdcc4_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2681,8 +2681,8 @@ static struct clk_branch gcc_tsif_ref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_ref_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_tsif_ref_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_tsif_ref_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2729,8 +2729,8 @@ static struct clk_branch gcc_ufs_card_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_card_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_card_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_card_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2749,8 +2749,8 @@ static struct clk_branch gcc_ufs_card_ice_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_card_ice_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_card_ice_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_card_ice_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2769,8 +2769,8 @@ static struct clk_branch gcc_ufs_card_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_card_phy_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_card_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_card_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2828,8 +2828,8 @@ static struct clk_branch gcc_ufs_card_unipro_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_card_unipro_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_card_unipro_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_card_unipro_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2863,8 +2863,8 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2883,8 +2883,8 @@ static struct clk_branch gcc_ufs_phy_ice_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_ice_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_ice_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_ice_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2903,8 +2903,8 @@ static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_phy_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2962,8 +2962,8 @@ static struct clk_branch gcc_ufs_phy_unipro_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_unipro_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2980,8 +2980,8 @@ static struct clk_branch gcc_usb30_prim_master_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_prim_master_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3030,8 +3030,8 @@ static struct clk_branch gcc_usb30_sec_master_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sec_master_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_sec_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_sec_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3080,8 +3080,8 @@ static struct clk_branch gcc_usb3_prim_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_prim_phy_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3098,8 +3098,8 @@ static struct clk_branch gcc_usb3_prim_phy_com_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_prim_phy_com_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3142,8 +3142,8 @@ static struct clk_branch gcc_usb3_sec_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_sec_phy_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3160,8 +3160,8 @@ static struct clk_branch gcc_usb3_sec_phy_com_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_sec_phy_com_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

