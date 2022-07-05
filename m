Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6051956665A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiGEJnd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiGEJnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:31 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA56FE9
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:29 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q8so1363223ljj.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zOKqFovIGk/dWiprqRLEOVeJxZ7tQ0KCv+tjTs7/Adk=;
        b=Iz7cG/v8enaTokragIz81bbGH+c98y6U3FCMUnfOSle5qJvH0zx/aabZnHsh4dq0gC
         PdDrNXG4/QRllxDFHgBxDca9SKBd24zuTEB6qMV+RzbJrGyTWjV7YDovc/OnEbZ+4uCL
         /3/aSQ+sAOsGNZqmSmc5pP8M1+QcGWstTYnc2VSRB3ROQHQZiq6TiBPgtB+AshqH8d5N
         MtIk6R1nWeO6+AnDHqJlTWtLrGqOlqYpMrWnv+gohpxGQZDQBr3rGLaP5TeR//1OzLHi
         WlSaVPOtR+bLb/vfeg5LWFL9Vkpxv+PKNJKbZgskpc4khks7TNMpCCPeyaVCotcaEBny
         WYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zOKqFovIGk/dWiprqRLEOVeJxZ7tQ0KCv+tjTs7/Adk=;
        b=ArNz0oxcnbFbVyQDTucR3DcWgcn98hFwKUV/8b0zYYyvAGCUjCpeZKAXtTTfwmhmQ6
         GEMpD+41In0yHvG1vQc1oHgmQ5UkReTTiWyNUxmbcOcXTf3g76xXw2rPPyKRo8T9kjmn
         k3XCfVwpb+inr2WnjxuFPiOBgLrtpNqdLTj3TNUKBsdPTvbawodjBpczMMT37EBvvgKL
         siX9YWaylFi0Tnd8mORnFaM9ZB5nsYv4mEvnNIMOqJdLyEirhuG4gQTaBbm7ODMsN1gF
         arhXt0joJ2KJksSCjXEbdcHafHIV/ZEbHwXPLVrmq6cVHP9vAUQDCREv9Ifja03ybTS1
         IBSw==
X-Gm-Message-State: AJIora99VKJnlbQkDdZJeCfN9cNr34G3eT1Nk2FhixLBBiqX+198Ef1R
        3/U/+W6ZRG5aAcnBydW/j38zVg==
X-Google-Smtp-Source: AGRyM1t1eG88iXiZz9rx8jRM7jWZd8hT6FKa00Ya0s1oL/C5qopKxiW8LykaMolHdX77D0nEIzPQPw==
X-Received: by 2002:a05:651c:b23:b0:25a:5d07:d9a8 with SMTP id b35-20020a05651c0b2300b0025a5d07d9a8mr19659095ljr.244.1657014207948;
        Tue, 05 Jul 2022 02:43:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 08/28] phy: qcom-qmp: move QSERDES registers to separate header
Date:   Tue,  5 Jul 2022 12:43:00 +0300
Message-Id: <20220705094320.1313312-9-dmitry.baryshkov@linaro.org>
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

Move QSERDES V2 registers to the separate header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com.h   |  83 +++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h  |  44 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 112 +-----------------
 3 files changed, 130 insertions(+), 109 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
