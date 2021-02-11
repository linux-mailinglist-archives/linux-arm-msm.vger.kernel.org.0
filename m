Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC0431941B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbhBKUQx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:16:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbhBKUQ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:16:29 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B9BC061788
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 12:15:42 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id d3so9913401lfg.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 12:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nqGnNMStFSC3oDABtGYhfoePGHdErQrW+Z2qKbP12tk=;
        b=boPAuZGpDcOqrTUgKwP+5ZgTLgjGh6dwN9tFajYbSVpKhdA30eFns8/P41Cu6Yp8nM
         Xj+nzLk+xJmmhgKrAquy3Jk1qE+fuf3ogNFafNvINbIIEsHP4sWkW2oGi9+D5tpMyN92
         g9sIXZHIRNjQMAEbVU0MIi8/qUpRg7ZdIkvwjV/VdGMTX5GHDXkucp4PDySDM8ua5xSX
         YCon2oOaSq07ifWWrWmiXPeH+W+yHW1K/s/F8arqP8s1ZPf9T0p801lBRqpbdVAw+heQ
         f7iS4kd123KBqiuvy3PGA0DobAnlunLlov8t7mA0pWaPf7Upyyt3gWMgNjHp+IzHwi89
         DxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nqGnNMStFSC3oDABtGYhfoePGHdErQrW+Z2qKbP12tk=;
        b=fTN7vqkd3aUWojl81f68ltEmJ0aaPr/BM+362ekXDhXN+uyVmmYFq+HncCOObuv34g
         gLc/7MPMoj373LAdV63rxIxmTr/+Y3k63c6cAFuf0R8VZrn4ygNyb8wAHwS/iPSRxCZE
         LhylOO6Q/8WIg8ZXMbPSu6N8J+8LfIKO6hJ6owJCRn5VGr0IVnKzOCfniN+MFjsULp6w
         YIWrSvS3h2AW9WcQLK4FKYXWsPGwx3qXSp28p9YEZojP8Qwr7oyZZpIHwFNd/IrkSyWQ
         K/5MTrBP/taACd5Cj+sV7xucFRWaXcr0TGBsmg+eFp1hwS+uTnJ93qM9CGOmFGFqKFcA
         HXIA==
X-Gm-Message-State: AOAM532qUj5GEPE+c4d1QL0B05wQJlZdC29o3sqhpdmLXVF5v1PDZfLj
        Ms/uan8DpG7TT+VySD8+aOCAgQ==
X-Google-Smtp-Source: ABdhPJzlSHeY2NEzYM2XZqxo39MVJ84vT48DqhhTDCb9MUbox8XEsdMCqTasvqXtw5syxPZO7SBkJA==
X-Received: by 2002:a19:7001:: with SMTP id h1mr5051456lfc.513.1613074541280;
        Thu, 11 Feb 2021 12:15:41 -0800 (PST)
Received: from localhost.localdomain ([188.162.64.15])
        by smtp.gmail.com with ESMTPSA id y27sm745029lfg.273.2021.02.11.12.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 12:15:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] phy: qcom-qmp: add support for sm8250-usb3-dp phy
Date:   Thu, 11 Feb 2021 23:15:35 +0300
Message-Id: <20210211201535.1780797-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211201535.1780797-1-dmitry.baryshkov@linaro.org>
References: <20210211201535.1780797-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for QMP V4 Combo USB3+DP PHY (for SM8250 platform).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 445 +++++++++++++++++++++++++---
 drivers/phy/qualcomm/phy-qcom-qmp.h |  77 +++--
 2 files changed, 463 insertions(+), 59 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 4150096fd350..905441740742 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1840,6 +1840,98 @@ static const struct qmp_phy_init_tbl sm8250_usb3_uniphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
 };
 
