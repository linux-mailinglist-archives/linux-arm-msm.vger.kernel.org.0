Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15CC4534729
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343914AbiEYX7D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344731AbiEYX7C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:59:02 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD91E9E9E0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:00 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p22so5895lfo.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qISPZP6shibF5+WdjLrE/7XQqA71jI+P0LNv4d1OaUM=;
        b=KXBZFLSwYKbPHSubEv7zDFdFnTwSz8MigMcLhzI1KRm82VDANESSih3FfLqY5+7dnH
         EBP2zNjAVqeucrTnDLMyW1LtlKrgzvzj5FTw5jHs4hkRO/67PgDHehhzNYIsKi+WiS4Y
         51BXR3XuQwtTy3KtJh0eGC9JjejauSFODocxzDYSzM0SAzwm1ZivmRk72xy1BJA2Bhqt
         PTQKsYK7IEu7aAJ9dBla2iiapWN71gE/qIAKWjoN0Rq0Qs7l+FtR5zj8kQXIq80LQcVY
         ERduBiOWlhQGct6AaY/EyI9TG5MFYd9JwFb7bRzJrXTlnK4UTM9jIqGAJ77lVqVHFNoB
         WRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qISPZP6shibF5+WdjLrE/7XQqA71jI+P0LNv4d1OaUM=;
        b=0N6Bw0TJDT1PoYQjMygurk/YN46VimeUXh3ef7iFGoxGI1ERAgoIwJVtDifpBvxH2j
         P9++uWiut6NXGXVwfHj0Y8GPskLqFkIpHvC4D+cj2yjvfuDRtxnqZ7LwDGdywB3OrlWn
         mdmmtOJflEA4Vyl2Bad5DnkoeLDk2nkey/n7liOmgWP+WdNj15ClHBCjMudUjwcvO1HN
         ej5QNCM29RW/ULu54uY/7ddZeQ3Apz+itWthAsSwjpqwqltcNASe1xlwi/TJL2NNABWK
         ++lWFdL5qeP35//nmXhle3FPHZ04HTPT0Hrt+xaPlgWrhgl8GG1+emfYRyYQhJhBgRcr
         6RNg==
X-Gm-Message-State: AOAM53358u93onMVTdjmiU6M2fCxmbz/471jWPVbXQi15KrnmGUkXxMq
        UOgzan/Mm0m4m+8U2h/zuIpmkg==
X-Google-Smtp-Source: ABdhPJzmie3PwIw9MFa1XxnnvIvRSxl43phn/J5P7maoMAgNK/5QFBTio5SvffDSAnXlqCenT+wgjA==
X-Received: by 2002:ac2:5d6f:0:b0:477:bf62:d570 with SMTP id h15-20020ac25d6f000000b00477bf62d570mr24736415lft.266.1653523138927;
        Wed, 25 May 2022 16:58:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:58:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 15/34] phy: qcom-qmp: move SC8180x, SM8150 and SM8250 UFS PHY to new QMP driver
Date:   Thu, 26 May 2022 02:58:22 +0300
Message-Id: <20220525235841.852301-16-dmitry.baryshkov@linaro.org>
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

Move support for the UFS PHY driver on SC8180x, SM8150 and SM8250
platform to new QMP driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 130 ++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c     | 121 ----------------------
 2 files changed, 130 insertions(+), 121 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 546da24dac05..c0596ccc6a76 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -51,6 +51,12 @@ static const unsigned int sdm845_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_READY_STATUS]		= 0x160,
 };
 
+static const unsigned int qmp_v4_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= QPHY_V4_PCS_UFS_PHY_START,
+	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_UFS_READY_STATUS,
+	[QPHY_SW_RESET]			= QPHY_V4_PCS_UFS_SW_RESET,
+};
+
 static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
@@ -198,6 +204,93 @@ static const struct qmp_phy_init_tbl sdm845_ufsphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_MULTI_LANE_CTRL1, 0x02),
 };
 
