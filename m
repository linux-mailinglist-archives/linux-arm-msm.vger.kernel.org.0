Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC23445EBC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 04:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbhKEDgu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 23:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbhKEDgq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 23:36:46 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0452C061203
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Nov 2021 20:34:07 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so5620832wmd.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 20:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1KDwyqjxyM/l18MCPjnoKkld+3MEIXuJxajrxA4Klf4=;
        b=N5oYxcB6pORExX3NwH6WRfkAHwvchkKLmdC2VJ2nvuYJ3KGwtSS/aul2yZ8uVuJ7Fj
         WEyNtM+EvRnVtUMZnvULcjNYvagpwgKKd9AcSeZDMxOGoJW4yLj/uhT1sRY0P43qJFZY
         FAyaYvojFaj+Ejc1IxiP6ZEPQ7ElafVi1jDOKGRWTNUj6oUVnwHZBp5SF2OGFJtw40Q2
         DWbTXyadkeikuySnjho74HhsTg5Jg3e+9R/gK5ugLQog25iNUQkCA5QGdGlOJIjn6Unp
         nB9vmwh8QC92WoAXgGmCCdFvsn7zTCpcf4gUtJiNHBzgsn3gDA8x9kvHOYj1BgGrIWnC
         2Cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1KDwyqjxyM/l18MCPjnoKkld+3MEIXuJxajrxA4Klf4=;
        b=7kgai80A0BCoQbAfdECQpaFV21uptAAOBlAiMa8ZoPc7V4mHnsXtDviKE/UftGNv8v
         k1xRouUNQP+Pr4okgUdSMQzxs0ehPFJQXfSNV6Z9OE09ee8pUTHOf4G5DsaFmjSIy2mw
         +mpHjNVf74m2XPardJFzWM4uuiEvqA+bzy07t+1IsdrC5VCaSyqEwqi8A4tTh5TrqFJK
         FxxZBYsnrJ8e9EYApnOzvRZeWh8rcbUsBK0bZnTfHvbt4YUbXTnRW62r7uDkH2Nhu/7B
         pzs2nsaj0bfl4tSABHD9UINV/OWHcRMgxlOif9geaLKKfyNjNc3e+F/vX1RJhPH/0IyG
         N/Cw==
X-Gm-Message-State: AOAM531tTmFfXdyhRMLu504f/8TzQnu+gxjyHHmbqzF8o0+rO2Dv8YCk
        AvMUze3zJ9zNcY8537ozJSsRag==
X-Google-Smtp-Source: ABdhPJzadGBDbTaISgn5FjbDRiRna4xpO+Ix1uLQWToODu+ksywG+hlJvRfilDb39hxZHynxKYD0cA==
X-Received: by 2002:a05:600c:a45:: with SMTP id c5mr27535108wmq.79.1636083246322;
        Thu, 04 Nov 2021 20:34:06 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l15sm2546296wme.47.2021.11.04.20.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 20:34:05 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 6/7] usb: typec: qcom: Remove standalone qcom pm8150b typec driver
Date:   Fri,  5 Nov 2021 03:35:57 +0000
Message-Id: <20211105033558.1573552-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove the standalone PMIC Type-C driver. We have implemented a full TCPM
driver which covers and extends the functionality in this driver.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/typec/Kconfig           |  13 --
 drivers/usb/typec/Makefile          |   1 -
 drivers/usb/typec/qcom-pmic-typec.c | 262 ----------------------------
 3 files changed, 276 deletions(-)
 delete mode 100644 drivers/usb/typec/qcom-pmic-typec.c

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index ab480f38523aa..61fba7bd1671d 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -75,19 +75,6 @@ config TYPEC_STUSB160X
 	  If you choose to build this driver as a dynamically linked module, the
 	  module will be called stusb160x.ko.
 
-config TYPEC_QCOM_PMIC
-	tristate "Qualcomm PMIC USB Type-C driver"
-	depends on ARCH_QCOM || COMPILE_TEST
-	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
-	help
-	  Driver for supporting role switch over the Qualcomm PMIC.  This will
-	  handle the USB Type-C role and orientation detection reported by the
-	  QCOM PMIC if the PMIC has the capability to handle USB Type-C
-	  detection.
-
-	  It will also enable the VBUS output to connected devices when a
-	  DFP connection is made.
-
 source "drivers/usb/typec/mux/Kconfig"
 
 source "drivers/usb/typec/altmodes/Kconfig"
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index a0adb8947a301..4dc7fc91159df 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -6,6 +6,5 @@ obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
 obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
 obj-$(CONFIG_TYPEC_TPS6598X)	+= tipd/
 obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
-obj-$(CONFIG_TYPEC_QCOM_PMIC)	+= qcom-pmic-typec.o
 obj-$(CONFIG_TYPEC_STUSB160X) 	+= stusb160x.o
 obj-$(CONFIG_TYPEC)		+= mux/
