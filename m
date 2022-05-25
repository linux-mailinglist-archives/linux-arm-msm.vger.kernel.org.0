Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36D9A534735
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345477AbiEYX7Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345470AbiEYX7N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:59:13 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA269E9F1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:12 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq30so105588lfb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=comhPM7wkOg/jnnUByhTOPhH8h+vn/AFJlHLkL2hDjM=;
        b=z6gWvx+yk+CJ4CPnNJktw6tI+PY/nYb9oKnaOo5PEVPMmWgAf3hNw5qrrtFDZTbn8P
         EQhsZiDwfznaCSmqtt+F5Hg7Nq1EMHYemnG449DcPxQggyBBHI5UdkN9CUJ823LyCqgf
         73vahm7wzXTZGO3k7HJTScrnksciST+cJi5n4zqWYINl5wbch8G2JSA/65SCX40L/7ni
         d7JRaa4trl+HoQbcGDjL39Oy8CIyQm6NufX/gOfjvKsWGaLd+PEhlhqGEqTbNzzK3kGC
         jDIURPiSG4L4CL7MI5YVR/PAXpAPK6GQ+5xeD2H00PSocXHXikXXeUTaFh0L44di6ysM
         1cLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=comhPM7wkOg/jnnUByhTOPhH8h+vn/AFJlHLkL2hDjM=;
        b=Ffl0Fs63u+dPOqFIbrt9NNDtVIiYl94RlYnWuh5NI5qzjjrulkPvXBRF2SlbvVCYeP
         zwmE3TXm6GNPwBxprb0Rh7Cp8I5As6+mN0AMzgQCvewjyplnQx1qNQgiN2wK1siwH31u
         lsipYpvGyBktpc382T0rwUUHFEUu/hX9PEl5hL0JvP6hn+HA5hxgPCeDznXXhyBJa4nw
         5vfYASjFmhsSwAnHostM6Pg3NeTAiFxiL/96poKtto8cBn/noYWuQLeshQ7yzANqx/uE
         8Sujq/Isp1yfYfHlYuik9oKxg7XZgEfq92DDK+ZczfaCFAIpwQT96IBiW8o2isL0IBmd
         tiBQ==
X-Gm-Message-State: AOAM530PgbzniRO/hLFMujsApG9z8MZG6PAJyVoaeaT036QBrZj0Ny1u
        /GndeCsbBuE8mVk9dQRqYGT2LA==
X-Google-Smtp-Source: ABdhPJzJugag4xBT4rf7oLVM6YKIo+YQ+sN4cZAOlWPkkhtVd8EJio9q2Bgby8I09JHLOCsUvUTIfg==
X-Received: by 2002:a05:6512:3d1f:b0:477:bfe7:5521 with SMTP id d31-20020a0565123d1f00b00477bfe75521mr24750106lfv.533.1653523151598;
        Wed, 25 May 2022 16:59:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:59:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 28/34] phy: qcom-qmp: move SDX65 USB PHY to new QMP driver
Date:   Thu, 26 May 2022 02:58:35 +0300
Message-Id: <20220525235841.852301-29-dmitry.baryshkov@linaro.org>
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

Move support for the USB PHY driver on SDX65 platform to new QMP
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c |  78 ++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c     | 152 ------------------------
 2 files changed, 78 insertions(+), 152 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 5ac75e12f54a..687e9ef8523f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -625,6 +625,50 @@ static const struct qmp_phy_init_tbl sdx55_usb3_uniphy_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
 };
 
+static const struct qmp_phy_init_tbl sdx65_usb3_uniphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xa5),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_2, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PI_QEC_CTRL, 0x21),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0b),
+};
+
+static const struct qmp_phy_init_tbl sdx65_usb3_uniphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0xbd),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xa9),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x7b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0x64),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_GM_CAL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_ENABLES, 0x00),
+};
+
 static const struct qmp_phy_init_tbl sm8150_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
