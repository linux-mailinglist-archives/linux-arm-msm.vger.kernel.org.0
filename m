Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC4E343AB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 08:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhCVHhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 03:37:36 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:45972 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhCVHhJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 03:37:09 -0400
Received: by mail-lj1-f173.google.com with SMTP id z8so19757066ljm.12;
        Mon, 22 Mar 2021 00:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yNHMbYhXYTuAKxP9i1xwQyQREgRd6XRSSDqTIHsn6qA=;
        b=cbVrqDyPyDdqf5E0wl043egmo5J7iloFp1/I7Pa6Rj5OfOH/u73zyWt7Cnpoh/MIeX
         UMcZpwq8gHrsGUh3WWA2Ock3w2sIR30C7iFnQ9mXtGTcLVkTd2Z/B/tZPXoDg628xdzI
         oN/k0KJWc/SF8iAjDBUkgBxRv+icqTA5d/pSdUaxL+IBmjkhJzEnI4bwuR1k/UAeGdnH
         CRuuZ5TBSZLuUoWG3p1YXmaRpv/C3CCumWNtZKfPOlPkAzvhfs57ILwm2qQPZEiaEMOz
         jrTHVlc+bvoQSQJpo7aUSofPJzRTjgOEHDkfFBMnUycCjO7SbsKTuwDfRjWx4mP3f0mT
         DlWg==
X-Gm-Message-State: AOAM531FD4pFk0JnjEQ+Mg8SCNhH0j8b3FeLgNHBzB9CquzEsb5YTF9G
        84gyPFrqMqnI62Dub+JAWLQ=
X-Google-Smtp-Source: ABdhPJzns4vOGbZHqF9S1zc3zLH9VZ1T/sPtll22hhNYUj9q1K+ISS/VvIforouDHuvojrduvJwWzw==
X-Received: by 2002:a2e:8006:: with SMTP id j6mr8518777ljg.417.1616398627336;
        Mon, 22 Mar 2021 00:37:07 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5673b7-246.dhcp.inet.fi. [86.115.183.246])
        by smtp.gmail.com with ESMTPSA id j14sm54149lfg.134.2021.03.22.00.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 00:37:07 -0700 (PDT)
Date:   Mon, 22 Mar 2021 09:37:01 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [RFC RESEND PATCH v2 3/8] extconn: Clean-up few drivers by using
 managed work init
Message-ID: <b1030eddbf0069f2d39e951be1d8e40d6413aeeb.1616395565.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1616395565.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1616395565.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Few drivers implement remove call-back only for ensuring a delayed
work gets cancelled prior driver removal. Clean-up these by switching
to use devm_delayed_work_autocancel() instead.

Additionally, this helps avoiding mixing devm and manual resource
management and cleans up a (theoretical?) bug from extconn-palmas.c
and extcon-qcom-spmi-misc.c where (devm managed)IRQ might schedule
new work item after wq was cleaned at remove().

