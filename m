Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8C9534738
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345470AbiEYX7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345475AbiEYX7S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:59:18 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2299E9C7
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:15 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c19so95861lfv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q9PWKTBsAB/v6X+HjWwt46sVnFwY4t8RVFO/bM7paRE=;
        b=nMmms8PZbsKaCyheKZ1EvT0XCe7/zphN3mQv28nsHQri2ZHxVbdYf+7wMVaTqetVPm
         rnh37v0C5JINrBht8OJ/vf0WY0IsqSXa0S7plBRf5XURxYNYySxUp9ydU9llQPPRP0/+
         1zgsmeD2abrd07xX79CTyir+unsw5uT7bhnhLKCACS5hzQ7HguUO07ViKht0qnFwbh4F
         a/sWXXed60kdOQpH40FCSsKohBRLgMHn4p3uNeV3GAWRpKvxlUpOcunzXfwnJ/Nn75ni
         P/hMLyQPxYrrDdm4BkTb1rE9vc/HFgk8urQt5k8JTr62mCK8jhKNIQBR/4mLVM5O7vi6
         dKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q9PWKTBsAB/v6X+HjWwt46sVnFwY4t8RVFO/bM7paRE=;
        b=ZybtgiGH5RQBtZUhj9rlbjLQsdgj9XkWVXknha8wDV8q9M4qGetTrbKYb9biJpgErM
         QcEW9aWrFmvvDz/m9CPM8k8u2yjEGURtVfEZSzU9268fS6zJhgbCB3Kmt79jgNumnCvK
         e6rwqcxLTK5CXxrAYibyrjoqa/8pP7aqFeBpzbL4jB97LurneLxSyxLm7yOjA9+n2Lrq
         ry91g1X5yYiJEX2cv8V++Tlj/NgRg/cxHcTI7JM0whyTpxLi8/JQn1TWJBdH582FfzY8
         qe07tgdqneH8xFCxqAKNX/czuinImV5hYbYqGwI/gXojSV6T8GValL4iGFYFsR2djVVw
         xWkw==
X-Gm-Message-State: AOAM532+L4zptr0e+I/w+Rv0f45rNlxN3NxNAJsGqy+Px3Knji8AL7uz
        DaKT5j7OFTesQcz2g3JMHtKV9Q==
X-Google-Smtp-Source: ABdhPJzkueRpxLjVIpmhtJyLCdzBGTqbd2LrY2RTuGFNrwyTBGKW0KYjJ2Zzuw9zod0OiWl2V5j0ew==
X-Received: by 2002:a05:6512:259f:b0:477:bbc5:182c with SMTP id bf31-20020a056512259f00b00477bbc5182cmr3014041lfb.265.1653523154736;
        Wed, 25 May 2022 16:59:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:59:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 31/34] phy: qcom-qmp: move SC7180 DP PHY to new QMP driver
Date:   Thu, 26 May 2022 02:58:38 +0300
Message-Id: <20220525235841.852301-32-dmitry.baryshkov@linaro.org>
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

Move support for the DP PHY driver on SC7180 platform to new QMP
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 410 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-lib.h   |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c   |   3 +-
 drivers/phy/qualcomm/phy-qcom-qmp.c       | 430 ----------------------
 4 files changed, 414 insertions(+), 431 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 58323d475d5f..231224bb0355 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -74,6 +74,412 @@ struct qmp_phy_dp_clks {
 	struct clk_hw dp_pixel_hw;
 };
 
