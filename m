Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9CDEF2310
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 01:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732715AbfKGAJb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 19:09:31 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46114 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732689AbfKGAJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 19:09:28 -0500
Received: by mail-pg1-f194.google.com with SMTP id r18so322338pgu.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 16:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=89QEVdhN3WGoK0p+1tyD0tVTN9zo86ixWKdHd0uIJIE=;
        b=vYKp4CKG9+BS63XPkKNWq7W5x8rAG1AVvPrIvddk4DVHsD/D/Iy12cvq2e9/FhPvCS
         5nvigS5h1W9xtDGuqEnj6P4nGkPhzl9sO/bPrKLwLbyKGE6xcWKjiKWyNV0vDGh1pq/Z
         /BcPCJWOoDyR9QCF+T3iEXORymZExYBBA6+2PchQk0KUbgAI+/PONwGkg7ASGcByGPFx
         pRkKQlHfh0eyM6+glwSsgQa6CwDX/6TYq9m9h/Zqw4ht+dM25NiSl5+7zw7+1MjrBelP
         VWkZ2ZexeioQLYOGQosY9n8Mf+cdJPwHiTOYsYLf0g1ZwAXg4s5CgPJd1w6nWO5797iu
         BcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=89QEVdhN3WGoK0p+1tyD0tVTN9zo86ixWKdHd0uIJIE=;
        b=Tyu2STUE9QnLsxvfPgvp7xxfLCIH5jPWO9wozDHcCXxFUmfzGA8G91/JIUSA7UgR7C
         CYmDCHZ4VGtSa1ZRmzhlo3DRxT3k5CND9NV9aTZdRYGDvfj56cDd6b+WUtf84XjDlBbN
         PbLqkyN0XQWfvxN8QMTMXmWS5vsYuiaLEgmDPFp4WnrPXxCy01na+LiCyPH9Lj01sLP+
         L/9Lz2Mq0rlGit7ymhPGeQU04ILDhsvkrGErvAJW7ZFltjjyYqA+lYQ5jfcAQv7AZs68
         ul+8OPLSmvTY4cilxVy1vLZPmoywwClLeUmqEARh4tpU0nC620h/fAaD/mvlpe2Pqq4P
         E5hw==
X-Gm-Message-State: APjAAAVUtg5ZpBtt8lvX/VHN3bfZg0988OeTJ/SecLi2fYVWbTH7Z+JJ
        0YcddfMhV7Dd2FYlJBLXwyme1A==
X-Google-Smtp-Source: APXvYqxcWkZm0+GLSKXH2zNu3PCaO0LaxzjNVNoQxRoVxqzP62vUYoBvUXwXT0mBOIrWh29nfmL6LA==
X-Received: by 2002:a63:e608:: with SMTP id g8mr728263pgh.448.1573085366854;
        Wed, 06 Nov 2019 16:09:26 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z23sm216549pgj.43.2019.11.06.16.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:09:26 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 5/5] phy: qcom: qmp: Add SDM845 QHP PCIe PHY
Date:   Wed,  6 Nov 2019 16:09:17 -0800
Message-Id: <20191107000917.1092409-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
References: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the GEN3 QHP PCIe PHY found in SDM845.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Sorted header file entries

 drivers/phy/qualcomm/phy-qcom-qmp.c | 157 ++++++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h | 114 ++++++++++++++++++++
 2 files changed, 271 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index d107563e17c6..ae05a53dccf2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -166,6 +166,12 @@ static const unsigned int sdm845_qmp_pciephy_regs_layout[] = {
 	[QPHY_PCS_STATUS]		= 0x174,
 };
 
+static const unsigned int sdm845_qhp_pciephy_regs_layout[] = {
+	[QPHY_SW_RESET]			= 0x00,
+	[QPHY_START_CTRL]		= 0x08,
+	[QPHY_PCS_STATUS]		= 0x2ac,
+};
+
 static const unsigned int sdm845_ufsphy_regs_layout[] = {
 	[QPHY_START_CTRL]		= 0x00,
 	[QPHY_PCS_READY_STATUS]		= 0x160,
@@ -589,6 +595,126 @@ static const struct qmp_phy_init_tbl sdm845_qmp_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_MISC_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
 };
 
