Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D4F293268
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 02:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389523AbgJTAmb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 20:42:31 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:39859 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389495AbgJTAm2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 20:42:28 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Oct 2020 17:42:26 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 19 Oct 2020 17:42:25 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 002D9196E; Mon, 19 Oct 2020 17:42:25 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Kavya Nunna <knunna@codeaurora.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v2 2/2] extcon: qcom-spmi: Add support for VBUS detection
Date:   Mon, 19 Oct 2020 17:42:25 -0700
Message-Id: <be397c0bad2ff981890e7585aff7d10d9c005d07.1603154265.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1603154265.git.gurus@codeaurora.org>
References: <cover.1603154265.git.gurus@codeaurora.org>
In-Reply-To: <cover.1603154265.git.gurus@codeaurora.org>
References: <cover.1603154265.git.gurus@codeaurora.org>
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