+static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_dp_phy *qphy_dp);
+static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_dp_phy *qphy_dp);
+static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_dp_phy *qphy_dp);
+static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_dp_phy *qphy_dp);
+
+static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= 0x00,
+	[QPHY_START_CTRL]		= 0x08,
+	[QPHY_PCS_STATUS]		= 0x174,
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d8,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0dc,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x170,
+};
+
+static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x37),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_ENABLE1, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_BUF_ENABLE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORECLK_DIV_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x06),
+};
+
+static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_rbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x6f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x00),
+};
+
+static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_hbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x00),
+};
+
+static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_hbr2[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x8c),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x00),
+};
+
+static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_hbr3[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x2a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x08),
+};
+
+static const struct qmp_phy_init_tbl qmp_v3_dp_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRANSCEIVER_BIAS_EN, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_VMODE_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_INTERFACE_SELECT, 0x3d),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_CLKBUF_ENABLE, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RESET_TSYNC_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRAN_DRVR_EMP_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_INTERFACE_MODE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_BAND, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_POL_INV, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_DRV_LVL, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_EMP_POST1_LVL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x07),
+};
+
+/* list of clocks required by phy */
+static const char * const qmp_v3_phy_clk_l[] = {
+	"aux", "cfg_ahb", "ref", "com_aux",
+};
+
+/* list of resets */
+static const char * const sc7180_usb3phy_reset_l[] = {
+	"phy",
+};
+
+/* list of regulators */
+static const char * const qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll",
+};
+
+static const struct qmp_phy_dp_cfg sc7180_dpphy_cfg = {
+	.base = {
+		.type			= PHY_TYPE_DP,
+		.nlanes			= 1,
+
+		.serdes_tbl		= qmp_v3_dp_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_dp_serdes_tbl),
+		.tx_tbl			= qmp_v3_dp_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(qmp_v3_dp_tx_tbl),
+
+		.clk_list		= qmp_v3_phy_clk_l,
+		.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
+		.reset_list		= sc7180_usb3phy_reset_l,
+		.num_resets		= ARRAY_SIZE(sc7180_usb3phy_reset_l),
+
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= qmp_v3_usb3phy_regs_layout,
+
+		.is_dual_lane_phy	= true,
+	},
+
+	.serdes_tbl_rbr		= qmp_v3_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v3_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v3_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v3_dp_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr3),
+
+	.dp_aux_init = qcom_qmp_v3_phy_dp_aux_init,
+	.configure_dp_tx = qcom_qmp_v3_phy_configure_dp_tx,
+	.configure_dp_phy = qcom_qmp_v3_phy_configure_dp_phy,
+	.calibrate_dp_phy = qcom_qmp_v3_dp_phy_calibrate,
+};
+
+static const struct qmp_phy_combo_cfg sc7180_usb3dpphy_cfg = {
+	.usb_cfg		= &sc7180_usb3phy_cfg,
+	.dp_cfg			= &sc7180_dpphy_cfg,
+};
+
+static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
+	{ 0x00, 0x0c, 0x15, 0x1a },
+	{ 0x02, 0x0e, 0x16, 0xff },
+	{ 0x02, 0x11, 0xff, 0xff },
+	{ 0x04, 0xff, 0xff, 0xff }
+};
+
+static const u8 qmp_dp_v3_voltage_swing_hbr3_hbr2[4][4] = {
+	{ 0x02, 0x12, 0x16, 0x1a },
+	{ 0x09, 0x19, 0x1f, 0xff },
+	{ 0x10, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+static const u8 qmp_dp_v3_pre_emphasis_hbr_rbr[4][4] = {
+	{ 0x00, 0x0c, 0x14, 0x19 },
+	{ 0x00, 0x0b, 0x12, 0xff },
+	{ 0x00, 0x0b, 0xff, 0xff },
+	{ 0x04, 0xff, 0xff, 0xff }
+};
+
+static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
+	{ 0x08, 0x0f, 0x16, 0x1f },
+	{ 0x11, 0x1e, 0x1f, 0xff },
+	{ 0x19, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+static int qcom_qmp_phy_configure_dp_swing(struct qmp_dp_phy *qphy_dp,
+		unsigned int drv_lvl_reg, unsigned int emp_post_reg)
+{
+	const struct phy_configure_opts_dp *dp_opts = &qphy_dp->dp_opts;
+	unsigned int v_level = 0, p_level = 0;
+	u8 voltage_swing_cfg, pre_emphasis_cfg;
+	int i;
+
+	for (i = 0; i < dp_opts->lanes; i++) {
+		v_level = max(v_level, dp_opts->voltage[i]);
+		p_level = max(p_level, dp_opts->pre[i]);
+	}
+
+	if (dp_opts->link_rate <= 2700) {
+		voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
+		pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
+	} else {
+		voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr3_hbr2[v_level][p_level];
+		pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr3_hbr2[v_level][p_level];
+	}
+
+	/* TODO: Move check to config check */
+	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
+		return -EINVAL;
+
+	/* Enable MUX to use Cursor values from these registers */
+	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
+	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
+
+	writel(voltage_swing_cfg, qphy_dp->base.tx + drv_lvl_reg);
+	writel(pre_emphasis_cfg, qphy_dp->base.tx + emp_post_reg);
+	writel(voltage_swing_cfg, qphy_dp->base.tx2 + drv_lvl_reg);
+	writel(pre_emphasis_cfg, qphy_dp->base.tx2 + emp_post_reg);
+
+	return 0;
+}
+
+static bool qcom_qmp_phy_configure_dp_mode(struct qmp_dp_phy *qphy_dp)
+{
+	u32 val;
+	bool reverse = false;
+
+	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN;
+
+	/*
+	 * TODO: Assume orientation is CC1 for now and two lanes, need to
+	 * use type-c connector to understand orientation and lanes.
+	 *
+	 * Otherwise val changes to be like below if this code understood
+	 * the orientation of the type-c cable.
+	 *
+	 * if (lane_cnt == 4 || orientation == ORIENTATION_CC2)
+	 *	val |= DP_PHY_PD_CTL_LANE_0_1_PWRDN;
+	 * if (lane_cnt == 4 || orientation == ORIENTATION_CC1)
+	 *	val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
+	 * if (orientation == ORIENTATION_CC2)
+	 *	writel(0x4c, qphy_dp->base.pcs + QSERDES_V3_DP_PHY_MODE);
+	 */
+	val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
+	writel(val, qphy_dp->base.pcs + QSERDES_DP_PHY_PD_CTL);
+
+	writel(0x5c, qphy_dp->base.pcs + QSERDES_DP_PHY_MODE);
+
+	return reverse;
+}
+
+static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_dp_phy *qphy_dp)
+{
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       qphy_dp->base.pcs + QSERDES_DP_PHY_PD_CTL);
+
+	/* Turn on BIAS current for PHY/PLL */
+	writel(QSERDES_V3_COM_BIAS_EN | QSERDES_V3_COM_BIAS_EN_MUX |
+	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL,
+	       qphy_dp->base.serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
+
+	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy_dp->base.pcs + QSERDES_DP_PHY_PD_CTL);
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN |
+	       DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN |
+	       DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       qphy_dp->base.pcs + QSERDES_DP_PHY_PD_CTL);
+
+	writel(QSERDES_V3_COM_BIAS_EN |
+	       QSERDES_V3_COM_BIAS_EN_MUX | QSERDES_V3_COM_CLKBUF_R_EN |
+	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL |
+	       QSERDES_V3_COM_CLKBUF_RX_DRIVE_L,
+	       qphy_dp->base.serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
+
+	writel(0x00, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG0);
+	writel(0x13, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG1);
+	writel(0x24, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG2);
+	writel(0x00, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG3);
+	writel(0x0a, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG4);
+	writel(0x26, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG5);
+	writel(0x0a, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG6);
+	writel(0x03, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG7);
+	writel(0xbb, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG8);
+	writel(0x03, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG9);
+	qphy_dp->dp_aux_cfg = 0;
+
+	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
+	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
+	       PHY_AUX_REQ_ERR_MASK,
+	       qphy_dp->base.pcs + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
+}
+
+static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_dp_phy *qphy_dp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &qphy_dp->dp_opts;
+	u32 bias_en, drvr_en;
+
+	if (qcom_qmp_phy_configure_dp_swing(qphy_dp,
+				QSERDES_V3_TX_TX_DRV_LVL,
+				QSERDES_V3_TX_TX_EMP_POST1_LVL) < 0)
+		return;
+
+	if (dp_opts->lanes == 1) {
+		bias_en = 0x3e;
+		drvr_en = 0x13;
+	} else {
+		bias_en = 0x3f;
+		drvr_en = 0x10;
+	}
+
+	writel(drvr_en, qphy_dp->base.tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
+	writel(bias_en, qphy_dp->base.tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
+	writel(drvr_en, qphy_dp->base.tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
+	writel(bias_en, qphy_dp->base.tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
+}
+
+static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_dp_phy *qphy_dp)
+{
+	const struct qmp_phy_dp_clks *dp_clks = qphy_dp->dp_clks;
+	const struct phy_configure_opts_dp *dp_opts = &qphy_dp->dp_opts;
+	u32 phy_vco_div, status;
+	unsigned long pixel_freq;
+
+	qcom_qmp_phy_configure_dp_mode(qphy_dp);
+
+	writel(0x05, qphy_dp->base.pcs + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, qphy_dp->base.pcs + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
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
+	writel(phy_vco_div, qphy_dp->base.pcs + QSERDES_V3_DP_PHY_VCO_DIV);
+
+	clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
+	clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
+
+	writel(0x04, qphy_dp->base.pcs + QSERDES_DP_PHY_AUX_CFG2);
+	writel(0x01, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+	writel(0x05, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+	writel(0x01, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+	writel(0x09, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+
+	writel(0x20, qphy_dp->base.serdes + QSERDES_V3_COM_RESETSM_CNTRL);
+
+	if (readl_poll_timeout(qphy_dp->base.serdes + QSERDES_V3_COM_C_READY_STATUS,
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	writel(0x19, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+
+	if (readl_poll_timeout(qphy_dp->base.pcs + QSERDES_V3_DP_PHY_STATUS,
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	writel(0x18, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+	udelay(2000);
+	writel(0x19, qphy_dp->base.pcs + QSERDES_DP_PHY_CFG);
+
+	return readl_poll_timeout(qphy_dp->base.pcs + QSERDES_V3_DP_PHY_STATUS,
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000);
+}
+
+/*
+ * We need to calibrate the aux setting here as many times
+ * as the caller tries
+ */
+static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_dp_phy *qphy_dp)
+{
+	static const u8 cfg1_settings[] = { 0x13, 0x23, 0x1d };
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
@@ -506,6 +912,10 @@ int qcom_qmp_phy_dp_create(struct device *dev, struct device_node *np, int id,
 }
 
 static const struct of_device_id qcom_qmp_phy_combo_of_match_table[] = {
+	{
+		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
+		.data = &sc7180_usb3dpphy_cfg,
+	},
 	{ }
 };
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-lib.h b/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
index 5a68b117dbbe..e01af92c78d9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
@@ -304,4 +304,6 @@ int qcom_qmp_phy_usb_create(struct device *dev, struct device_node *np, int id,
 extern const struct phy_ops qcom_qmp_phy_usb_ops;
 extern const struct dev_pm_ops qcom_qmp_phy_usb_pm_ops;
 
+extern const struct qmp_phy_usb_cfg sc7180_usb3phy_cfg;
+
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 84ffc2aaf349..2b94470c7a59 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1475,7 +1475,7 @@ static const struct qmp_phy_usb_cfg qmp_v3_usb3phy_cfg = {
 	.has_phy_dp_com_ctrl	= true,
 };
 
-static const struct qmp_phy_usb_cfg sc7180_usb3phy_cfg = {
+const struct qmp_phy_usb_cfg sc7180_usb3phy_cfg = {
 	.base = {
 		.type			= PHY_TYPE_USB3,
 		.nlanes			= 1,
@@ -1509,6 +1509,7 @@ static const struct qmp_phy_usb_cfg sc7180_usb3phy_cfg = {
 
 	.has_phy_dp_com_ctrl	= true,
 };
+EXPORT_SYMBOL_GPL(sc7180_usb3phy_cfg);
 
 static const struct qmp_phy_usb_cfg sdx55_usb3_uniphy_cfg = {
 	.base = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index dfd5fab55de4..ebe0896c48e6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -159,194 +159,6 @@ static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = 0x314,
 };
 
-static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_RESETSM_CNTRL2, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START1_MODE0, 0xab),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0xea),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE2_MODE0, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE1_MODE0, 0xc9),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORECLK_DIV_MODE0, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP3_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x34),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x15),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_CFG, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_BUF_ENABLE, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_EN_CENTER, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_PER1, 0x31),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_PER2, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_ADJ_PER1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_ADJ_PER2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_STEP_SIZE1, 0x85),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_STEP_SIZE2, 0x07),
-};
-
-static const struct qmp_phy_init_tbl qmp_v3_usb3_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_HIGHZ_DRVR_EN, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x06),
-};
-
-static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x37),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_ENABLE1, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_BUF_ENABLE, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START1_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP3_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BG_TIMER, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORECLK_DIV_MODE0, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_CTRL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x1f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x06),
-};
-
-static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_rbr[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x69),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x6f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x00),
-};
-
-static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_hbr[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x69),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x00),
-};
-
-static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_hbr2[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x8c),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x1f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x1c),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x00),
-};
-
-static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_hbr3[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x69),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x2f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x2a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x08),
-};
-
-static const struct qmp_phy_init_tbl qmp_v3_dp_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRANSCEIVER_BIAS_EN, 0x1a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_VMODE_CTRL1, 0x40),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_INTERFACE_SELECT, 0x3d),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_CLKBUF_ENABLE, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RESET_TSYNC_EN, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRAN_DRVR_EMP_EN, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_INTERFACE_MODE, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_BAND, 0x4),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_POL_INV, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_DRV_LVL, 0x38),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_EMP_POST1_LVL, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x07),
-};
-
-static const struct qmp_phy_init_tbl qmp_v3_usb3_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4e),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL4, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_CNTRL, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x75),
-};
-
-static const struct qmp_phy_init_tbl qmp_v3_usb3_pcs_tbl[] = {
-	/* FLL settings */
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNTRL2, 0x83),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNT_VAL_L, 0x09),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNT_VAL_H_TOL, 0xa2),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_MAN_CODE, 0x40),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNTRL1, 0x02),
-
-	/* Lock Det settings */
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LOCK_DETECT_CONFIG1, 0xd1),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LOCK_DETECT_CONFIG2, 0x1f),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LOCK_DETECT_CONFIG3, 0x47),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_POWER_STATE_CONFIG2, 0x1b),
-
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0xba),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V0, 0x9f),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V1, 0x9f),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V2, 0xb7),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V3, 0x4e),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V4, 0x65),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_LS, 0x6b),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V0, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0, 0x0d),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V1, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V1, 0x0d),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V2, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V2, 0x0d),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V3, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V3, 0x1d),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V4, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V4, 0x0d),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_LS, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_LS, 0x0d),
-
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RATE_SLEW_CNTRL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x04),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TSYNC_RSYNC_TIME, 0x44),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x04),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_U3_L, 0x40),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_U3_H, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_WAIT_TIME, 0x75),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LFPS_TX_ECSTART_EQTLOCK, 0x86),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
-};
-
 static const struct qmp_phy_init_tbl sm8150_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
