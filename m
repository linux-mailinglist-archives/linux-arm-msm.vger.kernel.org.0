Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D236566666
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbiGEJnl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiGEJnk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:40 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4033B1E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:38 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j21so19665203lfe.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OMhvoows2nRxYeovzopRV3kchz7EG7WvEIUgubFlpR8=;
        b=C33VVrtP3C/WMG7DzpiZ6+TMxNTw53+WTigNVFE75POWO588GoCnOCm+eT813DGsPx
         AwA6J4S95/+S9TbPhCkpL1AWnJ/+HexXOoLB6w6M5aOC6YHynokOxBmQJ/SaNmVWr7F3
         yRCieaL7NmlitlqofSiTM4NKOZZz9O0b2/bkUUbNiG+3qmCRYRPuMAO7pwtjTbo96Rbn
         OuPepzzM3t8L3DfutOvvR+5o/4u08r6KYHQZIHNfmD+IdCYKHLuVqIEP+WL2eKJ0cAd8
         LsOe4J1sdZ1VFGdSAc0G5eoSdcH700Pg7PYGig7DPYxDywpYlW8EJ4z/WKqWRda+tyrC
         0bkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OMhvoows2nRxYeovzopRV3kchz7EG7WvEIUgubFlpR8=;
        b=R/NG7Dgr5NxN6zIjCZhnTDtIAwfWSLhLmX5kj1RpqZ8INsnoffApQ6ueIUTLNWM6Ik
         NLE8hG7/l4XteyzPG9/e9JTBVHekmybF57+7QRCPKiNo/IhSwdswkypmuU1V3eQZTHGC
         l9u8VtAcdlOS6Jy1RYIBAQ/1wlRFTIipn63sKM4tahW96rfKLywelKg6MI+vKxboX7kU
         yGYd8Y6FXeIwQ2dHRMOMgaT5F7TpIEZ70wwQRh7X0/tcQHQRBUNp/LSclbBXe2vzZ/Sf
         j5kAsEMfGlxPJZwpkQLJFVfqAREpYRZRaleZzlXbWLLJjCmhDiMeYzn3OvRBmZLSdSO3
         3Zpg==
X-Gm-Message-State: AJIora9J3buhwJ1FrGaTCy5qa+D4ZHuTm6RfzjrHEUcE3On4hfY/zvj8
        A+rzrSXTwz+s/Vj23z+zBFjVhw==
X-Google-Smtp-Source: AGRyM1thrFmAaBY+yGC0Q36YwDa4SXL9sQ06lrB+lVdD/Cdo8PUyGqTkJ5Xy5iedrGnAhjIncxOVKQ==
X-Received: by 2002:a05:6512:3409:b0:47f:af77:8678 with SMTP id i9-20020a056512340900b0047faf778678mr23340951lfr.152.1657014217323;
        Tue, 05 Jul 2022 02:43:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 19/28] phy: qcom-qmp: split allegedly 4.20 and 5.20 PCS registers
Date:   Tue,  5 Jul 2022 12:43:11 +0300
Message-Id: <20220705094320.1313312-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
References: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
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

Split registers definitions belonging allegedly to 4.20 and 5.20 QMP
PHYs. They are used for the PCIe QMP PHYs, which have no good open
source reference.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h    | 17 ++++++++++++
 .../qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h    | 17 ++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4_20.h | 15 +++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 27 ++++---------------
 4 files changed, 54 insertions(+), 22 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4_20.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h
