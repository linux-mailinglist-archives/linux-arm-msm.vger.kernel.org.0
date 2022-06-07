Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1385425BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235931AbiFHCDi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 22:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442500AbiFHCAh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 22:00:37 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B728122C48A
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:21 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a29so1774275lfk.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M9YrX2GxKA53cy0pA5B83JXpbBOCNxGqR4VFE1vdS7Q=;
        b=aVqCas/3ubNK+zHlLaoiBq1PCy5GL+2Imzn+mbCugFPySXlW9ALAI1mun8xQb1RA8p
         4Os5D03Gxh8VE3/3POXXqpNMXkaGC6eAPyNXlLvkmmLmLKv5sWyBNThuii+wg4K3A3qX
         SZlwU9jk8lFPQ+oSaGSIV/CMOfq7H5RQGeC8nOHtrKa5DRqhwRm4iFcneq840/wvt2Tv
         fBjwpg8inXMNwe37maBpYuwUBYlIWdXAAj/ffA6/wJJF7IyfPEAD8dzSlN1GOP5neSjM
         4NjVVjPTDgoPElSEgcyz+IntSrVsYkgqqRKjspABUPiuTG8QmnkAx4yqM8J28GYe3aAS
         X1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M9YrX2GxKA53cy0pA5B83JXpbBOCNxGqR4VFE1vdS7Q=;
        b=ruZfa4fAm8Y6UMWX4znizq2KWGLRqgy7s0IuR0ImB5OV2qbUBMEWk5CcESd8Xkn6NH
         28n4yI0IjssaS8SnK8RNA6OzRgS3Faa1XE3F9p+DEEPEGm9vXZSFRuPtp/YnASjgKNH8
         msdcOCEN+g0oQZc8AOQc7DdrcwD24TEYiLnanNjfa+pC68nSIBlGAecf178X2W+TPPEQ
         w2ZAJyeZ5oH5vsweOSd8Di1ytBMwPM0nBpZXgN30GQqLuunTjQBjZXiQRVnrvCwOvbFL
         2x5Sjr6zez/X38wPbTuNPSjCxFgAADne5eV9OT8HJrXP69jHy4kdwcU56mV2+6pT7kL3
         7ABg==
X-Gm-Message-State: AOAM532gJszE+GmjKPczXbco8lHM+CltldAF32QaE5LLC2EuyBp7K/L5
        JiJgaappJzCldwh2ai0tMywTYQ==
X-Google-Smtp-Source: ABdhPJyk1IK6z93ex8MOFVOmjp+gpRxLLPpusMBKdwL0k5CFzoQ39rUT9LwNcobBqYXnt5VlQt+D7w==
X-Received: by 2002:a05:6512:b93:b0:479:1d41:c960 with SMTP id b19-20020a0565120b9300b004791d41c960mr14494749lfv.78.1654637539492;
        Tue, 07 Jun 2022 14:32:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 08/30] phy: qcom-qmp-pcie: change symbol prefix to qcom_qmp_phy_pcie
Date:   Wed,  8 Jun 2022 00:31:41 +0300
Message-Id: <20220607213203.2819885-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
References: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
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

Change all symbol names to start with qcom_qmp_phy_pcie_ rather than old
qcom_qmp_phy_

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 158 +++++++++++------------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index ff829c521818..eedcf9ccb28c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1796,7 +1796,7 @@ static const struct qmp_phy_cfg sm8450_qmp_gen4x2_pciephy_cfg = {
 	.pwrdn_delay_max	= 1005,		/* us */
 };
 
