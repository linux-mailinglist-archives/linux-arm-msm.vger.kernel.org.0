Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C9F566664
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiGEJnj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiGEJnh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:37 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DB225DB
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:35 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id e12so19604948lfr.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VK2ZGnAAJUxlWsXlxgZdSWHn6WBnB1AZNJCzddcADrY=;
        b=qoZBiGz06S8TDi71CTSq/diRtZBjgXAAV5DNsyV47ki0JmvCvWkxP6gU8mpnTAE0dR
         9w/qIn6qarxqSdl3Cu17AVIFrWvBojjSEH4BLeWPY9B/cBIi2dGc48JZhukmCR8rOaXU
         SZ4JE6a2ifihWkwlLvCidPp/FLmhFm148SjM14w3pgmVf85AmnINCnabHgTic1B8nY2+
         CLTYTI+tTIjWIQzLJcWu4UjLEAVbp9ZHjK4pnL/EReUImqbbvMofaRekl9ya7D4HCrFe
         HH1AX6LuUKSg9vTjimWT6pDTbYRP0oU7/Z80SyXqz8L1hjxUOwxLj9MEuORReCyhKGaC
         jk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VK2ZGnAAJUxlWsXlxgZdSWHn6WBnB1AZNJCzddcADrY=;
        b=7NpyFDf61mqm3wSPyiqHT5AHHjGW8rfhF70kfw1BGknPMHZCHTCV4YEwLQ3zMQN/Sc
         XwQgPLRwjMLq241Mjx468C1UiLMVgCEGgaTtK6gCUfLoQBd4YSdeAU1zjevMxIhe5D8b
         /3kA1A13FndLMDon9g+t3t6zEXsOlAKHqqro3W/dx6L0He4DB4nv90idVxiF9/O2DyVw
         DyPDjU2pC0g6nr6nig+pdcIDDpdCMUPwOIebdEq4aogfPAhbMZoFLy3fIbL5tjbVojuR
         EohAemap7erZfmOO1S+aHJiP2cJtwLgYgp8wBTk/lLDf7j/LotjZlWAalZSSXbcsQ/PP
         R4YA==
X-Gm-Message-State: AJIora/0Gn3euwaAtbA4CppMGQ6tnEdQJJlVFDvj6Bkk5X/pHBEfn62T
        TYPuRF+JnutOSC+dwzJyCr2Azg==
X-Google-Smtp-Source: AGRyM1sMaEEudOoA/Iz6USJ9yz4mOeVeLtXcTDYCWrED+w2Xzkarg30mIQXmm2zPh8zKhw420SLkyA==
X-Received: by 2002:a05:6512:169f:b0:482:f605:c19c with SMTP id bu31-20020a056512169f00b00482f605c19cmr3139331lfb.592.1657014213881;
        Tue, 05 Jul 2022 02:43:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 15/28] phy: qcom-qmp: move PCS V4 registers to separate headers
Date:   Tue,  5 Jul 2022 12:43:07 +0300
Message-Id: <20220705094320.1313312-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
References: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move PCS V4 registers to the separate headers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4.h   |  23 +++
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v4.h    |  31 +++
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v4.h    |  34 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4.h    | 135 ++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 192 +-----------------
 5 files changed, 228 insertions(+), 187 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v4.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v4.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4.h
