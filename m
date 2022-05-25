Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6142E53471B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345035AbiEYX6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344700AbiEYX6t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:58:49 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9605B9E9C7
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:47 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s20so119258ljd.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EXDu0iqpHdrg484YubczwCkplF0nLC6g4Ddhvwi+Tuw=;
        b=T5vS+I9iqjSm843OfCN2vRBGx79L5Z3eRO9QFiv0DIg0ZHGkDcvwteNJGN5U7w8xFn
         KIqcUvshpqz6z5S1P9drbHGLT65u4Dm3KWTzAHPlaHFpmWkuo/eeY0qkEGMzUz3UiS7Q
         qlLcHZuY872uyACDk4fRuDzLuzDl9IrR6nsZeJ3izZKW6tmLCe1mA9HlNFB85O5v7MK1
         6ELfafgfurL7LUd625pEYC8pZreUxl4oqKxwstnwGioB05YQxrpYZNB/htBDgPSiP4cI
         G4VgiufIeNXz66KSFQMTu4zHLvfvnv6k0kSijRaGg0JRW/7BrA1u1i63rGvfAvnu3vul
         RL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EXDu0iqpHdrg484YubczwCkplF0nLC6g4Ddhvwi+Tuw=;
        b=dPToA4ve2ckpj2ThiaAPOARwdiEutzPT70IUORtSB9eMr/H0JBhzZYvr7Az1te6bOC
         cKhz7VpcOvWyH8mTTZplfYwx+sOsvSBUS6zZUVpNsJtvdFw250bSJ8enqdQTaEkfEHDe
         hZ3c31ZWnOCRs6QzeVLcYEyE6y0M6rTG4/P+HTOpiDpQ/RXQzyv3l/PB0DmVjaHeybbR
         hLbeZiF/reDsPh+7OuuArWJ58QQXQr2JbUzDdbwZXyTsconhMq4SFwCm72Bp3re7Kow2
         zXxCp9brV7+MrmmPS1GMEDzZBXDXhyhr66xNTCb6qOULEbgDjg2lWsroBnHLbaLfUsaa
         XDkg==
X-Gm-Message-State: AOAM530oK+GEq5Zf8TsJ/AfwpGwnRZIXC0vZfU2qHgL/iAjwFtcEAidX
        Z2cbbIo5x93xHG6qZ0lyfRKTIA==
X-Google-Smtp-Source: ABdhPJwG9PVYwhq1F/k8LXZ24cFd9FRsZDDDcxPoJ6Y8lIMLIgAoGBi5ME6+jXO88Y9iAfWxR4/tXw==
X-Received: by 2002:a2e:9546:0:b0:253:f2ba:e5bf with SMTP id t6-20020a2e9546000000b00253f2bae5bfmr7578743ljh.175.1653523125871;
        Wed, 25 May 2022 16:58:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:58:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 03/34] phy: qcom-qmp: move MSM8996 PCIe PHY to new QMP driver