@@ -1367,6 +1411,37 @@ static const struct qmp_phy_usb_cfg sdx55_usb3_uniphy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
+static const struct qmp_phy_usb_cfg sdx65_usb3_uniphy_cfg = {
+	.base = {
+		.type			= PHY_TYPE_USB3,
+		.nlanes			= 1,
+
+		.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
+		.tx_tbl			= sdx65_usb3_uniphy_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(sdx65_usb3_uniphy_tx_tbl),
+		.rx_tbl			= sdx65_usb3_uniphy_rx_tbl,
+		.rx_tbl_num		= ARRAY_SIZE(sdx65_usb3_uniphy_rx_tbl),
+		.pcs_tbl		= sm8350_usb3_uniphy_pcs_tbl,
+		.pcs_tbl_num		= ARRAY_SIZE(sm8350_usb3_uniphy_pcs_tbl),
+		.clk_list		= qmp_v4_sdx55_usbphy_clk_l,
+		.num_clks		= ARRAY_SIZE(qmp_v4_sdx55_usbphy_clk_l),
+		.reset_list		= msm8996_usb3phy_reset_l,
+		.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= sm8350_usb3_uniphy_regs_layout,
+
+		.start_ctrl		= SERDES_START | PCS_START,
+		.pwrdn_ctrl		= SW_PWRDN,
+		.phy_status		= PHYSTATUS,
+	},
+
+	.has_pwrdn_delay	= true,
+	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
+	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
+};
+
 static const struct qmp_phy_usb_cfg sm8150_usb3phy_cfg = {
 	.base = {
 		.type			= PHY_TYPE_USB3,
@@ -1908,6 +1983,9 @@ static const struct of_device_id qcom_qmp_phy_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdx55-qmp-usb3-uni-phy",
 		.data = &sdx55_usb3_uniphy_cfg,
+	}, {
+		.compatible = "qcom,sdx65-qmp-usb3-uni-phy",
+		.data = &sdx65_usb3_uniphy_cfg,
 	}, {
 		.compatible = "qcom,sm8150-qmp-usb3-phy",
 		.data = &sm8150_usb3phy_cfg,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 1b5420e61387..ab14588909e1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -159,15 +159,6 @@ static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = 0x314,
 };
 
-static const unsigned int sm8350_usb3_uniphy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= 0x00,
-	[QPHY_START_CTRL]		= 0x44,
-	[QPHY_PCS_STATUS]		= 0x14,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
-	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x1008,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x1014,
-};
-
 static const unsigned int qcm2290_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
@@ -474,49 +465,6 @@ static const struct qmp_phy_init_tbl sm8150_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
 };
 
-static const struct qmp_phy_init_tbl sm8150_usb3_uniphy_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x1a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0xab),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0xea),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xca),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x34),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE1, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE1, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE1, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE1, 0xab),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE1, 0xea),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE1, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0x34),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xca),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_IPTRIM, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1, 0xde),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0xde),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
-};
-
 static const struct qmp_phy_init_tbl sm8250_usb3_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_TX, 0x60),
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_RX, 0x60),
@@ -666,69 +614,6 @@ static const struct qmp_phy_init_tbl qmp_v4_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_EMP_POST1_LVL, 0x20),
 };
 
-static const struct qmp_phy_init_tbl sdx65_usb3_uniphy_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xa5),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_2, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PI_QEC_CTRL, 0x21),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0b),
-};
-
-static const struct qmp_phy_init_tbl sdx65_usb3_uniphy_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xdb),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0xbd),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xa9),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x7b),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xe4),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0x64),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x99),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH1, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH2, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN2, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL1, 0x54),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_GM_CAL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_ENABLES, 0x00),
-};
-
-static const struct qmp_phy_init_tbl sm8350_usb3_uniphy_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_UNI_RXEQTRAINING_DFE_TIME_S2, 0x07),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_UNI_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
-};
-
 static const struct qmp_phy_init_tbl qcm2290_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
@@ -1038,11 +923,6 @@ static const char * const qmp_v4_sm8250_usbphy_clk_l[] = {
 	"aux", "ref_clk_src", "com_aux"
 };
 
-/* usb3 phy on sdx55 doesn't have com_aux clock */
-static const char * const qmp_v4_sdx55_usbphy_clk_l[] = {
-	"aux", "cfg_ahb", "ref"
-};
-
 static const char * const qcm2290_usb3phy_clk_l[] = {
 	"cfg_ahb", "ref", "com_aux",
 };
@@ -1282,35 +1162,6 @@ static const struct qmp_phy_combo_cfg sm8250_usb3dpphy_cfg = {
 	.dp_cfg			= &sm8250_dpphy_cfg,
 };
 
-static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
-	.type			= PHY_TYPE_USB3,
-	.nlanes			= 1,
-
-	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
-	.tx_tbl			= sdx65_usb3_uniphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sdx65_usb3_uniphy_tx_tbl),
-	.rx_tbl			= sdx65_usb3_uniphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sdx65_usb3_uniphy_rx_tbl),
-	.pcs_tbl		= sm8350_usb3_uniphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8350_usb3_uniphy_pcs_tbl),
-	.clk_list		= qmp_v4_sdx55_usbphy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_sdx55_usbphy_clk_l),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8350_usb3_uniphy_regs_layout,
-
-	.start_ctrl		= SERDES_START | PCS_START,
-	.pwrdn_ctrl		= SW_PWRDN,
-	.phy_status		= PHYSTATUS,
-
-	.has_pwrdn_delay	= true,
-	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
-	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
-};
-
 static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -2876,9 +2727,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8250-qmp-usb3-dp-phy",
 		/* It's a combo phy */
-	}, {
-		.compatible = "qcom,sdx65-qmp-usb3-uni-phy",
-		.data = &sdx65_usb3_uniphy_cfg,
 	}, {
 		.compatible = "qcom,qcm2290-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,
-- 
2.35.1

