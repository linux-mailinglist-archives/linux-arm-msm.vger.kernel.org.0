Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F74C528377
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 13:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236194AbiEPLpi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 07:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235818AbiEPLpe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 07:45:34 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D76E09B
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 04:45:31 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id c24so15789337lfv.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 04:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nl36P2VPnhBS+6H7O7xBD4A9W+RBumrAKy192GGSp4g=;
        b=Mko+87GyZzMeJirmlxZwum9EZ4u8KGmApjU/BWE0Um/37mRRc108lshJv4LvCn9Xtr
         piceKzHj/EoX1R2qPQSm5ANmFVyDZY/dz26l8fkRhUSNWGLsi89foNf/Q2+s8FcvcaQe
         t8cZ6wRiIh2CxCViO1ffD/foTKiZLnBuygbG44zgavJFCTgGiaBMXLdtwwlPhLNuhEQL
         qJS9u3VZDH1vljFJ8r9bi7SkiU4Kn00QQfiJ2G/zmVN19kRJ7NBGjn49aIPTwhdWXOSn
         b3lnB4lXzR+NhRh5zH7ltd9QPYswbzhHTH10+bevJ7qBpO8waCNPGuYZGoTtLPl7x/pq
         0JAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nl36P2VPnhBS+6H7O7xBD4A9W+RBumrAKy192GGSp4g=;
        b=aUW/Y8vTRaErhp7Os/7aYSsDKd7PkOVJl9wSAxnR1U+RbKVahsmXXwlIrk0CzqTUIq
         gikFEfyA4ZdQymnl2uWIcwZTRtIipfpmLahxx1QsPlWFQD/563uMDYWAhKRAMMqs8ACy
         G1kyq2piY/BE7ZKXcyF03fVQ1C4aby4HKbBS4MSDD/WV1tsH3wsJxwVl9RT/Qh/aGjhn
         xfU4i0DtpbcIyoyyGELISRumpIkZJUZ3kADyU0PCs5YXm8H2tH2X3cTPPNdEU/zaglUy
         isj+4xqt1NzLYBPIO4meRPhmuoc9NO7Fv+EwRO/K89jTUEtdD7XzAkIvsVipuWMDWx4g
         FPaw==
X-Gm-Message-State: AOAM533+P5UUEWyy7kJ2owlz30iFxHGf/ALM8gfqxcTVcfej6jBvz98v
        115GdlGB3snIh8RBemcvhv3ayQ==
X-Google-Smtp-Source: ABdhPJylvHVA42WnyibJgW6y2p4I8g2k9l3T7Ydn0WJYmYHiAz+Yv3Ki7vKrSiFeWYAM2lNKuQH1fw==
X-Received: by 2002:a19:4f05:0:b0:471:fc3b:3ede with SMTP id d5-20020a194f05000000b00471fc3b3edemr13298924lfb.418.1652701529473;
        Mon, 16 May 2022 04:45:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r18-20020ac24d12000000b0047255d2111csm1286079lfi.75.2022.05.16.04.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 04:45:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH 2/5] phy: qcom-qmp: split DP data to DP-specific structures
Date:   Mon, 16 May 2022 14:45:22 +0300
Message-Id: <20220516114525.3596196-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220516114525.3596196-1-dmitry.baryshkov@linaro.org>
References: <20220516114525.3596196-1-dmitry.baryshkov@linaro.org>
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

To clean up generic QMP PHY structures wrap them into DP PHY specific
structures. Move all DP specifics to new structures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 309 +++++++++++++---------
 drivers/phy/qualcomm/phy-qcom-qmp-lib.h   |  43 +--
 drivers/phy/qualcomm/phy-qcom-qmp.c       |  31 ++-
 3 files changed, 231 insertions(+), 152 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cc6f7ede6d74..9ba2fd4daa51 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -27,18 +27,53 @@
 #include "phy-qcom-qmp-lib.h"
 
 struct qmp_phy_dp_clks {
-	struct qmp_phy *qphy;
+	struct qmp_phy_dp *qphy_dp;
 	struct clk_hw dp_link_hw;
 	struct clk_hw dp_pixel_hw;
 };
 
