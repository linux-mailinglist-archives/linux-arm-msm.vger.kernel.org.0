Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37AEB53472B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243262AbiEYX7J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234897AbiEYX7F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:59:05 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 679699E9E0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:03 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id v8so81549lfd.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aTvRjq/cPTfRr4PZocEChGrSpVpZbx4W1mxSxSMJqcw=;
        b=w1ejn2d6gRjDieYl7Aa9MvK+o9Pmc2KEJiChohirEg8dpcshZp38JF8ppWYoAlhLWG
         jk7bCEk965+fHUDuCPneUyqCeZVcHkacb7Pvhift9jRm/8kz/ouu7ARfNfJFrN5Sy/IV
         feAocqulao46apDTjoqAGdaBVE99eHaH/WQ4JDLl3mczgFpqpG8iaBuwQjFjE5ND3OMO
         kN5V/dvYvfE4FbzhPd1GlcojknCisdb76ZqsfYtC7zKQ+zuKhRdS11URPc1URTCH8RZg
         uacrXh9NC1sWti0z/+KOHignN5s2CLrSRzW221jpquf0ZW59vUPyuw0scYn7XU2Shcrz
         DS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aTvRjq/cPTfRr4PZocEChGrSpVpZbx4W1mxSxSMJqcw=;
        b=B1zR2+BEVzfYkqJtcY6iXEpT/wDXOTN1QTTj1CqjdE/6NxUGuqvWIS4ecGEKNzOlJG
         6lLumh8uNwxNMbAKbKwVNHMs5r1XcTOGRps2Qwu1hRSjc7kpdJKfTDFa/WQEW37DXZ/F
         81tP+tFbiV4Tf+OMacK327MCGZE/mL7Gvr5IQcWBsWoJ2vGbXe6pS70RIjkyx8kfXfBf
         UkVR3VxRdZRS3by9fAIQji2SQl4LNI8Vu2ISwc3sythyxJ2VThlcRtWSeGVLSUoG7s7p
         ga1mrWqu0CXP1/unQIy+6V8kQVw2XS/ee0K+iuVhDOmb1keTBfy6Cyd4SDj/cJEh1H2h
         7eRA==
X-Gm-Message-State: AOAM532Uj3/yk5IqZ5hTDZwlSXZtN2G+WXqpEhFpdpQDFwnd7Q1B+voI
        QlJN9XVrSGf1sRU4ujlIQGVyGg==
X-Google-Smtp-Source: ABdhPJyXYj2VG4Hojrf5yQMpbu+PrYzagCjRJIkTxfSt/Ojsti+dEYwZYMThPsXKc1ZF7JaDmhTBjQ==
X-Received: by 2002:a05:6512:3041:b0:471:c570:13c1 with SMTP id b1-20020a056512304100b00471c57013c1mr25814212lfb.460.1653523141683;
        Wed, 25 May 2022 16:59:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:59:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 18/34] phy: qcom-qmp: add QMP USB PHY driver
Date:   Thu, 26 May 2022 02:58:25 +0300
Message-Id: <20220525235841.852301-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525235841.852301-1-dmitry.baryshkov@linaro.org>
References: <20220525235841.852301-1-dmitry.baryshkov@linaro.org>
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

Add a split out QMP USB PHY driver. No hardware support is supported,
it's just a template for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Makefile           |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 449 ++++++++++++++++++++++++
 2 files changed, 450 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb.c

diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 85152016aa5a..08163d5061a4 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PHY_QCOM_QMP)		+= \
 	phy-qcom-qmp-lib.o \
 	phy-qcom-qmp-pcie.o \
 	phy-qcom-qmp-ufs.o \
