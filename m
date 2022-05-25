Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFB8753471C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344700AbiEYX6v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiEYX6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:58:48 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20FD9E9CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:46 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c19so95861lfv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iugvXNUNVn2Osugnh5ifkXvHViW4qHlpZghq+PUaf8Q=;
        b=RkBEzLXSTe77vCB25uS/vWbwJoY55ZEuhFWkFXgyn55yhWLwlWFx0q93B5P72p+zwv
         Ec94WgA1kTr7ffj9pYSJcjbwxZkOSp1zyhfaLal/j/Fkw3nBjWSkAiwCc6fQdS+XD/lK
         wheKVYpJa/hZpQdJvKctWkLr7FYtaIYIIpTQev7UsNiiyRgCj+niHJTjJK6Xadt9Ca/y
         JcNFIttOlV5rXkikkFYkViqhT5qsDi4/KvztzCNRqm/qUGjntGoMOoyX85dnKxlc+ud+
         Unczv1ZS+Db1oMwyOq5EPr9RqOmOPqCnbNudzZqUdVtnp3aHOvAm2XBMaHv0NmpyjRod
         rAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iugvXNUNVn2Osugnh5ifkXvHViW4qHlpZghq+PUaf8Q=;
        b=UM4X6CWgqXYmSe/LLzjmEa/AlqdwCX/BrqnDUeOU0XK3QzffhicXVd+tZcGZThSpKL
         I/WMNbhANmW+Ve4nSC61+HLH2JgY5sJY4ZP2hjGjbnyPr1cRjXyNyVKjYjXCVOl3Sp0o
         UZ+YLrf8hGafwCjHYilwFbf3e3FB8auQb8Yf2bWZ52R4CosAdGwFkbsR7X7f7lx2Kwd0
         3uy4yTtT9BlWmTM6Md4iw/PQe9VA/2jn4lGoulh/cKuav7ay+xW5BhzsonQPOveLlWMM
         RqRISeAC1JPtUJOMRlikFdexTm8ffWbrDwop6y3hEKjim7XstAaAJzVIMrWVehl7phMG
         T+jQ==
X-Gm-Message-State: AOAM532o2InU+aRrzucqT9avCoIZ4Ac8MQVkqlZWTj0YIpbD9CLQO0YZ
        bCKNC2k2pR0N6jbsX1/fZ4WNrQ==
X-Google-Smtp-Source: ABdhPJyqg1thO3gudXkRbZs+pxF1bi+6vc+PTZXZbFwc4QIIBnqTvtCxyC+ENe9is34nADH6u2ljuA==
X-Received: by 2002:ac2:4c12:0:b0:478:b480:2c39 with SMTP id t18-20020ac24c12000000b00478b4802c39mr767713lfq.572.1653523124895;
        Wed, 25 May 2022 16:58:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:58:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 02/34] phy: qcom-qmp: add QMP PCIe PHY driver
Date:   Thu, 26 May 2022 02:58:09 +0300
Message-Id: <20220525235841.852301-3-dmitry.baryshkov@linaro.org>
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

Add a split out QMP PCIe PHY driver. No hardware support is supported,
it's just a template for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Makefile            |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 460 +++++++++++++++++++++++
 2 files changed, 461 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c

diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 8de9adc943dd..5e805b7a530b 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
 obj-$(CONFIG_PHY_QCOM_QMP)		+= \
 	phy-qcom-qmp-lib.o \
