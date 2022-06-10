Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608DF546CF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347189AbiFJTJ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350287AbiFJTJ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:09:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F85C324
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:55 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id i29so27504151lfp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VwNvNf/fg1vH6mgfjM91FaQKXDEsvJNkyrukqfVltYE=;
        b=QevwaiUl2i4TwSUbw1/l457MY71LgO2ydYJOmFKRqD+jLqtQEiFIpiEWMyOravI8Ub
         oBjm45JUZ4Tw+7xx3bFE5twht7bm9TRiEpH0FKlZjnkXNl/o135XFQpAP60s4hNxVwbm
         i0eGtnkjBKCXBxAtNi/gHlpXDz+1ZhUEyGJGFjMUdjNsb3KUDCqUot9pDO1s0snMx39y
         6P/B3iH/jAI8+1W+LqT6jvs3QmcIPCRL6CJ5iC6rMvIhjH0/4r2rF5uyx4JNfdnulOT+
         bfQ/DY8EWpaclHMIqBlPN2xdJt4vNBFGLjZBKRh6uI5HHjzsjlKR/4MMBxMQZ0hzeCpg
         kN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VwNvNf/fg1vH6mgfjM91FaQKXDEsvJNkyrukqfVltYE=;
        b=RNKvn0liLyCWKOX5g2doOjj+mVwa+NkZniOo+sWn+rw+SpPDhf3EiT/QO/ljdrp2Qh
         dRmMVhRys8LcIdR49WNdu1lnjzZdA2Z4KXPfhS7KlGwujIcDrNe7FxORdO8m7fn/gVVu
         GDpIcCYMVDAsrTSJ4tP66X4R+b38KJIwpOUtC2WJ7KwradvgI1u5nIizhs3C00giLXOg
         LjRyJcGbGCDVQ9W6cZMAsNDCniHsmyHQAwnZXrnvL3ZZ6qhOGmxTlNNDeyu7wjfs1hew
         6xyG/qCFdW6bqdqUa+ATjkDwX9Uautop2KHQ8n9cn79Gby5gHJBNZ17CEaFMG+IPdjoY
         BJzQ==
X-Gm-Message-State: AOAM531dUe7Wo1MDLHnF+MFl0d02ryTfvqx9p1LuTMW9svHkpyvMbfEC
        Bk/MQngykX/98L4E+VhZ4fu5Cw==
X-Google-Smtp-Source: ABdhPJwONLRVdyWj6HY6NFe0QFfYykaMIBgbwcjxl1VIwld49/qZbG5DVC4IaE8E47I9M6AggUgmRg==
X-Received: by 2002:a05:6512:3d88:b0:479:1ad9:c007 with SMTP id k8-20020a0565123d8800b004791ad9c007mr22904101lfv.68.1654888193325;
        Fri, 10 Jun 2022 12:09:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:09:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 16/28] phy: qcom-qmp: move PCS V5 registers to separate headers
Date:   Fri, 10 Jun 2022 22:09:13 +0300
Message-Id: <20220610190925.3670081-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
References: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move PCS V5 registers to the separate headers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h   | 16 +++++
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h    | 27 ++++++++
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v5.h    | 36 +++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h    | 17 +++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 63 ++-----------------
 5 files changed, 101 insertions(+), 58 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