+static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_ENABLE1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_CONFIG, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORE_CLK_EN, 0x1f),
+};
+
+static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl_rbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x6f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x04),
+};
+
+static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl_hbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x08),
+};
+
+static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl_hbr2[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x8c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x08),
+};
+
+static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl_hbr3[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x2a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x08),
+};
+
+static const struct qmp_phy_init_tbl qmp_v4_dp_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_VMODE_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_INTERFACE_SELECT, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_CLKBUF_ENABLE, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RESET_TSYNC_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TRAN_DRVR_EMP_EN, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_INTERFACE_MODE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_BAND, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_POL_INV, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_DRV_LVL, 0x2a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_EMP_POST1_LVL, 0x20),
+};
+
+static const struct qmp_phy_init_tbl qmp_v4_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x75),
+};
+
 static const struct qmp_phy_init_tbl sm8250_qmp_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x08),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_SELECT, 0x34),
@@ -2435,20 +2527,20 @@ static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy)
 {
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
-	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+	       qphy->pcs + QSERDES_DP_PHY_PD_CTL);
 
 	/* Turn on BIAS current for PHY/PLL */
 	writel(QSERDES_V3_COM_BIAS_EN | QSERDES_V3_COM_BIAS_EN_MUX |
 	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL,
 	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
 
-	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
 
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_LANE_0_1_PWRDN |
 	       DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN |
 	       DP_PHY_PD_CTL_DP_CLAMP_EN,
-	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+	       qphy->pcs + QSERDES_DP_PHY_PD_CTL);
 
 	writel(QSERDES_V3_COM_BIAS_EN |
 	       QSERDES_V3_COM_BIAS_EN_MUX | QSERDES_V3_COM_CLKBUF_R_EN |
@@ -2456,16 +2548,16 @@ static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy)
 	       QSERDES_V3_COM_CLKBUF_RX_DRIVE_L,
 	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
 
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
+	writel(0x00, qphy->pcs + QSERDES_DP_PHY_AUX_CFG0);
+	writel(0x13, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
+	writel(0x24, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
+	writel(0x00, qphy->pcs + QSERDES_DP_PHY_AUX_CFG3);
+	writel(0x0a, qphy->pcs + QSERDES_DP_PHY_AUX_CFG4);
+	writel(0x26, qphy->pcs + QSERDES_DP_PHY_AUX_CFG5);
+	writel(0x0a, qphy->pcs + QSERDES_DP_PHY_AUX_CFG6);
+	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG7);
+	writel(0xbb, qphy->pcs + QSERDES_DP_PHY_AUX_CFG8);
+	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG9);
 	qphy->dp_aux_cfg = 0;
 
 	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
@@ -2488,11 +2580,10 @@ static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
 	{ 0x1f, 0xff, 0xff, 0xff }
 };
 
-static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
+static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy, unsigned int drv_lvl, unsigned int emp_post)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
 	unsigned int v_level = 0, p_level = 0;
-	u32 bias_en, drvr_en;
 	u8 voltage_swing_cfg, pre_emphasis_cfg;
 	int i;
 
@@ -2501,29 +2592,42 @@ static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
 		p_level = max(p_level, dp_opts->pre[i]);
 	}
 
-	if (dp_opts->lanes == 1) {
-		bias_en = 0x3e;
-		drvr_en = 0x13;
-	} else {
-		bias_en = 0x3f;
-		drvr_en = 0x10;
-	}
-
 	voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
 	pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
 
 	/* TODO: Move check to config check */
 	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
-		return;
+		return -EINVAL;
 
 	/* Enable MUX to use Cursor values from these registers */
 	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
 	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
 
