Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F223D2F6824
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 18:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbhANRsr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 12:48:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728767AbhANRsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 12:48:39 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA37C061786
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 09:47:28 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5CC7F1F4CD;
        Thu, 14 Jan 2021 18:47:25 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, kishon@ti.com, vkoul@kernel.org,
        robh+dt@kernel.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, marijn.suijten@somainline.org,
        phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 1/3] phy: qcom-qusb2: Allow specifying default clock scheme
Date:   Thu, 14 Jan 2021 18:47:16 +0100
Message-Id: <20210114174718.398638-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TCSR's PHY_CLK_SCHEME register is not available on all SoC
models, but some may still use a differential reference clock.

In preparation for these SoCs, add a se_clk_scheme_default
configuration entry and declare it to true for all currently
supported SoCs (retaining the previous defaults.

This patch brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 109792203baf..8fcfea2a8f1f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -245,6 +245,9 @@ struct qusb2_phy_cfg {
 
 	/* true if PHY has PLL_CORE_INPUT_OVERRIDE register to reset PLL */
 	bool has_pll_override;
+
+	/* true if PHY default clk scheme is single-ended */
+	bool se_clk_scheme_default;
 };
 
 static const struct qusb2_phy_cfg msm8996_phy_cfg = {
@@ -253,6 +256,7 @@ static const struct qusb2_phy_cfg msm8996_phy_cfg = {
 	.regs		= msm8996_regs_layout,
 
 	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
 	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
 	.autoresume_en	 = BIT(3),
@@ -266,6 +270,7 @@ static const struct qusb2_phy_cfg msm8998_phy_cfg = {
 	.disable_ctrl   = POWER_DOWN,
 	.mask_core_ready = CORE_READY_STATUS,
 	.has_pll_override = true,
+	.se_clk_scheme_default = true,
 	.autoresume_en   = BIT(0),
 	.update_tune1_with_efuse = true,
 };
@@ -279,6 +284,7 @@ static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
 			   POWER_DOWN),
 	.mask_core_ready = CORE_READY_STATUS,
 	.has_pll_override = true,
+	.se_clk_scheme_default = true,
 	.autoresume_en	  = BIT(0),
 	.update_tune1_with_efuse = true,
 };
@@ -701,8 +707,13 @@ static int qusb2_phy_init(struct phy *phy)
 	/* Required to get phy pll lock successfully */
 	usleep_range(150, 160);
 
-	/* Default is single-ended clock on msm8996 */
-	qphy->has_se_clk_scheme = true;
+	/*
+	 * Not all the SoCs have got a readable TCSR_PHY_CLK_SCHEME
+	 * register in the TCSR so, if there's none, use the default
+	 * value hardcoded in the configuration.
+	 */
+	qphy->has_se_clk_scheme = cfg->se_clk_scheme_default;
+
 	/*
 	 * read TCSR_PHY_CLK_SCHEME register to check if single-ended
 	 * clock scheme is selected. If yes, then disable differential
-- 
2.29.2

