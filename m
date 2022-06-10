Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7097546CFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350464AbiFJTKB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350460AbiFJTKA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:10:00 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311C9DEA3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:58 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s10so101735ljh.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SFiyKRqhuTNMazS9vTjba+gcY3WzJK2u75qhYmy0m7k=;
        b=Kya1H5FGTKuhpmyI6Hr3FmSAVvAjLdTZiwoRwg70AM5kH17IIjb47veZxZLg5IfmF6
         H6j5adYiivdUR1WalIjc76W5M+4wWZnmmN5QeWHTFF+AOhudyQ1hP+ePz3qix1d7H7fC
         Cma7HayUSxkStOR8iOxsixca/EwnJFFA6X7QhVtpi4i+TEB3xazLYThOTG/IidwC4yZH
         u+SwMkJMkRYTSwsACMFRXH+bsErzAO4W2gNY7MOOwmFFl1gYab2z3HL0l3/u/LOziK2z
         BQ1hBbXBR6RZ3t2e19uk1Yp74ocAsm233vq/QGHySMu2vn6ubht0hFMGrBdqWSZ+ZcYx
         UTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SFiyKRqhuTNMazS9vTjba+gcY3WzJK2u75qhYmy0m7k=;
        b=qENQXHiHE5tkhouj9VhrUholWx3M/rKg8roNDnUjpvB0oaDRSy/faRk5JJcPW8/iUT
         6OANC60MH4TZ74Pd7bL5lNVyQrFgsPAeBPzXEsIWWPU/34zh3ytEZq4SokJ65jvUDFBz
         JwTBweDfoOR6PeLCGF+Yk4ByYICDcpvrizn0juXsS23FruxmjzX8IHuu8WB0TB8czLvQ
         Kg5Nd7BNPxUc0THNFQ7eU+ujo8K5yD26Cj5fdZmi0drTOkdjGuRH4FRgifVabB/WwX4F
         vTSSVnr5+WFbxVcTNyHkhGOcH7cdKGzHpkugq0Cnw9cZUqGqJNVj1VgK6Bok19Y35XBJ
         zh5Q==
X-Gm-Message-State: AOAM530IO/cAjiqMlFSPicL1XxHk9pYJ7ZxuYIucfORN13odGS7uV8PQ
        NtE45KVFJEqZg2KXX8nmhPI1xQ==
X-Google-Smtp-Source: ABdhPJxPBM/7PhdbTUTepXi92DoLx7nmJj5ZFGWX0uwDcMefzLTyiRFibCsOo7KS79a84JQCpS6qXQ==
X-Received: by 2002:a05:651c:10c:b0:258:e5e6:e18d with SMTP id a12-20020a05651c010c00b00258e5e6e18dmr3068982ljb.50.1654888196496;
        Fri, 10 Jun 2022 12:09:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:09:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 18/28] phy: qcom-qmp: split allegedly 4.20 and 5.20 TX/RX registers
Date:   Fri, 10 Jun 2022 22:09:15 +0300
Message-Id: <20220610190925.3670081-19-dmitry.baryshkov@linaro.org>
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

Split registers definitions belonging allegedly to 4.20 and 5.20 QMP
PHYs. They are used for the PCIe QMP PHYs, which have no good open
source reference.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy-qcom-qmp-qserdes-txrx-v4_20.h         | 43 +++++++++
 .../phy-qcom-qmp-qserdes-txrx-v5_20.h         | 60 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 88 +------------------
 3 files changed, 105 insertions(+), 86 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v5_20.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4_20.h
