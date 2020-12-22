Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454F82E091F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 12:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgLVK6s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 05:58:48 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:60534 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725847AbgLVK6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 05:58:47 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BMAv8qB017308;
        Tue, 22 Dec 2020 11:58:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=SW6rkfmrRTc6+NkBZszJEQdtfxV4dOOJDB9c4RqrY0w=;
 b=y+5kV2mzPk0Al9hlLlXmHXhWdQE3W5Z3KEJ0ojV3GHN0yweUp7/dZUB55XaqqlJeqlsc
 IerUqYgeemjMT8aki8DvPuU/1ocMOQo8cmEsr8qdTL+bugVrNUzC7l0vtBwSh5e4nQnG
 oQTYZSGStv9OOcf6mM23RX4MfAItCcHoscpxbpOkh9a5a+L9+5RWJk9zIGQdr6NcPg32
 EcznobaSkd9pSTjwyxm4t9nCWE5tdAtaHHJWXd5c5nABgW95B99cDLe7Iha38RB94NeH
 zTP0HPzt0YEbnWHY/PaUfYXgAY9uJy95LT7eyWiw9puduFqcpZB+QwFsA4BNl/PlvmT6 kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35k7vva3gv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Dec 2020 11:58:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD13910002A;
        Tue, 22 Dec 2020 11:57:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C832E231601;
        Tue, 22 Dec 2020 11:57:59 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:57:59
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 01/16] rpmsg: introduce RPMsg control driver for channel creation
Date:   Tue, 22 Dec 2020 11:57:11 +0100
Message-ID: <20201222105726.16906-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-22_04:2020-12-21,2020-12-22 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RPMsg_ctrl driver is a duplication of the ioctrl part of the
rpmsg_char driver to make generic the ioctl to manage channels by
the userspace applications.

As a first step, this driver just creates the /dev/rpmsg_ctl<x>
( <x> is the instance value). The ioctl is not implemented.

Notice that this driver is associated to a RPMsg device with no endpoint.
Instantiating this device as an RPMsg device allows to retrieve the
associated RPMsg backend.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/Kconfig      |   8 ++
 drivers/rpmsg/Makefile     |   1 +
 drivers/rpmsg/rpmsg_ctrl.c | 208 +++++++++++++++++++++++++++++++++++++
 3 files changed, 217 insertions(+)
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index 0b4407abdf13..c9e602016c3b 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -23,6 +23,14 @@ config RPMSG_NS
 	  channel that probes the associated RPMsg device on remote endpoint
 	  service announcement.
 
+config RPMSG_CTRL
+	tristate "RPMSG control interface"
+	depends on RPMSG
+	help
+	  Say Y here to enable the support of the /dev/rpmsg_ctl API. this API
+	  allows user-space programs to create channels with specific name,
+	  source and destination addresses.
+
 config RPMSG_MTK_SCP
 	tristate "MediaTek SCP"
 	depends on MTK_SCP
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index 8d452656f0ee..3c1bce9d0228 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
 obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
 obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
+obj-$(CONFIG_RPMSG_CTRL)	+= rpmsg_ctrl.o
 obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
 qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
