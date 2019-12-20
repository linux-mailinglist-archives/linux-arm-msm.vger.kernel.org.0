Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDAC12757A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 07:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbfLTGDi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 01:03:38 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37394 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbfLTGDh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 01:03:37 -0500
Received: by mail-pg1-f196.google.com with SMTP id q127so4401984pga.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2019 22:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kx7zoFAxcW22Q5cgq+RAIHtuejOgAZviUeCwllgrzzM=;
        b=WKVqpmqwmzxQkvsczBylltiB0TjGGpHzo1CWxRvMXHIgEJRdmaPo/kt3Ov1IDkY7z/
         hyD4TTc86MvlVYq6+u3dkM46xmgDiARvcDycv+a5PkDPQ/xkonMzYAJ83Qbwk0l8ZrtU
         nyMsRg6fCxBN8N9x9K2DkasPs373y5i00VfGc1aZvX0NYlVB04fiMAtuRzoMvinIrA9U
         Wu/W+BJxzZKfl6ZKF27jVy4x0GxFJgY1z+ZmoNaP+1BVqigJXGSW2yFOZGRAJCjv5p6V
         uJMLWAqMc13uiCS/fQkUdIdE3EhQlsP5NAKyrdQOc0TjNxsHFiLXVwpCybHUXPuNAPLL
         mG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kx7zoFAxcW22Q5cgq+RAIHtuejOgAZviUeCwllgrzzM=;
        b=T7I6htyNOMcC/qZ+29AofSDx4Rze3jH3r02RUvVzehnUt/9jocAMe1I8/273Nxi5lT
         W4BByCgacJulTmJ/8g3aahcH9WLahSnxRqFE0i3z1oUF5mvBjQ5L7b2qpgBTOTi4jn84
         hnTIcEMX+yTFa/IkX+CnsAa8nB6VaM5SIqt3oPDQCzhkEOHuTWI3CJRHYxigrOYYx6X2
         wRvBu7gJAWpKIqlHFFGe8R9cfk/hPkAYaTeZY3wsMbF/8QRtRaxzLvoWSG7bKe4+9iYz
         GzbmVtQSV8akud32cQ2p9ha5cwCHv8DvyeznHlMLfix2FSRwyp7MlyII7pEwO1Qq8HXk
         xsMA==
X-Gm-Message-State: APjAAAUDETr3T4A8kIEXWNuugjxA4SphL2dF7Wy6pzh3wQFILO03CFhl
        nmw0AC6IdFsLsMZRmyDEmL1E/g==
X-Google-Smtp-Source: APXvYqzOpEIrYQ15SoMtvkSGOB3pMRjAMEzf/nrampPZ7eD2Cts6orG1PYbLJZV8A1Ioo9vB6bXGZw==
X-Received: by 2002:a63:5b0a:: with SMTP id p10mr13018277pgb.228.1576821816672;
        Thu, 19 Dec 2019 22:03:36 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l15sm8835710pjl.24.2019.12.19.22.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 22:03:35 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/2] phy: qcom-qmp: Add MSM8996 UFS QMP support
Date:   Thu, 19 Dec 2019 22:03:03 -0800
Message-Id: <20191220060304.1867795-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191220060304.1867795-1-bjorn.andersson@linaro.org>
References: <20191220060304.1867795-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The support for the 14nm MSM8996 UFS PHY is currently handled by the
UFS-specific 14nm QMP driver, due to the earlier need for additional
operations beyond the standard PHY API.

Add support for this PHY to the common QMP driver, to allow us to remove
the old driver.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Dropped unecessary, duplicate, write to QPHY_POWER_DOWN_CONTROL
- Picked up Rob's ack

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  |   5 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 105 ++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index eac9ad3cbbc8..5b99cf081817 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -8,6 +8,7 @@ Required properties:
  - compatible: compatible list, contains:
 	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
 	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