-static void qcom_qmp_phy_configure_lane(void __iomem *base,
+static void qcom_qmp_phy_pcie_configure_lane(void __iomem *base,
 					const unsigned int *regs,
 					const struct qmp_phy_init_tbl tbl[],
 					int num,
@@ -1819,15 +1819,15 @@ static void qcom_qmp_phy_configure_lane(void __iomem *base,
 	}
 }
 
-static void qcom_qmp_phy_configure(void __iomem *base,
+static void qcom_qmp_phy_pcie_configure(void __iomem *base,
 				   const unsigned int *regs,
 				   const struct qmp_phy_init_tbl tbl[],
 				   int num)
 {
-	qcom_qmp_phy_configure_lane(base, regs, tbl, num, 0xff);
+	qcom_qmp_phy_pcie_configure_lane(base, regs, tbl, num, 0xff);
 }
 
-static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
+static int qcom_qmp_phy_pcie_serdes_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -1837,30 +1837,30 @@ static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
 	int serdes_tbl_num = cfg->serdes_tbl_num;
 	int ret;
 
-	qcom_qmp_phy_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
+	qcom_qmp_phy_pcie_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
 	if (cfg->serdes_tbl_sec)
-		qcom_qmp_phy_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
+		qcom_qmp_phy_pcie_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
 				       cfg->serdes_tbl_num_sec);
 
 	if (cfg->type == PHY_TYPE_DP) {
 		switch (dp_opts->link_rate) {
 		case 1620:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_pcie_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_rbr,
 					       cfg->serdes_tbl_rbr_num);
 			break;
 		case 2700:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_pcie_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_hbr,
 					       cfg->serdes_tbl_hbr_num);
 			break;
 		case 5400:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_pcie_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_hbr2,
 					       cfg->serdes_tbl_hbr2_num);
 			break;
 		case 8100:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_pcie_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_hbr3,
 					       cfg->serdes_tbl_hbr3_num);
 			break;
@@ -1920,7 +1920,7 @@ static int qcom_qmp_dp_phy_calibrate(struct phy *phy)
 	return 0;
 }
 
-static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
+static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -2015,7 +2015,7 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 	return ret;
 }
 
-static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
+static int qcom_qmp_phy_pcie_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -2050,7 +2050,7 @@ static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
 	return 0;
 }
 
-static int qcom_qmp_phy_init(struct phy *phy)
+static int qcom_qmp_phy_pcie_init(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -2085,7 +2085,7 @@ static int qcom_qmp_phy_init(struct phy *phy)
 			return ret;
 	}
 
-	ret = qcom_qmp_phy_com_init(qphy);
+	ret = qcom_qmp_phy_pcie_com_init(qphy);
 	if (ret)
 		return ret;
 
@@ -2095,7 +2095,7 @@ static int qcom_qmp_phy_init(struct phy *phy)
 	return 0;
 }
 
