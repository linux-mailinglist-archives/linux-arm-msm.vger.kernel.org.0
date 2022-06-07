Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34343542281
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbiFHBik (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 21:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386748AbiFHBhQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 21:37:16 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74D422DB70
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:34 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id w20so8627102lfa.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s3C2xFGjgIYus7mJt7xRbWj7sd3p9Gt1mpuEnUW1O9s=;
        b=vlTpfJEqYg3P74dI9S9oLoqjJFP7flCKgDEt49CK5/Y1mO3bH2Dylts1MPRoM82nfv
         lJW81INiTCW02UT9Z/iVkGJFn6IJuN2RiI43ibUPTvQKuwBAYT8ZOVvt8hg9v/eKtABx
         U2A9aqioiNwgkujwa4CZOg5kXHlp0Cd0gmPebGEB56YIsUn2EmN32RKEAdZryGZVqFFC
         cQB6zU0LyVfQmaa9/Do5aM8ZOAZP3gAqf2W5PEZ4QrMRygcEpkCzI5EgJWB4O6qFAJOl
         Kkh5c9eAnHsrRONl3F3NTuI+LXr6Yblpd7tD1yJg+xc6UuNcDu+0L12S4XTqX1qeTXlS
         cruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s3C2xFGjgIYus7mJt7xRbWj7sd3p9Gt1mpuEnUW1O9s=;
        b=4oMeFhbitj/T8P638nO+13jckyijWRnUCqUEtFX45ZTjGhEWPs+oJBH0P29mNBEh3O
         RBptoZK+WqJ+AWnFWzbNvq9Roa/PY3Zol50YFCHr0nbVFHqzQNAGI0WFJVOxeIUY8et9
         1Eg5cMlAqMuYTQO8zVazbKi0zTvt9dxJq/AOr5Pnq4x9A9PqB1qiOu0LtdNj6vQ66OLu
         Seayv7VCL3bugIyyKmRJo9WMBN8HllYxLMJzBcYKWsK1fH6QD55SFcscY5kh+8aMonyE
         o97HmAY7Y3gxUJEr5kGJxak+D/H7WRQn/BgkMcPB+86QqsldAXPeOmbqrKiv8A7L1vZc
         Wljw==
X-Gm-Message-State: AOAM531tIf8ujAN0BqKYt+H4EboudjdN1T+8Bn3iQo145nXETSl7QFwH
        eQEolzsAUJuUq0UmwVl/tFbe5g==
X-Google-Smtp-Source: ABdhPJwQG+Q4opl6l0aWbmW015fFj44jRYUwVubUmnD93A5fqvT6oia+L6D2Yyj36z2pHpzIGJVvSw==
X-Received: by 2002:a05:6512:3c9f:b0:479:3077:e34a with SMTP id h31-20020a0565123c9f00b004793077e34amr10762042lfv.395.1654637552625;
        Tue, 07 Jun 2022 14:32:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 19/30] phy: qcom-qmp-combo: cleanup the driver
Date:   Wed,  8 Jun 2022 00:31:52 +0300
Message-Id: <20220607213203.2819885-20-dmitry.baryshkov@linaro.org>
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

