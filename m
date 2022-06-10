Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7747546CF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350458AbiFJTJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348545AbiFJTJy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:09:54 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99912DF7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:52 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id c30so116259ljr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JlgKlwRAIh6z/Ina4P2+HNN0zu9VC9y9zZhbFp4feFA=;
        b=X35PRZ7gvDS2eOmCFWSSMUd/1Hk0FoBPBCe8NDiHBhsi3PX3uCm2WTNkQCDE3T39zQ
         /t0fQXdJ9jc8j1wcTqguJwQ0xJRT79mOyNYWvxLSdYtFvRdaS1AODw+qcU+PxnV823f5
         skeC3Rsx+BmXfvXXPwFMrtobf1w79SaSacqE80QviEslLDF+RjZsnK8ae52nuil2B3RS
         oq5wW0HZPXbM6pdHusG2wpSmo5jQje5m6sqkJM22J2ztISHGl8wXVZmcNYm/o+/lNu7Y
         olQ0dAYcutNhUr5KDkcVTsDjtcInS6Q+Y+JmyFO80+QPG1cY7ceNcmw4Ug1UMzWI0b4M
         NrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JlgKlwRAIh6z/Ina4P2+HNN0zu9VC9y9zZhbFp4feFA=;
        b=FsR9dHMx3RBAf5RgSkMYzdOWfuf3LFXgPR8/KJKVxn+d0oOYr5rXTpnqpjgqNGSVXA
         gG6nkSIoXIIMHeEc/HIipKtOG1BVrWHhedEm2kpoatSNi1fnrDQnS/VFNRx4sVAF7Jg3
         NdxvRaJ4EOfu6STCDQWCW6Oj4ioeUTHQrniz+SFE94t/0SpRHP/s155z+0wujj9cCDEx
         68f3l/GONHGdLSlvMvtTuzDJPFLKA2qQ5X1Bc8q4UEUF7c14ZrrreWh4KmFv+nTyo5yT
         ENl9VVJYheIyfvfkWQCC4xoi85w0cuYcUoKQ5+EAXHIgBx7jfss+nf9uU3mhoaKl1FAW
         fPQQ==
X-Gm-Message-State: AOAM532hqp5qvK4oc4G87eZW5Y6bEWDjms1yJbHy63+e7pA81wDeUbMw
        QIUUejQjhO+5pSjvYIiIuijtGw==
X-Google-Smtp-Source: ABdhPJxn4g/MGv1czzqAAr8k7M3ymQXLNg9KwmkwnDf+Em//N6gXtLJXQERyJi76DVcPA25gs/9Z1w==
X-Received: by 2002:a2e:9113:0:b0:255:a3e6:93cb with SMTP id m19-20020a2e9113000000b00255a3e693cbmr12724481ljg.312.1654888190828;
        Fri, 10 Jun 2022 12:09:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:09:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 14/28] phy: qcom-qmp: move PCS V3 registers to separate headers
Date:   Fri, 10 Jun 2022 22:09:11 +0300
Message-Id: <20220610190925.3670081-15-dmitry.baryshkov@linaro.org>
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

Move PCS V3 registers to the separate headers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v3.h   | 17 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h    | 71 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 73 +------------------
 3 files changed, 91 insertions(+), 70 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v3.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v3.h
