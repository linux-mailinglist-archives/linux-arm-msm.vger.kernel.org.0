Return-Path: <linux-arm-msm+bounces-6704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E0827D2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 04:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF6D51F244D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 03:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286A14C93;
	Tue,  9 Jan 2024 03:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zUu3PsW6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2A83D86
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 03:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ccbc328744so28657841fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 19:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704769444; x=1705374244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/ZBfRr5NYsf/wPFz0lJKWgWgRxwch+qjls6Rlf3ZYY=;
        b=zUu3PsW6nUpAOV3O6x4O4hsVreTPrVmpTaUndqJVKrC2CqOPKyzZereNe6loIjcF8z
         9tI3+9o8eiLbYphuGRQXPI7fbiMM6F8WzMNGeLo9sLMZp7MuZt1OLorr1UA0g67Vka6o
         Cinslv9RZosRKm83V1t/t8BBZ96ZIYNRHmkqC5sgmIKrPAxKnVJlfi3I2HAwoZuS7R+0
         vVlEwv9KtNgFGQgblg7ADm27150BeCqFm7LF/+HPzjkBgcpysqgYxMmj+y/N0OmacJXd
         7mlygQeU1T33aCYo0Tu3WIotZTAR95LketIVmrp4/lCY42wPLtUWGhS5NeTMWXOghjfJ
         My9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704769444; x=1705374244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/ZBfRr5NYsf/wPFz0lJKWgWgRxwch+qjls6Rlf3ZYY=;
        b=iXANbWmVrK776kTS/FQ4LyOn6KcNa0lzybS5oDuNyBhV892KH7urOvCmyE2NeuTwih
         +kA01R/OzLR9NMuhQagfe0GSn8aKY/DJdp1qF2bdcbq+KlZbehUssl4EGfECkkAp/USk
         qJdLOq1hG7lJ+pgD0nyOnMyH+stJmp6VeNytWvI+T6Xv4Iu/PtsNHYSBnK05dhMqKrOW
         xHpLssQPPWdxiBVtOaoREIs9qQnZTIFiO+JOfSRkAGKrg/AS+dEFVS9DilZ31Q/bXxQc
         AL/6ZC31WoyGCAoDx4kk9lKGiA3rbeJjLuHxGVPLsmOahtECO94pReG10FNNL2ViAITz
         YeoQ==
X-Gm-Message-State: AOJu0YwLdqpklBfSUDpuHOpEFreYHMqFogguvO3hhxee2oFPXwnXnA/I
	YMIC/OfI9s5QuCLYb/DRqOxku24fQ7VcLw==
X-Google-Smtp-Source: AGHT+IHS69xCZIJcj57iK74/tgjfaBcFTe/Jg1J34CJoI+xdCmj7LarBY4kz3ErLrA8TZXOdA8Um7w==
X-Received: by 2002:a2e:8348:0:b0:2cc:d21b:a92a with SMTP id l8-20020a2e8348000000b002ccd21ba92amr2102194ljh.69.1704769444570;
        Mon, 08 Jan 2024 19:04:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g30-20020a2e391e000000b002cd1ad3b11csm176920lja.42.2024.01.08.19.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 19:04:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Jan 2024 05:04:01 +0200
Subject: [PATCH 3/8] phy: qcom: qmp: move common functions to common header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240109-phy-qmp-merge-common-v1-3-572899a14318@linaro.org>
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
In-Reply-To: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=22817;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8g/vNcUUMAXYw/uuQ5dzybPHyBQ1gr43bX7LN+HqV/8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlnLegd/JwZo8xOYmR8JrmUVRhp73HuA7kfp5Me
 blLz5s2KGCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZy3oAAKCRCLPIo+Aiko
 1aGoB/4nJWVI+1X7+tR2tlnbkOrM1/MZgz+LLDoveSzemBHv00Y/q/C87/DhbLIO9uE36jyTA7R
 lz5uGFtHR51bsS9+X/Af4CSmz8G6keydmu/8ar/UeFR33cisQQ1NbnUL3JyHgTfUilCTw3i0RB7
 IyFSvmexnAygp1RXQbHi1tqDpHY9ycI+uTpmLGoFG9doaE5WL/tSpZmJ3k69srHomchVBipkJuR
 +1Dhbns93MSlLf+Yl2Hq62m6lb9t4AO46M0j7/hCzrxkSAlpTdCxCurWgRgMESagH7JRQvvhT+K
 Jc8VbkJV/R+twSARy+TU6PFdoRgjYN1hh4ydettBSP6RmzG1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move common init tables code to the common header phy-qcom-qmp-common.h.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        | 98 ++++++------------------
 drivers/phy/qualcomm/phy-qcom-qmp-common.h       | 60 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 60 ++-------------
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         | 78 ++++---------------
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c          | 65 +++-------------
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c          | 66 +++-------------
 6 files changed, 124 insertions(+), 303 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 1ad10110dd25..c86f6f612b1e 100644
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
@@ -2135,7 +2087,7 @@ static void qmp_v3_dp_aux_init(struct qmp_combo *qmp)
 	       qmp->dp_dp_phy + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
 }
 
