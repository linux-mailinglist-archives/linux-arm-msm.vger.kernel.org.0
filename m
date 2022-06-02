Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23A453B41B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbiFBHJi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbiFBHJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:34 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4EFF5B0
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:28 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i10so6457711lfj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pcm+uclOPd0XekQJdGjE94ohPUrOn7hZBKu4G/VtBLQ=;
        b=w3ySgDw0TUafnZSWqGnLwVK6SCk0rLRwI/uuzmkS+e10b/gh3h8sfNh83hkFzaGo6i
         dhovW2704bsi9gjkXv7sGHcJh/zTFJI1jFBjTeBh2z+bSjn500U9vvz0+yDnFluvkgi9
         X334FhY6rnpEONWPhJBn6Zi72HaCF7NU+hMCKRfQdBYE74pkQWGblbKldpIcwknVuJcl
         v2llonBRqXvvpJCdNbQYZPtHg/4sYLWeaFgr7fm55t0T8D3Qecp4f4+6qtziTGX/NYEH
         oi6cgxY9EDDl/jV1o+ynXeOkUPiAYLyHlKI0dMhKxXOBhjcjNpBobVQUzqZ3FFn9QMyu
         Zyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pcm+uclOPd0XekQJdGjE94ohPUrOn7hZBKu4G/VtBLQ=;
        b=sTbaR2QCcEPLKrCapoyq+6DWbITsN8u0VY2ayJjGROdVVM5XYffyP2lhooTFYTJpRR
         uQjEy9aJWA2moGlFYZ7FpxFGL6MIfiK8FkcBUAeI3n2I4ztKgLtOmn3gHBXXJGvNgfbT
         tR85bjQWZEmilNoVEz/U8sUjxfvDqGz6MXQ4B18eDhYluGyXMj050KS99/3EijRLR8Nd
         6LSL+fZQ7ZkfG8DIWk1RgFvqMST2u0u58uTbYCyLhSljZMIOXU+wBq3g0lEjOjxQMwy1
         WEyzmOJ6lIWVRl9/yqk3NoH2DnJqm6KMssdWE7IzNTZEYzNbolhonnX1cHX7E/xRIR1M
         o8rw==
X-Gm-Message-State: AOAM5303GElqbfx7jvwgdfqCDH8FTGc5EsfXcW3cYuaY/s0+GtkvIod6
        fw8PFxKIjKAsI/mX1fVZrbapmg==
X-Google-Smtp-Source: ABdhPJwmDdvKKvgHveEs0r3vSzfku1nPvSEx7pTQ7MenuwqAdQLRfMzHptNlbD/clwtg86lzcn4qKQ==
X-Received: by 2002:a05:6512:158b:b0:478:efaa:dbfc with SMTP id bp11-20020a056512158b00b00478efaadbfcmr2615103lfb.444.1654153766795;
        Thu, 02 Jun 2022 00:09:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 17/30] phy: qcom-qmp-ufs: drop support for non-UFS PHY types
Date:   Thu,  2 Jun 2022 10:08:56 +0300
Message-Id: <20220602070909.1666068-18-dmitry.baryshkov@linaro.org>
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

Drop remaining support for PHY types other than UFS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 612 ++----------------------
 1 file changed, 35 insertions(+), 577 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index a8d48c70532c..0bf1990651b6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -986,7 +986,6 @@ static int qcom_qmp_phy_ufs_serdes_init(struct qmp_phy *qphy)
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *serdes = qphy->serdes;
-	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
 	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
 	int serdes_tbl_num = cfg->serdes_tbl_num;
 	int ret;
@@ -996,35 +995,6 @@ static int qcom_qmp_phy_ufs_serdes_init(struct qmp_phy *qphy)
 		qcom_qmp_phy_ufs_configure(serdes, cfg->regs, cfg->serdes_tbl_sec,
 				       cfg->serdes_tbl_num_sec);
 
