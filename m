Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B254B54223E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233969AbiFHFm6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 01:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233885AbiFHFlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 01:41:17 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753A422C4B5
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:24 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j10so30254573lfe.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+PL3nRfpD5gDVM8LpHi94RlOBtGBgEkp9sX8JC3LXVM=;
        b=Wb3sYIChK6EWTr4SFlkAjyPBAokL7+vF1rfHStf+R3onjRICBpVOVJot4CXy1KBwm5
         1ug2Mi7ZRMHcn7mP5eOsQR9o3MOWw9CzRQboGBwDbOL5QbzS7+a0c63RXqUUxWaWPoy0
         mMx1D7v2WlGKNdWjkAFi2rcFx8b1TErhVioA/sg3dEGlPng64zbz4SzRNQjQ2zDvU0KX
         TbLOoYouDzjNotpn/Fh+mgChMG1IhnUgQTJVgseFJfioizwRDPcU8NYp3OU1/4IF2LGi
         w5ueTjpm82XAMv8omTfsd3PYCv8rUlThkzNOJsGMwejFR2/WjN+r2/DUUkBoRANuaNni
         dmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+PL3nRfpD5gDVM8LpHi94RlOBtGBgEkp9sX8JC3LXVM=;
        b=F7puYc44LmALDg9QZfhxEgrkmRMNkxAdZd/aNFKnd2wPy3OPdsdxaxa3lV2o5zfj/U
         MU8ridLTuoVi9IVpgxfbOW9Vj6WtI1znkUFe5JoFnuHJp40gk0xDhzSk9o/xWiFtrpg0
         0doDPid0xQOKTxwJzJ1cr0aaoK0Ev2zRF+g85VfcKoKgatnZGCggG/akbo2BtRNhH18A
         eDSyN736OIMfoo6mrVeIR6n0gV3BL6lng+M6/6KnSTlhRe1MwG5kTeipR/pFXbMkHaN3
         NeClcF52XAmy3NGbWILkyMjGCBPXeTYk2WxxQkDD5deTc9ssv5K4zdotK+YO16SncuvS
         cOqg==
X-Gm-Message-State: AOAM530NeBav79/49croSRv/yORibSC2tMnlc5tNqKRFFX+bZ/hlZEfl
        1uBEdMnbTGnlRPrCSIqXC3vkow==
X-Google-Smtp-Source: ABdhPJwiusohi1yz08hcF9Zy6Vhg7vSgtantDgvkftDGoQwtNVJ9WnDJ6nRS94tjX9Ibkld3t3S6yA==
X-Received: by 2002:ac2:44ac:0:b0:479:269:bd7d with SMTP id c12-20020ac244ac000000b004790269bd7dmr20420438lfm.31.1654637542650;
        Tue, 07 Jun 2022 14:32:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 11/30] phy: qcom-qmp-usb: change symbol prefix to qcom_qmp_phy_usb
Date:   Wed,  8 Jun 2022 00:31:44 +0300
Message-Id: <20220607213203.2819885-12-dmitry.baryshkov@linaro.org>
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

Change all symbol names to start with qcom_qmp_phy_usb_ rather than old
qcom_qmp_phy_

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 158 ++++++++++++------------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index ce424bc6f1a2..4deafdd4a93b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2023,7 +2023,7 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.is_dual_lane_phy	= true,
 };
 
