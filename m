Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C225E4C1FE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 00:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244921AbiBWXii (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 18:38:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244887AbiBWXi2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 18:38:28 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30E15A5A0;
        Wed, 23 Feb 2022 15:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645659477; x=1677195477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PtK747GnjuyC0WUIVmHWvW0DGS4uGZItQvyQSo8I7T8=;
  b=l4jH0vdACg2AumFfjaO0fny8hxcb7RhexOUGL78pgYEZo6hbVP3WBm5U
   5i1uyCYydngHRvMAUNys6luAD03k2qjNXjUCz6IKfdtGFfbGya7UKp25T
   1zXtj/ZlQ5MMONmrSvwt80mVUV0FOuRepv2zh34cRQPs0PY7AeHmnt5OY
   8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Feb 2022 15:37:57 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 15:37:57 -0800
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 23 Feb 2022 15:37:56 -0800
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-kernel@vger.kernel.org>
CC:     Elliot Berman <quic_eberman@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Murali Nalajala <quic_mnalajala@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagiri@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH 06/11] virt: gunyah: Add capabilities bus and devices
Date:   Wed, 23 Feb 2022 15:37:24 -0800
Message-ID: <20220223233729.1571114-7-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223233729.1571114-1-quic_eberman@quicinc.com>
References: <20220223233729.1571114-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some resources provided by the Gunyah hypervisor are described as
objects. The objects are identified with a capability ID. For instance,
Inter-VM communication is performed with doorbells and message queues.
Each doorbell and message queue endpoint can be described consisely as a
Linux device.

These resources are discovered either on the devicetree or reported by
the Resource Manager. Devices on the Gunyah bus are matched with drivers
according to the type ID reported by resource manager. Most resources
will be discovered directly from the resource manager, so matching
directly on type ID seems like sensible design.

Each resource may also optionally have an interrupt associated with it
and a known partner VM (e.g. which VM is the receiver of a message
queue).

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/virt/gunyah/Makefile         |   2 +-
 drivers/virt/gunyah/device.c         | 108 +++++++++++++++++++++++++++
 drivers/virt/gunyah/gunyah_private.h |  12 +++
 drivers/virt/gunyah/sysfs.c          |  24 +++++-
 include/linux/gunyah.h               |  45 +++++++++++
 5 files changed, 188 insertions(+), 3 deletions(-)
 create mode 100644 drivers/virt/gunyah/device.c
 create mode 100644 drivers/virt/gunyah/gunyah_private.h

diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
index 0aa086f9149f..3869fb7371df 100644
--- a/drivers/virt/gunyah/Makefile
+++ b/drivers/virt/gunyah/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-gunyah-y += sysfs.o
+gunyah-y += sysfs.o device.o
 obj-$(CONFIG_GUNYAH) += gunyah.o
\ No newline at end of file
diff --git a/drivers/virt/gunyah/device.c b/drivers/virt/gunyah/device.c
new file mode 100644
index 000000000000..93595f9a65b9
--- /dev/null
+++ b/drivers/virt/gunyah/device.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) "ghdev: " fmt
+
+#include <linux/interrupt.h>
+#include <linux/gunyah.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+
+#include "gunyah_private.h"
+
+static int gunyah_match(struct device *dev, struct device_driver *drv)
+{
+	struct gunyah_device *ghdev = to_gunyah_device(dev);
+	struct gunyah_driver *ghdrv = to_gunyah_driver(drv);
+
+	return ghdev->type == ghdrv->type;
+}
+
+static int gunyah_probe(struct device *dev)
+{
+	struct gunyah_device *ghdev = to_gunyah_device(dev);
+	struct gunyah_driver *ghdrv = to_gunyah_driver(dev->driver);
+
+	return ghdrv->probe ? ghdrv->probe(ghdev) : 0;
+}
+
+static void gunyah_remove(struct device *dev)
+{
+	struct gunyah_device *ghdev = to_gunyah_device(dev);
+	struct gunyah_driver *ghdrv = to_gunyah_driver(dev->driver);
+
+	if (ghdrv->remove)
+		ghdrv->remove(ghdev);
+}
+
+static struct bus_type gunyah_bus = {
+	.name	= "gunyah",
+	.match	= gunyah_match,
+	.probe	= gunyah_probe,
+	.remove	= gunyah_remove,
+};
+
+int gunyah_register_driver(struct gunyah_driver *ghdrv)
+{
+	ghdrv->driver.bus = &gunyah_bus;
+	return driver_register(&ghdrv->driver);
+}
+
+void gunyah_unregister_driver(struct gunyah_driver *ghdrv)
+{
+	driver_unregister(&ghdrv->driver);
+}
+
+static void gunyah_device_release(struct device *dev)
+{
+	struct gunyah_device *ghdev = to_gunyah_device(dev);
+
+	kfree(ghdev);
+}
+
+struct gunyah_device *gunyah_device_alloc(struct device *parent, gh_capid_t capid, u8 type)
+{
+	struct gunyah_device *ghdev;
+
+	ghdev = kzalloc(sizeof(*ghdev), GFP_KERNEL);
+	if (!ghdev)
+		return NULL;
+
+	ghdev->capid = capid;
+	ghdev->type = type;
+	ghdev->irq = IRQ_NOTCONNECTED;
+	ghdev->dev.parent = parent;
+	ghdev->dev.release = gunyah_device_release;
+	ghdev->dev.bus = &gunyah_bus;
+	device_initialize(&ghdev->dev);
+	return ghdev;
+}
+
+int gunyah_device_add(struct gunyah_device *ghdev)
+{
+	int ret;
+
+	ret = dev_set_name(&ghdev->dev, "%u.%08llx", ghdev->type, ghdev->capid);
+	if (ret)
+		return ret;
+
+	return device_add(&ghdev->dev);
+}
+
+void gunyah_device_remove(struct gunyah_device *ghdev)
+{
+	device_unregister(&ghdev->dev);
+}
+
+int __init gunyah_bus_init(void)
+{
+	return bus_register(&gunyah_bus);
+}
+
+void gunyah_bus_exit(void)
+{
+	bus_unregister(&gunyah_bus);
+}
diff --git a/drivers/virt/gunyah/gunyah_private.h b/drivers/virt/gunyah/gunyah_private.h
new file mode 100644
index 000000000000..5f3832608020
--- /dev/null
+++ b/drivers/virt/gunyah/gunyah_private.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _GUNYAH_PRIVATE_H
+#define _GUNYAH_PRIVATE_H
+
+int __init gunyah_bus_init(void);
+void gunyah_bus_exit(void);
+
+#endif
diff --git a/drivers/virt/gunyah/sysfs.c b/drivers/virt/gunyah/sysfs.c
index 3d22f08360db..d66e6275fe32 100644
--- a/drivers/virt/gunyah/sysfs.c
+++ b/drivers/virt/gunyah/sysfs.c
@@ -55,7 +55,13 @@ static struct kobj_attribute variant_attr = __ATTR_RO(variant);
 
 static ssize_t features_show(struct kobject *kobj, struct kobj_attribute *attr, char *buffer)
 {
-	return sysfs_emit(buffer, "\n");
+	int len = 0;
+
+	if (GH_IDENTIFY_PARTITION_CSPACE(gunyah_api.flags))
+		len += sysfs_emit_at(buffer, len, "cspace ");
+
+	len += sysfs_emit_at(buffer, len, "\n");
+	return len;
 }
 static struct kobj_attribute features_attr = __ATTR_RO(features);
 
