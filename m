Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E75A125B6FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 01:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgIBXDI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 19:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbgIBXC2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 19:02:28 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4015C061246
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2020 16:02:27 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q1so508318pjd.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rcJ4deSvlrJQIKOH710UOunS2XnN1fOtpNWbtcEqfMI=;
        b=HYa/yT5hzlVeHJX8V2r73e3V6yDLuQGunbIiGuH3g2nyEkSBcXN3o5VoLNs+ruMJtw
         jZQX1FXZGkanICQvzi05fG4rwY1GMSThtbPNCqq2rZ8SGS8uOv8qBFiIWO93UXuL0a4/
         JaXHfxbKQW/aKclpzVIRGLpZcFvhZmE17hDlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rcJ4deSvlrJQIKOH710UOunS2XnN1fOtpNWbtcEqfMI=;
        b=jMJ8Kee2EFKR/3c+Rp9LHdx7ESL3E1MMd/daxO3BC54usj2f3xTfZ8F1Dwc3r3xfI7
         Ia77NWf32ix33VcvEwqwynyzNV2nh9lryxP1wyE81H/P1l7GAPhSTyp+vOGzTnmFkwQN
         hZrQzoh+c/8pnzFlelcCcUTTdZds11MvoDJ+tgXH184Ek77pWYH38UkNb/p/1++lSn9K
         6iVgwDIEPNk5Sn6j7LT01IgEofJv9t2EZptEH7LBPYOVudbtOWppLASpZkb10Jowym+d
         OJmAgtsukK4K0X2Rnb2leYPANmd/8FiU08UO2sQzYV6vgyVofLtaOCR6zESntK1CX06f
         m6wA==
X-Gm-Message-State: AOAM531bqYrAIJu2MjZTVZQEan295Y1oSNKCYGWxsBF9Xf7Y9bq1g1rI
        xJXXkDYyAzaIE6GE+bLb2KuMeQ==
X-Google-Smtp-Source: ABdhPJzGaXdR7XhLDv4AutWJwyf7lnVkRWqvb+Hx1e6kBWV91vCI1/RP137Hsx29MTufpmEIpSF+pg==
X-Received: by 2002:a17:90a:744c:: with SMTP id o12mr31880pjk.63.1599087747434;
        Wed, 02 Sep 2020 16:02:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x12sm410277pjq.43.2020.09.02.16.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 16:02:27 -0700 (PDT)
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
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH v2 08/10] phy: qcom-qmp: Add support for sc7180 DP phy
Date:   Wed,  2 Sep 2020 16:02:13 -0700
Message-Id: <20200902230215.3452712-9-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
In-Reply-To: <20200902230215.3452712-1-swboyd@chromium.org>
References: <20200902230215.3452712-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the necessary compatible strings and phy data for the sc7180 USB3+DP
combo phy.

Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>
Link: https://lore.kernel.org/r/20200609034623.10844-1-tanmay@codeaurora.org
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 123 ++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index a946b9d54673..68535a9eb546 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -947,6 +947,88 @@ static const struct qmp_phy_init_tbl qmp_v3_usb3_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x06),
 };
 
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
 static const struct qmp_phy_init_tbl qmp_v3_usb3_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
 	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
@@ -2223,6 +2305,40 @@ static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
 	.is_dual_lane_phy	= true,
 };
 
+static const struct qmp_phy_cfg sc7180_dpphy_cfg = {
+	.type			= PHY_TYPE_DP,
+	.nlanes			= 1,
+
+	.serdes_tbl		= qmp_v3_dp_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_dp_serdes_tbl),
+	.tx_tbl			= qmp_v3_dp_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qmp_v3_dp_tx_tbl),
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
+	.clk_list		= qmp_v3_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
+	.reset_list		= sc7180_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(sc7180_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+
+	.has_phy_dp_com_ctrl	= true,
+	.is_dual_lane_phy	= true,
+};
+
+static const struct qmp_phy_combo_cfg sc7180_usb3dpphy_cfg = {
+	.usb_cfg		= &sc7180_usb3phy_cfg,
+	.dp_cfg			= &sc7180_dpphy_cfg,
+};
+
 static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -3747,6 +3863,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sc7180-qmp-usb3-phy",
 		.data = &sc7180_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
+		/* It's a combo phy */
 	}, {
 		.compatible = "qcom,sdm845-qhp-pcie-phy",
 		.data = &sdm845_qhp_pciephy_cfg,
@@ -3789,6 +3908,10 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 MODULE_DEVICE_TABLE(of, qcom_qmp_phy_of_match_table);
 
 static const struct of_device_id qcom_qmp_combo_phy_of_match_table[] = {
+	{
+		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
+		.data = &sc7180_usb3dpphy_cfg,
+	},
 	{ }
 };
 
-- 
Sent by a computer, using git, on the internet

