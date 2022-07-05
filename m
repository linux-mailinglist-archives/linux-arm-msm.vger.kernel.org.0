Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59A5756665F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiGEJnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbiGEJnd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:33 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB451094
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:30 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g11so4365986lfb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d7CuEUzPLQxbs5/KWPT5RNINsovdm/Sk7PKgWq5SZ9M=;
        b=ZqzRxjPg8WVBwshC6W6TLw5Vnp9OyHrHTPerNRHIYsy6ziJ6yuSX3eZhsD+TlzYGvw
         qMLjKfRZir+S5/dww3aObXFo7ndkDPhfZi5sG9Oh3xaaElTm7fxjhivyEq5cPgi9yo6s
         4UmVD0jaMwm0c7Bs6jEVmUXsqjSkUl5beRt2niQFIKBBfVuwaFAiL+AX8DVAzGwGO1Ce
         yy1hbdrWEdHGa8zRzl4hfH15NeUagcfJcVV3X7Fif8byYiYASeS7Mdx9rfrJ/MKO/v2/
         rF7CzbpVtWv4AkzXkIG56AXYR0V5ayliQrcP8m56IPOVwSTI/ewDd/HNVnotAslJd2qS
         R1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d7CuEUzPLQxbs5/KWPT5RNINsovdm/Sk7PKgWq5SZ9M=;
        b=YH1RcobFM/FQ+rDoRW04BVPjAL9cetFgBKMOFyA/tkOFCiLLeCu4tq36wdrU5M0mOL
         JdckKGDNeF7CjgU90BA/dTVqrnxGbmFGuj0jZ3xkIQ5253D+KDtJxNFE2MKcCXSzhmI9
         zn0gKZn1WO9jv7OlgCXBHxw6MIbQCamQUukDT19YVwJ76mCAFS7QeLTSYaVVL8Qvd2Zf
         p1qxtYKtPnCFNgHGJaYbt7GbbIcP7ZxzdR6I4kxsPffidK9mVB6dJYjEox/LuC5f4rDW
         tlRsQSi+dh8VafeDpDgmzH4/DI7HRspkClaVD8I+UtV+rjiAGSE9w/JkzNojgbKg78jO
         kvCw==
X-Gm-Message-State: AJIora8oBgRnZdsz/4roW6JO8ZX+NPJrGXFYSgJyygtZ5ccT7phmKbGQ
        oOMMcUFo/MEO8KigqwJBsIEYCA==
X-Google-Smtp-Source: AGRyM1ubn6FTyW6LUD0FXCRQtD68f2Sgv82vyK9S25LHKeHOFs3qcq1UlNAbI4uPF+ftwj/qaY6DZw==
X-Received: by 2002:a05:6512:2255:b0:47f:6591:354b with SMTP id i21-20020a056512225500b0047f6591354bmr23354207lfu.191.1657014208784;
        Tue, 05 Jul 2022 02:43:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 09/28] phy: qcom-qmp: move QSERDES V3 registers to separate headers
Date:   Tue,  5 Jul 2022 12:43:01 +0300
Message-Id: <20220705094320.1313312-10-dmitry.baryshkov@linaro.org>
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

Move QSERDES V3 registers to the separate headers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../qualcomm/phy-qcom-qmp-qserdes-com-v3.h    |  86 +++++++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v3.h   |  65 +++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 138 +-----------------
 3 files changed, 156 insertions(+), 133 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v3.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v3.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v3.h