+static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0xd9),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_INITVAL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xac),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
+
+	/* Rate B */
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x06),
+};
+
+static const struct qmp_phy_init_tbl sm8150_ufsphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TRAN_DRVR_EMP_EN, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl sm8150_ufsphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_LVL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_BAND, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0xf1),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_TERM_BW, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1d),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_MEASURE_TIME, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xf6),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x3d),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xe0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0xe0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0xb1),
+
+};
+
+static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_DEBUG_BUS_CLKSEL, 0x1f),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_MIN_HIBERN8_TIME, 0xff),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
+};
+
 /* list of clocks required by phy */
 static const char * const msm8996_ufs_phy_clk_l[] = {
 	"ref",
@@ -271,6 +364,34 @@ static const struct qmp_phy_ufs_cfg sdm845_ufsphy_cfg = {
 	.no_pcs_sw_reset	= true,
 };
 
+static const struct qmp_phy_ufs_cfg sm8150_ufsphy_cfg = {
+	.base = {
+		.type			= PHY_TYPE_UFS,
+		.nlanes			= 2,
+
+		.serdes_tbl		= sm8150_ufsphy_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_serdes_tbl),
+		.tx_tbl			= sm8150_ufsphy_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_tx_tbl),
+		.rx_tbl			= sm8150_ufsphy_rx_tbl,
+		.rx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_rx_tbl),
+		.pcs_tbl		= sm8150_ufsphy_pcs_tbl,
+		.pcs_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_pcs_tbl),
+		.clk_list		= sdm845_ufs_phy_clk_l,
+		.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= qmp_v4_ufsphy_regs_layout,
+
+		.start_ctrl		= SERDES_START,
+		.pwrdn_ctrl		= SW_PWRDN,
+		.phy_status		= PCS_READY,
+		.phy_status_active_high	= true,
+
+		.is_dual_lane_phy	= true,
+	},
+};
+
 static int qcom_qmp_phy_com_init(struct qmp_ufs_phy *qphy_ufs)
 {
 	struct qcom_qmp *qmp = qphy_ufs->base.qmp;
@@ -479,12 +600,21 @@ static const struct of_device_id qcom_qmp_phy_ufs_of_match_table[] = {
 	}, {
 		.compatible = "qcom,msm8998-qmp-ufs-phy",
 		.data = &sdm845_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sc8180x-qmp-ufs-phy",
+		.data = &sm8150_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sdm845-qmp-ufs-phy",
 		.data = &sdm845_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sm6350-qmp-ufs-phy",
 		.data = &sdm845_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm8150-qmp-ufs-phy",
+		.data = &sm8150_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm8250-qmp-ufs-phy",
+		.data = &sm8150_ufsphy_cfg,
 	},
 	{ },
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index d015ab2dac08..baeb78232c40 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -857,93 +857,6 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
 };
 
-static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0xd9),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x11),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_INITVAL2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xac),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x98),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0x32),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
-
-	/* Rate B */
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x06),
-};
-
-static const struct qmp_phy_init_tbl sm8150_ufsphy_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TRAN_DRVR_EMP_EN, 0x0c),
-};
-
-static const struct qmp_phy_init_tbl sm8150_ufsphy_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_LVL, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_BAND, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0xf1),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_TERM_BW, 0x1b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1d),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_MEASURE_TIME, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xf6),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x3b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x3d),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xe0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x3b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb1),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0xe0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x3b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0xb1),
-
-};
-
-static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_DEBUG_BUS_CLKSEL, 0x1f),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_MIN_HIBERN8_TIME, 0xff),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
-};
-
 static const struct qmp_phy_init_tbl sm8150_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
@@ -2288,31 +2201,6 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.is_dual_lane_phy       = true,
 };
 
-static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
-	.type			= PHY_TYPE_UFS,
-	.nlanes			= 2,
-
-	.serdes_tbl		= sm8150_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_serdes_tbl),
-	.tx_tbl			= sm8150_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_tx_tbl),
-	.rx_tbl			= sm8150_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_rx_tbl),
-	.pcs_tbl		= sm8150_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_pcs_tbl),
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8150_ufsphy_regs_layout,
-
-	.start_ctrl		= SERDES_START,
-	.pwrdn_ctrl		= SW_PWRDN,
-	.phy_status		= PHYSTATUS,
-
-	.is_dual_lane_phy	= true,
-};
-
 static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -4256,9 +4144,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
 		/* It's a combo phy */
-	}, {
-		.compatible = "qcom,sc8180x-qmp-ufs-phy",
-		.data = &sm8150_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sc8280xp-qmp-ufs-phy",
 		.data = &sm8350_ufsphy_cfg,
@@ -4280,12 +4165,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm6115-qmp-ufs-phy",
 		.data = &sm6115_ufsphy_cfg,
-	}, {
-		.compatible = "qcom,sm8150-qmp-ufs-phy",
-		.data = &sm8150_ufsphy_cfg,
-	}, {
-		.compatible = "qcom,sm8250-qmp-ufs-phy",
-		.data = &sm8150_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sm8150-qmp-usb3-phy",
 		.data = &sm8150_usb3phy_cfg,
-- 
2.35.1

