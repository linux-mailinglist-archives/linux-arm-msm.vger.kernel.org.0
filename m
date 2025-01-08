Return-Path: <linux-arm-msm+bounces-44261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D43A04FA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9DA71885A50
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 01:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C45F19D89D;
	Wed,  8 Jan 2025 01:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eYM4wBkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D119F10A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 01:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736299733; cv=none; b=VoYPpgrPSAcEg3baP/fQAPfMm3/aJiA5R7qJJ24rbVSj0Jbz8E3rugebpqiDF4zUUQ+/ra68eo7B6inHOHDH+sXfVwcagaCtldzhL51gGwfxRIhYqdtY37J2yAeEmfZothCNChSio18ux2i8W3uOWBiL/RGVeX0F59Sg7tZ8po4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736299733; c=relaxed/simple;
	bh=t7arDmLNv1I8472tLkuO20WVqQ6j2EmCM9HKMORooEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kJqxRoV9zxOCyzkWw8ilVKAvKOj8mKcQM1SUP8hB/H/dnEXoQRu1ahNo8rGsHcAQqjMlfqiY0X2vsU8l/ooPVPAOUi//q8PiX9OQx8qIbycYcVzO4sNWsAMUg2KErwj3cH+lD2Qrjj9xnil3S4lMDaAtiQEhmNZps+fRB1d6OHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eYM4wBkJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216395e151bso4743245ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 17:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736299730; x=1736904530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtmiACSjJT3F9PAWPO6E+GzjG0s112mCP5ZFxh4lNAM=;
        b=eYM4wBkJSJQgmyrIoqvJgIxitDPlgkGG4ODwZvCKrSgBSStjVSelXScXVN1kHg2VGH
         jIQxDCAp5K8hqa8b92s5T2Yj37AiRAG3UFXAxGCLWvmFR0lfzDJqP5IPMXbzRZ66wsnG
         4ypNVdEZnN5HX6M1tLxW2MtNsEQSDZKDn4KQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299730; x=1736904530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtmiACSjJT3F9PAWPO6E+GzjG0s112mCP5ZFxh4lNAM=;
        b=UrSzs74bOuDbuk2NGW5nXyicI8zQHP3g2xlTcfto588OuKVLSFOxFMlpzyzdim7hjf
         bGwUZtK6RFKUU70M2MUU4DDQwnVkpTIJ0TiFQfPkrgRjwS7HmXsSkn4NPJQQAbfOzlhu
         BOV0Usix4nljFHykiPYRaD5uqvLEMJroLRZk/T3QrRMaDbQNbmdUHvtnaA5MMcz7tXI4
         lkcJWsjXXs3t3Qdvh406vdOhNTZWn91KBI1tJHPt7On6iGe3fBAD3GLLm8WX4J70CNqk
         V4074X0QyFtgKbBffCyNYcMlFL8EhDKJBLgLEXZqN2ZH4Q6frpAy90YgZ9ikvlRxQohZ
         t/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3atuDdI1qJRezkPxYTbl3dl3HIcWi3Bvk74CGmLEOwOB82IHKATSl7TlgyaSKFatC/ehmunntREO+M3fJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyRfWJNFGOM48jmP1WMG3ZzqNDvopDAKdiWNjSpGEVHzap61ZyB
	BI3PgKzwwt+WT2BffD+WHrEBhu+K1hwo7w/LircrnIcbvCRsi+tMSBtCiOiIEg==
X-Gm-Gg: ASbGncv2JWi/ehtJOuNCldL/Yyjc9uXocVHB8ec6RjycoHUohIeg50uJzWYYHGp2kZT
	wiHZaYhszzjJADBamtl5EX+adwKouI6jZe6ELUwLfVCVIlz7s/sfYYRpOxUhLjpafaF5gBC05LU
	45vx8r0OR98T1Y4jikQG3/K5kOc2hzYBto/GLbDS5wgPTA4C2B+pnFTXCmUZxMuSqy3IdlW5Mt9
	zZGByP4dLoG26CvOH4jEjxz8cTqs5wsyC2EVfw3CiV9QtBCgSFIELgBuNmRoQbbbOcFsSauQePI
	MxXzruu61fpMLXA0SyNr