new file mode 100644
index 000000000000..5a97867c5ba6
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_PCIE_V4_H_
+#define QCOM_PHY_QMP_PCS_PCIE_V4_H_
+
+/* Only for QMP V4 PHY - PCS_PCIE registers (same as PCS_MISC?) */
+#define QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG2		0x0c
+#define QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4		0x14
+#define QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE		0x1c
+#define QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L	0x40
+#define QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L	0x48
+#define QPHY_V4_PCS_PCIE_INT_AUX_CLK_CONFIG1		0x50
+#define QPHY_V4_PCS_PCIE_OSC_DTCT_ACTIONS		0x90
+#define QPHY_V4_PCS_PCIE_EQ_CONFIG1			0xa0
+#define QPHY_V4_PCS_PCIE_EQ_CONFIG2			0xa4
+#define QPHY_V4_PCS_PCIE_PRESET_P6_P7_PRE		0xb4
+#define QPHY_V4_PCS_PCIE_PRESET_P10_PRE			0xbc
+#define QPHY_V4_PCS_PCIE_PRESET_P10_POST		0xe0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v4.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v4.h
new file mode 100644
index 000000000000..a1c7d3d17150
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v4.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_UFS_V4_H_
+#define QCOM_PHY_QMP_PCS_UFS_V4_H_
+
+/* Only for QMP V4 PHY - UFS PCS registers */
+#define QPHY_V4_PCS_UFS_PHY_START			0x000
+#define QPHY_V4_PCS_UFS_POWER_DOWN_CONTROL		0x004
+#define QPHY_V4_PCS_UFS_SW_RESET			0x008
+#define QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB	0x00c
+#define QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB	0x010
+#define QPHY_V4_PCS_UFS_PLL_CNTL			0x02c
+#define QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x030
+#define QPHY_V4_PCS_UFS_TX_SMALL_AMP_DRV_LVL		0x038
+#define QPHY_V4_PCS_UFS_BIST_FIXED_PAT_CTRL		0x060
+#define QPHY_V4_PCS_UFS_TX_HSGEAR_CAPABILITY		0x074
+#define QPHY_V4_PCS_UFS_RX_HSGEAR_CAPABILITY		0x0b4
+#define QPHY_V4_PCS_UFS_DEBUG_BUS_CLKSEL		0x124
+#define QPHY_V4_PCS_UFS_LINECFG_DISABLE			0x148
+#define QPHY_V4_PCS_UFS_RX_MIN_HIBERN8_TIME		0x150
+#define QPHY_V4_PCS_UFS_RX_SIGDET_CTRL2			0x158
+#define QPHY_V4_PCS_UFS_TX_PWM_GEAR_BAND		0x160
+#define QPHY_V4_PCS_UFS_TX_HS_GEAR_BAND			0x168
+#define QPHY_V4_PCS_UFS_READY_STATUS			0x180
+#define QPHY_V4_PCS_UFS_TX_MID_TERM_CTRL1		0x1d8
+#define QPHY_V4_PCS_UFS_MULTI_LANE_CTRL1		0x1e0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v4.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v4.h
new file mode 100644
index 000000000000..d7fd4ac0fc55
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v4.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_USB_V4_H_
+#define QCOM_PHY_QMP_PCS_USB_V4_H_
+
+/* Only for QMP V4 PHY - USB3 PCS registers */
+#define QPHY_V4_PCS_USB3_POWER_STATE_CONFIG1		0x000
+#define QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_STATUS		0x004
+#define QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x008
+#define QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL2		0x00c
+#define QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_SOURCE_STATUS	0x010
+#define QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x014
+#define QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x018
+#define QPHY_V4_PCS_USB3_LFPS_TX_ECSTART		0x01c
+#define QPHY_V4_PCS_USB3_LFPS_PER_TIMER_VAL		0x020
+#define QPHY_V4_PCS_USB3_LFPS_TX_END_CNT_U3_START	0x024
+#define QPHY_V4_PCS_USB3_RXEQTRAINING_LOCK_TIME		0x028
+#define QPHY_V4_PCS_USB3_RXEQTRAINING_WAIT_TIME		0x02c
+#define QPHY_V4_PCS_USB3_RXEQTRAINING_CTLE_TIME		0x030
+#define QPHY_V4_PCS_USB3_RXEQTRAINING_WAIT_TIME_S2	0x034
+#define QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x038
+#define QPHY_V4_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x03c
+#define QPHY_V4_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x040
+#define QPHY_V4_PCS_USB3_ARCVR_DTCT_EN_PERIOD		0x044
+#define QPHY_V4_PCS_USB3_ARCVR_DTCT_CM_DLY		0x048
+#define QPHY_V4_PCS_USB3_TXONESZEROS_RUN_LENGTH		0x04c
+#define QPHY_V4_PCS_USB3_ALFPS_DEGLITCH_VAL		0x050
+#define QPHY_V4_PCS_USB3_SIGDET_STARTUP_TIMER_VAL	0x054
+#define QPHY_V4_PCS_USB3_TEST_CONTROL			0x058
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4.h
new file mode 100644
index 000000000000..a2c1eba2b693
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4.h
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V4_H_
+#define QCOM_PHY_QMP_PCS_V4_H_
+
+/* Only for QMP V4 PHY - USB/PCIe PCS registers */
+#define QPHY_V4_PCS_SW_RESET				0x000
+#define QPHY_V4_PCS_REVISION_ID0			0x004
+#define QPHY_V4_PCS_REVISION_ID1			0x008
+#define QPHY_V4_PCS_REVISION_ID2			0x00c
+#define QPHY_V4_PCS_REVISION_ID3			0x010
+#define QPHY_V4_PCS_PCS_STATUS1				0x014
+#define QPHY_V4_PCS_PCS_STATUS2				0x018
+#define QPHY_V4_PCS_PCS_STATUS3				0x01c
+#define QPHY_V4_PCS_PCS_STATUS4				0x020
+#define QPHY_V4_PCS_PCS_STATUS5				0x024
+#define QPHY_V4_PCS_PCS_STATUS6				0x028
+#define QPHY_V4_PCS_PCS_STATUS7				0x02c
+#define QPHY_V4_PCS_DEBUG_BUS_0_STATUS			0x030
+#define QPHY_V4_PCS_DEBUG_BUS_1_STATUS			0x034
+#define QPHY_V4_PCS_DEBUG_BUS_2_STATUS			0x038
+#define QPHY_V4_PCS_DEBUG_BUS_3_STATUS			0x03c
+#define QPHY_V4_PCS_POWER_DOWN_CONTROL			0x040
+#define QPHY_V4_PCS_START_CONTROL			0x044
+#define QPHY_V4_PCS_INSIG_SW_CTRL1			0x048
+#define QPHY_V4_PCS_INSIG_SW_CTRL2			0x04c
+#define QPHY_V4_PCS_INSIG_SW_CTRL3			0x050
+#define QPHY_V4_PCS_INSIG_SW_CTRL4			0x054
+#define QPHY_V4_PCS_INSIG_SW_CTRL5			0x058
+#define QPHY_V4_PCS_INSIG_SW_CTRL6			0x05c
+#define QPHY_V4_PCS_INSIG_SW_CTRL7			0x060
+#define QPHY_V4_PCS_INSIG_SW_CTRL8			0x064
+#define QPHY_V4_PCS_INSIG_MX_CTRL1			0x068
+#define QPHY_V4_PCS_INSIG_MX_CTRL2			0x06c
+#define QPHY_V4_PCS_INSIG_MX_CTRL3			0x070
+#define QPHY_V4_PCS_INSIG_MX_CTRL4			0x074
+#define QPHY_V4_PCS_INSIG_MX_CTRL5			0x078
+#define QPHY_V4_PCS_INSIG_MX_CTRL7			0x07c
+#define QPHY_V4_PCS_INSIG_MX_CTRL8			0x080
+#define QPHY_V4_PCS_OUTSIG_SW_CTRL1			0x084
+#define QPHY_V4_PCS_OUTSIG_MX_CTRL1			0x088
+#define QPHY_V4_PCS_CLAMP_ENABLE			0x08c
+#define QPHY_V4_PCS_POWER_STATE_CONFIG1			0x090
+#define QPHY_V4_PCS_POWER_STATE_CONFIG2			0x094
+#define QPHY_V4_PCS_FLL_CNTRL1				0x098
+#define QPHY_V4_PCS_FLL_CNTRL2				0x09c
+#define QPHY_V4_PCS_FLL_CNT_VAL_L			0x0a0
+#define QPHY_V4_PCS_FLL_CNT_VAL_H_TOL			0x0a4
+#define QPHY_V4_PCS_FLL_MAN_CODE			0x0a8
+#define QPHY_V4_PCS_TEST_CONTROL1			0x0ac
+#define QPHY_V4_PCS_TEST_CONTROL2			0x0b0
+#define QPHY_V4_PCS_TEST_CONTROL3			0x0b4
+#define QPHY_V4_PCS_TEST_CONTROL4			0x0b8
+#define QPHY_V4_PCS_TEST_CONTROL5			0x0bc
+#define QPHY_V4_PCS_TEST_CONTROL6			0x0c0
+#define QPHY_V4_PCS_LOCK_DETECT_CONFIG1			0x0c4
+#define QPHY_V4_PCS_LOCK_DETECT_CONFIG2			0x0c8
+#define QPHY_V4_PCS_LOCK_DETECT_CONFIG3			0x0cc
+#define QPHY_V4_PCS_LOCK_DETECT_CONFIG4			0x0d0
+#define QPHY_V4_PCS_LOCK_DETECT_CONFIG5			0x0d4
+#define QPHY_V4_PCS_LOCK_DETECT_CONFIG6			0x0d8
+#define QPHY_V4_PCS_REFGEN_REQ_CONFIG1			0x0dc
+#define QPHY_V4_PCS_REFGEN_REQ_CONFIG2			0x0e0
+#define QPHY_V4_PCS_REFGEN_REQ_CONFIG3			0x0e4
+#define QPHY_V4_PCS_BIST_CTRL				0x0e8
+#define QPHY_V4_PCS_PRBS_POLY0				0x0ec
+#define QPHY_V4_PCS_PRBS_POLY1				0x0f0
+#define QPHY_V4_PCS_FIXED_PAT0				0x0f4
+#define QPHY_V4_PCS_FIXED_PAT1				0x0f8
+#define QPHY_V4_PCS_FIXED_PAT2				0x0fc
+#define QPHY_V4_PCS_FIXED_PAT3				0x100
+#define QPHY_V4_PCS_FIXED_PAT4				0x104
+#define QPHY_V4_PCS_FIXED_PAT5				0x108
+#define QPHY_V4_PCS_FIXED_PAT6				0x10c
+#define QPHY_V4_PCS_FIXED_PAT7				0x110
+#define QPHY_V4_PCS_FIXED_PAT8				0x114
+#define QPHY_V4_PCS_FIXED_PAT9				0x118
+#define QPHY_V4_PCS_FIXED_PAT10				0x11c
+#define QPHY_V4_PCS_FIXED_PAT11				0x120
+#define QPHY_V4_PCS_FIXED_PAT12				0x124
+#define QPHY_V4_PCS_FIXED_PAT13				0x128
+#define QPHY_V4_PCS_FIXED_PAT14				0x12c
+#define QPHY_V4_PCS_FIXED_PAT15				0x130
+#define QPHY_V4_PCS_TXMGN_CONFIG			0x134
+#define QPHY_V4_PCS_G12S1_TXMGN_V0			0x138
+#define QPHY_V4_PCS_G12S1_TXMGN_V1			0x13c
+#define QPHY_V4_PCS_G12S1_TXMGN_V2			0x140
+#define QPHY_V4_PCS_G12S1_TXMGN_V3			0x144
+#define QPHY_V4_PCS_G12S1_TXMGN_V4			0x148
+#define QPHY_V4_PCS_G12S1_TXMGN_V0_RS			0x14c
+#define QPHY_V4_PCS_G12S1_TXMGN_V1_RS			0x150
+#define QPHY_V4_PCS_G12S1_TXMGN_V2_RS			0x154
+#define QPHY_V4_PCS_G12S1_TXMGN_V3_RS			0x158
+#define QPHY_V4_PCS_G12S1_TXMGN_V4_RS			0x15c
+#define QPHY_V4_PCS_G3S2_TXMGN_MAIN			0x160
+#define QPHY_V4_PCS_G3S2_TXMGN_MAIN_RS			0x164
+#define QPHY_V4_PCS_G12S1_TXDEEMPH_M6DB			0x168
+#define QPHY_V4_PCS_G12S1_TXDEEMPH_M3P5DB		0x16c
+#define QPHY_V4_PCS_G3S2_PRE_GAIN			0x170
+#define QPHY_V4_PCS_G3S2_POST_GAIN			0x174
+#define QPHY_V4_PCS_G3S2_PRE_POST_OFFSET		0x178
+#define QPHY_V4_PCS_G3S2_PRE_GAIN_RS			0x17c
+#define QPHY_V4_PCS_G3S2_POST_GAIN_RS			0x180
+#define QPHY_V4_PCS_G3S2_PRE_POST_OFFSET_RS		0x184
+#define QPHY_V4_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V4_PCS_RX_SIGDET_DTCT_CNTRL		0x18c
+#define QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
+#define QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
+#define QPHY_V4_PCS_RATE_SLEW_CNTRL1			0x198
+#define QPHY_V4_PCS_RATE_SLEW_CNTRL2			0x19c
+#define QPHY_V4_PCS_PWRUP_RESET_DLY_TIME_AUXCLK		0x1a0
+#define QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L	0x1a4
+#define QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_H	0x1a8
+#define QPHY_V4_PCS_TSYNC_RSYNC_TIME			0x1ac
+#define QPHY_V4_PCS_CDR_RESET_TIME			0x1b0
+#define QPHY_V4_PCS_TSYNC_DLY_TIME			0x1b4
+#define QPHY_V4_PCS_ELECIDLE_DLY_SEL			0x1b8
+#define QPHY_V4_PCS_CMN_ACK_OUT_SEL			0x1bc
+#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG1		0x1c0
+#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG2		0x1c4
+#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG3		0x1c8
+#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG4		0x1cc
+#define QPHY_V4_PCS_PCS_TX_RX_CONFIG			0x1d0
+#define QPHY_V4_PCS_RX_IDLE_DTCT_CNTRL			0x1d4
+#define QPHY_V4_PCS_RX_DCC_CAL_CONFIG			0x1d8
+#define QPHY_V4_PCS_EQ_CONFIG1				0x1dc
+#define QPHY_V4_PCS_EQ_CONFIG2				0x1e0
+#define QPHY_V4_PCS_EQ_CONFIG3				0x1e4
+#define QPHY_V4_PCS_EQ_CONFIG4				0x1e8
+#define QPHY_V4_PCS_EQ_CONFIG5				0x1ec
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 1290c62a16fe..05da0725df71 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -25,6 +25,11 @@
 #include "phy-qcom-qmp-pcs-v3.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
