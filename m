Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3897153B414
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbiFBHJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbiFBHJ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:27 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2982715704
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:24 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id v9so4288878lja.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ujje1xTajKTfSEAyJLu8vSvLZs6/O66+P96+ecJTI2U=;
        b=IXyRqUUpcqG0edgfPVqdf/sWrrG92IfGbZ/lGt/1xitSywXqAfoOVVfIUXEqoVUI5z
         36wCEKTjsV7YRyItyIbrM1/Cmy9XKNAy3eevF0g8IZuTbUIAGx1YalrXdEKPf1FXOJjj
         hP/cEzDCYHa3he+6KhJW1OL0WYYT8Z/aUNf/dCyQ/JGRPJZRKP5Ifu4KedIENutGH9Ji
         ivvtwuxY24Vg/ZJKNHAORTOA59FFxdOjQ9I/3sVduPgHC8govgBf/4D+6GOQkctqkPsk
         wyCCMZKVVWDHJkgtSb389DbsyHyfnCn+0MQWbfDvnraqvcpU4L4ebVOI+VTLUXTpGyek
         srnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ujje1xTajKTfSEAyJLu8vSvLZs6/O66+P96+ecJTI2U=;
        b=wfKzlUwRIev6ntO5y7zW27b+tvohgPuWh9v3d4lUvBumiJJMK2YWSUcBvtI5DjMmR6
         KnATW4bwUDOblWerhpJ+HwjpksbTVKjiwzIjI8vsYOC4Co3j5J/gPEWRxStH/kHrrm91
         NbSwRMEHKJ5gsuFcmU7DqKbM2Ir1oTHBierSW+xRit+tHRHUD/x+Jx4lyZtiUwbdMOHe
         odgQywBc8UlExtXNmKXTPt1AvV4jSlWjZS2ecfK87LNWZNMtigvQbcXgRSVaNuSnEQ1l
         tMNhkdiaqiochRkXLiRPfnfREcuratvv6utbtK49YdT+CyaCho1C+bIhIPqvTDp1Stvp
         cChg==
X-Gm-Message-State: AOAM533pc8tpj0M7ql3qVIw1UzHZuk2IEk7STkDUOSjyg1oCLjYb0/Cw
        7EEx34qZl6E+DTk4g5skLiqeuIItxZZjOnmX
X-Google-Smtp-Source: ABdhPJwQbstkBBPnd+PuoZcpctXl0nl5LbvyAA2amtrW6C6xF5DBCOtyvRQVXIhDOVhInsUUutzF1g==
X-Received: by 2002:a2e:a5ca:0:b0:254:1ef2:e6b5 with SMTP id n10-20020a2ea5ca000000b002541ef2e6b5mr20371813ljp.330.1654153760953;
        Thu, 02 Jun 2022 00:09:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 10/30] phy: qcom-qmp-ufs: change symbol prefix to qcom_qmp_phy_ufs
Date:   Thu,  2 Jun 2022 10:08:49 +0300
Message-Id: <20220602070909.1666068-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
References: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
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

Change all symbol names to start with qcom_qmp_phy_ufs_ rather than old
qcom_qmp_phy_

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 158 ++++++++++++------------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 4b6ce097d3a7..a8d48c70532c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -950,7 +950,7 @@ static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
 	.is_dual_lane_phy	= true,
 };
 