X-Google-Smtp-Source: AGHT+IECb87WVTKnPoq5klH18qVel9WHdGx/7ugyROn+iCaeZnJB4oA6NAnKgGI+EaTULuxAe5Qexw==
X-Received: by 2002:a05:6a20:3943:b0:1e5:f8c6:203 with SMTP id adf61e73a8af0-1e745cb45damr6802792637.14.1736299730635;
        Tue, 07 Jan 2025 17:28:50 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72aad90b90asm34097987b3a.177.2025.01.07.17.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 17:28:50 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [RFC PATCH 1/6] bus: Extract simple-bus into self-contained driver
Date: Tue,  7 Jan 2025 17:28:38 -0800
Message-ID: <20250108012846.3275443-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250108012846.3275443-1-swboyd@chromium.org>
References: <20250108012846.3275443-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extract the simple bus into a self contained driver so that devices are
still populated when a node has two (or more) compatibles with the least
specific one being the generic "simple-bus". Allow the driver to be a
module so that in a fully modular build a driver module for the more
specific compatible will be loaded first before trying to match this
driver.

Cc: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: <devicetree@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/bus/Kconfig         | 23 +++++++++++
 drivers/bus/Makefile        |  3 ++
 drivers/bus/simple-bus.c    | 79 +++++++++++++++++++++++++++++++++++++
 drivers/bus/simple-pm-bus.c |  2 +
 drivers/of/platform.c       | 50 +++++++++++++++++++++++
 5 files changed, 157 insertions(+)
 create mode 100644 drivers/bus/simple-bus.c

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index ff669a8ccad9..7c2aa1350578 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -261,6 +261,29 @@ config DA8XX_MSTPRI
 	  configuration. Allows to adjust the priorities of all master
 	  peripherals.
 
+config ALLOW_SIMPLE_BUS_OVERRIDE
+	bool "Allow simple-bus compatible OF nodes to match other drivers"
+	depends on OF
+	help
+	  Allow nodes with the "simple-bus" compatible to use a more specific
+	  driver which populates child devices itself.
+
+config OF_SIMPLE_BUS
+	tristate "OF Simple Bus Driver"
+	depends on ALLOW_SIMPLE_BUS_OVERRIDE || COMPILE_TEST
+	default ALLOW_SIMPLE_BUS_OVERRIDE
+	help
+	  Driver for the "simple-bus" compatible nodes in DeviceTree. Child
+	  nodes are usually automatically populated on the platform bus when a
+	  node is compatible with "simple-bus". This driver maintains that
+	  feature but it fails probe to allow other drivers to try to probe
+	  with a more specific compatible if possible.
+
+	  Those other drivers depend on this kconfig symbol so that they match
+	  the builtin or modular status of this driver. Don't disable this
+	  symbol if ALLOW_SIMPLE_BUS_OVERRIDE is set and there isn't another
+	  driver for the simple-bus compatible.
+
 source "drivers/bus/fsl-mc/Kconfig"
 source "drivers/bus/mhi/Kconfig"
 
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index cddd4984d6af..f3968221d704 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -40,5 +40,8 @@ obj-$(CONFIG_VEXPRESS_CONFIG)	+= vexpress-config.o
 
 obj-$(CONFIG_DA8XX_MSTPRI)	+= da8xx-mstpri.o
 
+# Must be last for driver registration ordering
+obj-$(CONFIG_OF_SIMPLE_BUS)	+= simple-bus.o
+
 # MHI
 obj-y				+= mhi/