+struct qmp_phy_dp {
+	struct qmp_phy phy;
+
+	unsigned int dp_aux_cfg;
+	struct phy_configure_opts_dp dp_opts;
+	struct qmp_phy_dp_clks *dp_clks;
+};
+
+#define to_qmp_phy_dp(_phy)	container_of((_phy), struct qmp_phy_dp, phy)
+
+/* struct qmp_phy_dp_cfg - DP PHY initialization config */
+struct qmp_phy_dp_cfg {
+	struct qmp_phy_cfg cfg;
+
+	/* Init sequence for DP PHY block link rates */
+	const struct qmp_phy_init_tbl *serdes_tbl_rbr;
+	int serdes_tbl_rbr_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr;
+	int serdes_tbl_hbr_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr2;
+	int serdes_tbl_hbr2_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr3;
+	int serdes_tbl_hbr3_num;
+
+	/* DP PHY callbacks */
+	int (*configure_dp_phy)(struct qmp_phy_dp *qphy_dp);
+	void (*configure_dp_tx)(struct qmp_phy_dp *qphy_dp);
+	int (*calibrate_dp_phy)(struct qmp_phy_dp *qphy_dp);
+	void (*dp_aux_init)(struct qmp_phy_dp *qphy_dp);
+};
+
+#define to_qmp_phy_dp_cfg(cfg)	container_of((cfg), struct qmp_phy_dp_cfg, cfg)
+
 struct qmp_phy_combo_cfg {
 	const struct qmp_phy_cfg *usb_cfg;
-	const struct qmp_phy_cfg *dp_cfg;
+	const struct qmp_phy_dp_cfg *dp_cfg;
 };
 
-static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy)
+static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy_dp *qphy_dp)
 {
+	struct qmp_phy *qphy = &qphy_dp->phy;
+
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
 	       qphy->pcs + QSERDES_DP_PHY_PD_CTL);
@@ -72,7 +107,7 @@ static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy)
 	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG7);
 	writel(0xbb, qphy->pcs + QSERDES_DP_PHY_AUX_CFG8);
 	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG9);
-	qphy->dp_aux_cfg = 0;
+	qphy_dp->dp_aux_cfg = 0;
 
 	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
 	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
@@ -108,10 +143,11 @@ static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
 	{ 0x1f, 0xff, 0xff, 0xff }
 };
 
-static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
+static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy_dp *qphy_dp,
 		unsigned int drv_lvl_reg, unsigned int emp_post_reg)
 {
-	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	struct qmp_phy *qphy = &qphy_dp->phy;
+	const struct phy_configure_opts_dp *dp_opts = &qphy_dp->dp_opts;
 	unsigned int v_level = 0, p_level = 0;
 	u8 voltage_swing_cfg, pre_emphasis_cfg;
 	int i;
@@ -145,12 +181,13 @@ static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
 	return 0;
 }
 
