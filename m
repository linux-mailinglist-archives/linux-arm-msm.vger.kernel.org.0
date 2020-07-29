Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6628232187
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 17:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgG2PbI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 11:31:08 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:10005 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726664AbgG2PbH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 11:31:07 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Jul 2020 08:31:04 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg01-sd.qualcomm.com with ESMTP; 29 Jul 2020 08:30:56 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 20608219C2; Wed, 29 Jul 2020 21:00:55 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, kishon@ti.com, vkoul@kernel.org,
        svarbanov@mm-sol.com, lorenzo.pieralisi@arm.com,
        p.zabel@pengutronix.de, sivaprak@codeaurora.org,
        mgautam@codeaurora.org, smuthayy@codeaurora.org,
        varada@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Subject: [PATCH V2 4/7] phy: qcom-qmp: Add compatible for ipq8074 PCIe Gen3 qmp phy
Date:   Wed, 29 Jul 2020 21:00:04 +0530
Message-Id: <1596036607-11877-5-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596036607-11877-1-git-send-email-sivaprak@codeaurora.org>
References: <1596036607-11877-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ipq8074 has two PCIe ports, One Gen2 and one Gen3 ports.
Since support for Gen2 phy is already available, add support for
PCIe Gen3 phy.

Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
[V2]
 * Addressed review comments from Vinod
 drivers/phy/qualcomm/phy-qcom-pcie3-qmp.h | 139 ++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c       | 171 +++++++++++++++++++++++++++++-
 2 files changed, 308 insertions(+), 2 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-pcie3-qmp.h

