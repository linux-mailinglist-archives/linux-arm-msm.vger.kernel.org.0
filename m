Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16D50546CF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350281AbiFJTJr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348272AbiFJTJq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:09:46 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96674E084
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:43 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id g25so149667ljm.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lMgA+e+MCVOMmv5NMTbodP+oS8qy0A0ShIwGhb8nn0U=;
        b=AsrWiuf/DvddElmNczIKHJ0VKYbYPFB6dk6ZX8wo+mgpSSSx+qS3kFtl4XGEBSf0mh
         UjtERxxHdPr/dgawyJX+/ZZsrpQ/AHLcBsi6A9vgL/NqA93+AKDNNVmGX8CQ5u4lGAF0
         cozNEpthrJ0REhcXsjFsnU3zYyCgeYLe64dx1lG8/WFyHPYFWL5UqweyZLHUn4xJrlA5
         0jbDed8Z4qRJtX63hTTVgJY+o6XfvpMDzgrV6vVz3FY+DR6ZJnZR+CDhY3ODuYZAjB0d
         X+9GNGrFqKAKqB4OZiCoevQLWoYU+VjH7F0JU2uOzE8AVOp1TehQ8YZ5+UGE2kZGupgy
         fDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lMgA+e+MCVOMmv5NMTbodP+oS8qy0A0ShIwGhb8nn0U=;
        b=5NF/HrqvVU17QJSkbEWQ5RU1QDk4iSMoIh5Gtj0CXBIQy7QubJ1HpczhdANpbsNIpg
         rCokviVg7Ioo5M2BbkRaW0/7SqLZ62LxcIoaWmeJalFlTO6GMnKn0VFBpfHqWrmhxI6L
         0RPAfsyfef57SRYYBeG01RWAnqQE4zMjaMkKx8Z57VGCS1K8arstNrkqAIHtjmRJkArW
         7/rQwtKOAr3+pZ4hBxHfI1rtl7Ug7gU4TQfeVIORj2gyctiPrX4NRV04Hy6i2fpdBl9D
         wIFxXZmFt0dKu9VTh2Cyg1MkZgGIfKci0AkLENgBjkG0rJmRis9M7LL/AyvA4QqXDqc2
         Gwqg==
X-Gm-Message-State: AOAM533pyap5mH7hcRBO5QWzVPj9SWr0X/7ZZykYd2gGJGsLPG5FpV5M
        MdQLH094q3332dE2/RnPvhahVg==
X-Google-Smtp-Source: ABdhPJxHt9TqOtKju/VqQDY4nzdMA33wjr7GdnnjZPe6T6yEmGFk6NBR6uo1wkbzZG4FEbUZ9Dk0VA==
X-Received: by 2002:a2e:83c9:0:b0:24d:a95d:7b7a with SMTP id s9-20020a2e83c9000000b0024da95d7b7amr63578249ljh.254.1654888183125;
        Fri, 10 Jun 2022 12:09:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:09:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 10/28] phy: qcom-qmp: move QSERDES V4 registers to separate headers
Date:   Fri, 10 Jun 2022 22:09:07 +0300
Message-Id: <20220610190925.3670081-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
References: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move QSERDES V4 registers to the separate headers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../qualcomm/phy-qcom-qmp-qserdes-com-v4.h    |  78 +++++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h   |  92 +++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 154 +-----------------
 3 files changed, 173 insertions(+), 151 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v4.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v4.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v4.h
