Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0D256665E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbiGEJnh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiGEJne (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:34 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E358D6C
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:33 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id e12so19604806lfr.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dVa7xxf/onEqP76kyKPFVLsK7w2goNqUXvjuau2wFf0=;
        b=OQGUZZH3WREX7v8BTsyIU1UmMvTp5tdzHirP0OC7hu3IRZjd3V/AcdhVow1Glp56+N
         bHYyeneAj0w25cCgUPWeFHwR9QPI8CX66FiWWtHs2sHa+mnCw2xJGzhG/hUDiTlyqW2r
         /x0gDH+IOxfYPgjqMbcfkabicPmuysMf81Zb3KnzKRerKaILZolp6OGg+nNBaVW1OQd4
         cNh1sB1H4klN1GO5BdYlUqtsNnyrVAWol7LQ/OIfq/N5AUh52OkZIJkQ8Wl3dya05w2m
         qnOWpKBo400WRjEFdrhbQB1srOCZWs1kRHbItsQO5cTG2uA3CX69V9EfyYXiWYk5mWvH
         /PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dVa7xxf/onEqP76kyKPFVLsK7w2goNqUXvjuau2wFf0=;
        b=p/tf25D6+ukWQXrTJ3Dmz0aTVkeBA9d+FP+LMC+WsYVV/GrWdd1p0dSk2AdZ4mWHQy
         gMaz/KI0eieLX+xLBZR64bdOAPJ0cYg+GjdHlv7o+IQJgVSLHcTIJqAzPhfY6KkNdQec
         gnZNinW8cDxnK+TJWe1mPr8c0ghfbUd8V3LBq+HKbnXhLQtMFF+jSAehVvTw+iHtuPyx
         zAhzDXvbX0s00ze09Uu5eEmpPrCaIJSO+5zXMVTxY5zTh5Nv/SLoPbvdMYLr+d35M6j+
         CeTIVClAxAXfPUwrLcygbEnq99Hp0dsmMsj8I3T2Zmi0rcQB83OGxvJ0TU0OhW+zlbxn
         Mxlw==
X-Gm-Message-State: AJIora/S7xASJKkTrJc2xaBzyubxMlb9RmwRvGtUsmGidu2Ax1FQzcLl
        MfJWywsseDFNO5jeNakumNOXHA==
X-Google-Smtp-Source: AGRyM1v5r9iWWUu7brErfEAgHnHeQqYVe7CCXY1MQH+miMLEPCNuDtHq6+sM11WMnaRLoKI6y6mQSg==
X-Received: by 2002:ac2:4f16:0:b0:47f:9437:43c9 with SMTP id k22-20020ac24f16000000b0047f943743c9mr22615302lfr.118.1657014211407;
        Tue, 05 Jul 2022 02:43:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 12/28] phy: qcom-qmp: move QSERDES PLL registers to separate header
Date:   Tue,  5 Jul 2022 12:43:04 +0300
Message-Id: <20220705094320.1313312-13-dmitry.baryshkov@linaro.org>
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

Move QSERDES PLL registers to the separate header. This register set is
unique for the IPQ PCIe Gen3 PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-pll.h   | 66 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 58 +---------------
 2 files changed, 67 insertions(+), 57 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-pll.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-pll.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-pll.h