new file mode 100644
index 000000000000..a61f8d36d01e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v3.h
@@ -0,0 +1,86 @@
+
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V3_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V3_H_
+
+/* Only for QMP V3 PHY - QSERDES COM registers */
+#define QSERDES_V3_COM_ATB_SEL1				0x000
+#define QSERDES_V3_COM_ATB_SEL2				0x004
+#define QSERDES_V3_COM_FREQ_UPDATE			0x008
+#define QSERDES_V3_COM_BG_TIMER				0x00c
+#define QSERDES_V3_COM_SSC_EN_CENTER			0x010
+#define QSERDES_V3_COM_SSC_ADJ_PER1			0x014
+#define QSERDES_V3_COM_SSC_ADJ_PER2			0x018
+#define QSERDES_V3_COM_SSC_PER1				0x01c
+#define QSERDES_V3_COM_SSC_PER2				0x020
+#define QSERDES_V3_COM_SSC_STEP_SIZE1			0x024
+#define QSERDES_V3_COM_SSC_STEP_SIZE2			0x028
+#define QSERDES_V3_COM_POST_DIV				0x02c
+#define QSERDES_V3_COM_POST_DIV_MUX			0x030
+#define QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN		0x034
+#define QSERDES_V3_COM_CLK_ENABLE1			0x038
+#define QSERDES_V3_COM_SYS_CLK_CTRL			0x03c
+#define QSERDES_V3_COM_SYSCLK_BUF_ENABLE		0x040
+#define QSERDES_V3_COM_PLL_EN				0x044
+#define QSERDES_V3_COM_PLL_IVCO				0x048
+#define QSERDES_V3_COM_CLK_EP_DIV			0x05c
+#define QSERDES_V3_COM_CP_CTRL_MODE0			0x060
+#define QSERDES_V3_COM_CP_CTRL_MODE1			0x064
+#define QSERDES_V3_COM_PLL_RCTRL_MODE0			0x068
+#define QSERDES_V3_COM_PLL_RCTRL_MODE1			0x06c
+#define QSERDES_V3_COM_PLL_CCTRL_MODE0			0x070
+#define QSERDES_V3_COM_PLL_CCTRL_MODE1			0x074
+#define QSERDES_V3_COM_SYSCLK_EN_SEL			0x080
+#define QSERDES_V3_COM_RESETSM_CNTRL			0x088
+#define QSERDES_V3_COM_RESETSM_CNTRL2			0x08c
+#define QSERDES_V3_COM_LOCK_CMP_EN			0x090
+#define QSERDES_V3_COM_LOCK_CMP_CFG			0x094
+#define QSERDES_V3_COM_LOCK_CMP1_MODE0			0x098
+#define QSERDES_V3_COM_LOCK_CMP2_MODE0			0x09c
+#define QSERDES_V3_COM_LOCK_CMP3_MODE0			0x0a0
+#define QSERDES_V3_COM_LOCK_CMP1_MODE1			0x0a4
+#define QSERDES_V3_COM_LOCK_CMP2_MODE1			0x0a8
+#define QSERDES_V3_COM_LOCK_CMP3_MODE1			0x0ac
+#define QSERDES_V3_COM_DEC_START_MODE0			0x0b0
+#define QSERDES_V3_COM_DEC_START_MODE1			0x0b4
+#define QSERDES_V3_COM_DIV_FRAC_START1_MODE0		0x0b8
+#define QSERDES_V3_COM_DIV_FRAC_START2_MODE0		0x0bc
+#define QSERDES_V3_COM_DIV_FRAC_START3_MODE0		0x0c0
+#define QSERDES_V3_COM_DIV_FRAC_START1_MODE1		0x0c4
+#define QSERDES_V3_COM_DIV_FRAC_START2_MODE1		0x0c8
+#define QSERDES_V3_COM_DIV_FRAC_START3_MODE1		0x0cc
+#define QSERDES_V3_COM_INTEGLOOP_INITVAL		0x0d0
+#define QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0		0x0d8
+#define QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0		0x0dc
+#define QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE1		0x0e0
+#define QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE1		0x0e4
+#define QSERDES_V3_COM_VCO_TUNE_CTRL			0x0ec
+#define QSERDES_V3_COM_VCO_TUNE_MAP			0x0f0
+#define QSERDES_V3_COM_VCO_TUNE1_MODE0			0x0f4
+#define QSERDES_V3_COM_VCO_TUNE2_MODE0			0x0f8
+#define QSERDES_V3_COM_VCO_TUNE1_MODE1			0x0fc
+#define QSERDES_V3_COM_VCO_TUNE2_MODE1			0x100
+#define QSERDES_V3_COM_VCO_TUNE_INITVAL1		0x104
+#define QSERDES_V3_COM_VCO_TUNE_INITVAL2		0x108
+#define QSERDES_V3_COM_VCO_TUNE_TIMER1			0x11c
+#define QSERDES_V3_COM_VCO_TUNE_TIMER2			0x120
+#define QSERDES_V3_COM_CLK_SELECT			0x138
+#define QSERDES_V3_COM_HSCLK_SEL			0x13c
+#define QSERDES_V3_COM_CORECLK_DIV_MODE0		0x148
+#define QSERDES_V3_COM_CORECLK_DIV_MODE1		0x14c
+#define QSERDES_V3_COM_CORE_CLK_EN			0x154
+#define QSERDES_V3_COM_C_READY_STATUS			0x158
+#define QSERDES_V3_COM_CMN_CONFIG			0x15c
+#define QSERDES_V3_COM_SVS_MODE_CLK_SEL			0x164
+#define QSERDES_V3_COM_DEBUG_BUS0			0x168
+#define QSERDES_V3_COM_DEBUG_BUS1			0x16c
+#define QSERDES_V3_COM_DEBUG_BUS2			0x170
+#define QSERDES_V3_COM_DEBUG_BUS3			0x174
+#define QSERDES_V3_COM_DEBUG_BUS_SEL			0x178
+#define QSERDES_V3_COM_CMN_MODE				0x184
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v3.h
new file mode 100644
index 000000000000..2c7238df38d7
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v3.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V3_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V3_H_
+
+/* Only for QMP V3 PHY - TX registers */
+#define QSERDES_V3_TX_BIST_MODE_LANENO			0x000
+#define QSERDES_V3_TX_CLKBUF_ENABLE			0x008
+#define QSERDES_V3_TX_TX_EMP_POST1_LVL			0x00c
+#define QSERDES_V3_TX_TX_DRV_LVL			0x01c
+#define QSERDES_V3_TX_RESET_TSYNC_EN			0x024
+#define QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN		0x028
+#define QSERDES_V3_TX_TX_BAND				0x02c
+#define QSERDES_V3_TX_SLEW_CNTL				0x030
+#define QSERDES_V3_TX_INTERFACE_SELECT			0x034
+#define QSERDES_V3_TX_RES_CODE_LANE_TX			0x03c
+#define QSERDES_V3_TX_RES_CODE_LANE_RX			0x040
+#define QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX		0x044
+#define QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX		0x048
+#define QSERDES_V3_TX_DEBUG_BUS_SEL			0x058
+#define QSERDES_V3_TX_TRANSCEIVER_BIAS_EN		0x05c
+#define QSERDES_V3_TX_HIGHZ_DRVR_EN			0x060
+#define QSERDES_V3_TX_TX_POL_INV			0x064
+#define QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN	0x068
+#define QSERDES_V3_TX_LANE_MODE_1			0x08c
+#define QSERDES_V3_TX_RCV_DETECT_LVL_2			0x0a4
+#define QSERDES_V3_TX_TRAN_DRVR_EMP_EN			0x0c0
+#define QSERDES_V3_TX_TX_INTERFACE_MODE			0x0c4
+#define QSERDES_V3_TX_VMODE_CTRL1			0x0f0
+
+/* Only for QMP V3 PHY - RX registers */
+#define QSERDES_V3_RX_UCDR_FO_GAIN			0x008
+#define QSERDES_V3_RX_UCDR_SO_GAIN_HALF			0x00c
+#define QSERDES_V3_RX_UCDR_SO_GAIN			0x014
+#define QSERDES_V3_RX_UCDR_SVS_SO_GAIN_HALF		0x024
+#define QSERDES_V3_RX_UCDR_SVS_SO_GAIN_QUARTER		0x028
+#define QSERDES_V3_RX_UCDR_SVS_SO_GAIN			0x02c
+#define QSERDES_V3_RX_UCDR_FASTLOCK_FO_GAIN		0x030
+#define QSERDES_V3_RX_UCDR_SO_SATURATION_AND_ENABLE	0x034
+#define QSERDES_V3_RX_UCDR_FASTLOCK_COUNT_LOW		0x03c
+#define QSERDES_V3_RX_UCDR_FASTLOCK_COUNT_HIGH		0x040
+#define QSERDES_V3_RX_UCDR_PI_CONTROLS			0x044
+#define QSERDES_V3_RX_RX_TERM_BW			0x07c
+#define QSERDES_V3_RX_VGA_CAL_CNTRL1			0x0bc
+#define QSERDES_V3_RX_VGA_CAL_CNTRL2			0x0c0
+#define QSERDES_V3_RX_RX_EQ_GAIN2_LSB			0x0c8
+#define QSERDES_V3_RX_RX_EQ_GAIN2_MSB			0x0cc
+#define QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2		0x0d4
+#define QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL3		0x0d8
+#define QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL4		0x0dc
+#define QSERDES_V3_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x0f8
+#define QSERDES_V3_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x0fc
+#define QSERDES_V3_RX_SIGDET_ENABLES			0x100
+#define QSERDES_V3_RX_SIGDET_CNTRL			0x104
+#define QSERDES_V3_RX_SIGDET_LVL			0x108
+#define QSERDES_V3_RX_SIGDET_DEGLITCH_CNTRL		0x10c
+#define QSERDES_V3_RX_RX_BAND				0x110
+#define QSERDES_V3_RX_RX_INTERFACE_MODE			0x11c
+#define QSERDES_V3_RX_RX_MODE_00			0x164
+#define QSERDES_V3_RX_RX_MODE_01			0x168
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 6a24d61098e7..19bbe5aa9354 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -9,6 +9,9 @@
 #include "phy-qcom-qmp-qserdes-com.h"
 #include "phy-qcom-qmp-qserdes-txrx.h"
 
