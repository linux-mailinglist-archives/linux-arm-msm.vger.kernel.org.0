Return-Path: <linux-arm-msm+bounces-6708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38589827D33
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 04:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5118B1C2122D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 03:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0556104;
	Tue,  9 Jan 2024 03:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ba02FiFP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B353BE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 03:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cc7b9281d1so31911001fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 19:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704769448; x=1705374248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5iiDSHHZJieX628EZfrPfd+agKupJDCTMl1PcX1Hko=;
        b=Ba02FiFPM3H88bv2EcC4WtrwbELWE2KwVx/PMPykT6JZ7SINhrm0tATWouxzfKS2mh
         jGjUp71rIAGzWOTDxD06v8YFjUyde1VuXJ+DvpqM+IiUizKCQiJg0UyU0j+7HVSpA/ts
         +J/280kPskC49lnluZu/OQNAcW17azWaJwneuLuN1ere+rt1GtxYLVFxq7CCq4gwGHXW
         KOQfXHmD4V2jggOUTdNdo0/u84FBiMTL5LhsVPaSvpYGNZ7hbvg1uCO7ruhDyUGAWlQB
         6ZMO43gImdj2PW0etmV2PAGWwzg/ibXw4PDFHK8byQh1ldLo6+xLA0IuHh/R6pV+KCgr
         bk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704769448; x=1705374248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5iiDSHHZJieX628EZfrPfd+agKupJDCTMl1PcX1Hko=;
        b=Oo9EN5o6DyronuKKpEpUYMZ5O4AUfaQYypJsIvSFr2CCbT10nLE/GGbbPY8x0QQr7D
         /KxDHTAMaq8izhBGGlI5RApEqX92Pdi54QD8b/dYYVKp1/VP5LxfitIY6Qv0PVFb6iXL
         pAcLzQHeQ8IJtfCqe/V4qBhj8jdEHZw7BhPDzn90KdlSoWLlsPaTKcaIXNVkIQVKD9iu
         tIxM7Z/lK/BouRQ63x1+2qS6PkoYD3V5V3TAJHrFnz0tTTZ40VoMfzcXrheNMkysI22F
         0fr90yNR62wBSoHas4+UnKkIXMHuxNe1FnJqxg3TSzsW3ltsoT32wZN9JIPXU9xzW8zQ
         Zqfg==
X-Gm-Message-State: AOJu0YxlP+IC2+Zo357mE+KxN5js9wBO/lc/HszMqjZB+KWOjkrY77VH
	UTWyhWQIIhTX+mCtJYWcvlgQAUy1PJ8zXg==
X-Google-Smtp-Source: AGHT+IHyz7l8zPXgecUhOsg5rev7El8tjPxENDdJ53PBI2NTC1dWZAr3V1B/OZ15ykrWHZqq0dGfgg==
X-Received: by 2002:a2e:808e:0:b0:2cd:a2e:fba6 with SMTP id i14-20020a2e808e000000b002cd0a2efba6mr2176871ljg.11.1704769448197;
        Mon, 08 Jan 2024 19:04:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g30-20020a2e391e000000b002cd1ad3b11csm176920lja.42.2024.01.08.19.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 19:04:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Jan 2024 05:04:06 +0200
