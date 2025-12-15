Return-Path: <linux-arm-msm+bounces-85250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88074CBDE28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B59CD301AB11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A9C315765;
	Mon, 15 Dec 2025 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uz5Q0T8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB022F2905;
	Mon, 15 Dec 2025 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765802546; cv=none; b=WfZo2b/xZyZiEhJFeOmL4ECi+q6nDRALSqhBauUsV6pVNcwEMo/bd+9YWiNvckMkCTtCrefk5v3KIeCgwfjS4oTm8gdOsJjxzEGH6cxetV1XjRZgN0TknqOIxUO2uQ8PDPA6LV7igJuQdu5bztrDxgFFkrBhuk2m2bvhw7FA1VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765802546; c=relaxed/simple;
	bh=syoDjmwtTkuPNk6NuWfGm11Wtp6aRsixt2eadoST6sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eym5hQFXzW33v0wNYKQO7heOLLOoKySvTx/umldJ+Sc1bCs9NFSdTh3VYJ6VxrcMn8UTnt8OisBy+o7IuFWR/czlaaD5vJMX2nLPlg4ORP+ITDZ4K7U5Nek2QGDdv37wP0pctlppfUhWaMi8cDNibi768od7Ob2meJC+obXF3GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uz5Q0T8r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CB31C19422;
	Mon, 15 Dec 2025 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765802546;
	bh=syoDjmwtTkuPNk6NuWfGm11Wtp6aRsixt2eadoST6sc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Uz5Q0T8rVvmuS83g05+O+E3K/IrDADVCo4iDnxlKvpRGriAVs5i+IlrJ6TUSVakH4
	 w9M42BBJuub1861rM9imDarYPwD+32UsugHlyAe2FHa2YOCY8RQg0Q5gL4vQge4lSA
	 IZkmFQR5lO4rWXSzM9bfqneeEFTSibMTEVBKf/ARk3q5KHXTc1qxwwX6GK0me59Sb3
	 5+L2GzE2Gc4s7wTacYy3lXIqRFVR9h+3zS+uhZjHc75tXYeEdS5TXQPVkm/MxNUpur
	 JNShpge0Z4zwoHuzRdp18w5Wdvn3L2urHCf7732Th/QcP/xo0fg0txm0GKICbtZ5kC
	 4q+oHxu3UT4Sg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04707D5B16E;
	Mon, 15 Dec 2025 12:42:26 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Mon, 15 Dec 2025 20:42:07 +0800
Subject: [PATCH v8 11/12] phy: qcom: qmp: Add DP v2 PHY register
 definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-add-displayport-support-for-qcs615-platform-v8-11-cbc72c88a44e@oss.qualcomm.com>
References: <20251215-add-displayport-support-for-qcs615-platform-v8-0-cbc72c88a44e@oss.qualcomm.com>
In-Reply-To: <20251215-add-displayport-support-for-qcs615-platform-v8-0-cbc72c88a44e@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com, 
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765802543; l=10337;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=GWjcAhmiyC0lMBjcETZr15esuDIyOq7xezsmZ5A29ow=;
 b=IT9NlyG4CoUAmlb4FR/HrnbcLFqgBZfzusIZauCL90boTk86PCch0WZl/otftcdH802wtQrul
 ij/Fm2LmKqjDEDofB8x6wptkKyY5U4IMXMNV7wPi5ncEQF5BwLRaxK1
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Reply-To: xiangxu.yin@oss.qualcomm.com

From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

Add dedicated headers for DP v2 PHY, including QSERDES COM and TX/RX
register definitions.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |  21 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h | 106 +++++++++++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h    |  68 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   3 +
 4 files changed, 198 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h
