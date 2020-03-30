Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B196198492
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 21:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbgC3ThT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 15:37:19 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:34546 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728733AbgC3ThN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 15:37:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585597032; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=6NBRgSkB04lnlQNl9JWfaKmDzhvU4Sal9aDU/x5Dc84=; b=iWfTHn82iaF0VgRJXy5lpFD+fW+2oqpLCWRa7gYYV6EjzxeQ18ZkEXHq8K9OfJliwVKlmDAM
 QRD/tFo/9kWOTQA4VgY0BF3ogKdmj1unDTkDsvez683zACYx9Xleh3VbnzLsQxO3r0X1UfpV
 NO19Q5bq49yUDwMbK3JhMyYIix8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e824a67.7fc542351618-smtp-out-n04;
 Mon, 30 Mar 2020 19:37:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E5EAC433BA; Mon, 30 Mar 2020 19:37:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 541ABC433BA;
        Mon, 30 Mar 2020 19:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 541ABC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jack Pham <jackp@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v4 3/4] phy: qcom-qmp: Add SM8150 QMP USB3 PHY support
Date:   Mon, 30 Mar 2020 12:36:56 -0700
Message-Id: <1585597017-30683-4-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585597017-30683-1-git-send-email-wcheng@codeaurora.org>
References: <1585597017-30683-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jack Pham <jackp@codeaurora.org>

Add support for SM8150 QMP USB3 PHY with the necessary
initialization sequences as well as additional QMP V4
register definitions.

Signed-off-by: Jack Pham <jackp@codeaurora.org>
Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 153 ++++++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h | 198 +++++++++++++++++++++++++++++++++++-
 2 files changed, 349 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 7db2a94..cc04471 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -160,6 +160,12 @@ enum qphy_reg_layout {
 	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x170,
 };
 
+static const unsigned int qmp_v4_usb3phy_regs_layout[] = {
+	[QPHY_SW_RESET]			= 0x00,
+	[QPHY_START_CTRL]		= 0x44,
+	[QPHY_PCS_STATUS]		= 0x14,
+};
+
 static const unsigned int sdm845_ufsphy_regs_layout[] = {
 	[QPHY_START_CTRL]		= 0x00,
 	[QPHY_PCS_READY_STATUS]		= 0x160,
@@ -972,6 +978,115 @@ enum qphy_reg_layout {
 	QMP_PHY_INIT_CFG(QPHY_V4_MULTI_LANE_CTRL1, 0x02),
 };
 
+static const struct qmp_phy_init_tbl sm8150_usb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0xde),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1, 0xde),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_IPTRIM, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0xea),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE1, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE1, 0xea),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xca),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xca),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
+};
+
+static const struct qmp_phy_init_tbl sm8150_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x20),
+};
+
+static const struct qmp_phy_init_tbl sm8150_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x94),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb3),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VTH_CODE, 0x10),
+};
+
+static const struct qmp_phy_init_tbl sm8150_usb3_pcs_tbl[] = {
+	/* Lock Det settings */
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
+
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+};
+
+
 /* struct qmp_phy_cfg - per-PHY initialization config */
 struct qmp_phy_cfg {
 	/* phy-type - PCIE/UFS/USB */
@@ -1126,6 +1241,10 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 	"aux", "cfg_ahb", "ref", "com_aux",
 };
 
+static const char * const qmp_v4_phy_clk_l[] = {
+	"aux", "ref_clk_src", "ref", "com_aux",
+};
+
 static const char * const sdm845_ufs_phy_clk_l[] = {
 	"ref", "ref_aux",
 };
@@ -1392,6 +1511,37 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 	.is_dual_lane_phy	= true,
 };
 
