Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3A90546CF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350457AbiFJTJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350455AbiFJTJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:09:49 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655A9DF7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:47 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id h23so142903ljl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dVa7xxf/onEqP76kyKPFVLsK7w2goNqUXvjuau2wFf0=;
        b=iWPZiuhZKPZVHKVvFJOSojLNyr8ZdkLp9ONkJ3hMtkZE4HmgY4OeycdQ60C1iBgszc
         rpItXavHHTQfDzX/vs0Foot5w8BQYSJZugSmuMzpxTeMPXlOToga5pbZ5KbQptNTrjSG
         /RVjC3JJ9wIvUYGjGTsx3KjzudQN9HUzREzB/kpamDzhvTv2HzcZ65wcAKBaYB6B+L27
         M2jQcLpv3qSY2qYeCKNtPJJkDqLT2zysM7TyrzfLnEMe/+57Y0V7WPm32vas/urTTUfK
         URhOzpIWDhb0xwD63JRNB5R1BrxjgNwt0K2aLvObgfAy32G0Dm/vGota6wlYKxlXmvJ5
         h2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dVa7xxf/onEqP76kyKPFVLsK7w2goNqUXvjuau2wFf0=;
        b=R7b9Ya14ncA4r6rDueuwQs2248li+F1D1Sv28JDNAXHs9qP+U6N4yDTwdkCWfBLPo6
         MOpCriC120HAj7naN7BLOJ4+VgWOM8Rum2S70w3OCokG7zR3Ih+orqOeXmNEZpHrI1HP
         8yMutU6LL356zOx0tGXPvrypudQ9NYjWC14hH9VNqbMLxQaNNj9/3JhWJseOGundWl9B
         u9Jqxc0wgMNOPxtf5gFX2u45e8wzmb7fI5UL+/ZA5UgJPmVPz2glrX5VGXxI1NQzp9Y9
         53INR8RgB5e/mXR0oAkND+gqHyc81JheJ19ehV7PTrlqTsKaiQ4FLB8tiDp3hWQ7Taek
         XhsQ==
X-Gm-Message-State: AOAM53238Js4fmw+lOBGR0xb7NsI92zJcOCNzShHpFKA/jsE6EIg37we
        Q50kw6SMWDaWNP/rRcTfiZnZAQ==
X-Google-Smtp-Source: ABdhPJyLdTYP/33/z6H4m2kM4BWsAFj7VacF9g6SF4M1VTWQLJniXnj9KK0+R7zgiBjg82VsEX8g3A==
X-Received: by 2002:a2e:9cd3:0:b0:258:e71c:6430 with SMTP id g19-20020a2e9cd3000000b00258e71c6430mr3034822ljj.274.1654888186948;
        Fri, 10 Jun 2022 12:09:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:09:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 12/28] phy: qcom-qmp: move QSERDES PLL registers to separate header
Date:   Fri, 10 Jun 2022 22:09:09 +0300
Message-Id: <20220610190925.3670081-13-dmitry.baryshkov@linaro.org>
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

