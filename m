Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE98F30FCAC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 20:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238271AbhBDT0k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 14:26:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:54028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238268AbhBDQ7K (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 11:59:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83EBF64F72;
        Thu,  4 Feb 2021 16:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612457909;
        bh=J778l9M1K8153trMZBWLrcMcnqBtk9mX7SssLwTjnZg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sr/7UWgOOzsbZ+6eyN8VQRljp/yFgix0YHfd8FdGDBIWWQ6/rRpChV+Vr8c3DEoag
         EUNNpauXVD0laBCGDzODaLxwcKbCQ3RPA4P1+7FRvnvhyyciHarKnlDB+X66HIqBY6
         GWcAhn1KkW7qaYeXqEgBAf5xezhIojXJgZmoJOggTWQ5EjB26PYNayxvOs8HMGjKV8
         EhnQOUlRLyIscKKm30hZ1VCXn3unlz5HyBBD1krE6ck+Xhd5H0RTCy0rZyg0hs/8Uh
         GdlZGgp+RGoV0WN+QVL/UwBMVYa0f3duHSgeghTvUCxPqN5eI+czl6q+54oNkqFuJM
         Qqlg8GgIwA/0A==
From:   Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] phy: qcom-qmp: Add UFS V5 registers found in SM8350
Date:   Thu,  4 Feb 2021 22:28:04 +0530
Message-Id: <20210204165805.62235-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204165805.62235-1-vkoul@kernel.org>
References: <20210204165805.62235-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the registers for UFS found in SM8350. The UFS phy used in SM8350
seems to have same offsets as V5 phy, although Documentation for that is
lacking.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.h | 47 +++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index dff7be5a1cc1..71ce3aa174ae 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -824,6 +824,32 @@
 #define QPHY_V4_PCS_PCIE_PRESET_P10_PRE			0xbc
 #define QPHY_V4_PCS_PCIE_PRESET_P10_POST		0xe0
 
+/* Only for QMP V5 PHY - QSERDES COM registers */
+#define QSERDES_V5_COM_PLL_IVCO				0x058
+#define QSERDES_V5_COM_CP_CTRL_MODE0			0x074
+#define QSERDES_V5_COM_CP_CTRL_MODE1			0x078
+#define QSERDES_V5_COM_PLL_RCTRL_MODE0			0x07c
+#define QSERDES_V5_COM_PLL_RCTRL_MODE1			0x080
+#define QSERDES_V5_COM_PLL_CCTRL_MODE0			0x084
+#define QSERDES_V5_COM_PLL_CCTRL_MODE1			0x088
+#define QSERDES_V5_COM_SYSCLK_EN_SEL			0x094
+#define QSERDES_V5_COM_LOCK_CMP_EN			0x0a4
+#define QSERDES_V5_COM_LOCK_CMP1_MODE0			0x0ac
+#define QSERDES_V5_COM_LOCK_CMP2_MODE0			0x0b0
+#define QSERDES_V5_COM_LOCK_CMP1_MODE1			0x0b4
+#define QSERDES_V5_COM_DEC_START_MODE0			0x0bc
+#define QSERDES_V5_COM_LOCK_CMP2_MODE1			0x0b8
+#define QSERDES_V5_COM_DEC_START_MODE1			0x0c4
+#define QSERDES_V5_COM_VCO_TUNE_MAP			0x10c
+#define QSERDES_V5_COM_VCO_TUNE_INITVAL2		0x124
+#define QSERDES_V5_COM_HSCLK_SEL			0x158
+#define QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL		0x15c
+#define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
+#define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
+#define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE1	0x1b4
+#define QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL		0x1bc
+#define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE1	0x1b8
+
 /* Only for QMP V5 PHY - TX registers */
 #define QSERDES_V5_TX_RES_CODE_LANE_TX			0x34
 #define QSERDES_V5_TX_RES_CODE_LANE_RX			0x38
@@ -837,6 +863,10 @@
 #define QSERDES_V5_TX_RCV_DETECT_LVL_2			0xa4
 #define QSERDES_V5_TX_TRAN_DRVR_EMP_EN			0xc0
 #define QSERDES_V5_TX_PI_QEC_CTRL			0xe4
+#define QSERDES_V5_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0x178
+#define QSERDES_V5_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0x17c
+#define QSERDES_V5_TX_PWM_GEAR_3_DIVIDER_BAND0_1	0x180
+#define QSERDES_V5_TX_PWM_GEAR_4_DIVIDER_BAND0_1	0x184
 
 /* Only for QMP V5 PHY - RX registers */
 #define QSERDES_V5_RX_UCDR_FO_GAIN			0x008
@@ -893,6 +923,23 @@
 #define QSERDES_V5_RX_DCC_CTRL1				0x1a8
 #define QSERDES_V5_RX_VTH_CODE				0x1b0
 
+/* Only for QMP V5 PHY - UFS PCS registers */
+#define QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB	0x00c
+#define QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB	0x010
+#define QPHY_V5_PCS_UFS_PLL_CNTL			0x02c
+#define QPHY_V5_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x030
+#define QPHY_V5_PCS_UFS_TX_SMALL_AMP_DRV_LVL		0x038
+#define QPHY_V5_PCS_UFS_TX_HSGEAR_CAPABILITY		0x074
+#define QPHY_V5_PCS_UFS_RX_HSGEAR_CAPABILITY		0x0b4
+#define QPHY_V5_PCS_UFS_DEBUG_BUS_CLKSEL		0x124
+#define QPHY_V5_PCS_UFS_RX_MIN_HIBERN8_TIME		0x150
+#define QPHY_V5_PCS_UFS_RX_SIGDET_CTRL1			0x154
+#define QPHY_V5_PCS_UFS_RX_SIGDET_CTRL2			0x158
+#define QPHY_V5_PCS_UFS_TX_PWM_GEAR_BAND		0x160
+#define QPHY_V5_PCS_UFS_TX_HS_GEAR_BAND			0x168
+#define QPHY_V5_PCS_UFS_TX_MID_TERM_CTRL1		0x1d8
+#define QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1		0x1e0
+
 /* Only for QMP V5 PHY - USB3 have different offsets than V4 */
 #define QPHY_V5_PCS_USB3_POWER_STATE_CONFIG1		0x300
 #define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_STATUS		0x304
-- 
2.26.2

