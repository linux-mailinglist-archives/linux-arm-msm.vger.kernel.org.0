Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15C2C115E77
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 21:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbfLGUWQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Dec 2019 15:22:16 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45358 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbfLGUWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Dec 2019 15:22:16 -0500
Received: by mail-pg1-f195.google.com with SMTP id b9so4663719pgk.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2019 12:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9S6A4yb/7HyVzgEd/Dmm6sbtVcMjwx4MvgfxDe+l8RU=;
        b=Bi261QzGlgdW1HjxrGV44g6LVY3Jkgwr5vF7w7YExlAH9W4WGROjAInY1b+MSSw4/o
         FDXj9pPnMJhOT1HDRkQYCfKnqNZkNBUenclUzCZPgh7YVODdejvR1gWOJg85gPn1E7OE
         EuvZY1PDcyLjr+fkmJuKEvaNazQUpuMhVAhNb9IM1W4HLdFjiyMsLrRZgF/YX2z90WxV
         t6KEQM+uPft7pYIEI+Ku5wCwvXFPR7MkCZii+ZuS80+oWYktH8Dg7l7j3FQHwUiyXnVJ
         bT96surtu1f3hhAUR/qRokJmZYDL7LT4A9UKoSJR8lo/86x+hy/Guy+qVkd5+rumztvY
         3MXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9S6A4yb/7HyVzgEd/Dmm6sbtVcMjwx4MvgfxDe+l8RU=;
        b=Er4zJZPyBGTmTy8mMinvtpDAC6e6vejitPEERP73EW/sd1iGWspdsRG8uRsscDMQxU
         3UV8tfNt9jh/E3ryKzsBQw/rVVgWRul/gBNC0Fc34lB2ohntrOwJX6ywQgQhcRCZzK+x
         G8SLAIsXb65IyMfLkirpOS05Iz0spKCV1DtnJXzvaBXPqXbUTPwCcMvGGcuF/PwDZhdP
         b99y7gC1hRPvNnX7hJv0lfl1OOz8/GmHXwQuBzp7CEknJ2LiZQFiIslwMaSWCKLlWUVB
         8WB/spe0aldRvUmH/LAO+KkjlZGDC4FEGYHKeGsTLwjuLmL36N9YEMGgnI5E3tpIZAMw
         48hg==
X-Gm-Message-State: APjAAAXit7HoCzC/hozT3wJUWoPyEv4C6SN0rusIlfYfIjd8zInEqX2k
        WdLJosX8tyvbWtHHHDhm6H0hUQ==
X-Google-Smtp-Source: APXvYqxtNQ3r5kFPMkuNEegepDE5ShY33JRATfnpptL/LlrIakwF5MMP1BY2uhVUcYRLYfLfqVRfcg==
X-Received: by 2002:aa7:9098:: with SMTP id i24mr2544454pfa.58.1575750135057;
        Sat, 07 Dec 2019 12:22:15 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r7sm21969662pfg.34.2019.12.07.12.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:22:14 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vinod.koul@linaro.org
Subject: [PATCH 1/2] phy: qcom-qmp: Add MSM8996 UFS QMP support
Date:   Sat,  7 Dec 2019 12:21:46 -0800
Message-Id: <20191207202147.2314248-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207202147.2314248-1-bjorn.andersson@linaro.org>
References: <20191207202147.2314248-1-bjorn.andersson@linaro.org>
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

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/phy/qcom-qmp-phy.txt  |   5 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 106 ++++++++++++++++++
 2 files changed, 111 insertions(+)

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
index a6b8fc5798e2..d81516c4d747 100644
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
@@ -330,6 +335,75 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
 };
 
+static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
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
@@ -1122,6 +1196,10 @@ static const char * const msm8996_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref",
 };
 
+static const char * const msm8996_ufs_phy_clk_l[] = {
+	"ref",
+};
+
 static const char * const qmp_v3_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref", "com_aux",
 };
@@ -1175,6 +1253,31 @@ static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
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
@@ -2091,6 +2194,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
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

