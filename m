Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E859823D6E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 08:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgHFGlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 02:41:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60057 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728276AbgHFGlX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 02:41:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596696081; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=vgUk6mmTzqnIKIInm//Hn+kH8vZ7rwfVi+2tmcJq/R4=; b=oY2kI8pToHDL/eVW+pYzzTwGxzYYBHe3GLGPkPBMfgRCdU+10j0HlO56E9Xk9W+WzqUTDmLv
 robaA18EMY9Ldz81mzweDLlSt8NtRlzEDxwS0g+mp2mYHyd/7rBMQkQXxjwlbF+7Gi1yi3QB
 XeJ7Y9PosHU3PVVMrm4hXJztEiw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-west-2.postgun.com with SMTP id
 5f2ba60a2f4952907d09d8c9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 Aug 2020 06:41:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3BBABC433C6; Thu,  6 Aug 2020 06:41:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4BDF0C433CA;
        Thu,  6 Aug 2020 06:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4BDF0C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     gregkh@linuxfoundation.org, manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v5 4/4] bus: mhi: clients: Add userspace client interface driver
Date:   Wed,  5 Aug 2020 23:41:03 -0700
Message-Id: <1596696063-17802-5-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596696063-17802-1-git-send-email-hemantk@codeaurora.org>
References: <1596696063-17802-1-git-send-email-hemantk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This MHI client driver allows userspace clients to transfer
raw data between MHI device and host using standard file operations.
Device file node is created with format

/dev/mhi_<controller_name>_<mhi_device_name>

Currently it supports LOOPBACK channel.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/Kconfig          |   6 +
 drivers/bus/mhi/Makefile         |   1 +
 drivers/bus/mhi/clients/Kconfig  |  15 +
 drivers/bus/mhi/clients/Makefile |   3 +
 drivers/bus/mhi/clients/uci.c    | 662 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 687 insertions(+)
 create mode 100644 drivers/bus/mhi/clients/Kconfig
 create mode 100644 drivers/bus/mhi/clients/Makefile
 create mode 100644 drivers/bus/mhi/clients/uci.c

diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index 6a217ff..927c392 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -20,3 +20,9 @@ config MHI_BUS_DEBUG
 	 Enable debugfs support for use with the MHI transport. Allows
 	 reading and/or modifying some values within the MHI controller
 	 for debug and test purposes.
+
+if MHI_BUS
+
+source "drivers/bus/mhi/clients/Kconfig"
+
+endif
diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
index 19e6443..48f6028 100644
--- a/drivers/bus/mhi/Makefile
+++ b/drivers/bus/mhi/Makefile
@@ -1,2 +1,3 @@
 # core layer
 obj-y += core/
