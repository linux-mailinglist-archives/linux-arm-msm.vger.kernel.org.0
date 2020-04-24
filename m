Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D921B6CC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 06:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgDXEnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 00:43:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:38190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgDXEnV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 00:43:21 -0400
Received: from vkoul-mobl.Dlink (unknown [106.51.110.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C7CD20767;
        Fri, 24 Apr 2020 04:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587703401;
        bh=aAo18jPKVxG4VDoPWfrM9NrQKq/mvYfpPnWJ4sigfik=;
        h=From:To:Cc:Subject:Date:From;
        b=le8Lekqni5ooTS88AYDDusDl0ln80jllzfbx/QDmImef58QXFq8IEO+3tYiECA4iU
         Hx8vRx63FcgvZ4dpEUMJx1F1/yrorqj1CD68Ztiy4xqslSg/TkURwPKJacud53/ziR
         hblidRlofxl8cQs9abOsrEsyk7AU4obYNqCLlOQA=
From:   Vinod Koul <vkoul@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: gcc: Add GPU and NPU clocks for SM8150
Date:   Fri, 24 Apr 2020 10:13:10 +0530
Message-Id: <20200424044311.2155917-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the GPU and NPU clocks for SM8150. They were missed in earlier
addition of clock driver.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/gcc-sm8150.c | 72 +++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index ef98fdc51755..5c3dc34c955e 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -1617,6 +1617,40 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk = {
 	},
 };
 
+/* external clocks so add BRANCH_HALT_SKIP */
+static struct clk_branch gcc_gpu_gpll0_clk_src = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(15),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_gpll0_clk_src",
+			.parent_hws = (const struct clk_hw *[]){
+				&gpll0.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+/* these are external clocks so add BRANCH_HALT_SKIP */
+static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(16),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gpu_gpll0_div_clk_src",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_gpu_gpll0_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_gpu_iref_clk = {
 	.halt_reg = 0x8c010,
 	.halt_check = BRANCH_HALT,
@@ -1699,6 +1733,40 @@ static struct clk_branch gcc_npu_cfg_ahb_clk = {
 	},
 };
 
+/* external clocks so add BRANCH_HALT_SKIP */
+static struct clk_branch gcc_npu_gpll0_clk_src = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(18),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_npu_gpll0_clk_src",
+			.parent_hws = (const struct clk_hw *[]){
+				&gpll0.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+/* external clocks so add BRANCH_HALT_SKIP */
+static struct clk_branch gcc_npu_gpll0_div_clk_src = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(19),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_npu_gpll0_div_clk_src",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_npu_gpll0_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_npu_trig_clk = {
 	.halt_reg = 0x4d00c,
 	.halt_check = BRANCH_VOTED,
@@ -3375,12 +3443,16 @@ static struct clk_regmap *gcc_sm8150_clocks[] = {
 	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
 	[GCC_GP3_CLK_SRC] = &gcc_gp3_clk_src.clkr,
 	[GCC_GPU_CFG_AHB_CLK] = &gcc_gpu_cfg_ahb_clk.clkr,
+	[GCC_GPU_GPLL0_CLK_SRC] = &gcc_gpu_gpll0_clk_src.clkr,
+	[GCC_GPU_GPLL0_DIV_CLK_SRC] = &gcc_gpu_gpll0_div_clk_src.clkr,
 	[GCC_GPU_IREF_CLK] = &gcc_gpu_iref_clk.clkr,
 	[GCC_GPU_MEMNOC_GFX_CLK] = &gcc_gpu_memnoc_gfx_clk.clkr,
 	[GCC_GPU_SNOC_DVM_GFX_CLK] = &gcc_gpu_snoc_dvm_gfx_clk.clkr,
 	[GCC_NPU_AT_CLK] = &gcc_npu_at_clk.clkr,
 	[GCC_NPU_AXI_CLK] = &gcc_npu_axi_clk.clkr,
 	[GCC_NPU_CFG_AHB_CLK] = &gcc_npu_cfg_ahb_clk.clkr,
+	[GCC_NPU_GPLL0_CLK_SRC] = &gcc_npu_gpll0_clk_src.clkr,
+	[GCC_NPU_GPLL0_DIV_CLK_SRC] = &gcc_npu_gpll0_div_clk_src.clkr,
 	[GCC_NPU_TRIG_CLK] = &gcc_npu_trig_clk.clkr,
 	[GCC_PCIE0_PHY_REFGEN_CLK] = &gcc_pcie0_phy_refgen_clk.clkr,
 	[GCC_PCIE1_PHY_REFGEN_CLK] = &gcc_pcie1_phy_refgen_clk.clkr,
-- 
2.25.1

