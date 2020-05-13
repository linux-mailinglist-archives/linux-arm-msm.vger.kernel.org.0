Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 544791D0914
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 08:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729748AbgEMGym (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 02:54:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:34108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726020AbgEMGyl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 02:54:41 -0400
Received: from localhost.localdomain (unknown [106.200.233.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6C9920784;
        Wed, 13 May 2020 06:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589352880;
        bh=qnqS3DpMoBvxHgMTAOVW6JQPwEA3cMhY3+tWDkwIG1A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Eh/jpJrJopRwW/4GI6f89NPaTIBjS+RRrJ4hy5FrPQSVxwedY8hjkpnZMJ4uq8Goj
         OB5YgeI+J1Ictn0lmJlMcvGdKNCfxh5ts3Hol4iOf2AjCJdeFB5mAHh4PngMRu0yHw
         lts1/FrOUJP2tnSlwiYCRFVktF5Pf0N+NFnXYWJ8=
From:   Vinod Koul <vkoul@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] clk: qcom: gcc: Add missing UFS clocks for SM8150
Date:   Wed, 13 May 2020 12:24:20 +0530
Message-Id: <20200513065420.32735-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200513065420.32735-1-vkoul@kernel.org>
References: <20200513065420.32735-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing ufs card and ufs phy clocks for SM8150. They were missed
in earlier addition of clock driver.

Fixes: 2a1d7eb854bb ("clk: qcom: gcc: Add global clock controller driver for SM8150")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes in v2:
  - Add fixes tag

 drivers/clk/qcom/gcc-sm8150.c | 84 +++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 7c82dd85deaf..2bc08e7125bf 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -2873,6 +2873,45 @@ static struct clk_branch gcc_ufs_card_phy_aux_hw_ctl_clk = {
 	},
 };
 
+/* external clocks so add BRANCH_HALT_SKIP */
+static struct clk_branch gcc_ufs_card_rx_symbol_0_clk = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x7501c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_card_rx_symbol_0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+/* external clocks so add BRANCH_HALT_SKIP */
+static struct clk_branch gcc_ufs_card_rx_symbol_1_clk = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x750ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_card_rx_symbol_1_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+/* external clocks so add BRANCH_HALT_SKIP */
+static struct clk_branch gcc_ufs_card_tx_symbol_0_clk = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x75018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_card_tx_symbol_0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_card_unipro_core_clk = {
 	.halt_reg = 0x75058,
 	.halt_check = BRANCH_HALT,
@@ -3053,6 +3092,45 @@ static struct clk_branch gcc_ufs_phy_phy_aux_hw_ctl_clk = {
 	},
 };
 
+/* external clocks so add BRANCH_HALT_SKIP */
+static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x7701c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_rx_symbol_0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+/* external clocks so add BRANCH_HALT_SKIP */
+static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x770ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_rx_symbol_1_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+/* external clocks so add BRANCH_HALT_SKIP */
+static struct clk_branch gcc_ufs_phy_tx_symbol_0_clk = {
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x77018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ufs_phy_tx_symbol_0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_phy_unipro_core_clk = {
 	.halt_reg = 0x77058,
 	.halt_check = BRANCH_HALT,
@@ -3549,6 +3627,9 @@ static struct clk_regmap *gcc_sm8150_clocks[] = {
 	[GCC_UFS_CARD_PHY_AUX_CLK_SRC] = &gcc_ufs_card_phy_aux_clk_src.clkr,
 	[GCC_UFS_CARD_PHY_AUX_HW_CTL_CLK] =
 		&gcc_ufs_card_phy_aux_hw_ctl_clk.clkr,
+	[GCC_UFS_CARD_RX_SYMBOL_0_CLK] = &gcc_ufs_card_rx_symbol_0_clk.clkr,
+	[GCC_UFS_CARD_RX_SYMBOL_1_CLK] = &gcc_ufs_card_rx_symbol_1_clk.clkr,
+	[GCC_UFS_CARD_TX_SYMBOL_0_CLK] = &gcc_ufs_card_tx_symbol_0_clk.clkr,
 	[GCC_UFS_CARD_UNIPRO_CORE_CLK] = &gcc_ufs_card_unipro_core_clk.clkr,
 	[GCC_UFS_CARD_UNIPRO_CORE_CLK_SRC] =
 		&gcc_ufs_card_unipro_core_clk_src.clkr,
@@ -3566,6 +3647,9 @@ static struct clk_regmap *gcc_sm8150_clocks[] = {
 	[GCC_UFS_PHY_PHY_AUX_CLK] = &gcc_ufs_phy_phy_aux_clk.clkr,
 	[GCC_UFS_PHY_PHY_AUX_CLK_SRC] = &gcc_ufs_phy_phy_aux_clk_src.clkr,
 	[GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK] = &gcc_ufs_phy_phy_aux_hw_ctl_clk.clkr,
+	[GCC_UFS_PHY_RX_SYMBOL_0_CLK] = &gcc_ufs_phy_rx_symbol_0_clk.clkr,
+	[GCC_UFS_PHY_RX_SYMBOL_1_CLK] = &gcc_ufs_phy_rx_symbol_1_clk.clkr,
+	[GCC_UFS_PHY_TX_SYMBOL_0_CLK] = &gcc_ufs_phy_tx_symbol_0_clk.clkr,
 	[GCC_UFS_PHY_UNIPRO_CORE_CLK] = &gcc_ufs_phy_unipro_core_clk.clkr,
 	[GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC] =
 		&gcc_ufs_phy_unipro_core_clk_src.clkr,
-- 
2.25.4