Subject: [PATCH 8/8] phy: qcom: sgmii-eth: move PCS registers to separate
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240109-phy-qmp-merge-common-v1-8-572899a14318@linaro.org>
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
In-Reply-To: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=7598;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DJDDkfWKXJvRaZJvE3fW57O1HFp0QUs9QFg7/6fIpIo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlnLehvYAyQ8wy0pmX5MGKsfwA0iB3eCQYkPBtX
 L9rrUb3LgeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZy3oQAKCRCLPIo+Aiko
 1Z6CB/0SUfJZOX3pI+kapCCdChXsugPzX/ykV1Bm6wjSy5wuqgMSqmQMW4TyfHjBGh67uhpvLJT
 kEjCwM+xhT7aXQhV657lPZyFDnNR1esVW0osIUiqyzOmPGMNLSc9CkF1Go3w6dc5dv/T9CqFnR6
 bdBfZnLukdtFddRz2HW7U5ifSQhzTN2CFiVX2Nhye7bl4lydX/LHRSmnFs3ZcuaAbSXu+8KHn39
 RD4PJQE5DuQcsUQ9EirwiGd9S8ejRb6mFZhkN0XGzPKQlhAbd7P2TmVsWONJNmT3LxM0mFMMY7V
 94UUsJTOQlHAZxSXvZ1z//Ul/7HJhW0hhAqOpPgJMFCc+e9K
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the example of the rest of the QMP PHY drivers and move SGMII PCS
registers to a separate header file.

Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h | 20 +++++++++
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c     | 64 +++++++++++----------------
 2 files changed, 47 insertions(+), 37 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h
new file mode 100644
index 000000000000..4d8c962f5e0f
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_SGMII_H_
+#define QCOM_PHY_QMP_PCS_SGMII_H_
+
+#define QPHY_PCS_PHY_START				0x000
+#define QPHY_PCS_POWER_DOWN_CONTROL			0x004
+#define QPHY_PCS_SW_RESET				0x008
+#define QPHY_PCS_LINE_RESET_TIME			0x00c
+#define QPHY_PCS_TX_LARGE_AMP_DRV_LVL			0x020
+#define QPHY_PCS_TX_SMALL_AMP_DRV_LVL			0x028
+#define QPHY_PCS_PCS_READY_STATUS			0x094
+#define QPHY_PCS_TX_MID_TERM_CTRL1			0x0d8
+#define QPHY_PCS_TX_MID_TERM_CTRL2			0x0dc
+#define QPHY_PCS_SGMII_MISC_CTRL8			0x118
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 233f9b70c673..5b1c82459c12 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "phy-qcom-qmp-pcs-sgmii.h"
 #include "phy-qcom-qmp-qserdes-com-v5.h"
 #include "phy-qcom-qmp-qserdes-txrx-v5.h"
 
@@ -19,17 +20,6 @@
 #define QSERDES_TX					0x400
 #define QSERDES_PCS					0xc00
 
-#define QSERDES_PCS_PHY_START				(QSERDES_PCS + 0x0)
-#define QSERDES_PCS_POWER_DOWN_CONTROL			(QSERDES_PCS + 0x4)
-#define QSERDES_PCS_SW_RESET				(QSERDES_PCS + 0x8)
-#define QSERDES_PCS_LINE_RESET_TIME			(QSERDES_PCS + 0xc)
-#define QSERDES_PCS_TX_LARGE_AMP_DRV_LVL		(QSERDES_PCS + 0x20)
-#define QSERDES_PCS_TX_SMALL_AMP_DRV_LVL		(QSERDES_PCS + 0x28)
-#define QSERDES_PCS_TX_MID_TERM_CTRL1			(QSERDES_PCS + 0xd8)
-#define QSERDES_PCS_TX_MID_TERM_CTRL2			(QSERDES_PCS + 0xdc)
-#define QSERDES_PCS_SGMII_MISC_CTRL8			(QSERDES_PCS + 0x118)
-#define QSERDES_PCS_PCS_READY_STATUS			(QSERDES_PCS + 0x94)
-
 #define QSERDES_COM_C_READY				BIT(0)
 #define QSERDES_PCS_READY				BIT(0)
 #define QSERDES_PCS_SGMIIPHY_READY			BIT(7)
@@ -43,8 +33,8 @@ struct qcom_dwmac_sgmii_phy_data {
 
 static void qcom_dwmac_sgmii_phy_init_1g(struct regmap *regmap)
 {
-	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x01);
-	regmap_write(regmap, QSERDES_PCS_POWER_DOWN_CONTROL, 0x01);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x01);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_POWER_DOWN_CONTROL, 0x01);
 
 	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_IVCO, 0x0F);
 	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CP_CTRL_MODE0, 0x06);