@@ -93,6 +99,8 @@ static void gh_sysfs_unregister(void)
 
 static int __init gunyah_init(void)
 {
+	int ret;
+
 	arch_gh_hypercall(GH_HYPERCALL_HYP_IDENTIFY, 0, gunyah_api.api_info,
 		gunyah_api.flags[0], gunyah_api.flags[1], gunyah_api.flags[2]);
 
@@ -102,12 +110,24 @@ static int __init gunyah_init(void)
 		return 0;
 	}
 
-	return gh_sysfs_register();
+	ret = gh_sysfs_register();
+	if (ret)
+		return ret;
+
+	ret = gunyah_bus_init();
+	if (ret)
+		goto err_sysfs;
+
+	return ret;
+err_sysfs:
+	gh_sysfs_unregister();
+	return ret;
 }
 module_init(gunyah_init);
 
 static void __exit gunyah_exit(void)
 {
+	gunyah_bus_exit();
 	gh_sysfs_unregister();
 }
 module_exit(gunyah_exit);
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 8743bf4978e2..f169c78881cb 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 #include <linux/errno.h>
+#include <linux/device.h>
 #include <asm/gunyah/hypercall.h>
 
 typedef u64 gh_capid_t;
@@ -71,4 +72,48 @@ static inline int gh_remap_error(int gh_error)
 	}
 }
 
+/* Follows resource manager's resource types for VM_GET_HYP_RESOURCES */
+#define GUNYAH_DEVICE_TYPE_BELL_TX	0
+#define GUNYAH_DEVICE_TYPE_BELL_RX	1
+#define GUNYAH_DEVICE_TYPE_MSGQ_TX	2
+#define GUNYAH_DEVICE_TYPE_MSGQ_RX	3
+#define GUNYAH_DEVICE_TYPE_VCPU		4
+
+struct gunyah_device {
+	u8 type;
+	gh_capid_t capid;
+	int irq;
+
+	struct device dev;
+};
+
+#define to_gunyah_device(dev) container_of(dev, struct gunyah_device, dev)
+
+static inline void *ghdev_get_drvdata(const struct gunyah_device *ghdev)
+{
+	return dev_get_drvdata(&ghdev->dev);
+}
+
+static inline void ghdev_set_drvdata(struct gunyah_device *ghdev, void *data)
+{
+	dev_set_drvdata(&ghdev->dev, data);
+}
+
+struct gunyah_device *gunyah_device_alloc(struct device *parent, gh_capid_t capid, u8 type);
+
+int gunyah_device_add(struct gunyah_device *ghdev);
+void gunyah_device_remove(struct gunyah_device *ghdev);
+
+struct gunyah_driver {
+	struct device_driver driver;
+	u8 type;
+	int (*probe)(struct gunyah_device *ghdev);
+	int (*remove)(struct gunyah_device *ghdev);
+};
+
+#define to_gunyah_driver(drv) container_of(drv, struct gunyah_driver, driver)
+
+int gunyah_register_driver(struct gunyah_driver *ghdrv);
+void gunyah_unregister_driver(struct gunyah_driver *ghdrv);
+
 #endif
-- 
2.25.1

