Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE55E53472C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345461AbiEYX7L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345467AbiEYX7I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:59:08 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A01FA0051
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:04 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id p4so102154lfg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LhoPPaW8yI5RKjTbnct+8P9Y1lK6Ktrc+JG6ZQ98Vbc=;
        b=wuKQi3jFfC/QC//hjFZKm27Vt9ZsloThE8enFDkbj6Cxfufk/5BfohNcmyMIT+x9jX
         8VoeoxWWWFSmt4KOi+/GUvyaYnMAIHFKpj3YToQE8u5UobRoMLs8g7LEltdxiO7tQy4Z
         992I8en4YhdmZPtnNKlQ7HHM0CTZEM4jbJHT73/VuHhFKcT/bViqw+qHqKuvCQW0M2eU
         huXjOHieq+Nf/14+8YbrT7Q+syMHlhJz7/M6PXQn3zqkBA76Gpp+B7oCyvtCNTj86fM2
         lO8yc6GePDykpl7R9rk7/wl5Pz4zlnPi0/3I5woeRVJ6UkHExisIzkk+h7iciQgewnzb
         E6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LhoPPaW8yI5RKjTbnct+8P9Y1lK6Ktrc+JG6ZQ98Vbc=;
        b=zn3RgZ1LTOF/nMd4uYFtDnvYBqskbMDUB9fEPQXkS7aqRNmEkmAifIJ5E2mzRvXYXQ
         FgYHjvvHPNnPGUInTf+v6T8v9i+PFJVANA6dB/JTeiXvLw3DCJGpZKlU/G6dX16joyTC
         ZhdbBPbeUK6Ys3caUnB8HPrgKCkSdAtXqiAL+N1N6qn/2/eYoxFUYoF4yZ6N9i7BC9H6
         rJ4RVeCAsaxrgcwNaDW2l38YcDCkSukJ8JF24CnP3r3eAuq7IQYGholYjF4ZCCy+Xt9g
         /HGnPwozOZFtpOokFXuYCUgp8gPR89vJdNtGZJ96AANbXpoGIjlSI0lQYIb6+JqykVSG
         fxgA==
X-Gm-Message-State: AOAM532rvLXe6wVnLoWG4XOQLZKPBe6pZ//cxN5LFwd2FdBIjPPCii53
        PV8Spo2CQsbP0xYOSXA7ory32w==
X-Google-Smtp-Source: ABdhPJxOAHbYDT98soB0V7lrp6FgYIOSrPi8LmCtIn6IV8PIcvIkug+UmpB+qaPTZIDHe/xqcESyUw==
X-Received: by 2002:a05:6512:3f88:b0:477:c0fe:3383 with SMTP id x8-20020a0565123f8800b00477c0fe3383mr24806489lfa.3.1653523142757;
        Wed, 25 May 2022 16:59:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:59:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 19/34] phy: qcom-qmp: move MSM8996 USB PHY to new QMP driver
Date:   Thu, 26 May 2022 02:58:26 +0300
Message-Id: <20220525235841.852301-20-dmitry.baryshkov@linaro.org>
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