diff --git a/drivers/bus/simple-bus.c b/drivers/bus/simple-bus.c
new file mode 100644
index 000000000000..3e39b9818566
--- /dev/null
+++ b/drivers/bus/simple-bus.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Simple Bus Driver
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+static struct platform_driver simple_bus_driver;
+
+static int has_specific_simple_bus_drv(struct device_driver *drv, void *dev)
+{
+	/* Skip if it's this simple bus driver */
+	if (drv == &simple_bus_driver.driver)
+		return 0;
+
+	if (of_driver_match_device(dev, drv)) {
+		dev_dbg(dev, "Allowing '%s' to probe more specifically\n", drv->name);
+		return 1;
+	}
+
+	return 0;
+}
+
+static int simple_bus_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
+	struct device_node *np = dev->of_node;
+
+	/*
+	 * If any other driver wants the device, leave the device to the other
+	 * driver. Only check drivers that come after this driver so that if an
+	 * earlier driver failed to probe we don't populate any devices, and
+	 * only check if there's a more specific compatible.
+	 */
+	if (of_property_match_string(np, "compatible", "simple-bus") != 0 &&
+	    bus_for_each_drv(&platform_bus_type, &simple_bus_driver.driver, dev,
+			     has_specific_simple_bus_drv))
+		return -ENODEV;
+
+	if (np)
+		of_platform_populate(np, NULL, lookup, dev);
+
+	return 0;
+}
+
+static const struct of_device_id simple_bus_of_match[] = {
+	{ .compatible = "simple-bus", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, simple_bus_of_match);
+
+static struct platform_driver simple_bus_driver = {
+	.probe = simple_bus_probe,
+	.driver = {
+		.name = "simple-bus",
+		.of_match_table = simple_bus_of_match,
+	},
+};
+
+static int __init simple_bus_driver_init(void)
+{
+	return platform_driver_register(&simple_bus_driver);
+}
+arch_initcall(simple_bus_driver_init);
+
+static void __exit simple_bus_driver_exit(void)
+{
+	platform_driver_unregister(&simple_bus_driver);
+}
+module_exit(simple_bus_driver_exit);
+
+MODULE_DESCRIPTION("Simple Bus Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 5dea31769f9a..be9879aa80c1 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -118,7 +118,9 @@ static const struct dev_pm_ops simple_pm_bus_pm_ops = {
 
 static const struct of_device_id simple_pm_bus_of_match[] = {
 	{ .compatible = "simple-pm-bus", },
+#ifndef CONFIG_ALLOW_SIMPLE_BUS_OVERRIDE
 	{ .compatible = "simple-bus",	.data = ONLY_BUS },
+#endif
 	{ .compatible = "simple-mfd",	.data = ONLY_BUS },
 	{ .compatible = "isa",		.data = ONLY_BUS },
 	{ .compatible = "arm,amba-bus",	.data = ONLY_BUS },
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index c6d8afb284e8..63a80c30d515 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -311,6 +311,54 @@ static const struct of_dev_auxdata *of_dev_lookup(const struct of_dev_auxdata *l
 	return NULL;
 }
 
+/**
+ * of_platform_should_populate_children() - Should child nodes be populated for a bus
+ * @bus: device node of the bus to populate children for
+ * @matches: match table for bus nodes
+ *
+ * This function is used to determine if child nodes should be populated as
+ * devices for a bus. That is usually the case, unless
+ * CONFIG_ALLOW_SIMPLE_BUS_OVERRIDE=y, in which case the simple-bus driver
+ * (CONFIG_OF_SIMPLE_BUS) will populate them.
+ *
+ * Return: True if child nodes should be populated as devices, false otherwise.
+ */
+static bool of_platform_should_populate_children(const struct of_device_id *matches,
+						 struct device_node *bus)
+{
+	/* Not configured to allow simple-bus to be overridden. Skip. */
+	if (!IS_ENABLED(CONFIG_ALLOW_SIMPLE_BUS_OVERRIDE))
+		return true;
+
+	/* The simple-bus driver will handle it. */
+	if (IS_ENABLED(CONFIG_OF_SIMPLE_BUS))
+		return false;
+
+	if (!matches)
+		return true;
+
+	/*
+	 * Always populate if the matches aren't populating a "simple-bus"
+	 * compatible node.
+	 */
+	for (; matches->name[0] || matches->type[0] || matches->compatible[0]; matches++) {
+		if (!strncmp(matches->compatible, "simple-bus",
+			     ARRAY_SIZE(matches->compatible))) {
+			/*
+			 * Always populate if "simple-bus" is the first
+			 * compatible, so that CONFIG_OF_SIMPLE_BUS can be
+			 * disabled while CONFIG_ALLOW_SIMPLE_BUS_OVERRIDE can
+			 * be enabled.
+			 */
+			if (of_property_match_string(bus, "compatible", "simple-bus") != 0)
+				return false;
+			break;
+		}
+	}
+
+	return true;
+}
+
 /**
  * of_platform_bus_create() - Create a device for a node and its children.
  * @bus: device node of the bus to instantiate
@@ -370,6 +418,8 @@ static int of_platform_bus_create(struct device_node *bus,
 	dev = of_platform_device_create_pdata(bus, bus_id, platform_data, parent);
 	if (!dev || !of_match_node(matches, bus))
 		return 0;
+	if (!of_platform_should_populate_children(matches, bus))
+		return 0;
 
 	for_each_child_of_node_scoped(bus, child) {
 		pr_debug("   create child: %pOF\n", child);
-- 
https://chromeos.dev


