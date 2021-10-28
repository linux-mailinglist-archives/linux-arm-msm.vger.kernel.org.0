Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D28F43E694
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 18:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhJ1QuU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 12:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbhJ1QuT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 12:50:19 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38398C061767
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 09:47:52 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id e4so11292706wrc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BwG2zpvRLxZG95/rzhKYnuVE683XHHQUQzqxPy149DI=;
        b=HngsoIYFqrkPwKO8/LLLwjY18OFXqt3MY1seDNt2S02NOJlm31qpWHTCSvEXGLI+C1
         658MYr1P5FmGR5mdrmJD4lrTTNahRm/wyPWKC99RoKX+UddVdFnvYFvAFdtCzbm0yFX8
         94FlueUpBZJvnW/AyKdavLgHjCWIBlFHC5td/3LCnj9CeBLUu2WPCnGd4rVOAZilgdlR
         6i8AUibzlsw7Ta2jF2TZYlcqtjeWsH+ncd2I6xnWO9dwZ+5UDL4xe1GpYx09M33gLLE1
         wYSxQ+Z7Y4VENmLs60m1+4EZ5pS7YnEstrCSJv3Ea0RdN1tUvH2S3Qgb8m5lVIoQC6+t
         QK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BwG2zpvRLxZG95/rzhKYnuVE683XHHQUQzqxPy149DI=;
        b=SPqXwKP6r1bnC4dzzeqdTkMvZD6CypLKn7aMU+QgRv4pW8xoDlFIjH12JHPhZNiG3u
         wq3o4qDLhhfq+Sn4PnBginvO6bntv//5iqgPMsmEp8x6DtMJIV0gNM3DYWocplsgqQFk
         GXcadwKPZ/wrB2im65KvbZZeXD0dp3t8FgjrHLR/o7WTXhh2l+9Nr2mzJF8BijCFq3GR
         gEDZRWsFHrf4sonUogq5WOEP8p0mddiuyQWtYll66/u2jHCe5v9OL5hnibGvN9nrnDWK
         15k3ahFCY12pJnr1GEAda3WYXddqjZ+AriL9dIUrT9lExN4bCJ4Q41226F77meBLBi3w
         XMWQ==
X-Gm-Message-State: AOAM530M+vUPlrWWQ2+13/ql85FJGmgqlVs7j4On1sdFEemXUG6UIetn
        bmB/1dZ6YIWwTGkn86N+kQDR3A==
X-Google-Smtp-Source: ABdhPJwhCPetZaBEyO7FxWg5/wDkUWWfAOHziVrFY/Czahh/fulpuTGruBVOpJoH9+QnbREechLMUA==
X-Received: by 2002:a5d:5258:: with SMTP id k24mr6891630wrc.239.1635439670477;
        Thu, 28 Oct 2021 09:47:50 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y8sm3601724wrq.77.2021.10.28.09.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 09:47:49 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 7/7] usb: typec: qcom: Add a pm8150b TCPM driver
Date:   Thu, 28 Oct 2021 17:49:41 +0100
Message-Id: <20211028164941.831918-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
References: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM8150b contains both a type-c controller and a power-delivery PHY.
This driver binds both of those blocks together via a virtual TCPM driver.

qcom-pmic-tcpm.c is responsible for registering with tcpm and wrappers
                 calls into the type-c and pdphy drivers from tcpm.
                 Its up to qcom-pmic-tcpm.c to wait for both
                 qcom-pmic-pdphy.c and qcom-pmic-typec.c to probe before
                 registering a type-c port

qcom-pmic-pdphy.c implements a set functions that qcom-pmic-tcpm.c is
                  responsible for interfacing with the pdphy hardware and
                  processing power-delivery related calls from tcpm.

qcom-pmic-typec.c implements a similar interface for the typec hardware
                  interface and is responsible for notifying and processing
                  type-c related calls from tcpm.

In conjunction with appropriate entries in the platform dts we can
establish a source or sink contract with a PD peer and indeed negotiate SBU
alternative modes.

This code provides all of the same functionality as the existing
qcom typec driver plus power-delivery as well.

As a result commit 6c8cf3695176 ("usb: typec: Add QCOM PMIC typec detection
driver") can be deleted entirely.

References code from Jonathan Marek, Jack Pham, Wesley Cheng, Hemant Kumar,
Guru Das Srinagesh and Ashay Jaiswal.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS                                   |   8 +
 drivers/usb/typec/tcpm/Kconfig                |  11 +
 drivers/usb/typec/tcpm/Makefile               |   1 +
 drivers/usb/typec/tcpm/qcom/Makefile          |   6 +
 .../usb/typec/tcpm/qcom/qcom_pmic_tcpm_core.c | 313 +++++++++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.c    | 606 +++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.h    |  85 +++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_typec.c    | 638 ++++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_tcpm_typec.h    | 163 +++++
 9 files changed, 1831 insertions(+)
 create mode 100644 drivers/usb/typec/tcpm/qcom/Makefile
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_core.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.h
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d118d7957d26..8f6a3099e5665 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15597,6 +15597,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
 F:	drivers/thermal/qcom/
 
+QUALCOMM TYPEC PORT MANAGER DRIVER
+M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+L:	linux-arm-msm@vger.kernel.org
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
+F:	drivers/usb/typec/tcpm/qcom/
+
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
 M:	Stanimir Varbanov <stanimir.varbanov@linaro.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 557f392fe24da..e012d90b1dc8c 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -66,4 +66,15 @@ config TYPEC_WCOVE
 	  To compile this driver as module, choose M here: the module will be
 	  called typec_wcove.ko
 
+config TYPEC_QCOM_PMIC
+	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	help
+	  A Type-C port and Power Delivery driver which aggregates two
+	  discrete pieces of silicon in the PM8150b PMIC block: the
+	  Type-C port controller and the Power Delivery PHY.
+
+	  This driver enables Type-C role switching, orientation, Alternate
+	  mode and Power Delivery support both for VBUS and VCONN.
+
 endif # TYPEC_TCPM
diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
index 7d499f3569fde..b7333e0243672 100644
--- a/drivers/usb/typec/tcpm/Makefile
+++ b/drivers/usb/typec/tcpm/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_TYPEC_TCPCI)		+= tcpci.o
 obj-$(CONFIG_TYPEC_RT1711H)		+= tcpci_rt1711h.o
 obj-$(CONFIG_TYPEC_MT6360)		+= tcpci_mt6360.o
 obj-$(CONFIG_TYPEC_TCPCI_MAXIM)		+= tcpci_maxim.o