-static void qcom_qmp_phy_configure_lane(void __iomem *base,
+static void qcom_qmp_phy_ufs_configure_lane(void __iomem *base,
 					const unsigned int *regs,
 					const struct qmp_phy_init_tbl tbl[],
 					int num,
@@ -973,15 +973,15 @@ static void qcom_qmp_phy_configure_lane(void __iomem *base,
 	}
 }
 
-static void qcom_qmp_phy_configure(void __iomem *base,
+static void qcom_qmp_phy_ufs_configure(void __iomem *base,
 				   const unsigned int *regs,
 				   const struct qmp_phy_init_tbl tbl[],
 				   int num)
 {
-	qcom_qmp_phy_configure_lane(base, regs, tbl, num, 0xff);
+	qcom_qmp_phy_ufs_configure_lane(base, regs, tbl, num, 0xff);
 }
 
-static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
+static int qcom_qmp_phy_ufs_serdes_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -991,30 +991,30 @@ static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
 	int serdes_tbl_num = cfg->serdes_tbl_num;
 	int ret;
 
-	qcom_qmp_phy_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
+	qcom_qmp_phy_ufs_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
 	if (cfg->serdes_tbl_sec)
-		qcom_qmp_phy_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
+		qcom_qmp_phy_ufs_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
 				       cfg->serdes_tbl_num_sec);
 
 	if (cfg->type == PHY_TYPE_DP) {
 		switch (dp_opts->link_rate) {
 		case 1620:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_ufs_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_rbr,
 					       cfg->serdes_tbl_rbr_num);
 			break;
 		case 2700:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_ufs_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_hbr,
 					       cfg->serdes_tbl_hbr_num);
 			break;
 		case 5400:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_ufs_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_hbr2,
 					       cfg->serdes_tbl_hbr2_num);
 			break;
 		case 8100:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_ufs_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_hbr3,
 					       cfg->serdes_tbl_hbr3_num);
 			break;
@@ -1074,7 +1074,7 @@ static int qcom_qmp_dp_phy_calibrate(struct phy *phy)
 	return 0;
 }
 
-static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
+static int qcom_qmp_phy_ufs_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -1169,7 +1169,7 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 	return ret;
 }
 
-static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
+static int qcom_qmp_phy_ufs_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -1204,7 +1204,7 @@ static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
 	return 0;
 }
 
-static int qcom_qmp_phy_init(struct phy *phy)
+static int qcom_qmp_phy_ufs_init(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -1239,7 +1239,7 @@ static int qcom_qmp_phy_init(struct phy *phy)
 			return ret;
 	}
 
-	ret = qcom_qmp_phy_com_init(qphy);
+	ret = qcom_qmp_phy_ufs_com_init(qphy);
 	if (ret)
 		return ret;
 
@@ -1249,7 +1249,7 @@ static int qcom_qmp_phy_init(struct phy *phy)
 	return 0;
 }
 