Date:   Thu, 26 May 2022 02:58:10 +0300
Message-Id: <20220525235841.852301-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525235841.852301-1-dmitry.baryshkov@linaro.org>
References: <20220525235841.852301-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move support for the PCIe PHY driver on MSM8996 platform to new QMP
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 148 +++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c      | 117 ------------------
 2 files changed, 148 insertions(+), 117 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index e81b8c69664b..36034aecdbd7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -68,6 +68,150 @@ struct qmp_pcie_phy {
 
 #define to_qmp_pcie_phy(qphy) container_of(qphy, struct qmp_pcie_phy, base)
 
+static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_COM_SW_RESET]		= 0x400,
+	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x404,
+	[QPHY_COM_START_CONTROL]	= 0x408,
+	[QPHY_COM_PCS_READY_STATUS]	= 0x448,
+	[QPHY_PLL_LOCK_CHK_DLY_TIME]	= 0xa8,
+	[QPHY_FLL_CNTRL1]		= 0xc4,
+	[QPHY_FLL_CNTRL2]		= 0xc8,
+	[QPHY_FLL_CNT_VAL_L]		= 0xcc,
+	[QPHY_FLL_CNT_VAL_H_TOL]	= 0xd0,
+	[QPHY_FLL_MAN_CODE]		= 0xd4,
+	[QPHY_SW_RESET]			= 0x00,
+	[QPHY_START_CTRL]		= 0x08,
+	[QPHY_PCS_STATUS]		= 0x174,
+};
+
+static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x33),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER2, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x33),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_BUF_ENABLE, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER1, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE1, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE2, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_COM_RESCODE_DIV_NUM, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TRIM, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_EP_DIV, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_RESCODE_DIV_NUM, 0x40),
+};
+
+static const struct qmp_phy_init_tbl msm8996_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
+};
+
+static const struct qmp_phy_init_tbl msm8996_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_BAND, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN_HALF, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x19),
+};
+
+static const struct qmp_phy_init_tbl msm8996_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_RX_IDLE_DTCT_CNTRL, 0x4c),
+	QMP_PHY_INIT_CFG(QPHY_PWRUP_RESET_DLY_TIME_AUXCLK, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_LP_WAKEUP_DLY_TIME_AUXCLK, 0x01),
+
+	QMP_PHY_INIT_CFG_L(QPHY_PLL_LOCK_CHK_DLY_TIME, 0x05),
+
+	QMP_PHY_INIT_CFG(QPHY_ENDPOINT_REFCLK_DRIVE, 0x05),
+	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG4, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG1, 0xa3),
+	QMP_PHY_INIT_CFG(QPHY_TXDEEMPH_M3P5DB_V0, 0x0e),
+};
+
+/* list of clocks required by phy */
+static const char * const msm8996_phy_clk_l[] = {
+	"aux", "cfg_ahb", "ref",
+};
+
+/* list of resets */
+static const char * const msm8996_pciephy_reset_l[] = {
+	"phy", "common", "cfg",
+};
+
+/* list of regulators */
+static const char * const qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll",
+};
+
+static const struct qmp_phy_pcie_cfg msm8996_pciephy_cfg = {
+	.base = {
+		.type			= PHY_TYPE_PCIE,
+		.nlanes			= 3,
+
+		.serdes_tbl		= msm8996_pcie_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(msm8996_pcie_serdes_tbl),
+		.tx_tbl			= msm8996_pcie_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(msm8996_pcie_tx_tbl),
+		.rx_tbl			= msm8996_pcie_rx_tbl,
+		.rx_tbl_num		= ARRAY_SIZE(msm8996_pcie_rx_tbl),
+		.pcs_tbl		= msm8996_pcie_pcs_tbl,
+		.pcs_tbl_num		= ARRAY_SIZE(msm8996_pcie_pcs_tbl),
+		.clk_list		= msm8996_phy_clk_l,
+		.num_clks		= ARRAY_SIZE(msm8996_phy_clk_l),
+		.reset_list		= msm8996_pciephy_reset_l,
+		.num_resets		= ARRAY_SIZE(msm8996_pciephy_reset_l),
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= pciephy_regs_layout,
+
+		.start_ctrl		= PCS_START | PLL_READY_GATE_EN,
+		.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+		.phy_status		= PHYSTATUS,
+	},
+
+	.has_phy_com_ctrl	= true,
+	.mask_com_pcs_ready	= PCS_READY,
+	.has_lane_rst		= true,
+
+	.has_pwrdn_delay	= true,
+	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
+	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
+};
+
 static int qcom_qmp_phy_com_ctrl_init(struct qmp_pcie_phy *qphy_pcie)
 {
 	struct qcom_qmp *qmp = qphy_pcie->base.qmp;
@@ -390,6 +534,10 @@ int qcom_qmp_phy_pcie_create(struct device *dev, struct device_node *np, int id,
 }
 
 static const struct of_device_id qcom_qmp_phy_pcie_of_match_table[] = {
+	{
+		.compatible = "qcom,msm8996-qmp-pcie-phy",
+		.data = &msm8996_pciephy_cfg,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, qcom_qmp_phy_pcie_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index c7309e981bfb..d9dd28bd777e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -339,84 +339,6 @@ static const struct qmp_phy_init_tbl ipq8074_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0, 0x0f),
 };
 
-static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x33),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_EN, 0x42),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER1, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER2, 0x1f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x55),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x55),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x1a),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x33),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_BUF_ENABLE, 0x1f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
-	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_EN_CENTER, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER1, 0x31),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER2, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER1, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE1, 0x2f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE2, 0x19),
-	QMP_PHY_INIT_CFG(QSERDES_COM_RESCODE_DIV_NUM, 0x15),
-	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TRIM, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_EP_DIV, 0x19),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_RESCODE_DIV_NUM, 0x40),
-};
-
-static const struct qmp_phy_init_tbl msm8996_pcie_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
-	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
-};
-
-static const struct qmp_phy_init_tbl msm8996_pcie_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_ENABLES, 0x1c),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xdb),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_BAND, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN_HALF, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x19),
-};
-
-static const struct qmp_phy_init_tbl msm8996_pcie_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_RX_IDLE_DTCT_CNTRL, 0x4c),
-	QMP_PHY_INIT_CFG(QPHY_PWRUP_RESET_DLY_TIME_AUXCLK, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_LP_WAKEUP_DLY_TIME_AUXCLK, 0x01),
-
-	QMP_PHY_INIT_CFG_L(QPHY_PLL_LOCK_CHK_DLY_TIME, 0x05),
-
-	QMP_PHY_INIT_CFG(QPHY_ENDPOINT_REFCLK_DRIVE, 0x05),
-	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG4, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG1, 0xa3),
-	QMP_PHY_INIT_CFG(QPHY_TXDEEMPH_M3P5DB_V0, 0x0e),
-};
-
 static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -3365,10 +3287,6 @@ static const char * const qcm2290_usb3phy_clk_l[] = {
 };
 
 /* list of resets */