Remove the conditionals and options that are not used by any of combo
USB+DP PHY devices.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 169 ++--------------------
 1 file changed, 10 insertions(+), 159 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index fa9565844d8c..86dc400a037e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -616,24 +616,12 @@ struct qmp_phy_cfg {
 	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_init_tbl *serdes_tbl;
 	int serdes_tbl_num;
-	const struct qmp_phy_init_tbl *serdes_tbl_sec;
-	int serdes_tbl_num_sec;
 	const struct qmp_phy_init_tbl *tx_tbl;
 	int tx_tbl_num;
-	const struct qmp_phy_init_tbl *tx_tbl_sec;
-	int tx_tbl_num_sec;
 	const struct qmp_phy_init_tbl *rx_tbl;
 	int rx_tbl_num;
-	const struct qmp_phy_init_tbl *rx_tbl_sec;
-	int rx_tbl_num_sec;
 	const struct qmp_phy_init_tbl *pcs_tbl;
 	int pcs_tbl_num;
-	const struct qmp_phy_init_tbl *pcs_tbl_sec;
-	int pcs_tbl_num_sec;
-	const struct qmp_phy_init_tbl *pcs_misc_tbl;
-	int pcs_misc_tbl_num;
-	const struct qmp_phy_init_tbl *pcs_misc_tbl_sec;
-	int pcs_misc_tbl_num_sec;
 
 	/* Init sequence for DP PHY block link rates */
 	const struct qmp_phy_init_tbl *serdes_tbl_rbr;
@@ -666,14 +654,9 @@ struct qmp_phy_cfg {
 
 	unsigned int start_ctrl;
 	unsigned int pwrdn_ctrl;
-	unsigned int mask_com_pcs_ready;
 	/* bit offset of PHYSTATUS in QPHY_PCS_STATUS register */
 	unsigned int phy_status;
 
-	/* true, if PHY has a separate PHY_COM control block */
-	bool has_phy_com_ctrl;
-	/* true, if PHY has a reset for individual lanes */
-	bool has_lane_rst;
 	/* true, if PHY needs delay after POWER_DOWN */
 	bool has_pwrdn_delay;
 	/* power_down delay in usec */
@@ -684,9 +667,6 @@ struct qmp_phy_cfg {
 	bool has_phy_dp_com_ctrl;
 	/* true, if PHY has secondary tx/rx lanes to be configured */
 	bool is_dual_lane_phy;
-
-	/* true, if PCS block has no separate SW_RESET register */
-	bool no_pcs_sw_reset;
 };
 
 struct qmp_phy_combo_cfg {
@@ -1084,18 +1064,13 @@ static void qcom_qmp_phy_combo_configure(void __iomem *base,
 
 static int qcom_qmp_phy_combo_serdes_init(struct qmp_phy *qphy)
 {
-	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *serdes = qphy->serdes;
 	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
 	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
 	int serdes_tbl_num = cfg->serdes_tbl_num;
-	int ret;
 
 	qcom_qmp_phy_combo_configure(serdes, cfg->regs, serdes_tbl, serdes_tbl_num);
-	if (cfg->serdes_tbl_sec)
-		qcom_qmp_phy_combo_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
-				       cfg->serdes_tbl_num_sec);
 
 	if (cfg->type == PHY_TYPE_DP) {
 		switch (dp_opts->link_rate) {
@@ -1125,27 +1100,6 @@ static int qcom_qmp_phy_combo_serdes_init(struct qmp_phy *qphy)
 		}
 	}
 
-
-	if (cfg->has_phy_com_ctrl) {
-		void __iomem *status;
-		unsigned int mask, val;
-
-		qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET], SW_RESET);
-		qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
-			     SERDES_START | PCS_START);
-
-		status = serdes + cfg->regs[QPHY_COM_PCS_READY_STATUS];
-		mask = cfg->mask_com_pcs_ready;
-
-		ret = readl_poll_timeout(status, val, (val & mask), 10,
-					 PHY_INIT_COMPLETE_TIMEOUT);
-		if (ret) {
-			dev_err(qmp->dev,
-				"phy common block init timed-out\n");
-			return ret;
-		}
-	}
-
 	return 0;
 }
 
@@ -1630,7 +1584,6 @@ static int qcom_qmp_phy_combo_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	void __iomem *serdes = qphy->serdes;
 	void __iomem *pcs = qphy->pcs;
 	void __iomem *dp_com = qmp->dp_com;
 	int ret, i;
@@ -1693,18 +1646,13 @@ static int qcom_qmp_phy_combo_com_init(struct qmp_phy *qphy)
 		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
 	}
 
-	if (cfg->has_phy_com_ctrl) {
-		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
-			     SW_PWRDN);
-	} else {
-		if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL])
-			qphy_setbits(pcs,
-					cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-					cfg->pwrdn_ctrl);
-		else
-			qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
-					cfg->pwrdn_ctrl);
-	}
+	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL])
+		qphy_setbits(pcs,
+				cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+				cfg->pwrdn_ctrl);
+	else
+		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
+				cfg->pwrdn_ctrl);
 
 	mutex_unlock(&qmp->phy_mutex);
 