+#include "phy-qcom-qmp-qserdes-com-v3.h"
+#include "phy-qcom-qmp-qserdes-txrx-v3.h"
+
 /* QMP V2 PHY for PCIE gen3 ports - QSERDES PLL registers */
 
 #define QSERDES_PLL_BG_TIMER				0x00c
@@ -105,21 +108,7 @@
 #define QPHY_V3_DP_COM_TYPEC_PWRDN_CTRL			0x14
 #define QPHY_V3_DP_COM_RESET_OVRD_CTRL			0x1c
 
-/* Only for QMP V3 PHY - QSERDES COM registers */
-#define QSERDES_V3_COM_ATB_SEL1				0x000
-#define QSERDES_V3_COM_ATB_SEL2				0x004
-#define QSERDES_V3_COM_FREQ_UPDATE			0x008
-#define QSERDES_V3_COM_BG_TIMER				0x00c
-#define QSERDES_V3_COM_SSC_EN_CENTER			0x010
-#define QSERDES_V3_COM_SSC_ADJ_PER1			0x014
-#define QSERDES_V3_COM_SSC_ADJ_PER2			0x018
-#define QSERDES_V3_COM_SSC_PER1				0x01c
-#define QSERDES_V3_COM_SSC_PER2				0x020
-#define QSERDES_V3_COM_SSC_STEP_SIZE1			0x024
-#define QSERDES_V3_COM_SSC_STEP_SIZE2			0x028
-#define QSERDES_V3_COM_POST_DIV				0x02c
-#define QSERDES_V3_COM_POST_DIV_MUX			0x030
-#define QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN		0x034
+/* QSERDES V3 COM bits */
 # define QSERDES_V3_COM_BIAS_EN				0x0001
 # define QSERDES_V3_COM_BIAS_EN_MUX			0x0002
 # define QSERDES_V3_COM_CLKBUF_R_EN			0x0004
