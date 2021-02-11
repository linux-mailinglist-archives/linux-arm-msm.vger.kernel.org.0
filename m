Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084ED319419
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhBKUQY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:16:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhBKUQV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:16:21 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22D3C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 12:15:40 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j19so9899960lfr.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 12:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ldXNCRkPJBsbhnS8NLhePECWR8hZ7IF9ZZ3iNWCfBuk=;
        b=vYnlTVYAjLujJlYiomryInoQZqbPWPtSX1BYanXHnEsRtGFyEy9VkWF6lKk0fY1r3o
         Zhy1Z39aodYe+hGkTUCQKWHoQhzt3h4Id/3ZIzFr1Rr+GARKO9C9SV+ZmXKLVamlnkLK
         xREwQVTmX+G/Y9QWaxezM0q32iv//MBpV/NI4pcAnd33LwD7qovMSx4jSY1mCgdrlQ1O
         2kRk0PKldoQpXd0Y2pPuZtejYECFWiA2xBcHEjyI5qJGO36+oI6BegvIw/vF66KSTe+D
         6/wEcKlosWpmErD37yWnAPQ3QI/0raBkoosdq4CyTi+TMZNt3PQ6UenquDwkzC1dLo0h
         4k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ldXNCRkPJBsbhnS8NLhePECWR8hZ7IF9ZZ3iNWCfBuk=;
        b=XMAIgn0MIEeGTw6EH/X5mPjPMJVUuP8nKEf1NTlangfcbKmzcREWEaJE2RcZOYlSG5
         CSdaUKiOf+hhAnGipTUIDRn3sPJU3ZolvKmK8F4iDrSzcysHv1blQGahIhvF5gQhlNRN
         U0Cq4/jYlB7eQ7pWkiYNY3Xwag7RIbZq7RZIZuBHEqZilbH0IeyJRcKEUruXTavtEizh
         5UpMHSDGUR+Z2I7R24SfRbUABz111ByEUo6gZkyB8i9S9zznU9dRnZfP9jO9tMM1Ww4D
         Mtw+EuttYmMXpYPK8lpk00rYCUfdud+P8uTtUsHqu+iHtRBVb2TUzZHUKA4PilDOG9Ix
         uzqw==
X-Gm-Message-State: AOAM531PQ41X2jtzOQmmeZgtNDcGqIQHzwrHPQVQ/rl2i3rpc8RrgyVl
        7hWmHmo4XZI37X95OAPhqFaTOA==
X-Google-Smtp-Source: ABdhPJza6lC+p5koQQovDEitLxAms9/wP7EACQjja0auODL34PXejteKB9cRq0wws7Naq0kFgbBAdQ==
X-Received: by 2002:a19:c197:: with SMTP id r145mr4941050lff.315.1613074539151;
        Thu, 11 Feb 2021 12:15:39 -0800 (PST)
Received: from localhost.localdomain ([188.162.64.15])
        by smtp.gmail.com with ESMTPSA id y27sm745029lfg.273.2021.02.11.12.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 12:15:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] phy: qcom-qmp: move DP functions to callbacks
Date:   Thu, 11 Feb 2021 23:15:34 +0300
Message-Id: <20210211201535.1780797-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation to adding support for V4 DP PHY move DP functions to
callbacks at struct qmp_phy_cfg.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 438 +++++++++++++++-------------
 1 file changed, 231 insertions(+), 207 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 9cdebe7f26cb..4150096fd350 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -2268,6 +2268,8 @@ static const struct qmp_phy_init_tbl sm8350_usb3_uniphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
 };
 
