Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208D453472A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345464AbiEYX7E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345461AbiEYX7D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:59:03 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3966F9E9F3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:01 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q1so137262ljb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lbSx/lX7n+WRuxVOOYcazkumwvhscsSiUwZqqGcEY3Q=;
        b=knyTyaR6029MNK6BcPY9KC8Wh3YsqX1d1n2Xm1GTqGjW2A/vUlh16WUUm7Le3e5Ofv
         9MzT09LEBjEPMcNPW2ycZfbuIeroMVgXMRRkFAybqx4VER8/RGryBJKJ6hHX8C0KtPl4
         NFtk1RXRlxmKoaPuYeTVszIZiphHi9YJfr+JPALF9ts+47b80scZuQeO9GFjbajeeVCI
         KDDdd5VSC0ET1bM8RpNrgTZ8N5VnzMZtcr7/wm+KtFl8AHs1dwHvjrX8UpghosQai/m1
         xRb1ojcTCMqcdviq7Wiob8zz/Fri+BeXzKHCdY9BKwYb7xWmtpLMoEE30x+1hETZ2tKP
         O3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lbSx/lX7n+WRuxVOOYcazkumwvhscsSiUwZqqGcEY3Q=;
        b=FYSKi/tU9QPOzr9Wa/8EZLKB1g4JJSYGZOb0R6jkIqctHmUW99CbIuq2ORw9OwuctC
         XA6vKUIBUYX0tVPYqLvqZDPbs7o/3CfZ18Vvqs6D3CPKGp2C76JdQ1J6rgVnsD2hVCWP
         AHI1H18CLk5Y4+1N3rz1T595VXhT/SDXJqmnR4uGnYkMLBL9V+IK6an578vgXZ8XFMBJ
         vQc3cJHnjWkaPGo0BbGYmmSiY0TQQFcIm5ZIjgOfdUwfVM3G+oEbinuRjP43u8gftm5F
         jBtbViU4J24p09fWI5C2G1xwHLE20eZTNZn4bjd+AXpD0BoaCV0nONAB4wI2MVrmyWfl
         pYew==
X-Gm-Message-State: AOAM531lXzWkJnsdGkUGVwzKWdlugXSDc9Tvvu3bfFFTeKawtIbOh6pi
        m+IUfaO+zoUpLAEFqZD6hUlHWQ==
X-Google-Smtp-Source: ABdhPJwY24Q3Cu/CJ4AwBPSbjkFF0XTk7VgcRcivx0Upjh2D4/vI225MRPbZb7b5pbfRTUW526FxBA==
X-Received: by 2002:a2e:8081:0:b0:253:ce61:3c66 with SMTP id i1-20020a2e8081000000b00253ce613c66mr20834263ljg.98.1653523140688;
        Wed, 25 May 2022 16:59:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:59:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 17/34] phy: qcom-qmp: move SC8280xp, SM8350 and SM8450 UFS PHY to new QMP driver
Date:   Thu, 26 May 2022 02:58:24 +0300
Message-Id: <20220525235841.852301-18-dmitry.baryshkov@linaro.org>
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

Move support for the UFS PHY driver on SC8280xp, SM8350 and SM8450
platform to new QMP driver.

This commit adds three register names to the QPHY_V5 namespace, as the
driver was using QPHY_V4 names for the v5 QMP PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 175 ++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c     | 173 -----------------------
 drivers/phy/qualcomm/phy-qcom-qmp.h     |   3 +
 3 files changed, 178 insertions(+), 173 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index e4bb17895ed2..b3eb0d5eb1e3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -57,6 +57,12 @@ static const unsigned int qmp_v4_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= QPHY_V4_PCS_UFS_SW_RESET,
 };
 
+static const unsigned int qmp_v5_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= QPHY_V5_PCS_UFS_PHY_START,
+	[QPHY_PCS_READY_STATUS]		= QPHY_V5_PCS_UFS_READY_STATUS,
+	[QPHY_SW_RESET]			= QPHY_V5_PCS_UFS_SW_RESET,
+};
+
 static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
@@ -382,6 +388,106 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
 };
 
