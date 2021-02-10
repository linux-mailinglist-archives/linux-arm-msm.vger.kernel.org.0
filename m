Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA10B316AF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 17:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbhBJQRo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 11:17:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:55958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232184AbhBJQRl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 11:17:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A627C64E05;
        Wed, 10 Feb 2021 16:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612973820;
        bh=hh4UIkJdtViE9hIUqy2HP352No8PkABh6qI6Cce0cZI=;
        h=From:To:Cc:Subject:Date:From;
        b=Y0XyTvfrhIwcX/ppb49PkzQCYxWXkGOEC5KujWcwQziC033w4IUoJ7IP5Gje3b8RK
         1qWyy5fi6A4/l5c38FstWJSoQjQvLXvsjtGH3wZWQmjtGPKkMyIye2OW52T3+M5nx9
         qg6yFU4d3E/XKy0rxPesbQCl4kQc3pdITqXzfJuhiXeWza+qjX9cg6eQab/Uo9oUwX
         sm5Q9rRLiMwvdfx/YipLKMIkLRQ71tvkwaqWihjTweMtJgiXgARPLmT/5eAKwanOZa
         wojusx2hbVfr3HIe6nXGWrVS5rxBOADCFwNsnb6SWI5CPH/s1gS/kIUA5KWoFD+bt4
         P2kZoh+e8tjMA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sm8350: add gdsc
Date:   Wed, 10 Feb 2021 21:46:49 +0530
Message-Id: <20210210161649.431741-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the GDSC found in GCC for SM8350 SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/gcc-sm8350.c               | 100 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8350.h |  12 +++
 2 files changed, 112 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index a16c08651206..1c23b9f84900 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -16,6 +16,7 @@
 #include "clk-regmap.h"
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
+#include "gdsc.h"
 #include "reset.h"
 
 enum {
@@ -3452,6 +3453,90 @@ static struct clk_branch gcc_video_axi1_clk = {
 	},
 };
 
+static struct gdsc pcie_0_gdsc = {
+	.gdscr = 0x6b004,
+	.pd = {
+		.name = "pcie_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc pcie_1_gdsc = {
+	.gdscr = 0x8d004,
+	.pd = {
+		.name = "pcie_1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc ufs_card_gdsc = {
+	.gdscr = 0x75004,
+	.pd = {
+		.name = "ufs_card_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc ufs_phy_gdsc = {
+	.gdscr = 0x77004,
+	.pd = {
+		.name = "ufs_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc usb30_prim_gdsc = {
+	.gdscr = 0xf004,
+	.pd = {
+		.name = "usb30_prim_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc usb30_sec_gdsc = {
+	.gdscr = 0x10004,
+	.pd = {
+		.name = "usb30_sec_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
+	.gdscr = 0x7d050,
+	.pd = {
+		.name = "hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
+	.gdscr = 0x7d058,
+	.pd = {
+		.name = "hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf0_gdsc = {
+	.gdscr = 0x7d054,
+	.pd = {
+		.name = "hlos1_vote_mmnoc_mmu_tbu_sf0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf1_gdsc = {
+	.gdscr = 0x7d06c,
+	.pd = {
+		.name = "hlos1_vote_mmnoc_mmu_tbu_sf1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
 static struct clk_regmap *gcc_sm8350_clocks[] = {
 	[GCC_AGGRE_NOC_PCIE_0_AXI_CLK] = &gcc_aggre_noc_pcie_0_axi_clk.clkr,
 	[GCC_AGGRE_NOC_PCIE_1_AXI_CLK] = &gcc_aggre_noc_pcie_1_axi_clk.clkr,
@@ -3646,6 +3731,19 @@ static struct clk_regmap *gcc_sm8350_clocks[] = {
 	[GCC_VIDEO_AXI1_CLK] = &gcc_video_axi1_clk.clkr,
 };
 
+static struct gdsc *gcc_sm8350_gdscs[] = {
+	[PCIE_0_GDSC] = &pcie_0_gdsc,
+	[PCIE_1_GDSC] = &pcie_1_gdsc,
+	[UFS_CARD_GDSC] = &ufs_card_gdsc,
+	[UFS_PHY_GDSC] = &ufs_phy_gdsc,
+	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
+	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
+	[HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc,
+	[HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc,
+	[HLOS1_VOTE_MMNOC_MMU_TBU_SF0_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_sf0_gdsc,
+	[HLOS1_VOTE_MMNOC_MMU_TBU_SF1_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_sf1_gdsc,
+};
+
 static const struct qcom_reset_map gcc_sm8350_resets[] = {
 	[GCC_CAMERA_BCR] = { 0x26000 },
 	[GCC_DISPLAY_BCR] = { 0x27000 },
@@ -3724,6 +3822,8 @@ static const struct qcom_cc_desc gcc_sm8350_desc = {
 	.num_clks = ARRAY_SIZE(gcc_sm8350_clocks),
 	.resets = gcc_sm8350_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8350_resets),
+	.gdscs = gcc_sm8350_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_sm8350_gdscs),
 };
 
 static const struct of_device_id gcc_sm8350_match_table[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-sm8350.h b/include/dt-bindings/clock/qcom,gcc-sm8350.h
index 1331da65f669..f6be3da5f781 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8350.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8350.h
@@ -251,4 +251,16 @@
 #define GCC_VIDEO_AXI1_CLK_ARES					36
 #define GCC_VIDEO_BCR						37
 
+/* GCC power domains */
+#define PCIE_0_GDSC						0
+#define PCIE_1_GDSC						1
+#define UFS_CARD_GDSC						2
+#define UFS_PHY_GDSC						3
+#define USB30_PRIM_GDSC						4
+#define USB30_SEC_GDSC						5
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC			6
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC			7
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF0_GDSC			8
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF1_GDSC			9
+
 #endif
-- 
2.26.2