new file mode 100644
index 000000000000..2e19fb3f051e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
@@ -0,0 +1,16 @@
+/* Only for QMP V5 PHY - PCS_PCIE registers */
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_PCIE_V5_H_
+#define QCOM_PHY_QMP_PCS_PCIE_V5_H_
+
+/* Only for QMP V5 PHY - PCS_PCIE registers */
+#define QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE		0x20
+#define QPHY_V5_PCS_PCIE_INT_AUX_CLK_CONFIG1		0x54
+#define QPHY_V5_PCS_PCIE_OSC_DTCT_ACTIONS		0x94
+#define QPHY_V5_PCS_PCIE_EQ_CONFIG2			0xa8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h
new file mode 100644
index 000000000000..bcca23493b7e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h
@@ -0,0 +1,27 @@
+/* Only for QMP V5 PHY - UFS PCS registers */
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_UFS_V5_H_
+#define QCOM_PHY_QMP_PCS_UFS_V5_H_
+
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
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v5.h
new file mode 100644
index 000000000000..73de626223ed
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v5.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_USB_V5_H_
+#define QCOM_PHY_QMP_PCS_USB_V5_H_
+
+/* Only for QMP V5 PHY - USB3 have different offsets than V4 */
+#define QPHY_V5_PCS_USB3_POWER_STATE_CONFIG1		0x000
+#define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_STATUS		0x004
+#define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x008
+#define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL2		0x00c
+#define QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_SOURCE_STATUS	0x010
+#define QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x014
+#define QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x018
+#define QPHY_V5_PCS_USB3_LFPS_TX_ECSTART		0x01c
+#define QPHY_V5_PCS_USB3_LFPS_PER_TIMER_VAL		0x020
+#define QPHY_V5_PCS_USB3_LFPS_TX_END_CNT_U3_START	0x024
+#define QPHY_V5_PCS_USB3_LFPS_CONFIG1			0x028
+#define QPHY_V5_PCS_USB3_RXEQTRAINING_LOCK_TIME		0x02c
+#define QPHY_V5_PCS_USB3_RXEQTRAINING_WAIT_TIME		0x030
+#define QPHY_V5_PCS_USB3_RXEQTRAINING_CTLE_TIME		0x034
+#define QPHY_V5_PCS_USB3_RXEQTRAINING_WAIT_TIME_S2	0x038
+#define QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x03c
+#define QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x040
+#define QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x044
+#define QPHY_V5_PCS_USB3_ARCVR_DTCT_EN_PERIOD		0x048
+#define QPHY_V5_PCS_USB3_ARCVR_DTCT_CM_DLY		0x04c
+#define QPHY_V5_PCS_USB3_TXONESZEROS_RUN_LENGTH		0x050
+#define QPHY_V5_PCS_USB3_ALFPS_DEGLITCH_VAL		0x054
+#define QPHY_V5_PCS_USB3_SIGDET_STARTUP_TIMER_VAL	0x058
+#define QPHY_V5_PCS_USB3_TEST_CONTROL			0x05c
+#define QPHY_V5_PCS_USB3_RXTERMINATION_DLY_SEL		0x060
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
new file mode 100644
index 000000000000..61a44519f969
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V5_H_
+#define QCOM_PHY_QMP_PCS_V5_H_
+
+/* Only for QMP V5 PHY - USB/PCIe PCS registers */
+#define QPHY_V5_PCS_REFGEN_REQ_CONFIG1			0x0dc
+#define QPHY_V5_PCS_G3S2_PRE_GAIN			0x170
+#define QPHY_V5_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V5_PCS_RATE_SLEW_CNTRL1			0x198
+#define QPHY_V5_PCS_EQ_CONFIG2				0x1e0
+#define QPHY_V5_PCS_EQ_CONFIG3				0x1e4
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 05da0725df71..9d93ae785b16 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -30,6 +30,11 @@
 #include "phy-qcom-qmp-pcs-usb-v4.h"
 #include "phy-qcom-qmp-pcs-ufs-v4.h"
 
+#include "phy-qcom-qmp-pcs-v5.h"
+#include "phy-qcom-qmp-pcs-pcie-v5.h"
+#include "phy-qcom-qmp-pcs-usb-v5.h"
+#include "phy-qcom-qmp-pcs-ufs-v5.h"
+
 /* Only for QMP V3 & V4 PHY - DP COM registers */
 #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
 #define QPHY_V3_DP_COM_SW_RESET				0x04
@@ -334,20 +339,6 @@
 #define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH5_RATE3	0x218
 #define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH6_RATE3	0x220
 
