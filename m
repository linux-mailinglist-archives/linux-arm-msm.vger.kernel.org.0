Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CF243F176
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 23:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbhJ1VUb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 17:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbhJ1VUa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 17:20:30 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8DFCC061570;
        Thu, 28 Oct 2021 14:18:02 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so2122716pjc.4;
        Thu, 28 Oct 2021 14:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M7SQlrqOy9yTGGX9Q74V02Dy6PRRtUeIeuIXkY2yxZg=;
        b=fz9Rgcbn2X7zKFhRxtakCsKsStPtHUBR5GcIBzMPXCSKOQ4vSsWIwWraKui47e4+dv
         1eVCSOgs/I5xhgr/xD/W5QEQ3DhKpstPZKQF5r/xeGQV7/7/YGtPhhDj1TXkcKh/AP/Y
         bWQttngx39rbfH5boxPIFJLpfeeswRy8YfmxU27By9nBqiGrWV11iT0QmHPWBgK138Cu
         8NatQU2TIXjOb11VqFciG9YW8/Who+mz/DSCfHBqjmIAwT/GgJ0lUhHoX3i0MQpLpP0n
         Z6H1o/95ZQLE9kOU9mU1s8BO3w2+0YKsc66PCvGFMnXOrNkla+1eXf6B8ZbuAaJw2Bag
         zI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M7SQlrqOy9yTGGX9Q74V02Dy6PRRtUeIeuIXkY2yxZg=;
        b=fkiar1XefRNmMhc6gA4i/RerJsRMty+/UpLHnjUrYyq/zFTjuC729+jKZUgBTd+2zx
         5e7tpAUy69Jjk5URI6oeyT9E6hEX3lfYQf0CUEBAPiKuQLOU7YwoOyCOC572vVfpPDo3
         I6qpkVmIref4yToeuf3UpEVFguMFFv+VkG2okz1e9YuFQd99Q2uRbfHCKtLdQ41zxwOI
         88O+EweiJTUixZYq7TA1VNEuuVvhG+Lr2oZk0NmI+qQlWZ1QGRvna50K7tSk1N3rbOAX
         73VhJczghT2uaL4xH+Wwb/L0TxQfIfX0Ixr/WTkA0jHIifTksHl48ZURSeA0XI/TYj+k
         QY9A==
X-Gm-Message-State: AOAM532pw8fPy4fsPrclbIqVelzjbnLTbFi0gHTp+LMYEY/C8k94BLW6
        2B/dVg+0jDUhjAv0iQHx4rA=
X-Google-Smtp-Source: ABdhPJzEQyeGgC3aDL1vqGUZAGgEchOk4mndtDvApovc+d1TTkQrHLdMHM7/qVySK7DotObo91w6zQ==
X-Received: by 2002:a17:90a:de0d:: with SMTP id m13mr15676522pjv.85.1635455882374;
        Thu, 28 Oct 2021 14:18:02 -0700 (PDT)
Received: from jaschultz-Thelio-Major.corp.microsoft.com ([2001:4898:80e8:0:1173:767a:1b1e:f6a4])
        by smtp.gmail.com with ESMTPSA id t14sm3506610pga.62.2021.10.28.14.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 14:18:02 -0700 (PDT)
From:   Jarrett Schultz <jaschultzms@gmail.com>
X-Google-Original-From: Jarrett Schultz <jaschultzMS@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultzMS@gmail.com>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: [PATCH 2/3] platform: surface: Add surface xbl
Date:   Thu, 28 Oct 2021 14:17:52 -0700
Message-Id: <20211028211753.573480-3-jaschultzMS@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028211753.573480-1-jaschultzMS@gmail.com>
References: <20211028211753.573480-1-jaschultzMS@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce support for the Extensible Boot Loader driver found on the
Surface Duo. Makes device information available to users via sysfs.

Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
---
 .../ABI/testing/sysfs-platform-surface-xbl    |  78 ++++++
 MAINTAINERS                                   |   9 +
 drivers/platform/surface/Kconfig              |  10 +
 drivers/platform/surface/Makefile             |   1 +
 drivers/platform/surface/surface-xbl.c        | 223 ++++++++++++++++++
 5 files changed, 321 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-surface-xbl
 create mode 100644 drivers/platform/surface/surface-xbl.c