+#include "phy-qcom-qmp-pcs-v4.h"
+#include "phy-qcom-qmp-pcs-pcie-v4.h"
+#include "phy-qcom-qmp-pcs-usb-v4.h"
+#include "phy-qcom-qmp-pcs-ufs-v4.h"
+
 /* Only for QMP V3 & V4 PHY - DP COM registers */
 #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
 #define QPHY_V3_DP_COM_SW_RESET				0x04
@@ -142,28 +147,6 @@
 #define QSERDES_V4_20_RX_DFE_CTLE_POST_CAL_OFFSET	0x20c
 #define QSERDES_V4_20_RX_MARG_COARSE_CTRL2		0x23c
 
-/* Only for QMP V4 PHY - UFS PCS registers */
-#define QPHY_V4_PCS_UFS_PHY_START			0x000
-#define QPHY_V4_PCS_UFS_POWER_DOWN_CONTROL		0x004
-#define QPHY_V4_PCS_UFS_SW_RESET			0x008
-#define QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB	0x00c
-#define QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB	0x010
-#define QPHY_V4_PCS_UFS_PLL_CNTL			0x02c
-#define QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x030
-#define QPHY_V4_PCS_UFS_TX_SMALL_AMP_DRV_LVL		0x038
-#define QPHY_V4_PCS_UFS_BIST_FIXED_PAT_CTRL		0x060
-#define QPHY_V4_PCS_UFS_TX_HSGEAR_CAPABILITY		0x074
-#define QPHY_V4_PCS_UFS_RX_HSGEAR_CAPABILITY		0x0b4
-#define QPHY_V4_PCS_UFS_DEBUG_BUS_CLKSEL		0x124
-#define QPHY_V4_PCS_UFS_LINECFG_DISABLE			0x148
-#define QPHY_V4_PCS_UFS_RX_MIN_HIBERN8_TIME		0x150
-#define QPHY_V4_PCS_UFS_RX_SIGDET_CTRL2			0x158
-#define QPHY_V4_PCS_UFS_TX_PWM_GEAR_BAND		0x160
-#define QPHY_V4_PCS_UFS_TX_HS_GEAR_BAND			0x168
-#define QPHY_V4_PCS_UFS_READY_STATUS			0x180
-#define QPHY_V4_PCS_UFS_TX_MID_TERM_CTRL1		0x1d8
-#define QPHY_V4_PCS_UFS_MULTI_LANE_CTRL1		0x1e0
-
 /* PCIE GEN3 COM registers */
 #define PCIE_GEN3_QHP_COM_SSC_EN_CENTER			0x14
 #define PCIE_GEN3_QHP_COM_SSC_PER1			0x20