new file mode 100644
index 000000000000..af8662ca9ee0
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v4.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V4_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V4_H_
+
+/* Only for QMP V4 PHY - QSERDES COM registers */
+#define QSERDES_V4_COM_BG_TIMER				0x00c
+#define QSERDES_V4_COM_SSC_EN_CENTER			0x010
+#define QSERDES_V4_COM_SSC_ADJ_PER1			0x014
+#define QSERDES_V4_COM_SSC_PER1				0x01c
+#define QSERDES_V4_COM_SSC_PER2				0x020
+#define QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0		0x024
+#define QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0		0x028
+#define QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1		0x030
+#define QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1		0x034
+#define QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN		0x044
+#define QSERDES_V4_COM_CLK_ENABLE1			0x048
+#define QSERDES_V4_COM_SYS_CLK_CTRL			0x04c
+#define QSERDES_V4_COM_SYSCLK_BUF_ENABLE		0x050
+#define QSERDES_V4_COM_PLL_IVCO				0x058
+#define QSERDES_V4_COM_CMN_IPTRIM			0x060
+#define QSERDES_V4_COM_CP_CTRL_MODE0			0x074
+#define QSERDES_V4_COM_CP_CTRL_MODE1			0x078
+#define QSERDES_V4_COM_PLL_RCTRL_MODE0			0x07c
+#define QSERDES_V4_COM_PLL_RCTRL_MODE1			0x080
+#define QSERDES_V4_COM_PLL_CCTRL_MODE0			0x084
+#define QSERDES_V4_COM_PLL_CCTRL_MODE1			0x088
+#define QSERDES_V4_COM_SYSCLK_EN_SEL			0x094
+#define QSERDES_V4_COM_RESETSM_CNTRL			0x09c
+#define QSERDES_V4_COM_LOCK_CMP_EN			0x0a4
+#define QSERDES_V4_COM_LOCK_CMP_CFG			0x0a8
+#define QSERDES_V4_COM_LOCK_CMP1_MODE0			0x0ac
+#define QSERDES_V4_COM_LOCK_CMP2_MODE0			0x0b0
+#define QSERDES_V4_COM_LOCK_CMP1_MODE1			0x0b4
+#define QSERDES_V4_COM_LOCK_CMP2_MODE1			0x0b8
+#define QSERDES_V4_COM_DEC_START_MODE0			0x0bc
+#define QSERDES_V4_COM_DEC_START_MODE1			0x0c4
+#define QSERDES_V4_COM_DIV_FRAC_START1_MODE0		0x0cc
+#define QSERDES_V4_COM_DIV_FRAC_START2_MODE0		0x0d0
+#define QSERDES_V4_COM_DIV_FRAC_START3_MODE0		0x0d4
+#define QSERDES_V4_COM_DIV_FRAC_START1_MODE1		0x0d8
+#define QSERDES_V4_COM_DIV_FRAC_START2_MODE1		0x0dc
+#define QSERDES_V4_COM_DIV_FRAC_START3_MODE1		0x0e0
+#define QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0		0x0ec
+#define QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0		0x0f0
+#define QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE1		0x0f4
+#define QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE1		0x0f8
+#define QSERDES_V4_COM_VCO_TUNE_CTRL			0x108
+#define QSERDES_V4_COM_VCO_TUNE_MAP			0x10c
+#define QSERDES_V4_COM_VCO_TUNE1_MODE0			0x110
+#define QSERDES_V4_COM_VCO_TUNE2_MODE0			0x114
+#define QSERDES_V4_COM_VCO_TUNE1_MODE1			0x118
+#define QSERDES_V4_COM_VCO_TUNE2_MODE1			0x11c
+#define QSERDES_V4_COM_VCO_TUNE_INITVAL2		0x124
+#define QSERDES_V4_COM_CMN_STATUS			0x140
+#define QSERDES_V4_COM_CLK_SELECT			0x154
+#define QSERDES_V4_COM_HSCLK_SEL			0x158
+#define QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL		0x15c
+#define QSERDES_V4_COM_CORECLK_DIV_MODE0		0x168
+#define QSERDES_V4_COM_CORECLK_DIV_MODE1		0x16c
+#define QSERDES_V4_COM_CORE_CLK_EN			0x174
+#define QSERDES_V4_COM_C_READY_STATUS			0x178
+#define QSERDES_V4_COM_CMN_CONFIG			0x17c
+#define QSERDES_V4_COM_SVS_MODE_CLK_SEL			0x184
+#define QSERDES_V4_COM_CMN_MISC1			0x19c
+#define QSERDES_V4_COM_INTERNAL_DIG_CORECLK_DIV		0x1a0
+#define QSERDES_V4_COM_CMN_MODE				0x1a4
+#define QSERDES_V4_COM_VCO_DC_LEVEL_CTRL		0x1a8
+#define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
+#define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
+#define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1	0x1b4
+#define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1	0x1b8
+#define QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL		0x1bc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h
new file mode 100644
index 000000000000..1716932bdf1a
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V4_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V4_H_
+
+/* Only for QMP V4 PHY - TX registers */
+#define QSERDES_V4_TX_CLKBUF_ENABLE			0x008
+#define QSERDES_V4_TX_TX_EMP_POST1_LVL			0x00c
+#define QSERDES_V4_TX_TX_DRV_LVL			0x014
+#define QSERDES_V4_TX_RESET_TSYNC_EN			0x01c
+#define QSERDES_V4_TX_PRE_STALL_LDO_BOOST_EN		0x020
+#define QSERDES_V4_TX_TX_BAND				0x024
+#define QSERDES_V4_TX_INTERFACE_SELECT			0x02c
+#define QSERDES_V4_TX_RES_CODE_LANE_TX			0x034
+#define QSERDES_V4_TX_RES_CODE_LANE_RX			0x038
+#define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX		0x03c
+#define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX		0x040
+#define QSERDES_V4_TX_TRANSCEIVER_BIAS_EN		0x054
+#define QSERDES_V4_TX_HIGHZ_DRVR_EN			0x058
+#define QSERDES_V4_TX_TX_POL_INV			0x05c
+#define QSERDES_V4_TX_PARRATE_REC_DETECT_IDLE_EN	0x060
+#define QSERDES_V4_TX_LANE_MODE_1			0x084
+#define QSERDES_V4_TX_LANE_MODE_2			0x088
+#define QSERDES_V4_TX_RCV_DETECT_LVL_2			0x09c
+#define QSERDES_V4_TX_TRAN_DRVR_EMP_EN			0x0b8
+#define QSERDES_V4_TX_TX_INTERFACE_MODE			0x0bc
+#define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0x0d8
+#define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0x0dc
+#define QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1	0x0e0
+#define QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1	0x0e4
+#define QSERDES_V4_TX_VMODE_CTRL1			0x0e8
+#define QSERDES_V4_TX_PI_QEC_CTRL			0x104
+
+/* Only for QMP V4 PHY - RX registers */
+#define QSERDES_V4_RX_UCDR_FO_GAIN			0x008
+#define QSERDES_V4_RX_UCDR_SO_GAIN			0x014
+#define QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN		0x030
+#define QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE	0x034
+#define QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW		0x03c
+#define QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH		0x040
+#define QSERDES_V4_RX_UCDR_PI_CONTROLS			0x044
+#define QSERDES_V4_RX_UCDR_PI_CTRL2			0x048
+#define QSERDES_V4_RX_UCDR_SB2_THRESH1			0x04c
+#define QSERDES_V4_RX_UCDR_SB2_THRESH2			0x050
+#define QSERDES_V4_RX_UCDR_SB2_GAIN1			0x054
+#define QSERDES_V4_RX_UCDR_SB2_GAIN2			0x058
+#define QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE		0x060
+#define QSERDES_V4_RX_RCLK_AUXDATA_SEL			0x064
+#define QSERDES_V4_RX_AC_JTAG_ENABLE			0x068
+#define QSERDES_V4_RX_AC_JTAG_MODE			0x078
+#define QSERDES_V4_RX_RX_TERM_BW			0x080
+#define QSERDES_V4_RX_VGA_CAL_CNTRL1			0x0d4
+#define QSERDES_V4_RX_VGA_CAL_CNTRL2			0x0d8
+#define QSERDES_V4_RX_GM_CAL				0x0dc
+#define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL1		0x0e8
+#define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2		0x0ec
+#define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3		0x0f0
+#define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4		0x0f4
+#define QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW		0x0f8
+#define QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH		0x0fc
+#define QSERDES_V4_RX_RX_IDAC_MEASURE_TIME		0x100
+#define QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x110
+#define QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x114
+#define QSERDES_V4_RX_SIGDET_ENABLES			0x118
+#define QSERDES_V4_RX_SIGDET_CNTRL			0x11c
+#define QSERDES_V4_RX_SIGDET_LVL			0x120
+#define QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL		0x124
+#define QSERDES_V4_RX_RX_BAND				0x128
+#define QSERDES_V4_RX_RX_MODE_00_LOW			0x170
+#define QSERDES_V4_RX_RX_MODE_00_HIGH			0x174
+#define QSERDES_V4_RX_RX_MODE_00_HIGH2			0x178
+#define QSERDES_V4_RX_RX_MODE_00_HIGH3			0x17c
+#define QSERDES_V4_RX_RX_MODE_00_HIGH4			0x180
+#define QSERDES_V4_RX_RX_MODE_01_LOW			0x184
+#define QSERDES_V4_RX_RX_MODE_01_HIGH			0x188
+#define QSERDES_V4_RX_RX_MODE_01_HIGH2			0x18c
+#define QSERDES_V4_RX_RX_MODE_01_HIGH3			0x190
+#define QSERDES_V4_RX_RX_MODE_01_HIGH4			0x194
+#define QSERDES_V4_RX_RX_MODE_10_LOW			0x198
+#define QSERDES_V4_RX_RX_MODE_10_HIGH			0x19c
+#define QSERDES_V4_RX_RX_MODE_10_HIGH2			0x1a0
+#define QSERDES_V4_RX_RX_MODE_10_HIGH3			0x1a4
+#define QSERDES_V4_RX_RX_MODE_10_HIGH4			0x1a8
+#define QSERDES_V4_RX_DFE_EN_TIMER			0x1b4
+#define QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET		0x1b8
+#define QSERDES_V4_RX_DCC_CTRL1				0x1bc
+#define QSERDES_V4_RX_VTH_CODE				0x1c4
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 19bbe5aa9354..6e890459b44e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -12,6 +12,9 @@
 #include "phy-qcom-qmp-qserdes-com-v3.h"
 #include "phy-qcom-qmp-qserdes-txrx-v3.h"
 
