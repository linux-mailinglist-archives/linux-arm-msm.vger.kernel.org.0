Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A862546CF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350455AbiFJTJv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350287AbiFJTJu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:09:50 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE09324
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:49 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id e4so154917ljl.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vO5kMCLoocFQhwYevseik9XMf7ZqUBB1Y4tGgw7R1Eg=;
        b=Lw8MQwmSgXpUJo070o8/D9UNWeOV9gqDwmW7UwTwfsVeD34N1fH/KjWtTsYT6rHbLI
         NQyOYh/2/J7WgSSCgqeF/VyoQzy2ATLbD7Ik2F5ZIeh8ypeJ/ItcheekbXNdu0U3DTCs
         G13G7SmukBOtEpQEAETzSeUkJ8dyKfxJ7/QXdwGlnhRIyk6eJX1l+ppgwlfMUMV3XElz
         WQsgtShid94TAzgV2B2x5wAgKNPcEY9TIaJKSYOhy2uDBCJxOkS6RwZeuGETjlnA1t2I
         2p3A/Gx0pDDDQfr+JGM89GpwswYmRBCRG1qIp8PBP5R0VAd5G6rvPQcTLg08e0c0Hmxx
         atMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vO5kMCLoocFQhwYevseik9XMf7ZqUBB1Y4tGgw7R1Eg=;
        b=TY6M7yl7ORa1vWJeBV3vX1YBMTtlW866HlYQSLkS22ZxdDBCCFTnvn771qGugh1m2F
         PXSanNbm+O82buC1GCCSKMYss3oejckZ37cAu8+dAvSokM0jG7q/YxvbzIZCjQ6oTH5b
         HKE3UkkgH9eHmjHdRLI4nidtjZ6CimtmCLd2dgo9cV4+5zNRHknlz6mGHlHGyix+rCiE
         F9JwTrxdsgBU7eFqZu825T5+bPMYB6UaYV8mp9/Hj5ji0WrMOXWTI4zOsQ22viUDHJYQ
         bss1UHL4IYRwoQZmQOIwzkBVR1SrTGR/HNNYid4NUk1lXkQliKB6YeG2AzBQElMfNwAc
         rHVQ==
X-Gm-Message-State: AOAM532Oj1Tb99nxls4YxgqVf7nkcxiQfA4w7Dp9Oi4Xv3FQPqRPGVuo
        cD7yPDj/u+vZr03wwf1fLDhqqneGg/y1d/wF
X-Google-Smtp-Source: ABdhPJyIXDEcuRDqVS3pRtvbi7HRyXvXS/s5axRw31Vn1w/4eir8PbZEGPVR1NKZtWrWZqdqyrGzAA==
X-Received: by 2002:a05:651c:158c:b0:250:a23d:2701 with SMTP id h12-20020a05651c158c00b00250a23d2701mr62851726ljq.475.1654888189221;
        Fri, 10 Jun 2022 12:09:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:09:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 13/28] phy: qcom-qmp: move PCS V2 registers to separate header
Date:   Fri, 10 Jun 2022 22:09:10 +0300
Message-Id: <20220610190925.3670081-14-dmitry.baryshkov@linaro.org>
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

Move PCS V2 registers to the separate header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h | 38 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h        | 29 +----------------
 2 files changed, 39 insertions(+), 28 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