diff --git a/drivers/phy/qualcomm/phy-qcom-pcie3-qmp.h b/drivers/phy/qualcomm/phy-qcom-pcie3-qmp.h
new file mode 100644
index 0000000..812ee75
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-pcie3-qmp.h
@@ -0,0 +1,139 @@
+/* SPDX-License-Identifier: GPL-2.0
+ */
+
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef PHY_QCOM_PCIE_H
+
+/* QMP V2 PCIE PHY - Found in IPQ8074 gen3 port - QSERDES PLL registers */
+#define QSERDES_PLL_BG_TIMER				0x00c
+#define QSERDES_PLL_SSC_PER1				0x01c
+#define QSERDES_PLL_SSC_PER2				0x020
+#define QSERDES_PLL_SSC_STEP_SIZE1_MODE0		0x024
+#define QSERDES_PLL_SSC_STEP_SIZE2_MODE0		0x028
+#define QSERDES_PLL_SSC_STEP_SIZE1_MODE1		0x02c
+#define QSERDES_PLL_SSC_STEP_SIZE2_MODE1		0x030
+#define QSERDES_PLL_BIAS_EN_CLKBUFLR_EN			0x03c
+#define QSERDES_PLL_CLK_ENABLE1				0x040
+#define QSERDES_PLL_SYS_CLK_CTRL			0x044
+#define QSERDES_PLL_SYSCLK_BUF_ENABLE			0x048
+#define QSERDES_PLL_PLL_IVCO				0x050
+#define QSERDES_PLL_LOCK_CMP1_MODE0			0x054
+#define QSERDES_PLL_LOCK_CMP2_MODE0			0x058
+#define QSERDES_PLL_LOCK_CMP1_MODE1			0x060
+#define QSERDES_PLL_LOCK_CMP2_MODE1			0x064
+#define QSERDES_PLL_BG_TRIM				0x074
+#define QSERDES_PLL_CLK_EP_DIV_MODE0			0x078
+#define QSERDES_PLL_CLK_EP_DIV_MODE1			0x07c
+#define QSERDES_PLL_CP_CTRL_MODE0			0x080
+#define QSERDES_PLL_CP_CTRL_MODE1			0x084
+#define QSERDES_PLL_PLL_RCTRL_MODE0			0x088
+#define	QSERDES_PLL_PLL_RCTRL_MODE1			0x08C
+#define QSERDES_PLL_PLL_CCTRL_MODE0			0x090
+#define	QSERDES_PLL_PLL_CCTRL_MODE1			0x094
+#define QSERDES_PLL_BIAS_EN_CTRL_BY_PSM			0x0a4
+#define	QSERDES_PLL_SYSCLK_EN_SEL			0x0a8
+#define QSERDES_PLL_RESETSM_CNTRL			0x0b0
+#define QSERDES_PLL_LOCK_CMP_EN				0x0c4
+#define QSERDES_PLL_DEC_START_MODE0			0x0cc
+#define QSERDES_PLL_DEC_START_MODE1			0x0d0
+#define QSERDES_PLL_DIV_FRAC_START1_MODE0		0x0d8
+#define QSERDES_PLL_DIV_FRAC_START2_MODE0		0x0dc
+#define QSERDES_PLL_DIV_FRAC_START3_MODE0		0x0e0
+#define QSERDES_PLL_DIV_FRAC_START1_MODE1		0x0e4
+#define QSERDES_PLL_DIV_FRAC_START2_MODE1		0x0e8
+#define QSERDES_PLL_DIV_FRAC_START3_MODE1		0x0eC
+#define QSERDES_PLL_INTEGLOOP_GAIN0_MODE0		0x100
+#define QSERDES_PLL_INTEGLOOP_GAIN1_MODE0		0x104
+#define QSERDES_PLL_INTEGLOOP_GAIN0_MODE1		0x108
+#define QSERDES_PLL_INTEGLOOP_GAIN1_MODE1		0x10c
+#define QSERDES_PLL_VCO_TUNE_MAP			0x120
+#define QSERDES_PLL_VCO_TUNE1_MODE0			0x124
+#define QSERDES_PLL_VCO_TUNE2_MODE0			0x128
+#define QSERDES_PLL_VCO_TUNE1_MODE1			0x12c
+#define QSERDES_PLL_VCO_TUNE2_MODE1			0x130
+#define QSERDES_PLL_VCO_TUNE_TIMER1			0x13c
+#define QSERDES_PLL_VCO_TUNE_TIMER2			0x140
+#define QSERDES_PLL_CLK_SELECT				0x16c
+#define QSERDES_PLL_HSCLK_SEL				0x170
+#define QSERDES_PLL_CORECLK_DIV				0x17c
+#define QSERDES_PLL_CORE_CLK_EN				0x184
+#define	QSERDES_PLL_CMN_CONFIG				0x18c
+#define QSERDES_PLL_SVS_MODE_CLK_SEL			0x194
+#define QSERDES_PLL_CORECLK_DIV_MODE1			0x1b4
+
+/* QMP V2 PCIE PHY - Found in IPQ8074 gen3 port - - QSERDES TX registers */
+#define QSERDES_TX0_RES_CODE_LANE_OFFSET_TX		0x03c
+#define QSERDES_TX0_HIGHZ_DRVR_EN			0x058
+#define QSERDES_TX0_LANE_MODE_1				0x084
+#define QSERDES_TX0_RCV_DETECT_LVL_2			0x09c
+
+/* QMP V2 PCIE PHY - Found in IPQ8074 gen3 port - QSERDES RX registers */
+#define QSERDES_RX0_UCDR_FO_GAIN			0x008
+#define QSERDES_RX0_UCDR_SO_GAIN			0x014
+#define QSERDES_RX0_UCDR_SO_SATURATION_AND_ENABLE	0x034
+#define QSERDES_RX0_UCDR_PI_CONTROLS			0x044
+#define QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL2		0x0ec
+#define QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL3		0x0f0
+#define QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL4		0x0f4
+#define QSERDES_RX0_RX_IDAC_TSETTLE_LOW			0x0f8
+#define QSERDES_RX0_RX_IDAC_TSETTLE_HIGH		0x0fc
+#define QSERDES_RX0_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x110
+#define QSERDES_RX0_RX_OFFSET_ADAPTOR_CNTRL2		0x114
+#define QSERDES_RX0_SIGDET_ENABLES			0x118
+#define QSERDES_RX0_SIGDET_CNTRL			0x11c
+#define QSERDES_RX0_SIGDET_DEGLITCH_CNTRL		0x124
+#define QSERDES_RX0_RX_MODE_00_LOW			0x170
+#define QSERDES_RX0_RX_MODE_00_HIGH			0x174
+#define QSERDES_RX0_RX_MODE_00_HIGH2			0x178
+#define QSERDES_RX0_RX_MODE_00_HIGH3			0x17c
+#define QSERDES_RX0_RX_MODE_00_HIGH4			0x180
+#define QSERDES_RX0_RX_MODE_01_LOW			0x184
+#define QSERDES_RX0_RX_MODE_01_HIGH			0x188
+#define QSERDES_RX0_RX_MODE_01_HIGH2			0x18c
+#define QSERDES_RX0_RX_MODE_01_HIGH3			0x190
+#define QSERDES_RX0_RX_MODE_01_HIGH4			0x194
+#define QSERDES_RX0_RX_MODE_10_LOW			0x198
+#define QSERDES_RX0_RX_MODE_10_HIGH			0x19c
+#define QSERDES_RX0_RX_MODE_10_HIGH2			0x1a0
+#define QSERDES_RX0_RX_MODE_10_HIGH3			0x1a4
+#define QSERDES_RX0_RX_MODE_10_HIGH4			0x1a8
+#define QSERDES_RX0_DFE_EN_TIMER			0x1b4
+
+/* QMP V2 PCIE PHY - Found in IPQ8074 gen3 port - PCS registers */
+
+#define PCS_COM_FLL_CNTRL1				0x098
+#define PCS_COM_FLL_CNTRL2				0x09c
+#define PCS_COM_FLL_CNT_VAL_L				0x0a0
+#define PCS_COM_FLL_CNT_VAL_H_TOL			0x0a4
+#define PCS_COM_FLL_MAN_CODE				0x0a8
+#define PCS_COM_REFGEN_REQ_CONFIG1			0x0dc
+#define PCS_COM_G12S1_TXDEEMPH_M3P5DB			0x16c
+#define PCS_COM_RX_SIGDET_LVL				0x188
+#define PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_L		0x1a4
+#define PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_H		0x1a8
+#define PCS_COM_RX_DCC_CAL_CONFIG			0x1d8
+#define PCS_COM_EQ_CONFIG5				0x1ec
+
+/* QMP V2 PCIE PHY - Found in IPQ8074 gen3 port - PCS Misc registers */
+
+#define PCS_PCIE_POWER_STATE_CONFIG2			0x40c
+#define PCS_PCIE_POWER_STATE_CONFIG4			0x414
+#define PCS_PCIE_ENDPOINT_REFCLK_DRIVE			0x41c
+#define PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L		0x440
+#define PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_H		0x444
+#define PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L		0x448
+#define PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_H		0x44c
+#define PCS_PCIE_OSC_DTCT_CONFIG2			0x45c
+#define PCS_PCIE_OSC_DTCT_MODE2_CONFIG2			0x478
+#define PCS_PCIE_OSC_DTCT_MODE2_CONFIG4			0x480
+#define PCS_PCIE_OSC_DTCT_MODE2_CONFIG5			0x484
+#define PCS_PCIE_OSC_DTCT_ACTIONS			0x490
+#define PCS_PCIE_EQ_CONFIG1				0x4a0
+#define PCS_PCIE_EQ_CONFIG2				0x4a4
+#define PCS_PCIE_PRESET_P10_PRE				0x4bc
+#define PCS_PCIE_PRESET_P10_POST			0x4e0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 6e6f992..645f604 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -23,6 +23,7 @@
 #include <dt-bindings/phy/phy.h>
 
 #include "phy-qcom-qmp.h"