+struct qmp_phy;
+
 /* struct qmp_phy_cfg - per-PHY initialization config */
 struct qmp_phy_cfg {
 	/* phy-type - PCIE/UFS/USB */
@@ -2307,6 +2309,12 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_init_tbl *serdes_tbl_hbr3;
 	int serdes_tbl_hbr3_num;
 
+	/* DP PHY callbacks */
+	int (*configure_dp_phy)(struct qmp_phy *qphy);
+	void (*configure_dp_tx)(struct qmp_phy *qphy);
+	int (*calibrate_dp_phy)(struct qmp_phy *qphy);
+	void (*dp_aux_init)(struct qmp_phy *qphy);
+
 	/* clock ids to be requested */
 	const char * const *clk_list;
 	int num_clks;
@@ -2423,6 +2431,216 @@ struct qcom_qmp {
 	struct reset_control *ufs_reset;
 };
 
+static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy)
+{
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+
+	/* Turn on BIAS current for PHY/PLL */
+	writel(QSERDES_V3_COM_BIAS_EN | QSERDES_V3_COM_BIAS_EN_MUX |
+	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL,
+	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
+
+	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN |
+	       DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN |
+	       DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+
+	writel(QSERDES_V3_COM_BIAS_EN |
+	       QSERDES_V3_COM_BIAS_EN_MUX | QSERDES_V3_COM_CLKBUF_R_EN |
+	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL |
+	       QSERDES_V3_COM_CLKBUF_RX_DRIVE_L,
+	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
+
+	writel(0x00, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG0);
+	writel(0x13, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG1);
+	writel(0x24, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
+	writel(0x00, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG3);
+	writel(0x0a, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG4);
+	writel(0x26, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG5);
+	writel(0x0a, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG6);
+	writel(0x03, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG7);
+	writel(0xbb, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG8);
+	writel(0x03, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG9);
+	qphy->dp_aux_cfg = 0;
+
+	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
+	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
+	       PHY_AUX_REQ_ERR_MASK,
+	       qphy->pcs + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
+}
+
+static const u8 qmp_dp_v3_pre_emphasis_hbr_rbr[4][4] = {
+	{ 0x00, 0x0c, 0x14, 0x19 },
+	{ 0x00, 0x0b, 0x12, 0xff },
+	{ 0x00, 0x0b, 0xff, 0xff },
+	{ 0x04, 0xff, 0xff, 0xff }
+};
+
+static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
+	{ 0x08, 0x0f, 0x16, 0x1f },
+	{ 0x11, 0x1e, 0x1f, 0xff },
+	{ 0x19, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
+{
+	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	unsigned int v_level = 0, p_level = 0;
+	u32 bias_en, drvr_en;
+	u8 voltage_swing_cfg, pre_emphasis_cfg;
+	int i;
+
+	for (i = 0; i < dp_opts->lanes; i++) {
+		v_level = max(v_level, dp_opts->voltage[i]);
+		p_level = max(p_level, dp_opts->pre[i]);
+	}
+
+	if (dp_opts->lanes == 1) {
+		bias_en = 0x3e;
+		drvr_en = 0x13;
+	} else {
+		bias_en = 0x3f;
+		drvr_en = 0x10;
+	}
+
+	voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
+	pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
+
+	/* TODO: Move check to config check */
+	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
+		return;
+
+	/* Enable MUX to use Cursor values from these registers */
+	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
+	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
+
+	writel(voltage_swing_cfg, qphy->tx + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(pre_emphasis_cfg, qphy->tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
+	writel(voltage_swing_cfg, qphy->tx2 + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(pre_emphasis_cfg, qphy->tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
+
+	writel(drvr_en, qphy->tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
+	writel(bias_en, qphy->tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
+	writel(drvr_en, qphy->tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
+	writel(bias_en, qphy->tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
+}
+
+static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
+{
+	const struct qmp_phy_dp_clks *dp_clks = qphy->dp_clks;
+	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	u32 val, phy_vco_div, status;
+	unsigned long pixel_freq;
+
+	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN;
+
+	/*
+	 * TODO: Assume orientation is CC1 for now and two lanes, need to
+	 * use type-c connector to understand orientation and lanes.
+	 *
+	 * Otherwise val changes to be like below if this code understood
+	 * the orientation of the type-c cable.
+	 *
+	 * if (lane_cnt == 4 || orientation == ORIENTATION_CC2)
+	 *	val |= DP_PHY_PD_CTL_LANE_0_1_PWRDN;
+	 * if (lane_cnt == 4 || orientation == ORIENTATION_CC1)
+	 *	val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
+	 * if (orientation == ORIENTATION_CC2)
+	 *	writel(0x4c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
+	 */
+	val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
+	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+
+	writel(0x5c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
+	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		phy_vco_div = 0x1;
+		pixel_freq = 1620000000UL / 2;
+		break;
+	case 2700:
+		phy_vco_div = 0x1;
+		pixel_freq = 2700000000UL / 2;
+		break;
+	case 5400:
+		phy_vco_div = 0x2;
+		pixel_freq = 5400000000UL / 4;
+		break;
+	case 8100:
+		phy_vco_div = 0x0;
+		pixel_freq = 8100000000UL / 6;
+		break;
+	default:
+		/* Other link rates aren't supported */
+		return -EINVAL;
+	}
+	writel(phy_vco_div, qphy->pcs + QSERDES_V3_DP_PHY_VCO_DIV);
+
+	clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
+	clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
+
+	writel(0x04, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
+	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x09, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+
+	writel(0x20, qphy->serdes + QSERDES_V3_COM_RESETSM_CNTRL);
+
+	if (readl_poll_timeout(qphy->serdes + QSERDES_V3_COM_C_READY_STATUS,
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+
+	if (readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	writel(0x18, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	udelay(2000);
+	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+
+	return readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000);
+}
+
+/*
+ * We need to calibrate the aux setting here as many times
+ * as the caller tries
+ */
+static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
+{
+	static const u8 cfg1_settings[] = { 0x13, 0x23, 0x1d };
+	u8 val;
+
+	qphy->dp_aux_cfg++;
+	qphy->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
+	val = cfg1_settings[qphy->dp_aux_cfg];
+
+	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG1);
+
+	return 0;
+}
+
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -2871,6 +3089,11 @@ static const struct qmp_phy_cfg sc7180_dpphy_cfg = {
 
 	.has_phy_dp_com_ctrl	= true,
 	.is_dual_lane_phy	= true,
+
+	.dp_aux_init = qcom_qmp_v3_phy_dp_aux_init,
+	.configure_dp_tx = qcom_qmp_v3_phy_configure_dp_tx,
+	.configure_dp_phy = qcom_qmp_v3_phy_configure_dp_phy,
+	.calibrate_dp_phy = qcom_qmp_v3_dp_phy_calibrate,
 };
 
 static const struct qmp_phy_combo_cfg sc7180_usb3dpphy_cfg = {
@@ -3332,227 +3555,28 @@ static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
 	return 0;
 }
 
-static void qcom_qmp_phy_dp_aux_init(struct qmp_phy *qphy)
-{
-	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
-	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
-	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
-
-	/* Turn on BIAS current for PHY/PLL */
-	writel(QSERDES_V3_COM_BIAS_EN | QSERDES_V3_COM_BIAS_EN_MUX |
-	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL,
-	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
-
-	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
-
-	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
-	       DP_PHY_PD_CTL_LANE_0_1_PWRDN |
-	       DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN |
-	       DP_PHY_PD_CTL_DP_CLAMP_EN,
-	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
-
-	writel(QSERDES_V3_COM_BIAS_EN |
-	       QSERDES_V3_COM_BIAS_EN_MUX | QSERDES_V3_COM_CLKBUF_R_EN |
-	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL |
-	       QSERDES_V3_COM_CLKBUF_RX_DRIVE_L,
-	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
-
-	writel(0x00, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG0);
-	writel(0x13, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG1);
-	writel(0x24, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
-	writel(0x00, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG3);
-	writel(0x0a, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG4);
-	writel(0x26, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG5);
-	writel(0x0a, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG6);
-	writel(0x03, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG7);
-	writel(0xbb, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG8);
-	writel(0x03, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG9);
-	qphy->dp_aux_cfg = 0;
-
-	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
-	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
-	       PHY_AUX_REQ_ERR_MASK,
-	       qphy->pcs + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
-}
-
-static const u8 qmp_dp_v3_pre_emphasis_hbr_rbr[4][4] = {
-	{ 0x00, 0x0c, 0x14, 0x19 },
-	{ 0x00, 0x0b, 0x12, 0xff },
-	{ 0x00, 0x0b, 0xff, 0xff },
-	{ 0x04, 0xff, 0xff, 0xff }
-};
-
-static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
-	{ 0x08, 0x0f, 0x16, 0x1f },
-	{ 0x11, 0x1e, 0x1f, 0xff },
-	{ 0x19, 0x1f, 0xff, 0xff },
-	{ 0x1f, 0xff, 0xff, 0xff }
-};
-
-static void qcom_qmp_phy_configure_dp_tx(struct qmp_phy *qphy)
-{
-	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
-	unsigned int v_level = 0, p_level = 0;
-	u32 bias_en, drvr_en;
-	u8 voltage_swing_cfg, pre_emphasis_cfg;
-	int i;
-
-	for (i = 0; i < dp_opts->lanes; i++) {
-		v_level = max(v_level, dp_opts->voltage[i]);
-		p_level = max(p_level, dp_opts->pre[i]);
-	}
-
-	if (dp_opts->lanes == 1) {
-		bias_en = 0x3e;
-		drvr_en = 0x13;
-	} else {
-		bias_en = 0x3f;
-		drvr_en = 0x10;
-	}
-
-	voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
-	pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
-
-	/* TODO: Move check to config check */
-	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
-		return;
-
-	/* Enable MUX to use Cursor values from these registers */
-	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
-	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
-
-	writel(voltage_swing_cfg, qphy->tx + QSERDES_V3_TX_TX_DRV_LVL);
-	writel(pre_emphasis_cfg, qphy->tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
-	writel(voltage_swing_cfg, qphy->tx2 + QSERDES_V3_TX_TX_DRV_LVL);
-	writel(pre_emphasis_cfg, qphy->tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
-
-	writel(drvr_en, qphy->tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
-	writel(bias_en, qphy->tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
-	writel(drvr_en, qphy->tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
-	writel(bias_en, qphy->tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
-}
-
 static int qcom_qmp_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 {
 	const struct phy_configure_opts_dp *dp_opts = &opts->dp;
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
 
 	memcpy(&qphy->dp_opts, dp_opts, sizeof(*dp_opts));
 	if (qphy->dp_opts.set_voltages) {
-		qcom_qmp_phy_configure_dp_tx(qphy);
+		cfg->configure_dp_tx(qphy);
 		qphy->dp_opts.set_voltages = 0;
 	}
 
 	return 0;
 }
 
-static int qcom_qmp_phy_configure_dp_phy(struct qmp_phy *qphy)
-{
-	const struct qmp_phy_dp_clks *dp_clks = qphy->dp_clks;
-	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
-	u32 val, phy_vco_div, status;
-	unsigned long pixel_freq;
-
-	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
-	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN;
-
-	/*
-	 * TODO: Assume orientation is CC1 for now and two lanes, need to
-	 * use type-c connector to understand orientation and lanes.
-	 *
-	 * Otherwise val changes to be like below if this code understood
-	 * the orientation of the type-c cable.
-	 *
-	 * if (lane_cnt == 4 || orientation == ORIENTATION_CC2)
-	 *	val |= DP_PHY_PD_CTL_LANE_0_1_PWRDN;
-	 * if (lane_cnt == 4 || orientation == ORIENTATION_CC1)
-	 *	val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
-	 * if (orientation == ORIENTATION_CC2)
-	 *	writel(0x4c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
-	 */
-	val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
-	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
-
-	writel(0x5c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
-	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
-	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
-
-	switch (dp_opts->link_rate) {
-	case 1620:
-		phy_vco_div = 0x1;
-		pixel_freq = 1620000000UL / 2;
-		break;
-	case 2700:
-		phy_vco_div = 0x1;
-		pixel_freq = 2700000000UL / 2;
-		break;
-	case 5400:
-		phy_vco_div = 0x2;
-		pixel_freq = 5400000000UL / 4;
-		break;
-	case 8100:
-		phy_vco_div = 0x0;
-		pixel_freq = 8100000000UL / 6;
-		break;
-	default:
-		/* Other link rates aren't supported */
-		return -EINVAL;
-	}
-	writel(phy_vco_div, qphy->pcs + QSERDES_V3_DP_PHY_VCO_DIV);
-
-	clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
-	clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
-
-	writel(0x04, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
-	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-	writel(0x09, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-
-	writel(0x20, qphy->serdes + QSERDES_V3_COM_RESETSM_CNTRL);
-
-	if (readl_poll_timeout(qphy->serdes + QSERDES_V3_COM_C_READY_STATUS,
-			status,
-			((status & BIT(0)) > 0),
-			500,
-			10000))
-		return -ETIMEDOUT;
-
-	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-
-	if (readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
-			status,
-			((status & BIT(1)) > 0),
-			500,
-			10000))
-		return -ETIMEDOUT;
-
-	writel(0x18, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-	udelay(2000);
-	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-
-	return readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
-			status,
-			((status & BIT(1)) > 0),
-			500,
-			10000);
-}
-
-/*
- * We need to calibrate the aux setting here as many times
- * as the caller tries
- */
 static int qcom_qmp_dp_phy_calibrate(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	static const u8 cfg1_settings[] = { 0x13, 0x23, 0x1d };
-	u8 val;
-
-	qphy->dp_aux_cfg++;
-	qphy->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
-	val = cfg1_settings[qphy->dp_aux_cfg];
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
 
-	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG1);
+	if (cfg->calibrate_dp_phy)
+		return cfg->calibrate_dp_phy(qphy);
 
 	return 0;
 }
@@ -3729,7 +3753,7 @@ static int qcom_qmp_phy_init(struct phy *phy)
 		return ret;
 
 	if (cfg->type == PHY_TYPE_DP)
-		qcom_qmp_phy_dp_aux_init(qphy);
+		cfg->dp_aux_init(qphy);
 
 	return 0;
 }
@@ -3783,7 +3807,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 
 	/* Configure special DP tx tunings */
 	if (cfg->type == PHY_TYPE_DP)
-		qcom_qmp_phy_configure_dp_tx(qphy);
+		cfg->configure_dp_tx(qphy);
 
 	qcom_qmp_phy_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
@@ -3802,7 +3826,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 
 	/* Configure link rate, swing, etc. */
 	if (cfg->type == PHY_TYPE_DP) {
-		qcom_qmp_phy_configure_dp_phy(qphy);
+		cfg->configure_dp_phy(qphy);
 	} else {
 		qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 		if (cfg->pcs_tbl_sec)
-- 
2.30.0

