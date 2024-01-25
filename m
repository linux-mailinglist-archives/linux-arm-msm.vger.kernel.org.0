Return-Path: <linux-arm-msm+bounces-8374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6483D099
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B34901C22E5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C057134A6;
	Thu, 25 Jan 2024 23:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XPvgEmb+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0175125C8
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706224984; cv=none; b=RrPN06CzkTRLU6O9MkbQj9c8pL5OeCSEbO0t8/Q5kxQbSOy5hjjwj0lE0Pz5JK+hqJNB3dKF2klo/tzEOt5lG18ehQkmzuio27OsYUxIJvtclGJ4Mh936aZ9tKJWHA5/cFRYMlgR/GPL1BR/Docov9wSN3SWQutiKY7gKbs1CW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706224984; c=relaxed/simple;
	bh=1M79y1MybX0MDMSwebKD5kVnHGAV0e3sKKzF1SWclpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4XnvqJ58ZEltyHwkLiDWywX3DTRiL4awyPNbpL3hi2t6DA4GxDZDmzCyC0jLGmv64YRMoW1cvHN55KYMaGuKS/jEMcJnVack/y9286j2DOwVVzBjV/0pBdyg/ZHKoD5T6iifmNGlVzfRxPTczni17pLuOACX9hj4RAeBkdn1Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XPvgEmb+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5100409e31eso6416439e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706224979; x=1706829779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3yOSGOqpENP+OCfivxRHWFb9FYG7tz0opynav6kJ+c=;
        b=XPvgEmb+5qKka7gt044ze/3wdrEWLlTYDyNOXLqPrnzZBoRGhDfDsNQd+jHVLPT9L/
         OX0RlznBHkwKSAaP+M+iZY2ZZNTnuD03VxZPkvFyPmvYsKYoOSqDsiFNnfqvbiLKQ+xU
         R2XIxJYQiS1qUNX1KbaX0I5+oBjw5Gp7vL+l78VDshc+0PVLVrx+gNZhy4TZP5aTJsDT
         LyHZtB/qC6/YEu7waaG4Fh0L2t861+R7yxBJ60pll+aK2n5iRoX1M+ugikZGSZk0y3XB
         IbLRec9QOkHYKhyCILCQIbT+Uk1/F4jzbiIW+1QC0DJvdswSEMtdUuNrSUt/WTYA12KW
         HU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224979; x=1706829779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3yOSGOqpENP+OCfivxRHWFb9FYG7tz0opynav6kJ+c=;
        b=sPIZAp5xnfv5qBi0R2hSjxwNkrm3IDKTyD4xzWSV17FEAcWHrrBxuiWK8L8CM1BaoU
         pQiPnxJHEUe5naMZoOLrao2MYRyrOmIi45LV7fBcBT7Ml5U615lpVrNJBMO0je73BoMz
         Se7TOXhJmK8gc/Nv9MwkBhs4KUx3/zUWJRIuBn8QV4pEP7tO8GJL1P1Qq2z7HAAofzhi
         gnU1HEyADsHEGa9KcLaWcchqj7uvNTx8m4PaUqXV32oeo98bLAMSs7hc+OJ8PVaxIXi+
         s6HbmtPmvUUeho7+Nh2oYCkEPTeO8NmUu4sCjKQHRXBIndZ8/LqGccT3MegTPN10jkhr
         X+gg==
X-Gm-Message-State: AOJu0Yy3brXNbHxv5SuEdtCqgLxrDaG7JYxMGGHZ80GAaXt9YwMXXXBs
	0EBZd4a+JcpHEH4bqPXKktfK5pzQdUrg8de5b0YG/XTAM5FQi9b5hZuKcLRzBL0OWpuFykvTq0s
	E