new file mode 100644
index 000000000000..8b9572d3cdeb
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_PHY_V2_H_
+#define QCOM_PHY_QMP_DP_PHY_V2_H_
+
+// /* Only for QMP V2 PHY - DP PHY registers */
+#define QSERDES_V2_DP_PHY_AUX_INTERRUPT_MASK		0x048
+#define QSERDES_V2_DP_PHY_AUX_INTERRUPT_CLEAR		0x04c
+#define QSERDES_V2_DP_PHY_AUX_BIST_CFG			0x050
+
+#define QSERDES_V2_DP_PHY_VCO_DIV			0x068
+#define QSERDES_V2_DP_PHY_TX0_TX1_LANE_CTL		0x06c
+#define QSERDES_V2_DP_PHY_TX2_TX3_LANE_CTL		0x088
+
+#define QSERDES_V2_DP_PHY_SPARE0			0x0ac
+#define QSERDES_V2_DP_PHY_STATUS			0x0c0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h
new file mode 100644
index 000000000000..3ea1884f35dd
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V2_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V2_H_
+
+/* Only for QMP V2 PHY - QSERDES COM registers */
+#define QSERDES_V2_COM_ATB_SEL1				0x000
+#define QSERDES_V2_COM_ATB_SEL2				0x004
+#define QSERDES_V2_COM_FREQ_UPDATE			0x008
+#define QSERDES_V2_COM_BG_TIMER				0x00c
+#define QSERDES_V2_COM_SSC_EN_CENTER			0x010
+#define QSERDES_V2_COM_SSC_ADJ_PER1			0x014
+#define QSERDES_V2_COM_SSC_ADJ_PER2			0x018
+#define QSERDES_V2_COM_SSC_PER1				0x01c
+#define QSERDES_V2_COM_SSC_PER2				0x020
+#define QSERDES_V2_COM_SSC_STEP_SIZE1			0x024
+#define QSERDES_V2_COM_SSC_STEP_SIZE2			0x028
+#define QSERDES_V2_COM_POST_DIV				0x02c
+#define QSERDES_V2_COM_POST_DIV_MUX			0x030
+#define QSERDES_V2_COM_BIAS_EN_CLKBUFLR_EN		0x034
+#define QSERDES_V2_COM_CLK_ENABLE1			0x038
+#define QSERDES_V2_COM_SYS_CLK_CTRL			0x03c
+#define QSERDES_V2_COM_SYSCLK_BUF_ENABLE		0x040
+#define QSERDES_V2_COM_PLL_EN				0x044
+#define QSERDES_V2_COM_PLL_IVCO				0x048
+#define QSERDES_V2_COM_LOCK_CMP1_MODE0			0x04c
+#define QSERDES_V2_COM_LOCK_CMP2_MODE0			0x050
+#define QSERDES_V2_COM_LOCK_CMP3_MODE0			0x054
+#define QSERDES_V2_COM_LOCK_CMP1_MODE1			0x058
+#define QSERDES_V2_COM_LOCK_CMP2_MODE1			0x05c
+#define QSERDES_V2_COM_LOCK_CMP3_MODE1			0x060
+#define QSERDES_V2_COM_EP_CLOCK_DETECT_CTR		0x068
+#define QSERDES_V2_COM_SYSCLK_DET_COMP_STATUS		0x06c
+#define QSERDES_V2_COM_CLK_EP_DIV			0x074
+#define QSERDES_V2_COM_CP_CTRL_MODE0			0x078
+#define QSERDES_V2_COM_CP_CTRL_MODE1			0x07c
+#define QSERDES_V2_COM_PLL_RCTRL_MODE0			0x084
+#define QSERDES_V2_COM_PLL_RCTRL_MODE1			0x088
+#define QSERDES_V2_COM_PLL_CCTRL_MODE0			0x090
+#define QSERDES_V2_COM_PLL_CCTRL_MODE1			0x094
+#define QSERDES_V2_COM_PLL_CNTRL			0x09c
+#define QSERDES_V2_COM_BIAS_EN_CTRL_BY_PSM		0x0a8
+#define QSERDES_V2_COM_SYSCLK_EN_SEL			0x0ac
+#define QSERDES_V2_COM_CML_SYSCLK_SEL			0x0b0
+#define QSERDES_V2_COM_RESETSM_CNTRL			0x0b4
+#define QSERDES_V2_COM_RESETSM_CNTRL2			0x0b8
+#define QSERDES_V2_COM_LOCK_CMP_EN			0x0c8
+#define QSERDES_V2_COM_LOCK_CMP_CFG			0x0cc
+#define QSERDES_V2_COM_DEC_START_MODE0			0x0d0
+#define QSERDES_V2_COM_DEC_START_MODE1			0x0d4
+#define QSERDES_V2_COM_VCOCAL_DEADMAN_CTRL		0x0d8
+#define QSERDES_V2_COM_DIV_FRAC_START1_MODE0		0x0dc
+#define QSERDES_V2_COM_DIV_FRAC_START2_MODE0		0x0e0
+#define QSERDES_V2_COM_DIV_FRAC_START3_MODE0		0x0e4
+#define QSERDES_V2_COM_DIV_FRAC_START1_MODE1		0x0e8
+#define QSERDES_V2_COM_DIV_FRAC_START2_MODE1		0x0ec
+#define QSERDES_V2_COM_DIV_FRAC_START3_MODE1		0x0f0
+#define QSERDES_V2_COM_VCO_TUNE_MINVAL1			0x0f4
+#define QSERDES_V2_COM_VCO_TUNE_MINVAL2			0x0f8
+#define QSERDES_V2_COM_INTEGLOOP_INITVAL		0x100
+#define QSERDES_V2_COM_INTEGLOOP_EN			0x104
+#define QSERDES_V2_COM_INTEGLOOP_GAIN0_MODE0		0x108
+#define QSERDES_V2_COM_INTEGLOOP_GAIN1_MODE0		0x10c
+#define QSERDES_V2_COM_INTEGLOOP_GAIN0_MODE1		0x110
+#define QSERDES_V2_COM_INTEGLOOP_GAIN1_MODE1		0x114
+#define QSERDES_V2_COM_VCO_TUNE_MAXVAL1			0x118
+#define QSERDES_V2_COM_VCO_TUNE_MAXVAL2			0x11c
+#define QSERDES_V2_COM_VCO_TUNE_CTRL			0x124
+#define QSERDES_V2_COM_VCO_TUNE_MAP			0x128
+#define QSERDES_V2_COM_VCO_TUNE1_MODE0			0x12c
+#define QSERDES_V2_COM_VCO_TUNE2_MODE0			0x130
+#define QSERDES_V2_COM_VCO_TUNE1_MODE1			0x134
+#define QSERDES_V2_COM_VCO_TUNE2_MODE1			0x138
+#define QSERDES_V2_COM_VCO_TUNE_INITVAL1		0x13c
+#define QSERDES_V2_COM_VCO_TUNE_INITVAL2		0x140
+#define QSERDES_V2_COM_VCO_TUNE_TIMER1			0x144
+#define QSERDES_V2_COM_VCO_TUNE_TIMER2			0x148
+#define QSERDES_V2_COM_CMN_STATUS			0x15c
+#define QSERDES_V2_COM_RESET_SM_STATUS			0x160
+#define QSERDES_V2_COM_RESTRIM_CODE_STATUS		0x164
+#define QSERDES_V2_COM_PLLCAL_CODE1_STATUS		0x168
+#define QSERDES_V2_COM_PLLCAL_CODE2_STATUS		0x16c
+#define QSERDES_V2_COM_CLK_SELECT			0x174
+#define QSERDES_V2_COM_HSCLK_SEL			0x178
+#define QSERDES_V2_COM_INTEGLOOP_BINCODE_STATUS		0x17c
+#define QSERDES_V2_COM_PLL_ANALOG			0x180
+#define QSERDES_V2_COM_CORECLK_DIV			0x184
+#define QSERDES_V2_COM_SW_RESET				0x188
+#define QSERDES_V2_COM_CORE_CLK_EN			0x18c
+#define QSERDES_V2_COM_C_READY_STATUS			0x190
+#define QSERDES_V2_COM_CMN_CONFIG			0x194
+#define QSERDES_V2_COM_CMN_RATE_OVERRIDE		0x198
+#define QSERDES_V2_COM_SVS_MODE_CLK_SEL			0x19c
+#define QSERDES_V2_COM_DEBUG_BUS0			0x1a0
+#define QSERDES_V2_COM_DEBUG_BUS1			0x1a4
+#define QSERDES_V2_COM_DEBUG_BUS2			0x1a8
+#define QSERDES_V2_COM_DEBUG_BUS3			0x1ac
+#define QSERDES_V2_COM_DEBUG_BUS_SEL			0x1b0
+#define QSERDES_V2_COM_CMN_MISC1			0x1b4
+#define QSERDES_V2_COM_CMN_MISC2			0x1b8
+#define QSERDES_V2_COM_CORECLK_DIV_MODE1		0x1bc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h
new file mode 100644
index 000000000000..34919720b7bc
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V2_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V2_H_
+
+/* Only for QMP V2 PHY - TX registers */
+#define QSERDES_V2_TX_BIST_MODE_LANENO			0x000
+#define QSERDES_V2_TX_CLKBUF_ENABLE			0x008
+#define QSERDES_V2_TX_TX_EMP_POST1_LVL			0x00c
+#define QSERDES_V2_TX_TX_DRV_LVL			0x01c
+#define QSERDES_V2_TX_RESET_TSYNC_EN			0x024
+#define QSERDES_V2_TX_PRE_STALL_LDO_BOOST_EN		0x028
+#define QSERDES_V2_TX_TX_BAND				0x02c
+#define QSERDES_V2_TX_SLEW_CNTL				0x030
+#define QSERDES_V2_TX_INTERFACE_SELECT			0x034
+#define QSERDES_V2_TX_RES_CODE_LANE_TX			0x03c
+#define QSERDES_V2_TX_RES_CODE_LANE_RX			0x040
+#define QSERDES_V2_TX_RES_CODE_LANE_OFFSET_TX		0x044
+#define QSERDES_V2_TX_RES_CODE_LANE_OFFSET_RX		0x048
+#define QSERDES_V2_TX_DEBUG_BUS_SEL			0x058
+#define QSERDES_V2_TX_TRANSCEIVER_BIAS_EN		0x05c
+#define QSERDES_V2_TX_HIGHZ_DRVR_EN			0x060
+#define QSERDES_V2_TX_TX_POL_INV			0x064
+#define QSERDES_V2_TX_PARRATE_REC_DETECT_IDLE_EN	0x068
+#define QSERDES_V2_TX_LANE_MODE_1			0x08c
+#define QSERDES_V2_TX_LANE_MODE_2			0x090
+#define QSERDES_V2_TX_LANE_MODE_3			0x094
+#define QSERDES_V2_TX_RCV_DETECT_LVL_2			0x0a4
+#define QSERDES_V2_TX_TRAN_DRVR_EMP_EN			0x0c0
+#define QSERDES_V2_TX_TX_INTERFACE_MODE			0x0c4
+#define QSERDES_V2_TX_VMODE_CTRL1			0x0f0
+
+/* Only for QMP V2 PHY - RX registers */
+#define QSERDES_V2_RX_UCDR_FO_GAIN			0x008
+#define QSERDES_V2_RX_UCDR_SO_GAIN_HALF			0x00c
+#define QSERDES_V2_RX_UCDR_SO_GAIN			0x014
+#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN_HALF		0x024
+#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN_QUARTER		0x028
+#define QSERDES_V2_RX_UCDR_SVS_SO_GAIN			0x02c
+#define QSERDES_V2_RX_UCDR_FASTLOCK_FO_GAIN		0x030
+#define QSERDES_V2_RX_UCDR_SO_SATURATION_AND_ENABLE	0x034
+#define QSERDES_V2_RX_UCDR_FASTLOCK_COUNT_LOW		0x03c
+#define QSERDES_V2_RX_UCDR_FASTLOCK_COUNT_HIGH		0x040
+#define QSERDES_V2_RX_UCDR_PI_CONTROLS			0x044
+#define QSERDES_V2_RX_RX_TERM_BW			0x07c
+#define QSERDES_V2_RX_VGA_CAL_CNTRL1			0x0bc
+#define QSERDES_V2_RX_VGA_CAL_CNTRL2			0x0c0
+#define QSERDES_V2_RX_RX_EQ_GAIN2_LSB			0x0c8
+#define QSERDES_V2_RX_RX_EQ_GAIN2_MSB			0x0cc
+#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL1		0x0d0
+#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL2		0x0d4
+#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL3		0x0d8
+#define QSERDES_V2_RX_RX_EQU_ADAPTOR_CNTRL4		0x0dc
+#define QSERDES_V2_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x0f8
+#define QSERDES_V2_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x0fc
+#define QSERDES_V2_RX_SIGDET_ENABLES			0x100
+#define QSERDES_V2_RX_SIGDET_CNTRL			0x104
+#define QSERDES_V2_RX_SIGDET_LVL			0x108
+#define QSERDES_V2_RX_SIGDET_DEGLITCH_CNTRL		0x10c
+#define QSERDES_V2_RX_RX_BAND				0x110
+#define QSERDES_V2_RX_RX_INTERFACE_MODE			0x11c
+#define QSERDES_V2_RX_RX_MODE_00			0x164
+#define QSERDES_V2_RX_RX_MODE_01			0x168
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index da2a7ad2cdcc..836a222a2e78 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -9,6 +9,9 @@
 #include "phy-qcom-qmp-qserdes-com.h"
 #include "phy-qcom-qmp-qserdes-txrx.h"
 
+#include "phy-qcom-qmp-qserdes-com-v2.h"
+#include "phy-qcom-qmp-qserdes-txrx-v2.h"
+
 #include "phy-qcom-qmp-qserdes-com-v3.h"
 #include "phy-qcom-qmp-qserdes-txrx-v3.h"
 

-- 
2.34.1



