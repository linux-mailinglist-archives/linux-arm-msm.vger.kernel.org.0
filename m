Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0EB27B7F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 01:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgI1XTd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 19:19:33 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:34048 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726958AbgI1XTX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 19:19:23 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Sep 2020 15:49:11 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg05-sd.qualcomm.com with ESMTP; 28 Sep 2020 15:49:10 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id EB5A0196D; Mon, 28 Sep 2020 15:49:10 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Kavya Nunna <knunna@codeaurora.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [RESEND PATCH v1 2/2] extcon: qcom-spmi: Add support for VBUS detection
Date:   Mon, 28 Sep 2020 15:49:09 -0700
Message-Id: <0f1784d1091bcdc9fb36ba4f33f1c35d61196a13.1601333246.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1601333246.git.gurus@codeaurora.org>
References: <cover.1601333246.git.gurus@codeaurora.org>
In-Reply-To: <cover.1601333246.git.gurus@codeaurora.org>
References: <cover.1601333246.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Anirudh Ghayal <aghayal@codeaurora.org>

VBUS can be detected via a dedicated PMIC pin. Add support
for reporting the VBUS status.

Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
Signed-off-by: Kavya Nunna <knunna@codeaurora.org>
Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/extcon/extcon-qcom-spmi-misc.c | 100 ++++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 19 deletions(-)

diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extcon-qcom-spmi-misc.c
index 6b836ae..6bd6746 100644
--- a/drivers/extcon/extcon-qcom-spmi-misc.c
+++ b/drivers/extcon/extcon-qcom-spmi-misc.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /**
  * extcon-qcom-spmi-misc.c - Qualcomm USB extcon driver to support USB ID
- *				detection based on extcon-usb-gpio.c.
+ *			and VBUS detection based on extcon-usb-gpio.c.
  *
  * Copyright (C) 2016 Linaro, Ltd.
  * Stephen Boyd <stephen.boyd@linaro.org>
@@ -21,30 +21,56 @@
 
 struct qcom_usb_extcon_info {
 	struct extcon_dev *edev;
-	int irq;
+	int id_irq;
+	int vbus_irq;
 	struct delayed_work wq_detcable;
 	unsigned long debounce_jiffies;
 };
 
 static const unsigned int qcom_usb_extcon_cable[] = {
+	EXTCON_USB,
 	EXTCON_USB_HOST,
 	EXTCON_NONE,
 };
 
 static void qcom_usb_extcon_detect_cable(struct work_struct *work)
 {
-	bool id;
+	bool state = false;
 	int ret;
+	union extcon_property_value val;
 	struct qcom_usb_extcon_info *info = container_of(to_delayed_work(work),
 						    struct qcom_usb_extcon_info,
 						    wq_detcable);
 
-	/* check ID and update cable state */
-	ret = irq_get_irqchip_state(info->irq, IRQCHIP_STATE_LINE_LEVEL, &id);
-	if (ret)
-		return;
+	if (info->id_irq > 0) {
+		/* check ID and update cable state */
+		ret = irq_get_irqchip_state(info->id_irq,
+				IRQCHIP_STATE_LINE_LEVEL, &state);
+		if (ret)
+			return;
+
+		if (!state) {
+			val.intval = true;
+			extcon_set_property(info->edev, EXTCON_USB_HOST,
+						EXTCON_PROP_USB_SS, val);
+		}
+		extcon_set_state_sync(info->edev, EXTCON_USB_HOST, !state);
+	}
 
-	extcon_set_state_sync(info->edev, EXTCON_USB_HOST, !id);
+	if (info->vbus_irq > 0) {
+		/* check VBUS and update cable state */
+		ret = irq_get_irqchip_state(info->vbus_irq,
+				IRQCHIP_STATE_LINE_LEVEL, &state);
+		if (ret)
+			return;
+
+		if (state) {
+			val.intval = true;
+			extcon_set_property(info->edev, EXTCON_USB,
+						EXTCON_PROP_USB_SS, val);
+		}
+		extcon_set_state_sync(info->edev, EXTCON_USB, state);
+	}
 }
 
 static irqreturn_t qcom_usb_irq_handler(int irq, void *dev_id)
