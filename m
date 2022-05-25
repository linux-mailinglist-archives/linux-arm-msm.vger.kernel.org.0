Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36530534733
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345472AbiEYX7O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345466AbiEYX7M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:59:12 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2319F9E9C9
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:11 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bu29so149225lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P7SENhtbBcPPGAFnJNgKI7+Binv+gj6THRzIoncAfU4=;
        b=FFuB7PUkxBKePzlYaZDHPixNo5Zsa/n2n2bAFZP/gXK3SwymIhYrtMET+tnfwMIGR8
         S7hGzpAvKsgEB9LIdhpTEO/W8fPN6YHTCfHio4maNyB0tOdgErJE12X45n6vPPSO/2Vv
         3cz0h93DeUKiQeFnMl5JoZPPKtsNl0XZQfxcu02ButP2DSD483b5h7tIE682EGO0vv3c
         KGNLPth3CwhYNIawrvcTcGL8VjGC/gg5NmOXXnlV1GNx2ky+5PgVl9KYTSV7p4RvwZsP
         XXBKnUgJy7qaNC3nLaeDEhz8eJKfuneN0NI6UN95NR8RCELLrFlRb1q+xsnqHHFQ6aoE
         YdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7SENhtbBcPPGAFnJNgKI7+Binv+gj6THRzIoncAfU4=;
        b=SxgbUffWcby1YQfP/FrzkA2peQ7tLX2KrLikB89L3KFG1kGbSFRDlBZ9lR0P06ov48
         Z8CR8cNOCB5b5lB1x7eFszMiLKU/V5DbDpVohs5F7623JorP2rAznTvKMX/9mFRHEjYd
         TDn7AX94fPsU0VarhOSGof0zQAFlFwMYuDIiegCx1wk3oLLjq5k4G2Le1moC3mufCwYq
         juNy2wIQZvRmJgiLbaeom2zDY0762l0f7Mwk/LEytPrjQbp0O17ZSMDvL6oUq/Nrg/IK
         B6w2CzqC1UtUj0QprLwOIPQ5aAV4McluGCJc6qhkZ6vdnE/hUZA8oqdfQyIOw7xe59gu
         gaCA==
X-Gm-Message-State: AOAM532BA+AVVbaqDboqVLuYZRTJ7fTPEXgFUnoQqlHaW0xw8MDBs4a9
        vGKd7CC9JtKVaMl7OHzCu1IO+g==
X-Google-Smtp-Source: ABdhPJzfoWVspyz6W65u2rhdarWJQrwbQR8RvuV+Tr5EqOL/AvuGV5wtNsvVyBcnAu+Ao5wM+NTThw==
X-Received: by 2002:a05:6512:1686:b0:477:9266:443c with SMTP id bu6-20020a056512168600b004779266443cmr24201090lfb.609.1653523150629;
        Wed, 25 May 2022 16:59:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:59:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 27/34] phy: qcom-qmp: move SDX55 USB PHY to new QMP driver
Date:   Thu, 26 May 2022 02:58:34 +0300
Message-Id: <20220525235841.852301-28-dmitry.baryshkov@linaro.org>
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

Move support for the USB PHY driver on SDX55 platform to new QMP
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c |  86 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c     | 107 ------------------------
 2 files changed, 86 insertions(+), 107 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index e9dbe5c5ade2..5ac75e12f54a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -578,6 +578,53 @@ static const struct qmp_phy_init_tbl qmp_v3_usb3_uniphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_REFGEN_REQ_CONFIG2, 0x60),
 };
 
+static const struct qmp_phy_init_tbl sdx55_usb3_uniphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x08),
+};
+
+static const struct qmp_phy_init_tbl sdx55_usb3_uniphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x26),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x7b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x048),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
+};
+
 static const struct qmp_phy_init_tbl sm8150_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
@@ -1081,6 +1128,11 @@ static const char * const qmp_v4_phy_clk_l[] = {
 	"aux", "ref_clk_src", "ref", "com_aux",
 };
 