+	phy-qcom-qmp-pcie.o \
 	phy-qcom-qmp.o
 
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
new file mode 100644
index 000000000000..e81b8c69664b
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include <dt-bindings/phy/phy.h>
+
+#include "phy-qcom-qmp.h"
+#include "phy-qcom-qmp-lib.h"
+
+struct qmp_pcie_phy;
+
+/* struct qmp_phy_pcie_cfg - per-PHY initialization config */
+struct qmp_phy_pcie_cfg {
+	struct qmp_phy_cfg base;
+
+	/* true, if PHY needs delay after POWER_DOWN */
+	bool has_pwrdn_delay;
+	/* power_down delay in usec */
+	int pwrdn_delay_min;
+	int pwrdn_delay_max;
+
+	/* true, if PHY has a separate PHY_COM control block */
+	bool has_phy_com_ctrl;
+	unsigned int mask_com_pcs_ready;
+
+	/* true, if PHY has a reset for individual lanes */
+	bool has_lane_rst;
+
+	const struct qmp_phy_init_tbl *serdes_tbl_sec;
+	int serdes_tbl_num_sec;
+	const struct qmp_phy_init_tbl *tx_tbl_sec;
+	int tx_tbl_num_sec;
+	const struct qmp_phy_init_tbl *rx_tbl_sec;
+	int rx_tbl_num_sec;
+	const struct qmp_phy_init_tbl *pcs_tbl_sec;
+	int pcs_tbl_num_sec;
+	const struct qmp_phy_init_tbl *pcs_misc_tbl;
+	int pcs_misc_tbl_num;
+	const struct qmp_phy_init_tbl *pcs_misc_tbl_sec;
+	int pcs_misc_tbl_num_sec;
+};
+
+/**
+ * struct qmp_pcie_phy - per-lane phy descriptor
+ *
+ * @base: base qmp_phy data
+ * @cfg: phy specific configuration
+ * @pipe_clk: pipe clock
+ * @lane_rst: lane's reset controller
+ */
+struct qmp_pcie_phy {
+	struct qmp_phy base;
+	const struct qmp_phy_pcie_cfg *cfg;
+	struct clk *pipe_clk;
+	struct reset_control *lane_rst;
+};
+
+#define to_qmp_pcie_phy(qphy) container_of(qphy, struct qmp_pcie_phy, base)
+
+static int qcom_qmp_phy_com_ctrl_init(struct qmp_pcie_phy *qphy_pcie)
+{
+	struct qcom_qmp *qmp = qphy_pcie->base.qmp;
+	const struct qmp_phy_pcie_cfg *cfg = qphy_pcie->cfg;
+	void __iomem *serdes = qphy_pcie->base.serdes;
+	int ret;
+
+	if (cfg->has_phy_com_ctrl) {
+		void __iomem *status;
+		unsigned int mask, val;
+
+		qphy_clrbits(serdes, cfg->base.regs[QPHY_COM_SW_RESET], SW_RESET);
+		qphy_setbits(serdes, cfg->base.regs[QPHY_COM_START_CONTROL],
+			     SERDES_START | PCS_START);
+
+		status = serdes + cfg->base.regs[QPHY_COM_PCS_READY_STATUS];
+		mask = cfg->mask_com_pcs_ready;
+
+		ret = readl_poll_timeout(status, val, (val & mask), 10,
+					 PHY_INIT_COMPLETE_TIMEOUT);
+		if (ret) {
+			dev_err(qmp->dev,
+				"phy common block init timed-out\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int qcom_qmp_phy_com_init(struct qmp_pcie_phy *qphy_pcie)
+{
+	struct qcom_qmp *qmp = qphy_pcie->base.qmp;
+	const struct qmp_phy_pcie_cfg *cfg = qphy_pcie->cfg;
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
+	ret = qcom_qmp_phy_common_init(&qphy_pcie->base, &cfg->base);
+	if (ret)
+		goto err_unlock;
+
+	if (cfg->has_phy_com_ctrl) {
+		void __iomem *serdes = qphy_pcie->base.serdes;
+
+		qphy_setbits(serdes, cfg->base.regs[QPHY_COM_POWER_DOWN_CONTROL],
+			     SW_PWRDN);
+	} else {
+		qcom_qmp_phy_pwrup(&qphy_pcie->base, &cfg->base);
+	}
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
+static int qcom_qmp_phy_com_exit(struct qmp_pcie_phy *qphy_pcie)
+{
+	struct qcom_qmp *qmp = qphy_pcie->base.qmp;
+	const struct qmp_phy_pcie_cfg *cfg = qphy_pcie->cfg;
+
+	mutex_lock(&qmp->phy_mutex);
+	if (--qmp->init_count) {
+		mutex_unlock(&qmp->phy_mutex);
+		return 0;
+	}
+
+	if (cfg->has_phy_com_ctrl) {
+		void __iomem *serdes = qphy_pcie->base.serdes;
+
+		qphy_setbits(serdes, cfg->base.regs[QPHY_COM_START_CONTROL],
+			     SERDES_START | PCS_START);
+		qphy_clrbits(serdes, cfg->base.regs[QPHY_COM_SW_RESET],
+			     SW_RESET);
+		qphy_setbits(serdes, cfg->base.regs[QPHY_COM_POWER_DOWN_CONTROL],
+			     SW_PWRDN);
+	}
+
+	qcom_qmp_phy_common_exit(&qphy_pcie->base, &cfg->base);
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
+static int qcom_qmp_phy_pcie_power_on(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_pcie_phy *qphy_pcie = to_qmp_pcie_phy(qphy);
+	struct qcom_qmp *qmp = qphy_pcie->base.qmp;
+	const struct qmp_phy_pcie_cfg *cfg = qphy_pcie->cfg;
+	void __iomem *serdes = qphy_pcie->base.serdes;
+	void __iomem *tx = qphy_pcie->base.tx;
+	void __iomem *rx = qphy_pcie->base.rx;
+	void __iomem *pcs = qphy_pcie->base.pcs;
+	void __iomem *pcs_misc = qphy_pcie->base.pcs_misc;
+	int ret;
+
+	qcom_qmp_phy_configure(serdes, cfg->base.regs, cfg->base.serdes_tbl, cfg->base.serdes_tbl_num);
+	qcom_qmp_phy_configure(serdes, cfg->base.regs, cfg->serdes_tbl_sec,
+			       cfg->serdes_tbl_num_sec);
+	qcom_qmp_phy_com_ctrl_init(qphy_pcie);
+
+	if (cfg->has_lane_rst) {
+		ret = reset_control_deassert(qphy_pcie->lane_rst);
+		if (ret) {
+			dev_err(qmp->dev, "lane%d reset deassert failed\n",
+				qphy_pcie->base.index);
+			return ret;
+		}
+	}
+
+	ret = clk_prepare_enable(qphy_pcie->pipe_clk);
+	if (ret) {
+		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
+		goto err_reset_lane;
+	}
+
+	/* Tx, Rx, and PCS configurations */
+	qcom_qmp_phy_configure_lane(tx, cfg->base.regs,
+				    cfg->base.tx_tbl, cfg->base.tx_tbl_num, 1);
+	qcom_qmp_phy_configure_lane(tx, cfg->base.regs, cfg->tx_tbl_sec,
+				    cfg->tx_tbl_num_sec, 1);
+
+	/* Configuration for other LANE for USB-DP combo PHY */
+	if (cfg->base.is_dual_lane_phy) {
+		qcom_qmp_phy_configure_lane(qphy_pcie->base.tx2, cfg->base.regs,
+					    cfg->base.tx_tbl, cfg->base.tx_tbl_num, 2);
+		qcom_qmp_phy_configure_lane(qphy_pcie->base.tx2, cfg->base.regs,
+					    cfg->tx_tbl_sec,
+					    cfg->tx_tbl_num_sec, 2);
+	}
+
+	qcom_qmp_phy_configure_lane(rx, cfg->base.regs,
+				    cfg->base.rx_tbl, cfg->base.rx_tbl_num, 1);
+	qcom_qmp_phy_configure_lane(rx, cfg->base.regs,
+				    cfg->rx_tbl_sec, cfg->rx_tbl_num_sec, 1);
+
+	if (cfg->base.is_dual_lane_phy)
+		qcom_qmp_phy_configure_lane(qphy_pcie->base.rx2, cfg->base.regs,
+					    cfg->base.rx_tbl, cfg->base.rx_tbl_num, 2);
+	if (cfg->base.is_dual_lane_phy)
+		qcom_qmp_phy_configure_lane(qphy_pcie->base.rx2, cfg->base.regs,
+					    cfg->rx_tbl_sec,
+					    cfg->rx_tbl_num_sec, 2);
+
+	qcom_qmp_phy_configure(pcs, cfg->base.regs, cfg->base.pcs_tbl, cfg->base.pcs_tbl_num);
+	qcom_qmp_phy_configure(pcs, cfg->base.regs, cfg->pcs_tbl_sec,
+			       cfg->pcs_tbl_num_sec);
+
+	qcom_qmp_phy_configure(pcs_misc, cfg->base.regs, cfg->pcs_misc_tbl,
+			       cfg->pcs_misc_tbl_num);
+	qcom_qmp_phy_configure(pcs_misc, cfg->base.regs, cfg->pcs_misc_tbl_sec,
+			       cfg->pcs_misc_tbl_num_sec);
+
+	/*
+	 * Pull out PHY from POWER DOWN state.
+	 * This is active low enable signal to power-down PHY.
+	 */
+	qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->base.pwrdn_ctrl);
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
+	clk_disable_unprepare(qphy_pcie->pipe_clk);
+err_reset_lane:
+	if (cfg->has_lane_rst)
+		reset_control_assert(qphy_pcie->lane_rst);
+
+	return ret;
+}
+
+static int qcom_qmp_phy_pcie_power_off(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_pcie_phy *qphy_pcie = to_qmp_pcie_phy(qphy);
+	const struct qmp_phy_pcie_cfg *cfg = qphy_pcie->cfg;
+
+	clk_disable_unprepare(qphy_pcie->pipe_clk);
+
+	qcom_qmp_phy_power_off(qphy, &cfg->base, true);
+
+	return 0;
+}
+
+static int qcom_qmp_phy_pcie_exit(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_pcie_phy *qphy_pcie = to_qmp_pcie_phy(qphy);
+	const struct qmp_phy_pcie_cfg *cfg = qphy_pcie->cfg;
+
+	if (cfg->has_lane_rst)
+		reset_control_assert(qphy_pcie->lane_rst);
+
+	qcom_qmp_phy_com_exit(qphy_pcie);
+
+	return 0;
+}
+
+static int qcom_qmp_phy_pcie_enable(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_pcie_phy *qphy_pcie = to_qmp_pcie_phy(qphy);
+	int ret;
+
+	ret = qcom_qmp_phy_com_init(qphy_pcie);
+	if (ret)
+		return ret;
+
+	ret = qcom_qmp_phy_pcie_power_on(phy);
+	if (ret)
+		qcom_qmp_phy_pcie_exit(phy);
+
+	return ret;
+}
+
+static int qcom_qmp_phy_pcie_disable(struct phy *phy)
+{
+	int ret;
+
+	ret = qcom_qmp_phy_pcie_power_off(phy);
+	if (ret)
+		return ret;
+	return qcom_qmp_phy_pcie_exit(phy);
+}
+
+static const struct phy_ops qcom_qmp_pcie_ops = {
+	.power_on	= qcom_qmp_phy_pcie_enable,
+	.power_off	= qcom_qmp_phy_pcie_disable,
+	.set_mode	= qcom_qmp_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_qmp_reset_control_put(void *data)
+{
+	reset_control_put(data);
+}
+
+static
+int qcom_qmp_phy_pcie_create(struct device *dev, struct device_node *np, int id,
+			void __iomem *serdes, const struct qmp_phy_pcie_cfg *cfg)
+{
+	struct qcom_qmp *qmp = dev_get_drvdata(dev);
+	struct qmp_pcie_phy *qphy_pcie;
+	char prop_name[MAX_PROP_NAME];
+	int ret;
+
+	qphy_pcie = devm_kzalloc(dev, sizeof(*qphy_pcie), GFP_KERNEL);
+	if (!qphy_pcie)
+		return -ENOMEM;
+
+	qphy_pcie->cfg = cfg;
+
+	ret = qcom_qmp_phy_init(dev, np, &qphy_pcie->base, serdes, &cfg->base);
+	if (ret)
+		return ret;
+
+	/*
+	 * Get PHY's Pipe clock, if any. USB3 and PCIe are PIPE3
+	 * based phys, so they essentially have pipe clock. So,
+	 * we return error in case phy is USB3 or PIPE type.
+	 * Otherwise, we initialize pipe clock to NULL for
+	 * all phys that don't need this.
+	 */
+	snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
+	qphy_pcie->pipe_clk = devm_get_clk_from_child(dev, np, prop_name);
+	if (IS_ERR(qphy_pcie->pipe_clk))
+		return dev_err_probe(dev, PTR_ERR(qphy_pcie->pipe_clk),
+				"failed to get lane%d pipe_clk\n",
+				id);
+
+	/* Get lane reset, if any */
+	if (cfg->has_lane_rst) {
+		snprintf(prop_name, sizeof(prop_name), "lane%d", id);
+		qphy_pcie->lane_rst = of_reset_control_get_exclusive(np, prop_name);
+		if (IS_ERR(qphy_pcie->lane_rst)) {
+			dev_err(dev, "failed to get lane%d reset\n", id);
+			return PTR_ERR(qphy_pcie->lane_rst);
+		}
+		ret = devm_add_action_or_reset(dev, qcom_qmp_reset_control_put,
+					       qphy_pcie->lane_rst);
+		if (ret)
+			return ret;
+	}
+
+	ret = qcom_qmp_phy_setup(dev, np, id, &qphy_pcie->base, &qcom_qmp_pcie_ops);
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
+static const struct of_device_id qcom_qmp_phy_pcie_of_match_table[] = {
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_qmp_phy_pcie_of_match_table);
+
+static int qcom_qmp_phy_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *child;
+	struct phy_provider *phy_provider;
+	void __iomem *serdes;
+	const struct qmp_phy_pcie_cfg *cfg;
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
+	id = 0;
+	for_each_available_child_of_node(dev->of_node, child) {
+		/* Create per-lane phy */
+		ret = qcom_qmp_phy_pcie_create(dev, child, id, serdes, cfg);
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
+static struct platform_driver qcom_qmp_phy_pcie_driver = {
+	.probe		= qcom_qmp_phy_pcie_probe,
+	.driver = {
+		.name	= "qcom-qmp-phy-pcie",
+		.of_match_table = qcom_qmp_phy_pcie_of_match_table,
+	},
+};
+
+module_platform_driver(qcom_qmp_phy_pcie_driver);
+
+MODULE_AUTHOR("Vivek Gautam <vivek.gautam@codeaurora.org>");
+MODULE_DESCRIPTION("Qualcomm QMP PCIe PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.35.1