-static int qmp_combo_configure_dp_swing(struct qmp_combo *qmp)
+static int qmp_configure_dp_swing(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -2177,7 +2129,7 @@ static void qmp_v3_configure_dp_tx(struct qmp_combo *qmp)
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 bias_en, drvr_en;
 
-	if (qmp_combo_configure_dp_swing(qmp) < 0)
+	if (qmp_configure_dp_swing(qmp) < 0)
 		return;
 
 	if (dp_opts->lanes == 1) {
@@ -2194,7 +2146,7 @@ static void qmp_v3_configure_dp_tx(struct qmp_combo *qmp)
 	writel(bias_en, qmp->dp_tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
 }
 
-static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
+static bool qmp_configure_dp_mode(struct qmp_combo *qmp)
 {
 	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
@@ -2218,7 +2170,7 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 	return reverse;
 }
 
-static int qmp_combo_configure_dp_clocks(struct qmp_combo *qmp)
+static int qmp_configure_dp_clocks(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 phy_vco_div;
@@ -2259,12 +2211,12 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
 	u32 status;
 	int ret;
 
-	qmp_combo_configure_dp_mode(qmp);
+	qmp_configure_dp_mode(qmp);
 
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
 
-	ret = qmp_combo_configure_dp_clocks(qmp);
+	ret = qmp_configure_dp_clocks(qmp);
 	if (ret)
 		return ret;
 
@@ -2361,7 +2313,7 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
 	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
 
-	qmp_combo_configure_dp_swing(qmp);
+	qmp_configure_dp_swing(qmp);
 }
 
 static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
@@ -2372,7 +2324,7 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 
 	writel(0x0f, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_CFG_1);
 
-	qmp_combo_configure_dp_mode(qmp);
+	qmp_configure_dp_mode(qmp);
 
 	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
 	writel(0xa4, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
@@ -2380,7 +2332,7 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
 
-	ret = qmp_combo_configure_dp_clocks(qmp);
+	ret = qmp_configure_dp_clocks(qmp);
 	if (ret)
 		return ret;
 
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
index 000000000000..45cc5b795f58
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
@@ -0,0 +1,60 @@
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
index 2af7115ef968..6be6c554e0b3 100644
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
@@ -3183,32 +3161,6 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x4_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
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
@@ -3220,11 +3172,11 @@ static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_
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
@@ -3242,25 +3194,25 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
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
index 3c2e6255e26f..ce9c55f7d5f5 100644
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
@@ -41,30 +44,6 @@
 
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
@@ -1396,37 +1375,11 @@ static const struct qmp_phy_cfg sm8650_ufsphy_cfg = {
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
@@ -1435,12 +1388,12 @@ static void qmp_ufs_lanes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbl
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
 
@@ -1448,7 +1401,7 @@ static void qmp_ufs_pcs_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls
 {
 	void __iomem *pcs = qmp->pcs;
 
-	qmp_ufs_configure(pcs, tbls->pcs, tbls->pcs_num);
+	qmp_configure(pcs, tbls->pcs, tbls->pcs_num);
 }
 
 static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg *cfg)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 243cc2b9a0fb..e481f76b8ed8 100644
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
@@ -1920,32 +1898,6 @@ static const struct qmp_phy_cfg x1e80100_usb3_uniphy_cfg = {
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
@@ -1953,7 +1905,7 @@ static int qmp_usb_serdes_init(struct qmp_usb *qmp)
 	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
 	int serdes_tbl_num = cfg->serdes_tbl_num;
 
-	qmp_usb_configure(serdes, serdes_tbl, serdes_tbl_num);
+	qmp_configure(serdes, serdes_tbl, serdes_tbl_num);
 
 	return 0;
 }
@@ -2034,18 +1986,18 @@ static int qmp_usb_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_usb_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_usb_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
+	qmp_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+	qmp_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
 
 	if (cfg->lanes >= 2) {
-		qmp_usb_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
-		qmp_usb_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
+		qmp_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
+		qmp_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
 	}
 
-	qmp_usb_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	if (pcs_usb)
-		qmp_usb_configure(pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);
+		qmp_configure(pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);
 
 	if (cfg->has_pwrdn_delay)
 		usleep_range(10, 20);

-- 
2.39.2