X-Google-Smtp-Source: AGHT+IE5m5qZGmpXAXEamVIqv11ueRL4sT292DnH5G/J4O3AOrfnAWT+VODoaeHns9a8ob8VvNuDzw==
X-Received: by 2002:a05:6512:31c3:b0:50e:69f0:3cda with SMTP id j3-20020a05651231c300b0050e69f03cdamr412755lfe.20.1706224979476;
        Thu, 25 Jan 2024 15:22:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k3-20020a05651210c300b0050e6df07728sm3920lfg.180.2024.01.25.15.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:22:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:22:37 +0200
Subject: [PATCH v2 3/8] phy: qcom: qmp: move common functions to common
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-phy-qmp-merge-common-v2-3-a463d0b57836@linaro.org>
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
In-Reply-To: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=22658;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1M79y1MybX0MDMSwebKD5kVnHGAV0e3sKKzF1SWclpE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsu1P6hvxQCtD2arM4Qogc9kyM136O7s3vpk01
 emTkzTjO8uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLtTwAKCRCLPIo+Aiko
 1WckCACF4qaURuqbRqX3rg+4Hi6kWwsjmdIc5mTpCeGjExmGZ8Er0sD/hBr4tOh9VAjAkYtQJUA
 TcN9O4F113gFr17PEHuIXT4TH81p7BQTQxV7KU4Q4tu6wuNf4a+59neP6mb/UQxiBnoIlJwtffv
 jwjRTiSnOyB5Oukum/+E98Sa+nxB9bQEn7cY1ppE/DRvrSorWyu0UUYZSd/siP1d3uygogq8zbm
 NNKouN7JSbOwsKMJGaesc5gjRi9heMum+q9jQkD5EpLlj9gLRkxSLyXT7n+0CtPImUxzFosH3Pv
 x9NPt30V6Bl0m/L5EzxDZjM8suWsPOwi4NybFtEN7qF/8yDb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move common init tables code to the common header phy-qcom-qmp-common.h.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        | 80 +++++-------------------
 drivers/phy/qualcomm/phy-qcom-qmp-common.h       | 59 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 60 ++----------------
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         | 78 +++++------------------
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c          | 65 +++----------------
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c          | 62 +++---------------
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         | 64 +++----------------
 7 files changed, 120 insertions(+), 348 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 1ad10110dd25..f6e9471da51a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -25,6 +25,8 @@
 
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 
+#include "phy-qcom-qmp-common.h"
+
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 #include "phy-qcom-qmp-pcs-usb-v4.h"
@@ -72,30 +74,6 @@
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
-struct qmp_phy_init_tbl {
-	unsigned int offset;
-	unsigned int val;
-	/*
-	 * mask of lanes for which this register is written
-	 * for cases when second lane needs different values
-	 */
-	u8 lane_mask;
-};
-
-#define QMP_PHY_INIT_CFG(o, v)		\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = 0xff,	\
-	}
-
-#define QMP_PHY_INIT_CFG_LANE(o, v, l)	\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = l,		\
-	}
-
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
 	/* PCS registers */
@@ -2031,55 +2009,29 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 };
 