new file mode 100644
index 000000000000..9dfa80263707
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_H_
+#define QCOM_PHY_QMP_QSERDES_COM_H_
+
+/* Only for QMP V2 PHY - QSERDES COM registers */
+#define QSERDES_COM_BG_TIMER				0x00c
+#define QSERDES_COM_SSC_EN_CENTER			0x010
+#define QSERDES_COM_SSC_ADJ_PER1			0x014
+#define QSERDES_COM_SSC_ADJ_PER2			0x018
+#define QSERDES_COM_SSC_PER1				0x01c
+#define QSERDES_COM_SSC_PER2				0x020
+#define QSERDES_COM_SSC_STEP_SIZE1			0x024
+#define QSERDES_COM_SSC_STEP_SIZE2			0x028
+#define QSERDES_COM_BIAS_EN_CLKBUFLR_EN			0x034
+#define QSERDES_COM_CLK_ENABLE1				0x038
+#define QSERDES_COM_SYS_CLK_CTRL			0x03c
+#define QSERDES_COM_SYSCLK_BUF_ENABLE			0x040
+#define QSERDES_COM_PLL_IVCO				0x048
+#define QSERDES_COM_LOCK_CMP1_MODE0			0x04c
+#define QSERDES_COM_LOCK_CMP2_MODE0			0x050
+#define QSERDES_COM_LOCK_CMP3_MODE0			0x054
+#define QSERDES_COM_LOCK_CMP1_MODE1			0x058
+#define QSERDES_COM_LOCK_CMP2_MODE1			0x05c
+#define QSERDES_COM_LOCK_CMP3_MODE1			0x060
+#define QSERDES_COM_BG_TRIM				0x070
+#define QSERDES_COM_CLK_EP_DIV				0x074
+#define QSERDES_COM_CP_CTRL_MODE0			0x078
+#define QSERDES_COM_CP_CTRL_MODE1			0x07c
+#define QSERDES_COM_PLL_RCTRL_MODE0			0x084
+#define QSERDES_COM_PLL_RCTRL_MODE1			0x088
+#define QSERDES_COM_PLL_CCTRL_MODE0			0x090
+#define QSERDES_COM_PLL_CCTRL_MODE1			0x094
+#define QSERDES_COM_BIAS_EN_CTRL_BY_PSM			0x0a8
+#define QSERDES_COM_SYSCLK_EN_SEL			0x0ac
+#define QSERDES_COM_RESETSM_CNTRL			0x0b4
+#define QSERDES_COM_RESETSM_CNTRL2			0x0b8
+#define QSERDES_COM_RESTRIM_CTRL			0x0bc
+#define QSERDES_COM_RESCODE_DIV_NUM			0x0c4
+#define QSERDES_COM_LOCK_CMP_EN				0x0c8
+#define QSERDES_COM_LOCK_CMP_CFG			0x0cc
+#define QSERDES_COM_DEC_START_MODE0			0x0d0
+#define QSERDES_COM_DEC_START_MODE1			0x0d4
+#define QSERDES_COM_DIV_FRAC_START1_MODE0		0x0dc
+#define QSERDES_COM_DIV_FRAC_START2_MODE0		0x0e0
+#define QSERDES_COM_DIV_FRAC_START3_MODE0		0x0e4
+#define QSERDES_COM_DIV_FRAC_START1_MODE1		0x0e8
+#define QSERDES_COM_DIV_FRAC_START2_MODE1		0x0ec
+#define QSERDES_COM_DIV_FRAC_START3_MODE1		0x0f0
+#define QSERDES_COM_INTEGLOOP_INITVAL			0x100
+#define QSERDES_COM_INTEGLOOP_GAIN0_MODE0		0x108
+#define QSERDES_COM_INTEGLOOP_GAIN1_MODE0		0x10c
+#define QSERDES_COM_INTEGLOOP_GAIN0_MODE1		0x110
+#define QSERDES_COM_INTEGLOOP_GAIN1_MODE1		0x114
+#define QSERDES_COM_VCO_TUNE_CTRL			0x124
+#define QSERDES_COM_VCO_TUNE_MAP			0x128
+#define QSERDES_COM_VCO_TUNE1_MODE0			0x12c
+#define QSERDES_COM_VCO_TUNE2_MODE0			0x130
+#define QSERDES_COM_VCO_TUNE1_MODE1			0x134
+#define QSERDES_COM_VCO_TUNE2_MODE1			0x138
+#define QSERDES_COM_VCO_TUNE_INITVAL1			0x13c
+#define QSERDES_COM_VCO_TUNE_INITVAL2			0x140
+#define QSERDES_COM_VCO_TUNE_TIMER1			0x144
+#define QSERDES_COM_VCO_TUNE_TIMER2			0x148
+#define QSERDES_COM_BG_CTRL				0x170
+#define QSERDES_COM_CLK_SELECT				0x174
+#define QSERDES_COM_HSCLK_SEL				0x178
+#define QSERDES_COM_CORECLK_DIV				0x184
+#define QSERDES_COM_CORE_CLK_EN				0x18c
+#define QSERDES_COM_C_READY_STATUS			0x190
+#define QSERDES_COM_CMN_CONFIG				0x194
+#define QSERDES_COM_SVS_MODE_CLK_SEL			0x19c
+#define QSERDES_COM_DEBUG_BUS0				0x1a0
+#define QSERDES_COM_DEBUG_BUS1				0x1a4
+#define QSERDES_COM_DEBUG_BUS2				0x1a8
+#define QSERDES_COM_DEBUG_BUS3				0x1ac
+#define QSERDES_COM_DEBUG_BUS_SEL			0x1b0
+#define QSERDES_COM_CORECLK_DIV_MODE1			0x1bc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h
new file mode 100644
index 000000000000..583098a88b65
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_H_
+
+/* Only for QMP V2 PHY - TX registers */
+#define QSERDES_TX_EMP_POST1_LVL			0x018
+#define QSERDES_TX_SLEW_CNTL				0x040
+#define QSERDES_TX_RES_CODE_LANE_OFFSET			0x054
+#define QSERDES_TX_DEBUG_BUS_SEL			0x064
+#define QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN	0x068
+#define QSERDES_TX_LANE_MODE				0x094
+#define QSERDES_TX_RCV_DETECT_LVL_2			0x0ac
+
+/* Only for QMP V2 PHY - RX registers */
+#define QSERDES_RX_UCDR_SO_GAIN_HALF			0x010
+#define QSERDES_RX_UCDR_SO_GAIN				0x01c
+#define QSERDES_RX_UCDR_SVS_SO_GAIN_HALF		0x030
+#define QSERDES_RX_UCDR_SVS_SO_GAIN_QUARTER		0x034
+#define QSERDES_RX_UCDR_SVS_SO_GAIN_EIGHTH		0x038
+#define QSERDES_RX_UCDR_SVS_SO_GAIN			0x03c
+#define QSERDES_RX_UCDR_FASTLOCK_FO_GAIN		0x040
+#define QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE	0x048
+#define QSERDES_RX_RX_TERM_BW				0x090
+#define QSERDES_RX_RX_EQ_GAIN1_LSB			0x0c4
+#define QSERDES_RX_RX_EQ_GAIN1_MSB			0x0c8
+#define QSERDES_RX_RX_EQ_GAIN2_LSB			0x0cc
+#define QSERDES_RX_RX_EQ_GAIN2_MSB			0x0d0
+#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2		0x0d8
+#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3		0x0dc
+#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4		0x0e0
+#define QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x108
+#define QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x10c
+#define QSERDES_RX_SIGDET_ENABLES			0x110
+#define QSERDES_RX_SIGDET_CNTRL				0x114
+#define QSERDES_RX_SIGDET_LVL				0x118
+#define QSERDES_RX_SIGDET_DEGLITCH_CNTRL		0x11c
+#define QSERDES_RX_RX_BAND				0x120
+#define QSERDES_RX_RX_INTERFACE_MODE			0x12c
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index b2aeace96c09..6a24d61098e7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -6,6 +6,9 @@
 #ifndef QCOM_PHY_QMP_H_
 #define QCOM_PHY_QMP_H_
 