+static const struct qmp_phy_init_tbl sdm845_qhp_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_SYSCLK_EN_SEL, 0x27),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_SSC_PER1, 0x31),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1, 0xde),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2, 0x07),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1_MODE1, 0x4c),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_BIAS_EN_CKBUFLR_EN, 0x18),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_CLK_ENABLE1, 0xb0),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE0, 0x8c),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE0, 0x20),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_RESTRIM_CTRL2, 0x05),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_DEC_START_MODE1, 0x68),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE1, 0xab),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE1, 0xaa),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE1, 0x3f),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_VCO_TUNE_MAP, 0x10),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_CLK_SELECT, 0x04),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_HSCLK_SEL1, 0x30),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_CORECLK_DIV, 0x04),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_CORE_CLK_EN, 0x73),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_CMN_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_SVS_MODE_CLK_SEL, 0x15),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_CMN_MODE, 0x01),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_VREGCLK_DIV1, 0x22),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_VREGCLK_DIV2, 0x00),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_BGV_TRIM, 0x20),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_BG_CTRL, 0x07),
+};
+
+static const struct qmp_phy_init_tbl sdm845_qhp_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_DRVR_CTRL0, 0x00),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_DRVR_TAP_EN, 0x0d),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_TX_BAND_MODE, 0x01),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_LANE_MODE, 0x1a),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_PARALLEL_RATE, 0x2f),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_CML_CTRL_MODE0, 0x09),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_CML_CTRL_MODE1, 0x09),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_CML_CTRL_MODE2, 0x1b),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE2, 0x07),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE0, 0x31),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE1, 0x31),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE2, 0x03),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_CTLE_THRESH_DFE, 0x02),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_CGA_THRESH_DFE, 0x00),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RXENGINE_EN0, 0x12),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_CTLE_TRAIN_TIME, 0x25),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_CTLE_DFE_OVRLP_TIME, 0x00),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_DFE_REFRESH_TIME, 0x05),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_DFE_ENABLE_TIME, 0x01),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_VGA_GAIN, 0x26),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_DFE_GAIN, 0x12),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_EQ_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_OFFSET_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_PRE_GAIN, 0x09),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_EQ_INTVAL, 0x15),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_EDAC_INITVAL, 0x28),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RXEQ_INITB0, 0x7f),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RXEQ_INITB1, 0x07),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RCVRDONE_THRESH1, 0x04),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RXEQ_CTRL, 0x70),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE0, 0x8b),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE2, 0x0a),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE2, 0x04),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_UCDR_SO_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RX_BAND, 0x02),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE0, 0x5c),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE1, 0x3e),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE2, 0x3f),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_SIGDET_ENABLES, 0x01),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_SIGDET_CNTRL, 0xa0),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_SIGDET_DEGLITCH_CNTRL, 0x08),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_DCC_GAIN, 0x01),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RX_EN_SIGNAL, 0xc3),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_PSM_RX_EN_CAL, 0x00),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RX_MISC_CNTRL0, 0xbc),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_TS0_TIMER, 0x7f),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_DLL_HIGHDATARATE, 0x15),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_DRVR_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_DRVR_CTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RX_RESETCODE_OFFSET, 0x04),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_VGA_INITVAL, 0x20),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RSM_START, 0x01),
+};
+
+static const struct qmp_phy_init_tbl sdm845_qhp_pcie_rx_tbl[] = {
+};
+
+static const struct qmp_phy_init_tbl sdm845_qhp_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG, 0x3f),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_PCS_TX_RX_CONFIG, 0x50),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_TXMGN_MAIN_V0_M3P5DB, 0x19),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_TXMGN_POST_V0_M3P5DB, 0x07),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_TXMGN_MAIN_V0_M6DB, 0x17),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_TXMGN_POST_V0_M6DB, 0x09),
+	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG5, 0x9f),
+};
+
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x14),
@@ -1383,6 +1509,34 @@ static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
 	.pwrdn_delay_max	= 1005,		/* us */
 };
 
+static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
+	.type = PHY_TYPE_PCIE,
+	.nlanes = 1,
+
+	.serdes_tbl		= sdm845_qhp_pcie_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sdm845_qhp_pcie_serdes_tbl),
+	.tx_tbl			= sdm845_qhp_pcie_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sdm845_qhp_pcie_tx_tbl),
+	.rx_tbl			= sdm845_qhp_pcie_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sdm845_qhp_pcie_rx_tbl),
+	.pcs_tbl		= sdm845_qhp_pcie_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sdm845_qhp_pcie_pcs_tbl),
+	.clk_list		= sdm845_pciephy_clk_l,
+	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= sdm845_qhp_pciephy_regs_layout,
+
+	.start_ctrl		= PCS_START | SERDES_START,
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+
+	.has_pwrdn_delay	= true,
+	.pwrdn_delay_min	= 995,		/* us */
+	.pwrdn_delay_max	= 1005,		/* us */
+};
+
 static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -2256,6 +2410,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,ipq8074-qmp-pcie-phy",
 		.data = &ipq8074_pciephy_cfg,
