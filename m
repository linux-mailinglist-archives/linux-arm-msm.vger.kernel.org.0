Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77EB823B1CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 02:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgHDApt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 20:45:49 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:32769 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727003AbgHDApm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 20:45:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596501941; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wLJ/KcRR2qte4Up4QdhbK6f4d+tK2yRd+q6cxMP5rOc=; b=ae3khqRr6ib2JCbnYnJb1C++20jUhDo4jVGXz9wjUCF05O3L+RfzxjxT388tLh4PWASQS0eO
 1iELWuZtCOx8gWTYbMo5gh7nM1NRRLL/7ly+L9IwdAiwvdealsZoH83l8a5af+y3TCuTyp5T
 9fbMyNst9SeziaAuY3VnQSQkutY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-east-1.postgun.com with SMTP id
 5f28afb4bcdc2fe47186c4db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 00:45:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5D30FC433B1; Tue,  4 Aug 2020 00:45:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC067C433C9;
        Tue,  4 Aug 2020 00:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC067C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     robh+dt@kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, sboyd@kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v7 1/4] usb: typec: Add QCOM PMIC typec detection driver
Date:   Mon,  3 Aug 2020 17:45:20 -0700
Message-Id: <20200804004523.7964-2-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200804004523.7964-1-wcheng@codeaurora.org>
References: <20200804004523.7964-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The QCOM SPMI typec driver handles the role and orientation detection, and
notifies client drivers using the USB role switch framework.   It registers
as a typec port, so orientation can be communicated using the typec switch
APIs.  The driver also attains a handle to the VBUS output regulator, so it
can enable/disable the VBUS source when acting as a host/device.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/Kconfig           |  12 ++
 drivers/usb/typec/Makefile          |   1 +
 drivers/usb/typec/qcom-pmic-typec.c | 271 ++++++++++++++++++++++++++++
 3 files changed, 284 insertions(+)
 create mode 100644 drivers/usb/typec/qcom-pmic-typec.c

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 559dd06117e7..63789cf88fce 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -73,6 +73,18 @@ config TYPEC_TPS6598X
 	  If you choose to build this driver as a dynamically linked module, the
 	  module will be called tps6598x.ko.
 
+config TYPEC_QCOM_PMIC
+	tristate "Qualcomm PMIC USB Type-C driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	help
+	  Driver for supporting role switch over the Qualcomm PMIC.  This will
+	  handle the USB Type-C role and orientation detection reported by the
+	  QCOM PMIC if the PMIC has the capability to handle USB Type-C
+	  detection.
+
+	  It will also enable the VBUS output to connected devices when a
+	  DFP connection is made.
+
 source "drivers/usb/typec/mux/Kconfig"
 
 source "drivers/usb/typec/altmodes/Kconfig"
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 7753a5c3cd46..cceffd987643 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -6,4 +6,5 @@ obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
 obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
 obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
 obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
+obj-$(CONFIG_TYPEC_QCOM_PMIC)	+= qcom-pmic-typec.o
 obj-$(CONFIG_TYPEC)		+= mux/