-	if (cfg->type == PHY_TYPE_DP) {
-		switch (dp_opts->link_rate) {
-		case 1620:
-			qcom_qmp_phy_ufs_configure(serdes, cfg->regs,
-					       cfg->serdes_tbl_rbr,
-					       cfg->serdes_tbl_rbr_num);
-			break;
-		case 2700:
-			qcom_qmp_phy_ufs_configure(serdes, cfg->regs,
-					       cfg->serdes_tbl_hbr,
-					       cfg->serdes_tbl_hbr_num);
-			break;
-		case 5400:
-			qcom_qmp_phy_ufs_configure(serdes, cfg->regs,
-					       cfg->serdes_tbl_hbr2,
-					       cfg->serdes_tbl_hbr2_num);
-			break;
-		case 8100:
-			qcom_qmp_phy_ufs_configure(serdes, cfg->regs,
-					       cfg->serdes_tbl_hbr3,
-					       cfg->serdes_tbl_hbr3_num);
-			break;
-		default:
-			/* Other link rates aren't supported */
-			return -EINVAL;
-		}
-	}
-
-
 	if (cfg->has_phy_com_ctrl) {
 		void __iomem *status;
 		unsigned int mask, val;
@@ -1048,32 +1018,6 @@ static int qcom_qmp_phy_ufs_serdes_init(struct qmp_phy *qphy)
 	return 0;
 }
 
-static int qcom_qmp_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
-{
-	const struct phy_configure_opts_dp *dp_opts = &opts->dp;
-	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
-
-	memcpy(&qphy->dp_opts, dp_opts, sizeof(*dp_opts));
-	if (qphy->dp_opts.set_voltages) {
-		cfg->configure_dp_tx(qphy);
-		qphy->dp_opts.set_voltages = 0;
-	}
-
-	return 0;
-}
-
-static int qcom_qmp_dp_phy_calibrate(struct phy *phy)
-{
-	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
-
-	if (cfg->calibrate_dp_phy)
-		return cfg->calibrate_dp_phy(qphy);
-
-	return 0;
-}
-
 static int qcom_qmp_phy_ufs_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -1243,9 +1187,6 @@ static int qcom_qmp_phy_ufs_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	if (cfg->type == PHY_TYPE_DP)
-		cfg->dp_aux_init(qphy);
-
 	return 0;
 }
 
@@ -1296,10 +1237,6 @@ static int qcom_qmp_phy_ufs_power_on(struct phy *phy)
 						    cfg->tx_tbl_num_sec, 2);
 	}
 
-	/* Configure special DP tx tunings */
-	if (cfg->type == PHY_TYPE_DP)
-		cfg->configure_dp_tx(qphy);
-
 	qcom_qmp_phy_ufs_configure_lane(rx, cfg->regs,
 				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
 	if (cfg->rx_tbl_sec)
@@ -1315,15 +1252,10 @@ static int qcom_qmp_phy_ufs_power_on(struct phy *phy)
 						    cfg->rx_tbl_num_sec, 2);
 	}
 
-	/* Configure link rate, swing, etc. */
-	if (cfg->type == PHY_TYPE_DP) {
-		cfg->configure_dp_phy(qphy);
-	} else {
-		qcom_qmp_phy_ufs_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
-		if (cfg->pcs_tbl_sec)
-			qcom_qmp_phy_ufs_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
-					       cfg->pcs_tbl_num_sec);
-	}
+	qcom_qmp_phy_ufs_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	if (cfg->pcs_tbl_sec)
+		qcom_qmp_phy_ufs_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
+				       cfg->pcs_tbl_num_sec);
 
 	ret = reset_control_deassert(qmp->ufs_reset);
 	if (ret)
@@ -1335,39 +1267,24 @@ static int qcom_qmp_phy_ufs_power_on(struct phy *phy)
 		qcom_qmp_phy_ufs_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl_sec,
 				       cfg->pcs_misc_tbl_num_sec);
 
-	/*
-	 * Pull out PHY from POWER DOWN state.
-	 * This is active low enable signal to power-down PHY.
-	 */
-	if(cfg->type == PHY_TYPE_PCIE)
-		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
-
 	if (cfg->has_pwrdn_delay)
 		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
 