+static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
+	.type			= PHY_TYPE_USB3,
+	.nlanes			= 1,
+
+	.serdes_tbl		= sm8150_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
+	.tx_tbl			= sm8150_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8150_usb3_tx_tbl),
+	.rx_tbl			= sm8150_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8150_usb3_rx_tbl),
+	.pcs_tbl		= sm8150_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8150_usb3_pcs_tbl),
+	.clk_list		= qmp_v4_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v4_usb3phy_regs_layout,
+
+	.start_ctrl		= SERDES_START | PCS_START,
+	.pwrdn_ctrl		= SW_PWRDN,
+
+	.has_pwrdn_delay	= true,
+	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
+	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
+
+	.has_phy_dp_com_ctrl	= true,
+	.is_dual_lane_phy	= true,
+};
+
 static void qcom_qmp_phy_configure(void __iomem *base,
 				   const unsigned int *regs,
 				   const struct qmp_phy_init_tbl tbl[],
@@ -2117,6 +2267,9 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
 	}, {
 		.compatible = "qcom,sm8150-qmp-ufs-phy",
 		.data = &sm8150_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm8150-qmp-usb3-phy",
+		.data = &sm8150_usb3phy_cfg,
 	},
 	{ },
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 90f793c..22c9009 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -125,7 +125,7 @@
 #define QPHY_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB		0x1DC
 #define QPHY_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB		0x1E0
 
-/* Only for QMP V3 PHY - DP COM registers */
+/* Only for QMP V3 & V4 PHY - DP COM registers */
 #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
 #define QPHY_V3_DP_COM_SW_RESET				0x04
 #define QPHY_V3_DP_COM_POWER_DOWN_CTRL			0x08
@@ -314,6 +314,14 @@
 #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG5		0x60
 
 /* Only for QMP V4 PHY - QSERDES COM registers */
+#define QSERDES_V4_COM_SSC_EN_CENTER			0x010
+#define QSERDES_V4_COM_SSC_PER1				0x01c
+#define QSERDES_V4_COM_SSC_PER2				0x020
+#define QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0		0x024
+#define QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0		0x028
+#define QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1		0x030
+#define QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1		0x034
+#define QSERDES_V4_COM_SYSCLK_BUF_ENABLE		0x050
 #define QSERDES_V4_COM_PLL_IVCO				0x058
 #define QSERDES_V4_COM_CMN_IPTRIM			0x060
 #define QSERDES_V4_COM_CP_CTRL_MODE0			0x074
@@ -330,10 +338,22 @@
 #define QSERDES_V4_COM_DEC_START_MODE0			0x0bc
 #define QSERDES_V4_COM_LOCK_CMP2_MODE1			0x0b8
 #define QSERDES_V4_COM_DEC_START_MODE1			0x0c4
+#define QSERDES_V4_COM_DIV_FRAC_START1_MODE0		0x0cc
+#define QSERDES_V4_COM_DIV_FRAC_START2_MODE0		0x0d0
+#define QSERDES_V4_COM_DIV_FRAC_START3_MODE0		0x0d4
+#define QSERDES_V4_COM_DIV_FRAC_START1_MODE1		0x0d8
+#define QSERDES_V4_COM_DIV_FRAC_START2_MODE1		0x0dc
+#define QSERDES_V4_COM_DIV_FRAC_START3_MODE1		0x0e0
 #define QSERDES_V4_COM_VCO_TUNE_MAP			0x10c
+#define QSERDES_V4_COM_VCO_TUNE1_MODE0			0x110
+#define QSERDES_V4_COM_VCO_TUNE2_MODE0			0x114
+#define QSERDES_V4_COM_VCO_TUNE1_MODE1			0x118
+#define QSERDES_V4_COM_VCO_TUNE2_MODE1			0x11c
 #define QSERDES_V4_COM_VCO_TUNE_INITVAL2		0x124
 #define QSERDES_V4_COM_HSCLK_SEL			0x158
 #define QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL		0x15c
+#define QSERDES_V4_COM_CORECLK_DIV_MODE1		0x16c
+#define QSERDES_V4_COM_SVS_MODE_CLK_SEL			0x184
 #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
 #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
 #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1	0x1b4
@@ -341,12 +361,16 @@
 #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1	0x1b8
 
 /* Only for QMP V4 PHY - TX registers */