@@ -127,130 +116,13 @@
 # define QSERDES_V3_COM_EN_SYSCLK_TX_SEL		0x0010
 # define QSERDES_V3_COM_CLKBUF_RX_DRIVE_L		0x0020
 # define QSERDES_V3_COM_CLKBUF_RX_DRIVE_R		0x0040
-#define QSERDES_V3_COM_CLK_ENABLE1			0x038
-#define QSERDES_V3_COM_SYS_CLK_CTRL			0x03c
-#define QSERDES_V3_COM_SYSCLK_BUF_ENABLE		0x040
-#define QSERDES_V3_COM_PLL_EN				0x044
-#define QSERDES_V3_COM_PLL_IVCO				0x048
-#define QSERDES_V3_COM_LOCK_CMP1_MODE0			0x098
-#define QSERDES_V3_COM_LOCK_CMP2_MODE0			0x09c
-#define QSERDES_V3_COM_LOCK_CMP3_MODE0			0x0a0
-#define QSERDES_V3_COM_LOCK_CMP1_MODE1			0x0a4
-#define QSERDES_V3_COM_LOCK_CMP2_MODE1			0x0a8
-#define QSERDES_V3_COM_LOCK_CMP3_MODE1			0x0ac
-#define QSERDES_V3_COM_CLK_EP_DIV			0x05c
-#define QSERDES_V3_COM_CP_CTRL_MODE0			0x060
-#define QSERDES_V3_COM_CP_CTRL_MODE1			0x064
-#define QSERDES_V3_COM_PLL_RCTRL_MODE0			0x068
-#define QSERDES_V3_COM_PLL_RCTRL_MODE1			0x06c
-#define QSERDES_V3_COM_PLL_CCTRL_MODE0			0x070
-#define QSERDES_V3_COM_PLL_CCTRL_MODE1			0x074
-#define QSERDES_V3_COM_SYSCLK_EN_SEL			0x080
-#define QSERDES_V3_COM_RESETSM_CNTRL			0x088
-#define QSERDES_V3_COM_RESETSM_CNTRL2			0x08c
-#define QSERDES_V3_COM_LOCK_CMP_EN			0x090
-#define QSERDES_V3_COM_LOCK_CMP_CFG			0x094
-#define QSERDES_V3_COM_DEC_START_MODE0			0x0b0
-#define QSERDES_V3_COM_DEC_START_MODE1			0x0b4
-#define QSERDES_V3_COM_DIV_FRAC_START1_MODE0		0x0b8
-#define QSERDES_V3_COM_DIV_FRAC_START2_MODE0		0x0bc
-#define QSERDES_V3_COM_DIV_FRAC_START3_MODE0		0x0c0
-#define QSERDES_V3_COM_DIV_FRAC_START1_MODE1		0x0c4
-#define QSERDES_V3_COM_DIV_FRAC_START2_MODE1		0x0c8
-#define QSERDES_V3_COM_DIV_FRAC_START3_MODE1		0x0cc
-#define QSERDES_V3_COM_INTEGLOOP_INITVAL		0x0d0
-#define QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0		0x0d8
-#define QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0		0x0dc
-#define QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE1		0x0e0
-#define QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE1		0x0e4
-#define QSERDES_V3_COM_VCO_TUNE_CTRL			0x0ec
-#define QSERDES_V3_COM_VCO_TUNE_MAP			0x0f0
-#define QSERDES_V3_COM_VCO_TUNE1_MODE0			0x0f4
-#define QSERDES_V3_COM_VCO_TUNE2_MODE0			0x0f8
-#define QSERDES_V3_COM_VCO_TUNE1_MODE1			0x0fc
-#define QSERDES_V3_COM_VCO_TUNE2_MODE1			0x100
-#define QSERDES_V3_COM_VCO_TUNE_INITVAL1		0x104
-#define QSERDES_V3_COM_VCO_TUNE_INITVAL2		0x108
-#define QSERDES_V3_COM_VCO_TUNE_TIMER1			0x11c
-#define QSERDES_V3_COM_VCO_TUNE_TIMER2			0x120
-#define QSERDES_V3_COM_CLK_SELECT			0x138
-#define QSERDES_V3_COM_HSCLK_SEL			0x13c
-#define QSERDES_V3_COM_CORECLK_DIV_MODE0		0x148
-#define QSERDES_V3_COM_CORECLK_DIV_MODE1		0x14c
-#define QSERDES_V3_COM_CORE_CLK_EN			0x154
-#define QSERDES_V3_COM_C_READY_STATUS			0x158
-#define QSERDES_V3_COM_CMN_CONFIG			0x15c
-#define QSERDES_V3_COM_SVS_MODE_CLK_SEL			0x164
-#define QSERDES_V3_COM_DEBUG_BUS0			0x168
-#define QSERDES_V3_COM_DEBUG_BUS1			0x16c
-#define QSERDES_V3_COM_DEBUG_BUS2			0x170
-#define QSERDES_V3_COM_DEBUG_BUS3			0x174
-#define QSERDES_V3_COM_DEBUG_BUS_SEL			0x178
-#define QSERDES_V3_COM_CMN_MODE				0x184
 
