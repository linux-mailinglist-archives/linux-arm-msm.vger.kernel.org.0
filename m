Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D953C53471D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiEYX6v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343914AbiEYX6u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:58:50 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D679E9E0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:48 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a23so122997ljd.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gNg56hqr2MUSRQs5dWsv0yb6do+s+w21YzjV7pp7S7c=;
        b=hDnFhBZtLwuiJOyGllVcOxc+q+ChHEyVqNHAB4pEze7IBCJBFDUIeV6LiVf9jOMOrV
         JR8HXKjZTzES3doRwXX8A6hcgwpj45E/5uOREYQh32YaQoMMUKSct4dQDQ1KviScWNew
         6ZryrAWvQWG5P/V6Wrp9usJm6ORFc+tgZE5oilAL15czYTXr4DYfV4C217SYb59HhWXE
         LXMzrnN6SKAsQdNKDknxMVvC0kLVm7nHUqBQMO3QpMEk8RUaY8MsxVssgXaGMxLmk8p/
         NLNc65sHzdfOiCrzl2RTI5rx2reu8UsWhzAkOaZIJhRZ/+VENb8nFWau1a1JCYvOWgiN
         uKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gNg56hqr2MUSRQs5dWsv0yb6do+s+w21YzjV7pp7S7c=;
        b=zFwMaINZ5FWGdylKb/1S2t+LP+yIR7/47xq3x8+vgoGceE5TvVOBEFBmXPvdTIo2DY
         BhP/VvMTXXuUn1uFlAxlockMKLD7G7/r/gB2mlvn9WipVQmWiJkR7IxQ7uVAfFhnnUFT
         PfgG/jzl0pWM7nHjAqLH4jNKfvBpoMb4X6O4jf0mg5CYfjL81nHkE5vH3R6oN1xI1cFy
         JJ5izRUH7QasSz1/3V6jyl7T+JrDMwb+6TiFq48ZbOSe+VvbvX0k2CAihFsApekyMS+b
         H9SRVoyhCfMV0GomB8khTF0YnZhQzKOgbg1YYmwixva9edlylqbEQKnI+Evq0jJao9I6
         1Bhg==
X-Gm-Message-State: AOAM533aN5wAkoYjJKFvWvpTmrxE+rMQngeeOCrw3axIOXYq01l8zyoO
        ilXO5kRTSoMMJ+z6TCkgGbeAww==
X-Google-Smtp-Source: ABdhPJzvNojxtAG+5+M+gHdwmgljC8QyxXignXlTK9e/G3t5ecN3dkqHIdpmFkEtFigMcF2/TnEB8w==
X-Received: by 2002:a2e:a4af:0:b0:253:cef9:f655 with SMTP id g15-20020a2ea4af000000b00253cef9f655mr20864157ljm.276.1653523126832;
        Wed, 25 May 2022 16:58:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:58:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 04/34] phy: qcom-qmp: move MSM8998 PCIe PHY to new QMP driver
Date:   Thu, 26 May 2022 02:58:11 +0300
Message-Id: <20220525235841.852301-5-dmitry.baryshkov@linaro.org>
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

Move support for the PCIe PHY driver on MSM8998 platform to new QMP
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 116 +++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c      | 110 ---------------------
 2 files changed, 116 insertions(+), 110 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 36034aecdbd7..3bcca8b6cc3b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -162,6 +162,88 @@ static const struct qmp_phy_init_tbl msm8996_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_TXDEEMPH_M3P5DB_V0, 0x0e),
 };
 
+static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE1_MODE0, 0xc9),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_TIMER2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORECLK_DIV_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_EP_DIV, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x33),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_BUF_ENABLE, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BG_TIMER, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_PER1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_ADJ_PER1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_ADJ_PER2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_STEP_SIZE1, 0x7e),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_STEP_SIZE2, 0x15),
+};
+
+static const struct qmp_phy_init_tbl msm8998_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_HIGHZ_DRVR_EN, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0x06),
+};
+
+static const struct qmp_phy_init_tbl msm8998_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SO_GAIN_HALF, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_INTERFACE_MODE, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_PI_CONTROLS, 0x71),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_FASTLOCK_COUNT_LOW, 0x40),
+};
+
+static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_ENDPOINT_REFCLK_DRIVE, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LP_WAKEUP_DLY_TIME_AUXCLK_MSB, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LP_WAKEUP_DLY_TIME_AUXCLK, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_PLL_LOCK_CHK_DLY_TIME, 0x73),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x99),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
+};
+
 /* list of clocks required by phy */
 static const char * const msm8996_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref",
@@ -172,6 +254,10 @@ static const char * const msm8996_pciephy_reset_l[] = {
 	"phy", "common", "cfg",
 };
 
+static const char * const qmp_pciephy_reset_l[] = {
+	"phy", "common",
+};
+
 /* list of regulators */
 static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
