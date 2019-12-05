Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36AD7114495
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 17:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbfLEQPQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Dec 2019 11:15:16 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37969 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729656AbfLEQPQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Dec 2019 11:15:16 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so4299468wmi.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2019 08:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=osUs1MXgqq64XnjQfyE6+biIqafx/NsQy/3on47ZeQc=;
        b=gVB4hAsLAgJa4rWpY/gdIDc3Ht4nVXm+ZgiEds5WPBm4kehXNFm9VaFK9wzd6FzJ9Q
         5oEDrVh0k9luzhoi4ksu6IX04ouwMnAu18q4oJeMqXyBnrfubf6l2Uon5g/ZM6igkcou
         c98s2ZH7UPg1aEN2msaM9npjb0yO07MUtctw8WzXSWOvfko3S8lk7n2pFRPpUj2F1hUE
         Q0imXTtpmU1tTy8tx/Yy+HzSbBlDu6cKSWi5Amzrd9gzh1wFig+nYdwcKmMhYXJietZw
         mMokjfnc4DgIqwypH99tKCdyDlNAS7zoU1ZHQU7+87y/Es1eMRZWLVnv8hemg5msY3Iv
         P80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=osUs1MXgqq64XnjQfyE6+biIqafx/NsQy/3on47ZeQc=;
        b=dBpK6BSjp8txssMIEvT9oK3moQVx7b3+2pKWlBsJHgWccqoT0RXQcB9DOwh59CJxEc
         zpciRJq9i41ScVz1gtjhyv7OWj59pcaU7dxiLKNrxpCVrb18E4+3tMeo9dSKRDI9qXWL
         TcWRXxFSbpCsZ96uKuanWtgsb8sK56YQX+L7V0H9g3+etAJwOY6JDrqHOrChw3HXMG05
         z0XBBEgXIjIGZpCpxCd9hEZQ6yRaC/REHfgxiimxMY6QjQePBudYIu7VDrvkjfa/w0F3
         J5IIpknea37Vf7/g+HCGxZCl/wMqqstEqMlz6YncFoyjO4DSsL5wXyXBWJy4eemMZiHD
         7rbg==
X-Gm-Message-State: APjAAAUPuhv+N38juHQcINtr3fQkAx4Q4RVvt9xepO82Ul0gsD95gBOM
        oNix4UoOcO8dlIf4EzqfaBk=
X-Google-Smtp-Source: APXvYqzhjP1ec/JKkxlElca4E0iYyLjoPOb43YCvMrmh0V+wUR+OxcaUq3RU1P8ylNpziO937KhtCQ==
X-Received: by 2002:a7b:c216:: with SMTP id x22mr5728628wmi.51.1575562513453;
        Thu, 05 Dec 2019 08:15:13 -0800 (PST)
Received: from gmail.com (net-37-119-134-251.cust.vodafonedsl.it. [37.119.134.251])
        by smtp.gmail.com with ESMTPSA id e8sm12637330wrt.7.2019.12.05.08.15.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 08:15:12 -0800 (PST)
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/6] Revert "phy: qcom-qmp: Correct ready status, again"
Date:   Thu,  5 Dec 2019 17:15:05 +0100
Message-Id: <20191205161505.15295-7-p.pisati@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205161505.15295-1-p.pisati@gmail.com>
References: <20191205161505.15295-1-p.pisati@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 14ced7e3a1ae9bed7051df3718c8c7b583854a5c.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 39e8deb..e7b8283 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -35,7 +35,7 @@
 #define PLL_READY_GATE_EN			BIT(3)
 /* QPHY_PCS_STATUS bit */
 #define PHYSTATUS				BIT(6)