+#include "phy-qcom-pcie3-qmp.h"
 
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
@@ -676,6 +677,132 @@ static const struct qmp_phy_init_tbl ipq8074_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG_L(QPHY_START_CTRL, 0x3),
 };
 
+static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CLKBUFLR_EN, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CTRL_BY_PSM, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_SELECT, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TRIM, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE_TIMER2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x21),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START3_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START2_MODE0, 0x355),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START1_MODE0, 0x35555),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE0, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE0, 0x1a0a),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE0, 0xb),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE0, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE0, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV, 0xa),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_SELECT, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_BUF_ENABLE, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TIMER, 0xa),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE1, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START3_MODE1, 0x2),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START2_MODE1, 0x2aa),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START1_MODE1, 0x2aaab),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE1, 0x3414),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE1, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE1, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE1, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_EP_DIV_MODE0, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_EP_DIV_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_ENABLE1, 0x90),
+};
+
+static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_TX0_RES_CODE_LANE_OFFSET_TX, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_TX0_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_TX0_HIGHZ_DRVR_EN, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_TX0_LANE_MODE_1, 0x06),
+};
+
+static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_RX0_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_SIGDET_DEGLITCH_CNTRL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL2, 0xe),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL3, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL4, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_PI_CONTROLS, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x73),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_LOW, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_LOW, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_LOW, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH, 0x2),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH2, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH3, 0xd3),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH4, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_FO_GAIN, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_SO_GAIN, 0x02),
+};
+
+static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(PCS_COM_FLL_CNTRL2, 0x83),
+	QMP_PHY_INIT_CFG(PCS_COM_FLL_CNT_VAL_L, 0x9),
+	QMP_PHY_INIT_CFG(PCS_COM_FLL_CNT_VAL_H_TOL, 0x42),
+	QMP_PHY_INIT_CFG(PCS_COM_FLL_MAN_CODE, 0x40),
+	QMP_PHY_INIT_CFG(PCS_COM_FLL_CNTRL1, 0x01),
+	QMP_PHY_INIT_CFG(PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_H, 0x0),
+	QMP_PHY_INIT_CFG(PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x1),
+	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_ACTIONS, 0x0),
+	QMP_PHY_INIT_CFG(PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
+	QMP_PHY_INIT_CFG(PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_H, 0x00),
+	QMP_PHY_INIT_CFG(PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(PCS_PCIE_EQ_CONFIG1, 0x11),
+	QMP_PHY_INIT_CFG(PCS_PCIE_EQ_CONFIG2, 0xb),
+	QMP_PHY_INIT_CFG(PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_CONFIG2, 0x52),
+	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_MODE2_CONFIG2, 0x50),
+	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_MODE2_CONFIG4, 0x1a),
+	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_MODE2_CONFIG5, 0x6),
+	QMP_PHY_INIT_CFG(PCS_COM_G12S1_TXDEEMPH_M3P5DB, 0x10),
+	QMP_PHY_INIT_CFG(PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(PCS_COM_RX_DCC_CAL_CONFIG, 0x01),
+	QMP_PHY_INIT_CFG(PCS_COM_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(PCS_COM_REFGEN_REQ_CONFIG1, 0x0d),
+};
 static const struct qmp_phy_init_tbl sdm845_qmp_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -2083,6 +2210,36 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.pwrdn_delay_max	= 1005,		/* us */
 };
 
