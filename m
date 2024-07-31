Return-Path: <linux-arm-msm+bounces-27547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B5494332B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 17:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B2B41C212FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A26D171AA;
	Wed, 31 Jul 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yl2zJOMT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A933A1401B
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439559; cv=none; b=thtVbyhkL0g4hP7PWkiydazr3fXdqh4XFOHJBfZCYQktIlb+I3Z2G1U/v8YDqgVT5872a36Soxq9DVOhGhrvZjp64xdDnI57m11KeCTQ0lWQoRHQSIe5jJRh5WVVMMaqYLGj6SGL7n4j8+ggqiMFgAo52tdfpKSorw18VV+hW4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439559; c=relaxed/simple;
	bh=UnwfgGDUjpbE13pxV422Dr844Xhv47FHx7dNX7afvXM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z5bS6tYmQqkU4SGYLIKcgB29pQsZMAl/xtvxvBh8hGOg1Yk26uzSJvIgM13N9buHF7E/Axv1TmwBr1zeTDMakJ7aJD97K7FgEETZhdgQ14pae8B6zHUo0WVP2DrGtIM4Wrtd+FIfxPwMlEjcEamPNjfPIUuw7lJv6JQ769AYDqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yl2zJOMT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc66fc35f2so8107925ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722439557; x=1723044357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KROUJfzd7zpmXBSNKTmAstwkucbbvJRvDUFfClcBUTs=;
        b=Yl2zJOMTbmgQa1ix6DKAD4bHxb3Fz/8Im1c0QWd1XrBQ+Fkc9KXV8sCcumFglzu8PF
         CoC45rcgFICFjZ2XCCyoIuHKAWXNCAP49Y7AUoRcBfCOgJPfkfqpqLx3I5WpxwSYwkCR
         LuMRfjQl9WAOjmSnaZokDfhmlTRBVykDSxGg6Z/rY3D85EfUJ9rhVEOpccNviPBdnqzL
         HcinxtmwIgFDfRxl6hsxNUi9r86StacYnpdw20D2voNFVdd1JlHejshobWNptsZGvs3W
         oITvw8iVW06fv8thM98LS1zJusU6ebsm606KDuRmWdLjtwtLeXB0Dt/oPcjLLDE1xCOL
         vpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439557; x=1723044357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KROUJfzd7zpmXBSNKTmAstwkucbbvJRvDUFfClcBUTs=;
        b=VOHfaT3y7H5qJl/qxBcj+8fZZosQsA2q/AghbpAiuhHMjue1j/YotmeY6MMjmEi94i
         yC0cnDAvBY+B3+kPeAQdWXvrEqDC1drEsUwGv7S64bufgIMH4ka/hnIcaJXTM641wuiH
         1QP8TmEsZFVjbB0404ZujcfO8uQSCflIUaq4lf5AoxjKsBjsyhjT63o6v0q1QEANEbET
         bI8dyQQrEuYH6Hrwz2VXsFTCd1bFfdCEmRBPxJBUqBVl/ECx2YwIPc/1WkrSTLIcReOt
         O/xLf0yxB0Ol+Zr8Tg23sVYMpjEJg4MHXRsVybEwldFItl4T5wwgIpaq86Wf2Bi+/TSV
         7fSA==
X-Forwarded-Encrypted: i=1; AJvYcCUbgisTeCiTmiEruKl2NLGnpcGQuCyGIBCVPZ8T07cDnRZr3pi+mvPKuvKR2ffzLddVhsHQVQsTijHH7UY3YHNi1F4jeEOWGA8FaBgeeQ==
X-Gm-Message-State: AOJu0YyyX+w8nQQDMhvJW9DLIkchELegzJB+oVOYOuyAIbClGSS8dfRj
	FFQQ7zAqQ/mALpaQEJe/rZbO2AI81EU2/kJpLK2BWWVxSc2LZh0QJspf5rFHvg==
X-Google-Smtp-Source: AGHT+IHaAHeZJQl/6BDz4olgLSYsP8h4LTGjurEwCiEHHGx1zq6QKMnCPnTjvxLmt1OVRUHjdIxKYw==
X-Received: by 2002:a17:903:1250:b0:1fe:d72d:13e1 with SMTP id d9443c01a7336-1ff37c1f3d6mr83336925ad.30.1722439556869;
        Wed, 31 Jul 2024 08:25:56 -0700 (PDT)