-static void qmp_combo_configure_lane(void __iomem *base,
-					const struct qmp_phy_init_tbl tbl[],
-					int num,
-					u8 lane_mask)
-{
-	int i;
-	const struct qmp_phy_init_tbl *t = tbl;
-
-	if (!t)
-		return;
-
-	for (i = 0; i < num; i++, t++) {
-		if (!(t->lane_mask & lane_mask))
-			continue;
-
-		writel(t->val, base + t->offset);
-	}
-}
-
-static void qmp_combo_configure(void __iomem *base,
-				   const struct qmp_phy_init_tbl tbl[],
-				   int num)
-{
-	qmp_combo_configure_lane(base, tbl, num, 0xff);
-}
-
 static int qmp_combo_dp_serdes_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *serdes = qmp->dp_serdes;
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 
-	qmp_combo_configure(serdes, cfg->dp_serdes_tbl, cfg->dp_serdes_tbl_num);
+	qmp_configure(serdes, cfg->dp_serdes_tbl, cfg->dp_serdes_tbl_num);
 
 	switch (dp_opts->link_rate) {
 	case 1620:
-		qmp_combo_configure(serdes, cfg->serdes_tbl_rbr,
+		qmp_configure(serdes, cfg->serdes_tbl_rbr,
 				cfg->serdes_tbl_rbr_num);
 		break;
 	case 2700:
-		qmp_combo_configure(serdes, cfg->serdes_tbl_hbr,
+		qmp_configure(serdes, cfg->serdes_tbl_hbr,
 				cfg->serdes_tbl_hbr_num);
 		break;
 	case 5400:
-		qmp_combo_configure(serdes, cfg->serdes_tbl_hbr2,
+		qmp_configure(serdes, cfg->serdes_tbl_hbr2,
 				cfg->serdes_tbl_hbr2_num);
 		break;
 	case 8100:
-		qmp_combo_configure(serdes, cfg->serdes_tbl_hbr3,
+		qmp_configure(serdes, cfg->serdes_tbl_hbr3,
 				cfg->serdes_tbl_hbr3_num);
 		break;
 	default:
@@ -2681,8 +2633,8 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 
 	qmp_combo_dp_serdes_init(qmp);
 
-	qmp_combo_configure_lane(tx, cfg->dp_tx_tbl, cfg->dp_tx_tbl_num, 1);
-	qmp_combo_configure_lane(tx2, cfg->dp_tx_tbl, cfg->dp_tx_tbl_num, 2);
+	qmp_configure_lane(tx, cfg->dp_tx_tbl, cfg->dp_tx_tbl_num, 1);
+	qmp_configure_lane(tx2, cfg->dp_tx_tbl, cfg->dp_tx_tbl_num, 2);
 
 	/* Configure special DP tx tunings */
 	cfg->configure_dp_tx(qmp);
@@ -2724,7 +2676,7 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 	unsigned int val;
 	int ret;
 
-	qmp_combo_configure(serdes, cfg->serdes_tbl, cfg->serdes_tbl_num);
+	qmp_configure(serdes, cfg->serdes_tbl, cfg->serdes_tbl_num);
 
 	ret = clk_prepare_enable(qmp->pipe_clk);
 	if (ret) {
@@ -2733,16 +2685,16 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_combo_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_combo_configure_lane(tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
+	qmp_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+	qmp_configure_lane(tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
 
-	qmp_combo_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
-	qmp_combo_configure_lane(rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
+	qmp_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
+	qmp_configure_lane(rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
-	qmp_combo_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	if (pcs_usb)
-		qmp_combo_configure(pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);
+		qmp_configure(pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);
 
 	if (cfg->has_pwrdn_delay)
 		usleep_range(10, 20);
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-common.h b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
new file mode 100644
index 000000000000..799384210509
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_COMMON_H_
+#define QCOM_PHY_QMP_COMMON_H_
+
+struct qmp_phy_init_tbl {
+	unsigned int offset;
+	unsigned int val;
+	/*
+	 * mask of lanes for which this register is written
+	 * for cases when second lane needs different values
+	 */
+	u8 lane_mask;
+};
+
+#define QMP_PHY_INIT_CFG(o, v)		\
+	{				\
+		.offset = o,		\
+		.val = v,		\
+		.lane_mask = 0xff,	\
+	}
+
+#define QMP_PHY_INIT_CFG_LANE(o, v, l)	\
+	{				\
+		.offset = o,		\
+		.val = v,		\
+		.lane_mask = l,		\
+	}
+
+static inline void qmp_configure_lane(void __iomem *base,
+					   const struct qmp_phy_init_tbl tbl[],
+					   int num,
+					   u8 lane_mask)
+{
+	int i;
+	const struct qmp_phy_init_tbl *t = tbl;
+
+	if (!t)
+		return;
+
+	for (i = 0; i < num; i++, t++) {
+		if (!(t->lane_mask & lane_mask))
+			continue;
+
+		writel(t->val, base + t->offset);
+	}
+}
+
+static inline void qmp_configure(void __iomem *base,
+				      const struct qmp_phy_init_tbl tbl[],
+				      int num)
+{
+	qmp_configure_lane(base, tbl, num, 0xff);
+}
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index ab61a9c73b18..07c6f20a49d4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -19,6 +19,8 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "phy-qcom-qmp-common.h"
+
 #include "phy-qcom-qmp.h"
 
 /* QPHY_SW_RESET bit */
@@ -39,30 +41,6 @@
 #define POWER_DOWN_DELAY_US_MIN			10
 #define POWER_DOWN_DELAY_US_MAX			20
 
-struct qmp_phy_init_tbl {
-	unsigned int offset;
-	unsigned int val;
-	/*
-	 * mask of lanes for which this register is written
-	 * for cases when second lane needs different values
-	 */
-	u8 lane_mask;
-};
-
-#define QMP_PHY_INIT_CFG(o, v)		\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = 0xff,	\
-	}
-
-#define QMP_PHY_INIT_CFG_LANE(o, v, l)	\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = l,		\
-	}
-
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
 	/* Common block control registers */
@@ -307,32 +285,6 @@ static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
 	.regs			= pciephy_regs_layout,
 };
 
-static void qmp_pcie_msm8996_configure_lane(void __iomem *base,
-					const struct qmp_phy_init_tbl tbl[],
-					int num,
-					u8 lane_mask)
-{
-	int i;
-	const struct qmp_phy_init_tbl *t = tbl;
-
-	if (!t)
-		return;
-
-	for (i = 0; i < num; i++, t++) {
-		if (!(t->lane_mask & lane_mask))
-			continue;
-
-		writel(t->val, base + t->offset);
-	}
-}
-
-static void qmp_pcie_msm8996_configure(void __iomem *base,
-				   const struct qmp_phy_init_tbl tbl[],
-				   int num)
-{
-	qmp_pcie_msm8996_configure_lane(base, tbl, num, 0xff);
-}
-
 static int qmp_pcie_msm8996_serdes_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -344,7 +296,7 @@ static int qmp_pcie_msm8996_serdes_init(struct qmp_phy *qphy)
 	unsigned int val;
 	int ret;
 
-	qmp_pcie_msm8996_configure(serdes, serdes_tbl, serdes_tbl_num);
+	qmp_configure(serdes, serdes_tbl, serdes_tbl_num);
 
 	qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET], SW_RESET);
 	qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
@@ -487,9 +439,9 @@ static int qmp_pcie_msm8996_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_pcie_msm8996_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_pcie_msm8996_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
-	qmp_pcie_msm8996_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+	qmp_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
+	qmp_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	/*
 	 * Pull out PHY from POWER DOWN state.
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 3ba302a7285c..6119950e455e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -22,6 +22,8 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "phy-qcom-qmp-common.h"
+
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 #include "phy-qcom-qmp-pcs-pcie-v4.h"
@@ -46,30 +48,6 @@
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
-struct qmp_phy_init_tbl {
-	unsigned int offset;
-	unsigned int val;
-	/*
-	 * mask of lanes for which this register is written
-	 * for cases when second lane needs different values
-	 */
-	u8 lane_mask;
-};
-
-#define QMP_PHY_INIT_CFG(o, v)		\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = 0xff,	\
-	}
-
-#define QMP_PHY_INIT_CFG_LANE(o, v, l)	\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = l,		\
-	}
-
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
 	/* PCS registers */
@@ -3357,32 +3335,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x2_pciephy_cfg = {
 	.has_nocsr_reset	= true,
 };
 
-static void qmp_pcie_configure_lane(void __iomem *base,
-					const struct qmp_phy_init_tbl tbl[],
-					int num,
-					u8 lane_mask)
-{
-	int i;
-	const struct qmp_phy_init_tbl *t = tbl;
-
-	if (!t)
-		return;
-
-	for (i = 0; i < num; i++, t++) {
-		if (!(t->lane_mask & lane_mask))
-			continue;
-
-		writel(t->val, base + t->offset);
-	}
-}
-
-static void qmp_pcie_configure(void __iomem *base,
-					const struct qmp_phy_init_tbl tbl[],
-					int num)
-{
-	qmp_pcie_configure_lane(base, tbl, num, 0xff);
-}
-
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -3394,11 +3346,11 @@ static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_
 	tx4 = qmp->port_b + offs->tx2;
 	rx4 = qmp->port_b + offs->rx2;
 
-	qmp_pcie_configure_lane(tx3, tbls->tx, tbls->tx_num, 1);
-	qmp_pcie_configure_lane(rx3, tbls->rx, tbls->rx_num, 1);
+	qmp_configure_lane(tx3, tbls->tx, tbls->tx_num, 1);
+	qmp_configure_lane(rx3, tbls->rx, tbls->rx_num, 1);
 
-	qmp_pcie_configure_lane(tx4, tbls->tx, tbls->tx_num, 2);
-	qmp_pcie_configure_lane(rx4, tbls->rx, tbls->rx_num, 2);
+	qmp_configure_lane(tx4, tbls->tx, tbls->tx_num, 2);
+	qmp_configure_lane(rx4, tbls->rx, tbls->rx_num, 2);
 }
 
 static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
@@ -3416,25 +3368,25 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
 	if (!tbls)
 		return;
 
-	qmp_pcie_configure(serdes, tbls->serdes, tbls->serdes_num);
+	qmp_configure(serdes, tbls->serdes, tbls->serdes_num);
 
-	qmp_pcie_configure_lane(tx, tbls->tx, tbls->tx_num, 1);
-	qmp_pcie_configure_lane(rx, tbls->rx, tbls->rx_num, 1);
+	qmp_configure_lane(tx, tbls->tx, tbls->tx_num, 1);
+	qmp_configure_lane(rx, tbls->rx, tbls->rx_num, 1);
 
 	if (cfg->lanes >= 2) {
-		qmp_pcie_configure_lane(tx2, tbls->tx, tbls->tx_num, 2);
-		qmp_pcie_configure_lane(rx2, tbls->rx, tbls->rx_num, 2);
+		qmp_configure_lane(tx2, tbls->tx, tbls->tx_num, 2);
+		qmp_configure_lane(rx2, tbls->rx, tbls->rx_num, 2);
 	}
 
-	qmp_pcie_configure(pcs, tbls->pcs, tbls->pcs_num);
-	qmp_pcie_configure(pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
+	qmp_configure(pcs, tbls->pcs, tbls->pcs_num);
+	qmp_configure(pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
 
 	if (cfg->lanes >= 4 && qmp->tcsr_4ln_config) {
-		qmp_pcie_configure(serdes, cfg->serdes_4ln_tbl, cfg->serdes_4ln_num);
+		qmp_configure(serdes, cfg->serdes_4ln_tbl, cfg->serdes_4ln_num);
 		qmp_pcie_init_port_b(qmp, tbls);
 	}
 
-	qmp_pcie_configure(ln_shrd, tbls->ln_shrd, tbls->ln_shrd_num);
+	qmp_configure(ln_shrd, tbls->ln_shrd, tbls->ln_shrd_num);
 }
 
 static int qmp_pcie_init(struct phy *phy)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 490f4cecf054..01a96c60c913 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -20,6 +20,9 @@
 #include <linux/slab.h>
 
 #include <ufs/unipro.h>
+
+#include "phy-qcom-qmp-common.h"
+
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-ufs-v2.h"
 #include "phy-qcom-qmp-pcs-ufs-v3.h"
@@ -43,30 +46,6 @@
 
 #define NUM_OVERLAY				2
 
-struct qmp_phy_init_tbl {
-	unsigned int offset;
-	unsigned int val;
-	/*
-	 * mask of lanes for which this register is written
-	 * for cases when second lane needs different values
-	 */
-	u8 lane_mask;
-};
-
-#define QMP_PHY_INIT_CFG(o, v)		\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = 0xff,	\
-	}
-
-#define QMP_PHY_INIT_CFG_LANE(o, v, l)	\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = l,		\
-	}
-
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
 	/* PCS registers */
