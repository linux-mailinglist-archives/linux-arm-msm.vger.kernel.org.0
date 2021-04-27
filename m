Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF10B36BF80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 08:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234696AbhD0GzD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 02:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234670AbhD0GzC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 02:55:02 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B93C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 23:54:20 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id q10so41684732pgj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 23:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TVjAMPcpFx0hHefD2s7i2zDK8kriRQm55yVj9QriI+A=;
        b=G5H/HbjPyGoUHgXYSN37e5Uo/+gyTai3Xh0o7gk2OuY0k/EwwsU+3NNQFK+lRz157n
         kl0NHZwbRHeevhmfTkg89STC7vJKQdPnNlFAd/V7eDkLDZV1cgwfp+P28q53QvCsoF3W
         gzU0GyZX9OxASB+M0UIQl7fLAHhpag51Kb1XjC31mawFcB3eJf9NwUWO8DIxmzXj7vxL
         ONbFy8tDPlgBY7GEiwH3u3J9GS7eZ6qqHMz+DwedSI7ogZ08mp6jTda01NLvxxNkPiWs
         sqYCY10DRZjV1BtztwzJtsXpdo3qBzLUKXjwHgHPmB4R6iDW0sCvZwjwN0Aqm1fPuo5a
         Ld7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TVjAMPcpFx0hHefD2s7i2zDK8kriRQm55yVj9QriI+A=;
        b=UYUaD64csAdWXWNgiQvRCQAhO2LXYYXKvddpp30PsevxEbvnAn+wmMI4vYf7RQjT3z
         J+MfoqV+C+EMcjaGi2uRH86U0DO2Ruxh8bwWaBUMQEVr6niBEWwABIUTVJmkyhQNM34m
         t/7Y15JC5oGygI65ONa2dHSVEuf9Cf0gq8CUDtxY/8KgZdXTcPU2YiuUGX5ccBt5BtNO
         J2x594aJDH2F8VNhs1Iy7LLBRBz0ToMdftfWT0qAGESyhGP8ct2br/WCc7zzx9uT4HkP
         s14OEUxMIo2xyzWvye65XVIohZ983xCxdEjtJbHX8/BtYDqLqHsW3pR99LM9/8rI/JRW
         Jcpg==
X-Gm-Message-State: AOAM5300vUxrQf8C9pyzezkhzqYwVG+x/MeGzsXbMXasvdJQkS8U6lPa
        7N0Dig8nWvWrXiwvpnDH7P0i
X-Google-Smtp-Source: ABdhPJzRhxB+o6SjF1fvb/8U/cL5iwskM2UXlwPOtcGDmJkM3a/HbvvY8mujhHROhZNPyNGy0NRMcQ==
X-Received: by 2002:a63:1a48:: with SMTP id a8mr20383191pgm.81.1619506459657;
        Mon, 26 Apr 2021 23:54:19 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6d89:3c72:ece6:56fb:d9ac:583c])
        by smtp.gmail.com with ESMTPSA id x22sm13391986pgx.19.2021.04.26.23.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 23:54:19 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     vkoul@kernel.org, kishon@ti.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/3] phy: qcom-qmp: Use phy_status field for the status bit offset
Date:   Tue, 27 Apr 2021 12:23:59 +0530
Message-Id: <20210427065400.18958-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427065400.18958-1-manivannan.sadhasivam@linaro.org>
References: <20210427065400.18958-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation of the support for v4.20 PCIe PHY in SDX55, use a
separate "phy_status" field for the status bit offset. This is needed
because, the v4.20 PHY uses a different offset for the PHY Status.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 9cdebe7f26cb..c9934b2407c4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -2323,6 +2323,8 @@ struct qmp_phy_cfg {
 	unsigned int start_ctrl;
 	unsigned int pwrdn_ctrl;
 	unsigned int mask_com_pcs_ready;
+	/* bit offset of PHYSTATUS in QPHY_PCS_STATUS register */
+	unsigned int phy_status;
 
 	/* true, if PHY has a separate PHY_COM control block */
 	bool has_phy_com_ctrl;
@@ -2526,6 +2528,7 @@ static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 };
 
 static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
@@ -2551,6 +2554,7 @@ static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
 	.start_ctrl		= PCS_START | PLL_READY_GATE_EN,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.mask_com_pcs_ready	= PCS_READY,
+	.phy_status		= PHYSTATUS,
 
 	.has_phy_com_ctrl	= true,
 	.has_lane_rst		= true,
@@ -2580,6 +2584,7 @@ static const struct qmp_phy_cfg msm8996_ufs_cfg = {
 
 	.start_ctrl		= SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.no_pcs_sw_reset	= true,
 };
@@ -2606,6 +2611,7 @@ static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 };
 
 static const char * const ipq8074_pciephy_clk_l[] = {
@@ -2638,6 +2644,7 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
 
 	.has_phy_com_ctrl	= false,
 	.has_lane_rst		= false,
@@ -2670,6 +2677,7 @@ static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
 
 	.start_ctrl		= PCS_START | SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= 995,		/* us */
@@ -2698,6 +2706,7 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
 
 	.start_ctrl		= PCS_START | SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= 995,		/* us */
@@ -2736,6 +2745,7 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
 
 	.start_ctrl		= PCS_START | SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= 995,		/* us */
@@ -2774,6 +2784,7 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
 
 	.start_ctrl		= PCS_START | SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
 
 	.is_dual_lane_phy	= true,
 	.has_pwrdn_delay	= true,
@@ -2803,6 +2814,7 @@ static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
@@ -2834,6 +2846,7 @@ static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
@@ -2900,6 +2913,7 @@ static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
@@ -2926,6 +2940,7 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 
 	.start_ctrl		= SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.is_dual_lane_phy	= true,
 	.no_pcs_sw_reset	= true,
@@ -2953,6 +2968,7 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 
 	.start_ctrl             = SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
 };
 
 static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
@@ -2977,6 +2993,7 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 
 	.start_ctrl             = SERDES_START | PCS_START,
 	.pwrdn_ctrl             = SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.is_dual_lane_phy       = true,
 };
@@ -3001,6 +3018,7 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 
 	.start_ctrl		= SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.is_dual_lane_phy	= true,
 };
@@ -3027,6 +3045,8 @@ static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
+
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
@@ -3058,6 +3078,7 @@ static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
@@ -3086,6 +3107,7 @@ static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
@@ -3117,6 +3139,7 @@ static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
@@ -3145,6 +3168,7 @@ static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
@@ -3171,6 +3195,7 @@ static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
 
 	.start_ctrl		= SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.is_dual_lane_phy	= true,
 };
@@ -3197,6 +3222,7 @@ static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
@@ -3228,6 +3254,7 @@ static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
@@ -3843,7 +3870,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 			ready = PCS_READY;
 		} else {
 			status = pcs + cfg->regs[QPHY_PCS_STATUS];
-			mask = PHYSTATUS;
+			mask = cfg->phy_status;
 			ready = 0;
 		}
 
-- 
2.25.1

