Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD1D136CEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 13:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbgAJMTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 07:19:21 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:23806 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726718AbgAJMTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 07:19:13 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Jan 2020 17:49:07 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Jan 2020 17:48:52 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 1845822B4; Fri, 10 Jan 2020 17:48:51 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v3 1/5] phy: qcom-qusb2: Add QUSB2 PHY support for SC7180
Date:   Fri, 10 Jan 2020 17:48:15 +0530
Message-Id: <1578658699-30458-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using generic cfg table for QUSB2 V2 PHY.
Add QUSB2 PHY config data and compatible for SC7180.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index bf94a52..db4ae26 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017, 2019, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -177,7 +177,7 @@ static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_DIGITAL_TIMERS_TWO, 0x19),
 };
 
-static const unsigned int sdm845_regs_layout[] = {
+static const unsigned int qusb2_v2_regs_layout[] = {
 	[QUSB2PHY_PLL_CORE_INPUT_OVERRIDE] = 0xa8,
 	[QUSB2PHY_PLL_STATUS]		= 0x1a0,
 	[QUSB2PHY_PORT_TUNE1]		= 0x240,
@@ -191,7 +191,7 @@ static const unsigned int sdm845_regs_layout[] = {
 	[QUSB2PHY_INTR_CTRL]		= 0x230,
 };
 
-static const struct qusb2_phy_init_tbl sdm845_init_tbl[] = {
+static const struct qusb2_phy_init_tbl qusb2_v2_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_ANALOG_CONTROLS_TWO, 0x03),
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_CLOCK_INVERTERS, 0x7c),
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_CMODE, 0x80),
@@ -258,10 +258,10 @@ static const struct qusb2_phy_cfg msm8998_phy_cfg = {
 	.update_tune1_with_efuse = true,
 };
 
-static const struct qusb2_phy_cfg sdm845_phy_cfg = {
-	.tbl		= sdm845_init_tbl,
-	.tbl_num	= ARRAY_SIZE(sdm845_init_tbl),
-	.regs		= sdm845_regs_layout,
+static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
+	.tbl		= qusb2_v2_init_tbl,
+	.tbl_num	= ARRAY_SIZE(qusb2_v2_init_tbl),
+	.regs		= qusb2_v2_regs_layout,
 
 	.disable_ctrl	= (PWR_CTRL1_VREF_SUPPLY_TRIM | PWR_CTRL1_CLAMP_N_EN |
 			   POWER_DOWN),
@@ -774,8 +774,14 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 		.compatible	= "qcom,msm8998-qusb2-phy",
 		.data		= &msm8998_phy_cfg,
 	}, {
+		.compatible	= "qcom,sc7180-qusb2-phy",
+		.data		= &qusb2_v2_phy_cfg,
+	}, {
 		.compatible	= "qcom,sdm845-qusb2-phy",
-		.data		= &sdm845_phy_cfg,
+		.data		= &qusb2_v2_phy_cfg,
+	}, {
+		.compatible	= "qcom,qusb2-v2-phy",
+		.data		= &qusb2_v2_phy_cfg,
 	},
 	{ },
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