+#define QSERDES_V4_TX_RES_CODE_LANE_TX			0x34
+#define QSERDES_V4_TX_RES_CODE_LANE_RX			0x38
 #define QSERDES_V4_TX_LANE_MODE_1			0x84
+#define QSERDES_V4_TX_RCV_DETECT_LVL_2			0x9c
 #define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0xd8
 #define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0xdC
 #define QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1	0xe0
 #define QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1	0xe4
 #define QSERDES_V4_TX_TRAN_DRVR_EMP_EN			0xb8
+#define QSERDES_V4_TX_PI_QEC_CTRL		0x104
 
 /* Only for QMP V4 PHY - RX registers */
 #define QSERDES_V4_RX_UCDR_FO_GAIN			0x008
@@ -354,17 +378,27 @@
 #define QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN		0x030
 #define QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE	0x034
 #define QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW		0x03c
+#define QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH		0x040
 #define QSERDES_V4_RX_UCDR_PI_CONTROLS			0x044
 #define QSERDES_V4_RX_UCDR_PI_CTRL2			0x048
+#define QSERDES_V4_RX_UCDR_SB2_THRESH1			0x04c
+#define QSERDES_V4_RX_UCDR_SB2_THRESH2			0x050
+#define QSERDES_V4_RX_UCDR_SB2_GAIN1			0x054
+#define QSERDES_V4_RX_UCDR_SB2_GAIN2			0x058
+#define QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE			0x060
 #define QSERDES_V4_RX_AC_JTAG_ENABLE			0x068
 #define QSERDES_V4_RX_AC_JTAG_MODE			0x078
 #define QSERDES_V4_RX_RX_TERM_BW			0x080
+#define QSERDES_V4_RX_VGA_CAL_CNTRL1			0x0d4
+#define QSERDES_V4_RX_VGA_CAL_CNTRL2			0x0d8
+#define QSERDES_V4_RX_GM_CAL				0x0dc
 #define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2		0x0ec
 #define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3		0x0f0
 #define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4		0x0f4
 #define QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW		0x0f8
 #define QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH		0x0fc
 #define QSERDES_V4_RX_RX_IDAC_MEASURE_TIME		0x100
+#define QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x110
 #define QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x114
 #define QSERDES_V4_RX_SIGDET_CNTRL			0x11c
 #define QSERDES_V4_RX_SIGDET_LVL			0x120
@@ -385,9 +419,12 @@
 #define QSERDES_V4_RX_RX_MODE_10_HIGH2			0x1a0
 #define QSERDES_V4_RX_RX_MODE_10_HIGH3			0x1a4
 #define QSERDES_V4_RX_RX_MODE_10_HIGH4			0x1a8
+#define QSERDES_V4_RX_DFE_EN_TIMER			0x1b4
+#define QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET		0x1b8
 #define QSERDES_V4_RX_DCC_CTRL1				0x1bc
+#define QSERDES_V4_RX_VTH_CODE				0x1c4
 
-/* Only for QMP V4 PHY - PCS registers */
+/* Only for QMP V4 PHY - UFS PCS registers */
 #define QPHY_V4_PHY_START				0x000
 #define QPHY_V4_POWER_DOWN_CONTROL			0x004
 #define QPHY_V4_SW_RESET				0x008
@@ -409,4 +446,161 @@
 #define QPHY_V4_TX_MID_TERM_CTRL1			0x1d8
 #define QPHY_V4_MULTI_LANE_CTRL1			0x1e0
 