diff --git a/Documentation/ABI/testing/sysfs-platform-surface-xbl b/Documentation/ABI/testing/sysfs-platform-surface-xbl
new file mode 100644
index 000000000000..d3104dbbc6c1
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-surface-xbl
@@ -0,0 +1,78 @@
+What:		/sys/devices/platform/146bfa94.xbl/battery_present
+Date:		October 2021
+KernelVersion:	5.15
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns whether the battery is present. Valid
+		values are:
+			0 - battery absent
+			1 - battery present
+
+What:		/sys/devices/platform/146bfa94.xbl/board_id
+Date:		October 2021
+KernelVersion:	5.15
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns the board id.
+
+What:		/sys/devices/platform/146bfa94.xbl/hw_init_retries
+Date:		October 2021
+KernelVersion:	5.15
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns retries attempted to initialize the
+		discrete hardware circuit.
+
+What:		/sys/devices/platform/146bfa94.xbl/is_act_mode
+Date:		October 2021
+KernelVersion:	5.15
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns whether ACT mode is enabled. Valid values
+		are:
+			0 - ACT disabled
+			1 - ACT enabled
+
+		ACT mode is used to run checks and put the device to shipmode
+		at factory.
+
+What:		/sys/devices/platform/146bfa94.xbl/is_customer_mode
+Date:		October 2021
+KernelVersion:	5.15
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns whether the device is in manufacturing
+		mode. Valid values are:
+			0 - Not in manufacturing mode
+			1 - In manufacturing mode
+
+What:		/sys/devices/platform/146bfa94.xbl/ocp_error_location
+Date:		October 2021
+KernelVersion:	5.15
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns 0 or which power rail has the OCP error.
+		Valid values are:
+			Bit(s)		Meaning
+			15		More than one OCP error occurred
+			14-12		PMIC
+			11-7		SMPS
+			6-2		LDO
+			1-0		BOB
+
+What:		/sys/devices/platform/146bfa94.xbl/pmic_reset_reason
+Date:		October 2021
+KernelVersion:	5.15
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns the reason for the reset. Valid values
+		are:
+			0 - no reason lol
+			9 - Battery driver triggered
+
+What:		/sys/devices/platform/146bfa94.xbl/touch_fw_version
+Date:		October 2021
+KernelVersion:	5.15
+Contact:	jaschultz@microsoft.com
+Description:
+		Read only. It returns the version of the firmware.
diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..d08b68d626f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12423,6 +12423,15 @@ F:	Documentation/driver-api/surface_aggregator/clients/dtx.rst
 F:	drivers/platform/surface/surface_dtx.c
 F:	include/uapi/linux/surface_aggregator/dtx.h
 
+MICROSOFT SURFACE DUO XBL DRIVER
+M:	Jarrett Schultz <jaschultz@microsoft.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	Documentation/ABI/testing/sysfs-platform-surface-xbl
+F:	Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
+F:	drivers/platform/surface/surface-xbl.c
+
 MICROSOFT SURFACE GPE LID SUPPORT DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
index 3105f651614f..ca0546397414 100644
--- a/drivers/platform/surface/Kconfig
+++ b/drivers/platform/surface/Kconfig
@@ -180,6 +180,16 @@ config SURFACE_PRO3_BUTTON
 	help
 	  This driver handles the power/home/volume buttons on the Microsoft Surface Pro 3/4 tablet.
 