-static int qcom_qmp_phy_power_on(struct phy *phy)
+static int qcom_qmp_phy_pcie_power_on(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -2108,7 +2108,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	unsigned int mask, val, ready;
 	int ret;
 
-	qcom_qmp_phy_serdes_init(qphy);
+	qcom_qmp_phy_pcie_serdes_init(qphy);
 
 	if (cfg->has_lane_rst) {
 		ret = reset_control_deassert(qphy->lane_rst);
@@ -2126,18 +2126,18 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qcom_qmp_phy_configure_lane(tx, cfg->regs,
+	qcom_qmp_phy_pcie_configure_lane(tx, cfg->regs,
 				    cfg->tx_tbl, cfg->tx_tbl_num, 1);
 	if (cfg->tx_tbl_sec)
-		qcom_qmp_phy_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
+		qcom_qmp_phy_pcie_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
 					    cfg->tx_tbl_num_sec, 1);
 
 	/* Configuration for other LANE for USB-DP combo PHY */
 	if (cfg->is_dual_lane_phy) {
-		qcom_qmp_phy_configure_lane(qphy->tx2, cfg->regs,
+		qcom_qmp_phy_pcie_configure_lane(qphy->tx2, cfg->regs,
 					    cfg->tx_tbl, cfg->tx_tbl_num, 2);
 		if (cfg->tx_tbl_sec)
-			qcom_qmp_phy_configure_lane(qphy->tx2, cfg->regs,
+			qcom_qmp_phy_pcie_configure_lane(qphy->tx2, cfg->regs,
 						    cfg->tx_tbl_sec,
 						    cfg->tx_tbl_num_sec, 2);
 	}
@@ -2146,17 +2146,17 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (cfg->type == PHY_TYPE_DP)
 		cfg->configure_dp_tx(qphy);
 
-	qcom_qmp_phy_configure_lane(rx, cfg->regs,
+	qcom_qmp_phy_pcie_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
 	if (cfg->rx_tbl_sec)
-		qcom_qmp_phy_configure_lane(rx, cfg->regs,
+		qcom_qmp_phy_pcie_configure_lane(rx, cfg->regs,
 					    cfg->rx_tbl_sec, cfg->rx_tbl_num_sec, 1);
 
 	if (cfg->is_dual_lane_phy) {
-		qcom_qmp_phy_configure_lane(qphy->rx2, cfg->regs,
+		qcom_qmp_phy_pcie_configure_lane(qphy->rx2, cfg->regs,
 					    cfg->rx_tbl, cfg->rx_tbl_num, 2);
 		if (cfg->rx_tbl_sec)
-			qcom_qmp_phy_configure_lane(qphy->rx2, cfg->regs,
+			qcom_qmp_phy_pcie_configure_lane(qphy->rx2, cfg->regs,
 						    cfg->rx_tbl_sec,
 						    cfg->rx_tbl_num_sec, 2);
 	}
@@ -2165,9 +2165,9 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (cfg->type == PHY_TYPE_DP) {
 		cfg->configure_dp_phy(qphy);
 	} else {
-		qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+		qcom_qmp_phy_pcie_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 		if (cfg->pcs_tbl_sec)
-			qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
+			qcom_qmp_phy_pcie_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
 					       cfg->pcs_tbl_num_sec);
 	}
 
@@ -2175,10 +2175,10 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto err_disable_pipe_clk;
 
-	qcom_qmp_phy_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
+	qcom_qmp_phy_pcie_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
 			       cfg->pcs_misc_tbl_num);
 	if (cfg->pcs_misc_tbl_sec)
-		qcom_qmp_phy_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
+		qcom_qmp_phy_pcie_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
 				       cfg->pcs_misc_tbl_num_sec);
 
 	/*
@@ -2226,7 +2226,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	return ret;
 }
 
-static int qcom_qmp_phy_power_off(struct phy *phy)
+static int qcom_qmp_phy_pcie_power_off(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -2257,7 +2257,7 @@ static int qcom_qmp_phy_power_off(struct phy *phy)
 	return 0;
 }
 
-static int qcom_qmp_phy_exit(struct phy *phy)
+static int qcom_qmp_phy_pcie_exit(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -2265,37 +2265,37 @@ static int qcom_qmp_phy_exit(struct phy *phy)
 	if (cfg->has_lane_rst)
 		reset_control_assert(qphy->lane_rst);
 
-	qcom_qmp_phy_com_exit(qphy);
+	qcom_qmp_phy_pcie_com_exit(qphy);
 
 	return 0;
 }
 
-static int qcom_qmp_phy_enable(struct phy *phy)
+static int qcom_qmp_phy_pcie_enable(struct phy *phy)
 {
 	int ret;
 
-	ret = qcom_qmp_phy_init(phy);
+	ret = qcom_qmp_phy_pcie_init(phy);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_power_on(phy);
+	ret = qcom_qmp_phy_pcie_power_on(phy);
 	if (ret)
-		qcom_qmp_phy_exit(phy);
+		qcom_qmp_phy_pcie_exit(phy);
 
 	return ret;
 }
 
-static int qcom_qmp_phy_disable(struct phy *phy)
+static int qcom_qmp_phy_pcie_disable(struct phy *phy)
 {
 	int ret;
 
-	ret = qcom_qmp_phy_power_off(phy);
+	ret = qcom_qmp_phy_pcie_power_off(phy);
 	if (ret)
 		return ret;
-	return qcom_qmp_phy_exit(phy);
+	return qcom_qmp_phy_pcie_exit(phy);
 }
 
-static int qcom_qmp_phy_set_mode(struct phy *phy,
+static int qcom_qmp_phy_pcie_set_mode(struct phy *phy,
 				 enum phy_mode mode, int submode)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
@@ -2305,7 +2305,7 @@ static int qcom_qmp_phy_set_mode(struct phy *phy,
 	return 0;
 }
 
-static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
+static void qcom_qmp_phy_pcie_enable_autonomous_mode(struct qmp_phy *qphy)
 {
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
@@ -2334,7 +2334,7 @@ static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
 		qphy_clrbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
 }
 
-static void qcom_qmp_phy_disable_autonomous_mode(struct qmp_phy *qphy)
+static void qcom_qmp_phy_pcie_disable_autonomous_mode(struct qmp_phy *qphy)
 {
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
@@ -2352,7 +2352,7 @@ static void qcom_qmp_phy_disable_autonomous_mode(struct qmp_phy *qphy)
 	qphy_clrbits(pcs, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
 }
 
-static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
+static int __maybe_unused qcom_qmp_phy_pcie_runtime_suspend(struct device *dev)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct qmp_phy *qphy = qmp->phys[0];
@@ -2369,7 +2369,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 		return 0;
 	}
 
-	qcom_qmp_phy_enable_autonomous_mode(qphy);
+	qcom_qmp_phy_pcie_enable_autonomous_mode(qphy);
 
 	clk_disable_unprepare(qphy->pipe_clk);
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
@@ -2377,7 +2377,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
+static int __maybe_unused qcom_qmp_phy_pcie_runtime_resume(struct device *dev)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct qmp_phy *qphy = qmp->phys[0];
@@ -2406,12 +2406,12 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	qcom_qmp_phy_disable_autonomous_mode(qphy);
+	qcom_qmp_phy_pcie_disable_autonomous_mode(qphy);
 
 	return 0;
 }
 
-static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+static int qcom_qmp_phy_pcie_vreg_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int num = cfg->num_vregs;
@@ -2427,7 +2427,7 @@ static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *
 	return devm_regulator_bulk_get(dev, num, qmp->vregs);
 }
 
-static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+static int qcom_qmp_phy_pcie_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int i;
@@ -2452,7 +2452,7 @@ static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg
 	return 0;
 }
 
-static int qcom_qmp_phy_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+static int qcom_qmp_phy_pcie_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int num = cfg->num_clks;
@@ -2720,28 +2720,28 @@ static int phy_dp_clks_register(struct qcom_qmp *qmp, struct qmp_phy *qphy,
 	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
 }
 
-static const struct phy_ops qcom_qmp_phy_gen_ops = {
-	.init		= qcom_qmp_phy_enable,
-	.exit		= qcom_qmp_phy_disable,
-	.set_mode	= qcom_qmp_phy_set_mode,
+static const struct phy_ops qcom_qmp_phy_pcie_gen_ops = {
+	.init		= qcom_qmp_phy_pcie_enable,
+	.exit		= qcom_qmp_phy_pcie_disable,
+	.set_mode	= qcom_qmp_phy_pcie_set_mode,
 	.owner		= THIS_MODULE,
 };
 
-static const struct phy_ops qcom_qmp_phy_dp_ops = {
-	.init		= qcom_qmp_phy_init,
+static const struct phy_ops qcom_qmp_phy_pcie_dp_ops = {
+	.init		= qcom_qmp_phy_pcie_init,
 	.configure	= qcom_qmp_dp_phy_configure,
-	.power_on	= qcom_qmp_phy_power_on,
+	.power_on	= qcom_qmp_phy_pcie_power_on,
 	.calibrate	= qcom_qmp_dp_phy_calibrate,
-	.power_off	= qcom_qmp_phy_power_off,
-	.exit		= qcom_qmp_phy_exit,
-	.set_mode	= qcom_qmp_phy_set_mode,
+	.power_off	= qcom_qmp_phy_pcie_power_off,
+	.exit		= qcom_qmp_phy_pcie_exit,
+	.set_mode	= qcom_qmp_phy_pcie_set_mode,
 	.owner		= THIS_MODULE,
 };
 
 static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
-	.power_on	= qcom_qmp_phy_enable,
-	.power_off	= qcom_qmp_phy_disable,
-	.set_mode	= qcom_qmp_phy_set_mode,
+	.power_on	= qcom_qmp_phy_pcie_enable,
+	.power_off	= qcom_qmp_phy_pcie_disable,
+	.set_mode	= qcom_qmp_phy_pcie_set_mode,
 	.owner		= THIS_MODULE,
 };
 
@@ -2751,7 +2751,7 @@ static void qcom_qmp_reset_control_put(void *data)
 }
 
 static
-int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
+int qcom_qmp_phy_pcie_create(struct device *dev, struct device_node *np, int id,
 			void __iomem *serdes, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
@@ -2853,9 +2853,9 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 	if (cfg->type == PHY_TYPE_UFS || cfg->type == PHY_TYPE_PCIE)
 		ops = &qcom_qmp_pcie_ufs_ops;
 	else if (cfg->type == PHY_TYPE_DP)
-		ops = &qcom_qmp_phy_dp_ops;
+		ops = &qcom_qmp_phy_pcie_dp_ops;
 	else
-		ops = &qcom_qmp_phy_gen_ops;
+		ops = &qcom_qmp_phy_pcie_gen_ops;
 
 	generic_phy = devm_phy_create(dev, np, ops);
 	if (IS_ERR(generic_phy)) {
@@ -2873,7 +2873,7 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 	return 0;
 }
 
-static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
+static const struct of_device_id qcom_qmp_phy_pcie_of_match_table[] = {
 	{
 		.compatible = "qcom,msm8998-qmp-pcie-phy",
 		.data = &msm8998_pciephy_cfg,
@@ -2913,14 +2913,14 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, qcom_qmp_phy_of_match_table);
+MODULE_DEVICE_TABLE(of, qcom_qmp_phy_pcie_of_match_table);
 
-static const struct dev_pm_ops qcom_qmp_phy_pm_ops = {
-	SET_RUNTIME_PM_OPS(qcom_qmp_phy_runtime_suspend,
-			   qcom_qmp_phy_runtime_resume, NULL)
+static const struct dev_pm_ops qcom_qmp_phy_pcie_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_qmp_phy_pcie_runtime_suspend,
+			   qcom_qmp_phy_pcie_runtime_resume, NULL)
 };
 
-static int qcom_qmp_phy_probe(struct platform_device *pdev)
+static int qcom_qmp_phy_pcie_probe(struct platform_device *pdev)
 {
 	struct qcom_qmp *qmp;
 	struct device *dev = &pdev->dev;
@@ -2974,15 +2974,15 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 
 	mutex_init(&qmp->phy_mutex);
 
-	ret = qcom_qmp_phy_clk_init(dev, cfg);
+	ret = qcom_qmp_phy_pcie_clk_init(dev, cfg);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_reset_init(dev, cfg);
+	ret = qcom_qmp_phy_pcie_reset_init(dev, cfg);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_vreg_init(dev, cfg);
+	ret = qcom_qmp_phy_pcie_vreg_init(dev, cfg);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "failed to get regulator supplies: %d\n",
@@ -3018,7 +3018,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 		}
 
 		/* Create per-lane phy */
-		ret = qcom_qmp_phy_create(dev, child, id, serdes, cfg);
+		ret = qcom_qmp_phy_pcie_create(dev, child, id, serdes, cfg);
 		if (ret) {
 			dev_err(dev, "failed to create lane%d phy, %d\n",
 				id, ret);
@@ -3061,16 +3061,16 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static struct platform_driver qcom_qmp_phy_driver = {
-	.probe		= qcom_qmp_phy_probe,
+static struct platform_driver qcom_qmp_phy_pcie_driver = {
+	.probe		= qcom_qmp_phy_pcie_probe,
 	.driver = {
 		.name	= "qcom-qmp-pcie-phy",
-		.pm	= &qcom_qmp_phy_pm_ops,
-		.of_match_table = qcom_qmp_phy_of_match_table,
+		.pm	= &qcom_qmp_phy_pcie_pm_ops,
+		.of_match_table = qcom_qmp_phy_pcie_of_match_table,
 	},
 };
 
-module_platform_driver(qcom_qmp_phy_driver);
+module_platform_driver(qcom_qmp_phy_pcie_driver);
 
 MODULE_AUTHOR("Vivek Gautam <vivek.gautam@codeaurora.org>");
 MODULE_DESCRIPTION("Qualcomm QMP PCIe PHY driver");
-- 
2.35.1