new file mode 100644
index 000000000000..114570f3017f
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4_20.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V4_20_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V4_20_H_
+
+/* Only for QMP V4_20 PHY - TX registers */
+#define QSERDES_V4_20_TX_LANE_MODE_1			0x88
+#define QSERDES_V4_20_TX_LANE_MODE_2			0x8c
+#define QSERDES_V4_20_TX_LANE_MODE_3			0x90
+#define QSERDES_V4_20_TX_VMODE_CTRL1			0xc4
+#define QSERDES_V4_20_TX_PI_QEC_CTRL			0xe0
+
+/* Only for QMP V4_20 PHY - RX registers */
+#define QSERDES_V4_20_RX_FO_GAIN_RATE2			0x008
+#define QSERDES_V4_20_RX_UCDR_PI_CONTROLS		0x058
+#define QSERDES_V4_20_RX_AUX_DATA_TCOARSE_TFINE		0x0ac
+#define QSERDES_V4_20_RX_DFE_3				0x110
+#define QSERDES_V4_20_RX_DFE_DAC_ENABLE1		0x134
+#define QSERDES_V4_20_RX_DFE_DAC_ENABLE2		0x138
+#define QSERDES_V4_20_RX_VGA_CAL_CNTRL2			0x150
+#define QSERDES_V4_20_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x178
+#define QSERDES_V4_20_RX_RX_MODE_RATE_0_1_B1		0x1c8
+#define QSERDES_V4_20_RX_RX_MODE_RATE_0_1_B2		0x1cc
+#define QSERDES_V4_20_RX_RX_MODE_RATE_0_1_B3		0x1d0
+#define QSERDES_V4_20_RX_RX_MODE_RATE_0_1_B4		0x1d4
+#define QSERDES_V4_20_RX_RX_MODE_RATE2_B0		0x1d8
+#define QSERDES_V4_20_RX_RX_MODE_RATE2_B1		0x1dc
+#define QSERDES_V4_20_RX_RX_MODE_RATE2_B2		0x1e0
+#define QSERDES_V4_20_RX_RX_MODE_RATE2_B3		0x1e4
+#define QSERDES_V4_20_RX_RX_MODE_RATE2_B4		0x1e8
+#define QSERDES_V4_20_RX_RX_MODE_RATE3_B0		0x1ec
+#define QSERDES_V4_20_RX_RX_MODE_RATE3_B1		0x1f0
+#define QSERDES_V4_20_RX_RX_MODE_RATE3_B2		0x1f4
+#define QSERDES_V4_20_RX_RX_MODE_RATE3_B3		0x1f8
+#define QSERDES_V4_20_RX_RX_MODE_RATE3_B4		0x1fc
+#define QSERDES_V4_20_RX_PHPRE_CTRL			0x200
+#define QSERDES_V4_20_RX_DFE_CTLE_POST_CAL_OFFSET	0x20c
+#define QSERDES_V4_20_RX_MARG_COARSE_CTRL2		0x23c
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v5_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v5_20.h
new file mode 100644
index 000000000000..86c01104799e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v5_20.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V5_20_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V5_20_H_
+
+/* Only for QMP V5_20 PHY - TX registers */
+#define QSERDES_V5_20_TX_RES_CODE_LANE_OFFSET_TX	0x30
+#define QSERDES_V5_20_TX_RES_CODE_LANE_OFFSET_RX	0x34
+#define QSERDES_V5_20_TX_LANE_MODE_1			0x78
+#define QSERDES_V5_20_TX_LANE_MODE_2			0x7c
+
+/* Only for QMP V5_20 PHY - RX registers */
+#define QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE2		0x008
+#define QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE3		0x00c
+#define QSERDES_V5_20_RX_UCDR_PI_CONTROLS		0x020
+#define QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_0_1	0x02c
+#define QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_2_3	0x030
+#define QSERDES_V5_20_RX_RX_IDAC_SAOFFSET		0x07c
+#define QSERDES_V5_20_RX_DFE_3				0x090
+#define QSERDES_V5_20_RX_DFE_DAC_ENABLE1		0x0b4
+#define QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH1		0x0c4
+#define QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH2		0x0c8
+#define QSERDES_V5_20_RX_VGA_CAL_MAN_VAL		0x0dc
+#define QSERDES_V5_20_RX_GM_CAL				0x0ec
+#define QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4		0x108
+#define QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B1		0x164
+#define QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2		0x168
+#define QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B3		0x16c
+#define QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B5		0x174
+#define QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B6		0x178
+#define QSERDES_V5_20_RX_RX_MODE_RATE2_B0		0x17c
+#define QSERDES_V5_20_RX_RX_MODE_RATE2_B1		0x180
+#define QSERDES_V5_20_RX_RX_MODE_RATE2_B2		0x184
+#define QSERDES_V5_20_RX_RX_MODE_RATE2_B3		0x188
+#define QSERDES_V5_20_RX_RX_MODE_RATE2_B4		0x18c
+#define QSERDES_V5_20_RX_RX_MODE_RATE2_B5		0x190
+#define QSERDES_V5_20_RX_RX_MODE_RATE2_B6		0x194
+#define QSERDES_V5_20_RX_RX_MODE_RATE3_B0		0x198
+#define QSERDES_V5_20_RX_RX_MODE_RATE3_B1		0x19c
+#define QSERDES_V5_20_RX_RX_MODE_RATE3_B2		0x1a0
+#define QSERDES_V5_20_RX_RX_MODE_RATE3_B3		0x1a4
+#define QSERDES_V5_20_RX_RX_MODE_RATE3_B4		0x1a8
+#define QSERDES_V5_20_RX_RX_MODE_RATE3_B5		0x1ac
+#define QSERDES_V5_20_RX_RX_MODE_RATE3_B6		0x1b0
+#define QSERDES_V5_20_RX_PHPRE_CTRL			0x1b4
+#define QSERDES_V5_20_RX_DFE_CTLE_POST_CAL_OFFSET	0x1c0
+#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH1_RATE210	0x1f4
+#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH1_RATE3	0x1f8
+#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH2_RATE210	0x1fc
+#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH2_RATE3	0x200
+#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH3_RATE210	0x204
+#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH3_RATE3	0x208
+#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH4_RATE3	0x210
+#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH5_RATE3	0x218
+#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH6_RATE3	0x220
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 59510d927fec..1f8684c87c06 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -14,9 +14,11 @@
 
 #include "phy-qcom-qmp-qserdes-com-v4.h"
 #include "phy-qcom-qmp-qserdes-txrx-v4.h"