-/* QPHY_PCS_READY_STATUS & QPHY_COM_PCS_READY_STATUS bit */
+/* QPHY_COM_PCS_READY_STATUS bit */
 #define PCS_READY				BIT(0)
 
 /* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
@@ -115,7 +115,6 @@ enum qphy_reg_layout {
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
 	QPHY_PCS_READY_STATUS,
-	QPHY_PCS_STATUS,
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_LFPS_RXTERM_IRQ_STATUS,
@@ -134,7 +133,7 @@ static const unsigned int pciephy_regs_layout[] = {
 	[QPHY_FLL_MAN_CODE]		= 0xd4,
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
-	[QPHY_PCS_STATUS]		= 0x174,
+	[QPHY_PCS_READY_STATUS]		= 0x174,
 };
 
 static const unsigned int usb3phy_regs_layout[] = {
@@ -145,7 +144,7 @@ static const unsigned int usb3phy_regs_layout[] = {
 	[QPHY_FLL_MAN_CODE]		= 0xd0,
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
-	[QPHY_PCS_STATUS]		= 0x17c,
+	[QPHY_PCS_READY_STATUS]		= 0x17c,
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d4,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0d8,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x178,
@@ -154,7 +153,7 @@ static const unsigned int usb3phy_regs_layout[] = {
 static const unsigned int qmp_v3_usb3phy_regs_layout[] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
-	[QPHY_PCS_STATUS]		= 0x174,
+	[QPHY_PCS_READY_STATUS]		= 0x174,
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d8,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0dc,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x170,
@@ -912,6 +911,7 @@ struct qmp_phy_cfg {
 
 	unsigned int start_ctrl;
 	unsigned int pwrdn_ctrl;
+	unsigned int mask_pcs_ready;
 	unsigned int mask_com_pcs_ready;
 
 	/* true, if PHY has a separate PHY_COM control block */
@@ -1074,6 +1074,7 @@ static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
 
 	.start_ctrl		= PCS_START | PLL_READY_GATE_EN,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.mask_pcs_ready		= PHYSTATUS,
 	.mask_com_pcs_ready	= PCS_READY,
 
 	.has_phy_com_ctrl	= true,
@@ -1105,6 +1106,7 @@ static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.mask_pcs_ready		= PHYSTATUS,
 };
 
 /* list of resets */
@@ -1134,6 +1136,7 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.mask_pcs_ready		= PHYSTATUS,
 
 	.has_phy_com_ctrl	= false,
 	.has_lane_rst		= false,
@@ -1164,6 +1167,7 @@ static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.mask_pcs_ready		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
@@ -1195,6 +1199,7 @@ static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.mask_pcs_ready		= PHYSTATUS,
 
 	.has_pwrdn_delay	= true,
 	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
@@ -1221,6 +1226,7 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 
 	.start_ctrl		= SERDES_START,
 	.pwrdn_ctrl		= SW_PWRDN,
+	.mask_pcs_ready		= PCS_READY,
 
 	.is_dual_lane_phy	= true,
 	.no_pcs_sw_reset	= true,
@@ -1248,6 +1254,7 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 
 	.start_ctrl             = SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.mask_pcs_ready		= PHYSTATUS,
 };
 
 static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
@@ -1272,6 +1279,7 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 
 	.start_ctrl             = SERDES_START | PCS_START,
 	.pwrdn_ctrl             = SW_PWRDN,
+	.mask_pcs_ready         = PHYSTATUS,
 
 	.is_dual_lane_phy       = true,
 };
@@ -1449,7 +1457,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 	void __iomem *pcs = qphy->pcs;
 	void __iomem *dp_com = qmp->dp_com;
 	void __iomem *status;
-	unsigned int mask, val, ready;
+	unsigned int mask, val;
 	int ret;
 
 	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
@@ -1537,17 +1545,10 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 	/* start SerDes and Phy-Coding-Sublayer */
 	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
-	if (cfg->type == PHY_TYPE_UFS) {
-		status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
-		mask = PCS_READY;
-		ready = PCS_READY;
-	} else {
-		status = pcs + cfg->regs[QPHY_PCS_STATUS];
-		mask = PHYSTATUS;
-		ready = 0;
-	}
+	status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
+	mask = cfg->mask_pcs_ready;
 
-	ret = readl_poll_timeout(status, val, (val & mask) == ready, 10,
+	ret = readl_poll_timeout(status, val, val & mask, 10,
 				 PHY_INIT_COMPLETE_TIMEOUT);
 	if (ret) {
 		dev_err(qmp->dev, "phy initialization timed-out\n");
-- 
2.7.4