+#include "phy-qcom-qmp-qserdes-com.h"
+#include "phy-qcom-qmp-qserdes-txrx.h"
+
 /* QMP V2 PHY for PCIE gen3 ports - QSERDES PLL registers */
 
 #define QSERDES_PLL_BG_TIMER				0x00c
@@ -64,115 +67,6 @@
 #define QSERDES_PLL_SVS_MODE_CLK_SEL			0x194
 #define QSERDES_PLL_CORECLK_DIV_MODE1			0x1b4
 
-/* Only for QMP V2 PHY - QSERDES COM registers */
-#define QSERDES_COM_BG_TIMER				0x00c
-#define QSERDES_COM_SSC_EN_CENTER			0x010
-#define QSERDES_COM_SSC_ADJ_PER1			0x014
-#define QSERDES_COM_SSC_ADJ_PER2			0x018
-#define QSERDES_COM_SSC_PER1				0x01c
-#define QSERDES_COM_SSC_PER2				0x020
-#define QSERDES_COM_SSC_STEP_SIZE1			0x024
-#define QSERDES_COM_SSC_STEP_SIZE2			0x028
-#define QSERDES_COM_BIAS_EN_CLKBUFLR_EN			0x034
-#define QSERDES_COM_CLK_ENABLE1				0x038
-#define QSERDES_COM_SYS_CLK_CTRL			0x03c
-#define QSERDES_COM_SYSCLK_BUF_ENABLE			0x040
-#define QSERDES_COM_PLL_IVCO				0x048
-#define QSERDES_COM_LOCK_CMP1_MODE0			0x04c
-#define QSERDES_COM_LOCK_CMP2_MODE0			0x050
-#define QSERDES_COM_LOCK_CMP3_MODE0			0x054
-#define QSERDES_COM_LOCK_CMP1_MODE1			0x058
-#define QSERDES_COM_LOCK_CMP2_MODE1			0x05c
-#define QSERDES_COM_LOCK_CMP3_MODE1			0x060
-#define QSERDES_COM_BG_TRIM				0x070
-#define QSERDES_COM_CLK_EP_DIV				0x074
-#define QSERDES_COM_CP_CTRL_MODE0			0x078
-#define QSERDES_COM_CP_CTRL_MODE1			0x07c
-#define QSERDES_COM_PLL_RCTRL_MODE0			0x084
-#define QSERDES_COM_PLL_RCTRL_MODE1			0x088
-#define QSERDES_COM_PLL_CCTRL_MODE0			0x090
-#define QSERDES_COM_PLL_CCTRL_MODE1			0x094
-#define QSERDES_COM_BIAS_EN_CTRL_BY_PSM			0x0a8
-#define QSERDES_COM_SYSCLK_EN_SEL			0x0ac
-#define QSERDES_COM_RESETSM_CNTRL			0x0b4
-#define QSERDES_COM_RESETSM_CNTRL2			0x0b8
-#define QSERDES_COM_RESTRIM_CTRL			0x0bc
-#define QSERDES_COM_RESCODE_DIV_NUM			0x0c4
-#define QSERDES_COM_LOCK_CMP_EN				0x0c8
-#define QSERDES_COM_LOCK_CMP_CFG			0x0cc
-#define QSERDES_COM_DEC_START_MODE0			0x0d0
-#define QSERDES_COM_DEC_START_MODE1			0x0d4
-#define QSERDES_COM_DIV_FRAC_START1_MODE0		0x0dc
-#define QSERDES_COM_DIV_FRAC_START2_MODE0		0x0e0
-#define QSERDES_COM_DIV_FRAC_START3_MODE0		0x0e4
-#define QSERDES_COM_DIV_FRAC_START1_MODE1		0x0e8
-#define QSERDES_COM_DIV_FRAC_START2_MODE1		0x0ec
-#define QSERDES_COM_DIV_FRAC_START3_MODE1		0x0f0
-#define QSERDES_COM_INTEGLOOP_INITVAL			0x100
-#define QSERDES_COM_INTEGLOOP_GAIN0_MODE0		0x108
-#define QSERDES_COM_INTEGLOOP_GAIN1_MODE0		0x10c
-#define QSERDES_COM_INTEGLOOP_GAIN0_MODE1		0x110
-#define QSERDES_COM_INTEGLOOP_GAIN1_MODE1		0x114
-#define QSERDES_COM_VCO_TUNE_CTRL			0x124
-#define QSERDES_COM_VCO_TUNE_MAP			0x128
-#define QSERDES_COM_VCO_TUNE1_MODE0			0x12c
-#define QSERDES_COM_VCO_TUNE2_MODE0			0x130
-#define QSERDES_COM_VCO_TUNE1_MODE1			0x134
-#define QSERDES_COM_VCO_TUNE2_MODE1			0x138
-#define QSERDES_COM_VCO_TUNE_INITVAL1			0x13c
-#define QSERDES_COM_VCO_TUNE_INITVAL2			0x140
-#define QSERDES_COM_VCO_TUNE_TIMER1			0x144
-#define QSERDES_COM_VCO_TUNE_TIMER2			0x148
-#define QSERDES_COM_BG_CTRL				0x170
-#define QSERDES_COM_CLK_SELECT				0x174
-#define QSERDES_COM_HSCLK_SEL				0x178
-#define QSERDES_COM_CORECLK_DIV				0x184
-#define QSERDES_COM_CORE_CLK_EN				0x18c
-#define QSERDES_COM_C_READY_STATUS			0x190
-#define QSERDES_COM_CMN_CONFIG				0x194
-#define QSERDES_COM_SVS_MODE_CLK_SEL			0x19c
-#define QSERDES_COM_DEBUG_BUS0				0x1a0
-#define QSERDES_COM_DEBUG_BUS1				0x1a4
-#define QSERDES_COM_DEBUG_BUS2				0x1a8
-#define QSERDES_COM_DEBUG_BUS3				0x1ac
-#define QSERDES_COM_DEBUG_BUS_SEL			0x1b0
-#define QSERDES_COM_CORECLK_DIV_MODE1			0x1bc
-
-/* Only for QMP V2 PHY - TX registers */
-#define QSERDES_TX_EMP_POST1_LVL			0x018
-#define QSERDES_TX_SLEW_CNTL				0x040
-#define QSERDES_TX_RES_CODE_LANE_OFFSET			0x054
-#define QSERDES_TX_DEBUG_BUS_SEL			0x064
-#define QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN	0x068
-#define QSERDES_TX_LANE_MODE				0x094
-#define QSERDES_TX_RCV_DETECT_LVL_2			0x0ac
-
-/* Only for QMP V2 PHY - RX registers */
-#define QSERDES_RX_UCDR_SO_GAIN_HALF			0x010
-#define QSERDES_RX_UCDR_SO_GAIN				0x01c
-#define QSERDES_RX_UCDR_SVS_SO_GAIN_HALF		0x030
-#define QSERDES_RX_UCDR_SVS_SO_GAIN_QUARTER		0x034
-#define QSERDES_RX_UCDR_SVS_SO_GAIN_EIGHTH		0x038
-#define QSERDES_RX_UCDR_SVS_SO_GAIN			0x03c
-#define QSERDES_RX_UCDR_FASTLOCK_FO_GAIN		0x040
-#define QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE	0x048
-#define QSERDES_RX_RX_TERM_BW				0x090
-#define QSERDES_RX_RX_EQ_GAIN1_LSB			0x0c4
-#define QSERDES_RX_RX_EQ_GAIN1_MSB			0x0c8
-#define QSERDES_RX_RX_EQ_GAIN2_LSB			0x0cc
-#define QSERDES_RX_RX_EQ_GAIN2_MSB			0x0d0
-#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2		0x0d8
-#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3		0x0dc
-#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4		0x0e0
-#define QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x108
-#define QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x10c
-#define QSERDES_RX_SIGDET_ENABLES			0x110
-#define QSERDES_RX_SIGDET_CNTRL				0x114
-#define QSERDES_RX_SIGDET_LVL				0x118
-#define QSERDES_RX_SIGDET_DEGLITCH_CNTRL		0x11c
-#define QSERDES_RX_RX_BAND				0x120
-#define QSERDES_RX_RX_INTERFACE_MODE			0x12c
-
 /* Only for QMP V2 PHY - PCS registers */
 #define QPHY_V2_PCS_POWER_DOWN_CONTROL				0x04
 #define QPHY_V2_PCS_TXDEEMPH_M6DB_V0				0x24
-- 
2.35.1

