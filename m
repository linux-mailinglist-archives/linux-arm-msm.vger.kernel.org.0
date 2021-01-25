Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213BE302387
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 11:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbhAYKMG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 05:12:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:44506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727343AbhAYKLU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 05:11:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93AC22251D;
        Mon, 25 Jan 2021 10:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611569373;
        bh=nba0Jv8m1xcS4I4Px7Vw3yzw2X5S8XBHwCaDESso34w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mNdiut+UDIZlWL4YI1aKoRUSyXyLsGrXAvSVH8AfDSG5LVXT4gvep0j/ZDe8/Vl8w
         FzzohcS8o55BCTg/f6oWO6udoX2CaGKsFz1uaZdJcu/r13WAwlW7dOJoAy7oiqLoPF
         h67L2qiTbGDt+le3cf2zlUQaanNXj8vAzI0Wg0OjBFskYfixmn/lSqtMUuZha/wWTF
         WX7yCDoUgO5F5Y1uWLY2F3YHIpUkBiBsPh8xaOKp/9bCrFnVHTH6OJyrhikJ0kZpTj
         so0gn25qwSN5KO5h75QV0NowoEh1uqhPLcvPQ2Y7FwYmD+kVPpdOkLbhImMK2T/wL4
         Y4o/E41b0pN0Q==
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] phy: qcom-qmp: Add UFS v4 registers found in SM8350
Date:   Mon, 25 Jan 2021 15:39:05 +0530
Message-Id: <20210125100906.4004908-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210125100906.4004908-1-vkoul@kernel.org>
References: <20210125100906.4004908-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the registers for few new registers found in SM8350. Also the UFS
phy used in SM8350 seems to have different offsets than V4 phy, although
it claims it is v4 phy, so add the new offsets with SM8350 tag instead
of V4 tag.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index dff7be5a1cc1..bba1d5e3eb73 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -451,6 +451,7 @@
 #define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX 		0x40
 #define QSERDES_V4_TX_LANE_MODE_1			0x84
 #define QSERDES_V4_TX_LANE_MODE_2			0x88
+#define QSERDES_V4_TX_LANE_MODE_3			0x8C
 #define QSERDES_V4_TX_RCV_DETECT_LVL_2			0x9c
 #define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0xd8
 #define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0xdC
@@ -459,6 +460,13 @@
 #define QSERDES_V4_TX_TRAN_DRVR_EMP_EN			0xb8
 #define QSERDES_V4_TX_PI_QEC_CTRL		0x104
 
+/* Only for SM8350 QMP V4 Phy TX offsets different from V4 */
+#define QSERDES_SM8350_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0x178
+#define QSERDES_SM8350_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0x17c
+#define QSERDES_SM8350_TX_PWM_GEAR_3_DIVIDER_BAND0_1	0x180
+#define QSERDES_SM8350_TX_PWM_GEAR_4_DIVIDER_BAND0_1	0x184
+#define QSERDES_SM8350_TX_TRAN_DRVR_EMP_EN		0xc0
+
 /* Only for QMP V4 PHY - RX registers */
 #define QSERDES_V4_RX_UCDR_FO_GAIN			0x008
 #define QSERDES_V4_RX_UCDR_SO_GAIN			0x014
@@ -514,6 +522,24 @@
 #define QSERDES_V4_RX_DCC_CTRL1				0x1bc
 #define QSERDES_V4_RX_VTH_CODE				0x1c4
 
+/* Only for SM8350 QMP V4 Phy RX offsets different from V4 */
+#define QSERDES_SM8350_RX_RX_MODE_00_LOW		0x15c
+#define QSERDES_SM8350_RX_RX_MODE_00_HIGH		0x160
+#define QSERDES_SM8350_RX_RX_MODE_00_HIGH2		0x164
+#define QSERDES_SM8350_RX_RX_MODE_00_HIGH3		0x168
+#define QSERDES_SM8350_RX_RX_MODE_00_HIGH4		0x16c
+#define QSERDES_SM8350_RX_RX_MODE_01_LOW		0x170
+#define QSERDES_SM8350_RX_RX_MODE_01_HIGH		0x174
+#define QSERDES_SM8350_RX_RX_MODE_01_HIGH2		0x178
+#define QSERDES_SM8350_RX_RX_MODE_01_HIGH3		0x17c
+#define QSERDES_SM8350_RX_RX_MODE_01_HIGH4		0x180
+#define QSERDES_SM8350_RX_RX_MODE_10_LOW		0x184
+#define QSERDES_SM8350_RX_RX_MODE_10_HIGH		0x188
+#define QSERDES_SM8350_RX_RX_MODE_10_HIGH2		0x18c
+#define QSERDES_SM8350_RX_RX_MODE_10_HIGH3		0x190
+#define QSERDES_SM8350_RX_RX_MODE_10_HIGH4		0x194
+#define QSERDES_SM8350_RX_DCC_CTRL1			0x1a8
+
 /* Only for QMP V4 PHY - UFS PCS registers */
 #define QPHY_V4_PCS_UFS_PHY_START				0x000
 #define QPHY_V4_PCS_UFS_POWER_DOWN_CONTROL			0x004
@@ -529,6 +555,7 @@
 #define QPHY_V4_PCS_UFS_DEBUG_BUS_CLKSEL			0x124
 #define QPHY_V4_PCS_UFS_LINECFG_DISABLE				0x148
 #define QPHY_V4_PCS_UFS_RX_MIN_HIBERN8_TIME			0x150
+#define QPHY_V4_PCS_UFS_RX_SIGDET_CTRL1				0x154
 #define QPHY_V4_PCS_UFS_RX_SIGDET_CTRL2				0x158
 #define QPHY_V4_PCS_UFS_TX_PWM_GEAR_BAND			0x160
 #define QPHY_V4_PCS_UFS_TX_HS_GEAR_BAND				0x168
-- 
2.26.2