Received: from localhost.localdomain ([120.60.66.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee0185sm121896295ad.132.2024.07.31.08.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:25:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: vkoul@kernel.org
Cc: kishon@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3] phy: qcom: qmp: Add debug prints for register writes
Date: Wed, 31 Jul 2024 20:55:48 +0530
Message-Id: <20240731152548.102987-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These register prints are useful to validate the init sequence against the
Qcom internal documentation and also to share with the Qcom hw engineers to
debug issues related to PHY.

Sample debug prints:

qcom-qmp-pcie-phy 1c0e000.phy: Writing Reg: QSERDES_V5_COM_SYSCLK_EN_SEL Offset: 0x0094 Val: 0xd9
qcom-qmp-pcie-phy 1c0e000.phy: Writing Reg: QSERDES_V5_COM_HSCLK_SEL Offset: 0x0158 Val: 0x11

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v3:

* Used dev_dbg() to print device name

Changes in v2:

* Modifed the debug print to include reg offset

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 38 ++++++++++---------
 drivers/phy/qualcomm/phy-qcom-qmp-common.h    | 19 ++++++----
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  |  8 ++--
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 27 ++++++-------
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 12 +++---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 10 ++---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 13 ++++---
 7 files changed, 67 insertions(+), 60 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b00945f7191..a8adc3214bfe 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2190,24 +2190,25 @@ static int qmp_combo_dp_serdes_init(struct qmp_combo *qmp)
 	void __iomem *serdes = qmp->dp_serdes;
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 
-	qmp_configure(serdes, cfg->dp_serdes_tbl, cfg->dp_serdes_tbl_num);
+	qmp_configure(qmp->dev, serdes, cfg->dp_serdes_tbl,
+		      cfg->dp_serdes_tbl_num);
 
 	switch (dp_opts->link_rate) {
 	case 1620:
-		qmp_configure(serdes, cfg->serdes_tbl_rbr,
-				cfg->serdes_tbl_rbr_num);
+		qmp_configure(qmp->dev, serdes, cfg->serdes_tbl_rbr,
+			      cfg->serdes_tbl_rbr_num);
 		break;
 	case 2700:
-		qmp_configure(serdes, cfg->serdes_tbl_hbr,
-				cfg->serdes_tbl_hbr_num);
+		qmp_configure(qmp->dev, serdes, cfg->serdes_tbl_hbr,
+			      cfg->serdes_tbl_hbr_num);
 		break;
 	case 5400:
-		qmp_configure(serdes, cfg->serdes_tbl_hbr2,
-				cfg->serdes_tbl_hbr2_num);
+		qmp_configure(qmp->dev, serdes, cfg->serdes_tbl_hbr2,
+			      cfg->serdes_tbl_hbr2_num);
 		break;
 	case 8100:
-		qmp_configure(serdes, cfg->serdes_tbl_hbr3,
-				cfg->serdes_tbl_hbr3_num);
+		qmp_configure(qmp->dev, serdes, cfg->serdes_tbl_hbr3,
+			      cfg->serdes_tbl_hbr3_num);
 		break;
 	default:
 		/* Other link rates aren't supported */
@@ -2807,8 +2808,8 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 
 	qmp_combo_dp_serdes_init(qmp);
 
-	qmp_configure_lane(tx, cfg->dp_tx_tbl, cfg->dp_tx_tbl_num, 1);
-	qmp_configure_lane(tx2, cfg->dp_tx_tbl, cfg->dp_tx_tbl_num, 2);
+	qmp_configure_lane(qmp->dev, tx, cfg->dp_tx_tbl, cfg->dp_tx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, tx2, cfg->dp_tx_tbl, cfg->dp_tx_tbl_num, 2);
 
 	/* Configure special DP tx tunings */
 	cfg->configure_dp_tx(qmp);
@@ -2850,7 +2851,7 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 	unsigned int val;
 	int ret;
 
-	qmp_configure(serdes, cfg->serdes_tbl, cfg->serdes_tbl_num);
+	qmp_configure(qmp->dev, serdes, cfg->serdes_tbl, cfg->serdes_tbl_num);
 
 	ret = clk_prepare_enable(qmp->pipe_clk);
 	if (ret) {
@@ -2859,16 +2860,17 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_configure_lane(tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
+	qmp_configure_lane(qmp->dev, tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
 
-	qmp_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
-	qmp_configure_lane(rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
+	qmp_configure_lane(qmp->dev, rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
-	qmp_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure(qmp->dev, pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	if (pcs_usb)
-		qmp_configure(pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);
+		qmp_configure(qmp->dev, pcs_usb, cfg->pcs_usb_tbl,
+			      cfg->pcs_usb_tbl_num);
 
 	if (cfg->has_pwrdn_delay)
 		usleep_range(10, 20);
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-common.h b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
index 799384210509..b945fc14cece 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-common.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
@@ -9,6 +9,7 @@
 struct qmp_phy_init_tbl {
 	unsigned int offset;
 	unsigned int val;
+	char *name;
 	/*
 	 * mask of lanes for which this register is written
 	 * for cases when second lane needs different values
@@ -20,6 +21,7 @@ struct qmp_phy_init_tbl {
 	{				\
 		.offset = o,		\
 		.val = v,		\
+		.name = #o,		\
 		.lane_mask = 0xff,	\
 	}
 
@@ -27,13 +29,13 @@ struct qmp_phy_init_tbl {
 	{				\
 		.offset = o,		\
 		.val = v,		\
+		.name = #o,		\
 		.lane_mask = l,		\
 	}
 
-static inline void qmp_configure_lane(void __iomem *base,
-					   const struct qmp_phy_init_tbl tbl[],
-					   int num,
-					   u8 lane_mask)
+static inline void qmp_configure_lane(struct device *dev, void __iomem *base,
+				      const struct qmp_phy_init_tbl tbl[],
+				      int num, u8 lane_mask)
 {
 	int i;
 	const struct qmp_phy_init_tbl *t = tbl;
@@ -45,15 +47,16 @@ static inline void qmp_configure_lane(void __iomem *base,
 		if (!(t->lane_mask & lane_mask))
 			continue;
 
+		dev_dbg(dev, "Writing Reg: %s Offset: 0x%04x Val: 0x%02x\n",
+			t->name, t->offset, t->val);
 		writel(t->val, base + t->offset);
 	}
 }
 
-static inline void qmp_configure(void __iomem *base,
-				      const struct qmp_phy_init_tbl tbl[],
-				      int num)
+static inline void qmp_configure(struct device *dev, void __iomem *base,
+				 const struct qmp_phy_init_tbl tbl[], int num)
 {
-	qmp_configure_lane(base, tbl, num, 0xff);
+	qmp_configure_lane(dev, base, tbl, num, 0xff);
 }
 
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 0442b3120563..5f89e3a3e54f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -288,7 +288,7 @@ static int qmp_pcie_msm8996_serdes_init(struct qmp_phy *qphy)
 	unsigned int val;
 	int ret;
 
-	qmp_configure(serdes, serdes_tbl, serdes_tbl_num);
+	qmp_configure(qmp->dev, serdes, serdes_tbl, serdes_tbl_num);
 
 	qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET], SW_RESET);
 	qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
@@ -431,9 +431,9 @@ static int qmp_pcie_msm8996_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
-	qmp_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure_lane(qmp->dev, tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
+	qmp_configure(qmp->dev, pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	/*
 	 * Pull out PHY from POWER DOWN state.
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 5b36cc7ac78b..b09ec1d7cf5a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3667,11 +3667,11 @@ static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_
 	tx4 = qmp->port_b + offs->tx2;
 	rx4 = qmp->port_b + offs->rx2;
 
-	qmp_configure_lane(tx3, tbls->tx, tbls->tx_num, 1);
-	qmp_configure_lane(rx3, tbls->rx, tbls->rx_num, 1);
+	qmp_configure_lane(qmp->dev, tx3, tbls->tx, tbls->tx_num, 1);
+	qmp_configure_lane(qmp->dev, rx3, tbls->rx, tbls->rx_num, 1);
 
-	qmp_configure_lane(tx4, tbls->tx, tbls->tx_num, 2);
-	qmp_configure_lane(rx4, tbls->rx, tbls->rx_num, 2);
+	qmp_configure_lane(qmp->dev, tx4, tbls->tx, tbls->tx_num, 2);
+	qmp_configure_lane(qmp->dev, rx4, tbls->rx, tbls->rx_num, 2);
 }
 
 static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
@@ -3689,25 +3689,26 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
 	if (!tbls)
 		return;
 
-	qmp_configure(serdes, tbls->serdes, tbls->serdes_num);
+	qmp_configure(qmp->dev, serdes, tbls->serdes, tbls->serdes_num);
 
-	qmp_configure_lane(tx, tbls->tx, tbls->tx_num, 1);
-	qmp_configure_lane(rx, tbls->rx, tbls->rx_num, 1);
+	qmp_configure_lane(qmp->dev, tx, tbls->tx, tbls->tx_num, 1);
+	qmp_configure_lane(qmp->dev, rx, tbls->rx, tbls->rx_num, 1);
 
 	if (cfg->lanes >= 2) {
-		qmp_configure_lane(tx2, tbls->tx, tbls->tx_num, 2);
-		qmp_configure_lane(rx2, tbls->rx, tbls->rx_num, 2);
+		qmp_configure_lane(qmp->dev, tx2, tbls->tx, tbls->tx_num, 2);
+		qmp_configure_lane(qmp->dev, rx2, tbls->rx, tbls->rx_num, 2);
 	}
 
-	qmp_configure(pcs, tbls->pcs, tbls->pcs_num);
-	qmp_configure(pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
+	qmp_configure(qmp->dev, pcs, tbls->pcs, tbls->pcs_num);
+	qmp_configure(qmp->dev, pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
 
 	if (cfg->lanes >= 4 && qmp->tcsr_4ln_config) {
-		qmp_configure(serdes, cfg->serdes_4ln_tbl, cfg->serdes_4ln_num);
+		qmp_configure(qmp->dev, serdes, cfg->serdes_4ln_tbl,
+			      cfg->serdes_4ln_num);
 		qmp_pcie_init_port_b(qmp, tbls);
 	}
 
-	qmp_configure(ln_shrd, tbls->ln_shrd, tbls->ln_shrd_num);
+	qmp_configure(qmp->dev, ln_shrd, tbls->ln_shrd, tbls->ln_shrd_num);
 }
 
 static int qmp_pcie_init(struct phy *phy)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index a57e8a4657f4..d964bdfe8700 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1527,7 +1527,7 @@ static void qmp_ufs_serdes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tb
 {
 	void __iomem *serdes = qmp->serdes;
 
-	qmp_configure(serdes, tbls->serdes, tbls->serdes_num);
+	qmp_configure(qmp->dev, serdes, tbls->serdes, tbls->serdes_num);
 }
 
 static void qmp_ufs_lanes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls *tbls)
@@ -1536,12 +1536,12 @@ static void qmp_ufs_lanes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbl
 	void __iomem *tx = qmp->tx;
 	void __iomem *rx = qmp->rx;
 
-	qmp_configure_lane(tx, tbls->tx, tbls->tx_num, 1);
-	qmp_configure_lane(rx, tbls->rx, tbls->rx_num, 1);
+	qmp_configure_lane(qmp->dev, tx, tbls->tx, tbls->tx_num, 1);
+	qmp_configure_lane(qmp->dev, rx, tbls->rx, tbls->rx_num, 1);
 
 	if (cfg->lanes >= 2) {
-		qmp_configure_lane(qmp->tx2, tbls->tx, tbls->tx_num, 2);
-		qmp_configure_lane(qmp->rx2, tbls->rx, tbls->rx_num, 2);
+		qmp_configure_lane(qmp->dev, qmp->tx2, tbls->tx, tbls->tx_num, 2);
+		qmp_configure_lane(qmp->dev, qmp->rx2, tbls->rx, tbls->rx_num, 2);
 	}
 }
 
@@ -1549,7 +1549,7 @@ static void qmp_ufs_pcs_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls
 {
 	void __iomem *pcs = qmp->pcs;
 
-	qmp_configure(pcs, tbls->pcs, tbls->pcs_num);
+	qmp_configure(qmp->dev, pcs, tbls->pcs, tbls->pcs_num);
 }
 
 static int qmp_ufs_get_gear_overlay(struct qmp_ufs *qmp, const struct qmp_phy_cfg *cfg)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 9b0eb87b1680..2fd49355aa37 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1649,7 +1649,7 @@ static int qmp_usb_serdes_init(struct qmp_usb *qmp)
 	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
 	int serdes_tbl_num = cfg->serdes_tbl_num;
 
-	qmp_configure(serdes, serdes_tbl, serdes_tbl_num);
+	qmp_configure(qmp->dev, serdes, serdes_tbl, serdes_tbl_num);
 
 	return 0;
 }
@@ -1730,13 +1730,13 @@ static int qmp_usb_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
 
-	qmp_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure(qmp->dev, pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	if (pcs_usb)
-		qmp_configure(pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);
+		qmp_configure(qmp->dev, pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);
 
 	if (cfg->has_pwrdn_delay)
 		usleep_range(10, 20);
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 5cbc5fd529eb..d4fa1063ea61 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -526,7 +526,8 @@ static int qmp_usbc_power_on(struct phy *phy)
 	unsigned int val;
 	int ret;
 
-	qmp_configure(qmp->serdes, cfg->serdes_tbl, cfg->serdes_tbl_num);
+	qmp_configure(qmp->dev, qmp->serdes, cfg->serdes_tbl,
+		      cfg->serdes_tbl_num);
 
 	ret = clk_prepare_enable(qmp->pipe_clk);
 	if (ret) {
@@ -535,13 +536,13 @@ static int qmp_usbc_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_configure_lane(qmp->tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_configure_lane(qmp->rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, qmp->tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, qmp->rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
 
-	qmp_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
-	qmp_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
+	qmp_configure_lane(qmp->dev, qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
+	qmp_configure_lane(qmp->dev, qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
-	qmp_configure(qmp->pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure(qmp->dev, qmp->pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
 	/* Pull PHY out of reset state */
 	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
-- 
2.25.1