@@ -212,6 +298,33 @@ static const struct qmp_phy_pcie_cfg msm8996_pciephy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
+static const struct qmp_phy_pcie_cfg msm8998_pciephy_cfg = {
+	.base = {
+		.type			= PHY_TYPE_PCIE,
+		.nlanes			= 1,
+
+		.serdes_tbl		= msm8998_pcie_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(msm8998_pcie_serdes_tbl),
+		.tx_tbl			= msm8998_pcie_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(msm8998_pcie_tx_tbl),
+		.rx_tbl			= msm8998_pcie_rx_tbl,
+		.rx_tbl_num		= ARRAY_SIZE(msm8998_pcie_rx_tbl),
+		.pcs_tbl		= msm8998_pcie_pcs_tbl,
+		.pcs_tbl_num		= ARRAY_SIZE(msm8998_pcie_pcs_tbl),
+		.clk_list		= msm8996_phy_clk_l,
+		.num_clks		= ARRAY_SIZE(msm8996_phy_clk_l),
+		.reset_list		= qmp_pciephy_reset_l,
+		.num_resets		= ARRAY_SIZE(qmp_pciephy_reset_l),
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= pciephy_regs_layout,
+
+		.start_ctrl             = SERDES_START | PCS_START,
+		.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+		.phy_status		= PHYSTATUS,
+	},
+};
+
 static int qcom_qmp_phy_com_ctrl_init(struct qmp_pcie_phy *qphy_pcie)
 {
 	struct qcom_qmp *qmp = qphy_pcie->base.qmp;
@@ -537,6 +650,9 @@ static const struct of_device_id qcom_qmp_phy_pcie_of_match_table[] = {
 	{
 		.compatible = "qcom,msm8996-qmp-pcie-phy",
 		.data = &msm8996_pciephy_cfg,
+	}, {
+		.compatible = "qcom,msm8998-qmp-pcie-phy",
+		.data = &msm8998_pciephy_cfg,
 	},
 	{ },
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index d9dd28bd777e..88a66f99d8a1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -339,88 +339,6 @@ static const struct qmp_phy_init_tbl ipq8074_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0, 0x0f),
 };
 
-static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_RESETSM_CNTRL, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE2_MODE0, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE1_MODE0, 0xc9),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_TIMER1, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_TIMER2, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORECLK_DIV_MODE0, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_EP_DIV, 0x19),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_ENABLE1, 0x90),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x55),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START1_MODE0, 0x55),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP3_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x0d),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x34),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x33),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_BUF_ENABLE, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BG_TIMER, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_EN_CENTER, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_PER1, 0x40),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_PER2, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_ADJ_PER1, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_ADJ_PER2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_STEP_SIZE1, 0x7e),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_STEP_SIZE2, 0x15),
-};
-
-static const struct qmp_phy_init_tbl msm8998_pcie_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_HIGHZ_DRVR_EN, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0x06),
-};
-
-static const struct qmp_phy_init_tbl msm8998_pcie_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_CNTRL, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_ENABLES, 0x1c),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SO_GAIN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SO_GAIN_HALF, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_INTERFACE_MODE, 0x40),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_PI_CONTROLS, 0x71),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_FASTLOCK_COUNT_LOW, 0x40),
-};
-
-static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_ENDPOINT_REFCLK_DRIVE, 0x04),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_OSC_DTCT_ACTIONS, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x01),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB, 0x20),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LP_WAKEUP_DLY_TIME_AUXCLK_MSB, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LP_WAKEUP_DLY_TIME_AUXCLK, 0x01),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_PLL_LOCK_CHK_DLY_TIME, 0x73),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x99),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
-};
-
 static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
@@ -3776,31 +3694,6 @@ static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
 	.no_pcs_sw_reset	= true,
 };
 
-static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
-	.type			= PHY_TYPE_PCIE,
-	.nlanes			= 1,
-
-	.serdes_tbl		= msm8998_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(msm8998_pcie_serdes_tbl),
-	.tx_tbl			= msm8998_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(msm8998_pcie_tx_tbl),
-	.rx_tbl			= msm8998_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(msm8998_pcie_rx_tbl),
-	.pcs_tbl		= msm8998_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(msm8998_pcie_pcs_tbl),
-	.clk_list		= msm8996_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(msm8996_phy_clk_l),
-	.reset_list		= ipq8074_pciephy_reset_l,
-	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= pciephy_regs_layout,
-
-	.start_ctrl             = SERDES_START | PCS_START,
-	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
-	.phy_status		= PHYSTATUS,
-};
-
 static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.type                   = PHY_TYPE_USB3,
 	.nlanes                 = 1,
@@ -5915,9 +5808,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,msm8996-qmp-usb3-phy",
 		.data = &msm8996_usb3phy_cfg,
-	}, {
-		.compatible = "qcom,msm8998-qmp-pcie-phy",
-		.data = &msm8998_pciephy_cfg,
 	}, {
 		.compatible = "qcom,msm8998-qmp-ufs-phy",
 		.data = &sdm845_ufsphy_cfg,
-- 
2.35.1

