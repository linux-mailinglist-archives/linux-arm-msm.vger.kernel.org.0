Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9D28546CF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350190AbiFJTJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348272AbiFJTJo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:09:44 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D3B21A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:42 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id l18so96211lje.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zOKqFovIGk/dWiprqRLEOVeJxZ7tQ0KCv+tjTs7/Adk=;
        b=zvk/fLEvdNs7uo30N44sJBjxup+XtnsWnMff8rip31b7SiefhsLAuW8KOZRQPXT0Ra
         bpTiy6xbXkhe8qeA8UpuQJs5Jm7hiz4NtD42hriJCkN3XekWFeoBrnu2grEGgaQCu5EB
         SsNIfZ6Ds3BaR/lWl984ichFaJLx0RUU7iAJYPDiE8Dxgr/GR/xsjuk0/P2g6g1vtSbG
         g9qEOQcB5UQYYSokfi/jD6iNEdmUAyVJJfMtnwvPk/4o6JeSsPrgGzfVCIBJD+yTKXTK
         TWNb5wJtH/fgNFRwsfgYfTirOVJAiJd9soEeh33Xac9DO/WRZ5843GJeS7Xy5ZwXSR2/
         /liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zOKqFovIGk/dWiprqRLEOVeJxZ7tQ0KCv+tjTs7/Adk=;
        b=qOP45TnANOx2/SyhOwvZ5UOciJYH3ZfgRsAIds6ESDo7qfA9hN1JoF9j98xz2FIJVg
         UgEHgLcoanDvERo71oFYR2AfS42oTjsqZ+SCVt/tQADc9mPpU5kkkGjb7PNScl9dZauU
         Llg4RbmqUxNt5Rp+Vw1llvqNjLzC1KHWXKFexzBi/+gDCokVk3p2VSduBsDaaWYYr1O+
         3tejYJVkaZJXk9rralC6VW/0JrXEzpqTT8Eu4r8KjJEAAO3enD2PYrVDYk143e230+bm
         1Hgu214ASoH0Dks3xCrno3GvWXM3sYhuuo/tpc8mTDIagFH5iMqskD+26VOpURi7jUDj
         FGsw==
X-Gm-Message-State: AOAM533cSvqdmN0T0cEu62rMUJD9zwRuhTk2t0atkeeW72qvZbs5dROV
        mX0YJ4g/ImF7nOs1lvMMfQkoNP6hR88eeAQG
X-Google-Smtp-Source: ABdhPJwsCbrmvG9823WI2abXTQJB32BmJjRFAPgWh9RbH7opd2NT3E47UdJKpDGLoq9mgf93VrAJAA==
X-Received: by 2002:a2e:9d88:0:b0:255:9e72:12b6 with SMTP id c8-20020a2e9d88000000b002559e7212b6mr14167038ljj.506.1654888180498;
        Fri, 10 Jun 2022 12:09:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:09:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 08/28] phy: qcom-qmp: move QSERDES registers to separate header
Date:   Fri, 10 Jun 2022 22:09:05 +0300
Message-Id: <20220610190925.3670081-9-dmitry.baryshkov@linaro.org>
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

