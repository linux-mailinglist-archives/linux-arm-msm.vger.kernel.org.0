Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4E2119CEA7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 04:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390403AbgDCCYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 22:24:30 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:41356 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390348AbgDCCY2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 22:24:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585880668; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=CVKwdv1dL/6/p21AAAZ4seiEJbEjLRqpVCT2OHJoL4k=; b=iXJsBB402qMbHuXdDQlFfMRuHXFNNL/c/rIT2sEnq4bs5qzsOQ0c1YCy7cOVfL5uYaRukWZY
 U8/okNlyKv5VwI/nsbmRqkoRse/8pUO39apvkLPia4xgHCdSJGTwUGr6Kig7zvf6I5lgUVti
 RpsdR06IOuF9EdSUcEZCFFBrbQc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e869e4b.7f54ee157dc0-smtp-out-n03;
 Fri, 03 Apr 2020 02:24:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8016AC43636; Fri,  3 Apr 2020 02:24:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B8393C43637;
        Fri,  3 Apr 2020 02:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B8393C43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v5 5/5] phy: qcom-qmp: Rename UFS PCS QMP v4 registers
Date:   Thu,  2 Apr 2020 19:23:54 -0700
Message-Id: <1585880634-15222-6-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585880634-15222-1-git-send-email-wcheng@codeaurora.org>
References: <1585880634-15222-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The UFS QMP v4 PHY has a largely different register set versus USB and
PCIe.  Rename the register offsets to denote that the value is specific for
the UFS PCS register.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 20 +++++++++----------
 drivers/phy/qualcomm/phy-qcom-qmp.h | 40 ++++++++++++++++++-------------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 5363a99..9400748 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -174,9 +174,9 @@ enum qphy_reg_layout {
 };
 
 static const unsigned int sm8150_ufsphy_regs_layout[] = {
-	[QPHY_START_CTRL]		= QPHY_V4_PHY_START,
-	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_READY_STATUS,
-	[QPHY_SW_RESET]			= QPHY_V4_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V4_PCS_UFS_PHY_START,
+	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_UFS_READY_STATUS,
+	[QPHY_SW_RESET]			= QPHY_V4_PCS_UFS_SW_RESET,
 };
 
 static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
@@ -971,13 +971,13 @@ enum qphy_reg_layout {
 };
 
 static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V4_RX_SIGDET_CTRL2, 0x6d),
-	QMP_PHY_INIT_CFG(QPHY_V4_TX_LARGE_AMP_DRV_LVL, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V4_TX_SMALL_AMP_DRV_LVL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_V4_TX_MID_TERM_CTRL1, 0x43),
-	QMP_PHY_INIT_CFG(QPHY_V4_DEBUG_BUS_CLKSEL, 0x1f),
-	QMP_PHY_INIT_CFG(QPHY_V4_RX_MIN_HIBERN8_TIME, 0xff),
-	QMP_PHY_INIT_CFG(QPHY_V4_MULTI_LANE_CTRL1, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_DEBUG_BUS_CLKSEL, 0x1f),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_MIN_HIBERN8_TIME, 0xff),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
 };
 
 static const struct qmp_phy_init_tbl sm8150_usb3_serdes_tbl[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 22c9009..d78acbf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -425,26 +425,26 @@
 #define QSERDES_V4_RX_VTH_CODE				0x1c4
 
 /* Only for QMP V4 PHY - UFS PCS registers */
-#define QPHY_V4_PHY_START				0x000
-#define QPHY_V4_POWER_DOWN_CONTROL			0x004
-#define QPHY_V4_SW_RESET				0x008
-#define QPHY_V4_TIMER_20US_CORECLK_STEPS_MSB		0x00c
-#define QPHY_V4_TIMER_20US_CORECLK_STEPS_LSB		0x010
-#define QPHY_V4_PLL_CNTL				0x02c
-#define QPHY_V4_TX_LARGE_AMP_DRV_LVL			0x030
-#define QPHY_V4_TX_SMALL_AMP_DRV_LVL			0x038
-#define QPHY_V4_BIST_FIXED_PAT_CTRL			0x060
-#define QPHY_V4_TX_HSGEAR_CAPABILITY			0x074
-#define QPHY_V4_RX_HSGEAR_CAPABILITY			0x0b4
-#define QPHY_V4_DEBUG_BUS_CLKSEL			0x124
-#define QPHY_V4_LINECFG_DISABLE				0x148
-#define QPHY_V4_RX_MIN_HIBERN8_TIME			0x150
-#define QPHY_V4_RX_SIGDET_CTRL2				0x158
-#define QPHY_V4_TX_PWM_GEAR_BAND			0x160
-#define QPHY_V4_TX_HS_GEAR_BAND				0x168
-#define QPHY_V4_PCS_READY_STATUS			0x180
-#define QPHY_V4_TX_MID_TERM_CTRL1			0x1d8
-#define QPHY_V4_MULTI_LANE_CTRL1			0x1e0
+#define QPHY_V4_PCS_UFS_PHY_START				0x000
+#define QPHY_V4_PCS_UFS_POWER_DOWN_CONTROL			0x004
+#define QPHY_V4_PCS_UFS_SW_RESET				0x008
+#define QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB		0x00c
+#define QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB		0x010
+#define QPHY_V4_PCS_UFS_PLL_CNTL				0x02c
+#define QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL			0x030
+#define QPHY_V4_PCS_UFS_TX_SMALL_AMP_DRV_LVL			0x038
+#define QPHY_V4_PCS_UFS_BIST_FIXED_PAT_CTRL			0x060
+#define QPHY_V4_PCS_UFS_TX_HSGEAR_CAPABILITY			0x074
+#define QPHY_V4_PCS_UFS_RX_HSGEAR_CAPABILITY			0x0b4
+#define QPHY_V4_PCS_UFS_DEBUG_BUS_CLKSEL			0x124
+#define QPHY_V4_PCS_UFS_LINECFG_DISABLE				0x148
+#define QPHY_V4_PCS_UFS_RX_MIN_HIBERN8_TIME			0x150
+#define QPHY_V4_PCS_UFS_RX_SIGDET_CTRL2				0x158
+#define QPHY_V4_PCS_UFS_TX_PWM_GEAR_BAND			0x160
+#define QPHY_V4_PCS_UFS_TX_HS_GEAR_BAND				0x168
+#define QPHY_V4_PCS_UFS_READY_STATUS			0x180
+#define QPHY_V4_PCS_UFS_TX_MID_TERM_CTRL1			0x1d8
+#define QPHY_V4_PCS_UFS_MULTI_LANE_CTRL1			0x1e0
 
 /* Only for QMP V4 PHY - USB/PCIe PCS registers */
 #define QPHY_V4_PCS_SW_RESET				0x000
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
