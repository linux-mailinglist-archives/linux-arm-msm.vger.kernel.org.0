Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9951F4889
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 22:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgFIU73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 16:59:29 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:44468 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728039AbgFIU7H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 16:59:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591736346; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=a7lrkeJ0FEgZcEaSsGPwp9C0pWyU6p9i8Ts1WHvoyrM=; b=GI4SpmR+DhDKBq/0gxqGI4iEOuLVXdB+k4C9Y9KhOqcthwtCbvWVhn/cI+PtjZc9GVh5OdP8
 YUEjkBH2gCrfi/iDbmC2ChUjFNZ4E4VOoNzwVhusSrAHW6pgR8i7QARCUwPx+qvwufXGgPuk
 d+YlGppTKLPtuR9UACJAtLG3CYs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5edff8124c9690533a8a08bc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 20:58:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31A04C43395; Tue,  9 Jun 2020 20:58:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C19BC433CB;
        Tue,  9 Jun 2020 20:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C19BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, bryan.odonoghue@linaro.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH 1/3] usb: typec: Add QCOM PMIC typec detection driver
Date:   Tue,  9 Jun 2020 13:58:49 -0700
Message-Id: <20200609205851.30113-2-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609205851.30113-1-wcheng@codeaurora.org>
References: <20200609205851.30113-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The QCOM SPMI typec driver handles the role and orientation detection, and
notifies client drivers using the USB role switch framework.   It registers
as a typec port, so orientation can be communicated using the typec switch
APIs.  The driver also registers the VBUS output regulator, so client
drivers can enable the VBUS source when acting as a source/host.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/typec/Kconfig           |  11 ++
 drivers/usb/typec/Makefile          |   1 +
 drivers/usb/typec/qcom-pmic-typec.c | 278 ++++++++++++++++++++++++++++++++++++
 3 files changed, 290 insertions(+)
 create mode 100644 drivers/usb/typec/qcom-pmic-typec.c

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 559dd06..8de2520 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -73,6 +73,17 @@ config TYPEC_TPS6598X
 	  If you choose to build this driver as a dynamically linked module, the
 	  module will be called tps6598x.ko.
 
