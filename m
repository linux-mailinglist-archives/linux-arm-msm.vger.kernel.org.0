Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A598534720
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345082AbiEYX6y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343914AbiEYX6x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:58:53 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4559E9CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:52 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q1so137262ljb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6iWhrvv4od6TeMXwlwfe/Pl2Q5oNJght52O30b0sGu8=;
        b=LB/5EctCebFvch03ojs6LlZO8gMjsdpMVereHAlVtFK5m+yUmo1B5UKKgww8UKfK/9
         rfO7GE3Nbuom0fFzap+Y+HQudfQOhjSmZvWVT1G5sC/cbqlH4RUYrmHlcasyBUt0PF7T
         MuL0cJQe01hGejLCXliIv+97DrYiSc5PR4VzJ5r5v6h8HK+rifmdTcEK0+BHTpzwIaw2
         l1rxLmx62rPbNTw62KrmgxVmFXB6QBq0yNLQAmBJ0w8RyJjvK91EDDNG7ntoGn+ZiGSb
         CWQ9nHAk6ZEtdVlH1vn/LE2c9/1YHnu/01YTI4V94lSEM5en2Ykh3MR8ui0Hk9vWS6ul
         4SUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6iWhrvv4od6TeMXwlwfe/Pl2Q5oNJght52O30b0sGu8=;
        b=PlqTZaECY4UUkDVyT5cpZ61RAJ5Vffgxb3AXa1jZFhncFYoRpmoCrVPbp9VgyHatIp
         mHj1uRm0eErwdIQX9swGyY6/+d85+qB9Kw1CvSyYaBwwTWuCgzxlH9TAxCuAitXaSjGb
         UqwD05H6SDmLcG8h6C2BdqJNLt2UqYassKsmZNFHyYnWePd3qKc3fySjvi4A/Y+0HU+Q
         rpxXwWKiHM9O5U2WzY1mqKMy8efT5Ji4WRoxzkuNzHyc1uJWDxckNwrIdor5aZ2x1oVV
         hYXsLAjus4tiLydJ4xP/49AitVe2WpMu9qNoX2NHBfl7TtSZk+fCqRRq1llCwnHcCslh
         Z2mQ==
X-Gm-Message-State: AOAM531xOXWnEwzug6Wj+XUy9OndKXAC7qex8xauKHygncUK3yl0ciRz
        yKTf4gwMG0XfnZGdhwDY/FOhbw==
X-Google-Smtp-Source: ABdhPJy17RMjrg9turTv5wk95lZwZbED+S8aO7MD8sQ5uMwze7s8pWP579ktwC801UAePPqZqGz7Rg==
X-Received: by 2002:a2e:a286:0:b0:253:bff6:ed52 with SMTP id k6-20020a2ea286000000b00253bff6ed52mr21074223lja.229.1653523130315;
        Wed, 25 May 2022 16:58:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:58:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 07/34] phy: qcom-qmp: move IPQ6018 PCIe PHY to new QMP driver
Date:   Thu, 26 May 2022 02:58:14 +0300
Message-Id: <20220525235841.852301-8-dmitry.baryshkov@linaro.org>
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

Move support for the PCIe PHY driver on IPQ6018 platform to new QMP
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 143 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c      | 147 -----------------------
 2 files changed, 143 insertions(+), 147 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index cb354805413b..3dca9ac8f7be 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -103,6 +103,113 @@ static const unsigned int sm8250_pcie_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
 };
 
+static const struct qmp_phy_init_tbl ipq6018_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_PER1, 0x7d),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE1_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE2_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE1_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE2_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CLKBUFLR_EN, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_BUF_ENABLE, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE0, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE1, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE1, 0x29),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TRIM, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE0, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE1, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CTRL_BY_PSM, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE0, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE1, 0x53),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START3_MODE1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE0, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE1, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE1, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_SELECT, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV_MODE1, 0x08),
+};
+
+static const struct qmp_phy_init_tbl ipq6018_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_TX0_RES_CODE_LANE_OFFSET_TX, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_TX0_LANE_MODE_1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_TX0_RCV_DETECT_LVL_2, 0x12),
+};
+
+static const struct qmp_phy_init_tbl ipq6018_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_FO_GAIN, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_SO_GAIN, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_PI_CONTROLS, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL2, 0x61),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL4, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x73),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_SIGDET_DEGLITCH_CNTRL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_LOW, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH2, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH3, 0xd3),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH4, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_LOW, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_LOW, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_RX0_DFE_EN_TIMER, 0x04),
+};
+
+static const struct qmp_phy_init_tbl ipq6018_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(PCS_COM_FLL_CNTRL1, 0x01),
+	QMP_PHY_INIT_CFG(PCS_COM_REFGEN_REQ_CONFIG1, 0x0d),
+	QMP_PHY_INIT_CFG(PCS_COM_G12S1_TXDEEMPH_M3P5DB, 0x10),
+	QMP_PHY_INIT_CFG(PCS_COM_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(PCS_COM_RX_DCC_CAL_CONFIG, 0x01),
+	QMP_PHY_INIT_CFG(PCS_COM_EQ_CONFIG5, 0x01),
+	QMP_PHY_INIT_CFG(PCS_PCIE_POWER_STATE_CONFIG2, 0x0d),
+	QMP_PHY_INIT_CFG(PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(PCS_PCIE_EQ_CONFIG1, 0x11),
+	QMP_PHY_INIT_CFG(PCS_PCIE_PRESET_P10_PRE, 0x00),
+	QMP_PHY_INIT_CFG(PCS_PCIE_PRESET_P10_POST, 0x58),
+};
+
 static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
 	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
@@ -630,6 +737,9 @@ static const struct qmp_phy_init_tbl sm8250_qmp_gen3x2_pcie_pcs_misc_tbl[] = {
 };
 
 /* list of clocks required by phy */
+static const char * const ipq_pciephy_clk_l[] = {
+	"aux", "cfg_ahb",
+};
 static const char * const msm8996_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref",
 };