+#include "phy-qcom-qmp-qserdes-com-v4.h"
+#include "phy-qcom-qmp-qserdes-txrx-v4.h"
+
 /* QMP V2 PHY for PCIE gen3 ports - QSERDES PLL registers */
 
 #define QSERDES_PLL_BG_TIMER				0x00c
@@ -240,102 +243,6 @@
 
 #define QSERDES_V3_DP_PHY_STATUS			0x0c0
 
-/* Only for QMP V4 PHY - QSERDES COM registers */
-#define QSERDES_V4_COM_BG_TIMER				0x00c
-#define QSERDES_V4_COM_SSC_EN_CENTER			0x010
-#define QSERDES_V4_COM_SSC_ADJ_PER1			0x014
-#define QSERDES_V4_COM_SSC_PER1				0x01c
-#define QSERDES_V4_COM_SSC_PER2				0x020
-#define QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0		0x024
-#define QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0		0x028
-#define QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1		0x030
-#define QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1		0x034
-#define QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN		0x044
-#define QSERDES_V4_COM_CLK_ENABLE1			0x048
-#define QSERDES_V4_COM_SYS_CLK_CTRL			0x04c
-#define QSERDES_V4_COM_SYSCLK_BUF_ENABLE		0x050
-#define QSERDES_V4_COM_PLL_IVCO				0x058
-#define QSERDES_V4_COM_CMN_IPTRIM			0x060
-#define QSERDES_V4_COM_CP_CTRL_MODE0			0x074
-#define QSERDES_V4_COM_CP_CTRL_MODE1			0x078
-#define QSERDES_V4_COM_PLL_RCTRL_MODE0			0x07c
-#define QSERDES_V4_COM_PLL_RCTRL_MODE1			0x080
-#define QSERDES_V4_COM_PLL_CCTRL_MODE0			0x084
-#define QSERDES_V4_COM_PLL_CCTRL_MODE1			0x088
-#define QSERDES_V4_COM_SYSCLK_EN_SEL			0x094
-#define QSERDES_V4_COM_RESETSM_CNTRL			0x09c
-#define QSERDES_V4_COM_LOCK_CMP_EN			0x0a4
-#define QSERDES_V4_COM_LOCK_CMP_CFG			0x0a8
-#define QSERDES_V4_COM_LOCK_CMP1_MODE0			0x0ac
-#define QSERDES_V4_COM_LOCK_CMP2_MODE0			0x0b0
-#define QSERDES_V4_COM_LOCK_CMP1_MODE1			0x0b4
-#define QSERDES_V4_COM_LOCK_CMP2_MODE1			0x0b8
-#define QSERDES_V4_COM_DEC_START_MODE0			0x0bc
-#define QSERDES_V4_COM_DEC_START_MODE1			0x0c4
-#define QSERDES_V4_COM_DIV_FRAC_START1_MODE0		0x0cc
-#define QSERDES_V4_COM_DIV_FRAC_START2_MODE0		0x0d0
-#define QSERDES_V4_COM_DIV_FRAC_START3_MODE0		0x0d4
-#define QSERDES_V4_COM_DIV_FRAC_START1_MODE1		0x0d8
-#define QSERDES_V4_COM_DIV_FRAC_START2_MODE1		0x0dc
-#define QSERDES_V4_COM_DIV_FRAC_START3_MODE1		0x0e0
-#define QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0		0x0ec
-#define QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0		0x0f0
-#define QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE1		0x0f4
-#define QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE1		0x0f8
-#define QSERDES_V4_COM_VCO_TUNE_CTRL			0x108
-#define QSERDES_V4_COM_VCO_TUNE_MAP			0x10c
-#define QSERDES_V4_COM_VCO_TUNE1_MODE0			0x110
-#define QSERDES_V4_COM_VCO_TUNE2_MODE0			0x114
-#define QSERDES_V4_COM_VCO_TUNE1_MODE1			0x118
-#define QSERDES_V4_COM_VCO_TUNE2_MODE1			0x11c
-#define QSERDES_V4_COM_VCO_TUNE_INITVAL2		0x124
-#define QSERDES_V4_COM_CMN_STATUS			0x140
-#define QSERDES_V4_COM_CLK_SELECT			0x154
-#define QSERDES_V4_COM_HSCLK_SEL			0x158
-#define QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL		0x15c
-#define QSERDES_V4_COM_CORECLK_DIV_MODE0		0x168
-#define QSERDES_V4_COM_CORECLK_DIV_MODE1		0x16c
-#define QSERDES_V4_COM_CORE_CLK_EN			0x174
-#define QSERDES_V4_COM_C_READY_STATUS			0x178
-#define QSERDES_V4_COM_CMN_CONFIG			0x17c
-#define QSERDES_V4_COM_SVS_MODE_CLK_SEL			0x184
-#define QSERDES_V4_COM_CMN_MISC1			0x19c
-#define QSERDES_V4_COM_INTERNAL_DIG_CORECLK_DIV		0x1a0
-#define QSERDES_V4_COM_CMN_MODE				0x1a4
-#define QSERDES_V4_COM_VCO_DC_LEVEL_CTRL		0x1a8
-#define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
-#define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
-#define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1	0x1b4
-#define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1	0x1b8
-#define QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL		0x1bc
-
-/* Only for QMP V4 PHY - TX registers */
-#define QSERDES_V4_TX_CLKBUF_ENABLE			0x08
-#define QSERDES_V4_TX_TX_EMP_POST1_LVL			0x0c
-#define QSERDES_V4_TX_TX_DRV_LVL			0x14
-#define QSERDES_V4_TX_RESET_TSYNC_EN			0x1c
-#define QSERDES_V4_TX_PRE_STALL_LDO_BOOST_EN		0x20
-#define QSERDES_V4_TX_TX_BAND				0x24
-#define QSERDES_V4_TX_INTERFACE_SELECT			0x2c
-#define QSERDES_V4_TX_RES_CODE_LANE_TX			0x34
-#define QSERDES_V4_TX_RES_CODE_LANE_RX			0x38
-#define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX		0x3c
-#define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX		0x40
-#define QSERDES_V4_TX_TRANSCEIVER_BIAS_EN		0x54
-#define QSERDES_V4_TX_HIGHZ_DRVR_EN			0x58
-#define QSERDES_V4_TX_TX_POL_INV			0x5c
-#define QSERDES_V4_TX_PARRATE_REC_DETECT_IDLE_EN	0x60
-#define QSERDES_V4_TX_LANE_MODE_1			0x84
-#define QSERDES_V4_TX_LANE_MODE_2			0x88
-#define QSERDES_V4_TX_RCV_DETECT_LVL_2			0x9c
-#define QSERDES_V4_TX_TRAN_DRVR_EMP_EN			0xb8
-#define QSERDES_V4_TX_TX_INTERFACE_MODE			0xbc
-#define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0xd8
-#define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0xdc
-#define QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1	0xe0
-#define QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1	0xe4
-#define QSERDES_V4_TX_VMODE_CTRL1			0xe8
-#define QSERDES_V4_TX_PI_QEC_CTRL			0x104
 
 /* Only for QMP V4_20 PHY - TX registers */
 #define QSERDES_V4_20_TX_LANE_MODE_1			0x88