-static void qcom_qmp_phy_configure_lane(void __iomem *base,
+static void qcom_qmp_phy_usb_configure_lane(void __iomem *base,
 					const unsigned int *regs,
 					const struct qmp_phy_init_tbl tbl[],
 					int num,
@@ -2046,15 +2046,15 @@ static void qcom_qmp_phy_configure_lane(void __iomem *base,
 	}
 }
 
-static void qcom_qmp_phy_configure(void __iomem *base,
+static void qcom_qmp_phy_usb_configure(void __iomem *base,
 				   const unsigned int *regs,
 				   const struct qmp_phy_init_tbl tbl[],
 				   int num)
 {
-	qcom_qmp_phy_configure_lane(base, regs, tbl, num, 0xff);
+	qcom_qmp_phy_usb_configure_lane(base, regs, tbl, num, 0xff);
 }
 
-static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
+static int qcom_qmp_phy_usb_serdes_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -2064,30 +2064,30 @@ static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
 	int serdes_tbl_num = cfg->serdes_tbl_num;
 	int ret;
 
-	qcom_qmp_phy_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
+	qcom_qmp_phy_usb_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
 	if (cfg->serdes_tbl_sec)
-		qcom_qmp_phy_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
+		qcom_qmp_phy_usb_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
 				       cfg->serdes_tbl_num_sec);
 
 	if (cfg->type == PHY_TYPE_DP) {
 		switch (dp_opts->link_rate) {
 		case 1620:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_usb_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_rbr,
 					       cfg->serdes_tbl_rbr_num);
 			break;
 		case 2700:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_usb_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_hbr,
 					       cfg->serdes_tbl_hbr_num);
 			break;
 		case 5400:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_usb_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_hbr2,
 					       cfg->serdes_tbl_hbr2_num);
 			break;
 		case 8100:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_usb_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_hbr3,
 					       cfg->serdes_tbl_hbr3_num);
 			break;
@@ -2147,7 +2147,7 @@ static int qcom_qmp_dp_phy_calibrate(struct phy *phy)
 	return 0;
 }
 
-static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
+static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -2242,7 +2242,7 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 	return ret;
 }
 
-static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
+static int qcom_qmp_phy_usb_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -2277,7 +2277,7 @@ static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
 	return 0;
 }
 
-static int qcom_qmp_phy_init(struct phy *phy)
+static int qcom_qmp_phy_usb_init(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -2312,7 +2312,7 @@ static int qcom_qmp_phy_init(struct phy *phy)
 			return ret;
 	}
 
-	ret = qcom_qmp_phy_com_init(qphy);
+	ret = qcom_qmp_phy_usb_com_init(qphy);
 	if (ret)
 		return ret;
 
@@ -2322,7 +2322,7 @@ static int qcom_qmp_phy_init(struct phy *phy)
 	return 0;
 }
 
