Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE3B534724
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241389AbiEYX7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345452AbiEYX67 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:58:59 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0CB9E9CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:57 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u30so10541lfm.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KCcftyvYwuNfZBmfEpRvVczMesZVUggDuSlvUb+G26U=;
        b=VwZZGx/vMeI5Cz1hqFn1SQi+emK3Rk7rNDBqWaVCKAXBB9SdstcJhYhz2EwldkKrn9
         fV9zcIBYEY+0CMXYTnuBJ+fG+SFwd4t82lt3LcEeB0ZGbFjdpht/ak/HEXRHCHVeaOmB
         L4beW5Flgi9NgfcLy/Jc5jbCTIFKftUE9VwUtWz/oRl5bg+ZEGN5/wHIoJvxEBmRBimK
         W+1+/YfJ6RNYs7Ewor3PvNsWF1hAJBFUjJUvc4LvN11vm99OoF+o0YmJnzdKssbjuxlu
         bQy0Z5Qq42PQ7iXM3T9ZQQ4cIvynEX7guBrVF/SsiqR8S2+agyoAujZqS1cxB4+862Nw
         jJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KCcftyvYwuNfZBmfEpRvVczMesZVUggDuSlvUb+G26U=;
        b=sFqjZ3qrsU/uMNZLLclh+tSe+g88iypwpimRMKiE8dQqJnPnoFMSGoIeuOJKkV40WW
         I8J54UVXQqJx57+GmBZyLc9k3NStX8z5dLQg+OddSmij4FxSf+DfWl2+iXabVRBAilEn
         xS0Z3fGOKDfrUXKX0TcnbgSkILQNLNLzksebh3imwavZAR/fwMCH1OUj/auUj7vl73Tv
         X+oInN2xA5WwEnsvVZOkr6RoztEQZzDZinOCRduT0wgO/Gw39ll93dNxvK2ob2pr/aVN
         Nzg70K58LFyMhMNbEzU3wLs4H1M2Ex0Cho/IKMTuSse0OXQ6MihPt4pMCl04wUk9Ax5I
         L/YA==
X-Gm-Message-State: AOAM532eGN9BZvS1zS46rHhVHR8WBUYVcEvjcUJSG720ZDKTsyMuT5ks
        SDdRavq3qzjnxEHDF8GXJsxJ6A==
X-Google-Smtp-Source: ABdhPJzPPYmT2tMUiM9Gf+ekKOqTeaNzUxelVaFcJv+nVfu71QSJj/vBgEdWSsy88Ao1RsM/O1KO/w==
X-Received: by 2002:a05:6512:13a4:b0:477:a28a:2280 with SMTP id p36-20020a05651213a400b00477a28a2280mr25326411lfa.689.1653523136023;
        Wed, 25 May 2022 16:58:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:58:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 12/34] phy: qcom-qmp: add QMP UFS PHY driver
Date:   Thu, 26 May 2022 02:58:19 +0300
Message-Id: <20220525235841.852301-13-dmitry.baryshkov@linaro.org>
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

Add a split out QMP UFS PHY driver. No hardware support is supported,
it's just a template for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Makefile           |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 313 ++++++++++++++++++++++++
 2 files changed, 314 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c

diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 5e805b7a530b..85152016aa5a 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
 obj-$(CONFIG_PHY_QCOM_QMP)		+= \
 	phy-qcom-qmp-lib.o \
 	phy-qcom-qmp-pcie.o \
