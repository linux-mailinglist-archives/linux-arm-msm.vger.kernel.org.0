Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBE4453471A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344887AbiEYX6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343914AbiEYX6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:58:48 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5919E9C9
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:45 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq30so105588lfb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u+9me9+9/xawpazF72F1vSlpvKNkm8rhCZszda1FhnU=;
        b=hD+50XZ4rFLf4bEvp07ONYoZZ0CP5RwNEkoYJnS+aMBwg+HiWE6i5uEULejYS6rA7e
         TIesziMotd4mOe1xRSr3gx5HzmRoCbyp0/H1kb+SvHyV24kIVIS7DqnKh8OfQ0xng+on
         bKUSt3WpSLIMEfku9lNoLJBMPVSgxQLNd+7CvXwSq0VHVb4IPgRfx95gUd2BW5V07LAN
         uGozaOgJckkmrG4HD5Uk9xy/x53HA2zQWOv6Nwy6aSaPhYOOHmxztus3gkfvE324LGV+
         emEKJbn+iyhNVoEg6O2z4XvkavtlGLz/xYR6VXkPnjb4BhDlpHJJr/l/iw618YWQ9Kov
         U50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+9me9+9/xawpazF72F1vSlpvKNkm8rhCZszda1FhnU=;
        b=x6vr9j8EArzSHt2xbIsaRf870W6LFtIpivrjiJ5LVf9Y7dg0i6CgPcr2YFetHLAPLv
         yzqTme1JRuBwoYn8hQOXjXg8JuKqffBJc5xwU3/8bue1yVSQPvOQG67UDtV0Nn+uO7KL
         2uaPH4JCkibB/YrvOqCo8+aLZlIPF4k+ZYgqrYVcjoQ4jSB3YMYFZkhLw28g2UMZ+tRh
         pg4qRghK83MuZsaz3+PAHaT9euyXM+J5l6npIN43PLir9KgSkU9YQpWf514QBzkZPKoN
         sy05gbMIQZxCEEv8JI+dD3oft9EVK0LVtVsti2i2v5A73og1hzvCNCF8EW25csxxwmXb
         X0Sg==
X-Gm-Message-State: AOAM532XGW8dE8bfcAI2RwX9L0EufJSfj47UaCrkrn0Z1FfNjgAGKJSp
        o3hxttCrRjOaNkSjw3W/EpcQ9inzT2WtpQ==
X-Google-Smtp-Source: ABdhPJz+Q0D6jv6iahhuAGqTzLxMn3NYFCirQ3bZZIyeeL5D5LlqwQPt/vZDAxPcIBOSyAb9ISvoNQ==
X-Received: by 2002:a05:6512:39c1:b0:473:be4f:726d with SMTP id k1-20020a05651239c100b00473be4f726dmr25439336lfu.259.1653523124201;
        Wed, 25 May 2022 16:58:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:58:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 01/34] phy: qcom-qmp: add library source code
Date:   Thu, 26 May 2022 02:58:08 +0300
Message-Id: <20220525235841.852301-2-dmitry.baryshkov@linaro.org>
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

Add a file containing common functions to be used by the split QMP
driver. This is mostly a cut from the original QMP driver with two major
differences:
- use reset_controller_bulk interface
- change phy_status handling to accomodate UFS poweron schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Makefile           |   5 +-
 drivers/phy/qualcomm/phy-qcom-qmp-lib.c | 417 ++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-lib.h | 300 +++++++++++++++++
 3 files changed, 721 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-lib.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-lib.h

diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index e9e3b1a4dbb0..8de9adc943dd 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -5,7 +5,10 @@ obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
-obj-$(CONFIG_PHY_QCOM_QMP)		+= phy-qcom-qmp.o
+obj-$(CONFIG_PHY_QCOM_QMP)		+= \
+	phy-qcom-qmp-lib.o \
+	phy-qcom-qmp.o
+
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-lib.c b/drivers/phy/qualcomm/phy-qcom-qmp-lib.c
new file mode 100644
index 000000000000..9fc78d12146d
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-lib.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+
+#include <dt-bindings/phy/phy.h>
+
+#include "phy-qcom-qmp.h"
+#include "phy-qcom-qmp-lib.h"
+
+int qcom_qmp_phy_common_init(struct qmp_phy *qphy, const struct qmp_phy_cfg *cfg)
+{
+	struct qcom_qmp *qmp = qphy->qmp;
+	int ret;
+
+	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
+
+	/* turn on regulator supplies */
+	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
+	if (ret) {
+		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
+		return ret;
+	}
+
+	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	if (ret) {
+		dev_err(qmp->dev, "reset assert failed\n");
+		goto err_disable_regulators;
+	}
+
+	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
+	if (ret) {
+		dev_err(qmp->dev, "reset deassert failed\n");
+		goto err_disable_regulators;
+	}
+
+	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
+	if (ret)
+		goto err_assert_reset;
+
+	return 0;
+
+err_assert_reset:
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+err_disable_regulators:
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_common_init);
+
+void qcom_qmp_phy_common_exit(struct qmp_phy *qphy, const struct qmp_phy_cfg *cfg)
+{
+	struct qcom_qmp *qmp = qphy->qmp;
+
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+
+	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
+
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_common_exit);
+
+void qcom_qmp_phy_dp_com_init(void __iomem *dp_com)
+{
+	qphy_setbits(dp_com, QPHY_V3_DP_COM_POWER_DOWN_CTRL,
+		     SW_PWRDN);
+	/* override hardware control for reset of qmp phy */
+	qphy_setbits(dp_com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+		     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
+		     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+
+	/* Default type-c orientation, i.e CC1 */
+	qphy_setbits(dp_com, QPHY_V3_DP_COM_TYPEC_CTRL, 0x02);
+
+	qphy_setbits(dp_com, QPHY_V3_DP_COM_PHY_MODE_CTRL,
+		     USB3_MODE | DP_MODE);
+
+	/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
+	qphy_clrbits(dp_com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+		     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
+		     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+
+	qphy_clrbits(dp_com, QPHY_V3_DP_COM_SWI_CTRL, 0x03);
+	qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_dp_com_init);
+
+void qcom_qmp_phy_pwrup(struct qmp_phy *qphy, const struct qmp_phy_cfg *cfg)
+{
+	void __iomem *pcs = qphy->pcs;
+
+	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL])
+		qphy_setbits(pcs,
+				cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+				cfg->pwrdn_ctrl);
+	else
+		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL,
+				cfg->pwrdn_ctrl);
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_pwrup);
+
+int qcom_qmp_phy_power_on(struct qmp_phy *qphy, const struct qmp_phy_cfg *cfg,
+		bool sw_reset)
+{
+	struct qcom_qmp *qmp = qphy->qmp;
+	void __iomem *pcs = qphy->pcs;
+	void __iomem *status;
+	unsigned int val, mask, ready;
+	int ret;
+
+	/* Pull PHY out of reset state */
+	if (sw_reset)
+		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+
+	/* start SerDes and Phy-Coding-Sublayer */
+	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
+
+	if (cfg->type == PHY_TYPE_UFS)
+		status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
+	else
+		status = pcs + cfg->regs[QPHY_PCS_STATUS];
+
+	mask = cfg->phy_status;
+	ready = cfg->phy_status_active_high ? mask : 0;
+
+	ret = readl_poll_timeout(status, val, (val & mask) == ready, 10,
+				 PHY_INIT_COMPLETE_TIMEOUT);
+	if (ret) {
+		dev_err(qmp->dev, "phy initialization timed-out\n");
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_power_on);
+
+void qcom_qmp_phy_power_off(struct qmp_phy *qphy, const struct qmp_phy_cfg *cfg, bool sw_reset)
+{
+	/* PHY reset */
+	if (sw_reset)
+		qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+
+	/* stop SerDes and Phy-Coding-Sublayer */
+	qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
+
+	/* Put PHY into POWER DOWN state: active low */
+	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]) {
+		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+				cfg->pwrdn_ctrl);
+	} else {
+		qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL,
+				cfg->pwrdn_ctrl);
+	}
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_power_off);
+
+int qcom_qmp_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+
+	qphy->mode = mode;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_set_mode);
+
+static void phy_clk_release_provider(void *res)
+{
+	of_clk_del_provider(res);
+}
+
+/*
+ * Register a fixed rate pipe clock.
+ *
+ * The <s>_pipe_clksrc generated by PHY goes to the GCC that gate
+ * controls it. The <s>_pipe_clk coming out of the GCC is requested
+ * by the PHY driver for its operations.
+ * We register the <s>_pipe_clksrc here. The gcc driver takes care
+ * of assigning this <s>_pipe_clksrc as parent to <s>_pipe_clk.
+ * Below picture shows this relationship.
+ *
+ *         +---------------+
+ *         |   PHY block   |<<---------------------------------------+
+ *         |               |                                         |
+ *         |   +-------+   |                   +-----+               |
+ *   I/P---^-->|  PLL  |---^--->pipe_clksrc--->| GCC |--->pipe_clk---+
+ *    clk  |   +-------+   |                   +-----+
+ *         +---------------+
+ */
+int qcom_qmp_phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
+{
+	struct clk_fixed_rate *fixed;
+	struct clk_init_data init = { };
+	int ret;
+
+	ret = of_property_read_string(np, "clock-output-names", &init.name);
+	if (ret) {
+		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
+		return ret;
+	}
+
+	fixed = devm_kzalloc(qmp->dev, sizeof(*fixed), GFP_KERNEL);
+	if (!fixed)
+		return -ENOMEM;
+
+	init.ops = &clk_fixed_rate_ops;
+
+	/* controllers using QMP phys use 125MHz pipe clock interface */
+	fixed->fixed_rate = 125000000;
+	fixed->hw.init = &init;
+
+	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
+	if (ret)
+		return ret;
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
+	if (ret)
+		return ret;
+
+	/*
+	 * Roll a devm action because the clock provider is the child node, but
+	 * the child node is not actually a device.
+	 */
+	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
+}
+
+
+int qcom_qmp_phy_init(struct  device *dev, struct device_node *np,
+			struct qmp_phy *qphy,
+			void __iomem *serdes, const struct qmp_phy_cfg *cfg)
+{
+	qphy->serdes = serdes;
+	/*
+	 * Get memory resources for each phy lane:
+	 * Resources are indexed as: tx -> 0; rx -> 1; pcs -> 2.
+	 * For dual lane PHYs: tx2 -> 3, rx2 -> 4, pcs_misc (optional) -> 5
+	 * For single lane PHYs: pcs_misc (optional) -> 3.
+	 */
+	qphy->tx = devm_of_iomap(dev, np, 0, NULL);
+	if (!qphy->tx)
+		return -ENOMEM;
+
+	qphy->rx = devm_of_iomap(dev, np, 1, NULL);
+	if (!qphy->rx)
+		return -ENOMEM;
+
+	qphy->pcs = devm_of_iomap(dev, np, 2, NULL);
+	if (!qphy->pcs)
+		return -ENOMEM;
+
+	/*
+	 * If this is a dual-lane PHY, then there should be registers for the
+	 * second lane. Some old device trees did not specify this, so fall
+	 * back to old legacy behavior of assuming they can be reached at an
+	 * offset from the first lane.
+	 */
+	if (cfg->is_dual_lane_phy) {
+		qphy->tx2 = devm_of_iomap(dev, np, 3, NULL);
+		qphy->rx2 = devm_of_iomap(dev, np, 4, NULL);
+		if (!qphy->tx2 || !qphy->rx2) {
+			dev_warn(dev,
+				 "Underspecified device tree, falling back to legacy register regions\n");
+
+			/* In the old version, pcs_misc is at index 3. */
+			qphy->pcs_misc = qphy->tx2;
+			qphy->tx2 = qphy->tx + QMP_PHY_LEGACY_LANE_STRIDE;
+			qphy->rx2 = qphy->rx + QMP_PHY_LEGACY_LANE_STRIDE;
+
+		} else {
+			qphy->pcs_misc = devm_of_iomap(dev, np, 5, NULL);
+		}
+
+	} else {
+		qphy->pcs_misc = devm_of_iomap(dev, np, 3, NULL);
+	}
+
+	if (!qphy->pcs_misc)
+		dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_init);
+
+int qcom_qmp_phy_setup(struct device *dev, struct device_node *np, int id,
+			struct qmp_phy *qphy, const struct phy_ops *ops)
+{
+	struct qcom_qmp *qmp = dev_get_drvdata(dev);
+	struct phy *generic_phy;
+	int ret;
+
+	generic_phy = devm_phy_create(dev, np, ops);
+	if (IS_ERR(generic_phy)) {
+		ret = PTR_ERR(generic_phy);
+		dev_err(dev, "failed to create qphy_ufs %d\n", ret);
+		return ret;
+	}
+
+	qphy->phy = generic_phy;
+	qphy->index = id;
+	qphy->qmp = qmp;
+	qmp->phys[id] = qphy;
+	phy_set_drvdata(generic_phy, qphy);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_setup);
+
+static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+{
+	struct qcom_qmp *qmp = dev_get_drvdata(dev);
+	int num = cfg->num_vregs;
+	int i;
+
+	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
+	if (!qmp->vregs)
+		return -ENOMEM;
+
+	for (i = 0; i < num; i++)
+		qmp->vregs[i].supply = cfg->vreg_list[i];
+
+	return devm_regulator_bulk_get(dev, num, qmp->vregs);
+}
+
+static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+{
+	struct qcom_qmp *qmp = dev_get_drvdata(dev);
+	int i;
+	int ret;
+
+	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
+				   sizeof(*qmp->resets), GFP_KERNEL);
+	if (!qmp->resets)
+		return -ENOMEM;
+
+	for (i = 0; i < cfg->num_resets; i++)
+		qmp->resets[i].id = cfg->reset_list[i];
+
+	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get resets\n");
+
+	return 0;
+}
+
+static int qcom_qmp_phy_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
+{
+	struct qcom_qmp *qmp = dev_get_drvdata(dev);
+	int num = cfg->num_clks;
+	int i;
+
+	qmp->clks = devm_kcalloc(dev, num, sizeof(*qmp->clks), GFP_KERNEL);
+	if (!qmp->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < num; i++)
+		qmp->clks[i].id = cfg->clk_list[i];
+
+	return devm_clk_bulk_get(dev, num, qmp->clks);
+}
+
+int qcom_qmp_phy_common_probe(struct platform_device *pdev, const struct qmp_phy_cfg *cfg, int expected_phys)
+{
+	struct qcom_qmp *qmp;
+	struct device *dev = &pdev->dev;
+	int num;
+	int ret;
+
+	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
+	if (!qmp)
+		return -ENOMEM;
+
+	qmp->dev = dev;
+	dev_set_drvdata(dev, qmp);
+
+	mutex_init(&qmp->phy_mutex);
+
+	ret = qcom_qmp_phy_clk_init(dev, cfg);
+	if (ret)
+		return ret;
+
+	ret = qcom_qmp_phy_reset_init(dev, cfg);
+	if (ret)
+		return ret;
+
+	ret = qcom_qmp_phy_vreg_init(dev, cfg);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulator supplies\n");
+
+	num = of_get_available_child_count(dev->of_node);
+	/* do we have a rogue child node ? */
+	if (num > expected_phys)
+		return -EINVAL;
+
+	qmp->phys = devm_kcalloc(dev, num, sizeof(*qmp->phys), GFP_KERNEL);
+	if (!qmp->phys)
+		return -ENOMEM;
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	/*
+	 * Prevent runtime pm from being ON by default. Users can enable
+	 * it using power/control in sysfs.
+	 */
+	pm_runtime_forbid(dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_common_probe);
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-lib.h b/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
new file mode 100644
index 000000000000..f79ece5d80e9
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_LIB_H_
+#define QCOM_PHY_QMP_LIB_H_
+
+#include <linux/io.h>
+#include <linux/phy/phy.h>
+
+/* QPHY_SW_RESET bit */
+#define SW_RESET				BIT(0)
+/* QPHY_POWER_DOWN_CONTROL */
+#define SW_PWRDN				BIT(0)
+#define REFCLK_DRV_DSBL				BIT(1)
+/* QPHY_START_CONTROL bits */
+#define SERDES_START				BIT(0)
+#define PCS_START				BIT(1)
+#define PLL_READY_GATE_EN			BIT(3)
+/* QPHY_PCS_STATUS bit */
+#define PHYSTATUS				BIT(6)
+#define PHYSTATUS_4_20				BIT(7)
+/* QPHY_PCS_READY_STATUS & QPHY_COM_PCS_READY_STATUS bit */
+#define PCS_READY				BIT(0)
+
+/* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
+/* DP PHY soft reset */
+#define SW_DPPHY_RESET				BIT(0)
+/* mux to select DP PHY reset control, 0:HW control, 1: software reset */
+#define SW_DPPHY_RESET_MUX			BIT(1)
+/* USB3 PHY soft reset */
+#define SW_USB3PHY_RESET			BIT(2)
+/* mux to select USB3 PHY reset control, 0:HW control, 1: software reset */
+#define SW_USB3PHY_RESET_MUX			BIT(3)
+
+/* QPHY_V3_DP_COM_PHY_MODE_CTRL register bits */
+#define USB3_MODE				BIT(0) /* enables USB3 mode */
+#define DP_MODE					BIT(1) /* enables DP mode */
+
+/* QPHY_PCS_AUTONOMOUS_MODE_CTRL register bits */
+#define ARCVR_DTCT_EN				BIT(0)
+#define ALFPS_DTCT_EN				BIT(1)
+#define ARCVR_DTCT_EVENT_SEL			BIT(4)
+
+/* QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR register bits */
+#define IRQ_CLEAR				BIT(0)
+
+/* QPHY_PCS_LFPS_RXTERM_IRQ_STATUS register bits */
+#define RCVR_DETECT				BIT(0)
+
+/* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
+#define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
+
+#define PHY_INIT_COMPLETE_TIMEOUT		10000
+#define POWER_DOWN_DELAY_US_MIN			10
+#define POWER_DOWN_DELAY_US_MAX			11
+
+#define MAX_PROP_NAME				32
+
+/* Define the assumed distance between lanes for underspecified device trees. */
+#define QMP_PHY_LEGACY_LANE_STRIDE		0x400
+
+struct qmp_phy_init_tbl {
+	unsigned int offset;
+	unsigned int val;
+	/*
+	 * register part of layout ?
+	 * if yes, then offset gives index in the reg-layout
+	 */
+	bool in_layout;
+	/*
+	 * mask of lanes for which this register is written
+	 * for cases when second lane needs different values
+	 */
+	u8 lane_mask;
+};
+
+#define QMP_PHY_INIT_CFG(o, v)		\
+	{				\
+		.offset = o,		\
+		.val = v,		\
+		.lane_mask = 0xff,	\
+	}
+
+#define QMP_PHY_INIT_CFG_L(o, v)	\
+	{				\
+		.offset = o,		\
+		.val = v,		\
+		.in_layout = true,	\
+		.lane_mask = 0xff,	\
+	}
+
+#define QMP_PHY_INIT_CFG_LANE(o, v, l)	\
+	{				\
+		.offset = o,		\
+		.val = v,		\
+		.lane_mask = l,		\
+	}
+
+/* set of registers with offsets different per-PHY */
+enum qphy_reg_layout {
+	/* Common block control registers */
+	QPHY_COM_SW_RESET,
+	QPHY_COM_POWER_DOWN_CONTROL,
+	QPHY_COM_START_CONTROL,
+	QPHY_COM_PCS_READY_STATUS,
+	/* PCS registers */
+	QPHY_PLL_LOCK_CHK_DLY_TIME,
+	QPHY_FLL_CNTRL1,
+	QPHY_FLL_CNTRL2,
+	QPHY_FLL_CNT_VAL_L,
+	QPHY_FLL_CNT_VAL_H_TOL,
+	QPHY_FLL_MAN_CODE,
+	QPHY_SW_RESET,
+	QPHY_START_CTRL,
+	QPHY_PCS_READY_STATUS,
+	QPHY_PCS_STATUS,
+	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
+	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
+	QPHY_PCS_LFPS_RXTERM_IRQ_STATUS,
+	QPHY_PCS_POWER_DOWN_CONTROL,
+	/* Keep last to ensure regs_layout arrays are properly initialized */
+	QPHY_LAYOUT_SIZE
+};
+
+static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
+{
+	u32 reg;
+
+	reg = readl(base + offset);
+	reg |= val;
+	writel(reg, base + offset);
+
+	/* ensure that above write is through */
+	readl(base + offset);
+}
+
+static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
+{
+	u32 reg;
+
+	reg = readl(base + offset);
+	reg &= ~val;
+	writel(reg, base + offset);
+
+	/* ensure that above write is through */
+	readl(base + offset);
+}
+
+/* struct qmp_phy_cfg - per-PHY initialization config */
+struct qmp_phy_cfg {
+	/* phy-type - PCIE/UFS/USB */
+	unsigned int type;
+	/* number of lanes provided by phy */
+	int nlanes;
+
+	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
+	const struct qmp_phy_init_tbl *serdes_tbl;
+	int serdes_tbl_num;
+	const struct qmp_phy_init_tbl *tx_tbl;
+	int tx_tbl_num;
+	const struct qmp_phy_init_tbl *rx_tbl;
+	int rx_tbl_num;
+	const struct qmp_phy_init_tbl *pcs_tbl;
+	int pcs_tbl_num;
+
+	/* clock ids to be requested */
+	const char * const *clk_list;
+	int num_clks;
+	/* resets to be requested */
+	const char * const *reset_list;
+	int num_resets;
+	/* regulators to be requested */
+	const char * const *vreg_list;
+	int num_vregs;
+
+	/* array of registers with different offsets */
+	const unsigned int *regs;
+
+	unsigned int start_ctrl;
+	unsigned int pwrdn_ctrl;
+	/*
+	 * Bit offset of PHYSTATUS in QPHY_PCS_STATUS register
+	 * for UFS PHYs this is PCS_READY in QPHY_PCS_READY_STATUS
+	 */
+	unsigned int phy_status;
+	bool phy_status_active_high; /* true for UFS PHYs */
+
+	/* true, if PHY has secondary tx/rx lanes to be configured */
+	bool is_dual_lane_phy;
+};
+
+/**
+ * struct qmp_phy - per-lane phy descriptor
+ *
+ * @phy: generic phy
+ * @serdes: iomapped memory space for phy's serdes (i.e. PLL)
+ * @tx: iomapped memory space for lane's tx
+ * @rx: iomapped memory space for lane's rx
+ * @pcs: iomapped memory space for lane's pcs
+ * @tx2: iomapped memory space for second lane's tx (in dual lane PHYs)
+ * @rx2: iomapped memory space for second lane's rx (in dual lane PHYs)
+ * @pcs_misc: iomapped memory space for lane's pcs_misc
+ * @index: lane index
+ * @qmp: QMP phy to which this lane belongs
+ * @mode: current PHY mode
+ */
+struct qmp_phy {
+	struct phy *phy;
+	void __iomem *serdes;
+	void __iomem *tx;
+	void __iomem *rx;
+	void __iomem *pcs;
+	void __iomem *tx2;
+	void __iomem *rx2;
+	void __iomem *pcs_misc;
+	unsigned int index;
+	struct qcom_qmp *qmp;
+	enum phy_mode mode;
+};
+
+/**
+ * struct qcom_qmp - structure holding QMP phy block attributes
+ *
+ * @dev: device
+ *
+ * @clks: array of clocks required by phy
+ * @resets: array of resets required by phy
+ * @vregs: regulator supplies bulk data
+ *
+ * @phys: array of per-lane phy descriptors
+ * @phy_mutex: mutex lock for PHY common block initialization
+ * @init_count: phy common block initialization count
+ */
+struct qcom_qmp {
+	struct device *dev;
+
+	struct clk_bulk_data *clks;
+	struct reset_control_bulk_data *resets;
+	struct regulator_bulk_data *vregs;
+
+	struct qmp_phy **phys;
+
+	struct mutex phy_mutex;
+	int init_count;
+};
+
+static inline void qcom_qmp_phy_configure_lane(void __iomem *base,
+					const unsigned int *regs,
+					const struct qmp_phy_init_tbl tbl[],
+					int num,
+					u8 lane_mask)
+{
+	int i;
+	const struct qmp_phy_init_tbl *t = tbl;
+
+	if (!t)
+		return;
+
+	for (i = 0; i < num; i++, t++) {
+		if (!(t->lane_mask & lane_mask))
+			continue;
+
+		if (t->in_layout)
+			writel(t->val, base + regs[t->offset]);
+		else
+			writel(t->val, base + t->offset);
+	}
+}
+
+static inline void qcom_qmp_phy_configure(void __iomem *base,
+				   const unsigned int *regs,
+				   const struct qmp_phy_init_tbl tbl[],
+				   int num)
+{
+	qcom_qmp_phy_configure_lane(base, regs, tbl, num, 0xff);
+}
+
+int qcom_qmp_phy_common_init(struct qmp_phy *qphy, const struct qmp_phy_cfg *cfg);
+void qcom_qmp_phy_common_exit(struct qmp_phy *qphy, const struct qmp_phy_cfg *cfg);
+
+void qcom_qmp_phy_dp_com_init(void __iomem *dp_com);
+void qcom_qmp_phy_pwrup(struct qmp_phy *qphy, const struct qmp_phy_cfg *cfg);
+int qcom_qmp_phy_power_on(struct qmp_phy *qphy, const struct qmp_phy_cfg *cfg, bool sw_reset);
+void qcom_qmp_phy_power_off(struct qmp_phy *qphy, const struct qmp_phy_cfg *cfg, bool sw_reset);
+
+int qcom_qmp_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode);
+int qcom_qmp_phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np);
+
+int qcom_qmp_phy_init(struct  device *dev, struct device_node *np,
+			struct qmp_phy *qphy,
+			void __iomem *serdes, const struct qmp_phy_cfg *cfg);
+int qcom_qmp_phy_setup(struct device *dev, struct device_node *np, int id,
+			struct qmp_phy *qphy, const struct phy_ops *ops);
+
+struct platform_device;
+int qcom_qmp_phy_common_probe(struct platform_device *pdev, const struct qmp_phy_cfg *cfg, int expected_phys);
+
+#endif
-- 
2.35.1