new file mode 100644
index 000000000000..a45bd301bc9e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v3.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_MISC_V3_H_
+#define QCOM_PHY_QMP_PCS_MISC_V3_H_
+
+/* Only for QMP V3 PHY - PCS_MISC registers */
+#define QPHY_V3_PCS_MISC_CLAMP_ENABLE			0x0c
+#define QPHY_V3_PCS_MISC_OSC_DTCT_CONFIG2		0x2c
+#define QPHY_V3_PCS_MISC_PCIE_INT_AUX_CLK_CONFIG1	0x44
+#define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG2		0x54
+#define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG4		0x5c
+#define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG5		0x60
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h
new file mode 100644
index 000000000000..0b023df19126
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V3_H_
+#define QCOM_PHY_QMP_PCS_V3_H_
+
+/* Only for QMP V3 PHY - PCS registers */
+#define QPHY_V3_PCS_POWER_DOWN_CONTROL			0x004
+#define QPHY_V3_PCS_TXMGN_V0				0x00c
+#define QPHY_V3_PCS_TXMGN_V1				0x010
+#define QPHY_V3_PCS_TXMGN_V2				0x014
+#define QPHY_V3_PCS_TXMGN_V3				0x018
+#define QPHY_V3_PCS_TXMGN_V4				0x01c
+#define QPHY_V3_PCS_TXMGN_LS				0x020
+#define QPHY_V3_PCS_TX_LARGE_AMP_DRV_LVL		0x02c
+#define QPHY_V3_PCS_TX_SMALL_AMP_DRV_LVL		0x034
+#define QPHY_V3_PCS_TXDEEMPH_M6DB_V0			0x024
+#define QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0			0x028
+#define QPHY_V3_PCS_TXDEEMPH_M6DB_V1			0x02c
+#define QPHY_V3_PCS_TXDEEMPH_M3P5DB_V1			0x030
+#define QPHY_V3_PCS_TXDEEMPH_M6DB_V2			0x034
+#define QPHY_V3_PCS_TXDEEMPH_M3P5DB_V2			0x038
+#define QPHY_V3_PCS_TXDEEMPH_M6DB_V3			0x03c
+#define QPHY_V3_PCS_TXDEEMPH_M3P5DB_V3			0x040
+#define QPHY_V3_PCS_TXDEEMPH_M6DB_V4			0x044
+#define QPHY_V3_PCS_TXDEEMPH_M3P5DB_V4			0x048
+#define QPHY_V3_PCS_TXDEEMPH_M6DB_LS			0x04c
+#define QPHY_V3_PCS_TXDEEMPH_M3P5DB_LS			0x050
+#define QPHY_V3_PCS_ENDPOINT_REFCLK_DRIVE		0x054
+#define QPHY_V3_PCS_RX_IDLE_DTCT_CNTRL			0x058
+#define QPHY_V3_PCS_RATE_SLEW_CNTRL			0x05c
+#define QPHY_V3_PCS_POWER_STATE_CONFIG1			0x060
+#define QPHY_V3_PCS_POWER_STATE_CONFIG2			0x064
+#define QPHY_V3_PCS_POWER_STATE_CONFIG4			0x06c
+#define QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_L		0x070
+#define QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_H		0x074
+#define QPHY_V3_PCS_RCVR_DTCT_DLY_U3_L			0x078
+#define QPHY_V3_PCS_RCVR_DTCT_DLY_U3_H			0x07c
+#define QPHY_V3_PCS_LOCK_DETECT_CONFIG1			0x080
+#define QPHY_V3_PCS_LOCK_DETECT_CONFIG2			0x084
+#define QPHY_V3_PCS_LOCK_DETECT_CONFIG3			0x088
+#define QPHY_V3_PCS_TSYNC_RSYNC_TIME			0x08c
+#define QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_AUXCLK		0x0a0
+#define QPHY_V3_PCS_LP_WAKEUP_DLY_TIME_AUXCLK		0x0a4
+#define QPHY_V3_PCS_PLL_LOCK_CHK_DLY_TIME		0x0a8
+#define QPHY_V3_PCS_LFPS_TX_ECSTART_EQTLOCK		0x0b0
+#define QPHY_V3_PCS_RXEQTRAINING_WAIT_TIME		0x0b8
+#define QPHY_V3_PCS_RXEQTRAINING_RUN_TIME		0x0bc
+#define QPHY_V3_PCS_FLL_CNTRL1				0x0c4
+#define QPHY_V3_PCS_FLL_CNTRL2				0x0c8
+#define QPHY_V3_PCS_FLL_CNT_VAL_L			0x0cc
+#define QPHY_V3_PCS_FLL_CNT_VAL_H_TOL			0x0d0
+#define QPHY_V3_PCS_FLL_MAN_CODE			0x0d4
+#define QPHY_V3_PCS_RX_SYM_RESYNC_CTRL			0x134
+#define QPHY_V3_PCS_RX_MIN_HIBERN8_TIME			0x138
+#define QPHY_V3_PCS_RX_SIGDET_CTRL1			0x13c
+#define QPHY_V3_PCS_RX_SIGDET_CTRL2			0x140
+#define QPHY_V3_PCS_LP_WAKEUP_DLY_TIME_AUXCLK_MSB	0x1a8
+#define QPHY_V3_PCS_OSC_DTCT_ACTIONS			0x1ac
+#define QPHY_V3_PCS_SIGDET_CNTRL			0x1b0
+#define QPHY_V3_PCS_TX_MID_TERM_CTRL1			0x1bc
+#define QPHY_V3_PCS_MULTI_LANE_CTRL1			0x1c4
+#define QPHY_V3_PCS_RX_SIGDET_LVL			0x1d8
+#define QPHY_V3_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB	0x1dc
+#define QPHY_V3_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB	0x1e0
+#define QPHY_V3_PCS_REFGEN_REQ_CONFIG1			0x20c
+#define QPHY_V3_PCS_REFGEN_REQ_CONFIG2			0x210
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 1bb57d1563c3..1290c62a16fe 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -22,6 +22,9 @@
 
 #include "phy-qcom-qmp-pcs-v2.h"
 