@@ -1725,7 +1673,6 @@ static int qcom_qmp_phy_combo_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	void __iomem *serdes = qphy->serdes;
 	int i = cfg->num_resets;
 
 	mutex_lock(&qmp->phy_mutex);
@@ -1735,14 +1682,6 @@ static int qcom_qmp_phy_combo_com_exit(struct qmp_phy *qphy)
 	}
 
 	reset_control_assert(qmp->ufs_reset);
-	if (cfg->has_phy_com_ctrl) {
-		qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
-			     SERDES_START | PCS_START);
-		qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET],
-			     SW_RESET);
-		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
-			     SW_PWRDN);
-	}
 
 	while (--i >= 0)
 		reset_control_assert(qmp->resets[i]);
@@ -1764,33 +1703,6 @@ static int qcom_qmp_phy_combo_init(struct phy *phy)
 	int ret;
 	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
 
-	if (cfg->no_pcs_sw_reset) {
-		/*
-		 * Get UFS reset, which is delayed until now to avoid a
-		 * circular dependency where UFS needs its PHY, but the PHY
-		 * needs this UFS reset.
-		 */
-		if (!qmp->ufs_reset) {
-			qmp->ufs_reset =
-				devm_reset_control_get_exclusive(qmp->dev,
-								 "ufsphy");
-
-			if (IS_ERR(qmp->ufs_reset)) {
-				ret = PTR_ERR(qmp->ufs_reset);
-				dev_err(qmp->dev,
-					"failed to get UFS reset: %d\n",
-					ret);
-
-				qmp->ufs_reset = NULL;
-				return ret;
-			}
-		}
-
-		ret = reset_control_assert(qmp->ufs_reset);
-		if (ret)
-			return ret;
-	}
-
 	ret = qcom_qmp_phy_combo_com_init(qphy);
 	if (ret)
 		return ret;
@@ -1809,43 +1721,26 @@ static int qcom_qmp_phy_combo_power_on(struct phy *phy)
 	void __iomem *tx = qphy->tx;
 	void __iomem *rx = qphy->rx;
 	void __iomem *pcs = qphy->pcs;
-	void __iomem *pcs_misc = qphy->pcs_misc;
 	void __iomem *status;
 	unsigned int mask, val, ready;
 	int ret;
 
 	qcom_qmp_phy_combo_serdes_init(qphy);
 
-	if (cfg->has_lane_rst) {
-		ret = reset_control_deassert(qphy->lane_rst);
-		if (ret) {
-			dev_err(qmp->dev, "lane%d reset deassert failed\n",
-				qphy->index);
-			return ret;
-		}
-	}
-
 	ret = clk_prepare_enable(qphy->pipe_clk);
 	if (ret) {
 		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
-		goto err_reset_lane;
+		return ret;
 	}
 
 	/* Tx, Rx, and PCS configurations */
 	qcom_qmp_phy_combo_configure_lane(tx, cfg->regs,
 				    cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	if (cfg->tx_tbl_sec)
-		qcom_qmp_phy_combo_configure_lane(tx, cfg->regs, cfg->tx_tbl_sec,
-					    cfg->tx_tbl_num_sec, 1);
 
 	/* Configuration for other LANE for USB-DP combo PHY */
 	if (cfg->is_dual_lane_phy) {
 		qcom_qmp_phy_combo_configure_lane(qphy->tx2, cfg->regs,
 					    cfg->tx_tbl, cfg->tx_tbl_num, 2);
-		if (cfg->tx_tbl_sec)
-			qcom_qmp_phy_combo_configure_lane(qphy->tx2, cfg->regs,
-						    cfg->tx_tbl_sec,
-						    cfg->tx_tbl_num_sec, 2);
 	}
 
 	/* Configure special DP tx tunings */
@@ -1854,17 +1749,10 @@ static int qcom_qmp_phy_combo_power_on(struct phy *phy)
 
 	qcom_qmp_phy_combo_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
-	if (cfg->rx_tbl_sec)
-		qcom_qmp_phy_combo_configure_lane(rx, cfg->regs,
-					    cfg->rx_tbl_sec, cfg->rx_tbl_num_sec, 1);
 
 	if (cfg->is_dual_lane_phy) {
 		qcom_qmp_phy_combo_configure_lane(qphy->rx2, cfg->regs,
 					    cfg->rx_tbl, cfg->rx_tbl_num, 2);
-		if (cfg->rx_tbl_sec)
-			qcom_qmp_phy_combo_configure_lane(qphy->rx2, cfg->regs,
-						    cfg->rx_tbl_sec,
-						    cfg->rx_tbl_num_sec, 2);
 	}
 
 	/* Configure link rate, swing, etc. */
@@ -1872,28 +1760,18 @@ static int qcom_qmp_phy_combo_power_on(struct phy *phy)
 		cfg->configure_dp_phy(qphy);
 	} else {
 		qcom_qmp_phy_combo_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
-		if (cfg->pcs_tbl_sec)
-			qcom_qmp_phy_combo_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
-					       cfg->pcs_tbl_num_sec);
 	}
 
 	ret = reset_control_deassert(qmp->ufs_reset);
 	if (ret)
 		goto err_disable_pipe_clk;
 
