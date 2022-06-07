Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B379654247C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbiFHD01 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 23:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbiFHDXf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 23:23:35 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1602022C47B
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:19 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t25so30256494lfg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WrvSvxNWbDn2+YkJpQX7j8zZcd9HPxHyJatqnajcQME=;
        b=Rg4PRFOz4V0YAwElOKvO84BwTTYj0polDoR6KSsHwhyPWyYuFMaCZ2CXex4YnC1CkN
         BmiTvYsloKXfBoA4k+ORdw5qv+fRTin7zx4tVmJhk/TMDTyytWUHYmn2q7ehIOC7jZ5G
         96xxDH5kY93uc3CausrfKPSbIkGnOZMl6y38BNKulWnUGrHo1asWgg7h+FbUuOo4NXRh
         EfMGldT9naPXmX9LuiothByYLIEF51/0B4wFWHUO6gK5cvpbKD6WYVoRUfdEaWF8oBYU
         GXniPgxKmkSPlVzU2PqfGhyumGIhFblw3cETxTgvmhmSy+TZ0NhIXtsKTO2NaHViYwrg
         zHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WrvSvxNWbDn2+YkJpQX7j8zZcd9HPxHyJatqnajcQME=;
        b=pbohWwPP/n0kOMd10UUypIE3lLg5uk2GGjjOXrlhECt963weAw5zBbunMo/VNPeWGy
         cW8u6RlY/Z/tH9D5KEyDoGwLj1Zgy+BmKFeZ10hpcVA31hRjxQEGG1QbXSGsosZnMgSK
         Zax5twuTGy3ZuFxa1SLfa8lt27A+c4h0d2RP9z2QSFDfRThjEVf7gwaVNymaAnjNFtEn
         564JQwzdSHWOO19v5wnB/qQLjmkiCJIShf0yzikFCcHIU7jyrivF2l8fDt5S43GMbxXf
         RxCmuvgCoyuYoeqaR4t6yUW4bwqpXgesGx6vcqYjHPPO9R1cwMW8hJx9lKAndqudjqsd
         pMnA==
X-Gm-Message-State: AOAM530c2tI2iKsrZzG0Pgxlq5VgfOU3oBKPMGJ+Q84jpFk6juuWXzvx
        7lxmFmdzMwcY9b2AZ5xTFCn6lg==
X-Google-Smtp-Source: ABdhPJyDWBbdnJ7ROejaHNqWHi8b7KnoO7SAJnQ4yQmJTPD9t9qQvTSJj4qbgp0hJnYJcXlEDGvhUA==
X-Received: by 2002:ac2:4c42:0:b0:479:6f07:8f83 with SMTP id o2-20020ac24c42000000b004796f078f83mr2248454lfk.634.1654637537850;
        Tue, 07 Jun 2022 14:32:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 07/30] phy: qcom-qmp-combo: change symbol prefix to qcom_qmp_phy_combo
Date:   Wed,  8 Jun 2022 00:31:40 +0300
Message-Id: <20220607213203.2819885-8-dmitry.baryshkov@linaro.org>
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

Change all symbol names to start with qcom_qmp_phy_combo_ rather than old
qcom_qmp_phy_

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 164 +++++++++++-----------
 1 file changed, 82 insertions(+), 82 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 9ec5a71146f1..006c9eb80a4b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1051,7 +1051,7 @@ static const struct qmp_phy_combo_cfg sm8250_usb3dpphy_cfg = {
 	.dp_cfg			= &sm8250_dpphy_cfg,
 };
 
-static void qcom_qmp_phy_configure_lane(void __iomem *base,
+static void qcom_qmp_phy_combo_configure_lane(void __iomem *base,
 					const unsigned int *regs,
 					const struct qmp_phy_init_tbl tbl[],
 					int num,
@@ -1074,15 +1074,15 @@ static void qcom_qmp_phy_configure_lane(void __iomem *base,
 	}
 }
 
-static void qcom_qmp_phy_configure(void __iomem *base,
+static void qcom_qmp_phy_combo_configure(void __iomem *base,
 				   const unsigned int *regs,
 				   const struct qmp_phy_init_tbl tbl[],
 				   int num)
 {
-	qcom_qmp_phy_configure_lane(base, regs, tbl, num, 0xff);
+	qcom_qmp_phy_combo_configure_lane(base, regs, tbl, num, 0xff);
 }
 
-static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
+static int qcom_qmp_phy_combo_serdes_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -1092,30 +1092,30 @@ static int qcom_qmp_phy_serdes_init(struct qmp_phy *qphy)
 	int serdes_tbl_num = cfg->serdes_tbl_num;
 	int ret;
 
-	qcom_qmp_phy_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
+	qcom_qmp_phy_combo_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
 	if (cfg->serdes_tbl_sec)
-		qcom_qmp_phy_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
+		qcom_qmp_phy_combo_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
 				       cfg->serdes_tbl_num_sec);
 
 	if (cfg->type == PHY_TYPE_DP) {
 		switch (dp_opts->link_rate) {
 		case 1620:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_combo_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_rbr,
 					       cfg->serdes_tbl_rbr_num);
 			break;
 		case 2700:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_combo_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_hbr,
 					       cfg->serdes_tbl_hbr_num);
 			break;
 		case 5400:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_combo_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_hbr2,
 					       cfg->serdes_tbl_hbr2_num);
 			break;
 		case 8100:
