Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 473AF263B58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 05:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbgIJDXE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 23:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729275AbgIJDWc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 23:22:32 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CBD1C061366
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 17:49:13 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d19so67234pld.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 17:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TOX6UMRuzBifTnULyqGes2Jh8IRSgL39NsoqZ0lz4s4=;
        b=IpfNZYGO0GXpCt9f+Y0tHVhHfSGnTfsjMbZlGQE9vH2018umlnS53kDl4qDpfHyVmT
         F7OZ1u7F4tJM4MgGeIdugMwfnOYTm47/KxIRcYyciQ9wvAtwCUWiEJp1s9hY0Qgav+xG
         NTbUroD6ZFARPgf+trTtZMnUVn2TpaMDNNjCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TOX6UMRuzBifTnULyqGes2Jh8IRSgL39NsoqZ0lz4s4=;
        b=aP1juAy0gRz3mpW5OjkP+l8N62hFjE0Xxac12FKcW4/89cWo7sVRxFi3nvM+1fYSTV
         uyTfU+xItOYyz+hLYpCdDRIw0sVxti4AjqtKtAiyJC2wiMqlw0W0LN3Lhm5bcA6ELIhl
         aPHJRQJjbPoHeOeFC9Nav9OyoeKkBCEqJjBR2B2P35GwS7i7OmbWTXxlIrHjBWPDTRg2
         40gcJHFnd/GA4Aqgoz9lTdc/WrC85l4jeguC7BUiugTR289XwIB/0KXjd4H1ATIvZ1ll
         NrX0Mru2HEPtQxasA4j8xso4NwaxIwviGuh3pW/yV3VnHDiKSQP+Cl0PbMWIvwWBeNjB
         18/Q==
X-Gm-Message-State: AOAM532+p8SsHj5FMIhPsHUz/Uc5sttzJjzG1pufrxs/EnaeXTC/OyDn
        VY4gZ/s2nS4mKKFcX165e19HtA==
X-Google-Smtp-Source: ABdhPJwph+LZoxUeE/XKWL948ly73kwrQz/jBmKi+xTe/LMHqf43aJ3g1CH9TpGK/k75Fes7xI+shw==
X-Received: by 2002:a17:902:b610:: with SMTP id b16mr3356080pls.104.1599698952525;
        Wed, 09 Sep 2020 17:49:12 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id c7sm3899050pfj.100.2020.09.09.17.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 17:49:12 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH v3 07/10] phy: qcom-qmp: Add support for DP in USB3+DP combo phy
Date:   Wed,  9 Sep 2020 17:48:59 -0700
Message-Id: <20200910004902.2252694-8-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200910004902.2252694-1-swboyd@chromium.org>
References: <20200910004902.2252694-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the USB3 + DisplayPort (DP) "combo" phy to the qmp phy
driver. We already have support for the USB3 part of the combo phy, so
most additions are for the DP phy.

Split up the qcom_qmp_phy{enable,disable}() functions into the phy init,
power on, power off, and exit functions that the common phy framework
expects so that the DP phy can add even more phy ops like
phy_calibrate() and phy_configure(). This allows us to initialize the DP
PHY and configure the AUX channel before powering on the PHY at the link
rate that was negotiated during link training.

The general design is as follows:

  1) DP controller calls phy_init() to initialize the PHY and configure
  the dp_com register region.

  2) DP controller calls phy_configure() to tune the link rate and
  voltage swing and pre-emphasis settings.

  3) DP controller calls phy_power_on() to enable the PLL and power on
  the phy.

  4) DP controller calls phy_configure() again to tune the voltage swing
  and pre-emphasis settings determind during link training.

  5) DP controller calls phy_calibrate() some number of times to change
  the aux settings if the aux channel times out during link training.

  6) DP controller calls phy_power_off() if the link rate is to be
  changed and goes back to step 2 to try again at a different link rate.

  5) DP controller calls phy_power_off() and then phy_exit() to power
  down the PHY when it is done.

The DP PHY contains a PLL that is different from the one used for the
USB3 PHY. Instead of a pipe clk there is a link clk and a pixel clk
output from the DP PLL after going through various dividers. Introduce
clk ops for these two clks that just tell the child clks what the
frequency of the pixel and link are. When the phy link rate is
configured we call clk_set_rate() to update the child clks in the
display clk controller on what rate is in use. The clk frequencies
always differ based on the link rate (i.e. 1.6Gb/s 2.7Gb/s, 5.4Gb/s, or
8.1Gb/s corresponding to various transmission modes like HBR1, HBR2 or
HBR3) so we simply store the link rate and use that to calculate the clk
frequencies.

The PLL enable sequence is a little different from other QMP phy PLLs so
we power on the PLL in qcom_qmp_phy_configure_dp_phy() that gets called
from phy_power_on(). This should probably be split out better so that
each phy has a way to run the final PLL/PHY enable sequence.

This code is based on a submission of this phy and PLL in the drm
subsystem.

Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>
Link: https://lore.kernel.org/r/20200609034623.10844-1-tanmay@codeaurora.org
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 790 ++++++++++++++++++++++++----
 drivers/phy/qualcomm/phy-qcom-qmp.h |  80 +++
 2 files changed, 780 insertions(+), 90 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index ecfcc97277f9..dd9574ce2e52 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1762,6 +1762,16 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_init_tbl *pcs_misc_tbl;
 	int pcs_misc_tbl_num;
 
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
 	/* clock ids to be requested */
 	const char * const *clk_list;
 	int num_clks;