+static const struct qmp_phy_cfg ipq8074_pciephy_gen3_cfg = {
+	.type			= PHY_TYPE_PCIE,
+	.nlanes			= 1,
+
+	.serdes_tbl		= ipq8074_pcie_gen3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(ipq8074_pcie_gen3_serdes_tbl),
+	.tx_tbl			= ipq8074_pcie_gen3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(ipq8074_pcie_gen3_tx_tbl),
+	.rx_tbl			= ipq8074_pcie_gen3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(ipq8074_pcie_gen3_rx_tbl),
+	.pcs_tbl		= ipq8074_pcie_gen3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(ipq8074_pcie_gen3_pcs_tbl),
+	.clk_list		= ipq8074_pciephy_clk_l,
+	.num_clks		= ARRAY_SIZE(ipq8074_pciephy_clk_l),
+	.reset_list		= ipq8074_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
+	.vreg_list		= NULL,
+	.num_vregs		= 0,
+	.regs			= qmp_v4_usb3phy_regs_layout,
+
+	.start_ctrl		= SERDES_START | PCS_START,
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+
+	.has_phy_com_ctrl	= false,
+	.has_lane_rst		= false,
+	.has_pwrdn_delay	= true,
+	.pwrdn_delay_min	= 995,		/* us */
+	.pwrdn_delay_max	= 1005,		/* us */
+};
+
 static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
 	.type = PHY_TYPE_PCIE,
 	.nlanes = 1,
@@ -3024,8 +3181,15 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
 
 	init.ops = &clk_fixed_rate_ops;
 
-	/* controllers using QMP phys use 125MHz pipe clock interface */
-	fixed->fixed_rate = 125000000;
+	/*
+	 * controllers using QMP phys use 125MHz pipe clock interface unless
+	 * other frequency is specified in dts
+	 */
+	ret = of_property_read_u32(np, "clock-output-rate",
+				   (u32 *)&fixed->fixed_rate);
+	if (ret)
+		fixed->fixed_rate = 125000000;
+
 	fixed->hw.init = &init;
 
 	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
@@ -3196,6 +3360,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 		.compatible = "qcom,ipq8074-qmp-pcie-phy",
 		.data = &ipq8074_pciephy_cfg,
 	}, {
+		.compatible = "qcom,ipq8074-qmp-pcie-gen3-phy",
+		.data = &ipq8074_pciephy_gen3_cfg,
+	}, {
 		.compatible = "qcom,sc7180-qmp-usb3-phy",
 		.data = &sc7180_usb3phy_cfg,
 	}, {
-- 
2.7.4

