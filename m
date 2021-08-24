Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C833F6C3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 01:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233909AbhHXXab (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 19:30:31 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43150 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233155AbhHXXaa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 19:30:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629847786; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MpajW2p+32NRK+oUpwg2nsXF4TJtxexKEkFdJTl7JZA=; b=ck47XflCaUypQYnbwpgKmBpxRZFsUmIaTq2s7KsBuxTRNQuBIc6VdkHig+brYeiO0cmbJS1Q
 gk2wmxyQiphGTfJ/G96UCWaMlcRQokv07chJGowAVW/0DcAwqxPeQDDmm0JhGQOfvCRkFoSU
 /ZSYTyh0ow3AQFx/T87KOs479dY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 612580e840d2129ac1adf521 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Aug 2021 23:29:44
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ED2D9C4338F; Tue, 24 Aug 2021 23:29:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E796AC4338F;
        Tue, 24 Aug 2021 23:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E796AC4338F
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
Subject: [PATCH] phy: qcom-qmp: add support for voltage and pre emphesis swing
Date:   Tue, 24 Aug 2021 16:29:35 -0700
Message-Id: <1629847775-16767-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add voltage and pre emphesis swing tables so that voltage and
pre emphsis swing level can be configured base on link rate.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 95 ++++++++++++++++++++++++++++++++-----
 1 file changed, 82 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 31036aa..52bab6e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1916,7 +1916,7 @@ static const struct qmp_phy_init_tbl qmp_v4_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x11),
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_BAND, 0x4),
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_POL_INV, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_DRV_LVL, 0x2a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_DRV_LVL, 0x22),
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_EMP_POST1_LVL, 0x20),
 };
 
@@ -3727,6 +3727,81 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
 
 	return 0;
 }
+/*
+ * 0x20 deducted from tables
+ *
+ * swing_value |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
+ * pre_emphasis_value |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
+*/
+static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[4][4] = {
+	/* p0    p1    p2    p3 */
+	{ 0x00, 0x0c, 0x15, 0x1b },	/* s0 */
+	{ 0x02, 0x0e, 0x16, 0xff },	/* s1 */
+	{ 0x02, 0x11, 0xff, 0xff },	/* s2 */
+	{ 0x04, 0xff, 0xff, 0xff }	/* s3 */
+};
+
+static const u8 qmp_dp_v4_voltage_swing_hbr3_hbr2[4][4] = {
+	/* p0    p1    p2    p3 */
+	{ 0x02, 0x12, 0x16, 0x1a },	/* s0 */
+	{ 0x09, 0x19, 0x1f, 0xff },	/* s1 */
+	{ 0x10, 0x1f, 0xff, 0xff },	/* s2 */
+	{ 0x1f, 0xff, 0xff, 0xff }	/* s3 */
+};
+
+static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[4][4] = {
+	/* p0    p1    p2    p3 */
+	{ 0x00, 0x0e, 0x15, 0x1b },	/* s0 */
+	{ 0x00, 0x0e, 0x15, 0xff },	/* s1 */
+	{ 0x00, 0x0e, 0xff, 0xff },	/* s2 */
+	{ 0x04, 0xff, 0xff, 0xff }	/* s3 */
+};
+
+static const u8 qmp_dp_v4_voltage_swing_hbr_rbr[4][4] = {
+	/* p0    p1    p2    p3 */
+	{ 0x08, 0x0f, 0x16, 0x1f },	/* s0 */
+	{ 0x11, 0x1e, 0x1f, 0xff },	/* s1 */
+	{ 0x16, 0x1f, 0xff, 0xff },	/* s2 */
+	{ 0x1f, 0xff, 0xff, 0xff }	/* s3 */
+};
+
+static int qcom_qmp_v4_phy_configure_dp_swing(struct qmp_phy *qphy,
+		unsigned int drv_lvl_reg, unsigned int emp_post_reg)
+{
+	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	unsigned int v_level = 0, p_level = 0;
+	u8 voltage_swing_cfg, pre_emphasis_cfg;
+	int i;
+
+	for (i = 0; i < dp_opts->lanes; i++) {
+		v_level = max(v_level, dp_opts->voltage[i]);
+		p_level = max(p_level, dp_opts->pre[i]);
+	}
+
+
+	if (dp_opts->link_rate <= 2700) {
+		voltage_swing_cfg = qmp_dp_v4_voltage_swing_hbr_rbr[v_level][p_level];
+		pre_emphasis_cfg = qmp_dp_v4_pre_emphasis_hbr_rbr[v_level][p_level];
+	} else {
+		voltage_swing_cfg = qmp_dp_v4_voltage_swing_hbr3_hbr2[v_level][p_level];
+		pre_emphasis_cfg = qmp_dp_v4_pre_emphasis_hbr3_hbr2[v_level][p_level];
+	}
+
+	/* TODO: Move check to config check */
+	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
+		return -EINVAL;
+
+	/* Enable MUX to use Cursor values from these registers */
+	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
+	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
+
+	writel(voltage_swing_cfg, qphy->tx + drv_lvl_reg);
+	writel(pre_emphasis_cfg, qphy->tx + emp_post_reg);
+	writel(voltage_swing_cfg, qphy->tx2 + drv_lvl_reg);
+	writel(pre_emphasis_cfg, qphy->tx2 + emp_post_reg);
+
+	return 0;
+}
 
 static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
 {
@@ -3757,14 +3832,7 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
 
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
+	qcom_qmp_v4_phy_configure_dp_swing(qphy,
 			QSERDES_V4_TX_TX_DRV_LVL,
 			QSERDES_V4_TX_TX_EMP_POST1_LVL);
 }
@@ -3885,6 +3953,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
 	writel(drvr1_en, qphy->tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
 	writel(bias1_en, qphy->tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
 
+	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
+	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
+
 	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
 	udelay(2000);
 	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
@@ -3896,11 +3967,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
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

