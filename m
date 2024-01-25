Return-Path: <linux-arm-msm+bounces-8378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE4B83D09E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3242628DC6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F009134C4;
	Thu, 25 Jan 2024 23:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vzlz7yOM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C59134DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706224988; cv=none; b=ldScUPrvBQmUgT7i9tgbBsjmHaIvVDuHTAogEANjgtrH4aSCJzG4i9vN/gCF/JGrNW2OyKp0gvH1Fm/sODyoHP47AdwN1YCvqUwsIBBYuMEEgNEfTr53BSmuBFLDz4v+tBbOr4/bmma2Z/u2tLv8uJbhE1yhXYT/hQOMiYimEC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706224988; c=relaxed/simple;
	bh=DJDDkfWKXJvRaZJvE3fW57O1HFp0QUs9QFg7/6fIpIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOzKefWSRc92fdHJPjXcXJB5cV9svHnlAG4reFYBn7BC5XOcHS124t/PL7Ax2wjXRSwrI+iMRDuSkFPLY1TEwA6OWx1ct3Dozd0ozlHHD3pR/Gdne+8uBl+1KhCT0R4PXgUQbTyEUgD/rYYl9ti8QePCQHvMb6jW5dS7ZKIrVdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vzlz7yOM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50f11e3ba3aso11007437e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706224984; x=1706829784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5iiDSHHZJieX628EZfrPfd+agKupJDCTMl1PcX1Hko=;
        b=Vzlz7yOMMa+cEpXoeXZDGzii4UmYwnDBNcHLeg1JzwMxmE2o8wlM3VIBnz4Tzm0bI4
         /3CY6lgaHY7hYMziZQ+gQjnZKNkhmLv1KsDWtoBI7EGR1oQge5PBL+rMbaUTlJTt3aE9
         nsKbj+HiK1wv4eCJj/ntf3Il7Szv/zH+EH38RIdNaVaNdJSZg9J5o5taJ+hu3yjhMGcY
         OZj3nVL60rL0bpPrVIPas4eZaLmOdXWbaDql6HSSzn+Ehv6PFPtt1Y7CwYJxNzHLE/bw
         9uMJe7JBXagj/uAQgAXxDq/Cck/rzC5y8kX/oc30WvsRFvdTN2i/RxLJE1wfY5+5X8W6
         AYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224984; x=1706829784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5iiDSHHZJieX628EZfrPfd+agKupJDCTMl1PcX1Hko=;
        b=PlC3gI9PmUFkP+MEWQ32MOxjUS1SAJnlzprFmjlQ4LfPxGSx1WShSPjD/I/NxPzSYn
         Kl86xdvD2WsI3qLt7e8k57xZ7xZ/IR1zsx+GbSy79pHFcAwsRX+Vz0pUU3kxbSjQtbX7
         RuOaIRSdjEMkxpsdugI8drVDMWcX2wqIZOT2udj2Dg/MRJoUGSDJCVm3BZBR8xTIHdVS
         LHyjYpAFHNzd8a+ILoOOz4EgdEvQkbfACUg7kMjx2lyoMZNJE8ZmnTR9uQF5W2S2PXTn
         vrKPJFkfC8LBmdUHzIQ/w7A5dvlvxDj6kIiWSnvUU7QL+e++IYQ+RurIII+a6bB23esS
         62/w==
X-Gm-Message-State: AOJu0YyMBnFenO+1krONRVYUf6U2XBLbUDdb9R/jwjPCC92mDH/4kyf7
	4y0KvATNDobgKJ9Cjhd/VUZT7V2AMwwOklPZ96XBN2i+eScK0uciHw+a61Iy+pWN1ozHBBXL2N6
	k
X-Google-Smtp-Source: AGHT+IEGayCEF4rpwfmKDsp84tEGMAl2KaEMiJnDvaMD5DI5BQmpf+JZfWbnlQO6JVb5mc6B7PcDiw==
X-Received: by 2002:a19:910a:0:b0:50e:d416:1698 with SMTP id t10-20020a19910a000000b0050ed4161698mr537519lfd.49.1706224983566;
        Thu, 25 Jan 2024 15:23:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k3-20020a05651210c300b0050e6df07728sm3920lfg.180.2024.01.25.15.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:23:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:22:42 +0200
Subject: [PATCH v2 8/8] phy: qcom: sgmii-eth: move PCS registers to
 separate header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-phy-qmp-merge-common-v2-8-a463d0b57836@linaro.org>
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
In-Reply-To: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+qmtwGTT3F/sAxxjLhqKO/06/HTbxG717JmPLpZO2dXi
 NTjVp/VnYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYiLUdB0PnvLO2ehc3bbrN
 tyl9X+jHmzaHTCTud9+//vrRXXPD5qcd2bHZgRrdTMpiKq9tNGdIiSS2n+X+zrKxlGtb8wxZDb3
 OF9Xz/4QteZUnqCf9bd1Z5s4P2scY2aJLrFQMJ2dPOLbmxsbXYj1qyrddLwv8UE4IVzpyXm7hC+
 eNVr9mSDYrG768322zZX6Lg2fCxoutbZv7u9UZQv1/y6VypB/V9fq0/vmqvNmeJ67z5v6RmFHC5
 KkSPbvphmFJ7RdPuzusF9UV/1WohxVkvJoquans+E32uzNaZcXlDV7JmDMzZ/8SSLmuI/zeOVYx
 da3B/akLnjSw+4k11huJ8lVIXU9q7K5dX3nl3ZwN+YuYAA==
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