-static int qcom_qmp_phy_power_on(struct phy *phy)
+static int qcom_qmp_phy_usb_power_on(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -2335,7 +2335,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	unsigned int mask, val, ready;
 	int ret;
 
-	qcom_qmp_phy_serdes_init(qphy);
+	qcom_qmp_phy_usb_serdes_init(qphy);
 
 	if (cfg->has_lane_rst) {
 		ret = reset_control_deassert(qphy->lane_rst);
@@ -2353,18 +2353,18 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qcom_qmp_phy_configure_lane(tx, cfg->regs,
+	qcom_qmp_phy_usb_configure_lane(tx, cfg->regs,
 				    cfg->tx_tbl, cfg->tx_tbl_num, 1);
 	if (cfg->tx_tbl_sec)
-		qcom_qmp_phy_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
+		qcom_qmp_phy_usb_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
 					    cfg->tx_tbl_num_sec, 1);
 
 	/* Configuration for other LANE for USB-DP combo PHY */
 	if (cfg->is_dual_lane_phy) {
-		qcom_qmp_phy_configure_lane(qphy->tx2, cfg->regs,
+		qcom_qmp_phy_usb_configure_lane(qphy->tx2, cfg->regs,
 					    cfg->tx_tbl, cfg->tx_tbl_num, 2);
 		if (cfg->tx_tbl_sec)
-			qcom_qmp_phy_configure_lane(qphy->tx2, cfg->regs,
+			qcom_qmp_phy_usb_configure_lane(qphy->tx2, cfg->regs,
 						    cfg->tx_tbl_sec,
 						    cfg->tx_tbl_num_sec, 2);
 	}
@@ -2373,17 +2373,17 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (cfg->type == PHY_TYPE_DP)
 		cfg->configure_dp_tx(qphy);
 
-	qcom_qmp_phy_configure_lane(rx, cfg->regs,
+	qcom_qmp_phy_usb_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
 	if (cfg->rx_tbl_sec)
-		qcom_qmp_phy_configure_lane(rx, cfg->regs,
+		qcom_qmp_phy_usb_configure_lane(rx, cfg->regs,
 					    cfg->rx_tbl_sec, cfg->rx_tbl_num_sec, 1);
 
 	if (cfg->is_dual_lane_phy) {
-		qcom_qmp_phy_configure_lane(qphy->rx2, cfg->regs,
+		qcom_qmp_phy_usb_configure_lane(qphy->rx2, cfg->regs,
 					    cfg->rx_tbl, cfg->rx_tbl_num, 2);
 		if (cfg->rx_tbl_sec)
-			qcom_qmp_phy_configure_lane(qphy->rx2, cfg->regs,
+			qcom_qmp_phy_usb_configure_lane(qphy->rx2, cfg->regs,
 						    cfg->rx_tbl_sec,
 						    cfg->rx_tbl_num_sec, 2);
 	}
@@ -2392,9 +2392,9 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (cfg->type == PHY_TYPE_DP) {
 		cfg->configure_dp_phy(qphy);
 	} else {
-		qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+		qcom_qmp_phy_usb_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 		if (cfg->pcs_tbl_sec)
-			qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
+			qcom_qmp_phy_usb_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
 					       cfg->pcs_tbl_num_sec);
 	}
 
@@ -2402,10 +2402,10 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto err_disable_pipe_clk;
 
-	qcom_qmp_phy_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
+	qcom_qmp_phy_usb_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
 			       cfg->pcs_misc_tbl_num);
 	if (cfg->pcs_misc_tbl_sec)
-		qcom_qmp_phy_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
+		qcom_qmp_phy_usb_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
 				       cfg->pcs_misc_tbl_num_sec);
 
 	/*
@@ -2453,7 +2453,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	return ret;
 }
 
-static int qcom_qmp_phy_power_off(struct phy *phy)
+static int qcom_qmp_phy_usb_power_off(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -2484,7 +2484,7 @@ static int qcom_qmp_phy_power_off(struct phy *phy)
 	return 0;
 }
 
-static int qcom_qmp_phy_exit(struct phy *phy)
+static int qcom_qmp_phy_usb_exit(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -2492,37 +2492,37 @@ static int qcom_qmp_phy_exit(struct phy *phy)
 	if (cfg->has_lane_rst)
 		reset_control_assert(qphy->lane_rst);
 
-	qcom_qmp_phy_com_exit(qphy);
+	qcom_qmp_phy_usb_com_exit(qphy);
 
 	return 0;
 }
 
-static int qcom_qmp_phy_enable(struct phy *phy)
+static int qcom_qmp_phy_usb_enable(struct phy *phy)
 {
 	int ret;
 
-	ret = qcom_qmp_phy_init(phy);
+	ret = qcom_qmp_phy_usb_init(phy);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_power_on(phy);
+	ret = qcom_qmp_phy_usb_power_on(phy);
 	if (ret)
-		qcom_qmp_phy_exit(phy);
+		qcom_qmp_phy_usb_exit(phy);
 
 	return ret;
 }
 
-static int qcom_qmp_phy_disable(struct phy *phy)
+static int qcom_qmp_phy_usb_disable(struct phy *phy)
 {
 	int ret;
 
-	ret = qcom_qmp_phy_power_off(phy);
+	ret = qcom_qmp_phy_usb_power_off(phy);
 	if (ret)
 		return ret;
-	return qcom_qmp_phy_exit(phy);
+	return qcom_qmp_phy_usb_exit(phy);
 }
 
-static int qcom_qmp_phy_set_mode(struct phy *phy,
+static int qcom_qmp_phy_usb_set_mode(struct phy *phy,
 				 enum phy_mode mode, int submode)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
@@ -2532,7 +2532,7 @@ static int qcom_qmp_phy_set_mode(struct phy *phy,
 	return 0;
 }
 
-static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
+static void qcom_qmp_phy_usb_enable_autonomous_mode(struct qmp_phy *qphy)
 {
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
@@ -2561,7 +2561,7 @@ static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
 		qphy_clrbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
 }
 
-static void qcom_qmp_phy_disable_autonomous_mode(struct qmp_phy *qphy)
+static void qcom_qmp_phy_usb_disable_autonomous_mode(struct qmp_phy *qphy)
 {
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
@@ -2579,7 +2579,7 @@ static void qcom_qmp_phy_disable_autonomous_mode(struct qmp_phy *qphy)
 	qphy_clrbits(pcs, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
 }
 
-static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
+static int __maybe_unused qcom_qmp_phy_usb_runtime_suspend(struct device *dev)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct qmp_phy *qphy = qmp->phys[0];
@@ -2596,7 +2596,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 		return 0;
 	}
 
-	qcom_qmp_phy_enable_autonomous_mode(qphy);
+	qcom_qmp_phy_usb_enable_autonomous_mode(qphy);
 
 	clk_disable_unprepare(qphy->pipe_clk);
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
@@ -2604,7 +2604,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
+static int __maybe_unused qcom_qmp_phy_usb_runtime_resume(struct device *dev)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct qmp_phy *qphy = qmp->phys[0];
@@ -2633,12 +2633,12 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	qcom_qmp_phy_disable_autonomous_mode(qphy);
+	qcom_qmp_phy_usb_disable_autonomous_mode(qphy);
 
 	return 0;
 }
 
-static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+static int qcom_qmp_phy_usb_vreg_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int num = cfg->num_vregs;
@@ -2654,7 +2654,7 @@ static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *
 	return devm_regulator_bulk_get(dev, num, qmp->vregs);
 }
 
-static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+static int qcom_qmp_phy_usb_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int i;
@@ -2679,7 +2679,7 @@ static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg
 	return 0;
 }
 
-static int qcom_qmp_phy_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+static int qcom_qmp_phy_usb_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int num = cfg->num_clks;
@@ -2947,28 +2947,28 @@ static int phy_dp_clks_register(struct qcom_qmp *qmp, struct qmp_phy *qphy,
 	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
 }
 
-static const struct phy_ops qcom_qmp_phy_gen_ops = {
-	.init		= qcom_qmp_phy_enable,
-	.exit		= qcom_qmp_phy_disable,
-	.set_mode	= qcom_qmp_phy_set_mode,
+static const struct phy_ops qcom_qmp_phy_usb_gen_ops = {
+	.init		= qcom_qmp_phy_usb_enable,
+	.exit		= qcom_qmp_phy_usb_disable,
+	.set_mode	= qcom_qmp_phy_usb_set_mode,
 	.owner		= THIS_MODULE,
 };
 
-static const struct phy_ops qcom_qmp_phy_dp_ops = {
-	.init		= qcom_qmp_phy_init,
+static const struct phy_ops qcom_qmp_phy_usb_dp_ops = {
+	.init		= qcom_qmp_phy_usb_init,
 	.configure	= qcom_qmp_dp_phy_configure,
-	.power_on	= qcom_qmp_phy_power_on,
+	.power_on	= qcom_qmp_phy_usb_power_on,
 	.calibrate	= qcom_qmp_dp_phy_calibrate,
-	.power_off	= qcom_qmp_phy_power_off,
-	.exit		= qcom_qmp_phy_exit,
-	.set_mode	= qcom_qmp_phy_set_mode,
+	.power_off	= qcom_qmp_phy_usb_power_off,
+	.exit		= qcom_qmp_phy_usb_exit,
+	.set_mode	= qcom_qmp_phy_usb_set_mode,
 	.owner		= THIS_MODULE,
 };
 
 static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
-	.power_on	= qcom_qmp_phy_enable,
-	.power_off	= qcom_qmp_phy_disable,
-	.set_mode	= qcom_qmp_phy_set_mode,
+	.power_on	= qcom_qmp_phy_usb_enable,
+	.power_off	= qcom_qmp_phy_usb_disable,
+	.set_mode	= qcom_qmp_phy_usb_set_mode,
 	.owner		= THIS_MODULE,
 };
 
@@ -2978,7 +2978,7 @@ static void qcom_qmp_reset_control_put(void *data)
 }
 
 static
-int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
+int qcom_qmp_phy_usb_create(struct device *dev, struct device_node *np, int id,
 			void __iomem *serdes, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
@@ -3080,9 +3080,9 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 	if (cfg->type == PHY_TYPE_UFS || cfg->type == PHY_TYPE_PCIE)
 		ops = &qcom_qmp_pcie_ufs_ops;
 	else if (cfg->type == PHY_TYPE_DP)
-		ops = &qcom_qmp_phy_dp_ops;
+		ops = &qcom_qmp_phy_usb_dp_ops;
 	else
-		ops = &qcom_qmp_phy_gen_ops;
+		ops = &qcom_qmp_phy_usb_gen_ops;
 
 	generic_phy = devm_phy_create(dev, np, ops);
 	if (IS_ERR(generic_phy)) {
@@ -3100,7 +3100,7 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 	return 0;
 }
 
-static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
+static const struct of_device_id qcom_qmp_phy_usb_of_match_table[] = {
 	{
 		.compatible = "qcom,ipq8074-qmp-usb3-phy",
 		.data = &ipq8074_usb3phy_cfg,
@@ -3158,14 +3158,14 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, qcom_qmp_phy_of_match_table);
+MODULE_DEVICE_TABLE(of, qcom_qmp_phy_usb_of_match_table);
 
-static const struct dev_pm_ops qcom_qmp_phy_pm_ops = {
-	SET_RUNTIME_PM_OPS(qcom_qmp_phy_runtime_suspend,
-			   qcom_qmp_phy_runtime_resume, NULL)
+static const struct dev_pm_ops qcom_qmp_phy_usb_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_qmp_phy_usb_runtime_suspend,
+			   qcom_qmp_phy_usb_runtime_resume, NULL)
 };
 
-static int qcom_qmp_phy_probe(struct platform_device *pdev)
+static int qcom_qmp_phy_usb_probe(struct platform_device *pdev)
 {
 	struct qcom_qmp *qmp;
 	struct device *dev = &pdev->dev;
@@ -3219,15 +3219,15 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 
 	mutex_init(&qmp->phy_mutex);
 
-	ret = qcom_qmp_phy_clk_init(dev, cfg);
+	ret = qcom_qmp_phy_usb_clk_init(dev, cfg);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_reset_init(dev, cfg);
+	ret = qcom_qmp_phy_usb_reset_init(dev, cfg);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_vreg_init(dev, cfg);
+	ret = qcom_qmp_phy_usb_vreg_init(dev, cfg);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "failed to get regulator supplies: %d\n",
@@ -3263,7 +3263,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 		}
 
 		/* Create per-lane phy */
-		ret = qcom_qmp_phy_create(dev, child, id, serdes, cfg);
+		ret = qcom_qmp_phy_usb_create(dev, child, id, serdes, cfg);
 		if (ret) {
 			dev_err(dev, "failed to create lane%d phy, %d\n",
 				id, ret);
@@ -3306,16 +3306,16 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static struct platform_driver qcom_qmp_phy_driver = {
-	.probe		= qcom_qmp_phy_probe,
+static struct platform_driver qcom_qmp_phy_usb_driver = {
+	.probe		= qcom_qmp_phy_usb_probe,
 	.driver = {
 		.name	= "qcom-qmp-usb-phy",
-		.pm	= &qcom_qmp_phy_pm_ops,
-		.of_match_table = qcom_qmp_phy_of_match_table,
+		.pm	= &qcom_qmp_phy_usb_pm_ops,
+		.of_match_table = qcom_qmp_phy_usb_of_match_table,
 	},
 };
 
-module_platform_driver(qcom_qmp_phy_driver);
+module_platform_driver(qcom_qmp_phy_usb_driver);
 
 MODULE_AUTHOR("Vivek Gautam <vivek.gautam@codeaurora.org>");
 MODULE_DESCRIPTION("Qualcomm QMP USB PHY driver");
-- 
2.35.1

