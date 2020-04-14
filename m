Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930C71A724F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 06:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405123AbgDNEKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 00:10:11 -0400
Received: from m17618.mail.qiye.163.com ([59.111.176.18]:11213 "EHLO
        m17618.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405116AbgDNEKJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 00:10:09 -0400
Received: from ubuntu.localdomain (unknown [58.251.74.227])
        by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 419AD4E1583;
        Tue, 14 Apr 2020 12:00:26 +0800 (CST)
From:   Wang Wenhu <wenhu.wang@vivo.com>
To:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, kernel@vivo.com, agross@kernel.org,
        bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Wang Wenhu <wenhu.wang@vivo.com>
Subject: [PATCH v3,1/3] driver: rpmon: new driver Remote Processor Monitor
Date:   Mon, 13 Apr 2020 20:59:47 -0700
Message-Id: <20200414035949.107225-2-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414035949.107225-1-wenhu.wang@vivo.com>
References: <20200412112405.24116-1-wenhu.wang@vivo.com>
 <20200414035949.107225-1-wenhu.wang@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSVVCTEtCQkJCTk1KSEtCQ1lXWShZQU
        hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MjI6Khw*TTg#KAoaPTxKPhQO
        TAswC0pVSlVKTkNNQ0hNQ0lNQ09MVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
        Q1VJTkpVTE9VSUlMWVdZCAFZQUpCT0NMNwY+
X-HM-Tid: 0a7176d869f09376kuws419ad4e1583
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RPMON is a driver framework. It supports remote processor monitor
from user level. The basic components are a character device
with sysfs interfaces for user space communication and different
kinds of message drivers introduced modularly, which are used to
communicate with remote processors.

As for user space, one can get notifications of different events
of remote processors, like their registrations, through standard
file read operation of the file descriptors related to the exported
character devices. Actions can also be taken into account via
standard write operations to the devices. Besides, the sysfs class
attributes could be accessed conveniently.

Message drivers act as engines to communicate with remote processors.
Currently RPMON_QMI is available which uses QMI infrastructures
on Qualcomm SoC Platforms.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
---
Changes since v1:
 - Addressed review comments from Randy
Changes since v2:
 - Log message typo
 - Added Cc list
---
 drivers/Kconfig        |   2 +
 drivers/Makefile       |   1 +
 drivers/rpmon/Kconfig  |  26 +++
 drivers/rpmon/Makefile |   1 +
 drivers/rpmon/rpmon.c  | 506 +++++++++++++++++++++++++++++++++++++++++
 include/linux/rpmon.h  |  68 ++++++
 6 files changed, 604 insertions(+)
 create mode 100644 drivers/rpmon/Kconfig
 create mode 100644 drivers/rpmon/Makefile
 create mode 100644 drivers/rpmon/rpmon.c
 create mode 100644 include/linux/rpmon.h

diff --git a/drivers/Kconfig b/drivers/Kconfig
index dcecc9f6e33f..40409d8a87b3 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -166,6 +166,8 @@ source "drivers/remoteproc/Kconfig"
 
 source "drivers/rpmsg/Kconfig"
 
+source "drivers/rpmon/Kconfig"
+
 source "drivers/soundwire/Kconfig"
 
 source "drivers/soc/Kconfig"
diff --git a/drivers/Makefile b/drivers/Makefile
index c0cd1b9075e3..75d215cd9136 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -155,6 +155,7 @@ obj-$(CONFIG_MAILBOX)		+= mailbox/
 obj-$(CONFIG_HWSPINLOCK)	+= hwspinlock/
 obj-$(CONFIG_REMOTEPROC)	+= remoteproc/
 obj-$(CONFIG_RPMSG)		+= rpmsg/
+obj-$(CONFIG_RPMON)		+= rpmon/
 obj-$(CONFIG_SOUNDWIRE)		+= soundwire/
 
 # Virtualization drivers
diff --git a/drivers/rpmon/Kconfig b/drivers/rpmon/Kconfig
new file mode 100644
index 000000000000..ad0e6d6561ca
--- /dev/null
+++ b/drivers/rpmon/Kconfig
@@ -0,0 +1,26 @@
+#
+# Remote Processor Monitor Drivers
+#
+menu "Remote Processor Monitor Drivers"
+
+config RPMON
+	tristate "Remote Processor Monitor Core Framework"
+	help
+	  RPMON is a driver framework. It supports remote processor monitor
+	  from user level. The basic components are a character device
+	  with sysfs interfaces for user space communication and different
+	  kinds of message drivers introduced modularly, which are used to
+	  communicate with remote processors.
+
+	  As for user space, one can get notifications of different events
+	  of remote processors, like their registrations, through standard
+	  file read operation of the file descriptors related to the exported
+	  character devices. Actions can also be taken into account via
+	  standard write operations to the devices. Besides, the sysfs class
+	  attributes could be accessed conveniently.
+
+	  Message drivers act as engines to communicate with remote processors.
+	  Currently RPMON_QMI is available which uses QMI infrastructures
+	  on Qualcomm SoC Platforms.
+
+endmenu
diff --git a/drivers/rpmon/Makefile b/drivers/rpmon/Makefile
new file mode 100644
index 000000000000..b0f0ec4ecc30
--- /dev/null
+++ b/drivers/rpmon/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_RPMON) += rpmon.o
diff --git a/drivers/rpmon/rpmon.c b/drivers/rpmon/rpmon.c
new file mode 100644
index 000000000000..72262b010a68
--- /dev/null
+++ b/drivers/rpmon/rpmon.c
@@ -0,0 +1,506 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Vivo Communication Technology Co. Ltd.
+ * Copyright (C) 2020 Wang Wenhu <wenhu.wang@vivo.com>
+ * All rights reserved.
+ *
+ * RPMON: An implementation of remote processor monitor framework
+ * for modern SoCs that typically have heterogeneous remote processor
+ * devices in asymmetric multiprocessing configurations. It is
+ * implemented with chardev and sysfs class, which act as interfaces
+ * to communicate with user level. It supports different communication
+ * interfaces added modularly to communicate with remote processors.
+ * Currently QMI implementation, named RPMON_QMI, is available.
+ *
+ * RPMON could be used to detect the stabilities of remote processors,
+ * collect any kinds of information you are interested in, take
+ * actions like connection status check, and so on. Enhancements
+ * can be made upon current implementation.
+ */
+
+#include <linux/module.h>
+#include <linux/cdev.h>
+#include <linux/rpmon.h>
+
+#define RPMON_MAX_DEVICES	(1U << MINORBITS)
+#define RPMON_NAME			"rpmon"
+
+static int rpmon_major;
+static struct cdev *rpmon_cdev;
+static DEFINE_IDR(rpmon_idr);
+static const struct file_operations rpmon_fops;
+
+/* Protect idr accesses */
+static DEFINE_MUTEX(minor_lock);
+
+static ssize_t name_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	struct rpmon_device *rpmondev = dev_get_drvdata(dev);
+	int ret;
+
+	mutex_lock(&rpmondev->info_lock);
+	if (!rpmondev->info) {
+		ret = -EINVAL;
+		dev_err(dev, "the device has been unregistered\n");
+		goto out;
+	}
+
+	ret = sprintf(buf, "%s\n", rpmondev->info->name);
+
+out:
+	mutex_unlock(&rpmondev->info_lock);
+	return ret;
+}
+static DEVICE_ATTR_RO(name);
+
+static ssize_t version_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct rpmon_device *rpmondev = dev_get_drvdata(dev);
+	int ret;
+
+	mutex_lock(&rpmondev->info_lock);
+	if (!rpmondev->info) {
+		ret = -EINVAL;
+		dev_err(dev, "the device has been unregistered\n");
+		goto out;
+	}
+
+	ret = sprintf(buf, "%s\n", rpmondev->info->version);
+
+out:
+	mutex_unlock(&rpmondev->info_lock);
+	return ret;
+}
+static DEVICE_ATTR_RO(version);
+
+static struct attribute *rpmon_attrs[] = {
+	&dev_attr_name.attr,
+	&dev_attr_version.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(rpmon);
+
+/* RPMON class infrastructure */
+static struct class rpmon_class = {
+	.name = RPMON_NAME,
+	.dev_groups = rpmon_groups,
+};
+
+static bool rpmon_class_registered;
+
+static int rpmon_get_minor(struct rpmon_device *rpmondev)
+{
+	int ret = -ENOMEM;
+
+	mutex_lock(&minor_lock);
+	ret = idr_alloc(&rpmon_idr, rpmondev, 0, RPMON_MAX_DEVICES, GFP_KERNEL);
+	if (ret >= 0) {
+		rpmondev->minor = ret;
+		ret = 0;
+	} else if (ret == -ENOSPC) {
+		dev_err(&rpmondev->dev, "too many rpmon devices\n");
+		ret = -EINVAL;
+	}
+	mutex_unlock(&minor_lock);
+	return ret;
+}
+
+static void rpmon_free_minor(struct rpmon_device *rpmondev)
+{
+	mutex_lock(&minor_lock);
+	idr_remove(&rpmon_idr, rpmondev->minor);
+	mutex_unlock(&minor_lock);
+}
+
+/**
+ * rpmon_event_notify - trigger an notify event
+ * @info:  RPMON device capabilities
+ * @event: RPMON event to be triggered
+ */
+void rpmon_event_notify(struct rpmon_info *info, u32 event)
+{
+	struct rpmon_device *rpmondev = info->rpmon_dev;
+
+	if (event >= RPMON_EVENT_MAX) {
+		pr_err("Error unsupported rpmon event %d", event);
+		return;
+	}
+
+	atomic_set(&rpmondev->event, RPMON_EVENT(event));
+	wake_up_interruptible(&rpmondev->wait);
+	kill_fasync(&rpmondev->async_queue, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(rpmon_event_notify);
+
+static int rpmon_open(struct inode *inode, struct file *filep)
+{
+	struct rpmon_device *rpmondev;
+	int ret = 0;
+
+	mutex_lock(&minor_lock);
+	rpmondev = idr_find(&rpmon_idr, iminor(inode));
+	mutex_unlock(&minor_lock);
+	if (!rpmondev) {
+		ret = -ENODEV;
+		goto err_out;
+	}
+
+	get_device(&rpmondev->dev);
+
+	if (!try_module_get(rpmondev->owner)) {
+		ret = -ENODEV;
+		goto err_module_get;
+	}
+
+	filep->private_data = rpmondev;
+
+	mutex_lock(&rpmondev->info_lock);
+	if (!rpmondev->info) {
+		mutex_unlock(&rpmondev->info_lock);
+		ret = -EINVAL;
+		goto err_module_get;
+	}
+
+	if (rpmondev->info->open)
+		ret = rpmondev->info->open(rpmondev->info, inode);
+	mutex_unlock(&rpmondev->info_lock);
+	if (ret)
+		goto err_module_get;
+
+	return ret;
+
+err_module_get:
+	put_device(&rpmondev->dev);
+
+err_out:
+	return ret;
+}
+
+static int rpmon_release(struct inode *inode, struct file *filep)
+{
+	struct rpmon_device *rpmondev = filep->private_data;
+	int ret = 0;
+
+	mutex_lock(&rpmondev->info_lock);
+	if (rpmondev->info && rpmondev->info->release)
+		ret = rpmondev->info->release(rpmondev->info, inode);
+	mutex_unlock(&rpmondev->info_lock);
+
+	module_put(rpmondev->owner);
+	put_device(&rpmondev->dev);
+	return ret;
+}
+
+static __poll_t rpmon_poll(struct file *filep, poll_table *wait)
+{
+	struct rpmon_device *rpmondev = filep->private_data;
+
+	mutex_lock(&rpmondev->info_lock);
+	if (!rpmondev->info) {
+		mutex_unlock(&rpmondev->info_lock);
+		return -EIO;
+	}
+	mutex_unlock(&rpmondev->info_lock);
+
+	poll_wait(filep, &rpmondev->wait, wait);
+	if (!atomic_read(&rpmondev->event))
+		return EPOLLIN | EPOLLRDNORM;
+	return 0;
+}
+
+static ssize_t rpmon_read(struct file *filep, char __user *buf,
+			  size_t count, loff_t *ppos)
+{
+	struct rpmon_device *rpmondev = filep->private_data;
+	DECLARE_WAITQUEUE(wait, current);
+	ssize_t ret = 0;
+	u32 event;
+
+	if (count != sizeof(u32))
+		return -EINVAL;
+
+	add_wait_queue(&rpmondev->wait, &wait);
+
+	do {
+		mutex_lock(&rpmondev->info_lock);
+		if (!rpmondev->info) {
+			ret = -EIO;
+			mutex_unlock(&rpmondev->info_lock);
+			break;
+		}
+		mutex_unlock(&rpmondev->info_lock);
+
+		set_current_state(TASK_INTERRUPTIBLE);
+
+		event = atomic_read(&rpmondev->event);
+		if (event) {
+			__set_current_state(TASK_RUNNING);
+			if (copy_to_user(buf, &event, count))
+				ret = -EFAULT;
+			else {
+				atomic_set(&rpmondev->event, 0);
+				ret = count;
+			}
+			break;
+		}
+
+		if (filep->f_flags & O_NONBLOCK) {
+			ret = -EAGAIN;
+			break;
+		}
+
+		if (signal_pending(current)) {
+			ret = -ERESTARTSYS;
+			break;
+		}
+		schedule();
+	} while (1);
+
+	__set_current_state(TASK_RUNNING);
+	remove_wait_queue(&rpmondev->wait, &wait);
+
+	return ret;
+}
+
+static ssize_t rpmon_write(struct file *filep, const char __user *buf,
+			   size_t count, loff_t *ppos)
+{
+	struct rpmon_device *rpmondev = filep->private_data;
+	ssize_t ret;
+	u32 action;
+
+	if (count != sizeof(u32))
+		return -EINVAL;
+
+	if (copy_from_user(&action, buf, count))
+		return -EFAULT;
+
+	mutex_lock(&rpmondev->info_lock);
+	if (!rpmondev->info) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (!rpmondev->info->monitor) {
+		ret = -ENOTSUPP;
+		goto out;
+	}
+
+	if (rpmondev->info->monitor)
+		ret = rpmondev->info->monitor(rpmondev->info, action);
+out:
+	mutex_unlock(&rpmondev->info_lock);
+	return ret ? ret : sizeof(u32);
+}
+
+static const struct file_operations rpmon_fops = {
+	.owner		= THIS_MODULE,
+	.open		= rpmon_open,
+	.read		= rpmon_read,
+	.write		= rpmon_write,
+	.poll		= rpmon_poll,
+	.release	= rpmon_release,
+};
+
+static int rpmon_major_init(void)
+{
+	static const char name[] = RPMON_NAME;
+	struct cdev *cdev = NULL;
+	dev_t rpmon_dev = 0;
+	int ret;
+
+	ret = alloc_chrdev_region(&rpmon_dev, 0, RPMON_MAX_DEVICES, name);
+	if (ret)
+		goto out;
+
+	ret = -ENOMEM;
+	cdev = cdev_alloc();
+	if (!cdev)
+		goto out_unregister;
+
+	cdev->owner = THIS_MODULE;
+	cdev->ops = &rpmon_fops;
+	kobject_set_name(&cdev->kobj, "%s", name);
+
+	ret = cdev_add(cdev, rpmon_dev, RPMON_MAX_DEVICES);
+	if (ret)
+		goto out_put;
+
+	rpmon_major = MAJOR(rpmon_dev);
+	rpmon_cdev = cdev;
+	return 0;
+out_put:
+	kobject_put(&cdev->kobj);
+out_unregister:
+	unregister_chrdev_region(rpmon_dev, RPMON_MAX_DEVICES);
+out:
+	return ret;
+}
+
+
+static void rpmon_major_cleanup(void)
+{
+	unregister_chrdev_region(MKDEV(rpmon_major, 0), RPMON_MAX_DEVICES);
+	cdev_del(rpmon_cdev);
+}
+
+static int init_rpmon_class(void)
+{
+	int ret;
+
+	/* Allocate and add char device to the system. */
+	ret = rpmon_major_init();
+	if (ret)
+		goto exit;
+
+	ret = class_register(&rpmon_class);
+	if (ret) {
+		pr_err("class_register failed for rpmon\n");
+		goto err_class_register;
+	}
+
+	rpmon_class_registered = true;
+
+	return 0;
+
+err_class_register:
+	rpmon_major_cleanup();
+exit:
+	return ret;
+}
+
+static void release_rpmon_class(void)
+{
+	rpmon_class_registered = false;
+	class_unregister(&rpmon_class);
+	rpmon_major_cleanup();
+}
+
+static void rpmon_device_release(struct device *dev)
+{
+	struct rpmon_device *rpmondev = dev_get_drvdata(dev);
+
+	kfree(rpmondev);
+}
+
+/**
+ * rpmon_register_device - register a new rpmon interface device
+ * @owner:	module that creates the new device
+ * @parent:	parent device
+ * @info:	rpmon device capabilities
+ *
+ * return:	zero on success or a negative error code.
+ */
+int __rpmon_register_device(struct module *owner,
+			    struct device *parent,
+			    struct rpmon_info *info)
+{
+	struct rpmon_device *rpmondev;
+	int ret = 0;
+
+	if (!rpmon_class_registered)
+		return -EPROBE_DEFER;
+
+	if (!parent || !info || !info->name || !info->version)
+		return -EINVAL;
+
+	info->rpmon_dev = NULL;
+
+	rpmondev = kzalloc(sizeof(*rpmondev), GFP_KERNEL);
+	if (!rpmondev)
+		return -ENOMEM;
+
+	rpmondev->owner = owner;
+	rpmondev->info = info;
+	mutex_init(&rpmondev->info_lock);
+	init_waitqueue_head(&rpmondev->wait);
+	atomic_set(&rpmondev->event, 0);
+
+	ret = rpmon_get_minor(rpmondev);
+	if (ret) {
+		kfree(rpmondev);
+		return ret;
+	}
+
+	device_initialize(&rpmondev->dev);
+	rpmondev->dev.devt = MKDEV(rpmon_major, rpmondev->minor);
+	rpmondev->dev.class = &rpmon_class;
+	rpmondev->dev.parent = parent;
+	rpmondev->dev.release = rpmon_device_release;
+	dev_set_drvdata(&rpmondev->dev, rpmondev);
+
+	ret = dev_set_name(&rpmondev->dev, RPMON_NAME"%d", rpmondev->minor);
+	if (ret)
+		goto err_device_create;
+
+	ret = device_add(&rpmondev->dev);
+	if (ret)
+		goto err_device_create;
+
+	if (rpmondev->info->rpmon_dev_add_attrs) {
+		ret = rpmondev->info->rpmon_dev_add_attrs(rpmondev);
+		if (ret)
+			goto err_dev_add_attrs;
+	}
+
+	info->rpmon_dev = rpmondev;
+
+	return 0;
+
+err_dev_add_attrs:
+	device_del(&rpmondev->dev);
+err_device_create:
+	rpmon_free_minor(rpmondev);
+	put_device(&rpmondev->dev);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(__rpmon_register_device);
+
+/**
+ * rpmon_unregister_device - unregister a rpmon interface device
+ * @info:	rpmon device capabilities
+ */
+void rpmon_unregister_device(struct rpmon_info *info)
+{
+	struct rpmon_device *rpmondev;
+
+	if (!info || !info->rpmon_dev)
+		return;
+
+	rpmondev = info->rpmon_dev;
+
+	rpmon_free_minor(rpmondev);
+
+	mutex_lock(&rpmondev->info_lock);
+
+	if (rpmondev->info->rpmon_dev_add_attrs)
+		rpmondev->info->rpmon_dev_del_attrs(rpmondev);
+
+	rpmondev->info = NULL;
+	mutex_unlock(&rpmondev->info_lock);
+
+	wake_up_interruptible(&rpmondev->wait);
+	kill_fasync(&rpmondev->async_queue, SIGIO, POLL_IN);
+
+	device_unregister(&rpmondev->dev);
+}
+EXPORT_SYMBOL_GPL(rpmon_unregister_device);
+
+static int __init rpmon_init(void)
+{
+	return init_rpmon_class();
+}
+subsys_initcall(rpmon_init);
+
+static void rpmon_exit(void)
+{
+	release_rpmon_class();
+	idr_destroy(&rpmon_idr);
+}
+module_exit(rpmon_exit);
+
+MODULE_AUTHOR("Wang Wenhu <wenhu.wang@vivo.com>");
+MODULE_DESCRIPTION("Remote Processor Monitor Core Framework");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/rpmon.h b/include/linux/rpmon.h
new file mode 100644
index 000000000000..4bbcdeefebee
--- /dev/null
+++ b/include/linux/rpmon.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Vivo Communication Technology Co. Ltd.
+ * Copyright (C) 2020 Wang Wenhu <wenhu.wang@vivo.com>
+ * All rights reserved.
+ */
+
+#ifndef RPMON_H
+#define RPMON_H
+
+#include <net/sock.h>
+
+/* RPMON action would be taken */
+enum rpmon_exec {
+	RPMON_EXEC_CHECK_CONN = 0,
+	RPMON_EXEC_MAX,
+};
+
+/* RPMON events that may be notified */
+enum rpmon_event {
+	RPMON_EVENT_CHKCONN_FAIL = 0,
+	RPMON_EVENT_REGISTER,
+	RPMON_EVENT_MAX,
+};
+
+#define RPMON_EVENT(x)		(0x1 << (x))
+#define RPMON_ACTION(x)		(0x1 << (x))
+
+struct rpmon_device {
+	struct module		*owner;
+	struct device		dev;
+	int			minor;
+	atomic_t		event;
+	struct fasync_struct	*async_queue;
+	wait_queue_head_t	wait;
+	struct rpmon_info	*info;
+	struct mutex		info_lock;
+	struct kobject		*map_dir;
+};
+
+struct rpmon_info {
+	struct rpmon_device	*rpmon_dev;
+	const char		*name;
+	const char		*version;
+	void			*priv;
+	u32			event;
+
+	int (*open)(struct rpmon_info *info, struct inode *inode);
+	int (*release)(struct rpmon_info *info, struct inode *inode);
+	int (*monitor)(struct rpmon_info *info, u32 event);
+	int (*rpmon_dev_add_attrs)(struct rpmon_device *rpmondev);
+	void (*rpmon_dev_del_attrs)(struct rpmon_device *rpmondev);
+};
+
+extern int __must_check
+	__rpmon_register_device(struct module *owner,
+				struct device *parent,
+				struct rpmon_info *info);
+
+/* Use a define to avoid include chaining to get THIS_MODULE */
+#define rpmon_register_device(parent, info) \
+	__rpmon_register_device(THIS_MODULE, parent, info)
+
+extern void rpmon_unregister_device(struct rpmon_info *info);
+
+extern void rpmon_event_notify(struct rpmon_info *info, u32 event);
+
+#endif /* RPMON_H */
-- 
2.17.1