-			qcom_qmp_phy_configure(serdes, cfg->regs,
+			qcom_qmp_phy_combo_configure(serdes, cfg->regs,
 					       cfg->serdes_tbl_hbr3,
 					       cfg->serdes_tbl_hbr3_num);
 			break;
@@ -1220,7 +1220,7 @@ static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
 	{ 0x1f, 0xff, 0xff, 0xff }
 };
 
-static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
+static int qcom_qmp_phy_combo_configure_dp_swing(struct qmp_phy *qphy,
 		unsigned int drv_lvl_reg, unsigned int emp_post_reg)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
@@ -1262,7 +1262,7 @@ static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
 	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
 	u32 bias_en, drvr_en;
 
-	if (qcom_qmp_phy_configure_dp_swing(qphy,
+	if (qcom_qmp_phy_combo_configure_dp_swing(qphy,
 				QSERDES_V3_TX_TX_DRV_LVL,
 				QSERDES_V3_TX_TX_EMP_POST1_LVL) < 0)
 		return;
@@ -1281,7 +1281,7 @@ static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
 	writel(bias_en, qphy->tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
 }
 
-static bool qcom_qmp_phy_configure_dp_mode(struct qmp_phy *qphy)
+static bool qcom_qmp_phy_combo_configure_dp_mode(struct qmp_phy *qphy)
 {
 	u32 val;
 	bool reverse = false;
@@ -1318,7 +1318,7 @@ static int qcom_qmp_v3_phy_configure_dp_phy(struct qmp_phy *qphy)
 	u32 phy_vco_div, status;
 	unsigned long pixel_freq;
 
-	qcom_qmp_phy_configure_dp_mode(qphy);
+	qcom_qmp_phy_combo_configure_dp_mode(qphy);
 
 	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x05, qphy->pcs + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
@@ -1438,7 +1438,7 @@ static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
 	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
 	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
 
-	qcom_qmp_phy_configure_dp_swing(qphy,
+	qcom_qmp_phy_combo_configure_dp_swing(qphy,
 			QSERDES_V4_TX_TX_DRV_LVL,
 			QSERDES_V4_TX_TX_EMP_POST1_LVL);
 }
@@ -1454,7 +1454,7 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
 
 	writel(0x0f, qphy->pcs + QSERDES_V4_DP_PHY_CFG_1);
 
-	reverse = qcom_qmp_phy_configure_dp_mode(qphy);
+	reverse = qcom_qmp_phy_combo_configure_dp_mode(qphy);
 
 	writel(0x13, qphy->pcs + QSERDES_DP_PHY_AUX_CFG1);
 	writel(0xa4, qphy->pcs + QSERDES_DP_PHY_AUX_CFG2);
@@ -1626,7 +1626,7 @@ static int qcom_qmp_dp_phy_calibrate(struct phy *phy)
 	return 0;
 }
 
-static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
+static int qcom_qmp_phy_combo_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -1721,7 +1721,7 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 	return ret;
 }
 
-static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
+static int qcom_qmp_phy_combo_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -1756,7 +1756,7 @@ static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
 	return 0;
 }
 
-static int qcom_qmp_phy_init(struct phy *phy)
+static int qcom_qmp_phy_combo_init(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -1791,7 +1791,7 @@ static int qcom_qmp_phy_init(struct phy *phy)
 			return ret;
 	}
 
-	ret = qcom_qmp_phy_com_init(qphy);
+	ret = qcom_qmp_phy_combo_com_init(qphy);
 	if (ret)
 		return ret;
 
@@ -1801,7 +1801,7 @@ static int qcom_qmp_phy_init(struct phy *phy)
 	return 0;
 }
 
