Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55ED630FCA5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 20:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238231AbhBDTZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 14:25:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:54050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238247AbhBDQ7O (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 11:59:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5781A64F6A;
        Thu,  4 Feb 2021 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612457913;
        bh=3cR4ub0anzzqMSTyHOhBLKh7dM9treWJAF/IvIyFH+A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VN9RTB1BG8Ig+e0Zj1DO2T3L0hpHHK1B7cvvBcuKKa8C/5aU05gxLBv752brgFuDg
         Ax1JDJ2G01c4YT9OTeUbsJsn3kvjrrZ/O91eMeRbplhZtCS++VVFrtofaX4fBOePH5
         lHZp9+55Z02UsUO/rWdTjXG1N3JT2FSy7ceOLDKCDJ7HgZPGMNu6XI+dcMBAhVO04G
         IIwzcamxUTZ3mh90lrlKM0cH3/PWBUUuruUDjUV/tGOWOXTv0glOUptv6LPbwsFyLV
         z1KEtw/cnjvuEF7uYq+H5Ra2tzA71egcFx7HpMMb3Ecryc5dK3iyDn6GrDJriJ8oAU
         PFK/CZHQ3kVSA==
From:   Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] phy: qcom-qmp: Add support for SM8350 UFS phy
Date:   Thu,  4 Feb 2021 22:28:05 +0530
Message-Id: <20210204165805.62235-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204165805.62235-1-vkoul@kernel.org>
References: <20210204165805.62235-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the tables for init sequences for UFS QMP phy found in  SM8350 SoC.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 127 ++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index dbc12a19b702..4c6e0e86632b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1983,6 +1983,106 @@ static const struct qmp_phy_init_tbl sm8250_qmp_gen3x2_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
 };
 
+static const struct qmp_phy_init_tbl sm8350_ufsphy_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_EN_SEL, 0xd9),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_INITVAL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE0, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xac),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE1, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE1, 0x65),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE1, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
+
+	/* Rate B */
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x06),
+};
+
+static const struct qmp_phy_init_tbl sm8350_ufsphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_1_DIVIDER_BAND0_1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_2_DIVIDER_BAND0_1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_3_DIVIDER_BAND0_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_4_DIVIDER_BAND0_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xf5),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_TRAN_DRVR_EMP_EN, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl sm8350_ufsphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_LVL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_BAND, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x5a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0xf1),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_TERM_BW, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_MEASURE_TIME, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0x6d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x6d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xed),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0x3c),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0xe0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_LOW, 0xe0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DCC_CTRL1, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl sm8350_ufsphy_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_DEBUG_BUS_CLKSEL, 0x1f),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_MIN_HIBERN8_TIME, 0xff),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_PLL_CNTL, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB, 0x16),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB, 0xd8),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_PWM_GEAR_BAND, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HS_GEAR_BAND, 0x06),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL1, 0x0e),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
+};
+
 static const struct qmp_phy_init_tbl sm8350_usb3_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_TX, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_RX, 0x00),
@@ -2971,6 +3071,30 @@ static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
+static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
+	.type			= PHY_TYPE_UFS,
+	.nlanes			= 2,
+
+	.serdes_tbl		= sm8350_ufsphy_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes_tbl),
+	.tx_tbl			= sm8350_ufsphy_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx_tbl),
+	.rx_tbl			= sm8350_ufsphy_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx_tbl),
+	.pcs_tbl		= sm8350_ufsphy_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs_tbl),
+	.clk_list		= sdm845_ufs_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= sm8150_ufsphy_regs_layout,
+
+	.start_ctrl		= SERDES_START,
+	.pwrdn_ctrl		= SW_PWRDN,
+
+	.is_dual_lane_phy	= true,
+};
+
 static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -4379,6 +4503,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8250-qmp-modem-pcie-phy",
 		.data = &sm8250_qmp_gen3x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,sm8350-qmp-ufs-phy",
+		.data = &sm8350_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sm8350-qmp-usb3-phy",
 		.data = &sm8350_usb3phy_cfg,
-- 
2.26.2

