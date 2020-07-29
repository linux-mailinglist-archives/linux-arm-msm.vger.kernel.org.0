Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E27C23238C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 19:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgG2Rkg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 13:40:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31009 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbgG2Rke (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 13:40:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596044433; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=39lrdvIfxtpIeAqXdQmNgTrQcnDhLOhkUt/KjQ3YiQk=; b=vGKo5XBWp8SpigBuFlpsHx0rdfvQj2qsfVVthR0a5Syvdv005/XrxQBKZg0N1nxevx8KAQjB
 9KPa22e1LAsMuljKq/rdkdB2V22WaNuc38jEQYAsmZxzy6yF9eCzGVqvisMGTn6xxml+q9hm
 Njyo5wgVLMGquS8c+NWdjS4JvOU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5f21b4858db7256a957abbbb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Jul 2020 17:40:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E22B9C43391; Wed, 29 Jul 2020 17:40:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 10E2DC433C6;
        Wed, 29 Jul 2020 17:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10E2DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        corbet@lwn.net
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v5 1/2] remoteproc: Add remoteproc character device interface
Date:   Wed, 29 Jul 2020 10:40:00 -0700
Message-Id: <1596044401-22083-2-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596044401-22083-1-git-send-email-sidgup@codeaurora.org>
References: <1596044401-22083-1-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the character device interface into remoteproc framework.
This interface can be used in order to boot/shutdown remote
subsystems and provides a basic ioctl based interface to implement
supplementary functionality. An ioctl call is implemented to enable
the shutdown on release feature which will allow remote processors to
be shutdown when the controlling userpsace application crashes or hangs.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
 drivers/remoteproc/Kconfig                         |   9 ++
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/remoteproc_cdev.c               | 124 +++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h           |  28 +++++
 include/linux/remoteproc.h                         |   5 +
 include/uapi/linux/remoteproc_cdev.h               |  37 ++++++
 7 files changed, 205 insertions(+)
 create mode 100644 drivers/remoteproc/remoteproc_cdev.c
 create mode 100644 include/uapi/linux/remoteproc_cdev.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 59472cd..2a19883 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -339,6 +339,7 @@ Code  Seq#    Include File                                           Comments
 0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
 0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
 0xB6  all    linux/fpga-dfl.h
+0xB7  all    uapi/linux/remoteproc_cdev.h                            <mailto:linux-remoteproc@vger.kernel.org>
 0xC0  00-0F  linux/usb/iowarrior.h
 0xCA  00-0F  uapi/misc/cxl.h
 0xCA  10-2F  uapi/misc/ocxl.h
diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48315dc..c6659dfe 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -14,6 +14,15 @@ config REMOTEPROC
 
 if REMOTEPROC
 
+config REMOTEPROC_CDEV
+	bool "Remoteproc character device interface"
+	help
+	  Say y here to have a character device interface for the remoteproc
+	  framework. Userspace can boot/shutdown remote processors through
+	  this interface.
+
+	  It's safe to say N if you don't want to use this interface.
+
 config IMX_REMOTEPROC
 	tristate "IMX6/7 remoteproc support"
 	depends on ARCH_MXC
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 4d4307d..3dfa28e 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -10,6 +10,7 @@ remoteproc-y				+= remoteproc_debugfs.o
 remoteproc-y				+= remoteproc_sysfs.o
 remoteproc-y				+= remoteproc_virtio.o
 remoteproc-y				+= remoteproc_elf_loader.o
+obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
 obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
 obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