diff --git a/drivers/usb/typec/qcom-pmic-typec.c b/drivers/usb/typec/qcom-pmic-typec.c
deleted file mode 100644
index a0454a80c4a21..0000000000000
--- a/drivers/usb/typec/qcom-pmic-typec.c
+++ /dev/null
@@ -1,262 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2020, The Linux Foundation. All rights reserved.
- */
-
-#include <linux/err.h>
-#include <linux/interrupt.h>
-#include <linux/kernel.h>
-#include <linux/mod_devicetable.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-#include <linux/regulator/consumer.h>
-#include <linux/slab.h>
-#include <linux/usb/role.h>
-#include <linux/usb/typec_mux.h>
-
-#define TYPEC_MISC_STATUS		0xb
-#define CC_ATTACHED			BIT(0)
-#define CC_ORIENTATION			BIT(1)
-#define SNK_SRC_MODE			BIT(6)
-#define TYPEC_MODE_CFG			0x44
-#define TYPEC_DISABLE_CMD		BIT(0)
-#define EN_SNK_ONLY			BIT(1)
-#define EN_SRC_ONLY			BIT(2)
-#define TYPEC_VCONN_CONTROL		0x46
-#define VCONN_EN_SRC			BIT(0)
-#define VCONN_EN_VAL			BIT(1)
-#define TYPEC_EXIT_STATE_CFG		0x50
-#define SEL_SRC_UPPER_REF		BIT(2)
-#define TYPEC_INTR_EN_CFG_1		0x5e
-#define TYPEC_INTR_EN_CFG_1_MASK	GENMASK(7, 0)
-
-struct qcom_pmic_typec {
-	struct device		*dev;
-	struct regmap		*regmap;
-	u32			base;
-
-	struct typec_port	*port;
-	struct usb_role_switch *role_sw;
-
-	struct regulator	*vbus_reg;
-	bool			vbus_enabled;
-};
-
-static void qcom_pmic_typec_enable_vbus_regulator(struct qcom_pmic_typec
-							*qcom_usb, bool enable)
-{
-	int ret;
-
-	if (enable == qcom_usb->vbus_enabled)
-		return;
-
-	if (enable) {
-		ret = regulator_enable(qcom_usb->vbus_reg);
-		if (ret)
-			return;
-	} else {
-		ret = regulator_disable(qcom_usb->vbus_reg);
-		if (ret)
-			return;
-	}
-	qcom_usb->vbus_enabled = enable;
-}
-
-static void qcom_pmic_typec_check_connection(struct qcom_pmic_typec *qcom_usb)
-{
-	enum typec_orientation orientation;
-	enum usb_role role;
-	unsigned int stat;
-	bool enable_vbus;
-
-	regmap_read(qcom_usb->regmap, qcom_usb->base + TYPEC_MISC_STATUS,
-		    &stat);
-
-	if (stat & CC_ATTACHED) {
-		orientation = (stat & CC_ORIENTATION) ?
-				TYPEC_ORIENTATION_REVERSE :
-				TYPEC_ORIENTATION_NORMAL;
-		typec_set_orientation(qcom_usb->port, orientation);
-
-		role = (stat & SNK_SRC_MODE) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
-		if (role == USB_ROLE_HOST)
-			enable_vbus = true;
-		else
-			enable_vbus = false;
-	} else {
-		role = USB_ROLE_NONE;
-		enable_vbus = false;
-	}
-
-	qcom_pmic_typec_enable_vbus_regulator(qcom_usb, enable_vbus);
-	usb_role_switch_set_role(qcom_usb->role_sw, role);
-}
-
-static irqreturn_t qcom_pmic_typec_interrupt(int irq, void *_qcom_usb)
-{
-	struct qcom_pmic_typec *qcom_usb = _qcom_usb;
-
-	qcom_pmic_typec_check_connection(qcom_usb);
-	return IRQ_HANDLED;
-}
-
-static void qcom_pmic_typec_typec_hw_init(struct qcom_pmic_typec *qcom_usb,
-					  enum typec_port_type type)
-{
-	u8 mode = 0;
-
-	regmap_update_bits(qcom_usb->regmap,
-			   qcom_usb->base + TYPEC_INTR_EN_CFG_1,
-			   TYPEC_INTR_EN_CFG_1_MASK, 0);
-
-	if (type == TYPEC_PORT_SRC)
-		mode = EN_SRC_ONLY;
-	else if (type == TYPEC_PORT_SNK)
-		mode = EN_SNK_ONLY;
-
-	regmap_update_bits(qcom_usb->regmap, qcom_usb->base + TYPEC_MODE_CFG,
-			   EN_SNK_ONLY | EN_SRC_ONLY, mode);
-
-	regmap_update_bits(qcom_usb->regmap,
-			   qcom_usb->base + TYPEC_VCONN_CONTROL,
-			   VCONN_EN_SRC | VCONN_EN_VAL, VCONN_EN_SRC);
-	regmap_update_bits(qcom_usb->regmap,
-			   qcom_usb->base + TYPEC_EXIT_STATE_CFG,
-			   SEL_SRC_UPPER_REF, SEL_SRC_UPPER_REF);
-}
-
-static int qcom_pmic_typec_probe(struct platform_device *pdev)
-{
-	struct qcom_pmic_typec *qcom_usb;
-	struct device *dev = &pdev->dev;
-	struct fwnode_handle *fwnode;
-	struct typec_capability cap;
-	const char *buf;
-	int ret, irq, role;
-	u32 reg;
-
-	ret = device_property_read_u32(dev, "reg", &reg);
-	if (ret < 0) {
-		dev_err(dev, "missing base address\n");
-		return ret;
-	}
-
-	qcom_usb = devm_kzalloc(dev, sizeof(*qcom_usb), GFP_KERNEL);
-	if (!qcom_usb)
-		return -ENOMEM;
-
-	qcom_usb->dev = dev;
-	qcom_usb->base = reg;
-
-	qcom_usb->regmap = dev_get_regmap(dev->parent, NULL);
-	if (!qcom_usb->regmap) {
-		dev_err(dev, "Failed to get regmap\n");
-		return -EINVAL;
-	}
-
-	qcom_usb->vbus_reg = devm_regulator_get(qcom_usb->dev, "usb_vbus");
-	if (IS_ERR(qcom_usb->vbus_reg))
-		return PTR_ERR(qcom_usb->vbus_reg);
-
-	fwnode = device_get_named_child_node(dev, "connector");
-	if (!fwnode)
-		return -EINVAL;
-
-	ret = fwnode_property_read_string(fwnode, "power-role", &buf);
-	if (!ret) {
-		role = typec_find_port_power_role(buf);
-		if (role < 0)
-			role = TYPEC_PORT_SNK;
-	} else {
-		role = TYPEC_PORT_SNK;
-	}
-	cap.type = role;
-
-	ret = fwnode_property_read_string(fwnode, "data-role", &buf);
-	if (!ret) {
-		role = typec_find_port_data_role(buf);
-		if (role < 0)
-			role = TYPEC_PORT_UFP;
-	} else {
-		role = TYPEC_PORT_UFP;
-	}
-	cap.data = role;
-
-	cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
-	cap.fwnode = fwnode;
-	qcom_usb->port = typec_register_port(dev, &cap);
-	if (IS_ERR(qcom_usb->port)) {
-		ret = PTR_ERR(qcom_usb->port);
-		dev_err(dev, "Failed to register type c port %d\n", ret);
-		goto err_put_node;
-	}
-	fwnode_handle_put(fwnode);
-
-	qcom_usb->role_sw = fwnode_usb_role_switch_get(dev_fwnode(qcom_usb->dev));
-	if (IS_ERR(qcom_usb->role_sw)) {
-		if (PTR_ERR(qcom_usb->role_sw) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get role switch\n");
-		ret = PTR_ERR(qcom_usb->role_sw);
-		goto err_typec_port;
-	}
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		goto err_usb_role_sw;
-
-	ret = devm_request_threaded_irq(qcom_usb->dev, irq, NULL,
-					qcom_pmic_typec_interrupt, IRQF_ONESHOT,
-					"qcom-pmic-typec", qcom_usb);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not request IRQ\n");
-		goto err_usb_role_sw;
-	}
-
-	platform_set_drvdata(pdev, qcom_usb);
-	qcom_pmic_typec_typec_hw_init(qcom_usb, cap.type);
-	qcom_pmic_typec_check_connection(qcom_usb);
-
-	return 0;
-
-err_usb_role_sw:
-	usb_role_switch_put(qcom_usb->role_sw);
-err_typec_port:
-	typec_unregister_port(qcom_usb->port);
-err_put_node:
-	fwnode_handle_put(fwnode);
-
-	return ret;
-}
-
-static int qcom_pmic_typec_remove(struct platform_device *pdev)
-{
-	struct qcom_pmic_typec *qcom_usb = platform_get_drvdata(pdev);
-
-	usb_role_switch_set_role(qcom_usb->role_sw, USB_ROLE_NONE);
-	qcom_pmic_typec_enable_vbus_regulator(qcom_usb, 0);
-
-	typec_unregister_port(qcom_usb->port);
-	usb_role_switch_put(qcom_usb->role_sw);
-
-	return 0;
-}
-
-static const struct of_device_id qcom_pmic_typec_table[] = {
-	{ .compatible = "qcom,pm8150b-usb-typec" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, qcom_pmic_typec_table);
-
-static struct platform_driver qcom_pmic_typec = {
-	.driver = {
-		.name = "qcom,pmic-typec",
-		.of_match_table = qcom_pmic_typec_table,
-	},
-	.probe = qcom_pmic_typec_probe,
-	.remove = qcom_pmic_typec_remove,
-};
-module_platform_driver(qcom_pmic_typec);
-
-MODULE_DESCRIPTION("QCOM PMIC USB type C driver");
-MODULE_LICENSE("GPL v2");
-- 
2.33.0