@@ -278,157 +261,6 @@
 #define PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG5		0x16c
 #define PCIE_GEN3_QHP_PHY_PCS_TX_RX_CONFIG		0x174
 
-/* Only for QMP V4 PHY - USB/PCIe PCS registers */
-#define QPHY_V4_PCS_SW_RESET				0x000
-#define QPHY_V4_PCS_REVISION_ID0			0x004
-#define QPHY_V4_PCS_REVISION_ID1			0x008
-#define QPHY_V4_PCS_REVISION_ID2			0x00c
-#define QPHY_V4_PCS_REVISION_ID3			0x010
-#define QPHY_V4_PCS_PCS_STATUS1				0x014
-#define QPHY_V4_PCS_PCS_STATUS2				0x018
-#define QPHY_V4_PCS_PCS_STATUS3				0x01c
-#define QPHY_V4_PCS_PCS_STATUS4				0x020
-#define QPHY_V4_PCS_PCS_STATUS5				0x024
-#define QPHY_V4_PCS_PCS_STATUS6				0x028
-#define QPHY_V4_PCS_PCS_STATUS7				0x02c
-#define QPHY_V4_PCS_DEBUG_BUS_0_STATUS			0x030
-#define QPHY_V4_PCS_DEBUG_BUS_1_STATUS			0x034
-#define QPHY_V4_PCS_DEBUG_BUS_2_STATUS			0x038
-#define QPHY_V4_PCS_DEBUG_BUS_3_STATUS			0x03c
-#define QPHY_V4_PCS_POWER_DOWN_CONTROL			0x040
-#define QPHY_V4_PCS_START_CONTROL			0x044
-#define QPHY_V4_PCS_INSIG_SW_CTRL1			0x048
-#define QPHY_V4_PCS_INSIG_SW_CTRL2			0x04c
-#define QPHY_V4_PCS_INSIG_SW_CTRL3			0x050
-#define QPHY_V4_PCS_INSIG_SW_CTRL4			0x054
-#define QPHY_V4_PCS_INSIG_SW_CTRL5			0x058
-#define QPHY_V4_PCS_INSIG_SW_CTRL6			0x05c
-#define QPHY_V4_PCS_INSIG_SW_CTRL7			0x060
-#define QPHY_V4_PCS_INSIG_SW_CTRL8			0x064
-#define QPHY_V4_PCS_INSIG_MX_CTRL1			0x068
-#define QPHY_V4_PCS_INSIG_MX_CTRL2			0x06c
-#define QPHY_V4_PCS_INSIG_MX_CTRL3			0x070
-#define QPHY_V4_PCS_INSIG_MX_CTRL4			0x074
-#define QPHY_V4_PCS_INSIG_MX_CTRL5			0x078
-#define QPHY_V4_PCS_INSIG_MX_CTRL7			0x07c
-#define QPHY_V4_PCS_INSIG_MX_CTRL8			0x080
-#define QPHY_V4_PCS_OUTSIG_SW_CTRL1			0x084
-#define QPHY_V4_PCS_OUTSIG_MX_CTRL1			0x088
-#define QPHY_V4_PCS_CLAMP_ENABLE			0x08c
-#define QPHY_V4_PCS_POWER_STATE_CONFIG1			0x090
-#define QPHY_V4_PCS_POWER_STATE_CONFIG2			0x094
-#define QPHY_V4_PCS_FLL_CNTRL1				0x098
-#define QPHY_V4_PCS_FLL_CNTRL2				0x09c
-#define QPHY_V4_PCS_FLL_CNT_VAL_L			0x0a0
-#define QPHY_V4_PCS_FLL_CNT_VAL_H_TOL			0x0a4
-#define QPHY_V4_PCS_FLL_MAN_CODE			0x0a8
-#define QPHY_V4_PCS_TEST_CONTROL1			0x0ac
-#define QPHY_V4_PCS_TEST_CONTROL2			0x0b0
-#define QPHY_V4_PCS_TEST_CONTROL3			0x0b4
-#define QPHY_V4_PCS_TEST_CONTROL4			0x0b8
-#define QPHY_V4_PCS_TEST_CONTROL5			0x0bc
-#define QPHY_V4_PCS_TEST_CONTROL6			0x0c0
-#define QPHY_V4_PCS_LOCK_DETECT_CONFIG1			0x0c4
-#define QPHY_V4_PCS_LOCK_DETECT_CONFIG2			0x0c8
-#define QPHY_V4_PCS_LOCK_DETECT_CONFIG3			0x0cc
-#define QPHY_V4_PCS_LOCK_DETECT_CONFIG4			0x0d0
-#define QPHY_V4_PCS_LOCK_DETECT_CONFIG5			0x0d4
-#define QPHY_V4_PCS_LOCK_DETECT_CONFIG6			0x0d8
-#define QPHY_V4_PCS_REFGEN_REQ_CONFIG1			0x0dc
-#define QPHY_V4_PCS_REFGEN_REQ_CONFIG2			0x0e0
-#define QPHY_V4_PCS_REFGEN_REQ_CONFIG3			0x0e4
-#define QPHY_V4_PCS_BIST_CTRL				0x0e8
-#define QPHY_V4_PCS_PRBS_POLY0				0x0ec
-#define QPHY_V4_PCS_PRBS_POLY1				0x0f0
-#define QPHY_V4_PCS_FIXED_PAT0				0x0f4
-#define QPHY_V4_PCS_FIXED_PAT1				0x0f8
-#define QPHY_V4_PCS_FIXED_PAT2				0x0fc
-#define QPHY_V4_PCS_FIXED_PAT3				0x100
-#define QPHY_V4_PCS_FIXED_PAT4				0x104
-#define QPHY_V4_PCS_FIXED_PAT5				0x108
-#define QPHY_V4_PCS_FIXED_PAT6				0x10c
-#define QPHY_V4_PCS_FIXED_PAT7				0x110
-#define QPHY_V4_PCS_FIXED_PAT8				0x114
-#define QPHY_V4_PCS_FIXED_PAT9				0x118
-#define QPHY_V4_PCS_FIXED_PAT10				0x11c
-#define QPHY_V4_PCS_FIXED_PAT11				0x120
-#define QPHY_V4_PCS_FIXED_PAT12				0x124
-#define QPHY_V4_PCS_FIXED_PAT13				0x128
-#define QPHY_V4_PCS_FIXED_PAT14				0x12c
-#define QPHY_V4_PCS_FIXED_PAT15				0x130
-#define QPHY_V4_PCS_TXMGN_CONFIG			0x134
-#define QPHY_V4_PCS_G12S1_TXMGN_V0			0x138
-#define QPHY_V4_PCS_G12S1_TXMGN_V1			0x13c
-#define QPHY_V4_PCS_G12S1_TXMGN_V2			0x140
-#define QPHY_V4_PCS_G12S1_TXMGN_V3			0x144
-#define QPHY_V4_PCS_G12S1_TXMGN_V4			0x148
-#define QPHY_V4_PCS_G12S1_TXMGN_V0_RS			0x14c
-#define QPHY_V4_PCS_G12S1_TXMGN_V1_RS			0x150
-#define QPHY_V4_PCS_G12S1_TXMGN_V2_RS			0x154
-#define QPHY_V4_PCS_G12S1_TXMGN_V3_RS			0x158
-#define QPHY_V4_PCS_G12S1_TXMGN_V4_RS			0x15c
-#define QPHY_V4_PCS_G3S2_TXMGN_MAIN			0x160
-#define QPHY_V4_PCS_G3S2_TXMGN_MAIN_RS			0x164
-#define QPHY_V4_PCS_G12S1_TXDEEMPH_M6DB			0x168
-#define QPHY_V4_PCS_G12S1_TXDEEMPH_M3P5DB		0x16c
-#define QPHY_V4_PCS_G3S2_PRE_GAIN			0x170
-#define QPHY_V4_PCS_G3S2_POST_GAIN			0x174
-#define QPHY_V4_PCS_G3S2_PRE_POST_OFFSET		0x178
-#define QPHY_V4_PCS_G3S2_PRE_GAIN_RS			0x17c
-#define QPHY_V4_PCS_G3S2_POST_GAIN_RS			0x180
-#define QPHY_V4_PCS_G3S2_PRE_POST_OFFSET_RS		0x184
-#define QPHY_V4_PCS_RX_SIGDET_LVL			0x188
-#define QPHY_V4_PCS_RX_SIGDET_DTCT_CNTRL		0x18c
-#define QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
-#define QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
-#define QPHY_V4_PCS_RATE_SLEW_CNTRL1			0x198
-#define QPHY_V4_PCS_RATE_SLEW_CNTRL2			0x19c
-#define QPHY_V4_PCS_PWRUP_RESET_DLY_TIME_AUXCLK		0x1a0
-#define QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L	0x1a4
-#define QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_H	0x1a8
-#define QPHY_V4_PCS_TSYNC_RSYNC_TIME			0x1ac
-#define QPHY_V4_PCS_CDR_RESET_TIME			0x1b0
-#define QPHY_V4_PCS_TSYNC_DLY_TIME			0x1b4
-#define QPHY_V4_PCS_ELECIDLE_DLY_SEL			0x1b8
-#define QPHY_V4_PCS_CMN_ACK_OUT_SEL			0x1bc
-#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG1		0x1c0
-#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG2		0x1c4
-#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG3		0x1c8
-#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG4		0x1cc
-#define QPHY_V4_PCS_PCS_TX_RX_CONFIG			0x1d0
-#define QPHY_V4_PCS_RX_IDLE_DTCT_CNTRL			0x1d4
-#define QPHY_V4_PCS_RX_DCC_CAL_CONFIG			0x1d8
-#define QPHY_V4_PCS_EQ_CONFIG1				0x1dc
-#define QPHY_V4_PCS_EQ_CONFIG2				0x1e0
-#define QPHY_V4_PCS_EQ_CONFIG3				0x1e4
-#define QPHY_V4_PCS_EQ_CONFIG4				0x1e8
-#define QPHY_V4_PCS_EQ_CONFIG5				0x1ec
-
-/* Only for QMP V4 PHY - USB3 PCS registers */
-#define QPHY_V4_PCS_USB3_POWER_STATE_CONFIG1		0x000
-#define QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_STATUS		0x004
-#define QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x008
-#define QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL2		0x00c
-#define QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_SOURCE_STATUS	0x010
-#define QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x014
-#define QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x018
-#define QPHY_V4_PCS_USB3_LFPS_TX_ECSTART		0x01c
-#define QPHY_V4_PCS_USB3_LFPS_PER_TIMER_VAL		0x020
-#define QPHY_V4_PCS_USB3_LFPS_TX_END_CNT_U3_START	0x024
-#define QPHY_V4_PCS_USB3_RXEQTRAINING_LOCK_TIME		0x028
-#define QPHY_V4_PCS_USB3_RXEQTRAINING_WAIT_TIME		0x02c
-#define QPHY_V4_PCS_USB3_RXEQTRAINING_CTLE_TIME		0x030
-#define QPHY_V4_PCS_USB3_RXEQTRAINING_WAIT_TIME_S2	0x034
-#define QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x038
-#define QPHY_V4_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x03c
-#define QPHY_V4_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x040
-#define QPHY_V4_PCS_USB3_ARCVR_DTCT_EN_PERIOD		0x044
-#define QPHY_V4_PCS_USB3_ARCVR_DTCT_CM_DLY		0x048
-#define QPHY_V4_PCS_USB3_TXONESZEROS_RUN_LENGTH		0x04c
-#define QPHY_V4_PCS_USB3_ALFPS_DEGLITCH_VAL		0x050
-#define QPHY_V4_PCS_USB3_SIGDET_STARTUP_TIMER_VAL	0x054
-#define QPHY_V4_PCS_USB3_TEST_CONTROL			0x058
-
 /* Only for QMP V4_20 PHY - USB/PCIe PCS registers */
 #define QPHY_V4_20_PCS_RX_SIGDET_LVL			0x188
 #define QPHY_V4_20_PCS_EQ_CONFIG2			0x1d8