-/* Only for QMP V5 PHY - USB/PCIe PCS registers */
-#define QPHY_V5_PCS_REFGEN_REQ_CONFIG1			0x0dc
-#define QPHY_V5_PCS_G3S2_PRE_GAIN			0x170
-#define QPHY_V5_PCS_RX_SIGDET_LVL			0x188
-#define QPHY_V5_PCS_RATE_SLEW_CNTRL1			0x198
-#define QPHY_V5_PCS_EQ_CONFIG2				0x1e0
-#define QPHY_V5_PCS_EQ_CONFIG3				0x1e4
-
-/* Only for QMP V5 PHY - PCS_PCIE registers */
-#define QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE		0x20
-#define QPHY_V5_PCS_PCIE_INT_AUX_CLK_CONFIG1		0x54
-#define QPHY_V5_PCS_PCIE_OSC_DTCT_ACTIONS		0x94
-#define QPHY_V5_PCS_PCIE_EQ_CONFIG2			0xa8
-
 /* Only for QMP V5_20 PHY - PCIe PCS registers */
 #define QPHY_V5_20_PCS_PCIE_ENDPOINT_REFCLK_DRIVE	0x01c
 #define QPHY_V5_20_PCS_PCIE_OSC_DTCT_ACTIONS		0x090
@@ -356,48 +347,4 @@
 #define QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN			0x15c
 #define QPHY_V5_20_PCS_PCIE_RX_MARGINING_CONFIG3	0x184
 
-/* Only for QMP V5 PHY - UFS PCS registers */
-#define QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB	0x00c
-#define QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB	0x010
-#define QPHY_V5_PCS_UFS_PLL_CNTL			0x02c
-#define QPHY_V5_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x030
-#define QPHY_V5_PCS_UFS_TX_SMALL_AMP_DRV_LVL		0x038
-#define QPHY_V5_PCS_UFS_TX_HSGEAR_CAPABILITY		0x074
-#define QPHY_V5_PCS_UFS_RX_HSGEAR_CAPABILITY		0x0b4
-#define QPHY_V5_PCS_UFS_DEBUG_BUS_CLKSEL		0x124
-#define QPHY_V5_PCS_UFS_RX_MIN_HIBERN8_TIME		0x150
-#define QPHY_V5_PCS_UFS_RX_SIGDET_CTRL1			0x154
-#define QPHY_V5_PCS_UFS_RX_SIGDET_CTRL2			0x158
-#define QPHY_V5_PCS_UFS_TX_PWM_GEAR_BAND		0x160
-#define QPHY_V5_PCS_UFS_TX_HS_GEAR_BAND			0x168
-#define QPHY_V5_PCS_UFS_TX_MID_TERM_CTRL1		0x1d8
-#define QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1		0x1e0
-
-/* Only for QMP V5 PHY - USB3 have different offsets than V4 */
-#define QPHY_V5_PCS_USB3_POWER_STATE_CONFIG1		0x000
-#define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_STATUS		0x004
-#define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x008
-#define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL2		0x00c
-#define QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_SOURCE_STATUS	0x010
-#define QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x014
-#define QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x018
-#define QPHY_V5_PCS_USB3_LFPS_TX_ECSTART		0x01c
-#define QPHY_V5_PCS_USB3_LFPS_PER_TIMER_VAL		0x020
-#define QPHY_V5_PCS_USB3_LFPS_TX_END_CNT_U3_START	0x024
-#define QPHY_V5_PCS_USB3_LFPS_CONFIG1			0x028
-#define QPHY_V5_PCS_USB3_RXEQTRAINING_LOCK_TIME		0x02c
-#define QPHY_V5_PCS_USB3_RXEQTRAINING_WAIT_TIME		0x030
-#define QPHY_V5_PCS_USB3_RXEQTRAINING_CTLE_TIME		0x034
-#define QPHY_V5_PCS_USB3_RXEQTRAINING_WAIT_TIME_S2	0x038
-#define QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x03c
-#define QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x040
-#define QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x044
-#define QPHY_V5_PCS_USB3_ARCVR_DTCT_EN_PERIOD		0x048
-#define QPHY_V5_PCS_USB3_ARCVR_DTCT_CM_DLY		0x04c
-#define QPHY_V5_PCS_USB3_TXONESZEROS_RUN_LENGTH		0x050
-#define QPHY_V5_PCS_USB3_ALFPS_DEGLITCH_VAL		0x054
-#define QPHY_V5_PCS_USB3_SIGDET_STARTUP_TIMER_VAL	0x058
-#define QPHY_V5_PCS_USB3_TEST_CONTROL			0x05c
-#define QPHY_V5_PCS_USB3_RXTERMINATION_DLY_SEL		0x060
-
 #endif
-- 
2.35.1

