Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D783FA0FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 23:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbhH0VMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 17:12:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:62447 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231859AbhH0VMW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 17:12:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630098693; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=LDAlhOovU1pCsnAF73lo+H2/9n+lPdFdscbNgyJUYIU=; b=NqmYLRp1DON3vfCbw2wFTLGFAfDXIBvxCF666/mjQkUy+HD1nn6YyM56XDmauZfA/Cyv0e1q
 XJb8NOe6djPT71zChDxi4PZdWMe6quBsjoilX+ZGsEGBewDAGR33slEmCdYc8IB2swgd5o2f
 1ZlCfgo0wUAzek11Rq5sIOeJNy4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 612954eb4d644b7d1c7a5f38 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Aug 2021 21:11:07
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5F9C3C4360D; Fri, 27 Aug 2021 21:11:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D5E66C4338F;
        Fri, 27 Aug 2021 21:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D5E66C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kishon@ti.com, p.zabel@pengutronix.de
Subject: [PATCH v2] phy: qcom-qmp: add support for display port voltage and pre-emphasis swing
Date:   Fri, 27 Aug 2021 14:10:58 -0700
Message-Id: <1630098658-23149-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Both voltage and pre-emphasis swing level are set during link training
negotiation between host and sink. There are totally four tables added.
A voltage swing table for both hbr and hbr1, a voltage table for both
hbr2 and hbr3, a pre-emphasis table for both hbr and hbr1 and a pre-emphasis
table for both hbr2 and hbr3. In addition, write 0x0a to TX_TX_POL_INV is
added to complete the sequence of configure dp phy base on HPG.

Chnages in v2:
-- revise commit test
-- add Fixes tag
-- replaced voltage_swing_cfg with voltage
-- replaced pre_emphasis_cfg with emphasis
-- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_v4_phy_configure_dp_swing()
-- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_phy_configure_dp_swing()

Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 117 ++++++++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 31036aa..021cbb0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3546,12 +3546,11 @@ static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
 	{ 0x1f, 0xff, 0xff, 0xff }
 };
 
-static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
-		unsigned int drv_lvl_reg, unsigned int emp_post_reg)
+static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
 	unsigned int v_level = 0, p_level = 0;
-	u8 voltage_swing_cfg, pre_emphasis_cfg;
+	u8 voltage, emphasis;
 	int i;
 
 	for (i = 0; i < dp_opts->lanes; i++) {
@@ -3560,26 +3559,25 @@ static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
 	}
 
 	if (dp_opts->link_rate <= 2700) {
-		voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
-		pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
+		voltage = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
+		emphasis = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
 	} else {
-		voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr3_hbr2[v_level][p_level];
-		pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr3_hbr2[v_level][p_level];
+		voltage = qmp_dp_v3_voltage_swing_hbr3_hbr2[v_level][p_level];
+		emphasis = qmp_dp_v3_pre_emphasis_hbr3_hbr2[v_level][p_level];
 	}
 
 	/* TODO: Move check to config check */
-	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
+	if (voltage == 0xFF && emphasis == 0xFF)
 		return -EINVAL;
 
 	/* Enable MUX to use Cursor values from these registers */
-	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
-	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
-
-	writel(voltage_swing_cfg, qphy->tx + drv_lvl_reg);
-	writel(pre_emphasis_cfg, qphy->tx + emp_post_reg);
-	writel(voltage_swing_cfg, qphy->tx2 + drv_lvl_reg);
-	writel(pre_emphasis_cfg, qphy->tx2 + emp_post_reg);
+	voltage |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
+	emphasis |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
 