This change is compile-tested only. All testing is appreciated.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/extcon/extcon-gpio.c           | 15 ++++-----------
 drivers/extcon/extcon-intel-int3496.c  | 16 ++++------------
 drivers/extcon/extcon-palmas.c         | 17 ++++++-----------
 drivers/extcon/extcon-qcom-spmi-misc.c | 17 ++++++-----------
 4 files changed, 20 insertions(+), 45 deletions(-)

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index c211222f5d0c..4105df74f2b0 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -9,6 +9,7 @@
  * (originally switch class is supported)
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/extcon-provider.h>
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
@@ -112,7 +113,9 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	INIT_DELAYED_WORK(&data->work, gpio_extcon_work);
+	ret = devm_delayed_work_autocancel(dev, &data->work, gpio_extcon_work);
+	if (ret)
+		return ret;
 
 	/*
 	 * Request the interrupt of gpio to detect whether external connector
@@ -131,15 +134,6 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int gpio_extcon_remove(struct platform_device *pdev)
-{
-	struct gpio_extcon_data *data = platform_get_drvdata(pdev);
-
-	cancel_delayed_work_sync(&data->work);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int gpio_extcon_resume(struct device *dev)
 {
@@ -158,7 +152,6 @@ static SIMPLE_DEV_PM_OPS(gpio_extcon_pm_ops, NULL, gpio_extcon_resume);
 
 static struct platform_driver gpio_extcon_driver = {
 	.probe		= gpio_extcon_probe,
-	.remove		= gpio_extcon_remove,
 	.driver		= {
 		.name	= "extcon-gpio",
 		.pm	= &gpio_extcon_pm_ops,
diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
index 80c9abcc3f97..fb527c23639e 100644
--- a/drivers/extcon/extcon-intel-int3496.c
+++ b/drivers/extcon/extcon-intel-int3496.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/devm-helpers.h>
 #include <linux/extcon-provider.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
@@ -101,7 +102,9 @@ static int int3496_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data->dev = dev;
-	INIT_DELAYED_WORK(&data->work, int3496_do_usb_id);
+	ret = devm_delayed_work_autocancel(dev, &data->work, int3496_do_usb_id);
+	if (ret)
+		return ret;
 
 	data->gpio_usb_id = devm_gpiod_get(dev, "id", GPIOD_IN);
 	if (IS_ERR(data->gpio_usb_id)) {
@@ -155,16 +158,6 @@ static int int3496_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int int3496_remove(struct platform_device *pdev)
-{
-	struct int3496_data *data = platform_get_drvdata(pdev);
-
-	devm_free_irq(&pdev->dev, data->usb_id_irq, data);
-	cancel_delayed_work_sync(&data->work);
-
-	return 0;
-}
-
 static const struct acpi_device_id int3496_acpi_match[] = {
 	{ "INT3496" },
 	{ }
@@ -177,7 +170,6 @@ static struct platform_driver int3496_driver = {
 		.acpi_match_table = int3496_acpi_match,
 	},
 	.probe = int3496_probe,
-	.remove = int3496_remove,
 };
 
 module_platform_driver(int3496_driver);
diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
index a2852bcc5f0d..d2c1a8b89c08 100644
--- a/drivers/extcon/extcon-palmas.c
+++ b/drivers/extcon/extcon-palmas.c
@@ -9,6 +9,7 @@
  * Author: Hema HK <hemahk@ti.com>
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
@@ -237,7 +238,11 @@ static int palmas_usb_probe(struct platform_device *pdev)
 			palmas_usb->sw_debounce_jiffies = msecs_to_jiffies(debounce);
 	}
 
-	INIT_DELAYED_WORK(&palmas_usb->wq_detectid, palmas_gpio_id_detect);
+	status = devm_delayed_work_autocancel(&pdev->dev,
+					      &palmas_usb->wq_detectid,
+					      palmas_gpio_id_detect);
+	if (status)
+		return status;
 
 	palmas->usb = palmas_usb;
 	palmas_usb->palmas = palmas;
@@ -359,15 +364,6 @@ static int palmas_usb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int palmas_usb_remove(struct platform_device *pdev)
-{
-	struct palmas_usb *palmas_usb = platform_get_drvdata(pdev);
-
-	cancel_delayed_work_sync(&palmas_usb->wq_detectid);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int palmas_usb_suspend(struct device *dev)
 {
@@ -422,7 +418,6 @@ static const struct of_device_id of_palmas_match_tbl[] = {
 
 static struct platform_driver palmas_usb_driver = {
 	.probe = palmas_usb_probe,
-	.remove = palmas_usb_remove,
 	.driver = {
 		.name = "palmas-usb",
 		.of_match_table = of_palmas_match_tbl,
diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extcon-qcom-spmi-misc.c
index 6b836ae62176..74d57d951b68 100644
--- a/drivers/extcon/extcon-qcom-spmi-misc.c
+++ b/drivers/extcon/extcon-qcom-spmi-misc.c
@@ -7,6 +7,7 @@
  * Stephen Boyd <stephen.boyd@linaro.org>
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/extcon-provider.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -80,7 +81,11 @@ static int qcom_usb_extcon_probe(struct platform_device *pdev)
 	}
 
 	info->debounce_jiffies = msecs_to_jiffies(USB_ID_DEBOUNCE_MS);
-	INIT_DELAYED_WORK(&info->wq_detcable, qcom_usb_extcon_detect_cable);
+
+	ret = devm_delayed_work_autocancel(dev, &info->wq_detcable,
+					   qcom_usb_extcon_detect_cable);
+	if (ret)
+		return ret;
 
 	info->irq = platform_get_irq_byname(pdev, "usb_id");
 	if (info->irq < 0)
@@ -105,15 +110,6 @@ static int qcom_usb_extcon_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int qcom_usb_extcon_remove(struct platform_device *pdev)
-{
-	struct qcom_usb_extcon_info *info = platform_get_drvdata(pdev);
-
-	cancel_delayed_work_sync(&info->wq_detcable);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int qcom_usb_extcon_suspend(struct device *dev)
 {
@@ -149,7 +145,6 @@ MODULE_DEVICE_TABLE(of, qcom_usb_extcon_dt_match);
 
 static struct platform_driver qcom_usb_extcon_driver = {
 	.probe		= qcom_usb_extcon_probe,
-	.remove		= qcom_usb_extcon_remove,
 	.driver		= {
 		.name	= "extcon-pm8941-misc",
 		.pm	= &qcom_usb_extcon_pm_ops,
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
