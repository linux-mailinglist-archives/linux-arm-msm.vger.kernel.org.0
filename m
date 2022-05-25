Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 580B1534739
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345475AbiEYX7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345478AbiEYX7U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:59:20 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534B29E9C9
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:17 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c19so97231lfv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XvFBfJDw1uD8308zrvwtxj9ZJIUC7ZMaRjZvJVqkT4Y=;
        b=mEYUsm0uLaefO3Dx0zfr+XR546P6H0Kh6thkXVpRTAUjM+8aPCVgVJbnCn035enq0a
         5LHzhM4pBRST6a5xxv3KkTh5ooQF6ANKUg3NICuDBmnrtOvNEnkksn/3X5lPDmHwn+NC
         UGDF3ckurLkr84wcLqMzICVBJWaObCWbsJTRXoRa1ipkhafxoUbdpqc44ByuATitu1pi
         MJ4iioKWwXTkFJS9jvHTUNpzFE+3l49jajT1hiY0GkeHR90t/9kKVxPIZsBuwOhuM8CX
         ouA4w58RKdHUiWpt6hxX2glbSCBxNmkjle7gSh+7c91lIpERqWowZoj5PZW3wQeiUzWL
         Pqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XvFBfJDw1uD8308zrvwtxj9ZJIUC7ZMaRjZvJVqkT4Y=;
        b=XADKf7YUaSrAQBizOZU5IalZqCxqLObN2od982qLS9ya/21mKaGg5jY511z3gK+35K
         KcdzV40qNee0QcEIT0wnX1NbfF1ucmapngdlsZodlXqQ+ynEJa1sm7LPJO6HPfWsTZNA
         E6WaVZDPh5sOysjXgKPp2vhAUC2zkn4nh3dWbPzn9x9+A0iYQnl5jbR4TSE46fCnmZZB
         Lac/CtvPm8ktUCHnklOpLj5uQwMbeYeEbDU7CFyBG7bgjA5AyHqpW4Fp7i+1rkCuLFdU
         CldJ1vNcohpFVHa2l9NcwxV4Uva3Alj2qNIAekT7RYBMTUUirEtqWECPvAQWBDEuH6ym
         wmeQ==
X-Gm-Message-State: AOAM530BK4EsQYl0eGlWxPuFb5q+ei5k0HcbfZaHnlvR4z4DpXCuW2Qg
        I0zy1yunEhC44XXKI2mLx/CkYw==
X-Google-Smtp-Source: ABdhPJy6IrnadKb/W2ubCaqN124FEcZabVXLGp6Mq908mnsUmtg7NHARQvGuc/sT8O/hPShmgYfkRw==
X-Received: by 2002:a05:6512:16a7:b0:445:862e:a1ba with SMTP id bu39-20020a05651216a700b00445862ea1bamr24374772lfb.85.1653523155596;
        Wed, 25 May 2022 16:59:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:59:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 32/34] phy: qcom-qmp: move SC8180X DP PHY to new QMP driver
Date:   Thu, 26 May 2022 02:58:39 +0300
Message-Id: <20220525235841.852301-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525235841.852301-1-dmitry.baryshkov@linaro.org>
References: <20220525235841.852301-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move support for the DP PHY driver on SC8180X platform to new QMP
driver.

While we are at it, use qmp_v4 register layout for the SC8180X DP PHY
(as we do for the USB counterpart).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 337 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-lib.h   |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c   |   3 +-
 drivers/phy/qualcomm/phy-qcom-qmp.c       | 163 -----------
 4 files changed, 340 insertions(+), 164 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 231224bb0355..77fb05144769 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -79,6 +79,11 @@ static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_dp_phy *qphy_dp);
 static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_dp_phy *qphy_dp);
 static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_dp_phy *qphy_dp);
 
+static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_dp_phy *qphy_dp);
+static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_dp_phy *qphy_dp);
+static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_dp_phy *qphy_dp);
+static int qcom_qmp_v4_dp_phy_calibrate(struct qmp_dp_phy *qphy_dp);
+
 static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
@@ -88,6 +93,15 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x170,
 };
 
