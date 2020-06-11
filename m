Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689501F6490
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 11:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgFKJTn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 05:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgFKJT1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 05:19:27 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805D3C08C5C5
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 02:19:27 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b201so2437068pfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 02:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KudpLSpXqj1Z9k8pwvBBduHUKZ612Cfs4Dza1EdkkLU=;
        b=IHlYe6N142CwZ9UozoEiR7e3+AcKrMOaZqPxZprdr/TNQ4z/j7lVHQf6UsUg1DjVIJ
         aEBAetfGfOeeJLOyizsa21Q591SPshCTtky6hHTnl+T6tQabRZ7FxrTy9UD8ElAkdQNd
         Un+VWr/t1SKkkNW0XCZXhC1NI8cMVGa6RdRI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KudpLSpXqj1Z9k8pwvBBduHUKZ612Cfs4Dza1EdkkLU=;
        b=ViiDMFceFRc5vWM385DCoEnXNh0HNGUEeAaHnc74nBm434U+7BvEzPfn+CYg4pHEK+
         iJLzciB8tjZHBRr9FCAby6TOpSjO1fN0ak+ArixWSa7hzJ6aPsK74ktOJLSwoTjrAgfN
         iJuyQKZEX3+AyrJ3Zx/W5lU4eUcczLddIRGlpqC8xzjK6r5VLyYyqUxmOlyr+ToQz0aG
         wkVBKfZA0WdDuXZSQ8dkXt0DvzSV788o0KCCmAbwaYP+BxB2bairQzF6VEnKaBjqGmwA
         4yRfcw1SAUbhdWgkPIU6nctdxgOYHG4fTUMhd3ALwh2f1FK6gwwT5Xr+gnQJHoKlkV+/
         5G5A==
X-Gm-Message-State: AOAM532dRRlLofXUPHrhYPjw86viauyrlRQr6ezBr5qs874uG2auqy5I
        s9i39TFzwDiEd0k0AjdwRFqVXw==
X-Google-Smtp-Source: ABdhPJzlsQ2ElXykmsDK44gv2wdEYeVibfslwxUkSrqUj0M+wND+s+D4qsnVEvEkfFWQjbgvxxR0Yg==
X-Received: by 2002:a05:6a00:2ae:: with SMTP id q14mr6473844pfs.255.1591867167060;
        Thu, 11 Jun 2020 02:19:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 1sm2367852pfx.210.2020.06.11.02.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 02:19:26 -0700 (PDT)
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
        Sean Paul <seanpaul@chromium.org>
Subject: [PATCH/RFC 6/8] phy: qcom-qmp: Add support for sc7180 DP phy
Date:   Thu, 11 Jun 2020 02:19:17 -0700
Message-Id: <20200611091919.108018-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200611091919.108018-1-swboyd@chromium.org>
References: <20200611091919.108018-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the necessary compatible strings and phy data for the sc7180 USB3+DP
combo phy.

Link: https://lore.kernel.org/r/20200609034623.10844-1-tanmay@codeaurora.org
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 47 +++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 290233becd58..f6841716d21a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -961,6 +961,24 @@ static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x06),
 };
 
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
@@ -1842,6 +1860,28 @@ static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
 	.is_dual_lane_phy	= true,
 };
 
+static const struct qmp_phy_cfg sc7180_dpphy_cfg = {
+	.type			= PHY_TYPE_DP,
+	.nlanes			= 1,
+
+	.tx_tbl			= qmp_v3_dp_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qmp_v3_dp_tx_tbl),
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
@@ -3247,6 +3287,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sc7180-qmp-usb3-phy",
 		.data = &sc7180_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
+		/* It's a combo phy */
 	}, {
 		.compatible = "qcom,sdm845-qhp-pcie-phy",
 		.data = &sdm845_qhp_pciephy_cfg,
@@ -3274,6 +3317,10 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
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