+#include "phy-qcom-qmp-pcs-v3.h"
+#include "phy-qcom-qmp-pcs-misc-v3.h"
+
 /* Only for QMP V3 & V4 PHY - DP COM registers */
 #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
 #define QPHY_V3_DP_COM_SW_RESET				0x04
@@ -46,76 +49,6 @@
 # define DP_PHY_TXn_TX_DRV_LVL_MASK			0x001f
 # define DP_PHY_TXn_TX_DRV_LVL_MUX_EN			0x0020
 
-/* Only for QMP V3 PHY - PCS registers */
-#define QPHY_V3_PCS_POWER_DOWN_CONTROL			0x004
-#define QPHY_V3_PCS_TXMGN_V0				0x00c
-#define QPHY_V3_PCS_TXMGN_V1				0x010
-#define QPHY_V3_PCS_TXMGN_V2				0x014
-#define QPHY_V3_PCS_TXMGN_V3				0x018
-#define QPHY_V3_PCS_TXMGN_V4				0x01c
-#define QPHY_V3_PCS_TXMGN_LS				0x020
-#define QPHY_V3_PCS_TX_LARGE_AMP_DRV_LVL		0x02c
-#define QPHY_V3_PCS_TX_SMALL_AMP_DRV_LVL		0x034
-#define QPHY_V3_PCS_TXDEEMPH_M6DB_V0			0x024
-#define QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0			0x028
-#define QPHY_V3_PCS_TXDEEMPH_M6DB_V1			0x02c
-#define QPHY_V3_PCS_TXDEEMPH_M3P5DB_V1			0x030
-#define QPHY_V3_PCS_TXDEEMPH_M6DB_V2			0x034
-#define QPHY_V3_PCS_TXDEEMPH_M3P5DB_V2			0x038
-#define QPHY_V3_PCS_TXDEEMPH_M6DB_V3			0x03c
-#define QPHY_V3_PCS_TXDEEMPH_M3P5DB_V3			0x040
-#define QPHY_V3_PCS_TXDEEMPH_M6DB_V4			0x044
-#define QPHY_V3_PCS_TXDEEMPH_M3P5DB_V4			0x048
-#define QPHY_V3_PCS_TXDEEMPH_M6DB_LS			0x04c
-#define QPHY_V3_PCS_TXDEEMPH_M3P5DB_LS			0x050
-#define QPHY_V3_PCS_ENDPOINT_REFCLK_DRIVE		0x054
-#define QPHY_V3_PCS_RX_IDLE_DTCT_CNTRL			0x058
-#define QPHY_V3_PCS_RATE_SLEW_CNTRL			0x05c
-#define QPHY_V3_PCS_POWER_STATE_CONFIG1			0x060
-#define QPHY_V3_PCS_POWER_STATE_CONFIG2			0x064
-#define QPHY_V3_PCS_POWER_STATE_CONFIG4			0x06c
-#define QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_L		0x070
-#define QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_H		0x074
-#define QPHY_V3_PCS_RCVR_DTCT_DLY_U3_L			0x078
-#define QPHY_V3_PCS_RCVR_DTCT_DLY_U3_H			0x07c
-#define QPHY_V3_PCS_LOCK_DETECT_CONFIG1			0x080
-#define QPHY_V3_PCS_LOCK_DETECT_CONFIG2			0x084
-#define QPHY_V3_PCS_LOCK_DETECT_CONFIG3			0x088
-#define QPHY_V3_PCS_TSYNC_RSYNC_TIME			0x08c
-#define QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_AUXCLK		0x0a0
-#define QPHY_V3_PCS_LP_WAKEUP_DLY_TIME_AUXCLK		0x0a4
-#define QPHY_V3_PCS_PLL_LOCK_CHK_DLY_TIME		0x0a8
-#define QPHY_V3_PCS_LFPS_TX_ECSTART_EQTLOCK		0x0b0
-#define QPHY_V3_PCS_RXEQTRAINING_WAIT_TIME		0x0b8
-#define QPHY_V3_PCS_RXEQTRAINING_RUN_TIME		0x0bc
-#define QPHY_V3_PCS_FLL_CNTRL1				0x0c4
-#define QPHY_V3_PCS_FLL_CNTRL2				0x0c8
-#define QPHY_V3_PCS_FLL_CNT_VAL_L			0x0cc
-#define QPHY_V3_PCS_FLL_CNT_VAL_H_TOL			0x0d0
-#define QPHY_V3_PCS_FLL_MAN_CODE			0x0d4
-#define QPHY_V3_PCS_RX_SYM_RESYNC_CTRL			0x134
-#define QPHY_V3_PCS_RX_MIN_HIBERN8_TIME			0x138
-#define QPHY_V3_PCS_RX_SIGDET_CTRL1			0x13c
-#define QPHY_V3_PCS_RX_SIGDET_CTRL2			0x140
-#define QPHY_V3_PCS_LP_WAKEUP_DLY_TIME_AUXCLK_MSB	0x1a8
-#define QPHY_V3_PCS_OSC_DTCT_ACTIONS			0x1ac
-#define QPHY_V3_PCS_SIGDET_CNTRL			0x1b0
-#define QPHY_V3_PCS_TX_MID_TERM_CTRL1			0x1bc
-#define QPHY_V3_PCS_MULTI_LANE_CTRL1			0x1c4
-#define QPHY_V3_PCS_RX_SIGDET_LVL			0x1d8
-#define QPHY_V3_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB	0x1dc
-#define QPHY_V3_PCS_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB	0x1e0
-#define QPHY_V3_PCS_REFGEN_REQ_CONFIG1			0x20c
-#define QPHY_V3_PCS_REFGEN_REQ_CONFIG2			0x210
-
-/* Only for QMP V3 PHY - PCS_MISC registers */
-#define QPHY_V3_PCS_MISC_CLAMP_ENABLE			0x0c
-#define QPHY_V3_PCS_MISC_OSC_DTCT_CONFIG2		0x2c
-#define QPHY_V3_PCS_MISC_PCIE_INT_AUX_CLK_CONFIG1	0x44
-#define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG2		0x54
-#define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG4		0x5c
-#define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG5		0x60
-
 /* QMP PHY - DP PHY registers */
 #define QSERDES_DP_PHY_REVISION_ID0			0x000
 #define QSERDES_DP_PHY_REVISION_ID1			0x004
-- 
2.35.1