+	writel(voltage, qphy->tx + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(emphasis, qphy->tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
+	writel(voltage, qphy->tx2 + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(emphasis, qphy->tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
 	return 0;
 }
 
@@ -3588,9 +3586,7 @@ static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
 	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
 	u32 bias_en, drvr_en;
 
-	if (qcom_qmp_phy_configure_dp_swing(qphy,
-				QSERDES_V3_TX_TX_DRV_LVL,
-				QSERDES_V3_TX_TX_EMP_POST1_LVL) < 0)
+	if (qcom_qmp_phy_configure_dp_swing(qphy) < 0)
 		return;
 
 	if (dp_opts->lanes == 1) {
@@ -3728,6 +3724,71 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
 	return 0;
 }
 
+/* The values in these tables are given without MUX_EN (0x20) bit set */
+static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[4][4] = {
+	{ 0x00, 0x0c, 0x15, 0x1b },
+	{ 0x02, 0x0e, 0x16, 0xff },
+	{ 0x02, 0x11, 0xff, 0xff },
+	{ 0x04, 0xff, 0xff, 0xff }
+};
+
+static const u8 qmp_dp_v4_voltage_swing_hbr3_hbr2[4][4] = {
+	{ 0x02, 0x12, 0x16, 0x1a },
+	{ 0x09, 0x19, 0x1f, 0xff },
+	{ 0x10, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[4][4] = {
+	{ 0x00, 0x0e, 0x15, 0x1b },
+	{ 0x00, 0x0e, 0x15, 0xff },
+	{ 0x00, 0x0e, 0xff, 0xff },
+	{ 0x04, 0xff, 0xff, 0xff }
+};
+
+static const u8 qmp_dp_v4_voltage_swing_hbr_rbr[4][4] = {
+	{ 0x08, 0x0f, 0x16, 0x1f },
+	{ 0x11, 0x1e, 0x1f, 0xff },
+	{ 0x16, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+static int qcom_qmp_v4_phy_configure_dp_swing(struct qmp_phy *qphy)
+{
+	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	unsigned int v_level = 0, p_level = 0;
+	u8 voltage, emphasis;
+	int i;
+
+	for (i = 0; i < dp_opts->lanes; i++) {
+		v_level = max(v_level, dp_opts->voltage[i]);
+		p_level = max(p_level, dp_opts->pre[i]);
+	}
+
+	if (dp_opts->link_rate <= 2700) {
+		voltage = qmp_dp_v4_voltage_swing_hbr_rbr[v_level][p_level];
+		emphasis = qmp_dp_v4_pre_emphasis_hbr_rbr[v_level][p_level];
+	} else {
+		voltage = qmp_dp_v4_voltage_swing_hbr3_hbr2[v_level][p_level];
+		emphasis = qmp_dp_v4_pre_emphasis_hbr3_hbr2[v_level][p_level];
+	}
+
+	/* TODO: Move check to config check */
+	if (voltage == 0xFF && emphasis == 0xFF)
+		return -EINVAL;
+
+	/* Enable MUX to use Cursor values from these registers */
+	voltage |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
+	emphasis |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
+
+	writel(voltage, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
+	writel(emphasis, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+	writel(voltage, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
+	writel(emphasis, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+
+	return 0;
+}
+
 static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
 {
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
@@ -3757,16 +3818,7 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
 
 static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
 {
-	/* Program default values before writing proper values */
-	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
-	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
-
-	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
-	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
-
-	qcom_qmp_phy_configure_dp_swing(qphy,
-			QSERDES_V4_TX_TX_DRV_LVL,
-			QSERDES_V4_TX_TX_EMP_POST1_LVL);
+	qcom_qmp_v4_phy_configure_dp_swing(qphy);
 }
 
 static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
@@ -3885,6 +3937,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
 	writel(drvr1_en, qphy->tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
 	writel(bias1_en, qphy->tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
 
+	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
+	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
+
 	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
 	udelay(2000);
 	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
@@ -3896,11 +3951,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
 			10000))
 		return -ETIMEDOUT;
 
-	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
-	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
 
-	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
-	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
+	writel(0x22, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
+	writel(0x22, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
 
 	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
 	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