+/* usb3 phy on sdx55 doesn't have com_aux clock */
+static const char * const qmp_v4_sdx55_usbphy_clk_l[] = {
+	"aux", "cfg_ahb", "ref"
+};
+
 /* the primary usb3 phy on sm8250 doesn't have a ref clock */
 static const char * const qmp_v4_sm8250_usbphy_clk_l[] = {
 	"aux", "ref_clk_src", "com_aux"
@@ -1284,6 +1336,37 @@ static const struct qmp_phy_usb_cfg sc7180_usb3phy_cfg = {
 	.has_phy_dp_com_ctrl	= true,
 };
 
+static const struct qmp_phy_usb_cfg sdx55_usb3_uniphy_cfg = {
+	.base = {
+		.type			= PHY_TYPE_USB3,
+		.nlanes			= 1,
+
+		.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
+		.tx_tbl			= sdx55_usb3_uniphy_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(sdx55_usb3_uniphy_tx_tbl),
+		.rx_tbl			= sdx55_usb3_uniphy_rx_tbl,
+		.rx_tbl_num		= ARRAY_SIZE(sdx55_usb3_uniphy_rx_tbl),
+		.pcs_tbl		= sm8250_usb3_uniphy_pcs_tbl,
+		.pcs_tbl_num		= ARRAY_SIZE(sm8250_usb3_uniphy_pcs_tbl),
+		.clk_list		= qmp_v4_sdx55_usbphy_clk_l,
+		.num_clks		= ARRAY_SIZE(qmp_v4_sdx55_usbphy_clk_l),
+		.reset_list		= msm8996_usb3phy_reset_l,
+		.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= qmp_v4_usb3_uniphy_regs_layout,
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
@@ -1822,6 +1905,9 @@ static const struct of_device_id qcom_qmp_phy_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdm845-qmp-usb3-uni-phy",
 		.data = &qmp_v3_usb3_uniphy_cfg,
+	}, {
+		.compatible = "qcom,sdx55-qmp-usb3-uni-phy",
+		.data = &sdx55_usb3_uniphy_cfg,
 	}, {
 		.compatible = "qcom,sm8150-qmp-usb3-phy",
 		.data = &sm8150_usb3phy_cfg,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index a92a4ccd9743..1b5420e61387 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -159,15 +159,6 @@ static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = 0x314,
 };
 
-static const unsigned int qmp_v4_usb3_uniphy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= 0x00,
-	[QPHY_START_CTRL]		= 0x44,
-	[QPHY_PCS_STATUS]		= 0x14,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
-	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x608,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x614,
-};
-
 static const unsigned int sm8350_usb3_uniphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x44,
@@ -595,25 +586,6 @@ static const struct qmp_phy_init_tbl sm8250_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
 };
 
-static const struct qmp_phy_init_tbl sm8250_usb3_uniphy_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xa9),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_UNI_RXEQTRAINING_DFE_TIME_S2, 0x07),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_UNI_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
-};
-
 static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SVS_MODE_CLK_SEL, 0x05),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x3b),
@@ -694,53 +666,6 @@ static const struct qmp_phy_init_tbl qmp_v4_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_EMP_POST1_LVL, 0x20),
 };
 
-static const struct qmp_phy_init_tbl sdx55_usb3_uniphy_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x08),
-};
-
-static const struct qmp_phy_init_tbl sdx55_usb3_uniphy_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x26),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xbf),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb4),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x7b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0x5c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xdc),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xdc),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x048),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
-};
-
 static const struct qmp_phy_init_tbl sdx65_usb3_uniphy_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xa5),
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_2, 0x82),
@@ -1357,35 +1282,6 @@ static const struct qmp_phy_combo_cfg sm8250_usb3dpphy_cfg = {
 	.dp_cfg			= &sm8250_dpphy_cfg,
 };
 
-static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
-	.type			= PHY_TYPE_USB3,
-	.nlanes			= 1,
-
-	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
-	.tx_tbl			= sdx55_usb3_uniphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sdx55_usb3_uniphy_tx_tbl),
-	.rx_tbl			= sdx55_usb3_uniphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sdx55_usb3_uniphy_rx_tbl),
-	.pcs_tbl		= sm8250_usb3_uniphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8250_usb3_uniphy_pcs_tbl),
-	.clk_list		= qmp_v4_sdx55_usbphy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_sdx55_usbphy_clk_l),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3_uniphy_regs_layout,
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
 static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -2980,9 +2876,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8250-qmp-usb3-dp-phy",
 		/* It's a combo phy */
-	}, {
-		.compatible = "qcom,sdx55-qmp-usb3-uni-phy",
-		.data = &sdx55_usb3_uniphy_cfg,
 	}, {
 		.compatible = "qcom,sdx65-qmp-usb3-uni-phy",
 		.data = &sdx65_usb3_uniphy_cfg,
-- 
2.35.1