@@ -1483,37 +1462,11 @@ static const struct qmp_phy_cfg sm8650_ufsphy_cfg = {
 	.regs			= ufsphy_v6_regs_layout,
 };
 
-static void qmp_ufs_configure_lane(void __iomem *base,
-					const struct qmp_phy_init_tbl tbl[],
-					int num,
-					u8 lane_mask)
-{
-	int i;
-	const struct qmp_phy_init_tbl *t = tbl;
-
-	if (!t)
-		return;
-
-	for (i = 0; i < num; i++, t++) {
-		if (!(t->lane_mask & lane_mask))
-			continue;
-
-		writel(t->val, base + t->offset);
-	}
-}
-
-static void qmp_ufs_configure(void __iomem *base,
-				   const struct qmp_phy_init_tbl tbl[],
-				   int num)
-{
-	qmp_ufs_configure_lane(base, tbl, num, 0xff);
-}
-
 static void qmp_ufs_serdes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	void __iomem *serdes = qmp->serdes;
 
-	qmp_ufs_configure(serdes, tbls->serdes, tbls->serdes_num);
+	qmp_configure(serdes, tbls->serdes, tbls->serdes_num);
 }
 
 static void qmp_ufs_lanes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls *tbls)
@@ -1522,12 +1475,12 @@ static void qmp_ufs_lanes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbl
 	void __iomem *tx = qmp->tx;
 	void __iomem *rx = qmp->rx;
 