@@ -656,6 +766,36 @@ static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
+static const struct qmp_phy_pcie_cfg ipq6018_pciephy_cfg = {
+	.base = {
+		.type			= PHY_TYPE_PCIE,
+		.nlanes			= 1,
+
+		.serdes_tbl		= ipq6018_pcie_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(ipq6018_pcie_serdes_tbl),
+		.tx_tbl			= ipq6018_pcie_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(ipq6018_pcie_tx_tbl),
+		.rx_tbl			= ipq6018_pcie_rx_tbl,
+		.rx_tbl_num		= ARRAY_SIZE(ipq6018_pcie_rx_tbl),
+		.pcs_tbl		= ipq6018_pcie_pcs_tbl,
+		.pcs_tbl_num		= ARRAY_SIZE(ipq6018_pcie_pcs_tbl),
+		.clk_list		= ipq_pciephy_clk_l,
+		.num_clks		= ARRAY_SIZE(ipq_pciephy_clk_l),
+		.reset_list		= qmp_pciephy_reset_l,
+		.num_resets		= ARRAY_SIZE(qmp_pciephy_reset_l),
+		.vreg_list		= NULL,
+		.num_vregs		= 0,
+		.regs			= sm8250_pcie_regs_layout,
+
+		.start_ctrl		= SERDES_START | PCS_START,
+		.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	},
+
+	.has_pwrdn_delay	= true,
+	.pwrdn_delay_min	= 995,		/* us */
+	.pwrdn_delay_max	= 1005,		/* us */
+};
+
 static const struct qmp_phy_pcie_cfg msm8996_pciephy_cfg = {
 	.base = {
 		.type			= PHY_TYPE_PCIE,
@@ -1192,6 +1332,9 @@ int qcom_qmp_phy_pcie_create(struct device *dev, struct device_node *np, int id,
 
 static const struct of_device_id qcom_qmp_phy_pcie_of_match_table[] = {
 	{
+		.compatible = "qcom,ipq6018-qmp-pcie-phy",
+		.data = &ipq6018_pciephy_cfg,
+	}, {
 		.compatible = "qcom,msm8996-qmp-pcie-phy",
 		.data = &msm8996_pciephy_cfg,
 	}, {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index c2d53918df40..4529be5fe0cc 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -146,13 +146,6 @@ static const unsigned int msm8996_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_READY_STATUS]		= 0x168,
 };
 
-static const unsigned int ipq_pciephy_gen3_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]				= 0x00,
-	[QPHY_START_CTRL]			= 0x44,
-	[QPHY_PCS_STATUS]			= 0x14,
-	[QPHY_PCS_POWER_DOWN_CONTROL]		= 0x40,
-};
-
 static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_SW_RESET]		= 0x400,
 	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x404,
@@ -467,113 +460,6 @@ static const struct qmp_phy_init_tbl msm8996_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG2, 0x08),
 };
 