+	phy-qcom-qmp-ufs.o \
 	phy-qcom-qmp.o
 
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
new file mode 100644
index 000000000000..5136b161a372
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/err.h>
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
+struct qmp_ufs_phy;
+
+/* struct qmp_phy_ufs_cfg - per-PHY initialization config */
+struct qmp_phy_ufs_cfg {
+	struct qmp_phy_cfg base;
+
+	/* true, if PCS block has no separate SW_RESET register */
+	bool no_pcs_sw_reset;
+};
+
+/**
+ * struct qmp_ufs_phy - per-lane phy descriptor
+ *
+ * @base: base qmp_phy data
+ * @cfg: phy specific configuration
+ * @ufs_reset: optional UFS PHY reset handle
+ */
+struct qmp_ufs_phy {
+	struct qmp_phy base;
+	const struct qmp_phy_ufs_cfg *cfg;
+	struct reset_control *ufs_reset;
+};
+
+#define to_qmp_ufs_phy(qphy)	container_of(qphy, struct qmp_ufs_phy, base)
+
+static int qcom_qmp_phy_com_init(struct qmp_ufs_phy *qphy_ufs)
+{
+	struct qcom_qmp *qmp = qphy_ufs->base.qmp;
+	const struct qmp_phy_ufs_cfg *cfg = qphy_ufs->cfg;
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
+	ret = qcom_qmp_phy_common_init(&qphy_ufs->base, &cfg->base);
+	if (ret)
+		goto err_unlock;
+
+	qcom_qmp_phy_pwrup(&qphy_ufs->base, &cfg->base);
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
+static int qcom_qmp_phy_com_exit(struct qmp_ufs_phy *qphy_ufs)
+{
+	struct qcom_qmp *qmp = qphy_ufs->base.qmp;
+	const struct qmp_phy_ufs_cfg *cfg = qphy_ufs->cfg;
+
+	mutex_lock(&qmp->phy_mutex);
+	if (--qmp->init_count) {
+		mutex_unlock(&qmp->phy_mutex);
+		return 0;
+	}
+
+	reset_control_assert(qphy_ufs->ufs_reset);
+
+	qcom_qmp_phy_common_exit(&qphy_ufs->base, &cfg->base);
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
+static int qcom_qmp_phy_ufs_init(struct qmp_ufs_phy *qphy_ufs)
+{
+	struct qcom_qmp *qmp = qphy_ufs->base.qmp;
+	const struct qmp_phy_ufs_cfg *cfg = qphy_ufs->cfg;
+	int ret;
+
+	if (!cfg->no_pcs_sw_reset)
+		return 0;
+
+	/*
+	 * Get UFS reset, which is delayed until now to avoid a
+	 * circular dependency where UFS needs its PHY, but the PHY
+	 * needs this UFS reset.
+	 */
+	if (!qphy_ufs->ufs_reset) {
+		qphy_ufs->ufs_reset =
+			devm_reset_control_get_exclusive(qmp->dev,
+							 "ufsphy");
+
+		if (IS_ERR(qphy_ufs->ufs_reset)) {
+			ret = PTR_ERR(qphy_ufs->ufs_reset);
+			dev_err(qmp->dev,
+				"failed to get UFS reset: %d\n",
+				ret);
+
+			qphy_ufs->ufs_reset = NULL;
+			return ret;
+		}
+	}
+
+	ret = reset_control_assert(qphy_ufs->ufs_reset);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int qcom_qmp_phy_ufs_power_on(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_ufs_phy *qphy_ufs = to_qmp_ufs_phy(qphy);
+	const struct qmp_phy_ufs_cfg *cfg = qphy_ufs->cfg;
+	void __iomem *serdes = qphy_ufs->base.serdes;
+	void __iomem *tx = qphy_ufs->base.tx;
+	void __iomem *rx = qphy_ufs->base.rx;
+	void __iomem *pcs = qphy_ufs->base.pcs;
+	int ret;
+
+	qcom_qmp_phy_configure(serdes, cfg->base.regs,
+			cfg->base.serdes_tbl, cfg->base.serdes_tbl_num);
+
+	/* Tx, Rx, and PCS configurations */
+	qcom_qmp_phy_configure_lane(tx, cfg->base.regs,
+				    cfg->base.tx_tbl, cfg->base.tx_tbl_num, 1);
+
+	/* Configuration for other LANE for USB-DP combo PHY */
+	if (cfg->base.is_dual_lane_phy)
+		qcom_qmp_phy_configure_lane(qphy_ufs->base.tx2, cfg->base.regs,
+					    cfg->base.tx_tbl, cfg->base.tx_tbl_num, 2);
+
+	qcom_qmp_phy_configure_lane(rx, cfg->base.regs,
+				    cfg->base.rx_tbl, cfg->base.rx_tbl_num, 1);
+
+	if (cfg->base.is_dual_lane_phy)
+		qcom_qmp_phy_configure_lane(qphy_ufs->base.rx2, cfg->base.regs,
+					    cfg->base.rx_tbl, cfg->base.rx_tbl_num, 2);
+
+	qcom_qmp_phy_configure(pcs, cfg->base.regs, cfg->base.pcs_tbl, cfg->base.pcs_tbl_num);
+
+	ret = reset_control_deassert(qphy_ufs->ufs_reset);
+	if (ret)
+		return ret;
+
+	return qcom_qmp_phy_power_on(qphy, &cfg->base, !cfg->no_pcs_sw_reset);
+}
+
+static int qcom_qmp_phy_ufs_power_off(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_ufs_phy *qphy_ufs = to_qmp_ufs_phy(qphy);
+	const struct qmp_phy_ufs_cfg *cfg = qphy_ufs->cfg;
+
+	qcom_qmp_phy_power_off(qphy, &cfg->base, !cfg->no_pcs_sw_reset);
+
+	return 0;
+}
+
+static int qcom_qmp_phy_ufs_enable(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_ufs_phy *qphy_ufs = to_qmp_ufs_phy(qphy);
+	int ret;
+
+	ret = qcom_qmp_phy_ufs_init(qphy_ufs);
+	if (ret)
+		return ret;
+
+	ret = qcom_qmp_phy_com_init(qphy_ufs);
+	if (ret)
+		return ret;
+
+	ret = qcom_qmp_phy_ufs_power_on(phy);
+	if (ret)
+		qcom_qmp_phy_com_exit(qphy_ufs);
+
+	return ret;
+}
+
+static int qcom_qmp_phy_ufs_disable(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qmp_ufs_phy *qphy_ufs = to_qmp_ufs_phy(qphy);
+	int ret;
+
+	ret = qcom_qmp_phy_ufs_power_off(phy);
+	if (ret)
+		return ret;
+	return qcom_qmp_phy_com_exit(qphy_ufs);
+}
+
+static const struct phy_ops qcom_qmp_ufs_ops = {
+	.power_on	= qcom_qmp_phy_ufs_enable,
+	.power_off	= qcom_qmp_phy_ufs_disable,
+	.set_mode	= qcom_qmp_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static
+int qcom_qmp_phy_ufs_create(struct device *dev, struct device_node *np, int id,
+			void __iomem *serdes, const struct qmp_phy_ufs_cfg *cfg)
+{
+	struct qmp_ufs_phy *qphy_ufs;
+	int ret;
+
+	qphy_ufs = devm_kzalloc(dev, sizeof(*qphy_ufs), GFP_KERNEL);
+	if (!qphy_ufs)
+		return -ENOMEM;
+
+	qphy_ufs->cfg = cfg;
+
+	ret = qcom_qmp_phy_init(dev, np, &qphy_ufs->base, serdes, &cfg->base);
+	if (ret)
+		return ret;
+
+	ret = qcom_qmp_phy_setup(dev, np, id, &qphy_ufs->base, &qcom_qmp_ufs_ops);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id qcom_qmp_phy_ufs_of_match_table[] = {
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_qmp_phy_ufs_of_match_table);
+
+static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *child;
+	struct phy_provider *phy_provider;
+	void __iomem *serdes;
+	const struct qmp_phy_ufs_cfg *cfg;
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
+		ret = qcom_qmp_phy_ufs_create(dev, child, id, serdes, cfg);
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
+static struct platform_driver qcom_qmp_phy_ufs_driver = {
+	.probe		= qcom_qmp_phy_ufs_probe,
+	.driver = {
+		.name	= "qcom-qmp-phy-ufs",
+		.of_match_table = qcom_qmp_phy_ufs_of_match_table,
+	},
+};
+
+module_platform_driver(qcom_qmp_phy_ufs_driver);
+
+MODULE_AUTHOR("Vivek Gautam <vivek.gautam@codeaurora.org>");
+MODULE_DESCRIPTION("Qualcomm QMP UFS PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.35.1