-	qmp_ufs_configure_lane(tx, tbls->tx, tbls->tx_num, 1);
-	qmp_ufs_configure_lane(rx, tbls->rx, tbls->rx_num, 1);
+	qmp_configure_lane(tx, tbls->tx, tbls->tx_num, 1);
+	qmp_configure_lane(rx, tbls->rx, tbls->rx_num, 1);
 
 	if (cfg->lanes >= 2) {
-		qmp_ufs_configure_lane(qmp->tx2, tbls->tx, tbls->tx_num, 2);
-		qmp_ufs_configure_lane(qmp->rx2, tbls->rx, tbls->rx_num, 2);
+		qmp_configure_lane(qmp->tx2, tbls->tx, tbls->tx_num, 2);
+		qmp_configure_lane(qmp->rx2, tbls->rx, tbls->rx_num, 2);
 	}
 }
 
@@ -1535,7 +1488,7 @@ static void qmp_ufs_pcs_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls
 {
 	void __iomem *pcs = qmp->pcs;
 
-	qmp_ufs_configure(pcs, tbls->pcs, tbls->pcs_num);
+	qmp_configure(pcs, tbls->pcs, tbls->pcs_num);
 }
 
 static int qmp_ufs_get_gear_overlay(struct qmp_ufs *qmp, const struct qmp_phy_cfg *cfg)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 25d8d881b2f3..02d90850baf2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -19,6 +19,8 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "phy-qcom-qmp-common.h"
