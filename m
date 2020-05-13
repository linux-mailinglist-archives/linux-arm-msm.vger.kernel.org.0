Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 511871D0910
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 08:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgEMGyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 02:54:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:34034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729367AbgEMGyi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 02:54:38 -0400
Received: from localhost.localdomain (unknown [106.200.233.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B64A20708;
        Wed, 13 May 2020 06:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589352877;
        bh=22+HUZ7CroqaJ9Md5zbkNTrqb86GmjlwQWZmqM3ms+g=;
        h=From:To:Cc:Subject:Date:From;
        b=YuM9peVHpnfWYVgcL/DOKy592qks+dgV9GiTuuDuop8qcwMzRkZB//iifzgpfkJZH
         9fhYxi6QzaojhRjPwBJ8Aqtdy62X+YVzosn+JO65+/ep8cDHEaHdK2FA4+5jZjNJGl
         ihEgNipSM4btV3fcXx2VTeeDlKM5yhONRxkOWjGE=
From:   Vinod Koul <vkoul@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] clk: qcom: gcc: Add GPU and NPU clocks for SM8150
Date:   Wed, 13 May 2020 12:24:19 +0530
Message-Id: <20200513065420.32735-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the GPU and NPU clocks for SM8150. They were missed in earlier
addition of clock driver.

Fixes: 2a1d7eb854bb ("clk: qcom: gcc: Add global clock controller driver for SM8150")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes in v2:
  - add fixes tag
  - remove BRANCH_HALT_SKIP from these clk

 drivers/clk/qcom/gcc-sm8150.c | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index ef98fdc51755..7c82dd85deaf 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -1617,6 +1617,36 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_gpu_gpll0_clk_src = {
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
+static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
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
@@ -1699,6 +1729,36 @@ static struct clk_branch gcc_npu_cfg_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_npu_gpll0_clk_src = {
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
+static struct clk_branch gcc_npu_gpll0_div_clk_src = {
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
@@ -3375,12 +3435,16 @@ static struct clk_regmap *gcc_sm8150_clocks[] = {
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
2.25.4