-static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
+static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy_dp *qphy_dp)
 {
-	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	struct qmp_phy *qphy = &qphy_dp->phy;
+	const struct phy_configure_opts_dp *dp_opts = &qphy_dp->dp_opts;
 	u32 bias_en, drvr_en;
 
-	if (qcom_qmp_phy_configure_dp_swing(qphy,
+	if (qcom_qmp_phy_configure_dp_swing(qphy_dp,
 				QSERDES_V3_TX_TX_DRV_LVL,
 				QSERDES_V3_TX_TX_EMP_POST1_LVL) < 0)
 		return;
@@ -199,10 +236,11 @@ static bool qcom_qmp_phy_configure_dp_mode(struct qmp_phy *qphy)
 	return reverse;
 }
 
-static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
+static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy_dp *qphy_dp)
 {
-	const struct qmp_phy_dp_clks *dp_clks = qphy->dp_clks;
-	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	struct qmp_phy *qphy = &qphy_dp->phy;
+	const struct qmp_phy_dp_clks *dp_clks = qphy_dp->dp_clks;
+	const struct phy_configure_opts_dp *dp_opts = &qphy_dp->dp_opts;
 	u32 phy_vco_div, status;
 	unsigned long pixel_freq;
 
@@ -276,22 +314,25 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
  * We need to calibrate the aux setting here as many times
  * as the caller tries
  */
-static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
+static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy_dp *qphy_dp)
 {
+	struct qmp_phy *qphy = &qphy_dp->phy;
 	static const u8 cfg1_settings[] = { 0x13, 0x23, 0x1d };
 	u8 val;
 
-	qphy->dp_aux_cfg++;
-	qphy->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
-	val = cfg1_settings[qphy->dp_aux_cfg];
+	qphy_dp->dp_aux_cfg++;
+	qphy_dp->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
+	val = cfg1_settings[qphy_dp->dp_aux_cfg];
 
 	writel(val, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
 
 	return 0;
 }
 
-static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
+static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy_dp *qphy_dp)
 {
+	struct qmp_phy *qphy = &qphy_dp->phy;
+
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
 	       qphy->pcs + QSERDES_DP_PHY_PD_CTL);
@@ -309,7 +350,7 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
 	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG7);
 	writel(0xb7, qphy->pcs + QSERDES_DP_PHY_AUX_CFG8);
 	writel(0x03, qphy->pcs + QSERDES_DP_PHY_AUX_CFG9);
-	qphy->dp_aux_cfg = 0;
+	qphy_dp->dp_aux_cfg = 0;
 
 	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
 	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
@@ -317,8 +358,10 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
 	       qphy->pcs + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
 }
 
