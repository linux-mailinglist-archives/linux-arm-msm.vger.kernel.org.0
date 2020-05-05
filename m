Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F77F1C617D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 21:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbgEET7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 15:59:51 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23072 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729191AbgEET7u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 15:59:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588708790; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=I+ZkQdkDJ31DFYs51FIwEUxZP372WZ4kVWcqs4hsfZA=; b=qu5+05r6F3ASaakSnKv1FUQK/EEL8uHmFbuqYOUqDGCKm3WkVjJ6zUKkoyn467bblKztqOs6
 MRIgK1rbQkwbtMxIoIo9hITJ8acoYxP1Ty2ktiZxtoac6+1vaJ4O6YeFH1LJyWePujiH8XJ6
 wm0s0sZkqpOq13HFQbXcFo3xp/I=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb1c5b5.7f2b78769928-smtp-out-n04;
 Tue, 05 May 2020 19:59:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D9D7CC44793; Tue,  5 May 2020 19:59:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 236F4C432C2;
        Tue,  5 May 2020 19:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 236F4C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org, vkoul@kernel.org, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jackp@codeaurora.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v9 4/5] phy: qcom-qmp: Use proper PWRDOWN offset for sm8150 USB
Date:   Tue,  5 May 2020 12:59:35 -0700
Message-Id: <1588708776-16774-5-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588708776-16774-1-git-send-email-wcheng@codeaurora.org>
References: <1588708776-16774-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The register map for SM8150 QMP USB SSPHY has moved
QPHY_POWER_DOWN_CONTROL to a different offset.  Allow for
an offset in the register table to override default value
if it is a DP capable PHY.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Reviewed-by: Manu Gautam <mgautam@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index d62bd09..dec4a17 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -119,6 +119,7 @@ enum qphy_reg_layout {
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_LFPS_RXTERM_IRQ_STATUS,
+	QPHY_PCS_POWER_DOWN_CONTROL,
 };
 
 static const unsigned int msm8996_ufsphy_regs_layout[] = {
@@ -181,6 +182,7 @@ enum qphy_reg_layout {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x44,
 	[QPHY_PCS_STATUS]		= 0x14,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
 };
 
 static const unsigned int sdm845_ufsphy_regs_layout[] = {
@@ -2030,11 +2032,18 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 			     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
 	}
 
-	if (cfg->has_phy_com_ctrl)
+	if (cfg->has_phy_com_ctrl) {
 		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
 			     SW_PWRDN);
-	else
-		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
+	} else {
+		if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL])
+			qphy_setbits(pcs,
+					cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+					cfg->pwrdn_ctrl);
+		else
+			qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
+					cfg->pwrdn_ctrl);
+	}
 
 	/* Serdes configuration */
 	qcom_qmp_phy_configure(serdes, cfg->regs, cfg->serdes_tbl,
@@ -2260,7 +2269,13 @@ static int qcom_qmp_phy_disable(struct phy *phy)
 	qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
 	/* Put PHY into POWER DOWN state: active low */
-	qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
+	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]) {
+		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+			     cfg->pwrdn_ctrl);
+	} else {
+		qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL,
+				cfg->pwrdn_ctrl);
+	}
 
 	if (cfg->has_lane_rst)
 		reset_control_assert(qphy->lane_rst);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