new file mode 100644
index 0000000..a7ac11c
--- /dev/null
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Character device interface driver for Remoteproc framework.
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/cdev.h>
+#include <linux/compat.h>
+#include <linux/fs.h>
+#include <linux/module.h>
+#include <linux/remoteproc.h>
+#include <linux/uaccess.h>
+#include <uapi/linux/remoteproc_cdev.h>
+
+#include "remoteproc_internal.h"
+
+#define NUM_RPROC_DEVICES	64
+static dev_t rproc_major;
+
+static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_t len, loff_t *pos)
+{
+	struct rproc *rproc = container_of(filp->f_inode->i_cdev, struct rproc, cdev);
+	int ret = 0;
+	char cmd[10];
+
+	if (!len || len > sizeof(cmd))
+		return -EINVAL;
+
+	ret = copy_from_user(cmd, buf, len);
+	if (ret)
+		return -EFAULT;
+
+	if (!strncmp(cmd, "start", len)) {
+		if (rproc->state == RPROC_RUNNING)
+			return -EBUSY;
+
+		ret = rproc_boot(rproc);
+	} else if (!strncmp(cmd, "stop", len)) {
+		if (rproc->state != RPROC_RUNNING)
+			return -EINVAL;
+
+		rproc_shutdown(rproc);
+	} else {
+		dev_err(&rproc->dev, "Unrecognized option\n");
+		ret = -EINVAL;
+	}
+
+	return ret ? ret : len;
+}
+
+static long rproc_device_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
+{
+	struct rproc *rproc = container_of(filp->f_inode->i_cdev, struct rproc, cdev);
+	void __user *argp = (void __user *)arg;
+	int32_t param;
+
+	switch (ioctl) {
+	case RPROC_SET_SHUTDOWN_ON_RELEASE:
+		if (copy_from_user(&param, argp, sizeof(int32_t)))
+			return -EFAULT;
+
+		rproc->cdev_put_on_release = !!param;
+		break;
+	case RPROC_GET_SHUTDOWN_ON_RELEASE:
+		param = (int32_t)rproc->cdev_put_on_release;
+		if (copy_to_user(argp, &param, sizeof(int32_t)))
+			return -EFAULT;
+
+		break;
+	default:
+		dev_err(&rproc->dev, "Unsupported ioctl\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rproc_cdev_release(struct inode *inode, struct file *filp)
+{
+	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
+
+	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
+		rproc_shutdown(rproc);
+
+	return 0;
+}
+
+static const struct file_operations rproc_fops = {
+	.write = rproc_cdev_write,
+	.unlocked_ioctl = rproc_device_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
+	.release = rproc_cdev_release,
+};
+
+int rproc_char_device_add(struct rproc *rproc)
+{
+	int ret;
+
+	cdev_init(&rproc->cdev, &rproc_fops);
+	rproc->cdev.owner = THIS_MODULE;
+
+	rproc->dev.devt = MKDEV(MAJOR(rproc_major), rproc->index);
+	cdev_set_parent(&rproc->cdev, &rproc->dev.kobj);
+	ret = cdev_add(&rproc->cdev, rproc->dev.devt, 1);
+	if (ret < 0)
+		dev_err(&rproc->dev, "Failed to add char dev for %s\n", rproc->name);
+
+	return ret;
+}
+
+void rproc_char_device_remove(struct rproc *rproc)
+{
+	__unregister_chrdev(MAJOR(rproc->dev.devt), rproc->index, 1, "remoteproc");
+}
+
+void __init rproc_init_cdev(void)
+{
+	int ret;
+
+	ret = alloc_chrdev_region(&rproc_major, 0, NUM_RPROC_DEVICES, "remoteproc");
+	if (ret < 0)
+		pr_err("Failed to alloc rproc_cdev region, err %d\n", ret);
+}
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index cd4176b..c340028 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -53,6 +53,34 @@ void rproc_exit_sysfs(void);
 void rproc_coredump_cleanup(struct rproc *rproc);
 void rproc_coredump(struct rproc *rproc);
 
+#ifdef CONFIG_REMOTEPROC_CDEV
+void rproc_init_cdev(void);
+void rproc_exit_cdev(void);
+int rproc_char_device_add(struct rproc *rproc);
+void rproc_char_device_remove(struct rproc *rproc);
+#else
+static inline void rproc_init_cdev(void)
+{
+}
+
+static inline void rproc_exit_cdev(void)
+{
+}
+
+/*
+ * The character device interface is an optional feature, if it is not enabled
+ * the function should not return an error.
+ */
+static inline int rproc_char_device_add(struct rproc *rproc)
+{
+	return 0;
+}
+
+static inline void  rproc_char_device_remove(struct rproc *rproc)
+{
+}
+#endif
+
 void rproc_free_vring(struct rproc_vring *rvring);
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 0e8d2ff..2fa68bf 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -38,6 +38,7 @@
 #include <linux/types.h>
 #include <linux/mutex.h>
 #include <linux/virtio.h>
+#include <linux/cdev.h>
 #include <linux/completion.h>
 #include <linux/idr.h>
 #include <linux/of.h>
@@ -509,6 +510,8 @@ struct rproc_dump_segment {
  * @autonomous: true if an external entity has booted the remote processor
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
+ * @char_dev: character device of the rproc
+ * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
  */
 struct rproc {
 	struct list_head node;
@@ -546,6 +549,8 @@ struct rproc {
 	int nb_vdev;
 	u8 elf_class;
 	u16 elf_machine;
+	struct cdev cdev;
+	bool cdev_put_on_release;
 };
 
 /**
diff --git a/include/uapi/linux/remoteproc_cdev.h b/include/uapi/linux/remoteproc_cdev.h
new file mode 100644
index 0000000..c43768e
--- /dev/null
+++ b/include/uapi/linux/remoteproc_cdev.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * IOCTLs for Remoteproc's character device interface.
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _UAPI_REMOTEPROC_CDEV_H_
+#define _UAPI_REMOTEPROC_CDEV_H_
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#define RPROC_MAGIC	0xB7
+
+/*
+ * The RPROC_SET_SHUTDOWN_ON_RELEASE ioctl allows to enable/disable the shutdown of a remote
+ * processor automatically when the controlling userpsace closes the char device interface.
+ *
+ * input parameter: integer
+ *   0		: disable automatic shutdown
+ *   other	: enable automatic shutdown
+ */
+#define RPROC_SET_SHUTDOWN_ON_RELEASE _IOW(RPROC_MAGIC, 1, __s32)
+
+/*
+ * The RPROC_GET_SHUTDOWN_ON_RELEASE ioctl gets information about whether the automatic shutdown of
+ * a remote processor is enabled or disabled when the controlling userspace closes the char device
+ * interface.
+ *
+ * output parameter: integer
+ *   0		: automatic shutdown disable
+ *   other	: automatic shutdown enable
+ */
+#define RPROC_GET_SHUTDOWN_ON_RELEASE _IOR(RPROC_MAGIC, 2, __s32)
+
+#endif
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