+static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= 0x00,
+	[QPHY_START_CTRL]		= 0x44,
+	[QPHY_PCS_STATUS]		= 0x14,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x308,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = 0x314,
+};
+
 static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x37),
@@ -170,6 +184,86 @@ static const struct qmp_phy_init_tbl qmp_v3_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x07),
 };
 
+static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_ENABLE1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_CONFIG, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORE_CLK_EN, 0x1f),
+};
+
+static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl_rbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x6f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x04),
+};
+
+static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl_hbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x08),
+};
+
+static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl_hbr2[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x8c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x08),
+};
+
+static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl_hbr3[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x2a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x08),
+};
+
+static const struct qmp_phy_init_tbl qmp_v4_dp_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_VMODE_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_INTERFACE_SELECT, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_CLKBUF_ENABLE, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RESET_TSYNC_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TRAN_DRVR_EMP_EN, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_INTERFACE_MODE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_BAND, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_POL_INV, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_DRV_LVL, 0x2a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_EMP_POST1_LVL, 0x20),
+};
+
 /* list of clocks required by phy */
 static const char * const qmp_v3_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref", "com_aux",
@@ -227,6 +321,48 @@ static const struct qmp_phy_combo_cfg sc7180_usb3dpphy_cfg = {
 	.dp_cfg			= &sc7180_dpphy_cfg,
 };
 
+static const struct qmp_phy_dp_cfg sc8180x_dpphy_cfg = {
+	.base = {
+		.type			= PHY_TYPE_DP,
+		.nlanes			= 1,
+
+		.serdes_tbl		= qmp_v4_dp_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(qmp_v4_dp_serdes_tbl),
+		.tx_tbl			= qmp_v4_dp_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(qmp_v4_dp_tx_tbl),
+
+		.clk_list		= qmp_v3_phy_clk_l,
+		.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
+		.reset_list		= sc7180_usb3phy_reset_l,
+		.num_resets		= ARRAY_SIZE(sc7180_usb3phy_reset_l),
+
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= qmp_v4_usb3phy_regs_layout,
+
+		.is_dual_lane_phy	= true,
+	},
+
+	.serdes_tbl_rbr		= qmp_v4_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v4_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v4_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v4_dp_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr3),
+
+	.dp_aux_init = qcom_qmp_v4_phy_dp_aux_init,
+	.configure_dp_tx = qcom_qmp_v4_phy_configure_dp_tx,
+	.configure_dp_phy = qcom_qmp_v4_phy_configure_dp_phy,
+	.calibrate_dp_phy = qcom_qmp_v4_dp_phy_calibrate,
+};
+
+static const struct qmp_phy_combo_cfg sc8180x_usb3dpphy_cfg = {
+	.usb_cfg		= &sm8150_usb3phy_cfg,
+	.dp_cfg			= &sc8180x_dpphy_cfg,
+};
+
 static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
 	{ 0x00, 0x0c, 0x15, 0x1a },
 	{ 0x02, 0x0e, 0x16, 0xff },
@@ -480,6 +616,204 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_dp_phy *qphy_dp)
 	return 0;
 }
 