+static const struct qmp_phy_init_tbl sm8350_ufsphy_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_EN_SEL, 0xd9),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_INITVAL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE0, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xac),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE1, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE1, 0x65),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE1, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
+
+	/* Rate B */
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x06),
+};
+
+static const struct qmp_phy_init_tbl sm8350_ufsphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_1_DIVIDER_BAND0_1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_2_DIVIDER_BAND0_1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_3_DIVIDER_BAND0_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_4_DIVIDER_BAND0_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xf5),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_TRAN_DRVR_EMP_EN, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl sm8350_ufsphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_LVL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_BAND, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x5a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0xf1),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_TERM_BW, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_MEASURE_TIME, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0x6d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x6d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xed),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0x3c),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0xe0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_LOW, 0xe0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DCC_CTRL1, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl sm8350_ufsphy_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_DEBUG_BUS_CLKSEL, 0x1f),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_MIN_HIBERN8_TIME, 0xff),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_PLL_CNTL, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB, 0x16),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB, 0xd8),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_PWM_GEAR_BAND, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HS_GEAR_BAND, 0x06),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL1, 0x0e),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
+};
+
 /* list of clocks required by phy */
 static const char * const msm8996_ufs_phy_clk_l[] = {
 	"ref",
@@ -391,6 +497,10 @@ static const char * const sdm845_ufs_phy_clk_l[] = {
 	"ref", "ref_aux",
 };
 
+static const char * const sm8450_ufs_phy_clk_l[] = {
+	"qref", "ref", "ref_aux",
+};
+
 /* list of regulators */
 static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
@@ -511,6 +621,62 @@ static const struct qmp_phy_ufs_cfg sm8150_ufsphy_cfg = {
 	},
 };
 
+static const struct qmp_phy_ufs_cfg sm8350_ufsphy_cfg = {
+	.base = {
+		.type			= PHY_TYPE_UFS,
+		.nlanes			= 2,
+
+		.serdes_tbl		= sm8350_ufsphy_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes_tbl),
+		.tx_tbl			= sm8350_ufsphy_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx_tbl),
+		.rx_tbl			= sm8350_ufsphy_rx_tbl,
+		.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx_tbl),
+		.pcs_tbl		= sm8350_ufsphy_pcs_tbl,
+		.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs_tbl),
+		.clk_list		= sdm845_ufs_phy_clk_l,
+		.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= qmp_v5_ufsphy_regs_layout,
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
+static const struct qmp_phy_ufs_cfg sm8450_ufsphy_cfg = {
+	.base = {
+		.type			= PHY_TYPE_UFS,
+		.nlanes			= 2,
+
+		.serdes_tbl		= sm8350_ufsphy_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes_tbl),
+		.tx_tbl			= sm8350_ufsphy_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx_tbl),
+		.rx_tbl			= sm8350_ufsphy_rx_tbl,
+		.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx_tbl),
+		.pcs_tbl		= sm8350_ufsphy_pcs_tbl,
+		.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs_tbl),
+		.clk_list		= sm8450_ufs_phy_clk_l,
+		.num_clks		= ARRAY_SIZE(sm8450_ufs_phy_clk_l),
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= qmp_v5_ufsphy_regs_layout,
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
@@ -722,6 +888,9 @@ static const struct of_device_id qcom_qmp_phy_ufs_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sc8180x-qmp-ufs-phy",
 		.data = &sm8150_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sc8280xp-qmp-ufs-phy",
+		.data = &sm8350_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sdm845-qmp-ufs-phy",
 		.data = &sdm845_ufsphy_cfg,
@@ -737,6 +906,12 @@ static const struct of_device_id qcom_qmp_phy_ufs_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8250-qmp-ufs-phy",
 		.data = &sm8150_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm8350-qmp-ufs-phy",
+		.data = &sm8350_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm8450-qmp-ufs-phy",
+		.data = &sm8450_ufsphy_cfg,
 	},
 	{ },
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 85be692a7c6c..c6e82d2a5fc1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -201,12 +201,6 @@ static const unsigned int qcm2290_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_MISC_TYPEC_CTRL]	= 0x00,
 };
 
-static const unsigned int sm8150_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_START_CTRL]		= QPHY_V4_PCS_UFS_PHY_START,
-	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_UFS_READY_STATUS,
-	[QPHY_SW_RESET]			= QPHY_V4_PCS_UFS_SW_RESET,
-};
-
 static const struct qmp_phy_init_tbl ipq8074_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x1a),
 	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
@@ -1284,106 +1278,6 @@ static const struct qmp_phy_init_tbl sdx65_usb3_uniphy_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_ENABLES, 0x00),
 };
 
