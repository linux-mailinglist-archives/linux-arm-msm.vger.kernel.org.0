Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB90566660
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiGEJni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiGEJnf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:35 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA36FB1E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:33 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f39so19624333lfv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vO5kMCLoocFQhwYevseik9XMf7ZqUBB1Y4tGgw7R1Eg=;
        b=xwtlgwwGv42A/NQuoUR7HAewYmgG1jSmf7H29uR3Q9vk8Ilebag4Cq2slGAsEnTmwR
         8HD1qJrTPss9ZAZxbIKKvi35KR2/tPdhxyZO6gX/UHOyNiE59FkEzoQuyTcA+6ctZKkr
         RT8kPC339vplBqHmSDS6HZcezoZMbcgxhX+dbQ3O/ruL2KdnjPBXkfkgP6QVOCAtWCG+
         h2qWuUeZY7a7Ecrgx1nRQRuGy9XFs84t5QlZWCpS11gb1BlI5Ey9a0TfElhUv7j/OUPG
         hvBC+FZGN9DXHHbKTjKE79M9pPdpY1feN9ZUvVUrN6pvVA/vIOmYuU/j1dc+yCbSaUGI
         KsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vO5kMCLoocFQhwYevseik9XMf7ZqUBB1Y4tGgw7R1Eg=;
        b=BSd+XdnkV1WmBJ2jmTFM9C5H1U3LtMZ9M35Re0KzdkAD8QXJsk9LBM5BAk5pw88MDv
         iMCWDtuGGmfUWjkcCD7HS7N+tloa6VJqr1VkOE7WC2Rgc0RH/9Fza0FXRkOctl+xk5ne
         ZDPs2+gZNMk4PnSEq6nlGOeS2OV5DDkriAeeo6ftPMz1Iss3QmNVtyPDO4fMbo6ecIgA
         ng5W6k7YsVvDH/tj99ScDq7GdKEI6C1sa/90v068RW6U7Rq/FH4vUrd7ubaDBZ3b1f/a
         cKu0fi8ZmdCtlRHyiE2GSbbZhUacDW/5M9NwG0pnuncZlmIbqZKEpR+nBrHWHckWMOiW
         SDAw==
X-Gm-Message-State: AJIora8pZnko4jUcoiVjXygeTEM3gFzRSQEvfRmn3CLJsizyVBiUFjkj
        AnUxtmSbnvyC6+UlXcCmE9af4A==
X-Google-Smtp-Source: AGRyM1s3o8cviL35OoLo73H2Fg8Fb7HIQxQDzq3Uf9UicSmlF4SGB3tXH7RTx+LG/g7c/6nAiA7GNw==
X-Received: by 2002:a05:6512:261f:b0:480:fd2b:23c8 with SMTP id bt31-20020a056512261f00b00480fd2b23c8mr22479662lfb.434.1657014212212;
        Tue, 05 Jul 2022 02:43:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 13/28] phy: qcom-qmp: move PCS V2 registers to separate header
Date:   Tue,  5 Jul 2022 12:43:05 +0300
Message-Id: <20220705094320.1313312-14-dmitry.baryshkov@linaro.org>
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