Move support for the USB PHY driver on MSM8996 platform to new QMP
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 131 ++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c     |  93 -----------------
 2 files changed, 131 insertions(+), 93 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index d2d799f8c81f..bb03b864fe38 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -50,6 +50,133 @@ struct qmp_usb_phy {
 
 #define to_qmp_usb_phy(qphy)	container_of(qphy, struct qmp_usb_phy, base)
 
+static const unsigned int usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_FLL_CNTRL1]		= 0xc0,
+	[QPHY_FLL_CNTRL2]		= 0xc4,
+	[QPHY_FLL_CNT_VAL_L]		= 0xc8,
+	[QPHY_FLL_CNT_VAL_H_TOL]	= 0xcc,
+	[QPHY_FLL_MAN_CODE]		= 0xd0,
+	[QPHY_SW_RESET]			= 0x00,
+	[QPHY_START_CTRL]		= 0x08,
+	[QPHY_PCS_STATUS]		= 0x17c,
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d4,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0d8,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x178,
+};
+
+static const struct qmp_phy_init_tbl msm8996_usb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TRIM, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x04),
+	/* PLL and Loop filter settings */
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_CFG, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x0a),
+	/* SSC settings */
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER1, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE1, 0xde),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE2, 0x07),
+};
+
+static const struct qmp_phy_init_tbl msm8996_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
+};
+
+static const struct qmp_phy_init_tbl msm8996_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4c),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xbb),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
+};
+
+static const struct qmp_phy_init_tbl msm8996_usb3_pcs_tbl[] = {
+	/* FLL settings */
+	QMP_PHY_INIT_CFG_L(QPHY_FLL_CNTRL2, 0x03),
+	QMP_PHY_INIT_CFG_L(QPHY_FLL_CNTRL1, 0x02),
+	QMP_PHY_INIT_CFG_L(QPHY_FLL_CNT_VAL_L, 0x09),
+	QMP_PHY_INIT_CFG_L(QPHY_FLL_CNT_VAL_H_TOL, 0x42),
+	QMP_PHY_INIT_CFG_L(QPHY_FLL_MAN_CODE, 0x85),
+
+	/* Lock Det settings */
+	QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG1, 0xd1),
+	QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG2, 0x1f),
+	QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG3, 0x47),
+	QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG2, 0x08),
+};
+
+/* list of clocks required by phy */
+static const char * const msm8996_phy_clk_l[] = {
+	"aux", "cfg_ahb", "ref",
+};
+
+/* list of resets */
+static const char * const msm8996_usb3phy_reset_l[] = {
+	"phy", "common",
+};
+
+/* list of regulators */
+static const char * const qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll",
+};
+
+static const struct qmp_phy_usb_cfg msm8996_usb3phy_cfg = {
+	.base = {
+		.type			= PHY_TYPE_USB3,
+		.nlanes			= 1,
+
+		.serdes_tbl		= msm8996_usb3_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(msm8996_usb3_serdes_tbl),
+		.tx_tbl			= msm8996_usb3_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(msm8996_usb3_tx_tbl),
+		.rx_tbl			= msm8996_usb3_rx_tbl,
+		.rx_tbl_num		= ARRAY_SIZE(msm8996_usb3_rx_tbl),
+		.pcs_tbl		= msm8996_usb3_pcs_tbl,
+		.pcs_tbl_num		= ARRAY_SIZE(msm8996_usb3_pcs_tbl),
+		.clk_list		= msm8996_phy_clk_l,
+		.num_clks		= ARRAY_SIZE(msm8996_phy_clk_l),
+		.reset_list		= msm8996_usb3phy_reset_l,
+		.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= usb3phy_regs_layout,
+
+		.start_ctrl		= SERDES_START | PCS_START,
+		.pwrdn_ctrl		= SW_PWRDN,
+		.phy_status		= PHYSTATUS,
+	},
+};
+
 static int qcom_qmp_phy_com_init(struct qmp_usb_phy *qphy_usb)
 {
 	struct qcom_qmp *qmp = qphy_usb->base.qmp;
@@ -366,6 +493,10 @@ static int qcom_qmp_phy_usb_create(struct device *dev, struct device_node *np, i
 }
 
 static const struct of_device_id qcom_qmp_phy_usb_of_match_table[] = {
+	{
+		.compatible = "qcom,msm8996-qmp-usb3-phy",
+		.data = &msm8996_usb3phy_cfg,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, qcom_qmp_phy_usb_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index c6e82d2a5fc1..28a45a73fc1c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -276,77 +276,12 @@ static const struct qmp_phy_init_tbl ipq8074_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0, 0x0f),
 };
 
-static const struct qmp_phy_init_tbl msm8996_usb3_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TRIM, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x04),
-	/* PLL and Loop filter settings */
-	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x55),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x55),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
-	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x15),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x34),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_CFG, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x0a),
-	/* SSC settings */
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_EN_CENTER, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER1, 0x31),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER2, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE1, 0xde),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE2, 0x07),
-};
-
 static const struct qmp_phy_init_tbl msm8996_usb3_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
 	QMP_PHY_INIT_CFG(QSERDES_TX_RCV_DETECT_LVL_2, 0x12),
 	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
 };
 
-static const struct qmp_phy_init_tbl msm8996_usb3_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4c),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xbb),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
-};
-
-static const struct qmp_phy_init_tbl msm8996_usb3_pcs_tbl[] = {
-	/* FLL settings */
-	QMP_PHY_INIT_CFG_L(QPHY_FLL_CNTRL2, 0x03),
-	QMP_PHY_INIT_CFG_L(QPHY_FLL_CNTRL1, 0x02),
-	QMP_PHY_INIT_CFG_L(QPHY_FLL_CNT_VAL_L, 0x09),
-	QMP_PHY_INIT_CFG_L(QPHY_FLL_CNT_VAL_H_TOL, 0x42),
-	QMP_PHY_INIT_CFG_L(QPHY_FLL_MAN_CODE, 0x85),
-
-	/* Lock Det settings */
-	QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG1, 0xd1),
-	QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG2, 0x1f),
-	QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG3, 0x47),
-	QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG2, 0x08),
-};
-
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x14),
@@ -1781,31 +1716,6 @@ static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 	.phy_status		= PHYSTATUS,
 };
 
-static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
-	.type			= PHY_TYPE_USB3,
-	.nlanes			= 1,
-
-	.serdes_tbl		= msm8996_usb3_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(msm8996_usb3_serdes_tbl),
-	.tx_tbl			= msm8996_usb3_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(msm8996_usb3_tx_tbl),
-	.rx_tbl			= msm8996_usb3_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(msm8996_usb3_rx_tbl),
-	.pcs_tbl		= msm8996_usb3_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(msm8996_usb3_pcs_tbl),
-	.clk_list		= msm8996_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(msm8996_phy_clk_l),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= usb3phy_regs_layout,
-
-	.start_ctrl		= SERDES_START | PCS_START,
-	.pwrdn_ctrl		= SW_PWRDN,
-	.phy_status		= PHYSTATUS,
-};
-
 static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -3847,9 +3757,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	{
 		.compatible = "qcom,ipq8074-qmp-usb3-phy",
 		.data = &ipq8074_usb3phy_cfg,
-	}, {
-		.compatible = "qcom,msm8996-qmp-usb3-phy",
-		.data = &msm8996_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,ipq6018-qmp-usb3-phy",
 		.data = &ipq8074_usb3phy_cfg,
-- 
2.35.1