+	phy-qcom-qmp-usb.o \
 	phy-qcom-qmp.o
 
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
new file mode 100644
index 000000000000..d2d799f8c81f
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -0,0 +1,449 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/phy/phy.h>
+
+#include "phy-qcom-qmp.h"
+#include "phy-qcom-qmp-lib.h"
+
+struct qmp_usb_phy;
+
+/* struct qmp_phy_usb_cfg - per-PHY initialization config */
+struct qmp_phy_usb_cfg {
+	struct qmp_phy_cfg base;
+
+	/* true, if PHY needs delay after POWER_DOWN */
+	bool has_pwrdn_delay;
+	/* power_down delay in usec */
+	int pwrdn_delay_min;
+	int pwrdn_delay_max;
+
+	/* true, if PHY has a separate DP_COM control block */
+	bool has_phy_dp_com_ctrl;
+};
+
+/**
+ * struct qmp_usb_phy - per-lane phy descriptor
+ *
+ * @base: base qmp_phy data
+ * @cfg: phy specific configuration
+ * @pipe_clk: pipe clock
+ * @dp_com: iomapped memory space for phy's dp_com control block
+ */
+struct qmp_usb_phy {
+	struct qmp_phy base;
+	const struct qmp_phy_usb_cfg *cfg;
+	struct clk *pipe_clk;
+	void __iomem *dp_com;
+};
+
+#define to_qmp_usb_phy(qphy)	container_of(qphy, struct qmp_usb_phy, base)
+
+static int qcom_qmp_phy_com_init(struct qmp_usb_phy *qphy_usb)
+{
+	struct qcom_qmp *qmp = qphy_usb->base.qmp;
+	const struct qmp_phy_usb_cfg *cfg = qphy_usb->cfg;
+	int ret;
+
+	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
+
+	mutex_lock(&qmp->phy_mutex);
+	if (qmp->init_count++) {
+		mutex_unlock(&qmp->phy_mutex);
+		return 0;
+	}
+
+	ret = qcom_qmp_phy_common_init(&qphy_usb->base, &cfg->base);
+	if (ret)
+		goto err_unlock;
+
+	if (cfg->has_phy_dp_com_ctrl)
+		qcom_qmp_phy_dp_com_init(qphy_usb->dp_com);
+
+	qcom_qmp_phy_pwrup(&qphy_usb->base, &cfg->base);
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&qmp->phy_mutex);
+
+	return ret;
+}
+
+static int qcom_qmp_phy_com_exit(struct qmp_usb_phy *qphy_usb)
+{
+	struct qcom_qmp *qmp = qphy_usb->base.qmp;
+	const struct qmp_phy_usb_cfg *cfg = qphy_usb->cfg;
+
+	mutex_lock(&qmp->phy_mutex);
+	if (--qmp->init_count) {
+		mutex_unlock(&qmp->phy_mutex);
+		return 0;
+	}
+
+	qcom_qmp_phy_common_exit(&qphy_usb->base, &cfg->base);
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
+static int qcom_qmp_phy_usb_power_on(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_usb_phy *qphy_usb = to_qmp_usb_phy(qphy);
+	struct qcom_qmp *qmp = qphy->qmp;
+	const struct qmp_phy_usb_cfg *cfg = qphy_usb->cfg;
+	void __iomem *serdes = qphy_usb->base.serdes;
+	void __iomem *tx = qphy->tx;
+	void __iomem *rx = qphy->rx;
+	void __iomem *pcs = qphy->pcs;
+	int ret;
+
+	qcom_qmp_phy_configure(serdes, cfg->base.regs,
+			cfg->base.serdes_tbl, cfg->base.serdes_tbl_num);
+
+	ret = clk_prepare_enable(qphy_usb->pipe_clk);
+	if (ret) {
+		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
+
+		return ret;
+	}
+
+	/* Tx, Rx, and PCS configurations */
+	qcom_qmp_phy_configure_lane(tx, cfg->base.regs,
+				    cfg->base.tx_tbl, cfg->base.tx_tbl_num, 1);
+
+	/* Configuration for other LANE for USB-DP combo PHY */
+	if (cfg->base.is_dual_lane_phy)
+		qcom_qmp_phy_configure_lane(qphy->tx2, cfg->base.regs,
+					    cfg->base.tx_tbl, cfg->base.tx_tbl_num, 2);
+
+	qcom_qmp_phy_configure_lane(rx, cfg->base.regs,
+				    cfg->base.rx_tbl, cfg->base.rx_tbl_num, 1);
+
+	if (cfg->base.is_dual_lane_phy)
+		qcom_qmp_phy_configure_lane(qphy->rx2, cfg->base.regs,
+					    cfg->base.rx_tbl, cfg->base.rx_tbl_num, 2);
+
+	qcom_qmp_phy_configure(pcs, cfg->base.regs, cfg->base.pcs_tbl, cfg->base.pcs_tbl_num);
+
+	if (cfg->has_pwrdn_delay)
+		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
+
+	ret = qcom_qmp_phy_power_on(qphy, &cfg->base, true);
+	if (ret)
+		goto err_disable_pipe_clk;
+
+	return 0;
+
+err_disable_pipe_clk:
+	clk_disable_unprepare(qphy_usb->pipe_clk);
+
+	return ret;
+}
+
+static int qcom_qmp_phy_usb_power_off(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_usb_phy *qphy_usb = to_qmp_usb_phy(qphy);
+	const struct qmp_phy_usb_cfg *cfg = qphy_usb->cfg;
+
+	clk_disable_unprepare(qphy_usb->pipe_clk);
+
+	qcom_qmp_phy_power_off(qphy, &cfg->base, true);
+
+	return 0;
+}
+
+static int qcom_qmp_phy_usb_enable(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_usb_phy *qphy_usb = to_qmp_usb_phy(qphy);
+	int ret;
+
+	ret = qcom_qmp_phy_com_init(qphy_usb);
+	if (ret)
+		return ret;
+
+	ret = qcom_qmp_phy_usb_power_on(phy);
+	if (ret)
+		qcom_qmp_phy_com_exit(qphy_usb);
+
+	return ret;
+}
+
+static int qcom_qmp_phy_usb_disable(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_usb_phy *qphy_usb = to_qmp_usb_phy(qphy);
+	int ret;
+
+	ret = qcom_qmp_phy_usb_power_off(phy);
+	if (ret)
+		return ret;
+	return qcom_qmp_phy_com_exit(qphy_usb);
+}
+
+static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_usb_phy *qphy_usb)
+{
+	const struct qmp_phy_usb_cfg *cfg = qphy_usb->cfg;
+	void __iomem *pcs = qphy_usb->base.pcs;
+	void __iomem *pcs_misc = qphy_usb->base.pcs_misc;
+	u32 intr_mask;
+
+	if (qphy_usb->base.mode == PHY_MODE_USB_HOST_SS ||
+	    qphy_usb->base.mode == PHY_MODE_USB_DEVICE_SS)
+		intr_mask = ARCVR_DTCT_EN | ALFPS_DTCT_EN;
+	else
+		intr_mask = ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
+
+	/* Clear any pending interrupts status */
+	qphy_setbits(pcs, cfg->base.regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
+	/* Writing 1 followed by 0 clears the interrupt */
+	qphy_clrbits(pcs, cfg->base.regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
+
+	qphy_clrbits(pcs, cfg->base.regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
+		     ARCVR_DTCT_EN | ALFPS_DTCT_EN | ARCVR_DTCT_EVENT_SEL);
+
+	/* Enable required PHY autonomous mode interrupts */
+	qphy_setbits(pcs, cfg->base.regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL], intr_mask);
+
+	/* Enable i/o clamp_n for autonomous mode */
+	if (pcs_misc)
+		qphy_clrbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
+}
+
+static void qcom_qmp_phy_disable_autonomous_mode(struct qmp_usb_phy *qphy_usb)
+{
+	const struct qmp_phy_usb_cfg *cfg = qphy_usb->cfg;
+	void __iomem *pcs = qphy_usb->base.pcs;
+	void __iomem *pcs_misc = qphy_usb->base.pcs_misc;
+
+	/* Disable i/o clamp_n on resume for normal mode */
+	if (pcs_misc)
+		qphy_setbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
+
+	qphy_clrbits(pcs, cfg->base.regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
+		     ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL | ALFPS_DTCT_EN);
+
+	qphy_setbits(pcs, cfg->base.regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
+	/* Writing 1 followed by 0 clears the interrupt */
+	qphy_clrbits(pcs, cfg->base.regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
+}
+
+static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
+{
+	struct qcom_qmp *qmp = dev_get_drvdata(dev);
+	struct qmp_phy *qphy = qmp->phys[0];
+	struct qmp_usb_phy *qphy_usb = to_qmp_usb_phy(qphy);
+	const struct qmp_phy_usb_cfg *cfg = qphy_usb->cfg;
+
+	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qphy->mode);
+
+	/* Supported only for USB3 PHY and luckily USB3 is the first phy */
+	if (cfg->base.type != PHY_TYPE_USB3)
+		return 0;
+
+	if (!qmp->init_count) {
+		dev_vdbg(dev, "PHY not initialized, bailing out\n");
+		return 0;
+	}
+
+	qcom_qmp_phy_enable_autonomous_mode(qphy_usb);
+
+	clk_disable_unprepare(qphy_usb->pipe_clk);
+	clk_bulk_disable_unprepare(cfg->base.num_clks, qmp->clks);
+
+	return 0;
+}
+
+static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
+{
+	struct qcom_qmp *qmp = dev_get_drvdata(dev);
+	struct qmp_phy *qphy = qmp->phys[0];
+	struct qmp_usb_phy *qphy_usb = to_qmp_usb_phy(qphy);
+	const struct qmp_phy_usb_cfg *cfg = qphy_usb->cfg;
+	int ret = 0;
+
+	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qphy->mode);
+
+	/* Supported only for USB3 PHY and luckily USB3 is the first phy */
+	if (cfg->base.type != PHY_TYPE_USB3)
+		return 0;
+
+	if (!qmp->init_count) {
+		dev_vdbg(dev, "PHY not initialized, bailing out\n");
+		return 0;
+	}
+
+	ret = clk_bulk_prepare_enable(cfg->base.num_clks, qmp->clks);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(qphy_usb->pipe_clk);
+	if (ret) {
+		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
+		clk_bulk_disable_unprepare(cfg->base.num_clks, qmp->clks);
+		return ret;
+	}
+
+	qcom_qmp_phy_disable_autonomous_mode(qphy_usb);
+
+	return 0;
+}
+
+static const struct phy_ops qcom_qmp_phy_usb_ops = {
+	.init		= qcom_qmp_phy_usb_enable,
+	.exit		= qcom_qmp_phy_usb_disable,
+	.set_mode	= qcom_qmp_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static int qcom_qmp_phy_usb_create(struct device *dev, struct device_node *np, int id,
+			void __iomem *serdes, void __iomem *dp_com, const struct qmp_phy_usb_cfg *cfg)
+{
+	struct qcom_qmp *qmp = dev_get_drvdata(dev);
+	struct qmp_usb_phy *qphy_usb;
+	char prop_name[MAX_PROP_NAME];
+	int ret;
+
+	qphy_usb = devm_kzalloc(dev, sizeof(*qphy_usb), GFP_KERNEL);
+	if (!qphy_usb)
+		return -ENOMEM;
+
+	qphy_usb->cfg = cfg;
+
+	ret = qcom_qmp_phy_init(dev, np, &qphy_usb->base, serdes, &cfg->base);
+	if (ret)
+		return ret;
+
+	qphy_usb->dp_com = dp_com;
+
+	/*
+	 * Get PHY's Pipe clock, if any. USB3 and PCIe are PIPE3
+	 * based phys, so they essentially have pipe clock. So,
+	 * we return error in case phy is USB3 or PIPE type.
+	 * Otherwise, we initialize pipe clock to NULL for
+	 * all phys that don't need this.
+	 */
+	snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
+	qphy_usb->pipe_clk = devm_get_clk_from_child(dev, np, prop_name);
+	if (IS_ERR(qphy_usb->pipe_clk))
+		return dev_err_probe(dev, PTR_ERR(qphy_usb->pipe_clk),
+				"failed to get lane%d pipe_clk\n",
+				id);
+
+	ret = qcom_qmp_phy_setup(dev, np, id, &qphy_usb->base, &qcom_qmp_phy_usb_ops);
+	if (ret)
+		return ret;
+
+	/*
+	 * Register the pipe clock provided by phy.
+	 * See function description to see details of this pipe clock.
+	 */
+	ret = qcom_qmp_phy_pipe_clk_register(qmp, np);
+	if (ret) {
+		dev_err(qmp->dev,
+				"failed to register pipe clock source\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id qcom_qmp_phy_usb_of_match_table[] = {
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_qmp_phy_usb_of_match_table);
+
+static const struct dev_pm_ops qcom_qmp_phy_usb_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_qmp_phy_runtime_suspend,
+			   qcom_qmp_phy_runtime_resume, NULL)
+};
+
+static int qcom_qmp_phy_usb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *child;
+	struct phy_provider *phy_provider;
+	void __iomem *serdes;
+	void __iomem *dp_com = NULL;
+	const struct qmp_phy_usb_cfg *cfg;
+	int id;
+	int ret;
+
+	/* Get the specific init parameters of QMP phy */
+	cfg = of_device_get_match_data(dev);
+	if (!cfg)
+		return -EINVAL;
+
+	/* per PHY serdes; usually located at base address */
+	serdes = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(serdes))
+		return PTR_ERR(serdes);
+
+	ret = qcom_qmp_phy_common_probe(pdev, &cfg->base, cfg->base.nlanes);
+	if (ret)
+		return ret;
+
+	if (cfg->has_phy_dp_com_ctrl) {
+		dp_com = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(dp_com))
+			return PTR_ERR(dp_com);
+	}
+
+	id = 0;
+	for_each_available_child_of_node(dev->of_node, child) {
+		/* Create per-lane phy */
+		ret = qcom_qmp_phy_usb_create(dev, child, id, serdes, dp_com, cfg);
+		if (ret) {
+			dev_err(dev, "failed to create lane%d phy, %d\n",
+				id, ret);
+			goto err_node_put;
+		}
+
+		id++;
+	}
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (!IS_ERR(phy_provider))
+		dev_info(dev, "Registered Qcom-QMP phy\n");
+	else
+		pm_runtime_disable(dev);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+
+err_node_put:
+	pm_runtime_disable(dev);
+	of_node_put(child);
+	return ret;
+}
+
+static struct platform_driver qcom_qmp_phy_usb_driver = {
+	.probe		= qcom_qmp_phy_usb_probe,
+	.driver = {
+		.name	= "qcom-qmp-phy-usb",
+		.pm	= &qcom_qmp_phy_usb_pm_ops,
+		.of_match_table = qcom_qmp_phy_usb_of_match_table,
+	},
+};
+
+module_platform_driver(qcom_qmp_phy_usb_driver);
+
+MODULE_AUTHOR("Vivek Gautam <vivek.gautam@codeaurora.org>");
+MODULE_DESCRIPTION("Qualcomm QMP USB PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.35.1