+#include "phy-qcom-qmp-qserdes-txrx-v4_20.h"
 
 #include "phy-qcom-qmp-qserdes-com-v5.h"
 #include "phy-qcom-qmp-qserdes-txrx-v5.h"
+#include "phy-qcom-qmp-qserdes-txrx-v5_20.h"
 
 #include "phy-qcom-qmp-qserdes-pll.h"
 
@@ -108,14 +110,6 @@
 
 #define QSERDES_V3_DP_PHY_STATUS			0x0c0
 
-
-/* Only for QMP V4_20 PHY - TX registers */
-#define QSERDES_V4_20_TX_LANE_MODE_1			0x88
-#define QSERDES_V4_20_TX_LANE_MODE_2			0x8c
-#define QSERDES_V4_20_TX_LANE_MODE_3			0x90
-#define QSERDES_V4_20_TX_VMODE_CTRL1			0xc4
-#define QSERDES_V4_20_TX_PI_QEC_CTRL			0xe0
-
 /* Only for QMP V4 PHY - DP PHY registers */
 #define QSERDES_V4_DP_PHY_CFG_1				0x014
 #define QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK		0x054
@@ -127,33 +121,6 @@
 #define QSERDES_V4_DP_PHY_AUX_INTERRUPT_STATUS		0x0d8
 #define QSERDES_V4_DP_PHY_STATUS			0x0dc
 
-/* Only for QMP V4_20 PHY - RX registers */
-#define QSERDES_V4_20_RX_FO_GAIN_RATE2			0x008
-#define QSERDES_V4_20_RX_UCDR_PI_CONTROLS		0x058
-#define QSERDES_V4_20_RX_AUX_DATA_TCOARSE_TFINE		0x0ac
-#define QSERDES_V4_20_RX_DFE_3				0x110
-#define QSERDES_V4_20_RX_DFE_DAC_ENABLE1		0x134
-#define QSERDES_V4_20_RX_DFE_DAC_ENABLE2		0x138
-#define QSERDES_V4_20_RX_VGA_CAL_CNTRL2			0x150
-#define QSERDES_V4_20_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x178
-#define QSERDES_V4_20_RX_RX_MODE_RATE_0_1_B1		0x1c8
-#define QSERDES_V4_20_RX_RX_MODE_RATE_0_1_B2		0x1cc
-#define QSERDES_V4_20_RX_RX_MODE_RATE_0_1_B3		0x1d0
-#define QSERDES_V4_20_RX_RX_MODE_RATE_0_1_B4		0x1d4
-#define QSERDES_V4_20_RX_RX_MODE_RATE2_B0		0x1d8
-#define QSERDES_V4_20_RX_RX_MODE_RATE2_B1		0x1dc
-#define QSERDES_V4_20_RX_RX_MODE_RATE2_B2		0x1e0
-#define QSERDES_V4_20_RX_RX_MODE_RATE2_B3		0x1e4
-#define QSERDES_V4_20_RX_RX_MODE_RATE2_B4		0x1e8
-#define QSERDES_V4_20_RX_RX_MODE_RATE3_B0		0x1ec
-#define QSERDES_V4_20_RX_RX_MODE_RATE3_B1		0x1f0
-#define QSERDES_V4_20_RX_RX_MODE_RATE3_B2		0x1f4
-#define QSERDES_V4_20_RX_RX_MODE_RATE3_B3		0x1f8
-#define QSERDES_V4_20_RX_RX_MODE_RATE3_B4		0x1fc
-#define QSERDES_V4_20_RX_PHPRE_CTRL			0x200
-#define QSERDES_V4_20_RX_DFE_CTLE_POST_CAL_OFFSET	0x20c
-#define QSERDES_V4_20_RX_MARG_COARSE_CTRL2		0x23c
-
 /* Only for QMP V4_20 PHY - USB/PCIe PCS registers */
 #define QPHY_V4_20_PCS_RX_SIGDET_LVL			0x188
 #define QPHY_V4_20_PCS_EQ_CONFIG2			0x1d8