+config TYPEC_QCOM_PMIC
+	tristate "Qualcomm PMIC USB typec driver"
+	depends on ARCH_QCOM
+	help
+	  Driver for supporting role switch over the Qualcomm PMIC.  This will
+	  handle the type C role and orientation detection reported by the QCOM
+	  PMIC if the PMIC has the capability to handle type C detection.
+
+	  It will also enable the VBUS output to connected devices when a
+	  DFP connection is made.
+
 source "drivers/usb/typec/mux/Kconfig"
 
 source "drivers/usb/typec/altmodes/Kconfig"
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 7753a5c3..cceffd9 100644
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
index 0000000..ce6319c
--- /dev/null
+++ b/drivers/usb/typec/qcom-pmic-typec.c
@@ -0,0 +1,278 @@
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
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <linux/usb/role.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/workqueue.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+
+#define DCDC_BASE			0x1100
+#define CMD_OTG				(DCDC_BASE + 0x40)
+#define OTG_EN				BIT(0)
+#define OTG_CFG				(DCDC_BASE + 0x53)
+#define OTG_EN_SRC_CFG			BIT(1)
+
+#define USB_BASE			0x1300
+#define TYPE_C_CFG_REG			(USB_BASE + 0x58)
+#define BC12_START_ON_CC		BIT(7)
+
+#define TYPEC_BASE			0x1500
+#define TYPEC_MISC_STATUS		(TYPEC_BASE + 0xb)
+#define CC_ATTACHED			BIT(0)
+#define CC_ORIENTATION			BIT(1)
+#define SNK_SRC_MODE			BIT(6)
+#define TYPEC_MODE_CFG			(TYPEC_BASE + 0x44)
+#define TYPEC_DISABLE_CMD		BIT(0)
+#define EN_SNK_ONLY			BIT(1)
+#define EN_SRC_ONLY			BIT(2)
+#define EN_TRY_SNK			BIT(4)
+#define TYPEC_VCONN_CONTROL		(TYPEC_BASE + 0x46)
+#define VCONN_EN_SRC			BIT(0)
+#define VCONN_EN_VAL			BIT(1)
+#define TYPEC_EXIT_STATE_CFG		(TYPEC_BASE + 0x50)
+#define SEL_SRC_UPPER_REF		BIT(2)
+#define TYPEC_INTR_EN_CFG_1		(TYPEC_BASE + 0x5e)
+#define TYPEC_INTR_EN_CFG_1_MASK	GENMASK(0, 7)
+
+struct qcom_pmic_typec {
+	struct device		*dev;
+	struct fwnode_handle	*fwnode;
+	struct regmap		*regmap;
+	struct work_struct	bh_work;
+
+	struct typec_capability *cap;
+	struct typec_port	*port;
+	struct usb_role_switch *role_sw;
+
+	struct regulator_desc usb_vbus_rdesc;
+	struct regulator_dev *usb_vbus_reg;
+};
+
+static int qcom_pmic_typec_vbus_enable(struct qcom_pmic_typec *qcom_usb)
+{
+	int rc;
+
+	rc = regmap_update_bits(qcom_usb->regmap, CMD_OTG, OTG_EN, OTG_EN);
+	if (rc)
+		dev_err(qcom_usb->dev, "failed to update OTG_CTL\n");
+
+	return rc;
+}
+
+static int qcom_pmic_typec_vbus_disable(struct qcom_pmic_typec *qcom_usb)
+{
+	int rc;
+
+	rc = regmap_update_bits(qcom_usb->regmap, CMD_OTG, OTG_EN, 0);
+	if (rc)
+		dev_err(qcom_usb->dev, "failed to update OTG_CTL\n");
+
+	return rc;
+}
+
+void qcom_pmic_typec_bh_work(struct work_struct *w)
+{
+	struct qcom_pmic_typec *qcom_usb = container_of(w,
+							struct qcom_pmic_typec,
+							bh_work);
+	enum typec_orientation orientation;
+	enum usb_role role;
+	unsigned int stat;
+
+	regmap_read(qcom_usb->regmap, TYPEC_MISC_STATUS, &stat);
+
+	if (stat & CC_ATTACHED) {
+		orientation = ((stat & CC_ORIENTATION) >> 1) ?
+				TYPEC_ORIENTATION_REVERSE :
+				TYPEC_ORIENTATION_NORMAL;
+		typec_set_orientation(qcom_usb->port, orientation);
+
+		role = (stat & SNK_SRC_MODE) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
+		if (role == USB_ROLE_HOST)
+			qcom_pmic_typec_vbus_enable(qcom_usb);
+		else
+			qcom_pmic_typec_vbus_disable(qcom_usb);
+
+		usb_role_switch_set_role(qcom_usb->role_sw, role);
+	} else {
+		usb_role_switch_set_role(qcom_usb->role_sw, USB_ROLE_NONE);
+		qcom_pmic_typec_vbus_disable(qcom_usb);
+	}
+}
+
+irqreturn_t qcom_pmic_typec_interrupt(int irq, void *_qcom_usb)
+{
+	struct qcom_pmic_typec *qcom_usb = _qcom_usb;
+
+	queue_work(system_power_efficient_wq, &qcom_usb->bh_work);
+
+	return IRQ_HANDLED;
+}
+
+static void qcom_pmic_typec_typec_hw_init(struct qcom_pmic_typec *qcom_usb)
+{
+	u8 mode;
+
+	regmap_update_bits(qcom_usb->regmap, TYPE_C_CFG_REG, BC12_START_ON_CC,
+			   0);
+	regmap_update_bits(qcom_usb->regmap, TYPEC_INTR_EN_CFG_1,
+			   TYPEC_INTR_EN_CFG_1_MASK, 0);
+
+	if (qcom_usb->cap->type != TYPEC_PORT_DRP)
+		mode = (qcom_usb->cap->type == TYPEC_PORT_SNK) ?
+					EN_SNK_ONLY : EN_SRC_ONLY;
+	else
+		mode = EN_TRY_SNK;
+	regmap_update_bits(qcom_usb->regmap, TYPEC_MODE_CFG,
+			   EN_SNK_ONLY | EN_TRY_SNK | EN_SRC_ONLY, mode);
+
+	regmap_update_bits(qcom_usb->regmap, TYPEC_VCONN_CONTROL,
+			   VCONN_EN_SRC | VCONN_EN_VAL, VCONN_EN_SRC);
+	regmap_update_bits(qcom_usb->regmap, TYPEC_VCONN_CONTROL,
+			   VCONN_EN_SRC | VCONN_EN_VAL, VCONN_EN_SRC);
+	regmap_update_bits(qcom_usb->regmap, TYPEC_EXIT_STATE_CFG,
+			   SEL_SRC_UPPER_REF, SEL_SRC_UPPER_REF);
+	regmap_update_bits(qcom_usb->regmap, OTG_CFG, OTG_EN_SRC_CFG,
+			   OTG_EN_SRC_CFG);
+}
+
+static int qcom_pmic_typec_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct qcom_pmic_typec *qcom_usb;
+	struct typec_capability *cap;
+	const char *buf;
+	int ret, irq, role;
+
+	qcom_usb = kzalloc(sizeof(*qcom_usb), GFP_KERNEL);
+	if (!qcom_usb)
+		return -ENOMEM;
+
+	qcom_usb->dev = dev;
+
+	qcom_usb->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!qcom_usb->regmap) {
+		dev_err(dev, "Failed to get regmap\n");
+		return -EINVAL;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "Failed to get CC irq\n");
+		return -EINVAL;
+	}
+
+	ret = devm_request_irq(qcom_usb->dev, irq, qcom_pmic_typec_interrupt,
+			       IRQF_SHARED, "qcom-pmic-typec", qcom_usb);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not request IRQ\n");
+		return ret;
+	}
+
+	qcom_usb->fwnode = device_get_named_child_node(dev, "connector");
+	if (!qcom_usb->fwnode)
+		return -EINVAL;
+
+	cap = kzalloc(sizeof(*cap), GFP_KERNEL);
+	if (!cap) {
+		ret = -ENOMEM;
+		goto err_put_node;
+	}
+
+	ret = fwnode_property_read_string(qcom_usb->fwnode, "power-role", &buf);
+	if (!ret)
+		role = typec_find_port_power_role(buf);
+	else
+		role = TYPEC_PORT_SNK;
+	cap->type = role;
+
+	ret = fwnode_property_read_string(qcom_usb->fwnode, "data-role", &buf);
+	if (!ret)
+		role = typec_find_port_data_role(buf);
+	else
+		role = TYPEC_PORT_UFP;
+	cap->data = role;
+
+	cap->prefer_role = -1;
+	cap->fwnode = qcom_usb->fwnode;
+	qcom_usb->port = typec_register_port(dev, cap);
+	if (IS_ERR(qcom_usb->port)) {
+		dev_err(dev, "Failed to register type c port %d\n",
+			IS_ERR(qcom_usb->port));
+		ret = PTR_ERR(qcom_usb->port);
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
+	INIT_WORK(&qcom_usb->bh_work, qcom_pmic_typec_bh_work);
+	platform_set_drvdata(pdev, qcom_usb);
+	qcom_pmic_typec_typec_hw_init(qcom_usb);
+
+	queue_work(system_power_efficient_wq, &qcom_usb->bh_work);
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
+	cancel_work_sync(&qcom_usb->bh_work);
+	usb_role_switch_set_role(qcom_usb->role_sw, USB_ROLE_NONE);
+	qcom_pmic_typec_vbus_disable(qcom_usb);
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
+	{ },
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
+
+module_platform_driver(qcom_pmic_typec);
+
+MODULE_DESCRIPTION("QCOM PMIC USB type C driver");
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