@@ -118,21 +108,21 @@ static void qcom_dwmac_sgmii_phy_init_1g(struct regmap *regmap)
 	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xB7);
 	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_DCC_CTRL1, 0x0C);
 
-	regmap_write(regmap, QSERDES_PCS_LINE_RESET_TIME, 0x0C);
-	regmap_write(regmap, QSERDES_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
-	regmap_write(regmap, QSERDES_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
-	regmap_write(regmap, QSERDES_PCS_TX_MID_TERM_CTRL1, 0x83);
-	regmap_write(regmap, QSERDES_PCS_TX_MID_TERM_CTRL2, 0x08);
-	regmap_write(regmap, QSERDES_PCS_SGMII_MISC_CTRL8, 0x0C);
-	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x00);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_LINE_RESET_TIME, 0x0C);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL1, 0x83);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL2, 0x08);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SGMII_MISC_CTRL8, 0x0C);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x00);
 
-	regmap_write(regmap, QSERDES_PCS_PHY_START, 0x01);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_PHY_START, 0x01);
 }
 
 static void qcom_dwmac_sgmii_phy_init_2p5g(struct regmap *regmap)
 {
-	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x01);
-	regmap_write(regmap, QSERDES_PCS_POWER_DOWN_CONTROL, 0x01);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x01);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_POWER_DOWN_CONTROL, 0x01);
 
 	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_IVCO, 0x0F);
 	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CP_CTRL_MODE0, 0x06);
@@ -206,15 +196,15 @@ static void qcom_dwmac_sgmii_phy_init_2p5g(struct regmap *regmap)
 	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xB7);
 	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_DCC_CTRL1, 0x0C);
 
-	regmap_write(regmap, QSERDES_PCS_LINE_RESET_TIME, 0x0C);
-	regmap_write(regmap, QSERDES_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
-	regmap_write(regmap, QSERDES_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
-	regmap_write(regmap, QSERDES_PCS_TX_MID_TERM_CTRL1, 0x83);
-	regmap_write(regmap, QSERDES_PCS_TX_MID_TERM_CTRL2, 0x08);
-	regmap_write(regmap, QSERDES_PCS_SGMII_MISC_CTRL8, 0x8C);
-	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x00);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_LINE_RESET_TIME, 0x0C);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL1, 0x83);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL2, 0x08);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SGMII_MISC_CTRL8, 0x8C);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x00);
 
-	regmap_write(regmap, QSERDES_PCS_PHY_START, 0x01);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_PHY_START, 0x01);
 }
 
 static inline int
@@ -251,14 +241,14 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
 	}
 
 	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
-					     QSERDES_PCS_PCS_READY_STATUS,
+					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
 					     QSERDES_PCS_READY)) {
 		dev_err(dev, "PCS_READY timed-out");
 		return -ETIMEDOUT;
 	}
 
 	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
-					     QSERDES_PCS_PCS_READY_STATUS,
+					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
 					     QSERDES_PCS_SGMIIPHY_READY)) {
 		dev_err(dev, "SGMIIPHY_READY timed-out");
 		return -ETIMEDOUT;
@@ -285,11 +275,11 @@ static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
 {
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
 
-	regmap_write(data->regmap, QSERDES_PCS_TX_MID_TERM_CTRL2, 0x08);
-	regmap_write(data->regmap, QSERDES_PCS_SW_RESET, 0x01);
+	regmap_write(data->regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL2, 0x08);
+	regmap_write(data->regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x01);
 	udelay(100);
-	regmap_write(data->regmap, QSERDES_PCS_SW_RESET, 0x00);
-	regmap_write(data->regmap, QSERDES_PCS_PHY_START, 0x01);
+	regmap_write(data->regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x00);
+	regmap_write(data->regmap, QSERDES_PCS + QPHY_PCS_PHY_START, 0x01);
 
 	clk_disable_unprepare(data->refclk);
 

-- 
2.39.2