new file mode 100644
index 000000000000..ad326e301a3a
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-pll.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_PLL_H_
+#define QCOM_PHY_QMP_QSERDES_PLL_H_
+
+/* QMP V2 PHY for PCIE gen3 ports - QSERDES PLL registers */
+#define QSERDES_PLL_BG_TIMER				0x00c
+#define QSERDES_PLL_SSC_PER1				0x01c
+#define QSERDES_PLL_SSC_PER2				0x020
+#define QSERDES_PLL_SSC_STEP_SIZE1_MODE0		0x024
+#define QSERDES_PLL_SSC_STEP_SIZE2_MODE0		0x028
+#define QSERDES_PLL_SSC_STEP_SIZE1_MODE1		0x02c
+#define QSERDES_PLL_SSC_STEP_SIZE2_MODE1		0x030
+#define QSERDES_PLL_BIAS_EN_CLKBUFLR_EN			0x03c
+#define QSERDES_PLL_CLK_ENABLE1				0x040
+#define QSERDES_PLL_SYS_CLK_CTRL			0x044
+#define QSERDES_PLL_SYSCLK_BUF_ENABLE			0x048
+#define QSERDES_PLL_PLL_IVCO				0x050
+#define QSERDES_PLL_LOCK_CMP1_MODE0			0x054
+#define QSERDES_PLL_LOCK_CMP2_MODE0			0x058
+#define QSERDES_PLL_LOCK_CMP1_MODE1			0x060
+#define QSERDES_PLL_LOCK_CMP2_MODE1			0x064
+#define QSERDES_PLL_BG_TRIM				0x074
+#define QSERDES_PLL_CLK_EP_DIV_MODE0			0x078
+#define QSERDES_PLL_CLK_EP_DIV_MODE1			0x07c
+#define QSERDES_PLL_CP_CTRL_MODE0			0x080
+#define QSERDES_PLL_CP_CTRL_MODE1			0x084
+#define QSERDES_PLL_PLL_RCTRL_MODE0			0x088
+#define QSERDES_PLL_PLL_RCTRL_MODE1			0x08c
+#define QSERDES_PLL_PLL_CCTRL_MODE0			0x090
+#define QSERDES_PLL_PLL_CCTRL_MODE1			0x094
+#define QSERDES_PLL_BIAS_EN_CTRL_BY_PSM			0x0a4
+#define QSERDES_PLL_SYSCLK_EN_SEL			0x0a8
+#define QSERDES_PLL_RESETSM_CNTRL			0x0b0
+#define QSERDES_PLL_LOCK_CMP_EN				0x0c4
+#define QSERDES_PLL_DEC_START_MODE0			0x0cc
+#define QSERDES_PLL_DEC_START_MODE1			0x0d0
+#define QSERDES_PLL_DIV_FRAC_START1_MODE0		0x0d8
+#define QSERDES_PLL_DIV_FRAC_START2_MODE0		0x0dc
+#define QSERDES_PLL_DIV_FRAC_START3_MODE0		0x0e0
+#define QSERDES_PLL_DIV_FRAC_START1_MODE1		0x0e4
+#define QSERDES_PLL_DIV_FRAC_START2_MODE1		0x0e8
+#define QSERDES_PLL_DIV_FRAC_START3_MODE1		0x0ec
+#define QSERDES_PLL_INTEGLOOP_GAIN0_MODE0		0x100
+#define QSERDES_PLL_INTEGLOOP_GAIN1_MODE0		0x104
+#define QSERDES_PLL_INTEGLOOP_GAIN0_MODE1		0x108
+#define QSERDES_PLL_INTEGLOOP_GAIN1_MODE1		0x10c
+#define QSERDES_PLL_VCO_TUNE_MAP			0x120
+#define QSERDES_PLL_VCO_TUNE1_MODE0			0x124
+#define QSERDES_PLL_VCO_TUNE2_MODE0			0x128
+#define QSERDES_PLL_VCO_TUNE1_MODE1			0x12c
+#define QSERDES_PLL_VCO_TUNE2_MODE1			0x130
+#define QSERDES_PLL_VCO_TUNE_TIMER1			0x13c
+#define QSERDES_PLL_VCO_TUNE_TIMER2			0x140
+#define QSERDES_PLL_CLK_SELECT				0x16c
+#define QSERDES_PLL_HSCLK_SEL				0x170
+#define QSERDES_PLL_CORECLK_DIV				0x17c
+#define QSERDES_PLL_CORE_CLK_EN				0x184
+#define QSERDES_PLL_CMN_CONFIG				0x18c
+#define QSERDES_PLL_SVS_MODE_CLK_SEL			0x194
+#define QSERDES_PLL_CORECLK_DIV_MODE1			0x1b4
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 50a663bb0f2f..07e281c818b1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -18,63 +18,7 @@
 #include "phy-qcom-qmp-qserdes-com-v5.h"
 #include "phy-qcom-qmp-qserdes-txrx-v5.h"
 