new file mode 100644
index 000000000000..425c3e32ada4
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) STMicroelectronics 2020
+ */
+
+#include <linux/cdev.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include "rpmsg_internal.h"
+#include <uapi/linux/rpmsg.h>
+
+#define RPMSG_DEV_MAX	(MINORMASK + 1)
+
+#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrl_dev, dev)
+#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrl_dev, cdev)
+
+/**
+ * struct rpmsg_ctrl_dev - control device for instantiating endpoint devices
+ * @rpdev:	underlaying rpmsg device
+ * @cdev:	cdev for the ctrl device
+ * @dev:	device for the ctrl device
+ */
+struct rpmsg_ctrl_dev {
+	struct rpmsg_device *rpdev;
+	struct cdev cdev;
+	struct device dev;
+};
+
+static DEFINE_IDA(rpmsg_ctrl_ida);
+static DEFINE_IDA(rpmsg_minor_ida);
+
+static dev_t rpmsg_major;
+
+static int rpmsg_ctrl_dev_open(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_ctrl_dev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
+
+	get_device(&ctrldev->dev);
+	filp->private_data = ctrldev;
+
+	return 0;
+}
+
+static long rpmsg_ctrl_dev_ioctl(struct file *fp, unsigned int cmd,
+				 unsigned long arg)
+{
+	struct rpmsg_ctrl_dev *ctrldev = fp->private_data;
+
+	dev_info(&ctrldev->dev, "Control not yet implemented\n");
+
+	return 0;
+};
+
+static int rpmsg_ctrl_dev_release(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_ctrl_dev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
+
+	put_device(&ctrldev->dev);
+
+	return 0;
+}
+
+static void rpmsg_ctrl_dev_release_device(struct device *dev)
+{
+	struct rpmsg_ctrl_dev *ctrldev = dev_to_ctrldev(dev);
+
+	dev_err(dev, "%s\n", __func__);
+
+	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+	cdev_del(&ctrldev->cdev);
+	kfree(ctrldev);
+}
+
+static const struct file_operations rpmsg_ctrl_fops = {
+	.owner = THIS_MODULE,
+	.open = rpmsg_ctrl_dev_open,
+	.release = rpmsg_ctrl_dev_release,
+	.unlocked_ioctl = rpmsg_ctrl_dev_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
+};
+
+static int rpmsg_ctrl_add_control(struct rpmsg_ctrl_dev *ctrldev)
+{
+	struct device *dev = &ctrldev->dev;
+	int ret;
+
+	cdev_init(&ctrldev->cdev, &rpmsg_ctrl_fops);
+	ctrldev->cdev.owner = THIS_MODULE;
+
+	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
+
+	dev_set_name(dev, "rpmsg_ctrl%d", dev->id);
+
+	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
+	if (ret)
+		goto free_minor_ida;
+
+	dev_info(dev, "add %s control for %s driver\n",
+		 dev_name(dev),  dev_name(dev->parent));
+
+	return 0;
+
+free_minor_ida:
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+
+	return ret;
+}
+
+static int rpmsg_ctrl_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_ctrl_dev *ctrldev;
+	struct device *dev;
+	int ret;
+
+	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
+	if (!ctrldev)
+		return -ENOMEM;
+
+	ctrldev->rpdev = rpdev;
+
+	dev = &ctrldev->dev;
+	device_initialize(dev);
+	dev->parent = &rpdev->dev;
+
+	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
+	if (ret < 0)
+		goto free_ctrldev;
+
+	dev->id = ret;
+
+	ret = rpmsg_ctrl_add_control(ctrldev);
+	if (ret < 0)
+		goto free_ctrl_ida;
+
+	/* We can now rely on the release function for cleanup */
+	dev->release = rpmsg_ctrl_dev_release_device;
+
+	ret = device_add(dev);
+	if (ret) {
+		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
+		put_device(dev);
+		goto free_ctrl_ida;
+	}
+
+	dev_set_drvdata(dev, ctrldev);
+	dev_set_drvdata(&rpdev->dev, ctrldev);
+
+	return 0;
+
+free_ctrl_ida:
+	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+free_ctrldev:
+	put_device(dev);
+	kfree(ctrldev);
+
+	return ret;
+}
+
+static void rpmsg_ctrl_remove(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_ctrl_dev *ctrldev = dev_get_drvdata(&rpdev->dev);
+
+	device_del(&ctrldev->dev);
+	put_device(&ctrldev->dev);
+}
+
+static struct rpmsg_driver rpmsg_ctrl_driver = {
+	.drv.name = KBUILD_MODNAME,
+	.probe = rpmsg_ctrl_probe,
+	.remove = rpmsg_ctrl_remove,
+};
+
+static int rpmsg_ctrl_init(void)
+{
+	int ret;
+
+	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
+	if (ret < 0) {
+		pr_err("rpmsg_ctrl: failed to allocate char dev region\n");
+		return ret;
+	}
+
+	ret = register_rpmsg_driver(&rpmsg_ctrl_driver);
+	if (ret < 0) {
+		pr_err("rpmsg_ctrl: failed to register rpmsg driver\n");
+		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+	}
+
+	return ret;
+}
+postcore_initcall(rpmsg_ctrl_init);
+
+static void rpmsg_ctrl_exit(void)
+{
+	unregister_rpmsg_driver(&rpmsg_ctrl_driver);
+	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+}
+module_exit(rpmsg_ctrl_exit);
+
+MODULE_DESCRIPTION("ioctl rpmsg driver");
+MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
+MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