+	       "qcom,msm8996-qmp-ufs-phy" for 14nm UFS phy on msm8996,
 	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
 	       "qcom,msm8998-qmp-usb3-phy" for USB3 QMP V3 phy on msm8998,
 	       "qcom,msm8998-qmp-ufs-phy" for UFS QMP phy on msm8998,
@@ -44,6 +45,8 @@ Required properties:
 		For "qcom,ipq8074-qmp-pcie-phy": no clocks are listed.
 		For "qcom,msm8996-qmp-pcie-phy" must contain:
 			"aux", "cfg_ahb", "ref".
+		For "qcom,msm8996-qmp-ufs-phy" must contain:
+			"ref".
 		For "qcom,msm8996-qmp-usb3-phy" must contain:
 			"aux", "cfg_ahb", "ref".
 		For "qcom,msm8998-qmp-usb3-phy" must contain:
@@ -72,6 +75,8 @@ Required properties:
 			"phy", "common".
 		For "qcom,msm8996-qmp-pcie-phy" must contain:
 			"phy", "common", "cfg".
+		For "qcom,msm8996-qmp-ufs-phy": must contain:
+			"ufsphy".
 		For "qcom,msm8996-qmp-usb3-phy" must contain
 			"phy", "common".
 		For "qcom,msm8998-qmp-usb3-phy" must contain
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 091e20303a14..e33f5cca41f7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -121,6 +121,11 @@ enum qphy_reg_layout {
 	QPHY_PCS_LFPS_RXTERM_IRQ_STATUS,
 };
 
+static const unsigned int msm8996_ufsphy_regs_layout[] = {
+	[QPHY_START_CTRL]		= 0x00,
+	[QPHY_PCS_READY_STATUS]		= 0x168,
+};
+
 static const unsigned int pciephy_regs_layout[] = {
 	[QPHY_COM_SW_RESET]		= 0x400,
 	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x404,
@@ -330,6 +335,74 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
 };
 
+static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0xd7),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV_MODE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_COM_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_CFG, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE1, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE1, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE1, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE1, 0xd6),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE1, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE1, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE1, 0x00),
+};
+
+static const struct qmp_phy_init_tbl msm8996_ufs_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x02),
+};
+
+static const struct qmp_phy_init_tbl msm8996_ufs_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_INTERFACE_MODE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0B),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_TERM_BW, 0x5b),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_LSB, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_MSB, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_LSB, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_MSB, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0E),
+};
+
 static const struct qmp_phy_init_tbl msm8996_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
@@ -1122,6 +1195,10 @@ static const char * const msm8996_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref",
 };
 
+static const char * const msm8996_ufs_phy_clk_l[] = {
+	"ref",
+};
+
 static const char * const qmp_v3_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref", "com_aux",
 };
@@ -1175,6 +1252,31 @@ static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
+static const struct qmp_phy_cfg msm8996_ufs_cfg = {
+	.type			= PHY_TYPE_UFS,
+	.nlanes			= 1,
+
+	.serdes_tbl		= msm8996_ufs_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(msm8996_ufs_serdes_tbl),
+	.tx_tbl			= msm8996_ufs_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(msm8996_ufs_tx_tbl),
+	.rx_tbl			= msm8996_ufs_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(msm8996_ufs_rx_tbl),
+
+	.clk_list		= msm8996_ufs_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(msm8996_ufs_phy_clk_l),
+
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+
+	.regs			= msm8996_ufsphy_regs_layout,
+
+	.start_ctrl		= SERDES_START,
+	.pwrdn_ctrl		= SW_PWRDN,
+
+	.no_pcs_sw_reset	= true,
+};
+
 static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -2091,6 +2193,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	{
 		.compatible = "qcom,msm8996-qmp-pcie-phy",
 		.data = &msm8996_pciephy_cfg,
+	}, {
+		.compatible = "qcom,msm8996-qmp-ufs-phy",
+		.data = &msm8996_ufs_cfg,
 	}, {
 		.compatible = "qcom,msm8996-qmp-usb3-phy",
 		.data = &msm8996_usb3phy_cfg,
-- 
2.24.0