+obj-y += clients/
diff --git a/drivers/bus/mhi/clients/Kconfig b/drivers/bus/mhi/clients/Kconfig
new file mode 100644
index 0000000..37aaf51
--- /dev/null
+++ b/drivers/bus/mhi/clients/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "MHI clients support"
+
+config MHI_UCI
+       tristate "MHI UCI"
+       depends on MHI_BUS
+       help
+	 MHI based userspace client interface driver is used for transferring
+	 raw data between host and device using standard file operations from
+	 userspace. Open, read, write, and close operations are supported
+	 by this driver. Please check mhi_uci_match_table for all supported
+	 channels that are exposed to userspace.
+
+endmenu
diff --git a/drivers/bus/mhi/clients/Makefile b/drivers/bus/mhi/clients/Makefile
new file mode 100644
index 0000000..cd34282
--- /dev/null
+++ b/drivers/bus/mhi/clients/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_MHI_UCI) += uci.o
diff --git a/drivers/bus/mhi/clients/uci.c b/drivers/bus/mhi/clients/uci.c
new file mode 100644
index 0000000..a25d5d0
--- /dev/null
+++ b/drivers/bus/mhi/clients/uci.c
@@ -0,0 +1,662 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.*/
+
+#include <linux/kernel.h>
+#include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/poll.h>
+
+#define DEVICE_NAME "mhi"
+#define MHI_UCI_DRIVER_NAME "mhi_uci"
+#define MAX_UCI_MINORS (128)
+
+static DEFINE_IDR(uci_idr);
+static DEFINE_MUTEX(uci_idr_mutex);
+static struct class *uci_dev_class;
+static int uci_dev_major = -1;
+
+/**
+ * struct uci_chan - MHI channel for a uci device
+ * @wq: wait queue for reader/writer
+ * @lock: spin lock
+ * @pending: list of rx buffers userspace is waiting to read
+ * @cur_buf: current buffer userspace is reading
+ * @rx_size: size of the current rx buffer userspace is reading
+ */
+struct uci_chan {
+	wait_queue_head_t wq;
+
+	/* protects pending and cur_buf members */
+	spinlock_t lock;
+
+	struct list_head pending;
+	struct uci_buf *cur_buf;
+	size_t rx_size;
+};
+
+/**
+ * struct uci_buf - uci buffer
+ * @data: data buffer
+ * @len: length of data buffer
+ * @node: list node of the uci buffer
+ */
+struct uci_buf {
+	void *data;
+	size_t len;
+	struct list_head node;
+};
+
+/**
+ * struct uci_dev - MHI uci device
+ * @minor: uci device node minor number
+ * @mhi_dev: associated mhi device object
+ * @chan: MHI channel name
+ * @lock: mutex lock
+ * @ul_chan: uplink uci channel object
+ * @dl_chan: downlink uci channel object
+ * @mtu: max tx buffer length
+ * @actual_mtu: maximum size of incoming buffer
+ * @ref_count: uci_dev reference count
+ * @open_count: device node open count
+ * @enabled: uci device probed
+ */
+struct uci_dev {
+	unsigned int minor;
+	struct mhi_device *mhi_dev;
+	const char *chan;
+
+	/* protects uci_dev struct members */
+	struct mutex lock;
+
+	struct uci_chan ul_chan;
+	struct uci_chan dl_chan;
+	size_t mtu;
+	size_t actual_mtu;
+	struct kref ref_count;
+	struct kref open_count;
+	bool enabled;
+};
+
+static int mhi_queue_inbound(struct uci_dev *udev)
+{
+	struct mhi_device *mhi_dev = udev->mhi_dev;
+	struct device *dev = &mhi_dev->dev;
+	size_t mtu = udev->mtu;
+	size_t actual_mtu = udev->actual_mtu;
+	int nr_trbs, i, ret = -EIO;
+	void *buf;
+	struct uci_buf *uci_buf;
+
+	nr_trbs = mhi_get_no_free_descriptors(mhi_dev, DMA_FROM_DEVICE);
+
+	for (i = 0; i < nr_trbs; i++) {
+		buf = kmalloc(mtu, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+
+		uci_buf = buf + actual_mtu;
+		uci_buf->data = buf;
+
+		dev_dbg(dev, "Allocated buf %d of %d size %ld\n", i, nr_trbs,
+			actual_mtu);
+
+		ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, actual_mtu,
+				    MHI_EOT);
+		if (ret) {
+			kfree(buf);
+			dev_err(dev, "Failed to queue buffer %d\n", i);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static void mhi_uci_dev_release(struct kref *ref)
+{
+	struct uci_dev *udev =
+		container_of(ref, struct uci_dev, ref_count);
+
+	mutex_destroy(&udev->lock);
+
+	dev_set_drvdata(&udev->mhi_dev->dev, NULL);
+
+	kfree(udev);
+}
+
+static void mhi_uci_close(struct kref *ref)
+{
+	struct uci_dev *udev =
+		container_of(ref, struct uci_dev, open_count);
+	struct uci_buf *itr, *tmp;
+	struct uci_chan *uchan;
+
+	if (udev->enabled)
+		mhi_unprepare_from_transfer(udev->mhi_dev);
+
+	/* clean inbound channel */
+	uchan = &udev->dl_chan;
+
+	spin_lock_bh(&uchan->lock);
+	list_for_each_entry_safe(itr, tmp, &uchan->pending, node) {
+		list_del(&itr->node);
+		kfree(itr->data);
+	}
+
+	if (uchan->cur_buf)
+		kfree(uchan->cur_buf->data);
+
+	uchan->cur_buf = NULL;
+	spin_unlock_bh(&uchan->lock);
+}
+
+static int mhi_uci_release(struct inode *inode, struct file *file)
+{
+	struct uci_dev *udev = file->private_data;
+
+	kref_put(&udev->open_count, mhi_uci_close);
+	kref_put(&udev->ref_count, mhi_uci_dev_release);
+
+	return 0;
+}
+
+static __poll_t mhi_uci_poll(struct file *file, poll_table *wait)
+{
+	struct uci_dev *udev = file->private_data;
+	struct mhi_device *mhi_dev = udev->mhi_dev;
+	struct device *dev = &mhi_dev->dev;
+	struct uci_chan *uchan;
+	__poll_t mask = 0;
+
+	poll_wait(file, &udev->dl_chan.wq, wait);
+	poll_wait(file, &udev->ul_chan.wq, wait);
+
+	if (!udev->enabled) {
+		mask = EPOLLERR;
+	} else {
+		uchan = &udev->dl_chan;
+		spin_lock_bh(&uchan->lock);
+		if (!list_empty(&uchan->pending) || uchan->cur_buf) {
+			dev_dbg(dev, "Client can read from node\n");
+			mask |= EPOLLIN | EPOLLRDNORM;
+		}
+		spin_unlock_bh(&uchan->lock);
+	}
+
+	if (!udev->enabled) {
+		mask |= EPOLLERR;
+	} else if (mhi_get_no_free_descriptors(mhi_dev, DMA_TO_DEVICE) > 0) {
+		dev_dbg(dev, "Client can write to node\n");
+		mask |= EPOLLOUT | EPOLLWRNORM;
+	}
+
+	dev_dbg(dev, "Client attempted to poll, returning mask 0x%x\n", mask);
+
+	return mask;
+}
+
+static ssize_t mhi_uci_write(struct file *file,
+			     const char __user *buf,
+			     size_t count,
+			     loff_t *offp)
+{
+	struct uci_dev *udev = file->private_data;
+	struct mhi_device *mhi_dev = udev->mhi_dev;
+	struct device *dev = &mhi_dev->dev;
+	struct uci_chan *uchan = &udev->ul_chan;
+	size_t bytes_xfered = 0;
+	int ret, nr_avail = 0;
+
+	if (!buf || !count)
+		return -EINVAL;
+
+	/* confirm channel is active */
+	mutex_lock(&udev->lock);
+	if (!udev->enabled) {
+		ret = -ENODEV;
+		goto err_mtx_unlock;
+	}
+
+	dev_dbg(dev, "%s: to xfer: %lu bytes\n", __func__, count);
+
+	while (count) {
+		size_t xfer_size;
+		void *kbuf;
+		enum mhi_flags flags;
+
+		mutex_unlock(&udev->lock);
+		/* wait for free descriptors */
+		ret = wait_event_interruptible(uchan->wq,
+					       (!udev->enabled) ||
+				(nr_avail = mhi_get_no_free_descriptors(mhi_dev,
+					       DMA_TO_DEVICE)) > 0);
+
+		mutex_lock(&udev->lock);
+		if (ret == -ERESTARTSYS) {
+			dev_dbg(dev, "Exit signal caught for node\n");
+			goto err_mtx_unlock;
+		}
+
+		if (!udev->enabled) {
+			ret = -ENODEV;
+			goto err_mtx_unlock;
+		}
+
+		xfer_size = min_t(size_t, count, udev->mtu);
+		kbuf = kmalloc(xfer_size, GFP_KERNEL);
+		if (!kbuf) {
+			ret = -ENOMEM;
+			goto err_mtx_unlock;
+		}
+
+		ret = copy_from_user(kbuf, buf, xfer_size);
+		if (ret) {
+			kfree(kbuf);
+			ret = -EFAULT;
+			goto err_mtx_unlock;
+		}
+
+		/* if ring is full after this force EOT */
+		if (nr_avail > 1 && (count - xfer_size))
+			flags = MHI_CHAIN;
+		else
+			flags = MHI_EOT;
+
+		if (udev->enabled)
+			ret = mhi_queue_buf(mhi_dev, DMA_TO_DEVICE, kbuf,
+					    xfer_size, flags);
+		else
+			ret = -ENODEV;
+
+		if (ret) {
+			kfree(kbuf);
+			goto err_mtx_unlock;
+		}
+
+		bytes_xfered += xfer_size;
+		count -= xfer_size;
+		buf += xfer_size;
+	}
+
+	mutex_unlock(&udev->lock);
+	dev_dbg(dev, "%s: bytes xferred: %lu\n", __func__, bytes_xfered);
+
+	return bytes_xfered;
+
+err_mtx_unlock:
+	mutex_unlock(&udev->lock);
+
+	return ret;
+}
+
+static ssize_t mhi_uci_read(struct file *file,
+			    char __user *buf,
+			    size_t count,
+			    loff_t *ppos)
+{
+	struct uci_dev *udev = file->private_data;
+	struct mhi_device *mhi_dev = udev->mhi_dev;
+	struct uci_chan *uchan = &udev->dl_chan;
+	struct device *dev = &mhi_dev->dev;
+	struct uci_buf *ubuf;
+	char *ptr;
+	size_t to_copy;
+	int ret = 0;
+
+	if (!buf)
+		return -EINVAL;
+
+	mutex_lock(&udev->lock);
+	/* confirm channel is active */
+	if (!udev->enabled) {
+		ret = -ENODEV;
+		goto err_mtx_unlock;
+	}
+
+	spin_lock_bh(&uchan->lock);
+	/* No data available to read, wait */
+	if (!uchan->cur_buf && list_empty(&uchan->pending)) {
+		dev_dbg(dev, "No data available to read waiting\n");
+
+		spin_unlock_bh(&uchan->lock);
+		mutex_unlock(&udev->lock);
+		ret = wait_event_interruptible(uchan->wq,
+					       (!udev->enabled ||
+					      !list_empty(&uchan->pending)));
+
+		mutex_lock(&udev->lock);
+		if (ret == -ERESTARTSYS) {
+			dev_dbg(dev, "Exit signal caught for node\n");
+			goto err_mtx_unlock;
+		}
+
+		if (!udev->enabled) {
+			ret = -ENODEV;
+			goto err_mtx_unlock;
+		}
+		spin_lock_bh(&uchan->lock);
+	}
+
+	/* new read, get the next descriptor from the list */
+	if (!uchan->cur_buf) {
+		ubuf = list_first_entry_or_null(&uchan->pending,
+						struct uci_buf, node);
+		if (!ubuf) {
+			ret = -EIO;
+			goto err_spin_unlock;
+		}
+
+		list_del(&ubuf->node);
+		uchan->cur_buf = ubuf;
+		uchan->rx_size = ubuf->len;
+		dev_dbg(dev, "Got pkt of size: %zu\n", uchan->rx_size);
+	}
+
+	ubuf = uchan->cur_buf;
+
+	/* Copy the buffer to user space */
+	to_copy = min_t(size_t, count, uchan->rx_size);
+	ptr = ubuf->data + (ubuf->len - uchan->rx_size);
+	spin_unlock_bh(&uchan->lock);
+
+	ret = copy_to_user(buf, ptr, to_copy);
+	if (ret) {
+		ret = -EFAULT;
+		goto err_mtx_unlock;
+	}
+
+	spin_lock_bh(&uchan->lock);
+
+	dev_dbg(dev, "Copied %lu of %lu bytes\n", to_copy, uchan->rx_size);
+	uchan->rx_size -= to_copy;
+
+	/* we finished with this buffer, queue it back to hardware */
+	if (!uchan->rx_size) {
+		uchan->cur_buf = NULL;
+
+		if (udev->enabled)
+			ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE,
+					    ubuf->data,
+					    udev->actual_mtu, MHI_EOT);
+		else
+			ret = -ENODEV;
+
+		if (ret) {
+			dev_err(dev, "Failed to recycle element: %d\n", ret);
+			kfree(ubuf->data);
+			goto err_spin_unlock;
+		}
+	}
+	spin_unlock_bh(&uchan->lock);
+	mutex_unlock(&udev->lock);
+
+	dev_dbg(dev, "%s: Returning %lu bytes\n", __func__, to_copy);
+
+	return to_copy;
+
+err_spin_unlock:
+	spin_unlock_bh(&uchan->lock);
+err_mtx_unlock:
+	mutex_unlock(&udev->lock);
+	return ret;
+}
+
+static int mhi_uci_open(struct inode *inode, struct file *filp)
+{
+	struct uci_dev *udev = NULL;
+	unsigned int minor = iminor(inode);
+	int ret = -EIO;
+	struct uci_buf *buf_itr, *tmp;
+	struct uci_chan *dl_chan;
+	struct mhi_device *mhi_dev;
+	struct device *dev;
+
+	mutex_lock(&uci_idr_mutex);
+	udev = idr_find(&uci_idr, minor);
+	mutex_unlock(&uci_idr_mutex);
+	if (!udev) {
+		pr_err("uci dev: minor %d not found\n", minor);
+		ret = -ENODEV;
+		goto error_no_dev;
+	}
+
+	kref_get(&udev->ref_count);
+
+	mhi_dev = udev->mhi_dev;
+	dev = &mhi_dev->dev;
+
+	mutex_lock(&udev->lock);
+	if (!udev->enabled) {
+		dev_info(dev, "Node exist, but not in active state!\n");
+		goto error_open_chan;
+	}
+
+	if (!kref_get_unless_zero(&udev->open_count)) {
+		dev_dbg(dev, "Starting channel\n");
+		ret = mhi_prepare_for_transfer(udev->mhi_dev);
+		if (ret) {
+			dev_err(dev, "Error starting transfer channels\n");
+			goto error_open_chan;
+		}
+
+		ret = mhi_queue_inbound(udev);
+		if (ret)
+			goto error_rx_queue;
+
+		kref_init(&udev->open_count);
+	}
+
+	dev_dbg(dev, "Node open, ref counts %u\n",
+		kref_read(&udev->open_count));
+
+	filp->private_data = udev;
+	mutex_unlock(&udev->lock);
+
+	return 0;
+
+error_rx_queue:
+	dl_chan = &udev->dl_chan;
+	mhi_unprepare_from_transfer(udev->mhi_dev);
+	list_for_each_entry_safe(buf_itr, tmp, &dl_chan->pending, node) {
+		list_del(&buf_itr->node);
+		kfree(buf_itr->data);
+	}
+error_open_chan:
+	mutex_unlock(&udev->lock);
+	kref_put(&udev->ref_count, mhi_uci_dev_release);
+error_no_dev:
+	return ret;
+}
+
+static const struct file_operations mhidev_fops = {
+	.owner = THIS_MODULE,
+	.open = mhi_uci_open,
+	.release = mhi_uci_release,
+	.read = mhi_uci_read,
+	.write = mhi_uci_write,
+	.poll = mhi_uci_poll,
+};
+
+static void mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
+			   struct mhi_result *mhi_result)
+{
+	struct uci_dev *udev = dev_get_drvdata(&mhi_dev->dev);
+	struct uci_chan *uchan = &udev->ul_chan;
+	struct device *dev = &mhi_dev->dev;
+
+	dev_dbg(dev, "status: %d xfer_len: %zu\n",
+		mhi_result->transaction_status, mhi_result->bytes_xferd);
+
+	kfree(mhi_result->buf_addr);
+
+	if (!mhi_result->transaction_status)
+		wake_up(&uchan->wq);
+}
+
+static void mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
+			   struct mhi_result *mhi_result)
+{
+	struct uci_dev *udev = dev_get_drvdata(&mhi_dev->dev);
+	struct uci_chan *uchan = &udev->dl_chan;
+	struct device *dev = &mhi_dev->dev;
+	struct uci_buf *buf;
+
+	dev_dbg(dev, "status: %d receive_len: %zu\n",
+		mhi_result->transaction_status, mhi_result->bytes_xferd);
+
+	if (mhi_result->transaction_status == -ENOTCONN) {
+		kfree(mhi_result->buf_addr);
+		return;
+	}
+
+	spin_lock_bh(&uchan->lock);
+	buf = mhi_result->buf_addr + udev->actual_mtu;
+	buf->data = mhi_result->buf_addr;
+	buf->len = mhi_result->bytes_xferd;
+	list_add_tail(&buf->node, &uchan->pending);
+	spin_unlock_bh(&uchan->lock);
+
+	wake_up(&uchan->wq);
+}
+
+static int mhi_uci_probe(struct mhi_device *mhi_dev,
+			 const struct mhi_device_id *id)
+{
+	struct uci_dev *udev;
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct device *dev;
+	int index, dir;
+
+	udev = kzalloc(sizeof(*udev), GFP_KERNEL);
+	if (!udev)
+		return -ENOMEM;
+
+	kref_init(&udev->ref_count);
+	mutex_init(&udev->lock);
+	udev->mhi_dev = mhi_dev;
+
+	mutex_lock(&udev->lock);
+
+	mutex_lock(&uci_idr_mutex);
+	index = idr_alloc(&uci_idr, udev, 0, MAX_UCI_MINORS, GFP_KERNEL);
+	mutex_unlock(&uci_idr_mutex);
+	if (index < 0) {
+		mutex_unlock(&udev->lock);
+		kfree(udev);
+		return index;
+	}
+
+	udev->minor = index;
+
+	/* create device file node /dev/mhi_<cntrl_dev_name>_<mhi_dev_name> */
+	dev = device_create(uci_dev_class, &mhi_dev->dev,
+			    MKDEV(uci_dev_major, index), udev,
+			    DEVICE_NAME "_%s_%s",
+			    dev_name(mhi_cntrl->cntrl_dev), mhi_dev->name);
+	if (IS_ERR(dev)) {
+		mutex_lock(&uci_idr_mutex);
+		idr_remove(&uci_idr, udev->minor);
+		mutex_unlock(&uci_idr_mutex);
+		mutex_unlock(&udev->lock);
+		kfree(udev);
+		return PTR_ERR(dev);
+	}
+
+	for (dir = 0; dir < 2; dir++) {
+		struct uci_chan *uchan = (dir) ?
+			&udev->ul_chan : &udev->dl_chan;
+		spin_lock_init(&uchan->lock);
+		init_waitqueue_head(&uchan->wq);
+		INIT_LIST_HEAD(&uchan->pending);
+	}
+
+	udev->mtu = min_t(size_t, id->driver_data, MHI_MAX_MTU);
+	udev->actual_mtu = udev->mtu - sizeof(struct uci_buf);
+	dev_set_drvdata(&mhi_dev->dev, udev);
+	udev->enabled = true;
+
+	mutex_unlock(&udev->lock);
+
+	dev_info(&mhi_dev->dev, "probed uci dev: minor %d\n", index);
+
+	return 0;
+};
+
+static void mhi_uci_remove(struct mhi_device *mhi_dev)
+{
+	struct uci_dev *udev = dev_get_drvdata(&mhi_dev->dev);
+
+	mutex_lock(&udev->lock);
+
+	/* disable the node */
+	udev->enabled = false;
+
+	wake_up(&udev->dl_chan.wq);
+	wake_up(&udev->ul_chan.wq);
+
+	/* delete the node to prevent new opens */
+	device_destroy(uci_dev_class, MKDEV(uci_dev_major, udev->minor));
+
+	mutex_lock(&uci_idr_mutex);
+	idr_remove(&uci_idr, udev->minor);
+	mutex_unlock(&uci_idr_mutex);
+
+	mutex_unlock(&udev->lock);
+
+	kref_put(&udev->ref_count, mhi_uci_dev_release);
+}
+
+/* .driver_data stores max mtu */
+static const struct mhi_device_id mhi_uci_match_table[] = {
+	{ .chan = "LOOPBACK", .driver_data = 0x1000},
+	{},
+};
+MODULE_DEVICE_TABLE(mhi, mhi_uci_match_table);
+
+static struct mhi_driver mhi_uci_driver = {
+	.id_table = mhi_uci_match_table,
+	.remove = mhi_uci_remove,
+	.probe = mhi_uci_probe,
+	.ul_xfer_cb = mhi_ul_xfer_cb,
+	.dl_xfer_cb = mhi_dl_xfer_cb,
+	.driver = {
+		.name = MHI_UCI_DRIVER_NAME,
+	},
+};
+
+static int mhi_uci_init(void)
+{
+	int ret;
+
+	ret = register_chrdev(0, MHI_UCI_DRIVER_NAME, &mhidev_fops);
+	if (ret < 0)
+		return ret;
+
+	uci_dev_major = ret;
+	uci_dev_class = class_create(THIS_MODULE, MHI_UCI_DRIVER_NAME);
+	if (IS_ERR(uci_dev_class)) {
+		unregister_chrdev(uci_dev_major, MHI_UCI_DRIVER_NAME);
+		return -ENODEV;
+	}
+
+	ret = mhi_driver_register(&mhi_uci_driver);
+	if (ret) {
+		class_destroy(uci_dev_class);
+		unregister_chrdev(uci_dev_major, MHI_UCI_DRIVER_NAME);
+	}
+
+	return ret;
+}
+
+static void __exit mhi_uci_exit(void)
+{
+	mhi_driver_unregister(&mhi_uci_driver);
+	class_destroy(uci_dev_class);
+	unregister_chrdev(uci_dev_major, MHI_UCI_DRIVER_NAME);
+}
+
+module_init(mhi_uci_init);
+module_exit(mhi_uci_exit);
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MHI UCI Driver");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