@@ -772,11 +584,6 @@ struct qcom_qmp {
 	struct reset_control *ufs_reset;
 };
 
-static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy);
-static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy);
-static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy);
-static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy);
-
 static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy);
 static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy);
 static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy);
@@ -834,78 +641,6 @@ static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
-static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
-	.type			= PHY_TYPE_USB3,
-	.nlanes			= 1,
-
-	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
-	.tx_tbl			= qmp_v3_usb3_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_tx_tbl),
-	.rx_tbl			= qmp_v3_usb3_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_rx_tbl),
-	.pcs_tbl		= qmp_v3_usb3_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_pcs_tbl),
-	.clk_list		= qmp_v3_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
-	.reset_list		= sc7180_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(sc7180_usb3phy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v3_usb3phy_regs_layout,
-
-	.start_ctrl		= SERDES_START | PCS_START,
-	.pwrdn_ctrl		= SW_PWRDN,
-	.phy_status		= PHYSTATUS,
-
-	.has_pwrdn_delay	= true,
-	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
-	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
-
-	.has_phy_dp_com_ctrl	= true,
-	.is_dual_lane_phy	= true,
-};
-
-static const struct qmp_phy_cfg sc7180_dpphy_cfg = {
-	.type			= PHY_TYPE_DP,
-	.nlanes			= 1,
-
-	.serdes_tbl		= qmp_v3_dp_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_dp_serdes_tbl),
-	.tx_tbl			= qmp_v3_dp_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(qmp_v3_dp_tx_tbl),
-
-	.serdes_tbl_rbr		= qmp_v3_dp_serdes_tbl_rbr,
-	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_rbr),
-	.serdes_tbl_hbr		= qmp_v3_dp_serdes_tbl_hbr,
-	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr),
-	.serdes_tbl_hbr2	= qmp_v3_dp_serdes_tbl_hbr2,
-	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr2),
-	.serdes_tbl_hbr3	= qmp_v3_dp_serdes_tbl_hbr3,
-	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr3),
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
-	.dp_aux_init = qcom_qmp_v3_phy_dp_aux_init,
-	.configure_dp_tx = qcom_qmp_v3_phy_configure_dp_tx,
-	.configure_dp_phy = qcom_qmp_v3_phy_configure_dp_phy,
-	.calibrate_dp_phy = qcom_qmp_v3_dp_phy_calibrate,
-};
-
-static const struct qmp_phy_combo_cfg sc7180_usb3dpphy_cfg = {
-	.usb_cfg		= &sc7180_usb3phy_cfg,
-	.dp_cfg			= &sc7180_dpphy_cfg,
-};
-
 static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -1149,49 +884,6 @@ static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
 	return 0;
 }
 
