Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11BF6113AE9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 05:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728892AbfLEEnC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 23:43:02 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:44874 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728862AbfLEEnC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 23:43:02 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Dec 2019 10:12:56 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 05 Dec 2019 10:12:36 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 3ED561A09; Thu,  5 Dec 2019 10:12:35 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v2 1/3] phy: qcom-qusb2: Add QUSB2 PHY support for SC7180
Date:   Thu,  5 Dec 2019 10:11:19 +0530
Message-Id: <1575520881-31458-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575520881-31458-1-git-send-email-sanm@codeaurora.org>
References: <1575520881-31458-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QUSB2 PHY config data and compatible for SC7180.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 57 ++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index bf94a52..32a567b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -177,6 +177,41 @@ static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_DIGITAL_TIMERS_TWO, 0x19),
 };
 
+static const unsigned int sc7180_regs_layout[] = {
+	[QUSB2PHY_PLL_CORE_INPUT_OVERRIDE] = 0xa8,
+	[QUSB2PHY_PLL_STATUS]		= 0x1a0,
+	[QUSB2PHY_PORT_TUNE1]		= 0x240,
+	[QUSB2PHY_PORT_TUNE2]		= 0x244,
+	[QUSB2PHY_PORT_TUNE3]		= 0x248,
+	[QUSB2PHY_PORT_TUNE4]		= 0x24c,
+	[QUSB2PHY_PORT_TUNE5]		= 0x250,
+	[QUSB2PHY_PORT_TEST1]		= 0x254,
+	[QUSB2PHY_PORT_TEST2]		= 0x258,
+	[QUSB2PHY_PORT_POWERDOWN]	= 0x210,
+	[QUSB2PHY_INTR_CTRL]		= 0x230,
+};
+
+static const struct qusb2_phy_init_tbl sc7180_init_tbl[] = {
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_ANALOG_CONTROLS_TWO, 0x03),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_CLOCK_INVERTERS, 0x7c),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_CMODE, 0x80),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_LOCK_DELAY, 0x0a),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_DIGITAL_TIMERS_TWO, 0x19),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_BIAS_CONTROL_1, 0x40),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_BIAS_CONTROL_2, 0x22),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PWR_CTRL2, 0x21),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_IMP_CTRL1, 0x08),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_IMP_CTRL2, 0x58),
+
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xc5),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x29),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE3, 0xca),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0x04),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE5, 0x03),
+
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_CHG_CTRL2, 0x30),
+};
+
 static const unsigned int sdm845_regs_layout[] = {
 	[QUSB2PHY_PLL_CORE_INPUT_OVERRIDE] = 0xa8,
 	[QUSB2PHY_PLL_STATUS]		= 0x1a0,
@@ -212,6 +247,8 @@ static const struct qusb2_phy_init_tbl sdm845_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_CHG_CTRL2, 0x0),
 };
 
+
+
 struct qusb2_phy_cfg {
 	const struct qusb2_phy_init_tbl *tbl;
 	/* number of entries in the table */
@@ -258,6 +295,19 @@ static const struct qusb2_phy_cfg msm8998_phy_cfg = {
 	.update_tune1_with_efuse = true,
 };
 
+static const struct qusb2_phy_cfg sc7180_phy_cfg = {
+	.tbl		= sc7180_init_tbl,
+	.tbl_num	= ARRAY_SIZE(sc7180_init_tbl),
+	.regs		= sc7180_regs_layout,
+
+	.disable_ctrl	= (PWR_CTRL1_VREF_SUPPLY_TRIM | PWR_CTRL1_CLAMP_N_EN |
+			   POWER_DOWN),
+	.mask_core_ready = CORE_READY_STATUS,
+	.has_pll_override = true,
+	.autoresume_en	  = BIT(0),
+	.update_tune1_with_efuse = true,
+};
+
 static const struct qusb2_phy_cfg sdm845_phy_cfg = {
 	.tbl		= sdm845_init_tbl,
 	.tbl_num	= ARRAY_SIZE(sdm845_init_tbl),
@@ -271,6 +321,8 @@ static const struct qusb2_phy_cfg sdm845_phy_cfg = {
 	.update_tune1_with_efuse = true,
 };
 
+
+
 static const char * const qusb2_phy_vreg_names[] = {
 	"vdda-pll", "vdda-phy-dpdm",
 };
@@ -774,6 +826,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 		.compatible	= "qcom,msm8998-qusb2-phy",
 		.data		= &msm8998_phy_cfg,
 	}, {
+		.compatible	= "qcom,sc7180-qusb2-phy",
+		.data		= &sc7180_phy_cfg,
+	}, {
 		.compatible	= "qcom,sdm845-qusb2-phy",
 		.data		= &sdm845_phy_cfg,
 	},
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