@@ -176,57 +143,6 @@
 #define QPHY_V4_20_PCS_LANE1_INSIG_SW_CTRL2		0x824
 #define QPHY_V4_20_PCS_LANE1_INSIG_MX_CTRL2		0x828
 
-/* Only for QMP V5_20 PHY - TX registers */
-#define QSERDES_V5_20_TX_RES_CODE_LANE_OFFSET_TX	0x30
-#define QSERDES_V5_20_TX_RES_CODE_LANE_OFFSET_RX	0x34
-#define QSERDES_V5_20_TX_LANE_MODE_1			0x78
-#define QSERDES_V5_20_TX_LANE_MODE_2			0x7c
-
-/* Only for QMP V5_20 PHY - RX registers */
-#define QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE2		0x008
-#define QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE3		0x00c
-#define QSERDES_V5_20_RX_UCDR_PI_CONTROLS		0x020
-#define QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_0_1	0x02c
-#define QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_2_3	0x030
-#define QSERDES_V5_20_RX_RX_IDAC_SAOFFSET		0x07c
-#define QSERDES_V5_20_RX_DFE_3				0x090
-#define QSERDES_V5_20_RX_DFE_DAC_ENABLE1		0x0b4
-#define QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH1		0x0c4
-#define QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH2		0x0c8
-#define QSERDES_V5_20_RX_VGA_CAL_MAN_VAL		0x0dc
-#define QSERDES_V5_20_RX_GM_CAL				0x0ec
-#define QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4		0x108
-#define QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B1		0x164
-#define QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2		0x168
-#define QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B3		0x16c
-#define QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B5		0x174
-#define QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B6		0x178
-#define QSERDES_V5_20_RX_RX_MODE_RATE2_B0		0x17c
-#define QSERDES_V5_20_RX_RX_MODE_RATE2_B1		0x180
-#define QSERDES_V5_20_RX_RX_MODE_RATE2_B2		0x184
-#define QSERDES_V5_20_RX_RX_MODE_RATE2_B3		0x188
-#define QSERDES_V5_20_RX_RX_MODE_RATE2_B4		0x18c
-#define QSERDES_V5_20_RX_RX_MODE_RATE2_B5		0x190
-#define QSERDES_V5_20_RX_RX_MODE_RATE2_B6		0x194
-#define QSERDES_V5_20_RX_RX_MODE_RATE3_B0		0x198
-#define QSERDES_V5_20_RX_RX_MODE_RATE3_B1		0x19c
-#define QSERDES_V5_20_RX_RX_MODE_RATE3_B2		0x1a0
-#define QSERDES_V5_20_RX_RX_MODE_RATE3_B3		0x1a4
-#define QSERDES_V5_20_RX_RX_MODE_RATE3_B4		0x1a8
-#define QSERDES_V5_20_RX_RX_MODE_RATE3_B5		0x1ac
-#define QSERDES_V5_20_RX_RX_MODE_RATE3_B6		0x1b0
-#define QSERDES_V5_20_RX_PHPRE_CTRL			0x1b4
-#define QSERDES_V5_20_RX_DFE_CTLE_POST_CAL_OFFSET	0x1c0
-#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH1_RATE210	0x1f4
-#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH1_RATE3	0x1f8
-#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH2_RATE210	0x1fc
-#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH2_RATE3	0x200
-#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH3_RATE210	0x204
-#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH3_RATE3	0x208
-#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH4_RATE3	0x210
-#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH5_RATE3	0x218
-#define QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH6_RATE3	0x220
-
 /* Only for QMP V5_20 PHY - PCIe PCS registers */
 #define QPHY_V5_20_PCS_PCIE_ENDPOINT_REFCLK_DRIVE	0x01c
 #define QPHY_V5_20_PCS_PCIE_OSC_DTCT_ACTIONS		0x090
-- 
2.35.1