+	}, {
+		.compatible = "qcom,sdm845-qhp-pcie-phy",
+		.data = &sdm845_qhp_pciephy_cfg,
 	}, {
 		.compatible = "qcom,sdm845-qmp-pcie-phy",
 		.data = &sdm845_qmp_pciephy_cfg,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index ab6ff9b45a32..bed19a6965e5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -409,4 +409,118 @@
 #define QPHY_V4_TX_MID_TERM_CTRL1			0x1d8
 #define QPHY_V4_MULTI_LANE_CTRL1			0x1e0
 
+/* PCIE GEN3 COM registers */
+#define PCIE_GEN3_QHP_COM_SSC_EN_CENTER			0x14
+#define PCIE_GEN3_QHP_COM_SSC_PER1			0x20
+#define PCIE_GEN3_QHP_COM_SSC_PER2			0x24
+#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1		0x28
+#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2		0x2c
+#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1_MODE1		0x34
+#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2_MODE1		0x38
+#define PCIE_GEN3_QHP_COM_BIAS_EN_CKBUFLR_EN		0x54
+#define PCIE_GEN3_QHP_COM_CLK_ENABLE1			0x58
+#define PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE0		0x6c
+#define PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE0		0x70
+#define PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE1		0x78
+#define PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE1		0x7c
+#define PCIE_GEN3_QHP_COM_BGV_TRIM			0x98
+#define PCIE_GEN3_QHP_COM_CP_CTRL_MODE0			0xb4
+#define PCIE_GEN3_QHP_COM_CP_CTRL_MODE1			0xb8
+#define PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE0		0xc0
+#define PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE1		0xc4
+#define PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE0		0xcc
+#define PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE1		0xd0
+#define PCIE_GEN3_QHP_COM_SYSCLK_EN_SEL			0xdc
+#define PCIE_GEN3_QHP_COM_RESTRIM_CTRL2			0xf0
+#define PCIE_GEN3_QHP_COM_LOCK_CMP_EN			0xf8
+#define PCIE_GEN3_QHP_COM_DEC_START_MODE0		0x100
+#define PCIE_GEN3_QHP_COM_DEC_START_MODE1		0x108
+#define PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE0		0x11c
+#define PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE0		0x120
+#define PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE0		0x124
+#define PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE1		0x128
+#define PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE1		0x12c
+#define PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE1		0x130
+#define PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE0		0x150
+#define PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE1		0x158
+#define PCIE_GEN3_QHP_COM_VCO_TUNE_MAP			0x178
+#define PCIE_GEN3_QHP_COM_BG_CTRL			0x1c8
+#define PCIE_GEN3_QHP_COM_CLK_SELECT			0x1cc
+#define PCIE_GEN3_QHP_COM_HSCLK_SEL1			0x1d0
+#define PCIE_GEN3_QHP_COM_CORECLK_DIV			0x1e0
+#define PCIE_GEN3_QHP_COM_CORE_CLK_EN			0x1e8
+#define PCIE_GEN3_QHP_COM_CMN_CONFIG			0x1f0
+#define PCIE_GEN3_QHP_COM_SVS_MODE_CLK_SEL		0x1fc
+#define PCIE_GEN3_QHP_COM_CORECLK_DIV_MODE1		0x21c
+#define PCIE_GEN3_QHP_COM_CMN_MODE			0x224
+#define PCIE_GEN3_QHP_COM_VREGCLK_DIV1			0x228
+#define PCIE_GEN3_QHP_COM_VREGCLK_DIV2			0x22c
+
+/* PCIE GEN3 QHP Lane registers */
+#define PCIE_GEN3_QHP_L0_DRVR_CTRL0			0xc
+#define PCIE_GEN3_QHP_L0_DRVR_CTRL1			0x10
+#define PCIE_GEN3_QHP_L0_DRVR_CTRL2			0x14
+#define PCIE_GEN3_QHP_L0_DRVR_TAP_EN			0x18
+#define PCIE_GEN3_QHP_L0_TX_BAND_MODE			0x60
+#define PCIE_GEN3_QHP_L0_LANE_MODE			0x64
+#define PCIE_GEN3_QHP_L0_PARALLEL_RATE			0x7c
+#define PCIE_GEN3_QHP_L0_CML_CTRL_MODE0			0xc0
+#define PCIE_GEN3_QHP_L0_CML_CTRL_MODE1			0xc4
+#define PCIE_GEN3_QHP_L0_CML_CTRL_MODE2			0xc8
+#define PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE1		0xd0
+#define PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE2		0xd4
+#define PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE0		0xd8
+#define PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE1		0xdc
+#define PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE2		0xe0
+#define PCIE_GEN3_QHP_L0_CTLE_THRESH_DFE		0xfc
+#define PCIE_GEN3_QHP_L0_CGA_THRESH_DFE			0x100
+#define PCIE_GEN3_QHP_L0_RXENGINE_EN0			0x108
+#define PCIE_GEN3_QHP_L0_CTLE_TRAIN_TIME		0x114
+#define PCIE_GEN3_QHP_L0_CTLE_DFE_OVRLP_TIME		0x118
+#define PCIE_GEN3_QHP_L0_DFE_REFRESH_TIME		0x11c
+#define PCIE_GEN3_QHP_L0_DFE_ENABLE_TIME		0x120
+#define PCIE_GEN3_QHP_L0_VGA_GAIN			0x124
+#define PCIE_GEN3_QHP_L0_DFE_GAIN			0x128
+#define PCIE_GEN3_QHP_L0_EQ_GAIN			0x130
+#define PCIE_GEN3_QHP_L0_OFFSET_GAIN			0x134
+#define PCIE_GEN3_QHP_L0_PRE_GAIN			0x138
+#define PCIE_GEN3_QHP_L0_VGA_INITVAL			0x13c
+#define PCIE_GEN3_QHP_L0_EQ_INTVAL			0x154
+#define PCIE_GEN3_QHP_L0_EDAC_INITVAL			0x160
+#define PCIE_GEN3_QHP_L0_RXEQ_INITB0			0x168
+#define PCIE_GEN3_QHP_L0_RXEQ_INITB1			0x16c
+#define PCIE_GEN3_QHP_L0_RCVRDONE_THRESH1		0x178
+#define PCIE_GEN3_QHP_L0_RXEQ_CTRL			0x180
+#define PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE0		0x184
+#define PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE1		0x188
+#define PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE2		0x18c
+#define PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE0		0x190
+#define PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE1		0x194
+#define PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE2		0x198
+#define PCIE_GEN3_QHP_L0_UCDR_SO_CONFIG			0x19c
+#define PCIE_GEN3_QHP_L0_RX_BAND			0x1a4
+#define PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE0		0x1c0
+#define PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE1		0x1c4
+#define PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE2		0x1c8
+#define PCIE_GEN3_QHP_L0_SIGDET_ENABLES			0x230
+#define PCIE_GEN3_QHP_L0_SIGDET_CNTRL			0x234
+#define PCIE_GEN3_QHP_L0_SIGDET_DEGLITCH_CNTRL		0x238
+#define PCIE_GEN3_QHP_L0_DCC_GAIN			0x2a4
+#define PCIE_GEN3_QHP_L0_RSM_START			0x2a8
+#define PCIE_GEN3_QHP_L0_RX_EN_SIGNAL			0x2ac
+#define PCIE_GEN3_QHP_L0_PSM_RX_EN_CAL			0x2b0
+#define PCIE_GEN3_QHP_L0_RX_MISC_CNTRL0			0x2b8
+#define PCIE_GEN3_QHP_L0_TS0_TIMER			0x2c0
+#define PCIE_GEN3_QHP_L0_DLL_HIGHDATARATE		0x2c4
+#define PCIE_GEN3_QHP_L0_RX_RESETCODE_OFFSET		0x2cc
+
+/* PCIE GEN3 PCS registers */
+#define PCIE_GEN3_QHP_PHY_TXMGN_MAIN_V0_M3P5DB		0x2c
+#define PCIE_GEN3_QHP_PHY_TXMGN_POST_V0_M3P5DB		0x40
+#define PCIE_GEN3_QHP_PHY_TXMGN_MAIN_V0_M6DB		0x54
+#define PCIE_GEN3_QHP_PHY_TXMGN_POST_V0_M6DB		0x68
+#define PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG		0x15c
+#define PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG5		0x16c
+#define PCIE_GEN3_QHP_PHY_PCS_TX_RX_CONFIG		0x174
+
 #endif
-- 
2.23.0