-/* QMP V2 PHY for PCIE gen3 ports - QSERDES PLL registers */
-
-#define QSERDES_PLL_BG_TIMER				0x00c
-#define QSERDES_PLL_SSC_PER1				0x01c
-#define QSERDES_PLL_SSC_PER2				0x020
-#define QSERDES_PLL_SSC_STEP_SIZE1_MODE0		0x024
-#define QSERDES_PLL_SSC_STEP_SIZE2_MODE0		0x028
-#define QSERDES_PLL_SSC_STEP_SIZE1_MODE1		0x02c
-#define QSERDES_PLL_SSC_STEP_SIZE2_MODE1		0x030
-#define QSERDES_PLL_BIAS_EN_CLKBUFLR_EN			0x03c
-#define QSERDES_PLL_CLK_ENABLE1				0x040
-#define QSERDES_PLL_SYS_CLK_CTRL			0x044
-#define QSERDES_PLL_SYSCLK_BUF_ENABLE			0x048
-#define QSERDES_PLL_PLL_IVCO				0x050
-#define QSERDES_PLL_LOCK_CMP1_MODE0			0x054
-#define QSERDES_PLL_LOCK_CMP2_MODE0			0x058
-#define QSERDES_PLL_LOCK_CMP1_MODE1			0x060
-#define QSERDES_PLL_LOCK_CMP2_MODE1			0x064
-#define QSERDES_PLL_BG_TRIM				0x074
-#define QSERDES_PLL_CLK_EP_DIV_MODE0			0x078
-#define QSERDES_PLL_CLK_EP_DIV_MODE1			0x07c
-#define QSERDES_PLL_CP_CTRL_MODE0			0x080
-#define QSERDES_PLL_CP_CTRL_MODE1			0x084
-#define QSERDES_PLL_PLL_RCTRL_MODE0			0x088
-#define QSERDES_PLL_PLL_RCTRL_MODE1			0x08c
-#define QSERDES_PLL_PLL_CCTRL_MODE0			0x090
-#define QSERDES_PLL_PLL_CCTRL_MODE1			0x094
-#define QSERDES_PLL_BIAS_EN_CTRL_BY_PSM			0x0a4
-#define QSERDES_PLL_SYSCLK_EN_SEL			0x0a8
-#define QSERDES_PLL_RESETSM_CNTRL			0x0b0
-#define QSERDES_PLL_LOCK_CMP_EN				0x0c4
-#define QSERDES_PLL_DEC_START_MODE0			0x0cc
-#define QSERDES_PLL_DEC_START_MODE1			0x0d0
-#define QSERDES_PLL_DIV_FRAC_START1_MODE0		0x0d8
-#define QSERDES_PLL_DIV_FRAC_START2_MODE0		0x0dc
-#define QSERDES_PLL_DIV_FRAC_START3_MODE0		0x0e0
-#define QSERDES_PLL_DIV_FRAC_START1_MODE1		0x0e4
-#define QSERDES_PLL_DIV_FRAC_START2_MODE1		0x0e8
-#define QSERDES_PLL_DIV_FRAC_START3_MODE1		0x0ec
-#define QSERDES_PLL_INTEGLOOP_GAIN0_MODE0		0x100
-#define QSERDES_PLL_INTEGLOOP_GAIN1_MODE0		0x104
-#define QSERDES_PLL_INTEGLOOP_GAIN0_MODE1		0x108
-#define QSERDES_PLL_INTEGLOOP_GAIN1_MODE1		0x10c
-#define QSERDES_PLL_VCO_TUNE_MAP			0x120
-#define QSERDES_PLL_VCO_TUNE1_MODE0			0x124
-#define QSERDES_PLL_VCO_TUNE2_MODE0			0x128
-#define QSERDES_PLL_VCO_TUNE1_MODE1			0x12c
-#define QSERDES_PLL_VCO_TUNE2_MODE1			0x130
-#define QSERDES_PLL_VCO_TUNE_TIMER1			0x13c
-#define QSERDES_PLL_VCO_TUNE_TIMER2			0x140
-#define QSERDES_PLL_CLK_SELECT				0x16c
-#define QSERDES_PLL_HSCLK_SEL				0x170
-#define QSERDES_PLL_CORECLK_DIV				0x17c
-#define QSERDES_PLL_CORE_CLK_EN				0x184
-#define QSERDES_PLL_CMN_CONFIG				0x18c
-#define QSERDES_PLL_SVS_MODE_CLK_SEL			0x194
-#define QSERDES_PLL_CORECLK_DIV_MODE1			0x1b4
+#include "phy-qcom-qmp-qserdes-pll.h"
 
 /* Only for QMP V2 PHY - PCS registers */
 #define QPHY_V2_PCS_POWER_DOWN_CONTROL				0x04
-- 
2.35.1