-	writel(voltage_swing_cfg, qphy->tx + QSERDES_V3_TX_TX_DRV_LVL);
-	writel(pre_emphasis_cfg, qphy->tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
-	writel(voltage_swing_cfg, qphy->tx2 + QSERDES_V3_TX_TX_DRV_LVL);
-	writel(pre_emphasis_cfg, qphy->tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
+	writel(voltage_swing_cfg, qphy->tx + drv_lvl);
+	writel(pre_emphasis_cfg, qphy->tx + emp_post);
+	writel(voltage_swing_cfg, qphy->tx2 + drv_lvl);
+	writel(pre_emphasis_cfg, qphy->tx2 + emp_post);
+
+	return 0;
+}
+
+static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
+{
+	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	u32 bias_en, drvr_en;
+
+	if (qcom_qmp_phy_configure_dp_swing(qphy,
+			QSERDES_V3_TX_TX_DRV_LVL,
+			QSERDES_V3_TX_TX_EMP_POST1_LVL) < 0)
+		return;
+
+	if (dp_opts->lanes == 1) {
+		bias_en = 0x3e;
+		drvr_en = 0x13;
+	} else {
+		bias_en = 0x3f;
+		drvr_en = 0x10;
+	}
 
 	writel(drvr_en, qphy->tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
 	writel(bias_en, qphy->tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
@@ -2558,7 +2662,6 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
 	val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
 	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
 
-	writel(0x5c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
 	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
 
@@ -2588,11 +2691,11 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
 	clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
 	clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
 
-	writel(0x04, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
-	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
-	writel(0x09, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x04, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
+	writel(0x01, qphy->pcs + QSERDES_DP_PHY_CFG);
+	writel(0x05, qphy->pcs + QSERDES_DP_PHY_CFG);
+	writel(0x01, qphy->pcs + QSERDES_DP_PHY_CFG);
+	writel(0x09, qphy->pcs + QSERDES_DP_PHY_CFG);
 
 	writel(0x20, qphy->serdes + QSERDES_V3_COM_RESETSM_CNTRL);
 
@@ -2603,7 +2706,7 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
 			10000))
 		return -ETIMEDOUT;
 
-	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
 
 	if (readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
 			status,
@@ -2612,9 +2715,9 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
 			10000))
 		return -ETIMEDOUT;
 
-	writel(0x18, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
 	udelay(2000);
-	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
 
 	return readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
 			status,
@@ -2636,7 +2739,224 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
 	qphy->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
 	val = cfg1_settings[qphy->dp_aux_cfg];
 
-	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG1);
+	writel(val, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
+
+	return 0;
+}
+
+static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
+{
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       qphy->pcs + QSERDES_DP_PHY_PD_CTL);
+
+	/* Turn on BIAS current for PHY/PLL */
+	writel(0x17, qphy->serdes + QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN);
+
+	writel(0x00, qphy->pcs + QSERDES_DP_PHY_AUX_CFG0);
+	writel(0x13, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
+	writel(0xa4, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
+	writel(0x00, qphy->pcs + QSERDES_DP_PHY_AUX_CFG3);
+	writel(0x0a, qphy->pcs + QSERDES_DP_PHY_AUX_CFG4);
+	writel(0x26, qphy->pcs + QSERDES_DP_PHY_AUX_CFG5);
+	writel(0x0a, qphy->pcs + QSERDES_DP_PHY_AUX_CFG6);
+	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG7);
+	writel(0xb7, qphy->pcs + QSERDES_DP_PHY_AUX_CFG8);
+	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG9);
+	qphy->dp_aux_cfg = 0;
+
+	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
+	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
+	       PHY_AUX_REQ_ERR_MASK,
+	       qphy->pcs + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
+}
+
+static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
+{
+	/* Program default values before writing proper values */
+	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
+	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
+
+	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+
+	qcom_qmp_phy_configure_dp_swing(qphy,
+			QSERDES_V4_TX_TX_DRV_LVL,
+			QSERDES_V4_TX_TX_EMP_POST1_LVL);
+}
+
+static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
+{
+	const struct qmp_phy_dp_clks *dp_clks = qphy->dp_clks;
+	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	u32 val, phy_vco_div, status;
+	unsigned long pixel_freq;
+	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
+
+	writel(0x0f, qphy->pcs + QSERDES_V4_DP_PHY_CFG_1);
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
+	writel(0x4c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
+
+	writel(0x13, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
+	writel(0xa4, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
+
+	writel(0x05, qphy->pcs + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, qphy->pcs + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
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
+	writel(phy_vco_div, qphy->pcs + QSERDES_V4_DP_PHY_VCO_DIV);
+
+	clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
+	clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
+
+	writel(0x01, qphy->pcs + QSERDES_DP_PHY_CFG);
+	writel(0x05, qphy->pcs + QSERDES_DP_PHY_CFG);
+	writel(0x01, qphy->pcs + QSERDES_DP_PHY_CFG);
+	writel(0x09, qphy->pcs + QSERDES_DP_PHY_CFG);
+
+	writel(0x20, qphy->serdes + QSERDES_V4_COM_RESETSM_CNTRL);
+
+	if (readl_poll_timeout(qphy->serdes + QSERDES_V4_COM_C_READY_STATUS,
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	if (readl_poll_timeout(qphy->serdes + QSERDES_V4_COM_CMN_STATUS,
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	if (readl_poll_timeout(qphy->serdes + QSERDES_V4_COM_CMN_STATUS,
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
+
+	if (readl_poll_timeout(qphy->pcs + QSERDES_V4_DP_PHY_STATUS,
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	if (readl_poll_timeout(qphy->pcs + QSERDES_V4_DP_PHY_STATUS,
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	/*
+	 * At least for 7nm DP PHY this has to be done after enabling link
+	 * clock.
+	 */
+
+	if (dp_opts->lanes == 1) {
+		bias0_en = reverse ? 0x3e : 0x15;
+		bias1_en = reverse ? 0x15 : 0x3e;
+		drvr0_en = reverse ? 0x13 : 0x10;
+		drvr1_en = reverse ? 0x10 : 0x13;
+	} else if (dp_opts->lanes == 2) {
+		bias0_en = reverse ? 0x3f : 0x15;
+		bias1_en = reverse ? 0x15 : 0x3f;
+		drvr0_en = 0x10;
+		drvr1_en = 0x10;
+	} else {
+		bias0_en = 0x3f;
+		bias1_en = 0x3f;
+		drvr0_en = 0x10;
+		drvr1_en = 0x10;
+	}
+
+	writel(drvr0_en, qphy->tx + QSERDES_V4_TX_HIGHZ_DRVR_EN);
+	writel(bias0_en, qphy->tx + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
+	writel(drvr1_en, qphy->tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
+	writel(bias1_en, qphy->tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
+
+	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
+	udelay(2000);
+	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
+
+	if (readl_poll_timeout(qphy->pcs + QSERDES_V4_DP_PHY_STATUS,
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
+	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
+
+	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
+	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
+
+	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+
+	return 0;
+}
+
+/*
+ * We need to calibrate the aux setting here as many times
+ * as the caller tries
+ */
+static int qcom_qmp_v4_dp_phy_calibrate(struct qmp_phy *qphy)
+{
+	static const u8 cfg1_settings[] = { 0x20, 0x13, 0x23, 0x1d };
+	u8 val;
+
+	qphy->dp_aux_cfg++;
+	qphy->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
+	val = cfg1_settings[qphy->dp_aux_cfg];
+
+	writel(val, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
 
 	return 0;
 }
@@ -3346,6 +3666,46 @@ static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
+static const struct qmp_phy_cfg sm8250_dpphy_cfg = {
+	.type			= PHY_TYPE_DP,
+	.nlanes			= 1,
+
+	.serdes_tbl		= qmp_v4_dp_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qmp_v4_dp_serdes_tbl),
+	.tx_tbl			= qmp_v4_dp_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qmp_v4_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qmp_v4_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v4_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v4_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v4_dp_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr3),
+
+	.clk_list		= qmp_v4_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v4_usb3phy_regs_layout,
+
+	.has_phy_dp_com_ctrl	= true,
+	.is_dual_lane_phy	= true,
+
+	.dp_aux_init = qcom_qmp_v4_phy_dp_aux_init,
+	.configure_dp_tx = qcom_qmp_v4_phy_configure_dp_tx,
+	.configure_dp_phy = qcom_qmp_v4_phy_configure_dp_phy,
+	.calibrate_dp_phy = qcom_qmp_v4_dp_phy_calibrate,
+};
+
+static const struct qmp_phy_combo_cfg sm8250_usb3dpphy_cfg = {
+	.usb_cfg		= &sm8250_usb3phy_cfg,
+	.dp_cfg			= &sm8250_dpphy_cfg,
+};
+
 static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -3898,7 +4258,7 @@ static int qcom_qmp_phy_power_off(struct phy *phy)
 
 	if (cfg->type == PHY_TYPE_DP) {
 		/* Assert DP PHY power down */
-		writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+		writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
 	} else {
 		/* PHY reset */
 		if (!cfg->no_pcs_sw_reset)
@@ -4601,6 +4961,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8250-qmp-usb3-phy",
 		.data = &sm8250_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,sm8250-qmp-usb3-dp-phy",
+		/* It's a combo phy */
 	}, {
 		.compatible = "qcom,sm8250-qmp-usb3-uni-phy",
 		.data = &sm8250_usb3_uniphy_cfg,
@@ -4635,6 +4998,10 @@ static const struct of_device_id qcom_qmp_combo_phy_of_match_table[] = {
 		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
 		.data = &sc7180_usb3dpphy_cfg,
 	},
+	{
+		.compatible = "qcom,sm8250-qmp-usb3-dp-phy",
+		.data = &sm8250_usb3dpphy_cfg,
+	},
 	{ }
 };
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 71ce3aa174ae..67bd2dd0d8c5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -349,13 +349,13 @@
 #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG4		0x5c
 #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG5		0x60
 
-/* Only for QMP V3 PHY - DP PHY registers */
-#define QSERDES_V3_DP_PHY_REVISION_ID0			0x000
-#define QSERDES_V3_DP_PHY_REVISION_ID1			0x004
-#define QSERDES_V3_DP_PHY_REVISION_ID2			0x008
-#define QSERDES_V3_DP_PHY_REVISION_ID3			0x00c
-#define QSERDES_V3_DP_PHY_CFG				0x010
-#define QSERDES_V3_DP_PHY_PD_CTL			0x018
+/* QMP PHY - DP PHY registers */
+#define QSERDES_DP_PHY_REVISION_ID0			0x000
+#define QSERDES_DP_PHY_REVISION_ID1			0x004
+#define QSERDES_DP_PHY_REVISION_ID2			0x008
+#define QSERDES_DP_PHY_REVISION_ID3			0x00c
+#define QSERDES_DP_PHY_CFG				0x010
+#define QSERDES_DP_PHY_PD_CTL				0x018
 # define DP_PHY_PD_CTL_PWRDN				0x001
 # define DP_PHY_PD_CTL_PSR_PWRDN			0x002
 # define DP_PHY_PD_CTL_AUX_PWRDN			0x004
@@ -363,18 +363,19 @@
 # define DP_PHY_PD_CTL_LANE_2_3_PWRDN			0x010
 # define DP_PHY_PD_CTL_PLL_PWRDN			0x020
 # define DP_PHY_PD_CTL_DP_CLAMP_EN			0x040
-#define QSERDES_V3_DP_PHY_MODE				0x01c
-#define QSERDES_V3_DP_PHY_AUX_CFG0			0x020
-#define QSERDES_V3_DP_PHY_AUX_CFG1			0x024
-#define QSERDES_V3_DP_PHY_AUX_CFG2			0x028
-#define QSERDES_V3_DP_PHY_AUX_CFG3			0x02c
-#define QSERDES_V3_DP_PHY_AUX_CFG4			0x030
-#define QSERDES_V3_DP_PHY_AUX_CFG5			0x034
-#define QSERDES_V3_DP_PHY_AUX_CFG6			0x038
-#define QSERDES_V3_DP_PHY_AUX_CFG7			0x03c
-#define QSERDES_V3_DP_PHY_AUX_CFG8			0x040
-#define QSERDES_V3_DP_PHY_AUX_CFG9			0x044
+#define QSERDES_DP_PHY_MODE				0x01c
+#define QSERDES_DP_PHY_AUX_CFG0				0x020
+#define QSERDES_DP_PHY_AUX_CFG1				0x024
+#define QSERDES_DP_PHY_AUX_CFG2				0x028
+#define QSERDES_DP_PHY_AUX_CFG3				0x02c
+#define QSERDES_DP_PHY_AUX_CFG4				0x030
+#define QSERDES_DP_PHY_AUX_CFG5				0x034
+#define QSERDES_DP_PHY_AUX_CFG6				0x038
+#define QSERDES_DP_PHY_AUX_CFG7				0x03c
+#define QSERDES_DP_PHY_AUX_CFG8				0x040
+#define QSERDES_DP_PHY_AUX_CFG9				0x044
 
+/* Only for QMP V3 PHY - DP PHY registers */
 #define QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK		0x048
 # define PHY_AUX_STOP_ERR_MASK				0x01
 # define PHY_AUX_DEC_ERR_MASK				0x02
@@ -396,6 +397,7 @@
 #define QSERDES_V3_DP_PHY_STATUS			0x0c0
 
 /* Only for QMP V4 PHY - QSERDES COM registers */
+#define QSERDES_V4_COM_BG_TIMER				0x00c
 #define QSERDES_V4_COM_SSC_EN_CENTER			0x010
 #define QSERDES_V4_COM_SSC_PER1				0x01c
 #define QSERDES_V4_COM_SSC_PER2				0x020
@@ -403,7 +405,9 @@
 #define QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0		0x028
 #define QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1		0x030
 #define QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1		0x034
+#define QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN		0x044
 #define QSERDES_V4_COM_CLK_ENABLE1			0x048
+#define QSERDES_V4_COM_SYS_CLK_CTRL			0x04c
 #define QSERDES_V4_COM_SYSCLK_BUF_ENABLE		0x050
 #define QSERDES_V4_COM_PLL_IVCO				0x058
 #define QSERDES_V4_COM_CMN_IPTRIM			0x060
@@ -414,6 +418,7 @@
 #define QSERDES_V4_COM_PLL_CCTRL_MODE0			0x084
 #define QSERDES_V4_COM_PLL_CCTRL_MODE1			0x088
 #define QSERDES_V4_COM_SYSCLK_EN_SEL			0x094
+#define QSERDES_V4_COM_RESETSM_CNTRL			0x09c
 #define QSERDES_V4_COM_LOCK_CMP_EN			0x0a4
 #define QSERDES_V4_COM_LOCK_CMP1_MODE0			0x0ac
 #define QSERDES_V4_COM_LOCK_CMP2_MODE0			0x0b0
@@ -427,16 +432,24 @@
 #define QSERDES_V4_COM_DIV_FRAC_START1_MODE1		0x0d8
 #define QSERDES_V4_COM_DIV_FRAC_START2_MODE1		0x0dc
 #define QSERDES_V4_COM_DIV_FRAC_START3_MODE1		0x0e0
+#define QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0		0x0ec
+#define QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0		0x0f0
+#define QSERDES_V4_COM_VCO_TUNE_CTRL			0x108
 #define QSERDES_V4_COM_VCO_TUNE_MAP			0x10c
 #define QSERDES_V4_COM_VCO_TUNE1_MODE0			0x110
 #define QSERDES_V4_COM_VCO_TUNE2_MODE0			0x114
 #define QSERDES_V4_COM_VCO_TUNE1_MODE1			0x118
 #define QSERDES_V4_COM_VCO_TUNE2_MODE1			0x11c
 #define QSERDES_V4_COM_VCO_TUNE_INITVAL2		0x124
+#define QSERDES_V4_COM_CMN_STATUS			0x140
 #define QSERDES_V4_COM_CLK_SELECT			0x154
 #define QSERDES_V4_COM_HSCLK_SEL			0x158
 #define QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL		0x15c
+#define QSERDES_V4_COM_CORECLK_DIV_MODE0		0x168
 #define QSERDES_V4_COM_CORECLK_DIV_MODE1		0x16c
+#define QSERDES_V4_COM_CORE_CLK_EN			0x174
+#define QSERDES_V4_COM_C_READY_STATUS			0x178
+#define QSERDES_V4_COM_CMN_CONFIG			0x17c
 #define QSERDES_V4_COM_SVS_MODE_CLK_SEL			0x184
 #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
 #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
@@ -445,19 +458,32 @@
 #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1	0x1b8
 
 /* Only for QMP V4 PHY - TX registers */
+#define QSERDES_V4_TX_CLKBUF_ENABLE			0x08
+#define QSERDES_V4_TX_TX_EMP_POST1_LVL			0x0c
+#define QSERDES_V4_TX_TX_DRV_LVL			0x14
+#define QSERDES_V4_TX_RESET_TSYNC_EN			0x1c
+#define QSERDES_V4_TX_PRE_STALL_LDO_BOOST_EN		0x20
+#define QSERDES_V4_TX_TX_BAND				0x24
+#define QSERDES_V4_TX_INTERFACE_SELECT			0x2c
 #define QSERDES_V4_TX_RES_CODE_LANE_TX			0x34
 #define QSERDES_V4_TX_RES_CODE_LANE_RX			0x38
 #define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX 		0x3c
 #define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX 		0x40
+#define QSERDES_V4_TX_TRANSCEIVER_BIAS_EN		0x54
+#define QSERDES_V4_TX_HIGHZ_DRVR_EN			0x58
+#define QSERDES_V4_TX_TX_POL_INV			0x5c
+#define QSERDES_V4_TX_PARRATE_REC_DETECT_IDLE_EN	0x60
 #define QSERDES_V4_TX_LANE_MODE_1			0x84
 #define QSERDES_V4_TX_LANE_MODE_2			0x88
 #define QSERDES_V4_TX_RCV_DETECT_LVL_2			0x9c
+#define QSERDES_V4_TX_TRAN_DRVR_EMP_EN			0xb8
+#define QSERDES_V4_TX_TX_INTERFACE_MODE			0xbc
 #define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0xd8
 #define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0xdC
 #define QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1	0xe0
 #define QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1	0xe4
-#define QSERDES_V4_TX_TRAN_DRVR_EMP_EN			0xb8
-#define QSERDES_V4_TX_PI_QEC_CTRL		0x104
+#define QSERDES_V4_TX_VMODE_CTRL1			0xe8
+#define QSERDES_V4_TX_PI_QEC_CTRL			0x104
 
 /* Only for QMP V4 PHY - RX registers */
 #define QSERDES_V4_RX_UCDR_FO_GAIN			0x008
@@ -514,6 +540,17 @@
 #define QSERDES_V4_RX_DCC_CTRL1				0x1bc
 #define QSERDES_V4_RX_VTH_CODE				0x1c4
 
+/* Only for QMP V4 PHY - DP PHY registers */
+#define QSERDES_V4_DP_PHY_CFG_1				0x014
+#define QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK		0x054
+#define QSERDES_V4_DP_PHY_AUX_INTERRUPT_CLEAR		0x058
+#define QSERDES_V4_DP_PHY_VCO_DIV			0x070
+#define QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL		0x078
+#define QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL		0x09c
+#define QSERDES_V4_DP_PHY_SPARE0			0x0c8
+#define QSERDES_V4_DP_PHY_AUX_INTERRUPT_STATUS		0x0d8
+#define QSERDES_V4_DP_PHY_STATUS			0x0dc
+
 /* Only for QMP V4 PHY - UFS PCS registers */
 #define QPHY_V4_PCS_UFS_PHY_START				0x000
 #define QPHY_V4_PCS_UFS_POWER_DOWN_CONTROL			0x004
-- 
2.30.0