@@ -79,21 +105,48 @@ static int qcom_usb_extcon_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = extcon_set_property_capability(info->edev,
+			EXTCON_USB, EXTCON_PROP_USB_SS);
+	ret |= extcon_set_property_capability(info->edev,
+			EXTCON_USB_HOST, EXTCON_PROP_USB_SS);
+	if (ret) {
+		dev_err(dev, "failed to register extcon props rc=%d\n",
+						ret);
+		return ret;
+	}
+
 	info->debounce_jiffies = msecs_to_jiffies(USB_ID_DEBOUNCE_MS);
 	INIT_DELAYED_WORK(&info->wq_detcable, qcom_usb_extcon_detect_cable);
 
-	info->irq = platform_get_irq_byname(pdev, "usb_id");
-	if (info->irq < 0)
-		return info->irq;
+	info->id_irq = platform_get_irq_byname(pdev, "usb_id");
+	if (info->id_irq > 0) {
+		ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
+					qcom_usb_irq_handler,
+					IRQF_TRIGGER_RISING |
+					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					pdev->name, info);
+		if (ret < 0) {
+			dev_err(dev, "failed to request handler for ID IRQ\n");
+			return ret;
+		}
+	}
 
-	ret = devm_request_threaded_irq(dev, info->irq, NULL,
+	info->vbus_irq = platform_get_irq_byname(pdev, "usb_vbus");
+	if (info->vbus_irq > 0) {
+		ret = devm_request_threaded_irq(dev, info->vbus_irq, NULL,
 					qcom_usb_irq_handler,
 					IRQF_TRIGGER_RISING |
 					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 					pdev->name, info);
-	if (ret < 0) {
-		dev_err(dev, "failed to request handler for ID IRQ\n");
-		return ret;
+		if (ret < 0) {
+			dev_err(dev, "failed to request handler for VBUS IRQ\n");
+			return ret;
+		}
+	}
+
+	if (info->id_irq < 0 && info->vbus_irq < 0) {
+		dev_err(dev, "ID and VBUS IRQ not found\n");
+		return -EINVAL;
 	}
 
 	platform_set_drvdata(pdev, info);
@@ -120,8 +173,12 @@ static int qcom_usb_extcon_suspend(struct device *dev)
 	struct qcom_usb_extcon_info *info = dev_get_drvdata(dev);
 	int ret = 0;
 
-	if (device_may_wakeup(dev))
-		ret = enable_irq_wake(info->irq);
+	if (device_may_wakeup(dev)) {
+		if (info->id_irq > 0)
+			ret = enable_irq_wake(info->id_irq);
+		if (info->vbus_irq > 0)
+			ret = enable_irq_wake(info->vbus_irq);
+	}
 
 	return ret;
 }
@@ -131,8 +188,12 @@ static int qcom_usb_extcon_resume(struct device *dev)
 	struct qcom_usb_extcon_info *info = dev_get_drvdata(dev);
 	int ret = 0;
 
-	if (device_may_wakeup(dev))
-		ret = disable_irq_wake(info->irq);
+	if (device_may_wakeup(dev)) {
+		if (info->id_irq > 0)
+			ret = disable_irq_wake(info->id_irq);
+		if (info->vbus_irq > 0)
+			ret = disable_irq_wake(info->vbus_irq);
+	}
 
 	return ret;
 }
@@ -143,6 +204,7 @@ static SIMPLE_DEV_PM_OPS(qcom_usb_extcon_pm_ops,
 
 static const struct of_device_id qcom_usb_extcon_dt_match[] = {
 	{ .compatible = "qcom,pm8941-misc", },
+	{ .compatible = "qcom,pmd-vbus-det", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_usb_extcon_dt_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