new file mode 100644
index 000000000000..af273602998e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_PCIE_V4_20_H_
+#define QCOM_PHY_QMP_PCS_PCIE_V4_20_H_
+
+#define QPHY_V4_20_PCS_PCIE_EQ_CONFIG1			0x0a0
+#define QPHY_V4_20_PCS_PCIE_G3_RXEQEVAL_TIME		0x0f0
+#define QPHY_V4_20_PCS_PCIE_G4_RXEQEVAL_TIME		0x0f4
+#define QPHY_V4_20_PCS_PCIE_G4_EQ_CONFIG2		0x0fc
+#define QPHY_V4_20_PCS_PCIE_G4_EQ_CONFIG5		0x108
+#define QPHY_V4_20_PCS_LANE1_INSIG_SW_CTRL2		0x824
+#define QPHY_V4_20_PCS_LANE1_INSIG_MX_CTRL2		0x828
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
new file mode 100644
index 000000000000..1eedf50cf9cb
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_PCIE_V5_20_H_
+#define QCOM_PHY_QMP_PCS_PCIE_V5_20_H_
+
+/* Only for QMP V5_20 PHY - PCIe PCS registers */
+#define QPHY_V5_20_PCS_PCIE_ENDPOINT_REFCLK_DRIVE	0x01c
+#define QPHY_V5_20_PCS_PCIE_OSC_DTCT_ACTIONS		0x090
+#define QPHY_V5_20_PCS_PCIE_EQ_CONFIG1			0x0a0
+#define QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG5		0x108
+#define QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN			0x15c
+#define QPHY_V5_20_PCS_PCIE_RX_MARGINING_CONFIG3	0x184
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4_20.h
new file mode 100644
index 000000000000..08c3dd115488
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4_20.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V4_20_H_
+#define QCOM_PHY_QMP_PCS_V4_20_H_
+
+/* Only for QMP V4_20 PHY - USB/PCIe PCS registers */
+#define QPHY_V4_20_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V4_20_PCS_EQ_CONFIG2			0x1d8
+#define QPHY_V4_20_PCS_EQ_CONFIG4			0x1e0
+#define QPHY_V4_20_PCS_EQ_CONFIG5			0x1e4
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 1f8684c87c06..cdbbcf6b5686 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -32,11 +32,16 @@
 #include "phy-qcom-qmp-pcs-usb-v4.h"
 #include "phy-qcom-qmp-pcs-ufs-v4.h"
 
+#include "phy-qcom-qmp-pcs-v4_20.h"
+#include "phy-qcom-qmp-pcs-pcie-v4_20.h"
+
 #include "phy-qcom-qmp-pcs-v5.h"
 #include "phy-qcom-qmp-pcs-pcie-v5.h"
 #include "phy-qcom-qmp-pcs-usb-v5.h"
 #include "phy-qcom-qmp-pcs-ufs-v5.h"
 
+#include "phy-qcom-qmp-pcs-pcie-v5_20.h"
+
 #include "phy-qcom-qmp-pcie-qhp.h"
 
 /* Only for QMP V3 & V4 PHY - DP COM registers */
@@ -121,12 +126,6 @@
 #define QSERDES_V4_DP_PHY_AUX_INTERRUPT_STATUS		0x0d8
 #define QSERDES_V4_DP_PHY_STATUS			0x0dc
 
-/* Only for QMP V4_20 PHY - USB/PCIe PCS registers */
-#define QPHY_V4_20_PCS_RX_SIGDET_LVL			0x188
-#define QPHY_V4_20_PCS_EQ_CONFIG2			0x1d8
-#define QPHY_V4_20_PCS_EQ_CONFIG4			0x1e0
-#define QPHY_V4_20_PCS_EQ_CONFIG5			0x1e4
-
 /* Only for QMP V4 PHY - PCS_MISC registers */
 #define QPHY_V4_PCS_MISC_TYPEC_CTRL			0x00
 #define QPHY_V4_PCS_MISC_TYPEC_PWRDN_CTRL		0x04
@@ -135,20 +134,4 @@
 #define QPHY_V4_PCS_MISC_TYPEC_STATUS			0x10
 #define QPHY_V4_PCS_MISC_PLACEHOLDER_STATUS		0x14
 
-#define QPHY_V4_20_PCS_PCIE_EQ_CONFIG1			0x0a0
-#define QPHY_V4_20_PCS_PCIE_G3_RXEQEVAL_TIME		0x0f0
-#define QPHY_V4_20_PCS_PCIE_G4_RXEQEVAL_TIME		0x0f4
-#define QPHY_V4_20_PCS_PCIE_G4_EQ_CONFIG2		0x0fc
-#define QPHY_V4_20_PCS_PCIE_G4_EQ_CONFIG5		0x108
-#define QPHY_V4_20_PCS_LANE1_INSIG_SW_CTRL2		0x824
-#define QPHY_V4_20_PCS_LANE1_INSIG_MX_CTRL2		0x828
-
-/* Only for QMP V5_20 PHY - PCIe PCS registers */
-#define QPHY_V5_20_PCS_PCIE_ENDPOINT_REFCLK_DRIVE	0x01c
-#define QPHY_V5_20_PCS_PCIE_OSC_DTCT_ACTIONS		0x090
-#define QPHY_V5_20_PCS_PCIE_EQ_CONFIG1			0x0a0
-#define QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG5		0x108
-#define QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN			0x15c
-#define QPHY_V5_20_PCS_PCIE_RX_MARGINING_CONFIG3	0x184
-
 #endif
-- 
2.35.1