-/* Only for QMP V3 PHY - TX registers */
-#define QSERDES_V3_TX_BIST_MODE_LANENO			0x000
-#define QSERDES_V3_TX_CLKBUF_ENABLE			0x008
-#define QSERDES_V3_TX_TX_EMP_POST1_LVL			0x00c
+/* QSERDES V3 TX bits */
 # define DP_PHY_TXn_TX_EMP_POST1_LVL_MASK		0x001f
 # define DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN		0x0020
-
-#define QSERDES_V3_TX_TX_DRV_LVL			0x01c
 # define DP_PHY_TXn_TX_DRV_LVL_MASK			0x001f
 # define DP_PHY_TXn_TX_DRV_LVL_MUX_EN			0x0020
 
-#define QSERDES_V3_TX_RESET_TSYNC_EN			0x024
-#define QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN		0x028
-
-#define QSERDES_V3_TX_TX_BAND				0x02c
-#define QSERDES_V3_TX_SLEW_CNTL				0x030
-#define QSERDES_V3_TX_INTERFACE_SELECT			0x034
-#define QSERDES_V3_TX_RES_CODE_LANE_TX			0x03c
-#define QSERDES_V3_TX_RES_CODE_LANE_RX			0x040
-#define QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX		0x044
-#define QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX		0x048
-#define QSERDES_V3_TX_DEBUG_BUS_SEL			0x058
-#define QSERDES_V3_TX_TRANSCEIVER_BIAS_EN		0x05c
-#define QSERDES_V3_TX_HIGHZ_DRVR_EN			0x060
-#define QSERDES_V3_TX_TX_POL_INV			0x064
-#define QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN	0x068
-#define QSERDES_V3_TX_LANE_MODE_1			0x08c
-#define QSERDES_V3_TX_RCV_DETECT_LVL_2			0x0a4
-#define QSERDES_V3_TX_TRAN_DRVR_EMP_EN			0x0c0
-#define QSERDES_V3_TX_TX_INTERFACE_MODE			0x0c4
-#define QSERDES_V3_TX_VMODE_CTRL1			0x0f0
-
-/* Only for QMP V3 PHY - RX registers */
-#define QSERDES_V3_RX_UCDR_FO_GAIN			0x008
-#define QSERDES_V3_RX_UCDR_SO_GAIN_HALF			0x00c
-#define QSERDES_V3_RX_UCDR_SO_GAIN			0x014
-#define QSERDES_V3_RX_UCDR_SVS_SO_GAIN_HALF		0x024
-#define QSERDES_V3_RX_UCDR_SVS_SO_GAIN_QUARTER		0x028
-#define QSERDES_V3_RX_UCDR_SVS_SO_GAIN			0x02c
-#define QSERDES_V3_RX_UCDR_FASTLOCK_FO_GAIN		0x030
-#define QSERDES_V3_RX_UCDR_SO_SATURATION_AND_ENABLE	0x034
-#define QSERDES_V3_RX_UCDR_FASTLOCK_COUNT_LOW		0x03c
-#define QSERDES_V3_RX_UCDR_FASTLOCK_COUNT_HIGH		0x040
-#define QSERDES_V3_RX_UCDR_PI_CONTROLS			0x044
-#define QSERDES_V3_RX_RX_TERM_BW			0x07c
-#define QSERDES_V3_RX_VGA_CAL_CNTRL1			0x0bc
-#define QSERDES_V3_RX_VGA_CAL_CNTRL2			0x0c0
-#define QSERDES_V3_RX_RX_EQ_GAIN2_LSB			0x0c8
-#define QSERDES_V3_RX_RX_EQ_GAIN2_MSB			0x0cc
-#define QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2		0x0d4
-#define QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL3		0x0d8
-#define QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL4		0x0dc
-#define QSERDES_V3_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x0f8
-#define QSERDES_V3_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x0fc
-#define QSERDES_V3_RX_SIGDET_ENABLES			0x100
-#define QSERDES_V3_RX_SIGDET_CNTRL			0x104
-#define QSERDES_V3_RX_SIGDET_LVL			0x108
-#define QSERDES_V3_RX_SIGDET_DEGLITCH_CNTRL		0x10c
-#define QSERDES_V3_RX_RX_BAND				0x110
-#define QSERDES_V3_RX_RX_INTERFACE_MODE			0x11c
-#define QSERDES_V3_RX_RX_MODE_00			0x164
-#define QSERDES_V3_RX_RX_MODE_01			0x168
-
 /* Only for QMP V3 PHY - PCS registers */
 #define QPHY_V3_PCS_POWER_DOWN_CONTROL			0x004
 #define QPHY_V3_PCS_TXMGN_V0				0x00c
-- 
2.35.1

