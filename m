Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32876305E3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 15:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbhA0O07 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 09:26:59 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:58879 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231940AbhA0O0Z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 09:26:25 -0500
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id BF68E44045F;
        Wed, 27 Jan 2021 16:25:40 +0200 (IST)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Kathiravan T <kathirav@codeaurora.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] phy: qcom-qusb2: add QUSB2 support for IPQ6018
Date:   Wed, 27 Jan 2021 16:20:27 +0200
Message-Id: <b8c22dddf1f70d89e135fe1ae705ddc68e295ebb.1611756920.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611756920.git.baruch@tkos.co.il>
References: <cover.1611756920.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Kathiravan T <kathirav@codeaurora.org>

Add the phy init sequence for the Super Speed ports found
on IPQ6018.

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
[baruch: add ipq6018_regs_layout[], drop binding change]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 719e0888ed87..8f1bf7e2186b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -22,6 +22,7 @@
 
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 
+#define QUSB2PHY_PLL			0x0
 #define QUSB2PHY_PLL_TEST		0x04
 #define CLK_REF_SEL			BIT(7)
 
@@ -135,6 +136,35 @@ enum qusb2phy_reg_layout {
 	QUSB2PHY_INTR_CTRL,
 };
 
+static const struct qusb2_phy_init_tbl ipq6018_init_tbl[] = {
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL, 0x14),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xF8),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0xB3),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE3, 0x83),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xC0),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE5, 0x00),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TEST2, 0x14),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TEST, 0x80),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9F),
+};
+
+static const unsigned int ipq6018_regs_layout[] = {
+	[QUSB2PHY_PLL_STATUS]              = 0x38,
+	[QUSB2PHY_PORT_TUNE1]              = 0x80,
+	[QUSB2PHY_PORT_TUNE2]              = 0x84,
+	[QUSB2PHY_PORT_TUNE3]              = 0x88,
+	[QUSB2PHY_PORT_TUNE4]              = 0x8C,
+	[QUSB2PHY_PORT_TUNE5]              = 0x90,
+	[QUSB2PHY_PORT_TEST1]              = 0x98,
+	[QUSB2PHY_PORT_TEST2]              = 0x9C,
+	[QUSB2PHY_PORT_POWERDOWN]          = 0xB4,
+	[QUSB2PHY_INTR_CTRL]               = 0xBC,
+};
+
 static const unsigned int msm8996_regs_layout[] = {
 	[QUSB2PHY_PLL_STATUS]		= 0x38,
 	[QUSB2PHY_PORT_TUNE1]		= 0x80,
@@ -275,6 +305,17 @@ static const struct qusb2_phy_cfg msm8998_phy_cfg = {
 	.update_tune1_with_efuse = true,
 };
 
+static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
+	.tbl            = ipq6018_init_tbl,
+	.tbl_num        = ARRAY_SIZE(ipq6018_init_tbl),
+	.regs           = ipq6018_regs_layout,
+
+	.disable_ctrl   = POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+	/* autoresume not used */
+	.autoresume_en   = BIT(0),
+};
+
 static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
 	.tbl		= qusb2_v2_init_tbl,
 	.tbl_num	= ARRAY_SIZE(qusb2_v2_init_tbl),
@@ -833,6 +874,9 @@ static const struct phy_ops qusb2_phy_gen_ops = {
 
 static const struct of_device_id qusb2_phy_of_match_table[] = {
 	{
+		.compatible	= "qcom,ipq6018-qusb2-phy",
+		.data		= &ipq6018_phy_cfg,
+	}, {
 		.compatible	= "qcom,ipq8074-qusb2-phy",
 		.data		= &msm8996_phy_cfg,
 	}, {
-- 
2.29.2