@@ -443,20 +275,6 @@
 #define QPHY_V4_PCS_MISC_TYPEC_STATUS			0x10
 #define QPHY_V4_PCS_MISC_PLACEHOLDER_STATUS		0x14
 
-/* Only for QMP V4 PHY - PCS_PCIE registers (same as PCS_MISC?) */
-#define QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG2		0x0c
-#define QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4		0x14
-#define QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE		0x1c
-#define QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L	0x40
-#define QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L	0x48
-#define QPHY_V4_PCS_PCIE_INT_AUX_CLK_CONFIG1		0x50
-#define QPHY_V4_PCS_PCIE_OSC_DTCT_ACTIONS		0x90
-#define QPHY_V4_PCS_PCIE_EQ_CONFIG1			0xa0
-#define QPHY_V4_PCS_PCIE_EQ_CONFIG2			0xa4
-#define QPHY_V4_PCS_PCIE_PRESET_P6_P7_PRE		0xb4
-#define QPHY_V4_PCS_PCIE_PRESET_P10_PRE			0xbc
-#define QPHY_V4_PCS_PCIE_PRESET_P10_POST		0xe0
-
 #define QPHY_V4_20_PCS_PCIE_EQ_CONFIG1			0x0a0
 #define QPHY_V4_20_PCS_PCIE_G3_RXEQEVAL_TIME		0x0f0
 #define QPHY_V4_20_PCS_PCIE_G4_RXEQEVAL_TIME		0x0f4
-- 
2.35.1

