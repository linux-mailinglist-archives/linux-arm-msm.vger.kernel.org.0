Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA5E534722
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345411AbiEYX64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343914AbiEYX64 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:58:56 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648059E9C9
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:54 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t25so84689lfg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IAKGAT+Va6XhxvC1IK7P7tDDbs9oCmPzj6PzZc4oKek=;
        b=P8cDFOV0Mw6tPDEA17aHFUVWHG1CqwMRDcUExKNJ1zM0V8ZIDYOwCYa2p4KI1UDLE4
         BBH6blHHhCDsE3kIo8h7+J+NW68+PSOzsJGkHEwwfrjCAZjc3GSJavhh33Ge0p8DYyp6
         svD+mFiB1PrX2UMV6GaTUdjz0/OZeyAnKujFaXXUw4Shtrxuu7CydClsG8e/d1EpqO0v
         9+G2XRIODJSxh88AgWWZkQ2V2Hnup0rHo/jHOTm5e4QkiQVLojXrvq0gi2mKXiKrbQ5S
         oQD1Ximkcj/9bwOiNniEvuncJYR/bcHIypfTj7MR30ZEiAUIEDbJwZlJ1uqBFos7ta58
         O2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IAKGAT+Va6XhxvC1IK7P7tDDbs9oCmPzj6PzZc4oKek=;
        b=zVYqWdQAvMCjC7J6whNgDkuhQp19AjIyRQNigTkomCbDNgM/R+yPQCV6XvBdt7R0sq
         NvGU3E6edLDETFpvZ4zzWv7KiZGyuvaZkdldKn8ZvECyIgnctUjfYMNIKxe3HqiHhb/X
         +8q2l++cFNHX2uuzkdQJuvH9g+l1Mq0o/q6js9tN6XhSPtjBb1xlVa1P2VFqkuuuug5q
         v28ZyjxRH/NlSnoCqNlPHZ4eZPrOiTt7JPScb+5ZtQPmH4w4oBA2nRhIMjLaP0Ho673J
         tcTSDLqR1pdOOGuRqaTwuMIuszYAyoTd5AB0F2z6V5Yt2MqTe2R/I1CYP1a7kVNCuKAz
         uS1w==
X-Gm-Message-State: AOAM531Xb+cxOpLcOFCrkdpT00F15Y0dRAGrOH7VqMuNAxrpBGR4TZ+n
        mZh9Wrat6bSGkZLpwcK2bIL1/bLSilVAtg==
X-Google-Smtp-Source: ABdhPJy7Ph9xvRCOjzNYizcsVQYZwVy/a8DF0zyYFiFpuoQ61jv0UzWN+E8DANsl7sp+hv1xcoLvKw==
X-Received: by 2002:a05:6512:1398:b0:448:bda0:99f2 with SMTP id p24-20020a056512139800b00448bda099f2mr24496198lfa.681.1653523132695;
        Wed, 25 May 2022 16:58:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:58:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 09/34] phy: qcom-qmp: move SC8180x PCIe PHY to new QMP driver
Date:   Thu, 26 May 2022 02:58:16 +0300
Message-Id: <20220525235841.852301-10-dmitry.baryshkov@linaro.org>
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

Move support for the PCIe PHY driver on SC8180x platform to new QMP
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 143 +++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c      | 140 ----------------------
 2 files changed, 143 insertions(+), 140 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 90ad97ed3bb7..7c6b1c450f50 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -447,6 +447,113 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
 };
 
+static const struct qmp_phy_init_tbl sc8180x_qmp_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_SELECT, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE1, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE1, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE1, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xca),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xa2),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0xde),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1, 0x4c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_ENABLE1, 0x90),
+};
+
+static const struct qmp_phy_init_tbl sc8180x_qmp_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0x5),
+};
+
+static const struct qmp_phy_init_tbl sc8180x_qmp_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL1, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x6e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x6e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x37),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x39),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xec),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x39),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x75),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RCLK_AUXDATA_SEL, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x03),
+};
+
+static const struct qmp_phy_init_tbl sc8180x_qmp_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RATE_SLEW_CNTRL1, 0x0b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x01),
+};
+
+static const struct qmp_phy_init_tbl sc8180x_qmp_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_PRE, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_POST, 0x58),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
+};
+
 static const struct qmp_phy_init_tbl sdm845_qhp_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_SYSCLK_EN_SEL, 0x27),
 	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_COM_SSC_EN_CENTER, 0x01),
@@ -966,6 +1073,39 @@ static const struct qmp_phy_pcie_cfg msm8998_pciephy_cfg = {
 	},
 };
 