+static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_dp_phy *qphy_dp)
+{
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       qphy_dp->base.pcs + QSERDES_DP_PHY_PD_CTL);
+
+	/* Turn on BIAS current for PHY/PLL */
+	writel(0x17, qphy_dp->base.serdes + QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN);
+
+	writel(0x00, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG0);
+	writel(0x13, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG1);
+	writel(0xa4, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG2);
+	writel(0x00, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG3);
+	writel(0x0a, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG4);
+	writel(0x26, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG5);
+	writel(0x0a, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG6);
+	writel(0x03, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG7);
+	writel(0xb7, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG8);
+	writel(0x03, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG9);
+	qphy_dp->dp_aux_cfg = 0;
+
+	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
+	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
+	       PHY_AUX_REQ_ERR_MASK,
+	       qphy_dp->base.pcs + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
+}
+
+static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_dp_phy *qphy_dp)
+{
+	/* Program default values before writing proper values */
+	writel(0x27, qphy_dp->base.tx + QSERDES_V4_TX_TX_DRV_LVL);
+	writel(0x27, qphy_dp->base.tx2 + QSERDES_V4_TX_TX_DRV_LVL);
+
+	writel(0x20, qphy_dp->base.tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+	writel(0x20, qphy_dp->base.tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+
+	qcom_qmp_phy_configure_dp_swing(qphy_dp,
+			QSERDES_V4_TX_TX_DRV_LVL,
+			QSERDES_V4_TX_TX_EMP_POST1_LVL);
+}
+
+static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_dp_phy *qphy_dp)
+{
+	const struct qmp_phy_dp_clks *dp_clks = qphy_dp->dp_clks;
+	const struct phy_configure_opts_dp *dp_opts = &qphy_dp->dp_opts;
+	u32 phy_vco_div, status;
+	unsigned long pixel_freq;
+	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
+	bool reverse;
+
+	writel(0x0f, qphy_dp->base.pcs + QSERDES_V4_DP_PHY_CFG_1);
+
+	reverse = qcom_qmp_phy_configure_dp_mode(qphy_dp);
+
+	writel(0x13, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG1);
+	writel(0xa4, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG2);
+
+	writel(0x05, qphy_dp->base.pcs + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, qphy_dp->base.pcs + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		phy_vco_div = 0x1;
+		pixel_freq = 1620000000UL / 2;
+		break;
+	case 2700:
+		phy_vco_div = 0x1;
+		pixel_freq = 2700000000UL / 2;
+		break;
+	case 5400:
+		phy_vco_div = 0x2;
+		pixel_freq = 5400000000UL / 4;
+		break;
+	case 8100:
+		phy_vco_div = 0x0;
+		pixel_freq = 8100000000UL / 6;
+		break;
+	default:
+		/* Other link rates aren't supported */
+		return -EINVAL;
+	}
+	writel(phy_vco_div, qphy_dp->base.pcs + QSERDES_V4_DP_PHY_VCO_DIV);
+
+	clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
+	clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
+
+	writel(0x01, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+	writel(0x05, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+	writel(0x01, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+	writel(0x09, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+
+	writel(0x20, qphy_dp->base.serdes + QSERDES_V4_COM_RESETSM_CNTRL);
+
+	if (readl_poll_timeout(qphy_dp->base.serdes + QSERDES_V4_COM_C_READY_STATUS,
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	if (readl_poll_timeout(qphy_dp->base.serdes + QSERDES_V4_COM_CMN_STATUS,
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	if (readl_poll_timeout(qphy_dp->base.serdes + QSERDES_V4_COM_CMN_STATUS,
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	writel(0x19, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+
+	if (readl_poll_timeout(qphy_dp->base.pcs + QSERDES_V4_DP_PHY_STATUS,
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	if (readl_poll_timeout(qphy_dp->base.pcs + QSERDES_V4_DP_PHY_STATUS,
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	/*
+	 * At least for 7nm DP PHY this has to be done after enabling link
+	 * clock.
+	 */
+
+	if (dp_opts->lanes == 1) {
+		bias0_en = reverse ? 0x3e : 0x15;
+		bias1_en = reverse ? 0x15 : 0x3e;
+		drvr0_en = reverse ? 0x13 : 0x10;
+		drvr1_en = reverse ? 0x10 : 0x13;
+	} else if (dp_opts->lanes == 2) {
+		bias0_en = reverse ? 0x3f : 0x15;
+		bias1_en = reverse ? 0x15 : 0x3f;
+		drvr0_en = 0x10;
+		drvr1_en = 0x10;
+	} else {
+		bias0_en = 0x3f;
+		bias1_en = 0x3f;
+		drvr0_en = 0x10;
+		drvr1_en = 0x10;
+	}
+
+	writel(drvr0_en, qphy_dp->base.tx + QSERDES_V4_TX_HIGHZ_DRVR_EN);
+	writel(bias0_en, qphy_dp->base.tx + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
+	writel(drvr1_en, qphy_dp->base.tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
+	writel(bias1_en, qphy_dp->base.tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
+
+	writel(0x18, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+	udelay(2000);
+	writel(0x19, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+
+	if (readl_poll_timeout(qphy_dp->base.pcs + QSERDES_V4_DP_PHY_STATUS,
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	writel(0x0a, qphy_dp->base.tx + QSERDES_V4_TX_TX_POL_INV);
+	writel(0x0a, qphy_dp->base.tx2 + QSERDES_V4_TX_TX_POL_INV);
+
+	writel(0x27, qphy_dp->base.tx + QSERDES_V4_TX_TX_DRV_LVL);
+	writel(0x27, qphy_dp->base.tx2 + QSERDES_V4_TX_TX_DRV_LVL);
+
+	writel(0x20, qphy_dp->base.tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+	writel(0x20, qphy_dp->base.tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
+
+	return 0;
+}
+
+/*
+ * We need to calibrate the aux setting here as many times
+ * as the caller tries
+ */
+static int qcom_qmp_v4_dp_phy_calibrate(struct qmp_dp_phy *qphy_dp)
+{
+	static const u8 cfg1_settings[] = { 0x20, 0x13, 0x23, 0x1d };
+	u8 val;
+
+	qphy_dp->dp_aux_cfg++;
+	qphy_dp->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
+	val = cfg1_settings[qphy_dp->dp_aux_cfg];
+
+	writel(val, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG1);
+
+	return 0;
+}
+
 static int qcom_qmp_phy_dp_serdes_init(struct qmp_dp_phy *qphy_dp)
 {
 	const struct qmp_phy_dp_cfg *cfg = qphy_dp->cfg;
@@ -915,6 +1249,9 @@ static const struct of_device_id qcom_qmp_phy_combo_of_match_table[] = {
 	{
 		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
 		.data = &sc7180_usb3dpphy_cfg,
+	}, {
+		.compatible = "qcom,sc8180x-qmp-usb3-dp-phy",
+		.data = &sc8180x_usb3dpphy_cfg,
 	},
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-lib.h b/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
index e01af92c78d9..dfc1fc7d3dba 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
@@ -305,5 +305,6 @@ extern const struct phy_ops qcom_qmp_phy_usb_ops;
 extern const struct dev_pm_ops qcom_qmp_phy_usb_pm_ops;
 
 extern const struct qmp_phy_usb_cfg sc7180_usb3phy_cfg;
+extern const struct qmp_phy_usb_cfg sm8150_usb3phy_cfg;
 
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 2b94470c7a59..46f1ac79c04d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1573,7 +1573,7 @@ static const struct qmp_phy_usb_cfg sdx65_usb3_uniphy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
-static const struct qmp_phy_usb_cfg sm8150_usb3phy_cfg = {
+const struct qmp_phy_usb_cfg sm8150_usb3phy_cfg = {
 	.base = {
 		.type			= PHY_TYPE_USB3,
 		.nlanes			= 1,
@@ -1607,6 +1607,7 @@ static const struct qmp_phy_usb_cfg sm8150_usb3phy_cfg = {
 
 	.has_phy_dp_com_ctrl	= true,
 };
+EXPORT_SYMBOL_GPL(sm8150_usb3phy_cfg);
 
 static const struct qmp_phy_usb_cfg sm8150_usb3_uniphy_cfg = {
 	.base = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index ebe0896c48e6..620008e247bb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -141,15 +141,6 @@ enum qphy_reg_layout {
 	QPHY_LAYOUT_SIZE
 };
 
-static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= 0x00,
-	[QPHY_START_CTRL]		= 0x08,
-	[QPHY_PCS_STATUS]		= 0x174,
-	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d8,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0dc,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x170,
-};
-
 static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x44,
@@ -202,71 +193,6 @@ static const struct qmp_phy_init_tbl sm8150_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
 };
 
-static const struct qmp_phy_init_tbl sm8150_usb3_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_TX, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_RX, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x20),
-};
-
-static const struct qmp_phy_init_tbl sm8150_usb3_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0xbf),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0xbf),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x94),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xdc),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xdc),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0x5c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb3),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VTH_CODE, 0x10),
-};
-
-static const struct qmp_phy_init_tbl sm8150_usb3_pcs_tbl[] = {
-	/* Lock Det settings */
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
-
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
-};
-
 static const struct qmp_phy_init_tbl sm8250_usb3_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_TX, 0x60),
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_RX, 0x60),
@@ -613,11 +539,6 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 	readl(base + offset);
 }
 
-/* list of clocks required by phy */
-static const char * const qmp_v3_phy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "com_aux",
-};
-
 static const char * const qmp_v4_phy_clk_l[] = {
 	"aux", "ref_clk_src", "ref", "com_aux",
 };
@@ -632,88 +553,11 @@ static const char * const msm8996_usb3phy_reset_l[] = {
 	"phy", "common",
 };
 
-static const char * const sc7180_usb3phy_reset_l[] = {
-	"phy",
-};
-
 /* list of regulators */
 static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
-static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
-	.type			= PHY_TYPE_USB3,
-	.nlanes			= 1,
-
-	.serdes_tbl		= sm8150_usb3_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
-	.tx_tbl			= sm8150_usb3_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8150_usb3_tx_tbl),
-	.rx_tbl			= sm8150_usb3_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8150_usb3_rx_tbl),
-	.pcs_tbl		= sm8150_usb3_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8150_usb3_pcs_tbl),
-	.clk_list		= qmp_v4_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
-
-	.start_ctrl		= SERDES_START | PCS_START,
-	.pwrdn_ctrl		= SW_PWRDN,
-	.phy_status		= PHYSTATUS,
-
-
-	.has_pwrdn_delay	= true,
-	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
-	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
-
-	.has_phy_dp_com_ctrl	= true,
-	.is_dual_lane_phy	= true,
-};
-
-static const struct qmp_phy_cfg sc8180x_dpphy_cfg = {
-	.type			= PHY_TYPE_DP,
-	.nlanes			= 1,
-
-	.serdes_tbl		= qmp_v4_dp_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(qmp_v4_dp_serdes_tbl),
-	.tx_tbl			= qmp_v4_dp_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(qmp_v4_dp_tx_tbl),
-
-	.serdes_tbl_rbr		= qmp_v4_dp_serdes_tbl_rbr,
-	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_rbr),
-	.serdes_tbl_hbr		= qmp_v4_dp_serdes_tbl_hbr,
-	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr),
-	.serdes_tbl_hbr2	= qmp_v4_dp_serdes_tbl_hbr2,
-	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr2),
-	.serdes_tbl_hbr3	= qmp_v4_dp_serdes_tbl_hbr3,
-	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr3),
-
-	.clk_list		= qmp_v3_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
-	.reset_list		= sc7180_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(sc7180_usb3phy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v3_usb3phy_regs_layout,
-
-	.has_phy_dp_com_ctrl	= true,
-	.is_dual_lane_phy	= true,
-
-	.dp_aux_init = qcom_qmp_v4_phy_dp_aux_init,
-	.configure_dp_tx = qcom_qmp_v4_phy_configure_dp_tx,
-	.configure_dp_phy = qcom_qmp_v4_phy_configure_dp_phy,
-	.calibrate_dp_phy = qcom_qmp_v4_dp_phy_calibrate,
-};
-
-static const struct qmp_phy_combo_cfg sc8180x_usb3dpphy_cfg = {
-	.usb_cfg		= &sm8150_usb3phy_cfg,
-	.dp_cfg			= &sc8180x_dpphy_cfg,
-};
-
 static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -2158,9 +2002,6 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 
 static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	{
-		.compatible = "qcom,sc8180x-qmp-usb3-dp-phy",
-		/* It's a combo phy */
-	}, {
 		.compatible = "qcom,sm8250-qmp-usb3-dp-phy",
 		/* It's a combo phy */
 	},
@@ -2173,10 +2014,6 @@ static const struct of_device_id qcom_qmp_combo_phy_of_match_table[] = {
 		.compatible = "qcom,sm8250-qmp-usb3-dp-phy",
 		.data = &sm8250_usb3dpphy_cfg,
 	},
-	{
-		.compatible = "qcom,sc8180x-qmp-usb3-dp-phy",
-		.data = &sc8180x_usb3dpphy_cfg,
-	},
 	{ }
 };
 
-- 
2.35.1