-static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy)
-{
-	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
-	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
-	       qphy->pcs + QSERDES_DP_PHY_PD_CTL);
-
-	/* Turn on BIAS current for PHY/PLL */
-	writel(QSERDES_V3_COM_BIAS_EN | QSERDES_V3_COM_BIAS_EN_MUX |
-	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL,
-	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
-
-	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
-
-	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
-	       DP_PHY_PD_CTL_LANE_0_1_PWRDN |
-	       DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN |
-	       DP_PHY_PD_CTL_DP_CLAMP_EN,
-	       qphy->pcs + QSERDES_DP_PHY_PD_CTL);
-
-	writel(QSERDES_V3_COM_BIAS_EN |
-	       QSERDES_V3_COM_BIAS_EN_MUX | QSERDES_V3_COM_CLKBUF_R_EN |
-	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL |
-	       QSERDES_V3_COM_CLKBUF_RX_DRIVE_L,
-	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
-
-	writel(0x00, qphy->pcs + QSERDES_DP_PHY_AUX_CFG0);
-	writel(0x13, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
-	writel(0x24, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
-	writel(0x00, qphy->pcs + QSERDES_DP_PHY_AUX_CFG3);
-	writel(0x0a, qphy->pcs + QSERDES_DP_PHY_AUX_CFG4);
-	writel(0x26, qphy->pcs + QSERDES_DP_PHY_AUX_CFG5);
-	writel(0x0a, qphy->pcs + QSERDES_DP_PHY_AUX_CFG6);
-	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG7);
-	writel(0xbb, qphy->pcs + QSERDES_DP_PHY_AUX_CFG8);
-	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG9);
-	qphy->dp_aux_cfg = 0;
-
-	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
-	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
-	       PHY_AUX_REQ_ERR_MASK,
-	       qphy->pcs + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
-}
-
 static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
 	{ 0x00, 0x0c, 0x15, 0x1a },
 	{ 0x02, 0x0e, 0x16, 0xff },