diff --git a/drivers/usb/typec/qcom-pmic-typec.c b/drivers/usb/typec/qcom-pmic-typec.c
new file mode 100644
index 000000000000..20b2b6502cb3
--- /dev/null
+++ b/drivers/usb/typec/qcom-pmic-typec.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/err.h>
+#include <linux/regmap.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/usb/role.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/regulator/consumer.h>
+
+#define TYPEC_MISC_STATUS		0xb
+#define CC_ATTACHED			BIT(0)
+#define CC_ORIENTATION			BIT(1)
+#define SNK_SRC_MODE			BIT(6)
+#define TYPEC_MODE_CFG			0x44
+#define TYPEC_DISABLE_CMD		BIT(0)
+#define EN_SNK_ONLY			BIT(1)
+#define EN_SRC_ONLY			BIT(2)
+#define TYPEC_VCONN_CONTROL		0x46
+#define VCONN_EN_SRC			BIT(0)
+#define VCONN_EN_VAL			BIT(1)
+#define TYPEC_EXIT_STATE_CFG		0x50
+#define SEL_SRC_UPPER_REF		BIT(2)
+#define TYPEC_INTR_EN_CFG_1		0x5e
+#define TYPEC_INTR_EN_CFG_1_MASK	GENMASK(7, 0)
+
+struct qcom_pmic_typec {
+	struct device		*dev;
+	struct fwnode_handle	*fwnode;
+	struct regmap		*regmap;
+	u32			base;
+
+	struct typec_capability *cap;
+	struct typec_port	*port;
+	struct usb_role_switch *role_sw;
+
+	struct regulator	*vbus_reg;
+	bool			vbus_enabled;
+};
+
+static void qcom_pmic_typec_enable_vbus_regulator(struct qcom_pmic_typec
+							*qcom_usb, bool enable)
+{
+	int ret;
+
+	if (enable == qcom_usb->vbus_enabled)
+		return;
+
+	if (!qcom_usb->vbus_reg) {
+		qcom_usb->vbus_reg = devm_regulator_get(qcom_usb->dev,
+							"usb_vbus");
+		if (IS_ERR(qcom_usb->vbus_reg)) {
+			qcom_usb->vbus_reg = NULL;
+			return;
+		}
+	}
+
+	if (enable) {
+		ret = regulator_enable(qcom_usb->vbus_reg);
+		if (ret)
+			return;
+	} else {
+		ret = regulator_disable(qcom_usb->vbus_reg);
+		if (ret)
+			return;
+	}
+	qcom_usb->vbus_enabled = enable;
+}
+
+static void qcom_pmic_typec_check_connection(struct qcom_pmic_typec *qcom_usb)
+{
+	enum typec_orientation orientation;
+	enum usb_role role;
+	unsigned int stat;
+	bool enable_vbus;
+
+	regmap_read(qcom_usb->regmap, qcom_usb->base + TYPEC_MISC_STATUS,
+		    &stat);
+
+	if (stat & CC_ATTACHED) {
+		orientation = (stat & CC_ORIENTATION) ?
+				TYPEC_ORIENTATION_REVERSE :
+				TYPEC_ORIENTATION_NORMAL;
+		typec_set_orientation(qcom_usb->port, orientation);
+
+		role = (stat & SNK_SRC_MODE) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
+		if (role == USB_ROLE_HOST)
+			enable_vbus = true;
+		else
+			enable_vbus = false;
+	} else {
+		role = USB_ROLE_NONE;
+		enable_vbus = false;
+	}
+
+	qcom_pmic_typec_enable_vbus_regulator(qcom_usb, enable_vbus);
+	usb_role_switch_set_role(qcom_usb->role_sw, role);
+}
+
+static irqreturn_t qcom_pmic_typec_interrupt(int irq, void *_qcom_usb)
+{
+	struct qcom_pmic_typec *qcom_usb = _qcom_usb;
+
+	qcom_pmic_typec_check_connection(qcom_usb);
+	return IRQ_HANDLED;
+}
+
+static void qcom_pmic_typec_typec_hw_init(struct qcom_pmic_typec *qcom_usb)
+{
+	u8 mode = 0;
+
+	regmap_update_bits(qcom_usb->regmap,
+			   qcom_usb->base + TYPEC_INTR_EN_CFG_1,
+			   TYPEC_INTR_EN_CFG_1_MASK, 0);
+
+	if (qcom_usb->cap->type != TYPEC_PORT_DRP)
+		mode = (qcom_usb->cap->type == TYPEC_PORT_SNK) ?
+					EN_SNK_ONLY : EN_SRC_ONLY;
+	regmap_update_bits(qcom_usb->regmap, qcom_usb->base + TYPEC_MODE_CFG,
+			   EN_SNK_ONLY | EN_SRC_ONLY, mode);
+
+	regmap_update_bits(qcom_usb->regmap,
+			   qcom_usb->base + TYPEC_VCONN_CONTROL,
+			   VCONN_EN_SRC | VCONN_EN_VAL, VCONN_EN_SRC);
+	regmap_update_bits(qcom_usb->regmap,
+			   qcom_usb->base + TYPEC_EXIT_STATE_CFG,
+			   SEL_SRC_UPPER_REF, SEL_SRC_UPPER_REF);
+}
+
+static int qcom_pmic_typec_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct qcom_pmic_typec *qcom_usb;
+	struct typec_capability *cap;
+	const char *buf;
+	int ret, irq, role;
+	u32 reg;
+
+	ret = device_property_read_u32(dev, "reg", &reg);
+	if (ret < 0) {
+		dev_err(dev, "missing base address\n");
+		return ret;
+	}
+
+	qcom_usb = devm_kzalloc(dev, sizeof(*qcom_usb), GFP_KERNEL);
+	if (!qcom_usb)
+		return -ENOMEM;
+
+	qcom_usb->dev = dev;
+	qcom_usb->base = reg;
+
+	qcom_usb->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!qcom_usb->regmap) {
+		dev_err(dev, "Failed to get regmap\n");
+		return -EINVAL;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return -EINVAL;
+
+	ret = devm_request_threaded_irq(qcom_usb->dev, irq, NULL,
+					qcom_pmic_typec_interrupt, IRQF_ONESHOT,
+					"qcom-pmic-typec", qcom_usb);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not request IRQ\n");
+		return ret;
+	}
+
+	qcom_usb->fwnode = device_get_named_child_node(dev, "connector");
+	if (!qcom_usb->fwnode)
+		return -EINVAL;
+
+	cap = devm_kzalloc(dev, sizeof(*cap), GFP_KERNEL);
+	if (!cap) {
+		ret = -ENOMEM;
+		goto err_put_node;
+	}
+
+	ret = fwnode_property_read_string(qcom_usb->fwnode, "power-role", &buf);
+	if (!ret) {
+		role = typec_find_port_power_role(buf);
+		if (role < 0)
+			role = TYPEC_PORT_SNK;
+	} else {
+		role = TYPEC_PORT_SNK;
+	}
+	cap->type = role;
+
+	ret = fwnode_property_read_string(qcom_usb->fwnode, "data-role", &buf);
+	if (!ret) {
+		role = typec_find_port_data_role(buf);
+		if (role < 0)
+			role = TYPEC_PORT_UFP;
+	} else {
+		role = TYPEC_PORT_UFP;
+	}
+	cap->data = role;
+
+	cap->prefer_role = TYPEC_NO_PREFERRED_ROLE;
+	cap->fwnode = qcom_usb->fwnode;
+	qcom_usb->port = typec_register_port(dev, cap);
+	if (IS_ERR(qcom_usb->port)) {
+		ret = PTR_ERR(qcom_usb->port);
+		dev_err(dev, "Failed to register type c port %d\n", ret);
+		goto err_put_node;
+	}
+
+	qcom_usb->cap = cap;
+
+	qcom_usb->role_sw = fwnode_usb_role_switch_get(qcom_usb->fwnode);
+	if (IS_ERR(qcom_usb->role_sw)) {
+		if (PTR_ERR(qcom_usb->role_sw) != -EPROBE_DEFER)
+			dev_err(dev, "failed to get role switch\n");
+		ret = PTR_ERR(qcom_usb->role_sw);
+		goto err_typec_port;
+	}
+
+	platform_set_drvdata(pdev, qcom_usb);
+	qcom_pmic_typec_typec_hw_init(qcom_usb);
+	qcom_pmic_typec_check_connection(qcom_usb);
+
+	return 0;
+
+err_typec_port:
+	typec_unregister_port(qcom_usb->port);
+err_put_node:
+	fwnode_handle_put(qcom_usb->fwnode);
+
+	return ret;
+}
+
+static int qcom_pmic_typec_remove(struct platform_device *pdev)
+{
+	struct qcom_pmic_typec *qcom_usb = platform_get_drvdata(pdev);
+
+	usb_role_switch_set_role(qcom_usb->role_sw, USB_ROLE_NONE);
+	qcom_pmic_typec_enable_vbus_regulator(qcom_usb, 0);
+
+	typec_unregister_port(qcom_usb->port);
+	usb_role_switch_put(qcom_usb->role_sw);
+	fwnode_handle_put(qcom_usb->fwnode);
+
+	return 0;
+}
+
+static const struct of_device_id qcom_pmic_typec_table[] = {
+	{ .compatible = "qcom,pm8150b-usb-typec" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_pmic_typec_table);
+
+static struct platform_driver qcom_pmic_typec = {
+	.driver = {
+		.name = "qcom,pmic-typec",
+		.of_match_table = qcom_pmic_typec_table,
+	},
+	.probe = qcom_pmic_typec_probe,
+	.remove = qcom_pmic_typec_remove,
+};
+module_platform_driver(qcom_pmic_typec);
+
+MODULE_DESCRIPTION("QCOM PMIC USB type C driver");
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

