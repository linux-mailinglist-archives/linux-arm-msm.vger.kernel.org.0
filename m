Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34EA317DCB3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 10:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgCIJyL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 05:54:11 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:55524 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726545AbgCIJyK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 05:54:10 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Mar 2020 15:24:02 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 09 Mar 2020 15:23:43 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id A741B245A; Mon,  9 Mar 2020 15:23:42 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v5 3/9] phy: qcom-qusb2: Add generic QUSB2 V2 PHY support
Date:   Mon,  9 Mar 2020 15:23:03 +0530
Message-Id: <1583747589-17267-4-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add generic QUSB2 V2 PHY table so the respective phys
can use the same table.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index bf94a52..70c9da6 100644
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
@@ -774,8 +774,8 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 		.compatible	= "qcom,msm8998-qusb2-phy",
 		.data		= &msm8998_phy_cfg,
 	}, {
-		.compatible	= "qcom,sdm845-qusb2-phy",
-		.data		= &sdm845_phy_cfg,
+		.compatible	= "qcom,qusb2-v2-phy",
+		.data		= &qusb2_v2_phy_cfg,
 	},
 	{ },
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