@@ -1257,30 +949,6 @@ static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
 	return 0;
 }
 
-static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
-{
-	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
-	u32 bias_en, drvr_en;
-
-	if (qcom_qmp_phy_configure_dp_swing(qphy,
-				QSERDES_V3_TX_TX_DRV_LVL,
-				QSERDES_V3_TX_TX_EMP_POST1_LVL) < 0)
-		return;
-
-	if (dp_opts->lanes == 1) {
-		bias_en = 0x3e;
-		drvr_en = 0x13;
-	} else {
-		bias_en = 0x3f;
-		drvr_en = 0x10;
-	}
-
-	writel(drvr_en, qphy->tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
-	writel(bias_en, qphy->tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
-	writel(drvr_en, qphy->tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
-	writel(bias_en, qphy->tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
-}
-
 static bool qcom_qmp_phy_configure_dp_mode(struct qmp_phy *qphy)
 {
 	u32 val;
@@ -1311,97 +979,6 @@ static bool qcom_qmp_phy_configure_dp_mode(struct qmp_phy *qphy)
 	return reverse;
 }
 
-static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
-{
-	const struct qmp_phy_dp_clks *dp_clks = qphy->dp_clks;
-	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
-	u32 phy_vco_div, status;
-	unsigned long pixel_freq;
-
-	qcom_qmp_phy_configure_dp_mode(qphy);
-
-	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
-	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
-
-	switch (dp_opts->link_rate) {
-	case 1620:
-		phy_vco_div = 0x1;
-		pixel_freq = 1620000000UL / 2;
-		break;
-	case 2700:
-		phy_vco_div = 0x1;
-		pixel_freq = 2700000000UL / 2;
-		break;
-	case 5400:
-		phy_vco_div = 0x2;
-		pixel_freq = 5400000000UL / 4;
-		break;
-	case 8100:
-		phy_vco_div = 0x0;
-		pixel_freq = 8100000000UL / 6;
-		break;
-	default:
-		/* Other link rates aren't supported */
-		return -EINVAL;
-	}
-	writel(phy_vco_div, qphy->pcs + QSERDES_V3_DP_PHY_VCO_DIV);
-
-	clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
-	clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
-
-	writel(0x04, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
-	writel(0x01, qphy->pcs + QSERDES_DP_PHY_CFG);
-	writel(0x05, qphy->pcs + QSERDES_DP_PHY_CFG);
-	writel(0x01, qphy->pcs + QSERDES_DP_PHY_CFG);
-	writel(0x09, qphy->pcs + QSERDES_DP_PHY_CFG);
-
-	writel(0x20, qphy->serdes + QSERDES_V3_COM_RESETSM_CNTRL);
-
-	if (readl_poll_timeout(qphy->serdes + QSERDES_V3_COM_C_READY_STATUS,
-			status,
-			((status & BIT(0)) > 0),
-			500,
-			10000))
-		return -ETIMEDOUT;
-
-	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
-
-	if (readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
-			status,
-			((status & BIT(1)) > 0),
-			500,
-			10000))
-		return -ETIMEDOUT;
-
-	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
-	udelay(2000);
-	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
-
-	return readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
-			status,
-			((status & BIT(1)) > 0),
-			500,
-			10000);
-}
-
-/*
- * We need to calibrate the aux setting here as many times
- * as the caller tries
- */
-static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
-{
-	static const u8 cfg1_settings[] = { 0x13, 0x23, 0x1d };
-	u8 val;
-
-	qphy->dp_aux_cfg++;
-	qphy->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
-	val = cfg1_settings[qphy->dp_aux_cfg];
-
-	writel(val, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
-
-	return 0;
-}
-
 static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
 {
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
@@ -2581,9 +2158,6 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 
 static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	{
-		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
-		/* It's a combo phy */
-	}, {
 		.compatible = "qcom,sc8180x-qmp-usb3-dp-phy",
 		/* It's a combo phy */
 	}, {
@@ -2595,10 +2169,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 MODULE_DEVICE_TABLE(of, qcom_qmp_phy_of_match_table);
 
 static const struct of_device_id qcom_qmp_combo_phy_of_match_table[] = {
-	{
-		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
-		.data = &sc7180_usb3dpphy_cfg,
-	},
 	{
 		.compatible = "qcom,sm8250-qmp-usb3-dp-phy",
 		.data = &sm8250_usb3dpphy_cfg,
-- 
2.35.1