-static const char * const msm8996_pciephy_reset_l[] = {
-	"phy", "common", "cfg",
-};
-
 static const char * const msm8996_usb3phy_reset_l[] = {
 	"phy", "common",
 };
@@ -3415,38 +3333,6 @@ static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 	.phy_status		= PHYSTATUS,
 };
 
-static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
-	.type			= PHY_TYPE_PCIE,
-	.nlanes			= 3,
-
-	.serdes_tbl		= msm8996_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(msm8996_pcie_serdes_tbl),
-	.tx_tbl			= msm8996_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(msm8996_pcie_tx_tbl),
-	.rx_tbl			= msm8996_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(msm8996_pcie_rx_tbl),
-	.pcs_tbl		= msm8996_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(msm8996_pcie_pcs_tbl),
-	.clk_list		= msm8996_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(msm8996_phy_clk_l),
-	.reset_list		= msm8996_pciephy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= pciephy_regs_layout,
-
-	.start_ctrl		= PCS_START | PLL_READY_GATE_EN,
-	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
-	.mask_com_pcs_ready	= PCS_READY,
-	.phy_status		= PHYSTATUS,
-
-	.has_phy_com_ctrl	= true,
-	.has_lane_rst		= true,
-	.has_pwrdn_delay	= true,
-	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
-	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
-};
-
 static const struct qmp_phy_cfg msm8996_ufs_cfg = {
 	.type			= PHY_TYPE_UFS,
 	.nlanes			= 1,
@@ -6023,9 +5909,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	{
 		.compatible = "qcom,ipq8074-qmp-usb3-phy",
 		.data = &ipq8074_usb3phy_cfg,
-	}, {
-		.compatible = "qcom,msm8996-qmp-pcie-phy",
-		.data = &msm8996_pciephy_cfg,
 	}, {
 		.compatible = "qcom,msm8996-qmp-ufs-phy",
 		.data = &msm8996_ufs_cfg,
-- 
2.35.1