+config SURFACE_XBL
+	tristate "Surface XBL Driver"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  If you say 'Y' to this option, support will be included for the
+	  Surface XBL Driver.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called surface-xbl.
+
 source "drivers/platform/surface/aggregator/Kconfig"
 
 endif # SURFACE_PLATFORMS
diff --git a/drivers/platform/surface/Makefile b/drivers/platform/surface/Makefile
index 32889482de55..1ed5808301e9 100644
--- a/drivers/platform/surface/Makefile
+++ b/drivers/platform/surface/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_SURFACE_GPE)		+= surface_gpe.o
 obj-$(CONFIG_SURFACE_HOTPLUG)		+= surface_hotplug.o
 obj-$(CONFIG_SURFACE_PLATFORM_PROFILE)	+= surface_platform_profile.o
 obj-$(CONFIG_SURFACE_PRO3_BUTTON)	+= surfacepro3_button.o
+obj-$(CONFIG_SURFACE_XBL)		+= surface-xbl.o
diff --git a/drivers/platform/surface/surface-xbl.c b/drivers/platform/surface/surface-xbl.c
new file mode 100644
index 000000000000..910287f0c987
--- /dev/null
+++ b/drivers/platform/surface/surface-xbl.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * surface-xbl.c - Surface E(x)tensible (B)oot(l)oader
+ *
+ * Copyright (C) 2021 Microsoft Corporation
+ * Author: Jarrett Schultz <jaschultz@microsoft.com>
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/kstrtox.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define SURFACE_XBL_MAX_VERSION_LEN	16
+#define SURFACE_XBL_BOARD_ID		0
+#define SURFACE_XBL_BATTERY_PRESENT	1
+#define SURFACE_XBL_HW_INIT_RETRIES	2
+#define SURFACE_XBL_IS_CUSTOMER_MODE	3
+#define SURFACE_XBL_IS_ACT_MODE		4
+#define SURFACE_XBL_PMIC_RESET_REASON	5
+#define SURFACE_XBL_TOUCH_FW_VERSION	6
+#define SURFACE_XBL_OCP_ERROR_LOCATION	((SURFACE_XBL_TOUCH_FW_VERSION) +\
+					(SURFACE_XBL_MAX_VERSION_LEN))
+
+struct surface_xbl {
+	struct device	*dev;
+	void __iomem	*regs;
+
+	u8		board_id;
+	u8		battery_present;
+	u8		hw_init_retries;
+	u8		is_customer_mode;
+	u8		is_act_mode;
+	u8		pmic_reset_reason;
+	char		touch_fw_version[SURFACE_XBL_MAX_VERSION_LEN];
+	u16		ocp_error_location;
+} __packed;
+
+static ssize_t
+board_id_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->board_id);
+}
+static DEVICE_ATTR_RO(board_id);
+
+static ssize_t
+battery_present_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->battery_present);
+}
+static DEVICE_ATTR_RO(battery_present);
+
+static ssize_t
+hw_init_retries_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->hw_init_retries);
+}
+static DEVICE_ATTR_RO(hw_init_retries);
+
+static ssize_t
+is_customer_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->is_customer_mode);
+}
+static DEVICE_ATTR_RO(is_customer_mode);
+
+static ssize_t
+is_act_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->is_act_mode);
+}
+static DEVICE_ATTR_RO(is_act_mode);
+
+static ssize_t
+pmic_reset_reason_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->pmic_reset_reason);
+}
+static DEVICE_ATTR_RO(pmic_reset_reason);
+
+static ssize_t
+touch_fw_version_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "0x%s\n", sxbl->touch_fw_version);
+}
+static DEVICE_ATTR_RO(touch_fw_version);
+
+static ssize_t
+ocp_error_location_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct surface_xbl	*sxbl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", sxbl->ocp_error_location);
+}
+static DEVICE_ATTR_RO(ocp_error_location);
+
+static struct attribute *inputs_attrs[] = {
+	&dev_attr_board_id.attr,
+	&dev_attr_battery_present.attr,
+	&dev_attr_hw_init_retries.attr,
+	&dev_attr_is_customer_mode.attr,
+	&dev_attr_is_act_mode.attr,
+	&dev_attr_pmic_reset_reason.attr,
+	&dev_attr_touch_fw_version.attr,
+	&dev_attr_ocp_error_location.attr,
+	NULL,
+};
+
+static const struct attribute_group inputs_attr_group = {
+	.attrs = inputs_attrs,
+};
+
+static u8 surface_xbl_readb(void __iomem *base, u32 offset)
+{
+	return readb(base + offset);
+}
+
+static u16 surface_xbl_readw(void __iomem *base, u32 offset)
+{
+	return readw(base + offset);
+}
+
+static int surface_xbl_probe(struct platform_device *pdev)
+{
+	struct surface_xbl	*sxbl;
+	struct device		*dev;
+	void __iomem		*regs;
+	int					index;
+	int					retval;
+
+	dev = &pdev->dev;
+	sxbl = devm_kzalloc(dev, sizeof(*sxbl), GFP_KERNEL);
+	if (!sxbl)
+		return -ENOMEM;
+
+	sxbl->dev = dev;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	sxbl->regs = regs;
+
+	platform_set_drvdata(pdev, sxbl);
+
+	sxbl->board_id = surface_xbl_readb(sxbl->regs,
+					   SURFACE_XBL_BOARD_ID);
+	sxbl->battery_present = surface_xbl_readb(sxbl->regs,
+						  SURFACE_XBL_BATTERY_PRESENT);
+	sxbl->hw_init_retries = surface_xbl_readb(sxbl->regs,
+						  SURFACE_XBL_HW_INIT_RETRIES);
+	sxbl->is_customer_mode = surface_xbl_readb(sxbl->regs,
+						   SURFACE_XBL_IS_CUSTOMER_MODE);
+	sxbl->is_act_mode = surface_xbl_readb(sxbl->regs,
+					      SURFACE_XBL_IS_ACT_MODE);
+	sxbl->pmic_reset_reason = surface_xbl_readb(sxbl->regs,
+						    SURFACE_XBL_PMIC_RESET_REASON);
+
+	for (index = 0; index < SURFACE_XBL_MAX_VERSION_LEN; index++)
+		sxbl->touch_fw_version[index] = surface_xbl_readb(sxbl->regs,
+							SURFACE_XBL_TOUCH_FW_VERSION + index);
+
+	sxbl->ocp_error_location = surface_xbl_readw(sxbl->regs,
+						     SURFACE_XBL_OCP_ERROR_LOCATION);
+
+	retval = sysfs_create_group(&sxbl->dev->kobj, &inputs_attr_group);
+	if (retval < 0) {
+		dev_dbg(sxbl->dev,
+			"Can't register sysfs attr group: %d\n", retval);
+		return retval;
+	}
+
+	return 0;
+}
+
+static int surface_xbl_remove(struct platform_device *pdev)
+{
+	sysfs_remove_group(&pdev->dev.kobj, &inputs_attr_group);
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id surface_xbl_of_match[] = {
+	{
+		.compatible = "microsoft,sm8150-surface-duo-xbl"
+	},
+	{  }, /* Terminating Entry */
+};
+MODULE_DEVICE_TABLE(of, surface_xbl_of_match);
+#endif
+
+static struct platform_driver surface_xbl_driver = {
+	.probe		= surface_xbl_probe,
+	.remove		= surface_xbl_remove,
+	.driver		= {
+		.name	= "surface-xbl",
+		.of_match_table = of_match_ptr(surface_xbl_of_match),
+	},
+};
+
+module_platform_driver(surface_xbl_driver);
+
+MODULE_AUTHOR("Jarrett Schultz <jaschultz@microsoft.com>");
+MODULE_DESCRIPTION("Surface Extensible Bootloader");
+MODULE_LICENSE("GPL");
-- 
2.25.1