+
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 #include "phy-qcom-qmp-pcs-misc-v4.h"
@@ -64,30 +66,6 @@
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
-struct qmp_phy_init_tbl {
-	unsigned int offset;
-	unsigned int val;
-	/*
-	 * mask of lanes for which this register is written
-	 * for cases when second lane needs different values
-	 */
-	u8 lane_mask;
-};
-
-#define QMP_PHY_INIT_CFG(o, v)		\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = 0xff,	\
-	}
-
-#define QMP_PHY_INIT_CFG_LANE(o, v, l)	\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = l,		\
-	}
-
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
 	/* PCS registers */
@@ -1655,32 +1633,6 @@ static const struct qmp_phy_cfg x1e80100_usb3_uniphy_cfg = {
 	.regs			= qmp_v7_usb3phy_regs_layout,
 };
 
-static void qmp_usb_configure_lane(void __iomem *base,
-					const struct qmp_phy_init_tbl tbl[],
-					int num,
-					u8 lane_mask)
-{
-	int i;
-	const struct qmp_phy_init_tbl *t = tbl;
-
-	if (!t)
-		return;
-
-	for (i = 0; i < num; i++, t++) {
-		if (!(t->lane_mask & lane_mask))
-			continue;
-
-		writel(t->val, base + t->offset);
-	}
-}
-
-static void qmp_usb_configure(void __iomem *base,
-				   const struct qmp_phy_init_tbl tbl[],
-				   int num)
-{
-	qmp_usb_configure_lane(base, tbl, num, 0xff);
-}
-
 static int qmp_usb_serdes_init(struct qmp_usb *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1688,7 +1640,7 @@ static int qmp_usb_serdes_init(struct qmp_usb *qmp)
 	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
 	int serdes_tbl_num = cfg->serdes_tbl_num;
 
-	qmp_usb_configure(serdes, serdes_tbl, serdes_tbl_num);
+	qmp_configure(serdes, serdes_tbl, serdes_tbl_num);
 
 	return 0;
 }