@@ -1798,6 +1808,11 @@ struct qmp_phy_cfg {
 	bool no_pcs_sw_reset;
 };
 
+struct qmp_phy_combo_cfg {
+	const struct qmp_phy_cfg *usb_cfg;
+	const struct qmp_phy_cfg *dp_cfg;
+};
+
 /**
  * struct qmp_phy - per-lane phy descriptor
  *
@@ -1831,6 +1846,15 @@ struct qmp_phy {
 	struct qcom_qmp *qmp;
 	struct reset_control *lane_rst;
 	enum phy_mode mode;
+	unsigned int dp_aux_cfg;
+	struct phy_configure_opts_dp dp_opts;
+	struct qmp_phy_dp_clks *dp_clks;
+};
+
+struct qmp_phy_dp_clks {
+	struct qmp_phy *qphy;
+	struct clk_hw dp_link_hw;
+	struct clk_hw dp_pixel_hw;
 };
 
 /**
@@ -2475,6 +2499,299 @@ static void qcom_qmp_phy_configure(void __iomem *base,
 	qcom_qmp_phy_configure_lane(base, regs, tbl, num, 0xff);
 }
 
+static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
+{
+	struct qcom_qmp *qmp = qphy->qmp;
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	void __iomem *serdes = qphy->serdes;
+	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
+	int serdes_tbl_num = cfg->serdes_tbl_num;
+	int ret;
+
+	qcom_qmp_phy_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
+
+	if (cfg->type == PHY_TYPE_DP) {
+		switch (dp_opts->link_rate) {
+		case 1620:
+			qcom_qmp_phy_configure(serdes, cfg->regs,
+					       cfg->serdes_tbl_rbr,
+					       cfg->serdes_tbl_rbr_num);
+			break;
+		case 2700:
+			qcom_qmp_phy_configure(serdes, cfg->regs,
+					       cfg->serdes_tbl_hbr,
+					       cfg->serdes_tbl_hbr_num);
+			break;
+		case 5400:
+			qcom_qmp_phy_configure(serdes, cfg->regs,
+					       cfg->serdes_tbl_hbr2,
+					       cfg->serdes_tbl_hbr2_num);
+			break;
+		case 8100:
+			qcom_qmp_phy_configure(serdes, cfg->regs,
+					       cfg->serdes_tbl_hbr3,
+					       cfg->serdes_tbl_hbr3_num);
+			break;
+		default:
+			/* Other link rates aren't supported */
+			return -EINVAL;
+		}
+	}
+
+
+	if (cfg->has_phy_com_ctrl) {
+		void __iomem *status;
+		unsigned int mask, val;
+
+		qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET], SW_RESET);
+		qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
+			     SERDES_START | PCS_START);
+
+		status = serdes + cfg->regs[QPHY_COM_PCS_READY_STATUS];
+		mask = cfg->mask_com_pcs_ready;
+
+		ret = readl_poll_timeout(status, val, (val & mask), 10,
+					 PHY_INIT_COMPLETE_TIMEOUT);
+		if (ret) {
+			dev_err(qmp->dev,
+				"phy common block init timed-out\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void qcom_qmp_phy_dp_aux_init(struct qmp_phy *qphy)
+{
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+
+	/* Turn on BIAS current for PHY/PLL */
+	writel(QSERDES_V3_COM_BIAS_EN | QSERDES_V3_COM_BIAS_EN_MUX |
+	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL,
+	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
+
+	writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN |
+	       DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN |
+	       DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+
+	writel(QSERDES_V3_COM_BIAS_EN |
+	       QSERDES_V3_COM_BIAS_EN_MUX | QSERDES_V3_COM_CLKBUF_R_EN |
+	       QSERDES_V3_COM_CLKBUF_L_EN | QSERDES_V3_COM_EN_SYSCLK_TX_SEL |
+	       QSERDES_V3_COM_CLKBUF_RX_DRIVE_L,
+	       qphy->serdes + QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN);
+
+	writel(0x00, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG0);
+	writel(0x13, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG1);
+	writel(0x24, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
+	writel(0x00, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG3);
+	writel(0x0a, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG4);
+	writel(0x26, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG5);
+	writel(0x0a, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG6);
+	writel(0x03, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG7);
+	writel(0xbb, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG8);
+	writel(0x03, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG9);
+	qphy->dp_aux_cfg = 0;
+
+	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
+	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
+	       PHY_AUX_REQ_ERR_MASK,
+	       qphy->pcs + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
+}
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
+static void qcom_qmp_phy_configure_dp_tx(struct qmp_phy *qphy)
+{
+	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	unsigned int v_level = 0, p_level = 0;
+	u32 bias_en, drvr_en;
+	u8 voltage_swing_cfg, pre_emphasis_cfg;
+	int i;
+
+	for (i = 0; i < dp_opts->lanes; i++) {
+		v_level = max(v_level, dp_opts->voltage[i]);
+		p_level = max(p_level, dp_opts->pre[i]);
+	}
+
+	if (dp_opts->lanes == 1) {
+		bias_en = 0x3e;
+		drvr_en = 0x13;
+	} else {
+		bias_en = 0x3f;
+		drvr_en = 0x10;
+	}
+
+	voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
+	pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
+
+	/* TODO: Move check to config check */
+	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
+		return;
+
+	/* Enable MUX to use Cursor values from these registers */
+	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
+	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
+
+	writel(voltage_swing_cfg, qphy->tx + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(pre_emphasis_cfg, qphy->tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
+	writel(voltage_swing_cfg, qphy->tx2 + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(pre_emphasis_cfg, qphy->tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
+
+	writel(drvr_en, qphy->tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
+	writel(bias_en, qphy->tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
+	writel(drvr_en, qphy->tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
+	writel(bias_en, qphy->tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
+}
+
+static int qcom_qmp_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	const struct phy_configure_opts_dp *dp_opts = &opts->dp;
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+
+	memcpy(&qphy->dp_opts, dp_opts, sizeof(*dp_opts));
+	if (qphy->dp_opts.set_voltages) {
+		qcom_qmp_phy_configure_dp_tx(qphy);
+		qphy->dp_opts.set_voltages = 0;
+	}
+
+	return 0;
+}
+
+static int qcom_qmp_phy_configure_dp_phy(struct qmp_phy *qphy)
+{
+	const struct qmp_phy_dp_clks *dp_clks = qphy->dp_clks;
+	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
+	u32 val, phy_vco_div, status;
+	unsigned long pixel_freq;
+
+	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN;
+
+	/*
+	if (lane_cnt == 4 || orientation == ORIENTATION_CC2)
+		val |= DP_PHY_PD_CTL_LANE_0_1_PWRDN;
+	if (lane_cnt == 4 || orientation == ORIENTATION_CC1)
+		val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
+	*/
+	/*
+	 * TODO: Assume orientation is CC1 for now and two lanes, need to
+	 * use type-c connector to understand orientation and lanes
+	 */
+	val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
+
+	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+
+	/*
+	if (orientation == ORIENTATION_CC2)
+		writel(0x4c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
+	else
+	*/
+	/* does this do anything? link_clock_sel_mux isn't set (bit 5) */
+	writel(0x5c, qphy->pcs + QSERDES_V3_DP_PHY_MODE);
+
+	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
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
+	writel(phy_vco_div, qphy->pcs + QSERDES_V3_DP_PHY_VCO_DIV);
+
+	clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
+	clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
+
+	writel(0x04, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG2);
+	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x01, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	writel(0x09, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+
+	writel(0x20, qphy->serdes + QSERDES_V3_COM_RESETSM_CNTRL);
+
+	if (readl_poll_timeout(qphy->serdes + QSERDES_V3_COM_C_READY_STATUS,
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+
+	if (readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	writel(0x18, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+	udelay(2000);
+	writel(0x19, qphy->pcs + QSERDES_V3_DP_PHY_CFG);
+
+	return readl_poll_timeout(qphy->pcs + QSERDES_V3_DP_PHY_STATUS,
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
+static int qcom_qmp_dp_phy_calibrate(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	const u8 cfg1_settings[] = { 0x13, 0x23, 0x1d };
+	u8 val;
+
+	qphy->dp_aux_cfg++;
+	qphy->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
+	val = cfg1_settings[qphy->dp_aux_cfg];
+
+	writel(val, qphy->pcs + QSERDES_V3_DP_PHY_AUX_CFG1);
+
+	return 0;
+}
+
 static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -2529,6 +2846,9 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 			     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
 			     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
 
+		/* Default type-c orientation, i.e CC1 */
+		qphy_setbits(dp_com, QPHY_V3_DP_COM_TYPEC_CTRL, 0x02);
+
 		qphy_setbits(dp_com, QPHY_V3_DP_COM_PHY_MODE_CTRL,
 			     USB3_MODE | DP_MODE);
 
@@ -2536,6 +2856,9 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 		qphy_clrbits(dp_com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
 			     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
 			     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+
+		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SWI_CTRL, 0x03);
+		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
 	}
 
 	if (cfg->has_phy_com_ctrl) {
@@ -2551,36 +2874,10 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 					cfg->pwrdn_ctrl);
 	}
 
-	/* Serdes configuration */
-	qcom_qmp_phy_configure(serdes, cfg->regs, cfg->serdes_tbl,
-			       cfg->serdes_tbl_num);
-
-	if (cfg->has_phy_com_ctrl) {
-		void __iomem *status;
-		unsigned int mask, val;
-
-		qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET], SW_RESET);
-		qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
-			     SERDES_START | PCS_START);
-
-		status = serdes + cfg->regs[QPHY_COM_PCS_READY_STATUS];
-		mask = cfg->mask_com_pcs_ready;
-
-		ret = readl_poll_timeout(status, val, (val & mask), 10,
-					 PHY_INIT_COMPLETE_TIMEOUT);
-		if (ret) {
-			dev_err(qmp->dev,
-				"phy common block init timed-out\n");
-			goto err_com_init;
-		}
-	}
-
 	mutex_unlock(&qmp->phy_mutex);
 
 	return 0;
 
-err_com_init:
-	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
 err_rst:
 	while (++i < cfg->num_resets)
 		reset_control_assert(qmp->resets[i]);
@@ -2627,20 +2924,12 @@ static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
 	return 0;
 }
 
-static int qcom_qmp_phy_enable(struct phy *phy)
+static int qcom_qmp_phy_init(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	void __iomem *tx = qphy->tx;
-	void __iomem *rx = qphy->rx;
-	void __iomem *pcs = qphy->pcs;
-	void __iomem *pcs_misc = qphy->pcs_misc;
-	void __iomem *dp_com = qmp->dp_com;
-	void __iomem *status;
-	unsigned int mask, val, ready;
 	int ret;
-
 	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
 
 	if (cfg->no_pcs_sw_reset) {
@@ -2667,13 +2956,34 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 
 		ret = reset_control_assert(qmp->ufs_reset);
 		if (ret)
-			goto err_lane_rst;
+			return ret;
 	}
 
 	ret = qcom_qmp_phy_com_init(qphy);
 	if (ret)
 		return ret;
 
+	if (cfg->type == PHY_TYPE_DP)
+		qcom_qmp_phy_dp_aux_init(qphy);
+
+	return 0;
+}
+
+static int qcom_qmp_phy_power_on(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qcom_qmp *qmp = qphy->qmp;
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	void __iomem *tx = qphy->tx;
+	void __iomem *rx = qphy->rx;
+	void __iomem *pcs = qphy->pcs;
+	void __iomem *pcs_misc = qphy->pcs_misc;
+	void __iomem *status;
+	unsigned int mask, val, ready;
+	int ret;
+
+	qcom_qmp_phy_serdes_init(qphy);
+
 	if (cfg->has_lane_rst) {
 		ret = reset_control_deassert(qphy->lane_rst);
 		if (ret) {
@@ -2697,13 +3007,24 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 		qcom_qmp_phy_configure_lane(qphy->tx2, cfg->regs,
 					    cfg->tx_tbl, cfg->tx_tbl_num, 2);
 
+	/* Configure special DP tx tunings */
+	if (cfg->type == PHY_TYPE_DP)
+		qcom_qmp_phy_configure_dp_tx(qphy);
+
 	qcom_qmp_phy_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
+
 	if (cfg->is_dual_lane_phy)
 		qcom_qmp_phy_configure_lane(qphy->rx2, cfg->regs,
 					    cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
-	qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	/* Configure link rate, swing, etc. */
+	if (cfg->type == PHY_TYPE_DP) {
+		qcom_qmp_phy_configure_dp_phy(qphy);
+	} else {
+		qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	}
+
 	ret = reset_control_deassert(qmp->ufs_reset);
 	if (ret)
 		goto err_lane_rst;
@@ -2721,69 +3042,77 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 	if (cfg->has_pwrdn_delay)
 		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
 
-	/* Pull PHY out of reset state */
-	if (!cfg->no_pcs_sw_reset)
-		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
-
-	if (cfg->has_phy_dp_com_ctrl)
-		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
-
-	/* start SerDes and Phy-Coding-Sublayer */
-	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
-
-	if (cfg->type == PHY_TYPE_UFS) {
-		status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
-		mask = PCS_READY;
-		ready = PCS_READY;
-	} else {
-		status = pcs + cfg->regs[QPHY_PCS_STATUS];
-		mask = PHYSTATUS;
-		ready = 0;
-	}
+	if (cfg->type != PHY_TYPE_DP) {
+		/* Pull PHY out of reset state */
+		if (!cfg->no_pcs_sw_reset)
+			qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+		/* start SerDes and Phy-Coding-Sublayer */
+		qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
+
+		if (cfg->type == PHY_TYPE_UFS) {
+			status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
+			mask = PCS_READY;
+			ready = PCS_READY;
+		} else {
+			status = pcs + cfg->regs[QPHY_PCS_STATUS];
+			mask = PHYSTATUS;
+			ready = 0;
+		}
 
-	ret = readl_poll_timeout(status, val, (val & mask) == ready, 10,
-				 PHY_INIT_COMPLETE_TIMEOUT);
-	if (ret) {
-		dev_err(qmp->dev, "phy initialization timed-out\n");
-		goto err_pcs_ready;
+		ret = readl_poll_timeout(status, val, (val & mask) == ready, 10,
+					 PHY_INIT_COMPLETE_TIMEOUT);
+		if (ret) {
+			dev_err(qmp->dev, "phy initialization timed-out\n");
+			goto err_pcs_ready;
+		}
 	}
 	return 0;
 
 err_pcs_ready:
-	reset_control_assert(qmp->ufs_reset);
 	clk_disable_unprepare(qphy->pipe_clk);
 err_clk_enable:
 	if (cfg->has_lane_rst)
 		reset_control_assert(qphy->lane_rst);
 err_lane_rst:
-	qcom_qmp_phy_com_exit(qphy);
-
 	return ret;
 }
 
-static int qcom_qmp_phy_disable(struct phy *phy)
+static int qcom_qmp_phy_power_off(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 
 	clk_disable_unprepare(qphy->pipe_clk);
 
-	/* PHY reset */
-	if (!cfg->no_pcs_sw_reset)
-		qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	if (cfg->type == PHY_TYPE_DP) {
+		/* Assert DP PHY power down */
+		writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
+	} else {
+		/* PHY reset */
+		if (!cfg->no_pcs_sw_reset)
+			qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
-	/* stop SerDes and Phy-Coding-Sublayer */
-	qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
+		/* stop SerDes and Phy-Coding-Sublayer */
+		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
-	/* Put PHY into POWER DOWN state: active low */
-	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]) {
-		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-			     cfg->pwrdn_ctrl);
-	} else {
-		qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL,
-				cfg->pwrdn_ctrl);
+		/* Put PHY into POWER DOWN state: active low */
+		if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]) {
+			qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+				     cfg->pwrdn_ctrl);
+		} else {
+			qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL,
+					cfg->pwrdn_ctrl);
+		}
 	}
 
+	return 0;
+}
+
+static int qcom_qmp_phy_exit(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+
 	if (cfg->has_lane_rst)
 		reset_control_assert(qphy->lane_rst);
 
@@ -2792,6 +3121,31 @@ static int qcom_qmp_phy_disable(struct phy *phy)
 	return 0;
 }
 
+static int qcom_qmp_phy_enable(struct phy *phy)
+{
+	int ret;
+
+	ret = qcom_qmp_phy_init(phy);
+	if (ret)
+		return ret;
+
+	ret = qcom_qmp_phy_power_on(phy);
+	if (ret)
+		qcom_qmp_phy_exit(phy);
+
+	return ret;
+}
+
+static int qcom_qmp_phy_disable(struct phy *phy)
+{
+	int ret;
+
+	ret = qcom_qmp_phy_power_off(phy);
+	if (ret)
+		return ret;
+	return qcom_qmp_phy_exit(phy);
+}
+
 static int qcom_qmp_phy_set_mode(struct phy *phy,
 				 enum phy_mode mode, int submode)
 {
@@ -2857,7 +3211,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qphy->mode);
 
-	/* Supported only for USB3 PHY */
+	/* Supported only for USB3 PHY and luckily USB3 is the first phy */
 	if (cfg->type != PHY_TYPE_USB3)
 		return 0;
 
@@ -2883,7 +3237,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qphy->mode);
 
-	/* Supported only for USB3 PHY */
+	/* Supported only for USB3 PHY and luckily USB3 is the first phy */
 	if (cfg->type != PHY_TYPE_USB3)
 		return 0;
 
@@ -2967,7 +3321,7 @@ static int qcom_qmp_phy_clk_init(struct device *dev, const struct qmp_phy_cfg *c
 	return devm_clk_bulk_get(dev, num, qmp->clks);
 }
 
-static void phy_pipe_clk_release_provider(void *res)
+static void phy_clk_release_provider(void *res)
 {
 	of_clk_del_provider(res);
 }
@@ -3024,9 +3378,202 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
 	 * Roll a devm action because the clock provider is the child node, but
 	 * the child node is not actually a device.
 	 */
-	ret = devm_add_action(qmp->dev, phy_pipe_clk_release_provider, np);
+	ret = devm_add_action(qmp->dev, phy_clk_release_provider, np);
+	if (ret)
+		phy_clk_release_provider(np);
+
+	return ret;
+}
+
+/*
+ * Display Port PLL driver block diagram for branch clocks
+ *
+ *              +------------------------------+
+ *              |         DP_VCO_CLK           |
+ *              |                              |
+ *              |    +-------------------+     |
+ *              |    |   (DP PLL/VCO)    |     |
+ *              |    +---------+---------+     |
+ *              |              v               |
+ *              |   +----------+-----------+   |
+ *              |   | hsclk_divsel_clk_src |   |
+ *              |   +----------+-----------+   |
+ *              +------------------------------+
+ *                              |
+ *          +---------<---------v------------>----------+
+ *          |                                           |
+ * +--------v----------------+                          |
+ * |    dp_phy_pll_link_clk  |                          |
+ * |     link_clk            |                          |
+ * +--------+----------------+                          |
+ *          |                                           |
+ *          |                                           |
+ *          v                                           v
+ * Input to DISPCC block                                |
+ * for link clk, crypto clk                             |
+ * and interface clock                                  |
+ *                                                      |
+ *                                                      |
+ *      +--------<------------+-----------------+---<---+
+ *      |                     |                 |
+ * +----v---------+  +--------v-----+  +--------v------+
+ * | vco_divided  |  | vco_divided  |  | vco_divided   |
+ * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
+ * |              |  |              |  |               |
+ * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
+ * +-------+------+  +-----+--------+  +--------+------+
+ *         |                 |                  |
+ *         v---->----------v-------------<------v
+ *                         |
+ *              +----------+-----------------+
+ *              |   dp_phy_pll_vco_div_clk   |
+ *              +---------+------------------+
+ *                        |
+ *                        v
+ *              Input to DISPCC block
+ *              for DP pixel clock
+ *
+ */
+static int qcom_qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw,
+						struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 1620000000UL / 2:
+	case 2700000000UL / 2:
+	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long
+qcom_qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	const struct qmp_phy_dp_clks *dp_clks;
+	const struct qmp_phy *qphy;
+	const struct phy_configure_opts_dp *dp_opts;
+
+	dp_clks = container_of(hw, struct qmp_phy_dp_clks, dp_pixel_hw);
+	qphy = dp_clks->qphy;
+	dp_opts = &qphy->dp_opts;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		return 1620000000UL / 2;
+	case 2700:
+		return 2700000000UL / 2;
+	case 5400:
+		return 5400000000UL / 4;
+	case 8100:
+		return 8100000000UL / 6;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops qcom_qmp_dp_pixel_clk_ops = {
+	.determine_rate = qcom_qmp_dp_pixel_clk_determine_rate,
+	.recalc_rate = qcom_qmp_dp_pixel_clk_recalc_rate,
+};
+
+static int qcom_qmp_dp_link_clk_determine_rate(struct clk_hw *hw,
+					       struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 162000000:
+	case 270000000:
+	case 540000000:
+	case 810000000:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long
+qcom_qmp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	const struct qmp_phy_dp_clks *dp_clks;
+	const struct qmp_phy *qphy;
+	const struct phy_configure_opts_dp *dp_opts;
+
+	dp_clks = container_of(hw, struct qmp_phy_dp_clks, dp_link_hw);
+	qphy = dp_clks->qphy;
+	dp_opts = &qphy->dp_opts;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+	case 2700:
+	case 5400:
+	case 8100:
+		return dp_opts->link_rate * 100000;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops qcom_qmp_dp_link_clk_ops = {
+	.determine_rate = qcom_qmp_dp_link_clk_determine_rate,
+	.recalc_rate = qcom_qmp_dp_link_clk_recalc_rate,
+};
+
+static struct clk_hw *
+qcom_qmp_dp_clks_hw_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct qmp_phy_dp_clks *dp_clks = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= 2) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (idx == 0)
+		return &dp_clks->dp_link_hw;
+
+	return &dp_clks->dp_pixel_hw;
+}
+
+static int phy_dp_clks_register(struct qcom_qmp *qmp, struct qmp_phy *qphy,
+				struct device_node *np)
+{
+	struct clk_init_data init = { };
+	struct qmp_phy_dp_clks *dp_clks;
+	int ret;
+
+	dp_clks = devm_kzalloc(qmp->dev, sizeof(*dp_clks), GFP_KERNEL);
+	if (!dp_clks)
+		return -ENOMEM;
+
+	dp_clks->qphy = qphy;
+	qphy->dp_clks = dp_clks;
+
+	init.ops = &qcom_qmp_dp_link_clk_ops;
+	init.name = "qmp_dp_phy_pll_link_clk";
+	dp_clks->dp_link_hw.init = &init;
+	ret = devm_clk_hw_register(qmp->dev, &dp_clks->dp_link_hw);
+	if (ret)
+		return ret;
+
+	init.ops = &qcom_qmp_dp_pixel_clk_ops;
+	init.name = "qmp_dp_phy_pll_vco_div_clk";
+	dp_clks->dp_pixel_hw.init = &init;
+	ret = devm_clk_hw_register(qmp->dev, &dp_clks->dp_pixel_hw);
+	if (ret)
+		return ret;
+
+	ret = of_clk_add_hw_provider(np, qcom_qmp_dp_clks_hw_get, dp_clks);
+	if (ret)
+		return ret;
+
+	/*
+	 * Roll a devm action because the clock provider is the child node, but
+	 * the child node is not actually a device.
+	 */
+	ret = devm_add_action(qmp->dev, phy_clk_release_provider, np);
 	if (ret)
-		phy_pipe_clk_release_provider(np);
+		phy_clk_release_provider(np);
 
 	return ret;
 }
@@ -3038,6 +3585,17 @@ static const struct phy_ops qcom_qmp_phy_gen_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_ops qcom_qmp_phy_dp_ops = {
+	.init		= qcom_qmp_phy_init,
+	.configure	= qcom_qmp_dp_phy_configure,
+	.power_on	= qcom_qmp_phy_power_on,
+	.calibrate	= qcom_qmp_dp_phy_calibrate,
+	.power_off	= qcom_qmp_phy_power_off,
+	.exit		= qcom_qmp_phy_exit,
+	.set_mode	= qcom_qmp_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
 static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
 	.power_on	= qcom_qmp_phy_enable,
 	.power_off	= qcom_qmp_phy_disable,
@@ -3052,7 +3610,7 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct phy *generic_phy;
 	struct qmp_phy *qphy;
-	const struct phy_ops *ops = &qcom_qmp_phy_gen_ops;
+	const struct phy_ops *ops;
 	char prop_name[MAX_PROP_NAME];
 	int ret;
 
@@ -3143,6 +3701,10 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 
 	if (cfg->type == PHY_TYPE_UFS || cfg->type == PHY_TYPE_PCIE)
 		ops = &qcom_qmp_pcie_ufs_ops;
+	else if (cfg->type == PHY_TYPE_DP)
+		ops = &qcom_qmp_phy_dp_ops;
+	else
+		ops = &qcom_qmp_phy_gen_ops;
 
 	generic_phy = devm_phy_create(dev, np, ops);
 	if (IS_ERR(generic_phy)) {
@@ -3226,6 +3788,10 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_qmp_phy_of_match_table);
 
+static const struct of_device_id qcom_qmp_combo_phy_of_match_table[] = {
+	{ }
+};
+
 static const struct dev_pm_ops qcom_qmp_phy_pm_ops = {
 	SET_RUNTIME_PM_OPS(qcom_qmp_phy_runtime_suspend,
 			   qcom_qmp_phy_runtime_resume, NULL)
@@ -3238,8 +3804,13 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 	struct device_node *child;
 	struct phy_provider *phy_provider;
 	void __iomem *serdes;
+	void __iomem *usb_serdes;
+	void __iomem *dp_serdes;
+	const struct qmp_phy_combo_cfg *combo_cfg = NULL;
 	const struct qmp_phy_cfg *cfg;
-	int num, id;
+	const struct qmp_phy_cfg *usb_cfg;
+	const struct qmp_phy_cfg *dp_cfg;
+	int num, id, expected_phys;
 	int ret;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
@@ -3251,21 +3822,45 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 
 	/* Get the specific init parameters of QMP phy */
 	cfg = of_device_get_match_data(dev);
-	if (!cfg)
-		return -EINVAL;
+	if (!cfg) {
+		const struct of_device_id *match;
+
+		match = of_match_device(qcom_qmp_combo_phy_of_match_table, dev);
+		if (!match)
+			return -EINVAL;
+
+		combo_cfg = match->data;
+		if (!combo_cfg)
+			return -EINVAL;
+
+		usb_cfg = combo_cfg->usb_cfg;
+		cfg = usb_cfg; /* Setup clks and regulators */
+	}
 
 	/* per PHY serdes; usually located at base address */
-	serdes = devm_platform_ioremap_resource(pdev, 0);
+	usb_serdes = serdes = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(serdes))
 		return PTR_ERR(serdes);
 
 	/* per PHY dp_com; if PHY has dp_com control block */
-	if (cfg->has_phy_dp_com_ctrl) {
+	if (combo_cfg || cfg->has_phy_dp_com_ctrl) {
 		qmp->dp_com = devm_platform_ioremap_resource(pdev, 1);
 		if (IS_ERR(qmp->dp_com))
 			return PTR_ERR(qmp->dp_com);
 	}
 
+	if (combo_cfg) {
+		/* Only two serdes for combo PHY */
+		dp_serdes = devm_platform_ioremap_resource(pdev, 2);
+		if (IS_ERR(dp_serdes))
+			return PTR_ERR(dp_serdes);
+
+		dp_cfg = combo_cfg->dp_cfg;
+		expected_phys = 2;
+	} else {
+		expected_phys = cfg->nlanes;
+	}
+
 	mutex_init(&qmp->phy_mutex);
 
 	ret = qcom_qmp_phy_clk_init(dev, cfg);
@@ -3286,14 +3881,13 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 
 	num = of_get_available_child_count(dev->of_node);
 	/* do we have a rogue child node ? */
-	if (num > cfg->nlanes)
+	if (num > expected_phys)
 		return -EINVAL;
 
 	qmp->phys = devm_kcalloc(dev, num, sizeof(*qmp->phys), GFP_KERNEL);
 	if (!qmp->phys)
 		return -ENOMEM;
 
-	id = 0;
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 	/*
@@ -3302,7 +3896,16 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
+	id = 0;
 	for_each_available_child_of_node(dev->of_node, child) {
+		if (of_node_name_eq(child, "dp-phy")) {
+			cfg = dp_cfg;
+			serdes = dp_serdes;
+		} else if (of_node_name_eq(child, "usb3-phy")) {
+			cfg = usb_cfg;
+			serdes = usb_serdes;
+		}
+
 		/* Create per-lane phy */
 		ret = qcom_qmp_phy_create(dev, child, id, serdes, cfg);
 		if (ret) {
@@ -3322,6 +3925,13 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 					"failed to register pipe clock source\n");
 				goto err_node_put;
 			}
+		} else if (cfg->type == PHY_TYPE_DP) {
+			ret = phy_dp_clks_register(qmp, qmp->phys[id], child);
+			if (ret) {
+				dev_err(qmp->dev,
+					"failed to register DP clock source\n");
+				goto err_node_put;
+			}
 		}
 		id++;
 	}
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 4277f592684b..5de1f25fc166 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -135,6 +135,9 @@
 #define QPHY_V3_DP_COM_RESET_OVRD_CTRL			0x1c
 
 /* Only for QMP V3 PHY - QSERDES COM registers */
+#define QSERDES_V3_COM_ATB_SEL1				0x000
+#define QSERDES_V3_COM_ATB_SEL2				0x004
+#define QSERDES_V3_COM_FREQ_UPDATE			0x008
 #define QSERDES_V3_COM_BG_TIMER				0x00c
 #define QSERDES_V3_COM_SSC_EN_CENTER			0x010
 #define QSERDES_V3_COM_SSC_ADJ_PER1			0x014
@@ -144,6 +147,13 @@
 #define QSERDES_V3_COM_SSC_STEP_SIZE1			0x024
 #define QSERDES_V3_COM_SSC_STEP_SIZE2			0x028
 #define QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN		0x034
+# define QSERDES_V3_COM_BIAS_EN				0x0001
+# define QSERDES_V3_COM_BIAS_EN_MUX			0x0002
+# define QSERDES_V3_COM_CLKBUF_R_EN			0x0004
+# define QSERDES_V3_COM_CLKBUF_L_EN			0x0008
+# define QSERDES_V3_COM_EN_SYSCLK_TX_SEL		0x0010
+# define QSERDES_V3_COM_CLKBUF_RX_DRIVE_L		0x0020
+# define QSERDES_V3_COM_CLKBUF_RX_DRIVE_R		0x0040
 #define QSERDES_V3_COM_CLK_ENABLE1			0x038
 #define QSERDES_V3_COM_SYS_CLK_CTRL			0x03c
 #define QSERDES_V3_COM_SYSCLK_BUF_ENABLE		0x040
@@ -205,12 +215,36 @@
 #define QSERDES_V3_COM_CMN_MODE				0x184
 
 /* Only for QMP V3 PHY - TX registers */
+#define QSERDES_V3_TX_BIST_MODE_LANENO			0x000
+#define QSERDES_V3_TX_CLKBUF_ENABLE			0x008
+#define QSERDES_V3_TX_TX_EMP_POST1_LVL			0x00c
+# define DP_PHY_TXn_TX_EMP_POST1_LVL_MASK		0x001f
+# define DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN		0x0020
+
+#define QSERDES_V3_TX_TX_DRV_LVL			0x01c
+# define DP_PHY_TXn_TX_DRV_LVL_MASK			0x001f
+# define DP_PHY_TXn_TX_DRV_LVL_MUX_EN			0x0020
+
+#define QSERDES_V3_TX_RESET_TSYNC_EN			0x024
+#define QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN		0x028
+
+#define QSERDES_V3_TX_TX_BAND				0x02c
+#define QSERDES_V3_TX_SLEW_CNTL				0x030
+#define QSERDES_V3_TX_INTERFACE_SELECT			0x034
+#define QSERDES_V3_TX_RES_CODE_LANE_TX			0x03c
+#define QSERDES_V3_TX_RES_CODE_LANE_RX			0x040
 #define QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX		0x044
 #define QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX		0x048
 #define QSERDES_V3_TX_DEBUG_BUS_SEL			0x058
+#define QSERDES_V3_TX_TRANSCEIVER_BIAS_EN		0x05c
 #define QSERDES_V3_TX_HIGHZ_DRVR_EN			0x060
+#define QSERDES_V3_TX_TX_POL_INV			0x064
+#define QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN	0x068
 #define QSERDES_V3_TX_LANE_MODE_1			0x08c
 #define QSERDES_V3_TX_RCV_DETECT_LVL_2			0x0a4
+#define QSERDES_V3_TX_TRAN_DRVR_EMP_EN			0x0c0
+#define QSERDES_V3_TX_TX_INTERFACE_MODE			0x0c4
+#define QSERDES_V3_TX_VMODE_CTRL1			0x0f0
 
 /* Only for QMP V3 PHY - RX registers */
 #define QSERDES_V3_RX_UCDR_FO_GAIN			0x008
@@ -313,6 +347,52 @@
 #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG4		0x5c
 #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG5		0x60
 
+/* Only for QMP V3 PHY - DP PHY registers */
+#define QSERDES_V3_DP_PHY_REVISION_ID0			0x000
+#define QSERDES_V3_DP_PHY_REVISION_ID1			0x004
+#define QSERDES_V3_DP_PHY_REVISION_ID2			0x008
+#define QSERDES_V3_DP_PHY_REVISION_ID3			0x00c
+#define QSERDES_V3_DP_PHY_CFG				0x010
+#define QSERDES_V3_DP_PHY_PD_CTL			0x018
+# define DP_PHY_PD_CTL_PWRDN				0x001
+# define DP_PHY_PD_CTL_PSR_PWRDN			0x002
+# define DP_PHY_PD_CTL_AUX_PWRDN			0x004
+# define DP_PHY_PD_CTL_LANE_0_1_PWRDN			0x008
+# define DP_PHY_PD_CTL_LANE_2_3_PWRDN			0x010
+# define DP_PHY_PD_CTL_PLL_PWRDN			0x020
+# define DP_PHY_PD_CTL_DP_CLAMP_EN			0x040
+#define QSERDES_V3_DP_PHY_MODE				0x01c
+#define QSERDES_V3_DP_PHY_AUX_CFG0			0x020
+#define QSERDES_V3_DP_PHY_AUX_CFG1			0x024
+#define QSERDES_V3_DP_PHY_AUX_CFG2			0x028
+#define QSERDES_V3_DP_PHY_AUX_CFG3			0x02c
+#define QSERDES_V3_DP_PHY_AUX_CFG4			0x030
+#define QSERDES_V3_DP_PHY_AUX_CFG5			0x034
+#define QSERDES_V3_DP_PHY_AUX_CFG6			0x038
+#define QSERDES_V3_DP_PHY_AUX_CFG7			0x03c
+#define QSERDES_V3_DP_PHY_AUX_CFG8			0x040
+#define QSERDES_V3_DP_PHY_AUX_CFG9			0x044
+
+#define QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK		0x048
+# define PHY_AUX_STOP_ERR_MASK				0x01
+# define PHY_AUX_DEC_ERR_MASK 				0x02
+# define PHY_AUX_SYNC_ERR_MASK				0x04
+# define PHY_AUX_ALIGN_ERR_MASK				0x08
+# define PHY_AUX_REQ_ERR_MASK				0x10
+
+#define QSERDES_V3_DP_PHY_AUX_INTERRUPT_CLEAR		0x04c
+#define QSERDES_V3_DP_PHY_AUX_BIST_CFG			0x050
+
+#define QSERDES_V3_DP_PHY_VCO_DIV			0x064
+#define QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL		0x06c
+#define QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL		0x088
+
+#define QSERDES_V3_DP_PHY_SPARE0			0x0ac
+#define DP_PHY_SPARE0_MASK				0x0f
+#define DP_PHY_SPARE0_ORIENTATION_INFO_SHIFT		0x04(0x0004)
+
+#define QSERDES_V3_DP_PHY_STATUS			0x0c0
+
 /* Only for QMP V4 PHY - QSERDES COM registers */
 #define QSERDES_V4_COM_SSC_EN_CENTER			0x010
 #define QSERDES_V4_COM_SSC_PER1				0x01c
-- 
Sent by a computer, using git, on the internet