-static int qcom_qmp_phy_power_on(struct phy *phy)
+static int qcom_qmp_phy_combo_power_on(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -1814,7 +1814,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	unsigned int mask, val, ready;
 	int ret;
 
-	qcom_qmp_phy_serdes_init(qphy);
+	qcom_qmp_phy_combo_serdes_init(qphy);
 
 	if (cfg->has_lane_rst) {
 		ret = reset_control_deassert(qphy->lane_rst);
@@ -1832,18 +1832,18 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qcom_qmp_phy_configure_lane(tx, cfg->regs,
+	qcom_qmp_phy_combo_configure_lane(tx, cfg->regs,
 				    cfg->tx_tbl, cfg->tx_tbl_num, 1);
 	if (cfg->tx_tbl_sec)
-		qcom_qmp_phy_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
+		qcom_qmp_phy_combo_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
 					    cfg->tx_tbl_num_sec, 1);
 
 	/* Configuration for other LANE for USB-DP combo PHY */
 	if (cfg->is_dual_lane_phy) {
-		qcom_qmp_phy_configure_lane(qphy->tx2, cfg->regs,
+		qcom_qmp_phy_combo_configure_lane(qphy->tx2, cfg->regs,
 					    cfg->tx_tbl, cfg->tx_tbl_num, 2);
 		if (cfg->tx_tbl_sec)
-			qcom_qmp_phy_configure_lane(qphy->tx2, cfg->regs,
+			qcom_qmp_phy_combo_configure_lane(qphy->tx2, cfg->regs,
 						    cfg->tx_tbl_sec,
 						    cfg->tx_tbl_num_sec, 2);
 	}
@@ -1852,17 +1852,17 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (cfg->type == PHY_TYPE_DP)
 		cfg->configure_dp_tx(qphy);
 
-	qcom_qmp_phy_configure_lane(rx, cfg->regs,
+	qcom_qmp_phy_combo_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
 	if (cfg->rx_tbl_sec)
-		qcom_qmp_phy_configure_lane(rx, cfg->regs,
+		qcom_qmp_phy_combo_configure_lane(rx, cfg->regs,
 					    cfg->rx_tbl_sec, cfg->rx_tbl_num_sec, 1);
 
 	if (cfg->is_dual_lane_phy) {
-		qcom_qmp_phy_configure_lane(qphy->rx2, cfg->regs,
+		qcom_qmp_phy_combo_configure_lane(qphy->rx2, cfg->regs,
 					    cfg->rx_tbl, cfg->rx_tbl_num, 2);
 		if (cfg->rx_tbl_sec)
-			qcom_qmp_phy_configure_lane(qphy->rx2, cfg->regs,
+			qcom_qmp_phy_combo_configure_lane(qphy->rx2, cfg->regs,
 						    cfg->rx_tbl_sec,
 						    cfg->rx_tbl_num_sec, 2);
 	}
@@ -1871,9 +1871,9 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (cfg->type == PHY_TYPE_DP) {
 		cfg->configure_dp_phy(qphy);
 	} else {
-		qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+		qcom_qmp_phy_combo_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 		if (cfg->pcs_tbl_sec)
-			qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
+			qcom_qmp_phy_combo_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
 					       cfg->pcs_tbl_num_sec);
 	}
 
@@ -1881,10 +1881,10 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto err_disable_pipe_clk;
 
-	qcom_qmp_phy_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
+	qcom_qmp_phy_combo_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
 			       cfg->pcs_misc_tbl_num);
 	if (cfg->pcs_misc_tbl_sec)
-		qcom_qmp_phy_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
+		qcom_qmp_phy_combo_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
 				       cfg->pcs_misc_tbl_num_sec);
 
 	/*
@@ -1932,7 +1932,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	return ret;
 }
 
-static int qcom_qmp_phy_power_off(struct phy *phy)
+static int qcom_qmp_phy_combo_power_off(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -1963,7 +1963,7 @@ static int qcom_qmp_phy_power_off(struct phy *phy)
 	return 0;
 }
 
-static int qcom_qmp_phy_exit(struct phy *phy)
+static int qcom_qmp_phy_combo_exit(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
@@ -1971,37 +1971,37 @@ static int qcom_qmp_phy_exit(struct phy *phy)
 	if (cfg->has_lane_rst)
 		reset_control_assert(qphy->lane_rst);
 
-	qcom_qmp_phy_com_exit(qphy);
+	qcom_qmp_phy_combo_com_exit(qphy);
 
 	return 0;
 }
 
-static int qcom_qmp_phy_enable(struct phy *phy)
+static int qcom_qmp_phy_combo_enable(struct phy *phy)
 {
 	int ret;
 
-	ret = qcom_qmp_phy_init(phy);
+	ret = qcom_qmp_phy_combo_init(phy);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_power_on(phy);
+	ret = qcom_qmp_phy_combo_power_on(phy);
 	if (ret)
-		qcom_qmp_phy_exit(phy);
+		qcom_qmp_phy_combo_exit(phy);
 
 	return ret;
 }
 
-static int qcom_qmp_phy_disable(struct phy *phy)
+static int qcom_qmp_phy_combo_disable(struct phy *phy)
 {
 	int ret;
 
-	ret = qcom_qmp_phy_power_off(phy);
+	ret = qcom_qmp_phy_combo_power_off(phy);
 	if (ret)
 		return ret;
-	return qcom_qmp_phy_exit(phy);
+	return qcom_qmp_phy_combo_exit(phy);
 }
 
-static int qcom_qmp_phy_set_mode(struct phy *phy,
+static int qcom_qmp_phy_combo_set_mode(struct phy *phy,
 				 enum phy_mode mode, int submode)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
@@ -2011,7 +2011,7 @@ static int qcom_qmp_phy_set_mode(struct phy *phy,
 	return 0;
 }
 
-static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
+static void qcom_qmp_phy_combo_enable_autonomous_mode(struct qmp_phy *qphy)
 {
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
@@ -2040,7 +2040,7 @@ static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
 		qphy_clrbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
 }
 
-static void qcom_qmp_phy_disable_autonomous_mode(struct qmp_phy *qphy)
+static void qcom_qmp_phy_combo_disable_autonomous_mode(struct qmp_phy *qphy)
 {
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
@@ -2058,7 +2058,7 @@ static void qcom_qmp_phy_disable_autonomous_mode(struct qmp_phy *qphy)
 	qphy_clrbits(pcs, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
 }
 
-static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
+static int __maybe_unused qcom_qmp_phy_combo_runtime_suspend(struct device *dev)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct qmp_phy *qphy = qmp->phys[0];
@@ -2075,7 +2075,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 		return 0;
 	}
 
-	qcom_qmp_phy_enable_autonomous_mode(qphy);
+	qcom_qmp_phy_combo_enable_autonomous_mode(qphy);
 
 	clk_disable_unprepare(qphy->pipe_clk);
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
@@ -2083,7 +2083,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
+static int __maybe_unused qcom_qmp_phy_combo_runtime_resume(struct device *dev)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct qmp_phy *qphy = qmp->phys[0];
@@ -2112,12 +2112,12 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	qcom_qmp_phy_disable_autonomous_mode(qphy);
+	qcom_qmp_phy_combo_disable_autonomous_mode(qphy);
 
 	return 0;
 }
 
-static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+static int qcom_qmp_phy_combo_vreg_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int num = cfg->num_vregs;
@@ -2133,7 +2133,7 @@ static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *
 	return devm_regulator_bulk_get(dev, num, qmp->vregs);
 }
 
-static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+static int qcom_qmp_phy_combo_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int i;
@@ -2158,7 +2158,7 @@ static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg
 	return 0;
 }
 
-static int qcom_qmp_phy_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+static int qcom_qmp_phy_combo_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int num = cfg->num_clks;
@@ -2426,28 +2426,28 @@ static int phy_dp_clks_register(struct qcom_qmp *qmp, struct qmp_phy *qphy,
 	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
 }
 
-static const struct phy_ops qcom_qmp_phy_gen_ops = {
-	.init		= qcom_qmp_phy_enable,
-	.exit		= qcom_qmp_phy_disable,
-	.set_mode	= qcom_qmp_phy_set_mode,
+static const struct phy_ops qcom_qmp_phy_combo_gen_ops = {
+	.init		= qcom_qmp_phy_combo_enable,
+	.exit		= qcom_qmp_phy_combo_disable,
+	.set_mode	= qcom_qmp_phy_combo_set_mode,
 	.owner		= THIS_MODULE,
 };
 
-static const struct phy_ops qcom_qmp_phy_dp_ops = {
-	.init		= qcom_qmp_phy_init,
+static const struct phy_ops qcom_qmp_phy_combo_dp_ops = {
+	.init		= qcom_qmp_phy_combo_init,
 	.configure	= qcom_qmp_dp_phy_configure,
-	.power_on	= qcom_qmp_phy_power_on,
+	.power_on	= qcom_qmp_phy_combo_power_on,
 	.calibrate	= qcom_qmp_dp_phy_calibrate,
-	.power_off	= qcom_qmp_phy_power_off,
-	.exit		= qcom_qmp_phy_exit,
-	.set_mode	= qcom_qmp_phy_set_mode,
+	.power_off	= qcom_qmp_phy_combo_power_off,
+	.exit		= qcom_qmp_phy_combo_exit,
+	.set_mode	= qcom_qmp_phy_combo_set_mode,
 	.owner		= THIS_MODULE,
 };
 
 static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
-	.power_on	= qcom_qmp_phy_enable,
-	.power_off	= qcom_qmp_phy_disable,
-	.set_mode	= qcom_qmp_phy_set_mode,
+	.power_on	= qcom_qmp_phy_combo_enable,
+	.power_off	= qcom_qmp_phy_combo_disable,
+	.set_mode	= qcom_qmp_phy_combo_set_mode,
 	.owner		= THIS_MODULE,
 };
 
@@ -2457,7 +2457,7 @@ static void qcom_qmp_reset_control_put(void *data)
 }
 
 static
-int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
+int qcom_qmp_phy_combo_create(struct device *dev, struct device_node *np, int id,
 			void __iomem *serdes, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
@@ -2559,9 +2559,9 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 	if (cfg->type == PHY_TYPE_UFS || cfg->type == PHY_TYPE_PCIE)
 		ops = &qcom_qmp_pcie_ufs_ops;
 	else if (cfg->type == PHY_TYPE_DP)
-		ops = &qcom_qmp_phy_dp_ops;
+		ops = &qcom_qmp_phy_combo_dp_ops;
 	else
-		ops = &qcom_qmp_phy_gen_ops;
+		ops = &qcom_qmp_phy_combo_gen_ops;
 
 	generic_phy = devm_phy_create(dev, np, ops);
 	if (IS_ERR(generic_phy)) {
@@ -2596,12 +2596,12 @@ static const struct of_device_id qcom_qmp_combo_phy_of_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_qmp_combo_phy_of_match_table);
 
-static const struct dev_pm_ops qcom_qmp_phy_pm_ops = {
-	SET_RUNTIME_PM_OPS(qcom_qmp_phy_runtime_suspend,
-			   qcom_qmp_phy_runtime_resume, NULL)
+static const struct dev_pm_ops qcom_qmp_phy_combo_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_qmp_phy_combo_runtime_suspend,
+			   qcom_qmp_phy_combo_runtime_resume, NULL)
 };
 
-static int qcom_qmp_phy_probe(struct platform_device *pdev)
+static int qcom_qmp_phy_combo_probe(struct platform_device *pdev)
 {
 	struct qcom_qmp *qmp;
 	struct device *dev = &pdev->dev;
@@ -2658,15 +2658,15 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 
 	mutex_init(&qmp->phy_mutex);
 
-	ret = qcom_qmp_phy_clk_init(dev, cfg);
+	ret = qcom_qmp_phy_combo_clk_init(dev, cfg);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_reset_init(dev, cfg);
+	ret = qcom_qmp_phy_combo_reset_init(dev, cfg);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_vreg_init(dev, cfg);
+	ret = qcom_qmp_phy_combo_vreg_init(dev, cfg);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "failed to get regulator supplies: %d\n",
@@ -2702,7 +2702,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 		}
 
 		/* Create per-lane phy */
-		ret = qcom_qmp_phy_create(dev, child, id, serdes, cfg);
+		ret = qcom_qmp_phy_combo_create(dev, child, id, serdes, cfg);
 		if (ret) {
 			dev_err(dev, "failed to create lane%d phy, %d\n",
 				id, ret);
@@ -2745,16 +2745,16 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static struct platform_driver qcom_qmp_phy_driver = {
-	.probe		= qcom_qmp_phy_probe,
+static struct platform_driver qcom_qmp_phy_combo_driver = {
+	.probe		= qcom_qmp_phy_combo_probe,
 	.driver = {
 		.name	= "qcom-qmp-combo-phy",
-		.pm	= &qcom_qmp_phy_pm_ops,
+		.pm	= &qcom_qmp_phy_combo_pm_ops,
 		.of_match_table = qcom_qmp_combo_phy_of_match_table,
 	},
 };
 
-module_platform_driver(qcom_qmp_phy_driver);
+module_platform_driver(qcom_qmp_phy_combo_driver);
 
 MODULE_AUTHOR("Vivek Gautam <vivek.gautam@codeaurora.org>");
 MODULE_DESCRIPTION("Qualcomm QMP USB+DP combo PHY driver");
-- 
2.35.1