-static const struct qmp_phy_init_tbl sm8350_ufsphy_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_EN_SEL, 0xd9),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_SEL, 0x11),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP_EN, 0x42),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_IVCO, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_INITVAL2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE0, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE0, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE0, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE0, 0x19),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xac),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE1, 0x98),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE1, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE1, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE1, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE1, 0x65),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE1, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
-
-	/* Rate B */
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x06),
-};
-
-static const struct qmp_phy_init_tbl sm8350_ufsphy_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_1_DIVIDER_BAND0_1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_2_DIVIDER_BAND0_1, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_3_DIVIDER_BAND0_1, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_4_DIVIDER_BAND0_1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xf5),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_TRAN_DRVR_EMP_EN, 0x0c),
-};
-
-static const struct qmp_phy_init_tbl sm8350_ufsphy_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_LVL, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_BAND, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x5a),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0xf1),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_TERM_BW, 0x1b),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1a),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_MEASURE_TIME, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0x6d),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x6d),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xed),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3b),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0x3c),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0xe0),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x3b),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xb7),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_LOW, 0xe0),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH2, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH3, 0x3b),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xb7),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DCC_CTRL1, 0x0c),
-};
-
-static const struct qmp_phy_init_tbl sm8350_ufsphy_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_DEBUG_BUS_CLKSEL, 0x1f),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_MIN_HIBERN8_TIME, 0xff),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_PLL_CNTL, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB, 0x16),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB, 0xd8),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_PWM_GEAR_BAND, 0xaa),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HS_GEAR_BAND, 0x06),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL1, 0x0e),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
-};
-
 static const struct qmp_phy_init_tbl sm8350_usb3_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_TX, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_RX, 0x00),
@@ -1835,14 +1729,6 @@ static const char * const qmp_v4_sm8250_usbphy_clk_l[] = {
 	"aux", "ref_clk_src", "com_aux"
 };
 
-static const char * const sm8450_ufs_phy_clk_l[] = {
-	"qref", "ref", "ref_aux",
-};
-
-static const char * const sdm845_ufs_phy_clk_l[] = {
-	"ref", "ref_aux",
-};
-
 /* usb3 phy on sdx55 doesn't have com_aux clock */
 static const char * const qmp_v4_sdx55_usbphy_clk_l[] = {
 	"aux", "cfg_ahb", "ref"
@@ -2341,31 +2227,6 @@ static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
-static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
-	.type			= PHY_TYPE_UFS,
-	.nlanes			= 2,
-
-	.serdes_tbl		= sm8350_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes_tbl),
-	.tx_tbl			= sm8350_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx_tbl),
-	.rx_tbl			= sm8350_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx_tbl),
-	.pcs_tbl		= sm8350_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs_tbl),
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
 static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -2427,31 +2288,6 @@ static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
-static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
-	.type			= PHY_TYPE_UFS,
-	.nlanes			= 2,
-
-	.serdes_tbl		= sm8350_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes_tbl),
-	.tx_tbl			= sm8350_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx_tbl),
-	.rx_tbl			= sm8350_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx_tbl),
-	.pcs_tbl		= sm8350_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs_tbl),
-	.clk_list		= sm8450_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sm8450_ufs_phy_clk_l),
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
 static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -4023,9 +3859,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
 		/* It's a combo phy */
-	}, {
-		.compatible = "qcom,sc8280xp-qmp-ufs-phy",
-		.data = &sm8350_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sc8180x-qmp-usb3-phy",
 		.data = &sm8150_usb3phy_cfg,
@@ -4056,9 +3889,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8250-qmp-usb3-uni-phy",
 		.data = &sm8250_usb3_uniphy_cfg,
-	}, {
-		.compatible = "qcom,sm8350-qmp-ufs-phy",
-		.data = &sm8350_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sdx55-qmp-usb3-uni-phy",
 		.data = &sdx55_usb3_uniphy_cfg,
@@ -4071,9 +3901,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8350-qmp-usb3-uni-phy",
 		.data = &sm8350_usb3_uniphy_cfg,
-	}, {
-		.compatible = "qcom,sm8450-qmp-ufs-phy",
-		.data = &sm8450_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sm8450-qmp-usb3-phy",
 		.data = &sm8350_usb3phy_cfg,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 06b2556ed93a..a781a6503381 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -1272,6 +1272,8 @@
 #define QPHY_V5_20_PCS_PCIE_RX_MARGINING_CONFIG3	0x184
 
 /* Only for QMP V5 PHY - UFS PCS registers */
+#define QPHY_V5_PCS_UFS_PHY_START			0x000
+#define QPHY_V5_PCS_UFS_SW_RESET			0x008
 #define QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB	0x00c
 #define QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB	0x010
 #define QPHY_V5_PCS_UFS_PLL_CNTL			0x02c
@@ -1285,6 +1287,7 @@
 #define QPHY_V5_PCS_UFS_RX_SIGDET_CTRL2			0x158
 #define QPHY_V5_PCS_UFS_TX_PWM_GEAR_BAND		0x160
 #define QPHY_V5_PCS_UFS_TX_HS_GEAR_BAND			0x168
+#define QPHY_V5_PCS_UFS_READY_STATUS			0x180
 #define QPHY_V5_PCS_UFS_TX_MID_TERM_CTRL1		0x1d8
 #define QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1		0x1e0
 
-- 
2.35.1

