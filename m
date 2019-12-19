Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22601126564
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 16:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfLSPFG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 10:05:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:34314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726801AbfLSPFG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 10:05:06 -0500
Received: from localhost.localdomain (unknown [122.178.234.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B1D8221655;
        Thu, 19 Dec 2019 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576767905;
        bh=2vFU+S6HKqKhfz4jubJ0RuqI/YrwcWJmmCmTPInyZtw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NYgNPf78Ks2olSLVdWXX45DQN+xgYZmkM4W7388mGgelnnhI4LdEBenVPTxkPpk/2
         UEcAZTgAdfHMGHbTE9jdbwVmn9cE7bEXtNY1qqaM/QiN/2oEVkqjsGyXthHzzYLK2A
         f5vfJLWD/WFsYwnwiLKOE4NjGn04YwInN4WG7KiY=
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Can Guo <cang@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] phy: qcom-qmp: Add optional SW reset
Date:   Thu, 19 Dec 2019 20:34:32 +0530
Message-Id: <20191219150433.2785427-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191219150433.2785427-1-vkoul@kernel.org>
References: <20191219150433.2785427-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For V4 QMP UFS Phy, we need to assert reset bits, configure the phy and
then deassert it, so add optional has_sw_reset flag and use that to
configure the QPHY_SW_RESET register.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 06f971ca518e..80304b7cd895 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1023,6 +1023,9 @@ struct qmp_phy_cfg {
 
 	/* true, if PCS block has no separate SW_RESET register */
 	bool no_pcs_sw_reset;
+
+	/* true if sw reset needs to be invoked */
+	bool has_sw_reset;
 };
 
 /**
@@ -1391,6 +1394,7 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 
 	.is_dual_lane_phy	= true,
 	.no_pcs_sw_reset	= true,
+	.has_sw_reset		= true,
 };
 
 static void qcom_qmp_phy_configure(void __iomem *base,
@@ -1475,6 +1479,9 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 			     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
 	}
 
+	if (cfg->has_sw_reset)
+		qphy_setbits(serdes, cfg->regs[QPHY_SW_RESET], SW_RESET);
+
 	if (cfg->has_phy_com_ctrl)
 		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
 			     SW_PWRDN);
@@ -1651,6 +1658,9 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 	if (cfg->has_phy_dp_com_ctrl)
 		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
 
+	if (cfg->has_sw_reset)
+		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+
 	/* start SerDes and Phy-Coding-Sublayer */
 	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
-- 
2.23.0