-static const struct qmp_phy_init_tbl ipq6018_pcie_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_PER1, 0x7d),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_PER2, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE1_MODE0, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE2_MODE0, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE1_MODE1, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_STEP_SIZE2_MODE1, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CLKBUFLR_EN, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_ENABLE1, 0x90),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_SYS_CLK_CTRL, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_BUF_ENABLE, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_IVCO, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE0, 0xd4),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE0, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE1, 0xaa),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE1, 0x29),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TRIM, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE0, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE1, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE1, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE0, 0x28),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE1, 0x28),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CTRL_BY_PSM, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_EN_SEL, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_RESETSM_CNTRL, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP_EN, 0x42),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE0, 0x68),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE1, 0x53),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START1_MODE0, 0xab),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START2_MODE0, 0xaa),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START3_MODE0, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START1_MODE1, 0x55),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START2_MODE1, 0x55),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_DIV_FRAC_START3_MODE1, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE0, 0xa0),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE1, 0xa0),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE0, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE0, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE1, 0xb4),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE1, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_CLK_SELECT, 0x32),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_CMN_CONFIG, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV_MODE1, 0x08),
-};
-
-static const struct qmp_phy_init_tbl ipq6018_pcie_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_TX0_RES_CODE_LANE_OFFSET_TX, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_TX0_LANE_MODE_1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_TX0_RCV_DETECT_LVL_2, 0x12),
-};
-
-static const struct qmp_phy_init_tbl ipq6018_pcie_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_FO_GAIN, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_SO_GAIN, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_UCDR_PI_CONTROLS, 0x70),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL2, 0x61),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL3, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQU_ADAPTOR_CNTRL4, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_IDAC_TSETTLE_LOW, 0xc0),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_IDAC_TSETTLE_HIGH, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x73),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_SIGDET_ENABLES, 0x1c),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_SIGDET_CNTRL, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_SIGDET_DEGLITCH_CNTRL, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_LOW, 0xf0),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH2, 0x2f),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH3, 0xd3),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_00_HIGH4, 0x40),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_LOW, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH2, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH3, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_01_HIGH4, 0xb1),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_LOW, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH2, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH3, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_RX_MODE_10_HIGH4, 0xb1),
-	QMP_PHY_INIT_CFG(QSERDES_RX0_DFE_EN_TIMER, 0x04),
-};
-
-static const struct qmp_phy_init_tbl ipq6018_pcie_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(PCS_COM_FLL_CNTRL1, 0x01),
-	QMP_PHY_INIT_CFG(PCS_COM_REFGEN_REQ_CONFIG1, 0x0d),
-	QMP_PHY_INIT_CFG(PCS_COM_G12S1_TXDEEMPH_M3P5DB, 0x10),
-	QMP_PHY_INIT_CFG(PCS_COM_RX_SIGDET_LVL, 0xaa),
-	QMP_PHY_INIT_CFG(PCS_COM_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
-	QMP_PHY_INIT_CFG(PCS_COM_RX_DCC_CAL_CONFIG, 0x01),
-	QMP_PHY_INIT_CFG(PCS_COM_EQ_CONFIG5, 0x01),
-	QMP_PHY_INIT_CFG(PCS_PCIE_POWER_STATE_CONFIG2, 0x0d),
-	QMP_PHY_INIT_CFG(PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
-	QMP_PHY_INIT_CFG(PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
-	QMP_PHY_INIT_CFG(PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
-	QMP_PHY_INIT_CFG(PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
-	QMP_PHY_INIT_CFG(PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
-	QMP_PHY_INIT_CFG(PCS_PCIE_EQ_CONFIG1, 0x11),
-	QMP_PHY_INIT_CFG(PCS_PCIE_PRESET_P10_PRE, 0x00),
-	QMP_PHY_INIT_CFG(PCS_PCIE_PRESET_P10_POST, 0x58),
-};
-
 static const struct qmp_phy_init_tbl ipq8074_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
@@ -2963,36 +2849,6 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.pwrdn_delay_max	= 1005,		/* us */
 };
 
-static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
-	.type			= PHY_TYPE_PCIE,
-	.nlanes			= 1,
-
-	.serdes_tbl		= ipq6018_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(ipq6018_pcie_serdes_tbl),
-	.tx_tbl			= ipq6018_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(ipq6018_pcie_tx_tbl),
-	.rx_tbl			= ipq6018_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(ipq6018_pcie_rx_tbl),
-	.pcs_tbl		= ipq6018_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(ipq6018_pcie_pcs_tbl),
-	.clk_list		= ipq8074_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(ipq8074_pciephy_clk_l),
-	.reset_list		= ipq8074_pciephy_reset_l,
-	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
-	.vreg_list		= NULL,
-	.num_vregs		= 0,
-	.regs			= ipq_pciephy_gen3_regs_layout,
-
-	.start_ctrl		= SERDES_START | PCS_START,
-	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
-
-	.has_phy_com_ctrl	= false,
-	.has_lane_rst		= false,
-	.has_pwrdn_delay	= true,
-	.pwrdn_delay_min	= 995,		/* us */
-	.pwrdn_delay_max	= 1005,		/* us */
-};
-
 static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -5297,9 +5153,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,ipq8074-qmp-pcie-phy",
 		.data = &ipq8074_pciephy_cfg,
-	}, {
-		.compatible = "qcom,ipq6018-qmp-pcie-phy",
-		.data = &ipq6018_pciephy_cfg,
 	}, {
 		.compatible = "qcom,ipq6018-qmp-usb3-phy",
 		.data = &ipq8074_usb3phy_cfg,
-- 
2.35.1