+/* Only for QMP V4 PHY - USB/PCIe PCS registers */
+#define QPHY_V4_PCS_SW_RESET				0x000
+#define QPHY_V4_PCS_REVISION_ID0			0x004
+#define QPHY_V4_PCS_REVISION_ID1			0x008
+#define QPHY_V4_PCS_REVISION_ID2			0x00c
+#define QPHY_V4_PCS_REVISION_ID3			0x010
+#define QPHY_V4_PCS_PCS_STATUS1				0x014
+#define QPHY_V4_PCS_PCS_STATUS2				0x018
+#define QPHY_V4_PCS_PCS_STATUS3				0x01c
+#define QPHY_V4_PCS_PCS_STATUS4				0x020
+#define QPHY_V4_PCS_PCS_STATUS5				0x024
+#define QPHY_V4_PCS_PCS_STATUS6				0x028
+#define QPHY_V4_PCS_PCS_STATUS7				0x02c
+#define QPHY_V4_PCS_DEBUG_BUS_0_STATUS			0x030
+#define QPHY_V4_PCS_DEBUG_BUS_1_STATUS			0x034
+#define QPHY_V4_PCS_DEBUG_BUS_2_STATUS			0x038
+#define QPHY_V4_PCS_DEBUG_BUS_3_STATUS			0x03c
+#define QPHY_V4_PCS_POWER_DOWN_CONTROL			0x040
+#define QPHY_V4_PCS_START_CONTROL			0x044
+#define QPHY_V4_PCS_INSIG_SW_CTRL1			0x048
+#define QPHY_V4_PCS_INSIG_SW_CTRL2			0x04c
+#define QPHY_V4_PCS_INSIG_SW_CTRL3			0x050
+#define QPHY_V4_PCS_INSIG_SW_CTRL4			0x054
+#define QPHY_V4_PCS_INSIG_SW_CTRL5			0x058
+#define QPHY_V4_PCS_INSIG_SW_CTRL6			0x05c
+#define QPHY_V4_PCS_INSIG_SW_CTRL7			0x060
+#define QPHY_V4_PCS_INSIG_SW_CTRL8			0x064
+#define QPHY_V4_PCS_INSIG_MX_CTRL1			0x068
+#define QPHY_V4_PCS_INSIG_MX_CTRL2			0x06c
+#define QPHY_V4_PCS_INSIG_MX_CTRL3			0x070
+#define QPHY_V4_PCS_INSIG_MX_CTRL4			0x074
+#define QPHY_V4_PCS_INSIG_MX_CTRL5			0x078
+#define QPHY_V4_PCS_INSIG_MX_CTRL7			0x07c
+#define QPHY_V4_PCS_INSIG_MX_CTRL8			0x080
+#define QPHY_V4_PCS_OUTSIG_SW_CTRL1			0x084
+#define QPHY_V4_PCS_OUTSIG_MX_CTRL1			0x088
+#define QPHY_V4_PCS_CLAMP_ENABLE			0x08c
+#define QPHY_V4_PCS_POWER_STATE_CONFIG1			0x090
+#define QPHY_V4_PCS_POWER_STATE_CONFIG2			0x094
+#define QPHY_V4_PCS_FLL_CNTRL1				0x098
+#define QPHY_V4_PCS_FLL_CNTRL2				0x09c
+#define QPHY_V4_PCS_FLL_CNT_VAL_L			0x0a0
+#define QPHY_V4_PCS_FLL_CNT_VAL_H_TOL			0x0a4
+#define QPHY_V4_PCS_FLL_MAN_CODE			0x0a8
+#define QPHY_V4_PCS_TEST_CONTROL1			0x0ac
+#define QPHY_V4_PCS_TEST_CONTROL2			0x0b0
+#define QPHY_V4_PCS_TEST_CONTROL3			0x0b4
+#define QPHY_V4_PCS_TEST_CONTROL4			0x0b8
+#define QPHY_V4_PCS_TEST_CONTROL5			0x0bc
+#define QPHY_V4_PCS_TEST_CONTROL6			0x0c0
+#define QPHY_V4_PCS_LOCK_DETECT_CONFIG1			0x0c4
+#define QPHY_V4_PCS_LOCK_DETECT_CONFIG2			0x0c8
+#define QPHY_V4_PCS_LOCK_DETECT_CONFIG3			0x0cc
+#define QPHY_V4_PCS_LOCK_DETECT_CONFIG4			0x0d0
+#define QPHY_V4_PCS_LOCK_DETECT_CONFIG5			0x0d4
+#define QPHY_V4_PCS_LOCK_DETECT_CONFIG6			0x0d8
+#define QPHY_V4_PCS_REFGEN_REQ_CONFIG1			0x0dc
+#define QPHY_V4_PCS_REFGEN_REQ_CONFIG2			0x0e0
+#define QPHY_V4_PCS_REFGEN_REQ_CONFIG3			0x0e4
+#define QPHY_V4_PCS_BIST_CTRL				0x0e8
+#define QPHY_V4_PCS_PRBS_POLY0				0x0ec
+#define QPHY_V4_PCS_PRBS_POLY1				0x0f0
+#define QPHY_V4_PCS_FIXED_PAT0				0x0f4
+#define QPHY_V4_PCS_FIXED_PAT1				0x0f8
+#define QPHY_V4_PCS_FIXED_PAT2				0x0fc
+#define QPHY_V4_PCS_FIXED_PAT3				0x100
+#define QPHY_V4_PCS_FIXED_PAT4				0x104
+#define QPHY_V4_PCS_FIXED_PAT5				0x108
+#define QPHY_V4_PCS_FIXED_PAT6				0x10c
+#define QPHY_V4_PCS_FIXED_PAT7				0x110
+#define QPHY_V4_PCS_FIXED_PAT8				0x114
+#define QPHY_V4_PCS_FIXED_PAT9				0x118
+#define QPHY_V4_PCS_FIXED_PAT10				0x11c
+#define QPHY_V4_PCS_FIXED_PAT11				0x120
+#define QPHY_V4_PCS_FIXED_PAT12				0x124
+#define QPHY_V4_PCS_FIXED_PAT13				0x128
+#define QPHY_V4_PCS_FIXED_PAT14				0x12c
+#define QPHY_V4_PCS_FIXED_PAT15				0x130
+#define QPHY_V4_PCS_TXMGN_CONFIG			0x134
+#define QPHY_V4_PCS_G12S1_TXMGN_V0			0x138
+#define QPHY_V4_PCS_G12S1_TXMGN_V1			0x13c
+#define QPHY_V4_PCS_G12S1_TXMGN_V2			0x140
+#define QPHY_V4_PCS_G12S1_TXMGN_V3			0x144
+#define QPHY_V4_PCS_G12S1_TXMGN_V4			0x148
+#define QPHY_V4_PCS_G12S1_TXMGN_V0_RS			0x14c
+#define QPHY_V4_PCS_G12S1_TXMGN_V1_RS			0x150
+#define QPHY_V4_PCS_G12S1_TXMGN_V2_RS			0x154
+#define QPHY_V4_PCS_G12S1_TXMGN_V3_RS			0x158
+#define QPHY_V4_PCS_G12S1_TXMGN_V4_RS			0x15c
+#define QPHY_V4_PCS_G3S2_TXMGN_MAIN			0x160
+#define QPHY_V4_PCS_G3S2_TXMGN_MAIN_RS			0x164
+#define QPHY_V4_PCS_G12S1_TXDEEMPH_M6DB			0x168
+#define QPHY_V4_PCS_G12S1_TXDEEMPH_M3P5DB		0x16c
+#define QPHY_V4_PCS_G3S2_PRE_GAIN			0x170
+#define QPHY_V4_PCS_G3S2_POST_GAIN			0x174
+#define QPHY_V4_PCS_G3S2_PRE_POST_OFFSET		0x178
+#define QPHY_V4_PCS_G3S2_PRE_GAIN_RS			0x17c
+#define QPHY_V4_PCS_G3S2_POST_GAIN_RS			0x180
+#define QPHY_V4_PCS_G3S2_PRE_POST_OFFSET_RS		0x184
+#define QPHY_V4_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V4_PCS_RX_SIGDET_DTCT_CNTRL		0x18c
+#define QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
+#define QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
+#define QPHY_V4_PCS_RATE_SLEW_CNTRL1			0x198
+#define QPHY_V4_PCS_RATE_SLEW_CNTRL2			0x19c
+#define QPHY_V4_PCS_PWRUP_RESET_DLY_TIME_AUXCLK		0x1a0
+#define QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L	0x1a4
+#define QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_H	0x1a8
+#define QPHY_V4_PCS_TSYNC_RSYNC_TIME			0x1ac
+#define QPHY_V4_PCS_CDR_RESET_TIME			0x1b0
+#define QPHY_V4_PCS_TSYNC_DLY_TIME			0x1b4
+#define QPHY_V4_PCS_ELECIDLE_DLY_SEL			0x1b8
+#define QPHY_V4_PCS_CMN_ACK_OUT_SEL			0x1bc
+#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG1		0x1c0
+#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG2		0x1c4
+#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG3		0x1c8
+#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG4		0x1cc
+#define QPHY_V4_PCS_PCS_TX_RX_CONFIG			0x1d0
+#define QPHY_V4_PCS_RX_IDLE_DTCT_CNTRL			0x1d4
+#define QPHY_V4_PCS_RX_DCC_CAL_CONFIG			0x1d8
+#define QPHY_V4_PCS_EQ_CONFIG1				0x1dc
+#define QPHY_V4_PCS_EQ_CONFIG2				0x1e0
+#define QPHY_V4_PCS_EQ_CONFIG3				0x1e4
+#define QPHY_V4_PCS_EQ_CONFIG4				0x1e8
+#define QPHY_V4_PCS_EQ_CONFIG5				0x1ec
+#define QPHY_V4_PCS_USB3_POWER_STATE_CONFIG1		0x300
+#define QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_STATUS		0x304
+#define QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x308
+#define QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL2		0x30c
+#define QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_SOURCE_STATUS	0x310
+#define QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x314
+#define QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x318
+#define QPHY_V4_PCS_USB3_LFPS_TX_ECSTART		0x31c
+#define QPHY_V4_PCS_USB3_LFPS_PER_TIMER_VAL		0x320
+#define QPHY_V4_PCS_USB3_LFPS_TX_END_CNT_U3_START	0x324
+#define QPHY_V4_PCS_USB3_RXEQTRAINING_LOCK_TIME		0x328
+#define QPHY_V4_PCS_USB3_RXEQTRAINING_WAIT_TIME		0x32c
+#define QPHY_V4_PCS_USB3_RXEQTRAINING_CTLE_TIME		0x330
+#define QPHY_V4_PCS_USB3_RXEQTRAINING_WAIT_TIME_S2	0x334
+#define QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x338
+#define QPHY_V4_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x33c
+#define QPHY_V4_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x340
+#define QPHY_V4_PCS_USB3_ARCVR_DTCT_EN_PERIOD		0x344
+#define QPHY_V4_PCS_USB3_ARCVR_DTCT_CM_DLY		0x348
+#define QPHY_V4_PCS_USB3_TXONESZEROS_RUN_LENGTH		0x34c
+#define QPHY_V4_PCS_USB3_ALFPS_DEGLITCH_VAL		0x350
+#define QPHY_V4_PCS_USB3_SIGDET_STARTUP_TIMER_VAL	0x354
+#define QPHY_V4_PCS_USB3_TEST_CONTROL			0x358
+
+/* Only for QMP V4 PHY - PCS_MISC registers */
+#define QPHY_V4_PCS_MISC_TYPEC_CTRL			0x00
+#define QPHY_V4_PCS_MISC_TYPEC_PWRDN_CTRL		0x04
+#define QPHY_V4_PCS_MISC_PCS_MISC_CONFIG1		0x08
+#define QPHY_V4_PCS_MISC_CLAMP_ENABLE			0x0c
+#define QPHY_V4_PCS_MISC_TYPEC_STATUS			0x10
+#define QPHY_V4_PCS_MISC_PLACEHOLDER_STATUS		0x14
+
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