-static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
+static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy_dp *qphy_dp)
 {
+	struct qmp_phy *qphy = &qphy_dp->phy;
+
 	/* Program default values before writing proper values */
 	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
 	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
@@ -326,15 +369,16 @@ static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
 	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
 	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
 
-	qcom_qmp_phy_configure_dp_swing(qphy,
+	qcom_qmp_phy_configure_dp_swing(qphy_dp,
 			QSERDES_V4_TX_TX_DRV_LVL,
 			QSERDES_V4_TX_TX_EMP_POST1_LVL);
 }
 
-static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
+static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy_dp *qphy_dp)
 {
-	const struct qmp_phy_dp_clks *dp_clks = qphy->dp_clks;
-	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	struct qmp_phy *qphy = &qphy_dp->phy;
+	const struct qmp_phy_dp_clks *dp_clks = qphy_dp->dp_clks;
+	const struct phy_configure_opts_dp *dp_opts = &qphy_dp->dp_opts;
 	u32 phy_vco_div, status;
 	unsigned long pixel_freq;
 	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
@@ -474,14 +518,15 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
  * We need to calibrate the aux setting here as many times
  * as the caller tries
  */
-static int qcom_qmp_v4_dp_phy_calibrate(struct qmp_phy *qphy)
+static int qcom_qmp_v4_dp_phy_calibrate(struct qmp_phy_dp *qphy_dp)
 {
+	struct qmp_phy *qphy = &qphy_dp->phy;
 	static const u8 cfg1_settings[] = { 0x20, 0x13, 0x23, 0x1d };
 	u8 val;
 
-	qphy->dp_aux_cfg++;
-	qphy->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
-	val = cfg1_settings[qphy->dp_aux_cfg];
+	qphy_dp->dp_aux_cfg++;
+	qphy_dp->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
+	val = cfg1_settings[qphy_dp->dp_aux_cfg];
 
 	writel(val, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
 
@@ -691,14 +736,27 @@ static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
-static const struct qmp_phy_cfg sc7180_dpphy_cfg = {
-	.type			= PHY_TYPE_DP,
-	.nlanes			= 1,
-
-	.serdes_tbl		= qmp_v3_dp_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_dp_serdes_tbl),
-	.tx_tbl			= qmp_v3_dp_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(qmp_v3_dp_tx_tbl),
+static const struct qmp_phy_dp_cfg sc7180_dpphy_cfg = {
+	.cfg = {
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
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= qmp_v3_usb3phy_regs_layout,
+
+		.has_phy_dp_com_ctrl	= true,
+		.is_dual_lane_phy	= true,
+	},
 
 	.serdes_tbl_rbr		= qmp_v3_dp_serdes_tbl_rbr,
 	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_rbr),
@@ -709,17 +767,6 @@ static const struct qmp_phy_cfg sc7180_dpphy_cfg = {
 	.serdes_tbl_hbr3	= qmp_v3_dp_serdes_tbl_hbr3,
 	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr3),
 
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
 	.dp_aux_init = qcom_qmp_v3_phy_dp_aux_init,
 	.configure_dp_tx = qcom_qmp_v3_phy_configure_dp_tx,
 	.configure_dp_phy = qcom_qmp_v3_phy_configure_dp_phy,
@@ -731,14 +778,27 @@ static const struct qmp_phy_combo_cfg sc7180_usb3dpphy_cfg = {
 	.dp_cfg			= &sc7180_dpphy_cfg,
 };
 
-static const struct qmp_phy_cfg sc8180x_dpphy_cfg = {
-	.type			= PHY_TYPE_DP,
-	.nlanes			= 1,
-
-	.serdes_tbl		= qmp_v4_dp_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(qmp_v4_dp_serdes_tbl),
-	.tx_tbl			= qmp_v4_dp_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(qmp_v4_dp_tx_tbl),
+static const struct qmp_phy_dp_cfg sc8180x_dpphy_cfg = {
+	.cfg = {
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
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= qmp_v3_usb3phy_regs_layout,
+
+		.has_phy_dp_com_ctrl	= true,
+		.is_dual_lane_phy	= true,
+	},
 
 	.serdes_tbl_rbr		= qmp_v4_dp_serdes_tbl_rbr,
 	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_rbr),
@@ -749,17 +809,6 @@ static const struct qmp_phy_cfg sc8180x_dpphy_cfg = {
 	.serdes_tbl_hbr3	= qmp_v4_dp_serdes_tbl_hbr3,
 	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr3),
 
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
 	.dp_aux_init = qcom_qmp_v4_phy_dp_aux_init,
 	.configure_dp_tx = qcom_qmp_v4_phy_configure_dp_tx,
 	.configure_dp_phy = qcom_qmp_v4_phy_configure_dp_phy,
@@ -771,14 +820,27 @@ static const struct qmp_phy_combo_cfg sc8180x_usb3dpphy_cfg = {
 	.dp_cfg			= &sc8180x_dpphy_cfg,
 };
 
-static const struct qmp_phy_cfg sm8250_dpphy_cfg = {
-	.type			= PHY_TYPE_DP,
-	.nlanes			= 1,
-
-	.serdes_tbl		= qmp_v4_dp_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(qmp_v4_dp_serdes_tbl),
-	.tx_tbl			= qmp_v4_dp_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(qmp_v4_dp_tx_tbl),
+static const struct qmp_phy_dp_cfg sm8250_dpphy_cfg = {
+	.cfg = {
+		.type			= PHY_TYPE_DP,
+		.nlanes			= 1,
+
+		.serdes_tbl		= qmp_v4_dp_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(qmp_v4_dp_serdes_tbl),
+		.tx_tbl			= qmp_v4_dp_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(qmp_v4_dp_tx_tbl),
+
+		.clk_list		= qmp_v4_phy_clk_l,
+		.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
+		.reset_list		= msm8996_usb3phy_reset_l,
+		.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= qmp_v4_usb3phy_regs_layout,
+
+		.has_phy_dp_com_ctrl	= true,
+		.is_dual_lane_phy	= true,
+	},
 
 	.serdes_tbl_rbr		= qmp_v4_dp_serdes_tbl_rbr,
 	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_rbr),
@@ -789,17 +851,6 @@ static const struct qmp_phy_cfg sm8250_dpphy_cfg = {
 	.serdes_tbl_hbr3	= qmp_v4_dp_serdes_tbl_hbr3,
 	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v4_dp_serdes_tbl_hbr3),
 
-	.clk_list		= qmp_v4_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
-
-	.has_phy_dp_com_ctrl	= true,
-	.is_dual_lane_phy	= true,
-
 	.dp_aux_init = qcom_qmp_v4_phy_dp_aux_init,
 	.configure_dp_tx = qcom_qmp_v4_phy_configure_dp_tx,
 	.configure_dp_phy = qcom_qmp_v4_phy_configure_dp_phy,
@@ -815,12 +866,14 @@ static int qcom_qmp_phy_dp_configure(struct phy *phy, union phy_configure_opts *
 {
 	const struct phy_configure_opts_dp *dp_opts = &opts->dp;
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_phy_dp *qphy_dp = to_qmp_phy_dp(qphy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	const struct qmp_phy_dp_cfg *dp_cfg = to_qmp_phy_dp_cfg(cfg);
 
-	memcpy(&qphy->dp_opts, dp_opts, sizeof(*dp_opts));
-	if (qphy->dp_opts.set_voltages) {
-		cfg->configure_dp_tx(qphy);
-		qphy->dp_opts.set_voltages = 0;
+	memcpy(&qphy_dp->dp_opts, dp_opts, sizeof(*dp_opts));
+	if (qphy_dp->dp_opts.set_voltages) {
+		dp_cfg->configure_dp_tx(qphy_dp);
+		qphy_dp->dp_opts.set_voltages = 0;
 	}
 
 	return 0;
@@ -829,10 +882,12 @@ static int qcom_qmp_phy_dp_configure(struct phy *phy, union phy_configure_opts *
 static int qcom_qmp_phy_dp_calibrate(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_phy_dp *qphy_dp = to_qmp_phy_dp(qphy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	const struct qmp_phy_dp_cfg *dp_cfg = to_qmp_phy_dp_cfg(cfg);
 
-	if (cfg->calibrate_dp_phy)
-		return cfg->calibrate_dp_phy(qphy);
+	if (dp_cfg->calibrate_dp_phy)
+		return dp_cfg->calibrate_dp_phy(qphy_dp);
 
 	return 0;
 }
@@ -903,12 +958,12 @@ static unsigned long
 qcom_qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	const struct qmp_phy_dp_clks *dp_clks;
-	const struct qmp_phy *qphy;
+	struct qmp_phy_dp *qphy_dp;
 	const struct phy_configure_opts_dp *dp_opts;
 
 	dp_clks = container_of(hw, struct qmp_phy_dp_clks, dp_pixel_hw);
-	qphy = dp_clks->qphy;
-	dp_opts = &qphy->dp_opts;
+	qphy_dp = dp_clks->qphy_dp;
+	dp_opts = &qphy_dp->dp_opts;
 
 	switch (dp_opts->link_rate) {
 	case 1620:
@@ -947,12 +1002,12 @@ static unsigned long
 qcom_qmp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	const struct qmp_phy_dp_clks *dp_clks;
-	const struct qmp_phy *qphy;
+	struct qmp_phy_dp *qphy_dp;
 	const struct phy_configure_opts_dp *dp_opts;
 
 	dp_clks = container_of(hw, struct qmp_phy_dp_clks, dp_link_hw);
-	qphy = dp_clks->qphy;
-	dp_opts = &qphy->dp_opts;
+	qphy_dp = dp_clks->qphy_dp;
+	dp_opts = &qphy_dp->dp_opts;
 
 	switch (dp_opts->link_rate) {
 	case 1620:
@@ -992,7 +1047,7 @@ static void phy_clk_release_provider(void *res)
 	of_clk_del_provider(res);
 }
 
-static int phy_dp_clks_register(struct device *dev, struct qmp_phy *qphy,
+static int phy_dp_clks_register(struct device *dev, struct qmp_phy_dp *qphy_dp,
 				struct device_node *np)
 {
 	struct clk_init_data init = { };
@@ -1004,8 +1059,8 @@ static int phy_dp_clks_register(struct device *dev, struct qmp_phy *qphy,
 	if (!dp_clks)
 		return -ENOMEM;
 
-	dp_clks->qphy = qphy;
-	qphy->dp_clks = dp_clks;
+	dp_clks->qphy_dp = qphy_dp;
+	qphy_dp->dp_clks = dp_clks;
 
 	snprintf(name, sizeof(name), "%s::link_clk", dev_name(dev));
 	init.ops = &qcom_qmp_dp_link_clk_ops;
@@ -1034,34 +1089,36 @@ static int phy_dp_clks_register(struct device *dev, struct qmp_phy *qphy,
 	return devm_add_action_or_reset(dev, phy_clk_release_provider, np);
 }
 
-static int qcom_qmp_phy_dp_serdes_init(struct qmp_phy *qphy)
+static int qcom_qmp_phy_dp_serdes_init(struct qmp_phy_dp *qphy_dp)
 {
+	struct qmp_phy *qphy = &qphy_dp->phy;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	const struct qmp_phy_dp_cfg *dp_cfg = to_qmp_phy_dp_cfg(cfg);
 	void __iomem *serdes = qphy->serdes;
-	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	const struct phy_configure_opts_dp *dp_opts = &qphy_dp->dp_opts;
 
 	qcom_qmp_phy_serdes_init(qphy);
 
 	switch (dp_opts->link_rate) {
 	case 1620:
 		qcom_qmp_phy_configure(serdes, cfg->regs,
-				       cfg->serdes_tbl_rbr,
-				       cfg->serdes_tbl_rbr_num);
+				       dp_cfg->serdes_tbl_rbr,
+				       dp_cfg->serdes_tbl_rbr_num);
 		break;
 	case 2700:
 		qcom_qmp_phy_configure(serdes, cfg->regs,
-				       cfg->serdes_tbl_hbr,
-				       cfg->serdes_tbl_hbr_num);
+				       dp_cfg->serdes_tbl_hbr,
+				       dp_cfg->serdes_tbl_hbr_num);
 		break;
 	case 5400:
 		qcom_qmp_phy_configure(serdes, cfg->regs,
-				       cfg->serdes_tbl_hbr2,
-				       cfg->serdes_tbl_hbr2_num);
+				       dp_cfg->serdes_tbl_hbr2,
+				       dp_cfg->serdes_tbl_hbr2_num);
 		break;
 	case 8100:
 		qcom_qmp_phy_configure(serdes, cfg->regs,
-				       cfg->serdes_tbl_hbr3,
-				       cfg->serdes_tbl_hbr3_num);
+				       dp_cfg->serdes_tbl_hbr3,
+				       dp_cfg->serdes_tbl_hbr3_num);
 		break;
 	default:
 		/* Other link rates aren't supported */
@@ -1075,7 +1132,9 @@ static int qcom_qmp_phy_dp_init(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
+	struct qmp_phy_dp *qphy_dp = to_qmp_phy_dp(qphy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	const struct qmp_phy_dp_cfg *dp_cfg = to_qmp_phy_dp_cfg(cfg);
 	int ret;
 	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
 
@@ -1083,7 +1142,7 @@ static int qcom_qmp_phy_dp_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	cfg->dp_aux_init(qphy);
+	dp_cfg->dp_aux_init(qphy_dp);
 
 	return 0;
 }
@@ -1091,11 +1150,13 @@ static int qcom_qmp_phy_dp_init(struct phy *phy)
 static int qcom_qmp_phy_dp_power_on(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_phy_dp *qphy_dp = to_qmp_phy_dp(qphy);
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	const struct qmp_phy_dp_cfg *dp_cfg = to_qmp_phy_dp_cfg(cfg);
 	int ret;
 
-	qcom_qmp_phy_dp_serdes_init(qphy);
+	qcom_qmp_phy_dp_serdes_init(qphy_dp);
 
 	ret = clk_prepare_enable(qphy->pipe_clk);
 	if (ret) {
@@ -1106,9 +1167,9 @@ static int qcom_qmp_phy_dp_power_on(struct phy *phy)
 	qcom_qmp_phy_lanes_init(phy);
 
 	/* Configure special DP tx tunings */
-	cfg->configure_dp_tx(qphy);
+	dp_cfg->configure_dp_tx(qphy_dp);
 
-	cfg->configure_dp_phy(qphy);
+	dp_cfg->configure_dp_phy(qphy_dp);
 
 	return 0;
 }
@@ -1166,7 +1227,7 @@ static int qcom_qmp_combo_phy_probe(struct platform_device *pdev)
 	void __iomem *dp_serdes = NULL;
 	const struct qmp_phy_combo_cfg *combo_cfg = NULL;
 	const struct qmp_phy_cfg *usb_cfg = NULL;
-	const struct qmp_phy_cfg *dp_cfg = NULL;
+	const struct qmp_phy_dp_cfg *dp_cfg = NULL;
 	int id;
 	int ret;
 
@@ -1206,16 +1267,28 @@ static int qcom_qmp_combo_phy_probe(struct platform_device *pdev)
 	id = 0;
 	for_each_available_child_of_node(dev->of_node, child) {
 		if (of_node_name_eq(child, "dp-phy")) {
-			/* Create per-lane phy */
-			ret = qcom_qmp_phy_create(dev, child, id, dp_serdes, dp_cfg,
-						  &qcom_qmp_phy_dp_ops);
+			struct qmp_phy_dp *qphy_dp;
+
+			qphy_dp = devm_kzalloc(dev, sizeof(*qphy_dp), GFP_KERNEL);
+			if (!qphy_dp)
+				return -ENOMEM;
+
+			ret = qcom_qmp_phy_setup(dev, child, id, dp_serdes, &dp_cfg->cfg,
+						 &qphy_dp->phy);
 			if (ret) {
 				dev_err(dev, "failed to create lane%d phy, %d\n",
 					id, ret);
 				goto err_node_put;
 			}
 
-			ret = phy_dp_clks_register(dev, qmp->phys[id], child);
+			ret = qcom_qmp_phy_register(dev, child, &qphy_dp->phy, &qcom_qmp_phy_dp_ops);
+			if (ret) {
+				dev_err(dev, "failed to register lane%d phy, %d\n",
+					id, ret);
+				goto err_node_put;
+			}
+
+			ret = phy_dp_clks_register(dev, qphy_dp, child);
 			if (ret) {
 				dev_err(qmp->dev,
 					"failed to register DP clock source\n");
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-lib.h b/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
index aa9c3653fd56..0511c7155a5a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
@@ -103,22 +103,6 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_init_tbl *pcs_misc_tbl_sec;
 	int pcs_misc_tbl_num_sec;
 
-	/* Init sequence for DP PHY block link rates */
-	const struct qmp_phy_init_tbl *serdes_tbl_rbr;
-	int serdes_tbl_rbr_num;
-	const struct qmp_phy_init_tbl *serdes_tbl_hbr;
-	int serdes_tbl_hbr_num;
-	const struct qmp_phy_init_tbl *serdes_tbl_hbr2;
-	int serdes_tbl_hbr2_num;
-	const struct qmp_phy_init_tbl *serdes_tbl_hbr3;
-	int serdes_tbl_hbr3_num;
-
-	/* DP PHY callbacks */
-	int (*configure_dp_phy)(struct qmp_phy *qphy);
-	void (*configure_dp_tx)(struct qmp_phy *qphy);
-	int (*calibrate_dp_phy)(struct qmp_phy *qphy);
-	void (*dp_aux_init)(struct qmp_phy *qphy);
-
 	/* clock ids to be requested */
 	const char * const *clk_list;
 	int num_clks;
@@ -193,9 +177,6 @@ struct qmp_phy {
 	struct qcom_qmp *qmp;
 	struct reset_control *lane_rst;
 	enum phy_mode mode;
-	unsigned int dp_aux_cfg;
-	struct phy_configure_opts_dp dp_opts;
-	struct qmp_phy_dp_clks *dp_clks;
 };
 
 /**
@@ -244,9 +225,29 @@ void qcom_qmp_phy_lanes_init(struct phy *phy);
 int qcom_qmp_phy_com_init(struct qmp_phy *qphy);
 int qcom_qmp_phy_com_exit(struct qmp_phy *qphy);
 
-int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
+int qcom_qmp_phy_setup(struct device *dev, struct device_node *np, int id,
+		       void __iomem *serdes, const struct qmp_phy_cfg *cfg,
+		       struct qmp_phy *qphy);
+int qcom_qmp_phy_register(struct device *dev, struct device_node *np,
+			  struct qmp_phy *qphy, const struct phy_ops *ops);
+
+static inline int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 			void __iomem *serdes, const struct qmp_phy_cfg *cfg,
-			const struct phy_ops *ops);
+			const struct phy_ops *ops)
+{
+	struct qmp_phy *qphy;
+	int ret;
+
+	qphy = devm_kzalloc(dev, sizeof(*qphy), GFP_KERNEL);
+	if (!qphy)
+		return -ENOMEM;
+
+	ret = qcom_qmp_phy_setup(dev, np, id, serdes, cfg, qphy);
+	if (ret)
+		return ret;
+
+	return qcom_qmp_phy_register(dev, np, qphy, ops);
+}
 
 int qcom_qmp_phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np);
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 07fc8c4ec8fc..d8c264ee6850 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -4638,20 +4638,16 @@ static void qcom_qmp_reset_control_put(void *data)
 	reset_control_put(data);
 }
 
-int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
-			void __iomem *serdes, const struct qmp_phy_cfg *cfg,
-			const struct phy_ops *ops)
+int qcom_qmp_phy_setup(struct device *dev, struct device_node *np, int id,
+		       void __iomem *serdes, const struct qmp_phy_cfg *cfg,
+		       struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
-	struct phy *generic_phy;
-	struct qmp_phy *qphy;
 	char prop_name[MAX_PROP_NAME];
 	int ret;
 
-	qphy = devm_kzalloc(dev, sizeof(*qphy), GFP_KERNEL);
-	if (!qphy)
-		return -ENOMEM;
-
+	qphy->index = id;
+	qphy->qmp = qmp;
 	qphy->cfg = cfg;
 	qphy->serdes = serdes;
 	/*
@@ -4737,6 +4733,18 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 			return ret;
 	}
 
+	qmp->phys[id] = qphy;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_setup);
+
+int qcom_qmp_phy_register(struct device *dev, struct device_node *np,
+			  struct qmp_phy *qphy, const struct phy_ops *ops)
+{
+	struct phy *generic_phy;
+	int ret;
+
 	generic_phy = devm_phy_create(dev, np, ops);
 	if (IS_ERR(generic_phy)) {
 		ret = PTR_ERR(generic_phy);
@@ -4745,14 +4753,11 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 	}
 
 	qphy->phy = generic_phy;
-	qphy->index = id;
-	qphy->qmp = qmp;
-	qmp->phys[id] = qphy;
 	phy_set_drvdata(generic_phy, qphy);
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(qcom_qmp_phy_create);
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_register);
 
 static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	{
-- 
2.35.1