@@ -344,61 +251,6 @@
 #define QSERDES_V4_20_TX_VMODE_CTRL1			0xc4
 #define QSERDES_V4_20_TX_PI_QEC_CTRL			0xe0
 
-/* Only for QMP V4 PHY - RX registers */
-#define QSERDES_V4_RX_UCDR_FO_GAIN			0x008
-#define QSERDES_V4_RX_UCDR_SO_GAIN			0x014
-#define QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN		0x030
-#define QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE	0x034
-#define QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW		0x03c
-#define QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH		0x040
-#define QSERDES_V4_RX_UCDR_PI_CONTROLS			0x044
-#define QSERDES_V4_RX_UCDR_PI_CTRL2			0x048
-#define QSERDES_V4_RX_UCDR_SB2_THRESH1			0x04c
-#define QSERDES_V4_RX_UCDR_SB2_THRESH2			0x050
-#define QSERDES_V4_RX_UCDR_SB2_GAIN1			0x054
-#define QSERDES_V4_RX_UCDR_SB2_GAIN2			0x058
-#define QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE		0x060
-#define QSERDES_V4_RX_RCLK_AUXDATA_SEL			0x064
-#define QSERDES_V4_RX_AC_JTAG_ENABLE			0x068
-#define QSERDES_V4_RX_AC_JTAG_MODE			0x078
-#define QSERDES_V4_RX_RX_TERM_BW			0x080
-#define QSERDES_V4_RX_VGA_CAL_CNTRL1			0x0d4
-#define QSERDES_V4_RX_VGA_CAL_CNTRL2			0x0d8
-#define QSERDES_V4_RX_GM_CAL				0x0dc
-#define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL1		0x0e8
-#define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2		0x0ec
-#define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3		0x0f0
-#define QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4		0x0f4
-#define QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW		0x0f8
-#define QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH		0x0fc
-#define QSERDES_V4_RX_RX_IDAC_MEASURE_TIME		0x100
-#define QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x110
-#define QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x114
-#define QSERDES_V4_RX_SIGDET_ENABLES			0x118
-#define QSERDES_V4_RX_SIGDET_CNTRL			0x11c
-#define QSERDES_V4_RX_SIGDET_LVL			0x120
-#define QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL		0x124
-#define QSERDES_V4_RX_RX_BAND				0x128
-#define QSERDES_V4_RX_RX_MODE_00_LOW			0x170
-#define QSERDES_V4_RX_RX_MODE_00_HIGH			0x174
-#define QSERDES_V4_RX_RX_MODE_00_HIGH2			0x178
-#define QSERDES_V4_RX_RX_MODE_00_HIGH3			0x17c
-#define QSERDES_V4_RX_RX_MODE_00_HIGH4			0x180
-#define QSERDES_V4_RX_RX_MODE_01_LOW			0x184
-#define QSERDES_V4_RX_RX_MODE_01_HIGH			0x188
-#define QSERDES_V4_RX_RX_MODE_01_HIGH2			0x18c
-#define QSERDES_V4_RX_RX_MODE_01_HIGH3			0x190
-#define QSERDES_V4_RX_RX_MODE_01_HIGH4			0x194
-#define QSERDES_V4_RX_RX_MODE_10_LOW			0x198
-#define QSERDES_V4_RX_RX_MODE_10_HIGH			0x19c
-#define QSERDES_V4_RX_RX_MODE_10_HIGH2			0x1a0
-#define QSERDES_V4_RX_RX_MODE_10_HIGH3			0x1a4
-#define QSERDES_V4_RX_RX_MODE_10_HIGH4			0x1a8
-#define QSERDES_V4_RX_DFE_EN_TIMER			0x1b4
-#define QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET		0x1b8
-#define QSERDES_V4_RX_DCC_CTRL1				0x1bc
-#define QSERDES_V4_RX_VTH_CODE				0x1c4
-
 /* Only for QMP V4 PHY - DP PHY registers */
 #define QSERDES_V4_DP_PHY_CFG_1				0x014
 #define QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK		0x054
-- 
2.35.1