@@ -1769,13 +1721,13 @@ static int qmp_usb_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_usb_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_usb_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
+	qmp_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+	qmp_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
 
-	qmp_usb_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	if (pcs_usb)
-		qmp_usb_configure(pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);
+		qmp_configure(pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);
 
 	if (cfg->has_pwrdn_delay)
 		usleep_range(10, 20);
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 02babec76881..2de440f0bf02 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -23,6 +23,8 @@
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_mux.h>
 
+#include "phy-qcom-qmp-common.h"
+
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
@@ -60,30 +62,6 @@
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
-struct qmp_phy_init_tbl {
-	unsigned int offset;
-	unsigned int val;
-	/*
-	 * mask of lanes for which this register is written
-	 * for cases when second lane needs different values
-	 */
-	u8 lane_mask;
-};
-
-#define QMP_PHY_INIT_CFG(o, v)		\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = 0xff,	\
-	}
-
-#define QMP_PHY_INIT_CFG_LANE(o, v, l)	\
-	{				\
-		.offset = o,		\
-		.val = v,		\
-		.lane_mask = l,		\
-	}
-
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
 	/* PCS registers */
@@ -511,32 +489,6 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
-static void qmp_usbc_configure_lane(void __iomem *base,
-					const struct qmp_phy_init_tbl tbl[],
-					int num,
-					u8 lane_mask)
-{
-	int i;
-	const struct qmp_phy_init_tbl *t = tbl;
-
-	if (!t)
-		return;
-
-	for (i = 0; i < num; i++, t++) {
-		if (!(t->lane_mask & lane_mask))
-			continue;
-
-		writel(t->val, base + t->offset);
-	}
-}
-
-static void qmp_usbc_configure(void __iomem *base,
-				   const struct qmp_phy_init_tbl tbl[],
-				   int num)
-{
-	qmp_usbc_configure_lane(base, tbl, num, 0xff);
-}
-
 static int qmp_usbc_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -609,7 +561,7 @@ static int qmp_usbc_power_on(struct phy *phy)
 	unsigned int val;
 	int ret;
 
-	qmp_usbc_configure(qmp->serdes, cfg->serdes_tbl, cfg->serdes_tbl_num);
+	qmp_configure(qmp->serdes, cfg->serdes_tbl, cfg->serdes_tbl_num);
 
 	ret = clk_prepare_enable(qmp->pipe_clk);
 	if (ret) {
@@ -618,13 +570,13 @@ static int qmp_usbc_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_usbc_configure_lane(qmp->tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_usbc_configure_lane(qmp->rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
+	qmp_configure_lane(qmp->tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+	qmp_configure_lane(qmp->rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
 
-	qmp_usbc_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
-	qmp_usbc_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
+	qmp_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
+	qmp_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
-	qmp_usbc_configure(qmp->pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure(qmp->pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	if (cfg->has_pwrdn_delay)
 		usleep_range(10, 20);

-- 
2.39.2