new file mode 100644
index 000000000000..3fc3c0562d16
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V2_H_
+#define QCOM_PHY_QMP_PCS_V2_H_
+
+/* Only for QMP V2 PHY - PCS registers */
+#define QPHY_V2_PCS_POWER_DOWN_CONTROL			0x004
+#define QPHY_V2_PCS_TXDEEMPH_M6DB_V0			0x024
+#define QPHY_V2_PCS_TXDEEMPH_M3P5DB_V0			0x028
+#define QPHY_V2_PCS_TX_LARGE_AMP_DRV_LVL		0x034
+#define QPHY_V2_PCS_TX_LARGE_AMP_POST_EMP_LVL		0x038
+#define QPHY_V2_PCS_TX_SMALL_AMP_DRV_LVL		0x03c
+#define QPHY_V2_PCS_TX_SMALL_AMP_POST_EMP_LVL		0x040
+#define QPHY_V2_PCS_ENDPOINT_REFCLK_DRIVE		0x054
+#define QPHY_V2_PCS_RX_IDLE_DTCT_CNTRL			0x058
+#define QPHY_V2_PCS_POWER_STATE_CONFIG1			0x060
+#define QPHY_V2_PCS_POWER_STATE_CONFIG2			0x064
+#define QPHY_V2_PCS_POWER_STATE_CONFIG4			0x06c
+#define QPHY_V2_PCS_LOCK_DETECT_CONFIG1			0x080
+#define QPHY_V2_PCS_LOCK_DETECT_CONFIG2			0x084
+#define QPHY_V2_PCS_LOCK_DETECT_CONFIG3			0x088
+#define QPHY_V2_PCS_PWRUP_RESET_DLY_TIME_AUXCLK		0x0a0
+#define QPHY_V2_PCS_LP_WAKEUP_DLY_TIME_AUXCLK		0x0a4
+#define QPHY_V2_PCS_RX_MIN_STALL_NOCONFIG_TIME_CAP	0x0cc
+#define QPHY_V2_PCS_RX_SYM_RESYNC_CTRL			0x13c
+#define QPHY_V2_PCS_RX_MIN_HIBERN8_TIME			0x140
+#define QPHY_V2_PCS_RX_SIGDET_CTRL2			0x148
+#define QPHY_V2_PCS_RX_PWM_GEAR_BAND			0x154
+#define QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB	0x1a8
+#define QPHY_V2_PCS_OSC_DTCT_ACTIONS			0x1ac
+#define QPHY_V2_PCS_RX_SIGDET_LVL			0x1d8
+#define QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB	0x1dc
+#define QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB	0x1e0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 07e281c818b1..1bb57d1563c3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -20,34 +20,7 @@
 
 #include "phy-qcom-qmp-qserdes-pll.h"
 
-/* Only for QMP V2 PHY - PCS registers */
-#define QPHY_V2_PCS_POWER_DOWN_CONTROL				0x04
-#define QPHY_V2_PCS_TXDEEMPH_M6DB_V0				0x24
-#define QPHY_V2_PCS_TXDEEMPH_M3P5DB_V0				0x28
-#define QPHY_V2_PCS_TX_LARGE_AMP_DRV_LVL			0x34
-#define QPHY_V2_PCS_TX_LARGE_AMP_POST_EMP_LVL			0x38
-#define QPHY_V2_PCS_TX_SMALL_AMP_DRV_LVL			0x3c
-#define QPHY_V2_PCS_TX_SMALL_AMP_POST_EMP_LVL			0x40
-#define QPHY_V2_PCS_ENDPOINT_REFCLK_DRIVE			0x54
-#define QPHY_V2_PCS_RX_IDLE_DTCT_CNTRL				0x58
-#define QPHY_V2_PCS_POWER_STATE_CONFIG1			0x60
-#define QPHY_V2_PCS_POWER_STATE_CONFIG2			0x64
-#define QPHY_V2_PCS_POWER_STATE_CONFIG4			0x6c
-#define QPHY_V2_PCS_LOCK_DETECT_CONFIG1			0x80
-#define QPHY_V2_PCS_LOCK_DETECT_CONFIG2			0x84
-#define QPHY_V2_PCS_LOCK_DETECT_CONFIG3			0x88
-#define QPHY_V2_PCS_PWRUP_RESET_DLY_TIME_AUXCLK		0xa0
-#define QPHY_V2_PCS_LP_WAKEUP_DLY_TIME_AUXCLK			0xa4
-#define QPHY_V2_PCS_RX_MIN_STALL_NOCONFIG_TIME_CAP		0xcc
-#define QPHY_V2_PCS_RX_SYM_RESYNC_CTRL				0x13c
-#define QPHY_V2_PCS_RX_MIN_HIBERN8_TIME			0x140
-#define QPHY_V2_PCS_RX_SIGDET_CTRL2				0x148
-#define QPHY_V2_PCS_RX_PWM_GEAR_BAND				0x154
-#define QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB		0x1a8
-#define QPHY_V2_PCS_OSC_DTCT_ACTIONS				0x1ac
-#define QPHY_V2_PCS_RX_SIGDET_LVL				0x1d8
-#define QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB		0x1dc
-#define QPHY_V2_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB		0x1e0
+#include "phy-qcom-qmp-pcs-v2.h"
 
 /* Only for QMP V3 & V4 PHY - DP COM registers */
 #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
-- 
2.35.1