-	if (cfg->type != PHY_TYPE_DP) {
-		/* Pull PHY out of reset state */
-		if (!cfg->no_pcs_sw_reset)
-			qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
-		/* start SerDes and Phy-Coding-Sublayer */
-		qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
-
-		if (cfg->type == PHY_TYPE_UFS) {
-			status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
-			mask = PCS_READY;
-			ready = PCS_READY;
-		} else {
-			status = pcs + cfg->regs[QPHY_PCS_STATUS];
-			mask = cfg->phy_status;
-			ready = 0;
-		}
+	/* Pull PHY out of reset state */
+	if (!cfg->no_pcs_sw_reset)
+		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	/* start SerDes and Phy-Coding-Sublayer */
+	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
-		ret = readl_poll_timeout(status, val, (val & mask) == ready, 10,
-					 PHY_INIT_COMPLETE_TIMEOUT);
-		if (ret) {
-			dev_err(qmp->dev, "phy initialization timed-out\n");
-			goto err_disable_pipe_clk;
-		}
+	status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
+	mask = PCS_READY;
+	ready = PCS_READY;
+
+	ret = readl_poll_timeout(status, val, (val & mask) == ready, 10,
+				 PHY_INIT_COMPLETE_TIMEOUT);
+	if (ret) {
+		dev_err(qmp->dev, "phy initialization timed-out\n");
+		goto err_disable_pipe_clk;
 	}
 	return 0;
 
@@ -1387,25 +1304,20 @@ static int qcom_qmp_phy_ufs_power_off(struct phy *phy)
 
 	clk_disable_unprepare(qphy->pipe_clk);
 
-	if (cfg->type == PHY_TYPE_DP) {
-		/* Assert DP PHY power down */
-		writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_DP_PHY_PD_CTL);
-	} else {
-		/* PHY reset */
-		if (!cfg->no_pcs_sw_reset)
-			qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	/* PHY reset */
+	if (!cfg->no_pcs_sw_reset)
+		qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
-		/* stop SerDes and Phy-Coding-Sublayer */
-		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
+	/* stop SerDes and Phy-Coding-Sublayer */
+	qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
-		/* Put PHY into POWER DOWN state: active low */
-		if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]) {
-			qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-				     cfg->pwrdn_ctrl);
-		} else {
-			qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL,
-					cfg->pwrdn_ctrl);
-		}
+	/* Put PHY into POWER DOWN state: active low */
+	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]) {
+		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+			     cfg->pwrdn_ctrl);
+	} else {
+		qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL,
+				cfg->pwrdn_ctrl);
 	}
 
 	return 0;
@@ -1459,112 +1371,6 @@ static int qcom_qmp_phy_ufs_set_mode(struct phy *phy,
 	return 0;
 }
 