+obj-$(CONFIG_TYPEC_QCOM_PMIC)		+= qcom/
diff --git a/drivers/usb/typec/tcpm/qcom/Makefile b/drivers/usb/typec/tcpm/qcom/Makefile
new file mode 100644
index 0000000000000..b06dc116e21ef
--- /dev/null
+++ b/drivers/usb/typec/tcpm/qcom/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+obj-$(CONFIG_TYPEC_QCOM_PMIC)		+= qcom_pmic_tcpm.o
+qcom_pmic_tcpm-y			+= qcom_pmic_tcpm_core.o \
+					   qcom_pmic_tcpm_typec.o \
+					   qcom_pmic_tcpm_pdphy.o
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_core.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_core.c
new file mode 100644
index 0000000000000..d633a49cc9360
--- /dev/null
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_core.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021, Linaro Ltd. All rights reserved.
+ */
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/usb/role.h>
+#include <linux/usb/tcpm.h>
+#include <linux/usb/typec_mux.h>
+#include "qcom_pmic_tcpm_pdphy.h"
+#include "qcom_pmic_tcpm_typec.h"
+
+struct pmic_tcpm {
+	struct device		*dev;
+	struct pmic_typec	*pmic_typec;
+	struct pmic_pdphy	*pmic_pdphy;
+	struct tcpm_port	*tcpm_port;
+	struct tcpc_dev		tcpc;
+	bool			vbus_enabled;
+	struct mutex		lock;		/* VBUS state serialization */
+};
+
+#define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_tcpm, tcpc)
+
+static int qcom_pmic_tcpm_core_get_vbus(struct tcpc_dev *tcpc)
+{
+	struct pmic_tcpm *tcpm = tcpc_to_tcpm(tcpc);
+	int ret;
+
+	mutex_lock(&tcpm->lock);
+	ret = tcpm->vbus_enabled || qcom_pmic_tcpm_typec_get_vbus(tcpm->pmic_typec);
+	mutex_unlock(&tcpm->lock);
+
+	return ret;
+}
+
+static int qcom_pmic_tcpm_core_set_vbus(struct tcpc_dev *tcpc, bool on,
+					bool sink)
+{
+	struct pmic_tcpm *tcpm = tcpc_to_tcpm(tcpc);
+	int ret = 0;
+
+	mutex_lock(&tcpm->lock);
+	if (tcpm->vbus_enabled == on)
+		goto done;
+
+	ret = qcom_pmic_tcpm_typec_set_vbus(tcpm->pmic_typec, on);
+	if (ret)
+		goto done;
+
+	tcpm->vbus_enabled = on;
+	tcpm_vbus_change(tcpm->tcpm_port);
+
+done:
+	dev_dbg(tcpm->dev, "set_vbus set: %d result %d\n", on, ret);
+	mutex_unlock(&tcpm->lock);
+
+	return ret;
+}
+
+static int qcom_pmic_tcpm_core_set_vconn(struct tcpc_dev *tcpc, bool on)
+{
+	struct pmic_tcpm *tcpm = tcpc_to_tcpm(tcpc);
+
+	return qcom_pmic_tcpm_typec_set_vconn(tcpm->pmic_typec, on);
+}
+
+static int qcom_pmic_tcpm_core_get_cc(struct tcpc_dev *tcpc,
+				      enum typec_cc_status *cc1,
+				      enum typec_cc_status *cc2)
+{
+	struct pmic_tcpm *tcpm = tcpc_to_tcpm(tcpc);
+
+	return qcom_pmic_tcpm_typec_get_cc(tcpm->pmic_typec, cc1, cc2);
+}
+
+static int qcom_pmic_tcpm_core_set_cc(struct tcpc_dev *tcpc,
+				      enum typec_cc_status cc)
+{
+	struct pmic_tcpm *tcpm = tcpc_to_tcpm(tcpc);
+
+	return qcom_pmic_tcpm_typec_set_cc(tcpm->pmic_typec, cc);
+}
+
+static int qcom_pmic_tcpm_core_set_polarity(struct tcpc_dev *tcpc,
+					    enum typec_cc_polarity pol)
+{
+	/* Polarity is set separately by phy-qcom-qmp.c */
+	return 0;
+}
+
+static int qcom_pmic_tcpm_core_start_toggling(struct tcpc_dev *tcpc,
+					      enum typec_port_type port_type,
+					      enum typec_cc_status cc)
+{
+	struct pmic_tcpm *tcpm = tcpc_to_tcpm(tcpc);
+
+	return qcom_pmic_tcpm_typec_start_toggling(tcpm->pmic_typec, port_type,
+						   cc);
+}
+
+static int qcom_pmic_tcpm_core_set_roles(struct tcpc_dev *tcpc, bool attached,
+					 enum typec_role power_role,
+					 enum typec_data_role data_role)
+{
+	struct pmic_tcpm *tcpm = tcpc_to_tcpm(tcpc);
+
+	return qcom_pmic_tcpm_pdphy_set_roles(tcpm->pmic_pdphy, data_role,
+					      power_role);
+}
+
+static int qcom_pmic_tcpm_core_set_pd_rx(struct tcpc_dev *tcpc, bool on)
+{
+	struct pmic_tcpm *tcpm = tcpc_to_tcpm(tcpc);
+
+	return qcom_pmic_tcpm_pdphy_set_pd_rx(tcpm->pmic_pdphy, on);
+}
+
+static int qcom_pmic_tcpm_core_pd_transmit(struct tcpc_dev *tcpc,
+					   enum tcpm_transmit_type type,
+					   const struct pd_message *msg,
+					   unsigned int negotiated_rev)
+{
+	struct pmic_tcpm *tcpm = tcpc_to_tcpm(tcpc);
+
+	return qcom_pmic_tcpm_pdphy_pd_transmit(tcpm->pmic_pdphy, type, msg,
+						negotiated_rev);
+}
+
+static struct platform_device
+*qcom_pmic_tcpm_core_get_endpoint(struct device *dev, u32 port, u32 endpoint)
+{
+	struct device_node *remote;
+	struct platform_device *pdev;
+
+	remote = of_graph_get_remote_node(dev->of_node, port, endpoint);
+	if (!remote) {
+		dev_err(dev, "Remote endpoint %d not found\n", endpoint);
+		return ERR_PTR(-ENODEV);
+	}
+
+	pdev = of_find_device_by_node(remote);
+	of_node_put(remote);
+
+	if (pdev)
+		return pdev;
+
+	return ERR_PTR(-ENODEV);
+}
+
+static int qcom_pmic_tcpm_core_init(struct tcpc_dev *tcpc)
+{
+	return 0;
+}
+
+static int qcom_pmic_tcpm_core_probe(struct platform_device *pdev)
+{
+	struct pmic_tcpm *tcpm;
+	struct device *dev = &pdev->dev;
+	struct platform_device *typec_pdev;
+	struct platform_device *pdphy_pdev;
+	int ret;
+
+	tcpm = devm_kzalloc(dev, sizeof(*tcpm), GFP_KERNEL);
+	if (!tcpm)
+		return -ENOMEM;
+
+	tcpm->dev = dev;
+	tcpm->tcpc.init = qcom_pmic_tcpm_core_init;
+	tcpm->tcpc.get_vbus = qcom_pmic_tcpm_core_get_vbus;
+	tcpm->tcpc.set_vbus = qcom_pmic_tcpm_core_set_vbus;
+	tcpm->tcpc.set_cc = qcom_pmic_tcpm_core_set_cc;
+	tcpm->tcpc.get_cc = qcom_pmic_tcpm_core_get_cc;
+	tcpm->tcpc.set_polarity = qcom_pmic_tcpm_core_set_polarity;
+	tcpm->tcpc.set_vconn = qcom_pmic_tcpm_core_set_vconn;
+	tcpm->tcpc.start_toggling = qcom_pmic_tcpm_core_start_toggling;
+	tcpm->tcpc.set_pd_rx = qcom_pmic_tcpm_core_set_pd_rx;
+	tcpm->tcpc.set_roles = qcom_pmic_tcpm_core_set_roles;
+	tcpm->tcpc.pd_transmit = qcom_pmic_tcpm_core_pd_transmit;
+
+	mutex_init(&tcpm->lock);
+	platform_set_drvdata(pdev, tcpm);
+
+	typec_pdev = qcom_pmic_tcpm_core_get_endpoint(dev, 0, -1);
+	if (IS_ERR(typec_pdev)) {
+		dev_err(dev, "Error linking typec endpoint\n");
+		return PTR_ERR(typec_pdev);
+	}
+
+	tcpm->pmic_typec = platform_get_drvdata(typec_pdev);
+	if (!tcpm->pmic_typec) {
+		ret = -EPROBE_DEFER;
+		goto put_typec_pdev;
+	}
+
+	pdphy_pdev = qcom_pmic_tcpm_core_get_endpoint(dev, 1, -1);
+	if (IS_ERR(pdphy_pdev)) {
+		dev_err(dev, "Error linking pdphy endpoint\n");
+		ret = PTR_ERR(pdphy_pdev);
+		goto put_typec_pdev;
+	}
+
+	tcpm->pmic_pdphy = platform_get_drvdata(pdphy_pdev);
+	if (!tcpm->pmic_pdphy) {
+		ret = -EPROBE_DEFER;
+		goto put_pdphy_dev;
+	}
+
+	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
+	if (IS_ERR(tcpm->tcpc.fwnode))
+		return PTR_ERR(tcpm->tcpc.fwnode);
+
+	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
+	if (IS_ERR(tcpm->tcpm_port)) {
+		ret = PTR_ERR(tcpm->tcpm_port);
+		goto fwnode_remove;
+	}
+
+	ret = qcom_pmic_tcpm_pdphy_init(tcpm->pmic_pdphy, tcpm->tcpm_port);
+	if (ret)
+		goto fwnode_remove;
+
+	ret = qcom_pmic_tcpm_typec_init(tcpm->pmic_typec, tcpm->tcpm_port);
+	if (ret)
+		goto fwnode_remove;
+
+	return 0;
+
+fwnode_remove:
+	fwnode_remove_software_node(tcpm->tcpc.fwnode);
+
+put_pdphy_dev:
+	put_device(&pdphy_pdev->dev);
+
+put_typec_pdev:
+	put_device(&typec_pdev->dev);
+
+	return ret;
+}
+
+static int qcom_pmic_tcpm_core_remove(struct platform_device *pdev)
+{
+	struct pmic_tcpm *tcpm = platform_get_drvdata(pdev);
+
+	tcpm_unregister_port(tcpm->tcpm_port);
+	fwnode_remove_software_node(tcpm->tcpc.fwnode);
+	qcom_pmic_tcpm_pdphy_put(tcpm->pmic_pdphy);
+	qcom_pmic_tcpm_typec_put(tcpm->pmic_typec);
+
+	return 0;
+}
+
+static const struct of_device_id qcom_pmic_tcpm_core_table[] = {
+	{ .compatible = "qcom,pmic-tcpm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_pmic_tcpm_core_table);
+
+static struct platform_driver qcom_pmic_tcpm_core_platform_driver = {
+	.driver = {
+		.name = "qcom,pmic-tcpm",
+		.of_match_table = qcom_pmic_tcpm_core_table,
+	},
+	.probe = qcom_pmic_tcpm_core_probe,
+	.remove = qcom_pmic_tcpm_core_remove,
+};
+
+static int __init qcom_pmic_tcpm_core_module_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&qcom_pmic_tcpm_typec_platform_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&qcom_pmic_tcpm_pdphy_platform_driver);
+	if (ret)
+		goto unregister_typec;
+
+	ret = platform_driver_register(&qcom_pmic_tcpm_core_platform_driver);
+	if (ret)
+		goto unregister_pdphy;
+
+	return 0;
+
+unregister_pdphy:
+	platform_driver_unregister(&qcom_pmic_tcpm_pdphy_platform_driver);
+
+unregister_typec:
+	platform_driver_unregister(&qcom_pmic_tcpm_typec_platform_driver);
+
+	return ret;
+}
+module_init(qcom_pmic_tcpm_core_module_init);
+
+static void __exit qcom_pmic_tcpm_core_module_exit(void)
+{
+	platform_driver_unregister(&qcom_pmic_tcpm_core_platform_driver);
+	platform_driver_unregister(&qcom_pmic_tcpm_pdphy_platform_driver);
+	platform_driver_unregister(&qcom_pmic_tcpm_typec_platform_driver);
+}
+module_exit(qcom_pmic_tcpm_core_module_exit);
+
+MODULE_DESCRIPTION("QCOM PMIC USB Type-C Port Manager Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.c
new file mode 100644
index 0000000000000..64821ad3fd345
--- /dev/null
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.c
@@ -0,0 +1,606 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021, Linaro Ltd. All rights reserved.
+ */
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/usb/pd.h>
+#include <linux/usb/tcpm.h>
+#include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h>
+#include "qcom_pmic_tcpm_pdphy.h"
+
+#define PMIC_PDPHY_MAX_IRQS		0x08
+
+struct pmic_pdphy_irq_params {
+	int				virq;
+	char				*irq_name;
+};
+
+struct pmic_pdphy_resources {
+	unsigned int			nr_irqs;
+	struct pmic_pdphy_irq_params	irq_params[PMIC_PDPHY_MAX_IRQS];
+};
+
+struct pmic_pdphy_irq_data {
+	int				virq;
+	int				irq;
+	struct pmic_pdphy		*pmic_pdphy;
+};
+
+struct pmic_pdphy {
+	struct device			*dev;
+	struct tcpm_port		*tcpm_port;
+	struct regmap			*regmap;
+	u32				base;
+
+	unsigned int			nr_irqs;
+	struct pmic_pdphy_irq_data	*irq_data;
+
+	struct work_struct		reset_work;
+	struct work_struct		receive_work;
+	struct regulator		*vdd_pdphy;
+	spinlock_t			lock;		/* Register atomicity */
+};
+
+static void qcom_pmic_tcpm_pdphy_reset_on(struct pmic_pdphy *pmic_pdphy)
+{
+	struct device *dev = pmic_pdphy->dev;
+	int ret;
+
+	/* Terminate TX */
+	ret = regmap_write(pmic_pdphy->regmap,
+			   pmic_pdphy->base + USB_PDPHY_TX_CONTROL_REG, 0);
+	if (ret)
+		goto err;
+
+	ret = regmap_write(pmic_pdphy->regmap,
+			   pmic_pdphy->base + USB_PDPHY_FRAME_FILTER_REG, 0);
+	if (ret)
+		goto err;
+
+	return;
+err:
+	dev_err(dev, "pd_reset_on error\n");
+}
+
+static void qcom_pmic_tcpm_pdphy_reset_off(struct pmic_pdphy *pmic_pdphy)
+{
+	struct device *dev = pmic_pdphy->dev;
+	int ret;
+
+	ret = regmap_write(pmic_pdphy->regmap,
+			   pmic_pdphy->base + USB_PDPHY_FRAME_FILTER_REG,
+			   FRAME_FILTER_EN_SOP | FRAME_FILTER_EN_HARD_RESET);
+	if (ret)
+		dev_err(dev, "pd_reset_off error\n");
+
+	return;
+}
+
+static void qcom_pmic_tcpm_pdphy_sig_reset_work(struct work_struct *work)
+{
+	struct pmic_pdphy *pmic_pdphy = container_of(work, struct pmic_pdphy,
+						     reset_work);
+	unsigned long flags;
+
+	spin_lock_irqsave(&pmic_pdphy->lock, flags);
+
+	qcom_pmic_tcpm_pdphy_reset_on(pmic_pdphy);
+	qcom_pmic_tcpm_pdphy_reset_off(pmic_pdphy);
+
+	spin_unlock_irqrestore(&pmic_pdphy->lock, flags);
+
+	tcpm_pd_hard_reset(pmic_pdphy->tcpm_port);
+}
+
+static int
+qcom_pmic_tcpm_pdphy_clear_tx_control_reg(struct pmic_pdphy *pmic_pdphy)
+{
+	struct device *dev = pmic_pdphy->dev;
+	unsigned int val;
+	int ret;
+
+	/* Clear TX control register */
+	ret = regmap_write(pmic_pdphy->regmap,
+			   pmic_pdphy->base + USB_PDPHY_TX_CONTROL_REG, 0);
+	if (ret)
+		goto done;
+
+	/* Perform readback to ensure sufficient delay for command to latch */
+	ret = regmap_read(pmic_pdphy->regmap,
+			  pmic_pdphy->base + USB_PDPHY_TX_CONTROL_REG, &val);
+
+done:
+	if (ret)
+		dev_err(dev, "pd_clear_tx_control_reg: clear tx flag\n");
+
+	return ret;
+}
+
+static int
+qcom_pmic_tcpm_pdphy_pd_transmit_signal(struct pmic_pdphy *pmic_pdphy,
+					enum tcpm_transmit_type type,
+					unsigned int negotiated_rev)
+{
+	struct device *dev = pmic_pdphy->dev;
+	unsigned int val;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&pmic_pdphy->lock, flags);
+
+	/* Clear TX control register */
+	ret = qcom_pmic_tcpm_pdphy_clear_tx_control_reg(pmic_pdphy);
+	if (ret)
+		goto done;
+
+	val = TX_CONTROL_SEND_SIGNAL;
+	if (negotiated_rev == PD_REV30)
+		val |= TX_CONTROL_RETRY_COUNT(2);
+	else
+		val |= TX_CONTROL_RETRY_COUNT(3);
+
+	if (type == TCPC_TX_CABLE_RESET || type == TCPC_TX_HARD_RESET)
+		val |= TX_CONTROL_FRAME_TYPE(1);
+
+	ret = regmap_write(pmic_pdphy->regmap,
+			   pmic_pdphy->base + USB_PDPHY_TX_CONTROL_REG, val);
+
+done:
+	spin_unlock_irqrestore(&pmic_pdphy->lock, flags);
+
+	dev_vdbg(dev, "pd_transmit_signal: type %d negotiate_rev %d send %d\n",
+		 type, negotiated_rev, ret);
+
+	return ret;
+}
+
+static int
+qcom_pmic_tcpm_pdphy_pd_transmit_payload(struct pmic_pdphy *pmic_pdphy,
+					 enum tcpm_transmit_type type,
+					 const struct pd_message *msg,
+					 unsigned int negotiated_rev)
+{
+	struct device *dev = pmic_pdphy->dev;
+	unsigned int val, hdr_len, txbuf_len, txsize_len;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&pmic_pdphy->lock, flags);
+
+	ret = regmap_read(pmic_pdphy->regmap,
+			  pmic_pdphy->base + USB_PDPHY_RX_ACKNOWLEDGE_REG,
+			  &val);
+	if (ret)
+		goto done;
+
+	if (val) {
+		dev_err(dev, "pd_transmit_payload: RX message pending\n");
+		ret = -EBUSY;
+		goto done;
+	}
+
+	/* Clear TX control register */
+	ret = qcom_pmic_tcpm_pdphy_clear_tx_control_reg(pmic_pdphy);
+	if (ret)
+		goto done;
+
+	hdr_len = sizeof(msg->header);
+	txbuf_len = pd_header_cnt_le(msg->header) * 4;
+	txsize_len = hdr_len + txbuf_len - 1;
+
+	/* Write message header sizeof(u16) to USB_PDPHY_TX_BUFFER_HDR_REG */
+	ret = regmap_bulk_write(pmic_pdphy->regmap,
+				pmic_pdphy->base + USB_PDPHY_TX_BUFFER_HDR_REG,
+				&msg->header, hdr_len);
+	if (ret)
+		goto done;
+
+	/* Write payload to USB_PDPHY_TX_BUFFER_DATA_REG for txbuf_len */
+	if (txbuf_len) {
+		ret = regmap_bulk_write(pmic_pdphy->regmap,
+					pmic_pdphy->base + USB_PDPHY_TX_BUFFER_DATA_REG,
+					&msg->payload, txbuf_len);
+		if (ret)
+			goto done;
+	}
+
+	/* Write total length ((header + data) - 1) to USB_PDPHY_TX_SIZE_REG */
+	ret = regmap_write(pmic_pdphy->regmap,
+			   pmic_pdphy->base + USB_PDPHY_TX_SIZE_REG,
+			   txsize_len);
+	if (ret)
+		goto done;
+
+	/* Clear TX control register */
+	ret = qcom_pmic_tcpm_pdphy_clear_tx_control_reg(pmic_pdphy);
+	if (ret)
+		goto done;
+
+	/* Initiate transmit with retry count as indicated by PD revision */
+	val = TX_CONTROL_FRAME_TYPE(type) | TX_CONTROL_SEND_MSG;
+	if (pd_header_rev(msg->header) == PD_REV30)
+		val |= TX_CONTROL_RETRY_COUNT(2);
+	else
+		val |= TX_CONTROL_RETRY_COUNT(3);
+
+	ret = regmap_write(pmic_pdphy->regmap,
+			   pmic_pdphy->base + USB_PDPHY_TX_CONTROL_REG, val);
+
+done:
+	spin_unlock_irqrestore(&pmic_pdphy->lock, flags);
+
+	if (ret) {
+		dev_err(dev, "pd_transmit_payload: %d hdr %*ph data %*ph ret %d\n",
+			ret, hdr_len, &msg->header, txbuf_len, &msg->payload, ret);
+	}
+
+	return ret;
+}
+
+int qcom_pmic_tcpm_pdphy_pd_transmit(struct pmic_pdphy *pmic_pdphy,
+				     enum tcpm_transmit_type type,
+				     const struct pd_message *msg,
+				     unsigned int negotiated_rev)
+{
+	struct device *dev = pmic_pdphy->dev;
+	int ret;
+
+	if (msg) {
+		ret = qcom_pmic_tcpm_pdphy_pd_transmit_payload(pmic_pdphy, type,
+							       msg,
+							       negotiated_rev);
+	} else {
+		ret = qcom_pmic_tcpm_pdphy_pd_transmit_signal(pmic_pdphy, type,
+							      negotiated_rev);
+	}
+
+	if (ret)
+		dev_dbg(dev, "pd_transmit: type %x result %d\n", type, ret);
+
+	return ret;
+}
+
+static void qcom_pmic_tcpm_pdphy_pd_receive(struct pmic_pdphy *pmic_pdphy)
+{
+	struct device *dev = pmic_pdphy->dev;
+	struct pd_message msg;
+	unsigned int size, rx_status;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&pmic_pdphy->lock, flags);
+
+	ret = regmap_read(pmic_pdphy->regmap,
+			  pmic_pdphy->base + USB_PDPHY_RX_SIZE_REG, &size);
+	if (ret)
+		goto done;
+
+	/* If we received a subsequent RX sig this value can be zero */
+	if ((size < 1 || size > sizeof(msg.payload))) {
+		dev_dbg(dev, "pd_receive: invalid size %d\n", size);
+		goto done;
+	}
+
+	size += 1;
+	ret = regmap_read(pmic_pdphy->regmap,
+			  pmic_pdphy->base + USB_PDPHY_RX_STATUS_REG,
+			  &rx_status);
+
+	if (ret)
+		goto done;
+
+	ret = regmap_bulk_read(pmic_pdphy->regmap,
+			       pmic_pdphy->base + USB_PDPHY_RX_BUFFER_REG,
+			       (u8 *)&msg, size);
+	if (ret)
+		goto done;
+
+	/* Return ownership of RX buffer to hardware */
+	ret = regmap_write(pmic_pdphy->regmap,
+			   pmic_pdphy->base + USB_PDPHY_RX_ACKNOWLEDGE_REG, 0);
+
+done:
+	spin_unlock_irqrestore(&pmic_pdphy->lock, flags);
+
+	if (!ret) {
+		dev_vdbg(dev, "pd_receive: handing %d bytes to tcpm\n", size);
+		tcpm_pd_receive(pmic_pdphy->tcpm_port, &msg);
+	}
+}
+
+static irqreturn_t qcom_pmic_tcpm_pdphy_isr(int irq, void *dev_id)
+{
+	struct pmic_pdphy_irq_data *irq_data = dev_id;
+	struct pmic_pdphy *pmic_pdphy = irq_data->pmic_pdphy;
+	struct device *dev = pmic_pdphy->dev;
+
+	switch (irq_data->virq) {
+	case PMIC_PDPHY_SIG_TX_IRQ:
+		dev_err(dev, "isr: tx_sig\n");
+		break;
+	case PMIC_PDPHY_SIG_RX_IRQ:
+		schedule_work(&pmic_pdphy->reset_work);
+		break;
+	case PMIC_PDPHY_MSG_TX_IRQ:
+		tcpm_pd_transmit_complete(pmic_pdphy->tcpm_port,
+					  TCPC_TX_SUCCESS);
+		break;
+	case PMIC_PDPHY_MSG_RX_IRQ:
+		qcom_pmic_tcpm_pdphy_pd_receive(pmic_pdphy);
+		break;
+	case PMIC_PDPHY_MSG_TX_FAIL_IRQ:
+		tcpm_pd_transmit_complete(pmic_pdphy->tcpm_port,
+					  TCPC_TX_FAILED);
+		break;
+	case PMIC_PDPHY_MSG_TX_DISCARD_IRQ:
+		tcpm_pd_transmit_complete(pmic_pdphy->tcpm_port,
+					  TCPC_TX_DISCARDED);
+		break;
+	}
+
+	return IRQ_HANDLED;
+}
+
+int qcom_pmic_tcpm_pdphy_set_pd_rx(struct pmic_pdphy *pmic_pdphy, bool on)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&pmic_pdphy->lock, flags);
+
+	ret = regmap_write(pmic_pdphy->regmap,
+			   pmic_pdphy->base + USB_PDPHY_RX_ACKNOWLEDGE_REG, !on);
+
+	spin_unlock_irqrestore(&pmic_pdphy->lock, flags);
+
+	dev_dbg(pmic_pdphy->dev, "set_pd_rx: %s\n", on ? "on" : "off");
+
+	return ret;
+}
+
+int qcom_pmic_tcpm_pdphy_set_roles(struct pmic_pdphy *pmic_pdphy,
+				   bool data_role_host, bool power_role_src)
+{
+	struct device *dev = pmic_pdphy->dev;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&pmic_pdphy->lock, flags);
+
+	ret = regmap_update_bits(pmic_pdphy->regmap,
+				 pmic_pdphy->base + USB_PDPHY_MSG_CONFIG_REG,
+				 MSG_CONFIG_PORT_DATA_ROLE |
+				 MSG_CONFIG_PORT_POWER_ROLE,
+				 data_role_host << 3 | power_role_src << 2);
+
+	spin_unlock_irqrestore(&pmic_pdphy->lock, flags);
+
+	dev_dbg(dev, "pdphy_set_roles: data_role_host=%d power_role_src=%d\n",
+		data_role_host, power_role_src);
+
+	return ret;
+}
+
+static int qcom_pmic_tcpm_pdphy_enable(struct pmic_pdphy *pmic_pdphy)
+{
+	struct device *dev = pmic_pdphy->dev;
+	int ret;
+
+	ret = regulator_enable(pmic_pdphy->vdd_pdphy);
+	if (ret)
+		return ret;
+
+	/* PD 2.0, DR=TYPEC_DEVICE, PR=TYPEC_SINK */
+	ret = regmap_update_bits(pmic_pdphy->regmap,
+				 pmic_pdphy->base + USB_PDPHY_MSG_CONFIG_REG,
+				 MSG_CONFIG_SPEC_REV_MASK, PD_REV20);
+	if (ret)
+		goto done;
+
+	ret = regmap_write(pmic_pdphy->regmap,
+			   pmic_pdphy->base + USB_PDPHY_EN_CONTROL_REG, 0);
+	if (ret)
+		goto done;
+
+	ret = regmap_write(pmic_pdphy->regmap,
+			   pmic_pdphy->base + USB_PDPHY_EN_CONTROL_REG,
+			   CONTROL_ENABLE);
+	if (ret)
+		goto done;
+
+	qcom_pmic_tcpm_pdphy_reset_off(pmic_pdphy);
+done:
+	if (ret)
+		dev_err(dev, "pdphy_enable fail %d\n", ret);
+
+	return ret;
+}
+
+static int qcom_pmic_tcpm_pdphy_disable(struct pmic_pdphy *pmic_pdphy)
+{
+	struct device *dev = pmic_pdphy->dev;
+	int ret;
+
+	qcom_pmic_tcpm_pdphy_reset_on(pmic_pdphy);
+
+	ret = regmap_write(pmic_pdphy->regmap,
+			   pmic_pdphy->base + USB_PDPHY_EN_CONTROL_REG, 0);
+
+	regulator_disable(pmic_pdphy->vdd_pdphy);
+
+	return ret;
+}
+
+static int pmic_pdphy_reset(struct pmic_pdphy *pmic_pdphy)
+{
+	int ret;
+
+	ret = qcom_pmic_tcpm_pdphy_disable(pmic_pdphy);
+	if (ret)
+		goto done;
+
+	usleep_range(400, 500);
+	ret = qcom_pmic_tcpm_pdphy_enable(pmic_pdphy);
+done:
+	return ret;
+}
+
+int qcom_pmic_tcpm_pdphy_init(struct pmic_pdphy *pmic_pdphy,
+			      struct tcpm_port *tcpm_port)
+{
+	int i;
+	int ret;
+
+	pmic_pdphy->tcpm_port = tcpm_port;
+
+	ret = pmic_pdphy_reset(pmic_pdphy);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < pmic_pdphy->nr_irqs; i++)
+		enable_irq(pmic_pdphy->irq_data[i].irq);
+
+	return 0;
+}
+
+void qcom_pmic_tcpm_pdphy_put(struct pmic_pdphy *pmic_pdphy)
+{
+	put_device(pmic_pdphy->dev);
+}
+
+static int qcom_pmic_tcpm_pdphy_probe(struct platform_device *pdev)
+{
+	struct pmic_pdphy *pmic_pdphy;
+	struct device *dev = &pdev->dev;
+	const struct pmic_pdphy_resources *res;
+	struct pmic_pdphy_irq_data *irq_data;
+	int i, ret, irq;
+	u32 reg;
+
+	ret = device_property_read_u32(dev, "reg", &reg);
+	if (ret < 0) {
+		dev_err(dev, "missing base address\n");
+		return ret;
+	}
+
+	res = of_device_get_match_data(dev);
+	if (!res)
+		return -ENODEV;
+
+	if (!res->nr_irqs || res->nr_irqs > PMIC_PDPHY_MAX_IRQS)
+		return -EINVAL;
+
+	pmic_pdphy = devm_kzalloc(dev, sizeof(*pmic_pdphy), GFP_KERNEL);
+	if (!pmic_pdphy)
+		return -ENOMEM;
+
+	irq_data = devm_kzalloc(dev, sizeof(*irq_data) * res->nr_irqs,
+				GFP_KERNEL);
+	if (!irq_data)
+		return -ENOMEM;
+
+	pmic_pdphy->dev = dev;
+	pmic_pdphy->base = reg;
+	pmic_pdphy->nr_irqs = res->nr_irqs;
+	pmic_pdphy->irq_data = irq_data;
+	spin_lock_init(&pmic_pdphy->lock);
+	INIT_WORK(&pmic_pdphy->reset_work, qcom_pmic_tcpm_pdphy_sig_reset_work);
+
+	pmic_pdphy->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!pmic_pdphy->regmap) {
+		dev_err(dev, "Failed to get regmap\n");
+		return -ENODEV;
+	}
+
+	pmic_pdphy->vdd_pdphy = devm_regulator_get(dev, "vdd-pdphy");
+	if (IS_ERR(pmic_pdphy->vdd_pdphy))
+		return PTR_ERR(pmic_pdphy->vdd_pdphy);
+
+	platform_set_drvdata(pdev, pmic_pdphy);
+	for (i = 0; i < res->nr_irqs; i++, irq_data++) {
+		irq = platform_get_irq_byname(pdev, res->irq_params[i].irq_name);
+		if (irq < 0)
+			return irq;
+
+		irq_data->pmic_pdphy = pmic_pdphy;
+		irq_data->irq = irq;
+		irq_data->virq = res->irq_params[i].virq;
+
+		ret = devm_request_threaded_irq(dev, irq, NULL,
+						qcom_pmic_tcpm_pdphy_isr,
+						IRQF_ONESHOT | IRQF_NO_AUTOEN,
+						res->irq_params[i].irq_name,
+						irq_data);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static int qcom_pmic_tcpm_pdphy_remove(struct platform_device *pdev)
+{
+	struct pmic_pdphy *pmic_pdphy = platform_get_drvdata(pdev);
+
+	qcom_pmic_tcpm_pdphy_reset_on(pmic_pdphy);
+
+	return 0;
+}
+
+static struct pmic_pdphy_resources pm8150b_pdphy_res = {
+	.irq_params = {
+		{
+			.virq = PMIC_PDPHY_SIG_TX_IRQ,
+			.irq_name = "pmic-pdphy-sig-tx",
+		},
+		{
+			.virq = PMIC_PDPHY_SIG_RX_IRQ,
+			.irq_name = "pmic-pdphy-sig-rx",
+		},
+		{
+			.virq = PMIC_PDPHY_MSG_TX_IRQ,
+			.irq_name = "pmic-pdphy-msg-tx",
+		},
+		{
+			.virq = PMIC_PDPHY_MSG_RX_IRQ,
+			.irq_name = "pmic-pdphy-msg-rx",
+		},
+		{
+			.virq = PMIC_PDPHY_MSG_TX_FAIL_IRQ,
+			.irq_name = "pmic-pdphy-msg-tx-failed",
+		},
+		{
+			.virq = PMIC_PDPHY_MSG_TX_DISCARD_IRQ,
+			.irq_name = "pmic-pdphy-msg-tx-discarded",
+		},
+		{
+			.virq = PMIC_PDPHY_MSG_RX_DISCARD_IRQ,
+			.irq_name = "pmic-pdphy-msg-rx-discarded",
+		},
+	},
+	.nr_irqs = 7,
+};
+
+static const struct of_device_id qcom_pmic_tcpm_pdphy_table[] = {
+	{ .compatible = "qcom,pm8150b-pdphy", .data = &pm8150b_pdphy_res },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_pmic_tcpm_pdphy_table);
+
+struct platform_driver qcom_pmic_tcpm_pdphy_platform_driver = {
+	.driver = {
+		.name = "qcom,pmic-usb-pdphy",
+		.of_match_table = qcom_pmic_tcpm_pdphy_table,
+	},
+	.probe = qcom_pmic_tcpm_pdphy_probe,
+	.remove = qcom_pmic_tcpm_pdphy_remove,
+};
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.h
new file mode 100644
index 0000000000000..9f712a88024b7
--- /dev/null
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Linaro Ltd. All rights reserved.
+ */
+#ifndef __QCOM_PMIC_PDPHY_H__
+#define __QCOM_PMIC_PDPHY_H__
+
+#define USB_PDPHY_MAX_DATA_OBJ_LEN	28
+#define USB_PDPHY_MSG_HDR_LEN		2
+
+/* PD PHY register offsets and bit fields */
+#define USB_PDPHY_MSG_CONFIG_REG	0x40
+#define MSG_CONFIG_PORT_DATA_ROLE	BIT(3)
+#define MSG_CONFIG_PORT_POWER_ROLE	BIT(2)
+#define MSG_CONFIG_SPEC_REV_MASK	(BIT(1) | BIT(0))
+
+#define USB_PDPHY_EN_CONTROL_REG	0x46
+#define CONTROL_ENABLE			BIT(0)
+
+#define USB_PDPHY_RX_STATUS_REG		0x4A
+#define RX_FRAME_TYPE			(BIT(0) | BIT(1) | BIT(2))
+
+#define USB_PDPHY_FRAME_FILTER_REG	0x4C
+#define FRAME_FILTER_EN_HARD_RESET	BIT(5)
+#define FRAME_FILTER_EN_SOP		BIT(0)
+
+#define USB_PDPHY_TX_SIZE_REG		0x42
+#define TX_SIZE_MASK			0xF
+
+#define USB_PDPHY_TX_CONTROL_REG	0x44
+#define TX_CONTROL_RETRY_COUNT(n)	(((n) & 0x3) << 5)
+#define TX_CONTROL_FRAME_TYPE(n)        (((n) & 0x7) << 2)
+#define TX_CONTROL_FRAME_TYPE_CABLE_RESET	(0x1 << 2)
+#define TX_CONTROL_SEND_SIGNAL		BIT(1)
+#define TX_CONTROL_SEND_MSG		BIT(0)
+
+#define USB_PDPHY_RX_SIZE_REG		0x48
+
+#define USB_PDPHY_RX_ACKNOWLEDGE_REG	0x4B
+#define RX_BUFFER_TOKEN			BIT(0)
+
+#define USB_PDPHY_BIST_MODE_REG		0x4E
+#define BIST_MODE_MASK			0xF
+#define BIST_ENABLE			BIT(7)
+#define PD_MSG_BIST			0x3
+#define PD_BIST_TEST_DATA_MODE		0x8
+
+#define USB_PDPHY_TX_BUFFER_HDR_REG	0x60
+#define USB_PDPHY_TX_BUFFER_DATA_REG	0x62
+
+#define USB_PDPHY_RX_BUFFER_REG		0x80
+
+/* VDD regulator */
+#define VDD_PDPHY_VOL_MIN		2800000	/* uV */
+#define VDD_PDPHY_VOL_MAX		3300000	/* uV */
+#define VDD_PDPHY_HPM_LOAD		3000	/* uA */
+
+/* Message Spec Rev field */
+#define PD_MSG_HDR_REV(hdr)		(((hdr) >> 6) & 3)
+
+/* timers */
+#define RECEIVER_RESPONSE_TIME		15	/* tReceiverResponse */
+#define HARD_RESET_COMPLETE_TIME	5	/* tHardResetComplete */
+
+struct pmic_pdphy;
+extern struct platform_driver qcom_pmic_tcpm_pdphy_platform_driver;
+
+int qcom_pmic_tcpm_pdphy_init(struct pmic_pdphy *pmic_pdphy,
+			      struct tcpm_port *tcpm_port);
+
+void qcom_pmic_tcpm_pdphy_put(struct pmic_pdphy *pmic_pdphy);
+
+int qcom_pmic_tcpm_pdphy_set_roles(struct pmic_pdphy *pmic_pdphy,
+				   bool power_role_src,
+				   bool data_role_host);
+
+int qcom_pmic_tcpm_pdphy_set_pd_rx(struct pmic_pdphy *pmic_pdphy, bool on);
+
+int qcom_pmic_tcpm_pdphy_pd_transmit(struct pmic_pdphy *pmic_pdphy,
+				     enum tcpm_transmit_type type,
+				     const struct pd_message *msg,
+				     unsigned int negotiated_rev);
+
+#endif /* __QCOM_PMIC_PDPHY_H__ */
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.c
new file mode 100644
index 0000000000000..f72656a0fbc79
--- /dev/null
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.c
@@ -0,0 +1,638 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021, Linaro Ltd. All rights reserved.
+ */
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/usb/tcpm.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/workqueue.h>
+#include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h>
+#include "qcom_pmic_tcpm_typec.h"
+
+#define PMIC_TYPEC_MAX_IRQS		0x08
+
+struct pmic_typec_irq_params {
+	int				virq;
+	char				*irq_name;
+};
+
+struct pmic_typec_resources {
+	unsigned int			nr_irqs;
+	struct pmic_typec_irq_params	irq_params[PMIC_TYPEC_MAX_IRQS];
+};
+
+struct pmic_typec_irq_data {
+	int				virq;
+	int				irq;
+	struct pmic_typec		*pmic_typec;
+};
+
+struct pmic_typec {
+	struct device			*dev;
+	struct tcpm_port		*tcpm_port;
+	struct regmap			*regmap;
+	u32				base;
+	unsigned int			nr_irqs;
+	struct pmic_typec_irq_data	*irq_data;
+
+	struct regulator		*vdd_vbus;
+
+	int				cc;
+	bool				debouncing_cc;
+	struct delayed_work		cc_debounce_dwork;
+
+	spinlock_t			lock;	/* Register atomicity */
+};
+
+static const char * const typec_cc_status_name[] = {
+	[TYPEC_CC_OPEN]		= "Open",
+	[TYPEC_CC_RA]		= "Ra",
+	[TYPEC_CC_RD]		= "Rd",
+	[TYPEC_CC_RP_DEF]	= "Rp-def",
+	[TYPEC_CC_RP_1_5]	= "Rp-1.5",
+	[TYPEC_CC_RP_3_0]	= "Rp-3.0",
+};
+
+static const char *rp_unknown = "unknown";
+
+static const char *cc_to_name(enum typec_cc_status cc)
+{
+	if (cc > TYPEC_CC_RP_3_0)
+		return rp_unknown;
+
+	return typec_cc_status_name[cc];
+}
+
+static const char * const rp_sel_name[] = {
+	[TYPEC_SRC_RP_SEL_80UA]		= "Rp-def-80uA",
+	[TYPEC_SRC_RP_SEL_180UA]	= "Rp-1.5-180uA",
+	[TYPEC_SRC_RP_SEL_330UA]	= "Rp-3.0-330uA",
+};
+
+static const char *rp_sel_to_name(int rp_sel)
+{
+	if (rp_sel > TYPEC_SRC_RP_SEL_330UA)
+		return rp_unknown;
+
+	return rp_sel_name[rp_sel];
+}
+
+#define misc_to_cc(msic) !!(misc & CC_ORIENTATION) ? "cc1" : "cc2"
+#define misc_to_vconn(msic) !!(misc & CC_ORIENTATION) ? "cc2" : "cc1"
+
+static void qcom_pmic_tcpm_typec_cc_debounce(struct work_struct *work)
+{
+	struct pmic_typec *pmic_typec =
+		container_of(work, struct pmic_typec, cc_debounce_dwork.work);
+	unsigned long flags;
+
+	spin_lock_irqsave(&pmic_typec->lock, flags);
+	pmic_typec->debouncing_cc = false;
+	spin_unlock_irqrestore(&pmic_typec->lock, flags);
+
+	dev_dbg(pmic_typec->dev, "Debounce cc complete\n");
+}
+
+static irqreturn_t pmic_typec_isr(int irq, void *dev_id)
+{
+	struct pmic_typec_irq_data *irq_data = dev_id;
+	struct pmic_typec *pmic_typec = irq_data->pmic_typec;
+	u32 misc_stat;
+	bool vbus_change = false;
+	bool cc_change = false;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&pmic_typec->lock, flags);
+
+	ret = regmap_read(pmic_typec->regmap,
+			  pmic_typec->base + TYPEC_MISC_STATUS_REG,
+			  &misc_stat);
+	if (ret)
+		goto done;
+
+	switch (irq_data->virq) {
+	case PMIC_TYPEC_VBUS_IRQ:
+		/* Incoming vbus assert/de-assert detect */
+		vbus_change = true;
+		break;
+	case PMIC_TYPEC_CC_STATE_IRQ:
+		if (!pmic_typec->debouncing_cc)
+			cc_change = true;
+		break;
+	case PMIC_TYPEC_ATTACH_DETACH_IRQ:
+		if (!pmic_typec->debouncing_cc)
+			cc_change = true;
+		break;
+	}
+
+done:
+	spin_unlock_irqrestore(&pmic_typec->lock, flags);
+
+	if (vbus_change)
+		tcpm_vbus_change(pmic_typec->tcpm_port);
+
+	if (cc_change)
+		tcpm_cc_change(pmic_typec->tcpm_port);
+
+	return IRQ_HANDLED;
+}
+
+int qcom_pmic_tcpm_typec_get_vbus(struct pmic_typec *pmic_typec)
+{
+	struct device *dev = pmic_typec->dev;
+	unsigned int misc;
+	int ret;
+
+	ret = regmap_read(pmic_typec->regmap,
+			  pmic_typec->base + TYPEC_MISC_STATUS_REG,
+			  &misc);
+	if (ret)
+		misc = 0;
+
+	dev_dbg(dev, "get_vbus: 0x%08x detect %d\n", misc, !!(misc & TYPEC_VBUS_DETECT));
+
+	return !!(misc & TYPEC_VBUS_DETECT);
+}
+
+int qcom_pmic_tcpm_typec_set_vbus(struct pmic_typec *pmic_typec, bool on)
+{
+	u32 sm_stat;
+	u32 val;
+	int ret;
+
+	if (on) {
+		ret = regulator_enable(pmic_typec->vdd_vbus);
+		if (ret)
+			return ret;
+
+		val = TYPEC_SM_VBUS_VSAFE5V;
+	} else {
+		ret = regulator_disable(pmic_typec->vdd_vbus);
+		if (ret)
+			return ret;
+
+		val = TYPEC_SM_VBUS_VSAFE0V;
+	}
+
+	/* Poll waiting for transition to required vSafe5V or vSafe0V */
+	ret = regmap_read_poll_timeout(pmic_typec->regmap,
+				       pmic_typec->base + TYPEC_SM_STATUS_REG,
+				       sm_stat, sm_stat & val,
+				       100, 250000);
+	if (ret)
+		dev_err(pmic_typec->dev, "vbus vsafe%dv fail\n", on ? 5 : 0);
+
+	return ret;
+}
+
+int qcom_pmic_tcpm_typec_get_cc(struct pmic_typec *pmic_typec,
+				enum typec_cc_status *cc1,
+				enum typec_cc_status *cc2)
+{
+	struct device *dev = pmic_typec->dev;
+	unsigned int misc, val;
+	bool attached, debounced;
+	int ret = 0;
+
+	ret = regmap_read(pmic_typec->regmap,
+			  pmic_typec->base + TYPEC_MISC_STATUS_REG, &misc);
+	if (ret)
+		goto done;
+
+	attached = !!(misc & CC_ATTACHED);
+	debounced = !!(misc & TYPEC_DEBOUNCE_DONE);
+
+	if (pmic_typec->debouncing_cc) {
+		ret = -EBUSY;
+		goto done;
+	}
+
+	*cc1 = TYPEC_CC_OPEN;
+	*cc2 = TYPEC_CC_OPEN;
+
+	if (!(attached))
+		goto done;
+
+	if (misc & SNK_SRC_MODE) {
+		ret = regmap_read(pmic_typec->regmap,
+				  pmic_typec->base + TYPEC_SRC_STATUS_REG,
+				  &val);
+		if (ret)
+			goto done;
+		switch (val & DETECTED_SRC_TYPE_MASK) {
+		case SRC_RD_OPEN:
+			val = TYPEC_CC_RD;
+			break;
+		case SRC_RD_RA_VCONN:
+			val = TYPEC_CC_RD;
+			*cc1 = TYPEC_CC_RA;
+			*cc2 = TYPEC_CC_RA;
+			break;
+		default:
+			dev_warn(dev, "unexpected src status %.2x\n", val);
+			val = TYPEC_CC_RD;
+			break;
+		}
+	} else {
+		ret = regmap_read(pmic_typec->regmap,
+				  pmic_typec->base + TYPEC_SNK_STATUS_REG,
+				  &val);
+		if (ret)
+			goto done;
+		switch (val & DETECTED_SNK_TYPE_MASK) {
+		case SNK_RP_STD:
+			val = TYPEC_CC_RP_DEF;
+			break;
+		case SNK_RP_1P5:
+			val = TYPEC_CC_RP_1_5;
+			break;
+		case SNK_RP_3P0:
+			val = TYPEC_CC_RP_3_0;
+			break;
+		default:
+			dev_warn(dev, "unexpected snk status %.2x\n", val);
+			val = TYPEC_CC_RP_DEF;
+			break;
+		}
+		val = TYPEC_CC_RP_DEF;
+	}
+
+	if (misc & CC_ORIENTATION)
+		*cc2 = val;
+	else
+		*cc1 = val;
+
+done:
+	dev_dbg(dev, "get_cc: misc 0x%08x cc1 0x%08x %s cc2 0x%08x %s attached %d cc=%s\n",
+		misc, *cc1, cc_to_name(*cc1), *cc2, cc_to_name(*cc2), !!(misc & CC_ATTACHED),
+		misc_to_cc(misc));
+
+	return ret;
+}
+
+static void qcom_pmic_set_cc_debounce(struct pmic_typec *pmic_typec)
+{
+	pmic_typec->debouncing_cc = true;
+	schedule_delayed_work(&pmic_typec->cc_debounce_dwork,
+			      msecs_to_jiffies(2));
+}
+
+int qcom_pmic_tcpm_typec_set_cc(struct pmic_typec *pmic_typec,
+				enum typec_cc_status cc)
+{
+	struct device *dev = pmic_typec->dev;
+	unsigned int mode, currsrc;
+	unsigned int orientation, misc;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&pmic_typec->lock, flags);
+
+	ret = regmap_read(pmic_typec->regmap,
+			  pmic_typec->base + TYPEC_MISC_STATUS_REG,
+			  &misc);
+	if (ret)
+		goto done;
+
+	orientation = !!(misc & CC_ORIENTATION);
+
+	mode = EN_SRC_ONLY;
+
+	switch (cc) {
+	case TYPEC_CC_OPEN:
+		currsrc = TYPEC_SRC_RP_SEL_80UA;
+		break;
+	case TYPEC_CC_RP_DEF:
+		currsrc = TYPEC_SRC_RP_SEL_80UA;
+		break;
+	case TYPEC_CC_RP_1_5:
+		currsrc = TYPEC_SRC_RP_SEL_180UA;
+		break;
+	case TYPEC_CC_RP_3_0:
+		currsrc = TYPEC_SRC_RP_SEL_330UA;
+		break;
+	case TYPEC_CC_RD:
+		currsrc = TYPEC_SRC_RP_SEL_80UA;
+		mode = EN_SNK_ONLY;
+		break;
+	default:
+		dev_warn(dev, "unexpected set_cc %d\n", cc);
+		ret = -EINVAL;
+		goto done;
+	}
+
+	if (mode == EN_SRC_ONLY) {
+		ret = regmap_write(pmic_typec->regmap,
+				   pmic_typec->base + TYPEC_CURRSRC_CFG_REG,
+				   currsrc);
+		if (ret)
+			goto done;
+	}
+
+	pmic_typec->cc = cc;
+	qcom_pmic_set_cc_debounce(pmic_typec);
+	ret = 0;
+
+done:
+	spin_unlock_irqrestore(&pmic_typec->lock, flags);
+
+	dev_dbg(dev, "set_cc: currsrc=%x %s mode %s debounce %d attached %d cc=%s\n",
+		currsrc, rp_sel_to_name(currsrc),
+		mode == EN_SRC_ONLY ? "EN_SRC_ONLY" : "EN_SNK_ONLY",
+		pmic_typec->debouncing_cc, !!(misc & CC_ATTACHED),
+		misc_to_cc(misc));
+
+	return ret;
+}
+
+int qcom_pmic_tcpm_typec_set_vconn(struct pmic_typec *pmic_typec, bool on)
+{
+	struct device *dev = pmic_typec->dev;
+	unsigned int orientation, misc, mask, value;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&pmic_typec->lock, flags);
+
+	ret = regmap_read(pmic_typec->regmap,
+			  pmic_typec->base + TYPEC_MISC_STATUS_REG, &misc);
+	if (ret)
+		goto done;
+
+	/* Set VCONN on the inversion of the active CC channel */
+	orientation = (misc & CC_ORIENTATION) ? 0 : VCONN_EN_ORIENTATION;
+	if (on) {
+		mask = VCONN_EN_ORIENTATION | VCONN_EN_VALUE;
+		value = orientation | VCONN_EN_VALUE | VCONN_EN_SRC;
+	} else {
+		mask = VCONN_EN_VALUE;
+		value = 0;
+	}
+
+	ret = regmap_update_bits(pmic_typec->regmap,
+				 pmic_typec->base + TYPEC_VCONN_CONTROL_REG,
+				 mask, value);
+done:
+	spin_unlock_irqrestore(&pmic_typec->lock, flags);
+
+	dev_dbg(dev, "set_vconn: orientation %d control 0x%08x state %s cc %s vconn %s\n",
+		orientation, value, on ? "on" : "off", misc_to_vconn(misc), misc_to_cc(misc));
+
+	return ret;
+}
+
+int qcom_pmic_tcpm_typec_start_toggling(struct pmic_typec *pmic_typec,
+					enum typec_port_type port_type,
+					enum typec_cc_status cc)
+{
+	struct device *dev = pmic_typec->dev;
+	unsigned int misc;
+	u8 mode = 0;
+	unsigned long flags;
+	int ret;
+
+	switch (port_type) {
+	case TYPEC_PORT_SRC:
+		mode = EN_SRC_ONLY;
+		break;
+	case TYPEC_PORT_SNK:
+		mode = EN_SNK_ONLY;
+		break;
+	case TYPEC_PORT_DRP:
+		mode = EN_TRY_SNK;
+		break;
+	}
+
+	spin_lock_irqsave(&pmic_typec->lock, flags);
+
+	ret = regmap_read(pmic_typec->regmap,
+			  pmic_typec->base + TYPEC_MISC_STATUS_REG, &misc);
+	if (ret)
+		goto done;
+
+	dev_dbg(dev, "start_toggling: misc 0x%08x attached %d port_type %d current cc %d new %d\n",
+		misc, !!(misc & CC_ATTACHED), port_type, pmic_typec->cc, cc);
+
+	qcom_pmic_set_cc_debounce(pmic_typec);
+
+	/* force it to toggle at least once */
+	ret = regmap_write(pmic_typec->regmap,
+			   pmic_typec->base + TYPEC_MODE_CFG_REG,
+			   TYPEC_DISABLE_CMD);
+	if (ret)
+		goto done;
+	ret = regmap_write(pmic_typec->regmap,
+			   pmic_typec->base + TYPEC_MODE_CFG_REG,
+			   mode);
+done:
+	spin_unlock_irqrestore(&pmic_typec->lock, flags);
+
+	return ret;
+}
+
+#define TYPEC_INTR_EN_CFG_1_MASK		  \
+	(TYPEC_LEGACY_CABLE_INT_EN		| \
+	 TYPEC_NONCOMPLIANT_LEGACY_CABLE_INT_EN	| \
+	 TYPEC_TRYSOURCE_DETECT_INT_EN		| \
+	 TYPEC_TRYSINK_DETECT_INT_EN		| \
+	 TYPEC_CCOUT_DETACH_INT_EN		| \
+	 TYPEC_CCOUT_ATTACH_INT_EN		| \
+	 TYPEC_VBUS_DEASSERT_INT_EN		| \
+	 TYPEC_VBUS_ASSERT_INT_EN)
+
+#define TYPEC_INTR_EN_CFG_2_MASK \
+	(TYPEC_STATE_MACHINE_CHANGE_INT_EN | TYPEC_VBUS_ERROR_INT_EN | \
+	 TYPEC_DEBOUNCE_DONE_INT_EN)
+
+int qcom_pmic_tcpm_typec_init(struct pmic_typec *pmic_typec,
+			      struct tcpm_port *tcpm_port)
+{
+	int i;
+	int mask;
+	int ret;
+
+	/* Configure interrupt sources */
+	ret = regmap_write(pmic_typec->regmap,
+			   pmic_typec->base + TYPEC_INTERRUPT_EN_CFG_1_REG,
+			   TYPEC_INTR_EN_CFG_1_MASK);
+	if (ret)
+		goto done;
+
+	ret = regmap_write(pmic_typec->regmap,
+			   pmic_typec->base + TYPEC_INTERRUPT_EN_CFG_2_REG,
+			   TYPEC_INTR_EN_CFG_2_MASK);
+	if (ret)
+		goto done;
+
+	/* start in TRY_SNK mode */
+	ret = regmap_write(pmic_typec->regmap,
+			   pmic_typec->base + TYPEC_MODE_CFG_REG, EN_TRY_SNK);
+	if (ret)
+		goto done;
+
+	/* Configure VCONN for software control */
+	ret = regmap_update_bits(pmic_typec->regmap,
+				 pmic_typec->base + TYPEC_VCONN_CONTROL_REG,
+				 VCONN_EN_SRC | VCONN_EN_VALUE, VCONN_EN_SRC);
+	if (ret)
+		goto done;
+
+	/* Set CC threshold to 1.6 Volts | tPDdebounce = 10-20ms */
+	mask = SEL_SRC_UPPER_REF | USE_TPD_FOR_EXITING_ATTACHSRC;
+	ret = regmap_update_bits(pmic_typec->regmap,
+				 pmic_typec->base + TYPEC_EXIT_STATE_CFG_REG,
+				 mask, mask);
+	if (ret)
+		goto done;
+
+	pmic_typec->tcpm_port = tcpm_port;
+
+	for (i = 0; i < pmic_typec->nr_irqs; i++)
+		enable_irq(pmic_typec->irq_data[i].irq);
+
+done:
+	return ret;
+}
+
+void qcom_pmic_tcpm_typec_put(struct pmic_typec *pmic_typec)
+{
+	put_device(pmic_typec->dev);
+}
+
+static int qcom_pmic_tcpm_typec_probe(struct platform_device *pdev)
+{
+	struct pmic_typec *pmic_typec;
+	struct device *dev = &pdev->dev;
+	const struct pmic_typec_resources *res;
+	struct pmic_typec_irq_data *irq_data;
+	int i, ret, irq;
+	u32 reg;
+
+	ret = device_property_read_u32(dev, "reg", &reg);
+	if (ret < 0) {
+		dev_err(dev, "missing base address\n");
+		return ret;
+	}
+
+	res = of_device_get_match_data(dev);
+	if (!res)
+		return -ENODEV;
+
+	if (!res->nr_irqs || res->nr_irqs > PMIC_TYPEC_MAX_IRQS)
+		return -EINVAL;
+
+	pmic_typec = devm_kzalloc(dev, sizeof(*pmic_typec), GFP_KERNEL);
+	if (!pmic_typec)
+		return -ENOMEM;
+
+	irq_data = devm_kzalloc(dev, sizeof(*irq_data) * res->nr_irqs,
+				GFP_KERNEL);
+	if (!irq_data)
+		return -ENOMEM;
+
+	pmic_typec->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
+	if (IS_ERR(pmic_typec->vdd_vbus))
+		return PTR_ERR(pmic_typec->vdd_vbus);
+
+	pmic_typec->dev = dev;
+	pmic_typec->base = reg;
+	pmic_typec->nr_irqs = res->nr_irqs;
+	pmic_typec->irq_data = irq_data;
+	spin_lock_init(&pmic_typec->lock);
+	INIT_DELAYED_WORK(&pmic_typec->cc_debounce_dwork,
+			  qcom_pmic_tcpm_typec_cc_debounce);
+
+	pmic_typec->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!pmic_typec->regmap) {
+		dev_err(dev, "Failed to get regmap\n");
+		return -ENODEV;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	platform_set_drvdata(pdev, pmic_typec);
+
+	for (i = 0; i < res->nr_irqs; i++, irq_data++) {
+		irq = platform_get_irq_byname(pdev,
+					      res->irq_params[i].irq_name);
+		if (irq < 0)
+			return irq;
+
+		irq_data->pmic_typec = pmic_typec;
+		irq_data->irq = irq;
+		irq_data->virq = res->irq_params[i].virq;
+		ret = devm_request_threaded_irq(dev, irq, NULL, pmic_typec_isr,
+						IRQF_ONESHOT | IRQF_NO_AUTOEN,
+						res->irq_params[i].irq_name,
+						irq_data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct pmic_typec_resources pm8150b_typec_res = {
+	.irq_params = {
+		{
+			.irq_name = "pmic-typec-vpd-detect",
+			.virq = PMIC_TYPEC_VPD_IRQ,
+		},
+
+		{
+			.irq_name = "pmic-typec-cc-state-change",
+			.virq = PMIC_TYPEC_CC_STATE_IRQ,
+		},
+		{
+			.irq_name = "pmic-typec-vconn-oc",
+			.virq = PMIC_TYPEC_VCONN_OC_IRQ,
+		},
+
+		{
+			.irq_name = "pmic-typec-vbus-change",
+			.virq = PMIC_TYPEC_VBUS_IRQ,
+		},
+
+		{
+			.irq_name = "pmic-typec-attach-detach",
+			.virq = PMIC_TYPEC_ATTACH_DETACH_IRQ,
+		},
+		{
+			.irq_name = "pmic-typec-legacy-cable-detect",
+			.virq = PMIC_TYPEC_LEGACY_CABLE_IRQ,
+		},
+
+		{
+			.irq_name = "pmic-typec-try-snk-src-detect",
+			.virq = PMIC_TYPEC_TRY_SNK_SRC_IRQ,
+		},
+	},
+	.nr_irqs = 7,
+};
+
+static const struct of_device_id qcom_pmic_tcpm_typec_table[] = {
+	{ .compatible = "qcom,pm8150b-typec", .data = &pm8150b_typec_res },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_pmic_tcpm_typec_table);
+
+struct platform_driver qcom_pmic_tcpm_typec_platform_driver = {
+	.driver = {
+		.name = "qcom,pmic-typec",
+		.of_match_table = qcom_pmic_tcpm_typec_table,
+	},
+	.probe = qcom_pmic_tcpm_typec_probe,
+};
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.h
new file mode 100644
index 0000000000000..d0e683e4bff46
--- /dev/null
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Linaro Ltd. All rights reserved.
+ */
+#ifndef __QCOM_PMIC_TYPEC_H__
+#define __QCOM_PMIC_TYPEC_H__
+
+#include <linux/usb/tcpm.h>
+
+#define TYPEC_SNK_STATUS_REG				0x06
+#define DETECTED_SNK_TYPE_MASK				GENMASK(6, 0)
+#define SNK_DAM_MASK					GENMASK(6, 4)
+#define SNK_DAM_500MA					BIT(6)
+#define SNK_DAM_1500MA					BIT(5)
+#define SNK_DAM_3000MA					BIT(4)
+#define SNK_RP_STD					BIT(3)
+#define SNK_RP_1P5					BIT(2)
+#define SNK_RP_3P0					BIT(1)
+#define SNK_RP_SHORT					BIT(0)
+
+#define TYPEC_SRC_STATUS_REG				0x08
+#define DETECTED_SRC_TYPE_MASK				GENMASK(4, 0)
+#define SRC_HIGH_BATT					BIT(5)
+#define SRC_DEBUG_ACCESS				BIT(4)
+#define SRC_RD_OPEN					BIT(3)
+#define SRC_RD_RA_VCONN					BIT(2)
+#define SRC_RA_OPEN					BIT(1)
+#define AUDIO_ACCESS_RA_RA				BIT(0)
+
+#define TYPEC_STATE_MACHINE_STATUS_REG			0x09
+#define TYPEC_ATTACH_DETACH_STATE			BIT(5)
+
+#define TYPEC_SM_STATUS_REG				0x0A
+#define TYPEC_SM_VBUS_VSAFE5V				BIT(5)
+#define TYPEC_SM_VBUS_VSAFE0V				BIT(6)
+#define TYPEC_SM_USBIN_LT_LV				BIT(7)
+
+#define TYPEC_MISC_STATUS_REG				0x0B
+#define TYPEC_WATER_DETECTION_STATUS			BIT(7)
+#define SNK_SRC_MODE					BIT(6)
+#define TYPEC_VBUS_DETECT				BIT(5)
+#define TYPEC_VBUS_ERROR_STATUS				BIT(4)
+#define TYPEC_DEBOUNCE_DONE				BIT(3)
+#define CC_ORIENTATION					BIT(1)
+#define CC_ATTACHED					BIT(0)
+
+#define LEGACY_CABLE_STATUS_REG				0x0D
+#define TYPEC_LEGACY_CABLE_STATUS			BIT(1)
+#define TYPEC_NONCOMP_LEGACY_CABLE_STATUS		BIT(0)
+
+#define TYPEC_U_USB_STATUS_REG				0x0F
+#define U_USB_GROUND_NOVBUS				BIT(6)
+#define U_USB_GROUND					BIT(4)
+#define U_USB_FMB1					BIT(3)
+#define U_USB_FLOAT1					BIT(2)
+#define U_USB_FMB2					BIT(1)
+#define U_USB_FLOAT2					BIT(0)
+
+#define TYPEC_MODE_CFG_REG				0x44
+#define TYPEC_TRY_MODE_MASK				GENMASK(4, 3)
+#define EN_TRY_SNK					BIT(4)
+#define EN_TRY_SRC					BIT(3)
+#define TYPEC_POWER_ROLE_CMD_MASK			GENMASK(2, 0)
+#define EN_SRC_ONLY					BIT(2)
+#define EN_SNK_ONLY					BIT(1)
+#define TYPEC_DISABLE_CMD				BIT(0)
+
+#define TYPEC_VCONN_CONTROL_REG				0x46
+#define VCONN_EN_ORIENTATION				BIT(2)
+#define VCONN_EN_VALUE					BIT(1)
+#define VCONN_EN_SRC					BIT(0)
+
+#define TYPEC_CCOUT_CONTROL_REG				0x48
+#define TYPEC_CCOUT_BUFFER_EN				BIT(2)
+#define TYPEC_CCOUT_VALUE				BIT(1)
+#define TYPEC_CCOUT_SRC					BIT(0)
+
+#define DEBUG_ACCESS_SRC_CFG_REG			0x4C
+#define EN_UNORIENTED_DEBUG_ACCESS_SRC			BIT(0)
+
+#define TYPE_C_CRUDE_SENSOR_CFG_REG			0x4e
+#define EN_SRC_CRUDE_SENSOR				BIT(1)
+#define EN_SNK_CRUDE_SENSOR				BIT(0)
+
+#define TYPEC_EXIT_STATE_CFG_REG			0x50
+#define BYPASS_VSAFE0V_DURING_ROLE_SWAP			BIT(3)
+#define SEL_SRC_UPPER_REF				BIT(2)
+#define USE_TPD_FOR_EXITING_ATTACHSRC			BIT(1)
+#define EXIT_SNK_BASED_ON_CC				BIT(0)
+
+#define TYPEC_CURRSRC_CFG_REG				0x52
+#define TYPEC_SRC_RP_SEL_330UA				BIT(1)
+#define TYPEC_SRC_RP_SEL_180UA				BIT(0)
+#define TYPEC_SRC_RP_SEL_80UA				0
+#define TYPEC_SRC_RP_SEL_MASK				GENMASK(1, 0)
+
+#define TYPEC_INTERRUPT_EN_CFG_1_REG			0x5E
+#define TYPEC_LEGACY_CABLE_INT_EN			BIT(7)
+#define TYPEC_NONCOMPLIANT_LEGACY_CABLE_INT_EN		BIT(6)
+#define TYPEC_TRYSOURCE_DETECT_INT_EN			BIT(5)
+#define TYPEC_TRYSINK_DETECT_INT_EN			BIT(4)
+#define TYPEC_CCOUT_DETACH_INT_EN			BIT(3)
+#define TYPEC_CCOUT_ATTACH_INT_EN			BIT(2)
+#define TYPEC_VBUS_DEASSERT_INT_EN			BIT(1)
+#define TYPEC_VBUS_ASSERT_INT_EN			BIT(0)
+
+#define TYPEC_INTERRUPT_EN_CFG_2_REG			0x60
+#define TYPEC_SRC_BATT_HPWR_INT_EN			BIT(6)
+#define MICRO_USB_STATE_CHANGE_INT_EN			BIT(5)
+#define TYPEC_STATE_MACHINE_CHANGE_INT_EN		BIT(4)
+#define TYPEC_DEBUG_ACCESS_DETECT_INT_EN		BIT(3)
+#define TYPEC_WATER_DETECTION_INT_EN			BIT(2)
+#define TYPEC_VBUS_ERROR_INT_EN				BIT(1)
+#define TYPEC_DEBOUNCE_DONE_INT_EN			BIT(0)
+
+#define TYPEC_DEBOUNCE_OPTION_REG			0x62
+#define REDUCE_TCCDEBOUNCE_TO_2MS			BIT(2)
+
+#define TYPE_C_SBU_CFG_REG				0x6A
+#define SEL_SBU1_ISRC_VAL				0x04
+#define SEL_SBU2_ISRC_VAL				0x01
+
+#define TYPEC_U_USB_CFG_REG				0x70
+#define EN_MICRO_USB_FACTORY_MODE			BIT(1)
+#define EN_MICRO_USB_MODE				BIT(0)
+
+#define TYPEC_PMI632_U_USB_WATER_PROTECTION_CFG_REG	0x72
+
+#define TYPEC_U_USB_WATER_PROTECTION_CFG_REG		0x73
+#define EN_MICRO_USB_WATER_PROTECTION			BIT(4)
+#define MICRO_USB_DETECTION_ON_TIME_CFG_MASK		GENMASK(3, 2)
+#define MICRO_USB_DETECTION_PERIOD_CFG_MASK		GENMASK(1, 0)
+
+#define TYPEC_PMI632_MICRO_USB_MODE_REG			0x73
+#define MICRO_USB_MODE_ONLY				BIT(0)
+
+struct pmic_typec;
+extern struct platform_driver qcom_pmic_tcpm_typec_platform_driver;
+
+int qcom_pmic_tcpm_typec_init(struct pmic_typec *pmic_typec,
+			      struct tcpm_port *tcpm_port);
+
+void qcom_pmic_tcpm_typec_put(struct pmic_typec *pmic_typec);
+
+int qcom_pmic_tcpm_typec_get_cc(struct pmic_typec *pmic_typec,
+				enum typec_cc_status *cc1,
+				enum typec_cc_status *cc2);
+
+int qcom_pmic_tcpm_typec_set_cc(struct pmic_typec *pmic_typec,
+				enum typec_cc_status cc);
+
+int qcom_pmic_tcpm_typec_get_vbus(struct pmic_typec *pmic_typec);
+
+int qcom_pmic_tcpm_typec_set_vconn(struct pmic_typec *pmic_typec, bool on);
+
+int qcom_pmic_tcpm_typec_start_toggling(struct pmic_typec *pmic_typec,
+					enum typec_port_type port_type,
+					enum typec_cc_status cc);
+
+int qcom_pmic_tcpm_typec_set_vbus(struct pmic_typec *pmic_typec, bool on);
+
+#endif /* __QCOM_PMIC_TYPE_C_H__ */
-- 
2.33.0