-static int qcom_qmp_phy_power_on(struct phy *phy)
+static int qcom_qmp_phy_ufs_power_on(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -1262,7 +1262,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	unsigned int mask, val, ready;
 	int ret;
 
-	qcom_qmp_phy_serdes_init(qphy);
+	qcom_qmp_phy_ufs_serdes_init(qphy);
 
 	if (cfg->has_lane_rst) {
 		ret = reset_control_deassert(qphy->lane_rst);
@@ -1280,18 +1280,18 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qcom_qmp_phy_configure_lane(tx, cfg->regs,
+	qcom_qmp_phy_ufs_configure_lane(tx, cfg->regs,
 				    cfg->tx_tbl, cfg->tx_tbl_num, 1);
 	if (cfg->tx_tbl_sec)
-		qcom_qmp_phy_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
+		qcom_qmp_phy_ufs_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
 					    cfg->tx_tbl_num_sec, 1);
 
 	/* Configuration for other LANE for USB-DP combo PHY */
 	if (cfg->is_dual_lane_phy) {
-		qcom_qmp_phy_configure_lane(qphy->tx2, cfg->regs,
+		qcom_qmp_phy_ufs_configure_lane(qphy->tx2, cfg->regs,
 					    cfg->tx_tbl, cfg->tx_tbl_num, 2);
 		if (cfg->tx_tbl_sec)
-			qcom_qmp_phy_configure_lane(qphy->tx2, cfg->regs,
+			qcom_qmp_phy_ufs_configure_lane(qphy->tx2, cfg->regs,
 						    cfg->tx_tbl_sec,
 						    cfg->tx_tbl_num_sec, 2);
 	}
@@ -1300,17 +1300,17 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (cfg->type == PHY_TYPE_DP)
 		cfg->configure_dp_tx(qphy);
 
-	qcom_qmp_phy_configure_lane(rx, cfg->regs,
+	qcom_qmp_phy_ufs_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
 	if (cfg->rx_tbl_sec)
-		qcom_qmp_phy_configure_lane(rx, cfg->regs,
+		qcom_qmp_phy_ufs_configure_lane(rx, cfg->regs,
 					    cfg->rx_tbl_sec, cfg->rx_tbl_num_sec, 1);
 
 	if (cfg->is_dual_lane_phy) {
-		qcom_qmp_phy_configure_lane(qphy->rx2, cfg->regs,
+		qcom_qmp_phy_ufs_configure_lane(qphy->rx2, cfg->regs,
 					    cfg->rx_tbl, cfg->rx_tbl_num, 2);
 		if (cfg->rx_tbl_sec)
-			qcom_qmp_phy_configure_lane(qphy->rx2, cfg->regs,
+			qcom_qmp_phy_ufs_configure_lane(qphy->rx2, cfg->regs,
 						    cfg->rx_tbl_sec,
 						    cfg->rx_tbl_num_sec, 2);
 	}
@@ -1319,9 +1319,9 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (cfg->type == PHY_TYPE_DP) {
 		cfg->configure_dp_phy(qphy);
 	} else {
-		qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+		qcom_qmp_phy_ufs_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 		if (cfg->pcs_tbl_sec)
-			qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
+			qcom_qmp_phy_ufs_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
 					       cfg->pcs_tbl_num_sec);
 	}
 
@@ -1329,10 +1329,10 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto err_disable_pipe_clk;
 
-	qcom_qmp_phy_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
+	qcom_qmp_phy_ufs_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
 			       cfg->pcs_misc_tbl_num);
 	if (cfg->pcs_misc_tbl_sec)
-		qcom_qmp_phy_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
+		qcom_qmp_phy_ufs_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
 				       cfg->pcs_misc_tbl_num_sec);
 
 	/*
@@ -1380,7 +1380,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	return ret;
 }
 
-static int qcom_qmp_phy_power_off(struct phy *phy)
+static int qcom_qmp_phy_ufs_power_off(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -1411,7 +1411,7 @@ static int qcom_qmp_phy_power_off(struct phy *phy)
 	return 0;
 }
 
-static int qcom_qmp_phy_exit(struct phy *phy)
+static int qcom_qmp_phy_ufs_exit(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -1419,37 +1419,37 @@ static int qcom_qmp_phy_exit(struct phy *phy)
 	if (cfg->has_lane_rst)
 		reset_control_assert(qphy->lane_rst);
 
-	qcom_qmp_phy_com_exit(qphy);
+	qcom_qmp_phy_ufs_com_exit(qphy);
 
 	return 0;
 }
 
-static int qcom_qmp_phy_enable(struct phy *phy)
+static int qcom_qmp_phy_ufs_enable(struct phy *phy)
 {
 	int ret;
 
-	ret = qcom_qmp_phy_init(phy);
+	ret = qcom_qmp_phy_ufs_init(phy);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_power_on(phy);
+	ret = qcom_qmp_phy_ufs_power_on(phy);
 	if (ret)
-		qcom_qmp_phy_exit(phy);
+		qcom_qmp_phy_ufs_exit(phy);
 
 	return ret;
 }
 
-static int qcom_qmp_phy_disable(struct phy *phy)
+static int qcom_qmp_phy_ufs_disable(struct phy *phy)
 {
 	int ret;
 
-	ret = qcom_qmp_phy_power_off(phy);
+	ret = qcom_qmp_phy_ufs_power_off(phy);
 	if (ret)
 		return ret;
-	return qcom_qmp_phy_exit(phy);
+	return qcom_qmp_phy_ufs_exit(phy);
 }
 
-static int qcom_qmp_phy_set_mode(struct phy *phy,
+static int qcom_qmp_phy_ufs_set_mode(struct phy *phy,
 				 enum phy_mode mode, int submode)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
@@ -1459,7 +1459,7 @@ static int qcom_qmp_phy_set_mode(struct phy *phy,
 	return 0;
 }
 
-static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
+static void qcom_qmp_phy_ufs_enable_autonomous_mode(struct qmp_phy *qphy)
 {
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
@@ -1488,7 +1488,7 @@ static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
 		qphy_clrbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
 }
 
-static void qcom_qmp_phy_disable_autonomous_mode(struct qmp_phy *qphy)
+static void qcom_qmp_phy_ufs_disable_autonomous_mode(struct qmp_phy *qphy)
 {
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
@@ -1506,7 +1506,7 @@ static void qcom_qmp_phy_disable_autonomous_mode(struct qmp_phy *qphy)
 	qphy_clrbits(pcs, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
 }
 
-static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
+static int __maybe_unused qcom_qmp_phy_ufs_runtime_suspend(struct device *dev)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct qmp_phy *qphy = qmp->phys[0];
@@ -1523,7 +1523,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 		return 0;
 	}
 
-	qcom_qmp_phy_enable_autonomous_mode(qphy);
+	qcom_qmp_phy_ufs_enable_autonomous_mode(qphy);
 
 	clk_disable_unprepare(qphy->pipe_clk);
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
@@ -1531,7 +1531,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
+static int __maybe_unused qcom_qmp_phy_ufs_runtime_resume(struct device *dev)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct qmp_phy *qphy = qmp->phys[0];
@@ -1560,12 +1560,12 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	qcom_qmp_phy_disable_autonomous_mode(qphy);
+	qcom_qmp_phy_ufs_disable_autonomous_mode(qphy);
 
 	return 0;
 }
 
-static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+static int qcom_qmp_phy_ufs_vreg_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int num = cfg->num_vregs;
@@ -1581,7 +1581,7 @@ static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *
 	return devm_regulator_bulk_get(dev, num, qmp->vregs);
 }
 
-static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+static int qcom_qmp_phy_ufs_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int i;
@@ -1606,7 +1606,7 @@ static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg
 	return 0;
 }
 
-static int qcom_qmp_phy_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+static int qcom_qmp_phy_ufs_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int num = cfg->num_clks;
@@ -1874,28 +1874,28 @@ static int phy_dp_clks_register(struct qcom_qmp *qmp, struct qmp_phy *qphy,
 	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
 }
 
-static const struct phy_ops qcom_qmp_phy_gen_ops = {
-	.init		= qcom_qmp_phy_enable,
-	.exit		= qcom_qmp_phy_disable,
-	.set_mode	= qcom_qmp_phy_set_mode,
+static const struct phy_ops qcom_qmp_phy_ufs_gen_ops = {
+	.init		= qcom_qmp_phy_ufs_enable,
+	.exit		= qcom_qmp_phy_ufs_disable,
+	.set_mode	= qcom_qmp_phy_ufs_set_mode,
 	.owner		= THIS_MODULE,
 };
 
-static const struct phy_ops qcom_qmp_phy_dp_ops = {
-	.init		= qcom_qmp_phy_init,
+static const struct phy_ops qcom_qmp_phy_ufs_dp_ops = {
+	.init		= qcom_qmp_phy_ufs_init,
 	.configure	= qcom_qmp_dp_phy_configure,
-	.power_on	= qcom_qmp_phy_power_on,
+	.power_on	= qcom_qmp_phy_ufs_power_on,
 	.calibrate	= qcom_qmp_dp_phy_calibrate,
-	.power_off	= qcom_qmp_phy_power_off,
-	.exit		= qcom_qmp_phy_exit,
-	.set_mode	= qcom_qmp_phy_set_mode,
+	.power_off	= qcom_qmp_phy_ufs_power_off,
+	.exit		= qcom_qmp_phy_ufs_exit,
+	.set_mode	= qcom_qmp_phy_ufs_set_mode,
 	.owner		= THIS_MODULE,
 };
 
 static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
-	.power_on	= qcom_qmp_phy_enable,
-	.power_off	= qcom_qmp_phy_disable,
-	.set_mode	= qcom_qmp_phy_set_mode,
+	.power_on	= qcom_qmp_phy_ufs_enable,
+	.power_off	= qcom_qmp_phy_ufs_disable,
+	.set_mode	= qcom_qmp_phy_ufs_set_mode,
 	.owner		= THIS_MODULE,
 };
 
@@ -1905,7 +1905,7 @@ static void qcom_qmp_reset_control_put(void *data)
 }
 
 static
-int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
+int qcom_qmp_phy_ufs_create(struct device *dev, struct device_node *np, int id,
 			void __iomem *serdes, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
@@ -2007,9 +2007,9 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 	if (cfg->type == PHY_TYPE_UFS || cfg->type == PHY_TYPE_PCIE)
 		ops = &qcom_qmp_pcie_ufs_ops;
 	else if (cfg->type == PHY_TYPE_DP)
-		ops = &qcom_qmp_phy_dp_ops;
+		ops = &qcom_qmp_phy_ufs_dp_ops;
 	else
-		ops = &qcom_qmp_phy_gen_ops;
+		ops = &qcom_qmp_phy_ufs_gen_ops;
 
 	generic_phy = devm_phy_create(dev, np, ops);
 	if (IS_ERR(generic_phy)) {
@@ -2027,7 +2027,7 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 	return 0;
 }
 
-static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
+static const struct of_device_id qcom_qmp_phy_ufs_of_match_table[] = {
 	{
 		.compatible = "qcom,msm8996-qmp-ufs-phy",
 		.data = &msm8996_ufs_cfg,
@@ -2064,14 +2064,14 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, qcom_qmp_phy_of_match_table);
+MODULE_DEVICE_TABLE(of, qcom_qmp_phy_ufs_of_match_table);
 
-static const struct dev_pm_ops qcom_qmp_phy_pm_ops = {
-	SET_RUNTIME_PM_OPS(qcom_qmp_phy_runtime_suspend,
-			   qcom_qmp_phy_runtime_resume, NULL)
+static const struct dev_pm_ops qcom_qmp_phy_ufs_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_qmp_phy_ufs_runtime_suspend,
+			   qcom_qmp_phy_ufs_runtime_resume, NULL)
 };
 
-static int qcom_qmp_phy_probe(struct platform_device *pdev)
+static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 {
 	struct qcom_qmp *qmp;
 	struct device *dev = &pdev->dev;
@@ -2125,15 +2125,15 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 
 	mutex_init(&qmp->phy_mutex);
 
-	ret = qcom_qmp_phy_clk_init(dev, cfg);
+	ret = qcom_qmp_phy_ufs_clk_init(dev, cfg);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_reset_init(dev, cfg);
+	ret = qcom_qmp_phy_ufs_reset_init(dev, cfg);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_vreg_init(dev, cfg);
+	ret = qcom_qmp_phy_ufs_vreg_init(dev, cfg);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "failed to get regulator supplies: %d\n",
@@ -2169,7 +2169,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 		}
 
 		/* Create per-lane phy */
-		ret = qcom_qmp_phy_create(dev, child, id, serdes, cfg);
+		ret = qcom_qmp_phy_ufs_create(dev, child, id, serdes, cfg);
 		if (ret) {
 			dev_err(dev, "failed to create lane%d phy, %d\n",
 				id, ret);
@@ -2212,16 +2212,16 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static struct platform_driver qcom_qmp_phy_driver = {
-	.probe		= qcom_qmp_phy_probe,
+static struct platform_driver qcom_qmp_phy_ufs_driver = {
+	.probe		= qcom_qmp_phy_ufs_probe,
 	.driver = {
 		.name	= "qcom-qmp-ufs-phy",
-		.pm	= &qcom_qmp_phy_pm_ops,
-		.of_match_table = qcom_qmp_phy_of_match_table,
+		.pm	= &qcom_qmp_phy_ufs_pm_ops,
+		.of_match_table = qcom_qmp_phy_ufs_of_match_table,
 	},
 };
 
-module_platform_driver(qcom_qmp_phy_driver);
+module_platform_driver(qcom_qmp_phy_ufs_driver);
 
 MODULE_AUTHOR("Vivek Gautam <vivek.gautam@codeaurora.org>");
 MODULE_DESCRIPTION("Qualcomm QMP UFS PHY driver");
-- 
2.35.1