+static const struct qmp_phy_pcie_cfg sc8180x_pciephy_cfg = {
+	.base = {
+		.type = PHY_TYPE_PCIE,
+		.nlanes = 1,
+
+		.serdes_tbl		= sc8180x_qmp_pcie_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_serdes_tbl),
+		.tx_tbl			= sc8180x_qmp_pcie_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_tx_tbl),
+		.rx_tbl			= sc8180x_qmp_pcie_rx_tbl,
+		.rx_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_rx_tbl),
+		.pcs_tbl		= sc8180x_qmp_pcie_pcs_tbl,
+		.pcs_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_pcs_tbl),
+		.clk_list		= sdm845_pciephy_clk_l,
+		.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
+		.reset_list		= sdm845_pciephy_reset_l,
+		.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= sm8250_pcie_regs_layout,
+
+		.start_ctrl		= PCS_START | SERDES_START,
+		.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	},
+
+	.pcs_misc_tbl		= sc8180x_qmp_pcie_pcs_misc_tbl,
+	.pcs_misc_tbl_num	= ARRAY_SIZE(sc8180x_qmp_pcie_pcs_misc_tbl),
+
+	.has_pwrdn_delay	= true,
+	.pwrdn_delay_min	= 995,		/* us */
+	.pwrdn_delay_max	= 1005,		/* us */
+};
+
 static const struct qmp_phy_pcie_cfg sdm845_qhp_pciephy_cfg = {
 	.base = {
 		.type = PHY_TYPE_PCIE,
@@ -1451,6 +1591,9 @@ static const struct of_device_id qcom_qmp_phy_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,msm8998-qmp-pcie-phy",
 		.data = &msm8998_pciephy_cfg,
+	}, {
+		.compatible = "qcom,sc8180x-qmp-pcie-phy",
+		.data = &sc8180x_pciephy_cfg,
 	}, {
 		.compatible = "qcom,sdm845-qhp-pcie-phy",
 		.data = &sdm845_qhp_pciephy_cfg,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 2576ccf8ccf1..82a96396244b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1540,113 +1540,6 @@ static const struct qmp_phy_init_tbl qmp_v4_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_EMP_POST1_LVL, 0x20),
 };
 
-static const struct qmp_phy_init_tbl sc8180x_qmp_pcie_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_SELECT, 0x34),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE1, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x42),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE1, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE1, 0xb4),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x55),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0x55),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x1a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x68),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE1, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE1, 0xaa),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE1, 0xab),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x34),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xca),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xa2),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0xde),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1, 0x4c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_ENABLE1, 0x90),
-};
-
-static const struct qmp_phy_init_tbl sc8180x_qmp_pcie_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0x5),
-};
-
-static const struct qmp_phy_init_tbl sc8180x_qmp_pcie_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_ENABLES, 0x1c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL1, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x6e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x6e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x4a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x70),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x37),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0xd4),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0x54),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xdb),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x39),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0x31),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xe4),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xec),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x39),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0xdb),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x75),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RCLK_AUXDATA_SEL, 0xc0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x03),
-};
-
-static const struct qmp_phy_init_tbl sc8180x_qmp_pcie_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RATE_SLEW_CNTRL1, 0x0b),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x0d),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x01),
-};
-
-static const struct qmp_phy_init_tbl sc8180x_qmp_pcie_pcs_misc_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_PRE, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_POST, 0x58),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
-};
-
 static const struct qmp_phy_init_tbl sdx55_usb3_uniphy_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
@@ -2985,36 +2878,6 @@ static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
 	.is_dual_lane_phy	= true,
 };
 
-static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
-	.type = PHY_TYPE_PCIE,
-	.nlanes = 1,
-
-	.serdes_tbl		= sc8180x_qmp_pcie_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_serdes_tbl),
-	.tx_tbl			= sc8180x_qmp_pcie_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_tx_tbl),
-	.rx_tbl			= sc8180x_qmp_pcie_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_rx_tbl),
-	.pcs_tbl		= sc8180x_qmp_pcie_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_pcs_tbl),
-	.pcs_misc_tbl		= sc8180x_qmp_pcie_pcs_misc_tbl,
-	.pcs_misc_tbl_num	= ARRAY_SIZE(sc8180x_qmp_pcie_pcs_misc_tbl),
-	.clk_list		= sdm845_pciephy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_pciephy_clk_l),
-	.reset_list		= sdm845_pciephy_reset_l,
-	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8250_pcie_regs_layout,
-
-	.start_ctrl		= PCS_START | SERDES_START,
-	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
-
-	.has_pwrdn_delay	= true,
-	.pwrdn_delay_min	= 995,		/* us */
-	.pwrdn_delay_max	= 1005,		/* us */
-};
-
 static const struct qmp_phy_cfg sc8180x_dpphy_cfg = {
 	.type			= PHY_TYPE_DP,
 	.nlanes			= 1,
@@ -5026,9 +4889,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
 		/* It's a combo phy */
-	}, {
-		.compatible = "qcom,sc8180x-qmp-pcie-phy",
-		.data = &sc8180x_pciephy_cfg,
 	}, {
 		.compatible = "qcom,sc8180x-qmp-ufs-phy",
 		.data = &sm8150_ufsphy_cfg,
-- 
2.35.1