-	qcom_qmp_phy_combo_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
-			       cfg->pcs_misc_tbl_num);
-	if (cfg->pcs_misc_tbl_sec)
-		qcom_qmp_phy_combo_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
-				       cfg->pcs_misc_tbl_num_sec);
-
 	if (cfg->has_pwrdn_delay)
 		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
 
 	if (cfg->type != PHY_TYPE_DP) {
 		/* Pull PHY out of reset state */
-		if (!cfg->no_pcs_sw_reset)
-			qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 		/* start SerDes and Phy-Coding-Sublayer */
 		qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
@@ -1912,9 +1790,6 @@ static int qcom_qmp_phy_combo_power_on(struct phy *phy)
 
 err_disable_pipe_clk:
 	clk_disable_unprepare(qphy->pipe_clk);
-err_reset_lane:
-	if (cfg->has_lane_rst)
-		reset_control_assert(qphy->lane_rst);
 
 	return ret;
 }
@@ -1931,8 +1806,7 @@ static int qcom_qmp_phy_combo_power_off(struct phy *phy)
 		writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
 	} else {
 		/* PHY reset */
-		if (!cfg->no_pcs_sw_reset)
-			qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+		qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
 		/* stop SerDes and Phy-Coding-Sublayer */
 		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
@@ -1953,10 +1827,6 @@ static int qcom_qmp_phy_combo_power_off(struct phy *phy)
 static int qcom_qmp_phy_combo_exit(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
-
-	if (cfg->has_lane_rst)
-		reset_control_assert(qphy->lane_rst);
 
 	qcom_qmp_phy_combo_com_exit(qphy);
 
@@ -2431,11 +2301,6 @@ static const struct phy_ops qcom_qmp_phy_combo_dp_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static void qcom_qmp_reset_control_put(void *data)
-{
-	reset_control_put(data);
-}
-
 static
 int qcom_qmp_phy_combo_create(struct device *dev, struct device_node *np, int id,
 			void __iomem *serdes, const struct qmp_phy_cfg *cfg)
@@ -2521,20 +2386,6 @@ int qcom_qmp_phy_combo_create(struct device *dev, struct device_node *np, int id
 		qphy->pipe_clk = NULL;
 	}
 
-	/* Get lane reset, if any */
-	if (cfg->has_lane_rst) {
-		snprintf(prop_name, sizeof(prop_name), "lane%d", id);
-		qphy->lane_rst = of_reset_control_get_exclusive(np, prop_name);
-		if (IS_ERR(qphy->lane_rst)) {
-			dev_err(dev, "failed to get lane%d reset\n", id);
-			return PTR_ERR(qphy->lane_rst);
-		}
-		ret = devm_add_action_or_reset(dev, qcom_qmp_reset_control_put,
-					       qphy->lane_rst);
-		if (ret)
-			return ret;
-	}
-
 	if (cfg->type == PHY_TYPE_DP)
 		ops = &qcom_qmp_phy_combo_dp_ops;
 	else
-- 
2.35.1

