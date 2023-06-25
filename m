Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A7673D074
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 13:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbjFYLma (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 07:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjFYLm3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 07:42:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5FD510F
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 04:42:27 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so3006806e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 04:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687693346; x=1690285346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yHEgBhCyK3jAoHxl+ZfqdHPaLpGd5hwr3inmN3SB+4=;
        b=FiPhR+DI+S/GPwp1mknkUY3lDzv0J0iJ+rsyoxay8vx3TdlYTTL6hoR8NkjyX0H38J
         b0vJroB5GviSV2aswDwYNZ2553nZs4oEtglpGS7MIqmavZ/XBO2jmyqOwrFRFpFWRK/R
         413aTx5Mj4M9YQRFR7LMj8Br6sDMSwUtWSVH9w8uqV60tsBtuEWZ0vNjuHzyGy7kZIIj
         Um9bs824OpmbRJ6LpoHCxu5cqYqJ9ngDHxj26+h4QX97VesUqiS6fbJerPewox23ml5K
         USM6DQyMq7MzrXB08jn96g/QcaR+QbCHACxmeBmdQto05OHeK7n3Fw40bJunp5SpApU8
         EFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687693346; x=1690285346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yHEgBhCyK3jAoHxl+ZfqdHPaLpGd5hwr3inmN3SB+4=;
        b=UaIM3gHUSLzOJQl6NaHmtNBtPuvRETglfLrefCyK/Wxb2vME4XAJVk9yHCK4mgZ/G4
         svahl5gyLLhAyyGJCnvwNnDc/ZVGfsrWX5eG9Zf36opilIVHLAXIKTW/HcZdAIlJ5c6T
         BvMOtkc9XoN2BULDoHNIWJbkG2MhV9Hah9RPh6R9IvGsSXFEkXhAao+kr3kKB8O84MA4
         awFHDO4zPLSXYs6G7Di6qRBx1AvI0LHHD1S/pt6CZRzGLdl6QrXLqCM3nidD7Jp3zuem
         /tLgBbetnkKhQY65SpkJqIrSvHwLvDNfh7ef7pLo3O7pv0HP11U0Eh2VBUQq+bA4C9iV
         KjFA==
X-Gm-Message-State: AC+VfDzy9rwwuWa1siVu29IQgoGYX3gOKQkDxvUfP2aOB3ulvYFFVRV3
        5mVMvJoFWUL7kpSBHaHdqlCkOQ==
X-Google-Smtp-Source: ACHHUZ7NyU13Y7Q0o8BTaPFoDXDPjsUrgNaQoSEEsNiENYAbqwpuKC1VSvnZ1Kear1py+tQ3t6yqiQ==
X-Received: by 2002:a05:6512:532:b0:4f8:770f:1b04 with SMTP id o18-20020a056512053200b004f8770f1b04mr10871439lfc.0.1687693346213;
        Sun, 25 Jun 2023 04:42:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 04:42:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 03/15] phy: qcom: apq8064-sata: extract UNI PLL register defines
Date:   Sun, 25 Jun 2023 14:42:10 +0300
Message-Id: <20230625114222.96689-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "uni" PLL is shared between several PHYS: APQ8064's SATA,
MSM8974/APQ8084 HDMI, MSM8916 DSI, MSM8974/APQ8084 DSI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 23 +-------------
 drivers/phy/qualcomm/phy-qcom-uniphy.h       | 32 ++++++++++++++++++++
 2 files changed, 33 insertions(+), 22 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-uniphy.h

diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
index 8814f4322adf..e9c272c1e97e 100644
--- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
@@ -15,28 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 
-/* PHY registers */
-#define UNIPHY_PLL_REFCLK_CFG		0x000
-#define UNIPHY_PLL_PWRGEN_CFG		0x014
-#define UNIPHY_PLL_GLB_CFG		0x020
-#define UNIPHY_PLL_SDM_CFG0		0x038
-#define UNIPHY_PLL_SDM_CFG1		0x03C
-#define UNIPHY_PLL_SDM_CFG2		0x040
-#define UNIPHY_PLL_SDM_CFG3		0x044
-#define UNIPHY_PLL_SDM_CFG4		0x048
-#define UNIPHY_PLL_SSC_CFG0		0x04C
-#define UNIPHY_PLL_SSC_CFG1		0x050
-#define UNIPHY_PLL_SSC_CFG2		0x054
-#define UNIPHY_PLL_SSC_CFG3		0x058
-#define UNIPHY_PLL_LKDET_CFG0		0x05C
-#define UNIPHY_PLL_LKDET_CFG1		0x060
-#define UNIPHY_PLL_LKDET_CFG2		0x064
-#define UNIPHY_PLL_CAL_CFG0		0x06C
-#define UNIPHY_PLL_CAL_CFG8		0x08C
-#define UNIPHY_PLL_CAL_CFG9		0x090
-#define UNIPHY_PLL_CAL_CFG10		0x094
-#define UNIPHY_PLL_CAL_CFG11		0x098
-#define UNIPHY_PLL_STATUS		0x0C0
+#include "phy-qcom-uniphy.h"
 
 #define SATA_PHY_SER_CTRL		0x100
 #define SATA_PHY_TX_DRIV_CTRL0		0x104
diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
new file mode 100644
index 000000000000..d8be32b5317c
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef PHY_QCOM_UNIPHY_H
+#define PHY_QCOM_UNIPHY_H
+
+/* PHY registers */
+#define UNIPHY_PLL_REFCLK_CFG		0x000
+#define UNIPHY_PLL_PWRGEN_CFG		0x014
+#define UNIPHY_PLL_GLB_CFG		0x020
+#define UNIPHY_PLL_SDM_CFG0		0x038
+#define UNIPHY_PLL_SDM_CFG1		0x03c
+#define UNIPHY_PLL_SDM_CFG2		0x040
+#define UNIPHY_PLL_SDM_CFG3		0x044
+#define UNIPHY_PLL_SDM_CFG4		0x048
+#define UNIPHY_PLL_SSC_CFG0		0x04c
+#define UNIPHY_PLL_SSC_CFG1		0x050
+#define UNIPHY_PLL_SSC_CFG2		0x054
+#define UNIPHY_PLL_SSC_CFG3		0x058
+#define UNIPHY_PLL_LKDET_CFG0		0x05c
+#define UNIPHY_PLL_LKDET_CFG1		0x060
+#define UNIPHY_PLL_LKDET_CFG2		0x064
+#define UNIPHY_PLL_CAL_CFG0		0x06c
+#define UNIPHY_PLL_CAL_CFG8		0x08c
+#define UNIPHY_PLL_CAL_CFG9		0x090
+#define UNIPHY_PLL_CAL_CFG10		0x094
+#define UNIPHY_PLL_CAL_CFG11		0x098
+#define UNIPHY_PLL_STATUS		0x0c0
+
+#endif
-- 
2.39.2