-static void qcom_qmp_phy_ufs_enable_autonomous_mode(struct qmp_phy *qphy)
-{
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	void __iomem *pcs = qphy->pcs;
-	void __iomem *pcs_misc = qphy->pcs_misc;
-	u32 intr_mask;
-
-	if (qphy->mode == PHY_MODE_USB_HOST_SS ||
-	    qphy->mode == PHY_MODE_USB_DEVICE_SS)
-		intr_mask = ARCVR_DTCT_EN | ALFPS_DTCT_EN;
-	else
-		intr_mask = ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
-
-	/* Clear any pending interrupts status */
-	qphy_setbits(pcs, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
-	/* Writing 1 followed by 0 clears the interrupt */
-	qphy_clrbits(pcs, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
-
-	qphy_clrbits(pcs, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
-		     ARCVR_DTCT_EN | ALFPS_DTCT_EN | ARCVR_DTCT_EVENT_SEL);
-
-	/* Enable required PHY autonomous mode interrupts */
-	qphy_setbits(pcs, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL], intr_mask);
-
-	/* Enable i/o clamp_n for autonomous mode */
-	if (pcs_misc)
-		qphy_clrbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
-}
-
-static void qcom_qmp_phy_ufs_disable_autonomous_mode(struct qmp_phy *qphy)
-{
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	void __iomem *pcs = qphy->pcs;
-	void __iomem *pcs_misc = qphy->pcs_misc;
-
-	/* Disable i/o clamp_n on resume for normal mode */
-	if (pcs_misc)
-		qphy_setbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
-
-	qphy_clrbits(pcs, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
-		     ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL | ALFPS_DTCT_EN);
-
-	qphy_setbits(pcs, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
-	/* Writing 1 followed by 0 clears the interrupt */
-	qphy_clrbits(pcs, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
-}
-
-static int __maybe_unused qcom_qmp_phy_ufs_runtime_suspend(struct device *dev)
-{
-	struct qcom_qmp *qmp = dev_get_drvdata(dev);
-	struct qmp_phy *qphy = qmp->phys[0];
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
-
-	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qphy->mode);
-
-	/* Supported only for USB3 PHY and luckily USB3 is the first phy */
-	if (cfg->type != PHY_TYPE_USB3)
-		return 0;
-
-	if (!qmp->init_count) {
-		dev_vdbg(dev, "PHY not initialized, bailing out\n");
-		return 0;
-	}
-
-	qcom_qmp_phy_ufs_enable_autonomous_mode(qphy);
-
-	clk_disable_unprepare(qphy->pipe_clk);
-	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
-
-	return 0;
-}
-
-static int __maybe_unused qcom_qmp_phy_ufs_runtime_resume(struct device *dev)
-{
-	struct qcom_qmp *qmp = dev_get_drvdata(dev);
-	struct qmp_phy *qphy = qmp->phys[0];
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	int ret = 0;
-
-	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qphy->mode);
-
-	/* Supported only for USB3 PHY and luckily USB3 is the first phy */
-	if (cfg->type != PHY_TYPE_USB3)
-		return 0;
-
-	if (!qmp->init_count) {
-		dev_vdbg(dev, "PHY not initialized, bailing out\n");
-		return 0;
-	}
-
-	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(qphy->pipe_clk);
-	if (ret) {
-		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
-		clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
-		return ret;
-	}
-
-	qcom_qmp_phy_ufs_disable_autonomous_mode(qphy);
-
-	return 0;
-}
-
 static int qcom_qmp_phy_ufs_vreg_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
@@ -1622,277 +1428,7 @@ static int qcom_qmp_phy_ufs_clk_init(struct device *dev, const struct qmp_phy_cf
 	return devm_clk_bulk_get(dev, num, qmp->clks);
 }
 
-static void phy_clk_release_provider(void *res)
-{
-	of_clk_del_provider(res);
-}
-
-/*
- * Register a fixed rate pipe clock.
- *
- * The <s>_pipe_clksrc generated by PHY goes to the GCC that gate
- * controls it. The <s>_pipe_clk coming out of the GCC is requested
- * by the PHY driver for its operations.
- * We register the <s>_pipe_clksrc here. The gcc driver takes care
- * of assigning this <s>_pipe_clksrc as parent to <s>_pipe_clk.
- * Below picture shows this relationship.
- *
- *         +---------------+
- *         |   PHY block   |<<---------------------------------------+
- *         |               |                                         |
- *         |   +-------+   |                   +-----+               |
- *   I/P---^-->|  PLL  |---^--->pipe_clksrc--->| GCC |--->pipe_clk---+
- *    clk  |   +-------+   |                   +-----+
- *         +---------------+
- */
-static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
-{
-	struct clk_fixed_rate *fixed;
-	struct clk_init_data init = { };
-	int ret;
-
-	ret = of_property_read_string(np, "clock-output-names", &init.name);
-	if (ret) {
-		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
-		return ret;
-	}
-
-	fixed = devm_kzalloc(qmp->dev, sizeof(*fixed), GFP_KERNEL);
-	if (!fixed)
-		return -ENOMEM;
-
-	init.ops = &clk_fixed_rate_ops;
-
-	/* controllers using QMP phys use 125MHz pipe clock interface */
-	fixed->fixed_rate = 125000000;
-	fixed->hw.init = &init;
-
-	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
-	if (ret)
-		return ret;
-
-	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
-	if (ret)
-		return ret;
-
-	/*
-	 * Roll a devm action because the clock provider is the child node, but
-	 * the child node is not actually a device.
-	 */
-	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
-}
-
-/*
- * Display Port PLL driver block diagram for branch clocks
- *
- *              +------------------------------+
- *              |         DP_VCO_CLK           |
- *              |                              |
- *              |    +-------------------+     |
- *              |    |   (DP PLL/VCO)    |     |
- *              |    +---------+---------+     |
- *              |              v               |
- *              |   +----------+-----------+   |
- *              |   | hsclk_divsel_clk_src |   |
- *              |   +----------+-----------+   |
- *              +------------------------------+
- *                              |
- *          +---------<---------v------------>----------+
- *          |                                           |
- * +--------v----------------+                          |
- * |    dp_phy_pll_link_clk  |                          |
- * |     link_clk            |                          |
- * +--------+----------------+                          |
- *          |                                           |
- *          |                                           |
- *          v                                           v
- * Input to DISPCC block                                |
- * for link clk, crypto clk                             |
- * and interface clock                                  |
- *                                                      |
- *                                                      |
- *      +--------<------------+-----------------+---<---+
- *      |                     |                 |
- * +----v---------+  +--------v-----+  +--------v------+
- * | vco_divided  |  | vco_divided  |  | vco_divided   |
- * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
- * |              |  |              |  |               |
- * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
- * +-------+------+  +-----+--------+  +--------+------+
- *         |                 |                  |
- *         v---->----------v-------------<------v
- *                         |
- *              +----------+-----------------+
- *              |   dp_phy_pll_vco_div_clk   |
- *              +---------+------------------+
- *                        |
- *                        v
- *              Input to DISPCC block
- *              for DP pixel clock
- *
- */
-static int qcom_qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw,
-						struct clk_rate_request *req)
-{
-	switch (req->rate) {
-	case 1620000000UL / 2:
-	case 2700000000UL / 2:
-	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
-		return 0;
-	default:
-		return -EINVAL;
-	}
-}
-
-static unsigned long
-qcom_qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
-{
-	const struct qmp_phy_dp_clks *dp_clks;
-	const struct qmp_phy *qphy;
-	const struct phy_configure_opts_dp *dp_opts;
-
-	dp_clks = container_of(hw, struct qmp_phy_dp_clks, dp_pixel_hw);
-	qphy = dp_clks->qphy;
-	dp_opts = &qphy->dp_opts;
-
-	switch (dp_opts->link_rate) {
-	case 1620:
-		return 1620000000UL / 2;
-	case 2700:
-		return 2700000000UL / 2;
-	case 5400:
-		return 5400000000UL / 4;
-	case 8100:
-		return 8100000000UL / 6;
-	default:
-		return 0;
-	}
-}
-
-static const struct clk_ops qcom_qmp_dp_pixel_clk_ops = {
-	.determine_rate = qcom_qmp_dp_pixel_clk_determine_rate,
-	.recalc_rate = qcom_qmp_dp_pixel_clk_recalc_rate,
-};
-
-static int qcom_qmp_dp_link_clk_determine_rate(struct clk_hw *hw,
-					       struct clk_rate_request *req)
-{
-	switch (req->rate) {
-	case 162000000:
-	case 270000000:
-	case 540000000:
-	case 810000000:
-		return 0;
-	default:
-		return -EINVAL;
-	}
-}
-
-static unsigned long
-qcom_qmp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
-{
-	const struct qmp_phy_dp_clks *dp_clks;
-	const struct qmp_phy *qphy;
-	const struct phy_configure_opts_dp *dp_opts;
-
-	dp_clks = container_of(hw, struct qmp_phy_dp_clks, dp_link_hw);
-	qphy = dp_clks->qphy;
-	dp_opts = &qphy->dp_opts;
-
-	switch (dp_opts->link_rate) {
-	case 1620:
-	case 2700:
-	case 5400:
-	case 8100:
-		return dp_opts->link_rate * 100000;
-	default:
-		return 0;
-	}
-}
-
-static const struct clk_ops qcom_qmp_dp_link_clk_ops = {
-	.determine_rate = qcom_qmp_dp_link_clk_determine_rate,
-	.recalc_rate = qcom_qmp_dp_link_clk_recalc_rate,
-};
-
-static struct clk_hw *
-qcom_qmp_dp_clks_hw_get(struct of_phandle_args *clkspec, void *data)
-{
-	struct qmp_phy_dp_clks *dp_clks = data;
-	unsigned int idx = clkspec->args[0];
-
-	if (idx >= 2) {
-		pr_err("%s: invalid index %u\n", __func__, idx);
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (idx == 0)
-		return &dp_clks->dp_link_hw;
-
-	return &dp_clks->dp_pixel_hw;
-}
-
-static int phy_dp_clks_register(struct qcom_qmp *qmp, struct qmp_phy *qphy,
-				struct device_node *np)
-{
-	struct clk_init_data init = { };
-	struct qmp_phy_dp_clks *dp_clks;
-	char name[64];
-	int ret;
-
-	dp_clks = devm_kzalloc(qmp->dev, sizeof(*dp_clks), GFP_KERNEL);
-	if (!dp_clks)
-		return -ENOMEM;
-
-	dp_clks->qphy = qphy;
-	qphy->dp_clks = dp_clks;
-
-	snprintf(name, sizeof(name), "%s::link_clk", dev_name(qmp->dev));
-	init.ops = &qcom_qmp_dp_link_clk_ops;
-	init.name = name;
-	dp_clks->dp_link_hw.init = &init;
-	ret = devm_clk_hw_register(qmp->dev, &dp_clks->dp_link_hw);
-	if (ret)
-		return ret;
-
-	snprintf(name, sizeof(name), "%s::vco_div_clk", dev_name(qmp->dev));
-	init.ops = &qcom_qmp_dp_pixel_clk_ops;
-	init.name = name;
-	dp_clks->dp_pixel_hw.init = &init;
-	ret = devm_clk_hw_register(qmp->dev, &dp_clks->dp_pixel_hw);
-	if (ret)
-		return ret;
-
-	ret = of_clk_add_hw_provider(np, qcom_qmp_dp_clks_hw_get, dp_clks);
-	if (ret)
-		return ret;
-
-	/*
-	 * Roll a devm action because the clock provider is the child node, but
-	 * the child node is not actually a device.
-	 */
-	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
-}
-
-static const struct phy_ops qcom_qmp_phy_ufs_gen_ops = {
-	.init		= qcom_qmp_phy_ufs_enable,
-	.exit		= qcom_qmp_phy_ufs_disable,
-	.set_mode	= qcom_qmp_phy_ufs_set_mode,
-	.owner		= THIS_MODULE,
-};
-
-static const struct phy_ops qcom_qmp_phy_ufs_dp_ops = {
-	.init		= qcom_qmp_phy_ufs_init,
-	.configure	= qcom_qmp_dp_phy_configure,
-	.power_on	= qcom_qmp_phy_ufs_power_on,
-	.calibrate	= qcom_qmp_dp_phy_calibrate,
-	.power_off	= qcom_qmp_phy_ufs_power_off,
-	.exit		= qcom_qmp_phy_ufs_exit,
-	.set_mode	= qcom_qmp_phy_ufs_set_mode,
-	.owner		= THIS_MODULE,
-};
-
-static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
+static const struct phy_ops qcom_qmp_ufs_ops = {
 	.power_on	= qcom_qmp_phy_ufs_enable,
 	.power_off	= qcom_qmp_phy_ufs_disable,
 	.set_mode	= qcom_qmp_phy_ufs_set_mode,
@@ -1911,7 +1447,6 @@ int qcom_qmp_phy_ufs_create(struct device *dev, struct device_node *np, int id,
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct phy *generic_phy;
 	struct qmp_phy *qphy;
-	const struct phy_ops *ops;
 	char prop_name[MAX_PROP_NAME];
 	int ret;
 
@@ -1968,28 +1503,6 @@ int qcom_qmp_phy_ufs_create(struct device *dev, struct device_node *np, int id,
 	if (!qphy->pcs_misc)
 		dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
 
-	/*
-	 * Get PHY's Pipe clock, if any. USB3 and PCIe are PIPE3
-	 * based phys, so they essentially have pipe clock. So,
-	 * we return error in case phy is USB3 or PIPE type.
-	 * Otherwise, we initialize pipe clock to NULL for
-	 * all phys that don't need this.
-	 */
-	snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
-	qphy->pipe_clk = devm_get_clk_from_child(dev, np, prop_name);
-	if (IS_ERR(qphy->pipe_clk)) {
-		if (cfg->type == PHY_TYPE_PCIE ||
-		    cfg->type == PHY_TYPE_USB3) {
-			ret = PTR_ERR(qphy->pipe_clk);
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev,
-					"failed to get lane%d pipe_clk, %d\n",
-					id, ret);
-			return ret;
-		}
-		qphy->pipe_clk = NULL;
-	}
-
 	/* Get lane reset, if any */
 	if (cfg->has_lane_rst) {
 		snprintf(prop_name, sizeof(prop_name), "lane%d", id);
@@ -2004,14 +1517,7 @@ int qcom_qmp_phy_ufs_create(struct device *dev, struct device_node *np, int id,
 			return ret;
 	}
 
-	if (cfg->type == PHY_TYPE_UFS || cfg->type == PHY_TYPE_PCIE)
-		ops = &qcom_qmp_pcie_ufs_ops;
-	else if (cfg->type == PHY_TYPE_DP)
-		ops = &qcom_qmp_phy_ufs_dp_ops;
-	else
-		ops = &qcom_qmp_phy_ufs_gen_ops;
-
-	generic_phy = devm_phy_create(dev, np, ops);
+	generic_phy = devm_phy_create(dev, np, &qcom_qmp_ufs_ops);
 	if (IS_ERR(generic_phy)) {
 		ret = PTR_ERR(generic_phy);
 		dev_err(dev, "failed to create qphy %d\n", ret);
@@ -2066,11 +1572,6 @@ static const struct of_device_id qcom_qmp_phy_ufs_of_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_qmp_phy_ufs_of_match_table);
 
-static const struct dev_pm_ops qcom_qmp_phy_ufs_pm_ops = {
-	SET_RUNTIME_PM_OPS(qcom_qmp_phy_ufs_runtime_suspend,
-			   qcom_qmp_phy_ufs_runtime_resume, NULL)
-};
-
 static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 {
 	struct qcom_qmp *qmp;
@@ -2078,12 +1579,7 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 	struct device_node *child;
 	struct phy_provider *phy_provider;
 	void __iomem *serdes;
-	void __iomem *usb_serdes;
-	void __iomem *dp_serdes = NULL;
-	const struct qmp_phy_combo_cfg *combo_cfg = NULL;
 	const struct qmp_phy_cfg *cfg = NULL;
-	const struct qmp_phy_cfg *usb_cfg = NULL;
-	const struct qmp_phy_cfg *dp_cfg = NULL;
 	int num, id, expected_phys;
 	int ret;
 
@@ -2100,28 +1596,18 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	/* per PHY serdes; usually located at base address */
-	usb_serdes = serdes = devm_platform_ioremap_resource(pdev, 0);
+	serdes = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(serdes))
 		return PTR_ERR(serdes);
 
 	/* per PHY dp_com; if PHY has dp_com control block */
-	if (combo_cfg || cfg->has_phy_dp_com_ctrl) {
+	if (cfg->has_phy_dp_com_ctrl) {
 		qmp->dp_com = devm_platform_ioremap_resource(pdev, 1);
 		if (IS_ERR(qmp->dp_com))
 			return PTR_ERR(qmp->dp_com);
 	}
 
-	if (combo_cfg) {
-		/* Only two serdes for combo PHY */
-		dp_serdes = devm_platform_ioremap_resource(pdev, 2);
-		if (IS_ERR(dp_serdes))
-			return PTR_ERR(dp_serdes);
-
-		dp_cfg = combo_cfg->dp_cfg;
-		expected_phys = 2;
-	} else {
-		expected_phys = cfg->nlanes;
-	}
+	expected_phys = cfg->nlanes;
 
 	mutex_init(&qmp->phy_mutex);
 
@@ -2160,14 +1646,6 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 
 	id = 0;
 	for_each_available_child_of_node(dev->of_node, child) {
-		if (of_node_name_eq(child, "dp-phy")) {
-			cfg = dp_cfg;
-			serdes = dp_serdes;
-		} else if (of_node_name_eq(child, "usb3-phy")) {
-			cfg = usb_cfg;
-			serdes = usb_serdes;
-		}
-
 		/* Create per-lane phy */
 		ret = qcom_qmp_phy_ufs_create(dev, child, id, serdes, cfg);
 		if (ret) {
@@ -2176,25 +1654,6 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 			goto err_node_put;
 		}
 
-		/*
-		 * Register the pipe clock provided by phy.
-		 * See function description to see details of this pipe clock.
-		 */
-		if (cfg->type == PHY_TYPE_USB3 || cfg->type == PHY_TYPE_PCIE) {
-			ret = phy_pipe_clk_register(qmp, child);
-			if (ret) {
-				dev_err(qmp->dev,
-					"failed to register pipe clock source\n");
-				goto err_node_put;
-			}
-		} else if (cfg->type == PHY_TYPE_DP) {
-			ret = phy_dp_clks_register(qmp, qmp->phys[id], child);
-			if (ret) {
-				dev_err(qmp->dev,
-					"failed to register DP clock source\n");
-				goto err_node_put;
-			}
-		}
 		id++;
 	}
 
@@ -2216,7 +1675,6 @@ static struct platform_driver qcom_qmp_phy_ufs_driver = {
 	.probe		= qcom_qmp_phy_ufs_probe,
 	.driver = {
 		.name	= "qcom-qmp-ufs-phy",
-		.pm	= &qcom_qmp_phy_ufs_pm_ops,
 		.of_match_table = qcom_qmp_phy_ufs_of_match_table,
 	},
 };
-- 
2.35.1

