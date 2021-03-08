Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C57331629
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 19:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbhCHScm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 13:32:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbhCHScb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 13:32:31 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5060DC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Mar 2021 10:32:30 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id w11so12517760wrr.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Mar 2021 10:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BVQurIaud4UN4C3rNgvJpA2GpRmolg46k0qTpifVWbs=;
        b=uEtD2rW1GTEoYKAGVhsQqwl8cjwAu+q23kCJCF9+GCL4bKwcatYESjDtwZJDZ/mfq6
         X/IWbYvRiVUc58XiLF5ucbiswfglwTZAT05WcnoB3V63Mq/pc0stZA+sqjK5N3eFlVel
         hST8vi7ntoy1gO8qZu9NzQubOSdD+FHd6HTwOp7X2cw2Tb6QAf+4+W8amIwuqj5Ss4uv
         MTlfXWRpNzz+bgMMYEQgfwVe71mLq2cmHMTyV6GwbwI3fw35lb4rEm2SWDIF3DdAMoJJ
         HBbe3EU/qFGl7lUqYr5rA4D+gsCVXCm0D8+tKdBwWc63k6FTFXf1DETIRfte4KMiKvYD
         +4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BVQurIaud4UN4C3rNgvJpA2GpRmolg46k0qTpifVWbs=;
        b=NyNF3xOKdn8y2G6Z1swFUgy8rtmctT6xU1CO8Lg5YdSsCtzegb1t98Gj2G1Gjl3VYv
         AbfJbhO11Vkcjnqb6UiuderaeHFo6160TVSoSFWwSC3RValK8CL6wcwRIz8ygl4xyjeY
         2f12BSfPKkzJsfA3IINETuKYWynfC5qGMq2TallybHmNgqlciLrROFalGVSaUS8M8zSH
         rvd23jpR100H+PnAroCZPg0gKZmzncJcH0sqKinfrhQ5bsjkbLRL3uk4+USl1n5+W13F
         bVIf9FiML+HklqjfqwCi332A80sUByshVHAhMFell3zqrKvuLsPMJ+/A0O29n9Yafwpt
         QNEA==
X-Gm-Message-State: AOAM530uuRUqlT9+eUWg+nQI+FlH27Zv8nrp+6n1sFR2BghWFnD0ODVv
        fN39UtnpCZAvFlzoFV1jaR0Cfg==
X-Google-Smtp-Source: ABdhPJweH4ksg7wlraPyoGPkSb46Ux5zNOaVFWDilImwFxHPkI95siwnA2RLylLvGRZZrHoQTDNk+Q==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr23624194wro.206.1615228348862;
        Mon, 08 Mar 2021 10:32:28 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:9894:5dc4:becb:268f])
        by smtp.gmail.com with ESMTPSA id h20sm216360wmm.19.2021.03.08.10.32.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 10:32:28 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     gregkh@linuxfoundation.org, manivannan.sadhasivam@linaro.org,
        hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, aleksander@aleksander.es,
        linux-kernel@vger.kernel.org, kuba@kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: Add Qcom WWAN control driver
Date:   Mon,  8 Mar 2021 19:40:51 +0100
Message-Id: <1615228851-17783-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MHI WWWAN control driver allows MHI Qcom based modems to expose
different modem control protocols to userspace, so that userspace
modem tools or daemon (e.g. ModemManager) can control WWAN config
and state (APN config, SMS, provider selection...). A Qcom based
modem can expose one or several of the following protocols:
- AT: Well known AT commands interactive protocol (microcom, minicom...)
- MBIM: Mobile Broadband Interface Model (libmbim, mbimcli)
- QMI: Qcom MSM/Modem Interface (libqmi, qmicli)
- QCDM: Qcom Modem diagnostic interface (libqcdm)
- FIREHOSE: XML-based protocol for Modem firmware management
	    (qmi-firmware-update)

The different interfaces are exposed as character devices, in the same
way as for USB modem variants.

Note that this patch is mostly a rework of the earlier MHI UCI
tentative that was a generic interface for accessing MHI bus from
userspace. As suggested, this new version is WWAN specific and is
dedicated to only expose channels used for controlling a modem, and
for which related opensource user support exist. Other MHI channels
not fitting the requirements will request either to be plugged to
the right Linux subsystem (when available) or to be discussed as a
new MHI driver (e.g AI accelerator, WiFi debug channels, etc...).

Co-developed-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/Kconfig     |  12 +
 drivers/bus/mhi/Makefile    |   3 +
 drivers/bus/mhi/wwan_ctrl.c | 559 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 574 insertions(+)
 create mode 100644 drivers/bus/mhi/wwan_ctrl.c

diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index da5cd0c..3336ee5 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -29,3 +29,15 @@ config MHI_BUS_PCI_GENERIC
 	  This driver provides MHI PCI controller driver for devices such as
 	  Qualcomm SDX55 based PCIe modems.
 
+config MHI_WWAN_CTRL
+	tristate "MHI WWAN control driver for QCOM based PCIe modems"
+	depends on MHI_BUS
+	help
+	  MHI WWAN CTRL allow QCOM based PCIe modems to expose different modem
+	  control protocols to userspace, including AT, MBIM, QMI, DIAG and
+	  FIREHOSE. These protocols can be accessed directly from userspace
+	  (e.g. AT commands) or via libraries/tools (e.g. libmbim, libqmi,
+	  libqcdm...).
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called mhi_wwan_ctrl.
diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
index 0a2d778..ae25958 100644
--- a/drivers/bus/mhi/Makefile
+++ b/drivers/bus/mhi/Makefile
@@ -4,3 +4,6 @@ obj-y += core/
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
 
+# MHI client
+mhi_wwan_ctrl-y := wwan_ctrl.o
+obj-$(CONFIG_MHI_WWAN_CTRL) += mhi_wwan_ctrl.o
diff --git a/drivers/bus/mhi/wwan_ctrl.c b/drivers/bus/mhi/wwan_ctrl.c
new file mode 100644
index 0000000..a6e1f9d
--- /dev/null
+++ b/drivers/bus/mhi/wwan_ctrl.c
@@ -0,0 +1,559 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.*/
+
+#include <linux/kernel.h>
+#include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/poll.h>
+
+#define MHI_WWAN_CTRL_DRIVER_NAME "mhi_wwan_ctrl"
+#define MHI_WWAN_CTRL_MAX_MINORS 128
+
+static DEFINE_IDR(mhi_wwan_ctrl_idr);
+static DEFINE_MUTEX(mhi_wwan_ctrl_drv_lock);
+static struct class *mhi_wwan_ctrl_class;
+static int mhi_wwan_ctrl_major;
+
+/* WWAN interface Protocols used by user-space for controlling a modem */
+#define MHI_WWAN_CTRL_PROTO_AT		"AT"	/* AT command protocol */
+#define MHI_WWAN_CTRL_PROTO_MBIM	"MBIM"  /* Mobile Broadband Interface Model control protocol */
+#define MHI_WWAN_CTRL_PROTO_QMUX	"QMI"   /* Qcom modem/MSM interface for modem control */
+#define MHI_WWAN_CTRL_PROTO_QCDM	"DIAG"  /* Qcom Modem diagnostic interface */
+#define MHI_WWAN_CTRL_PROTO_FIREHOSE	"FIREHOSE" /* XML based command protocol */
+
+/* MHI wwan device flags */
+#define MHI_WWAN_DL_CAP		BIT(0)
+#define MHI_WWAN_UL_CAP		BIT(1)
+#define MHI_WWAN_CONNECTED	BIT(2)
+
+struct mhi_wwan_buf {
+	struct list_head node;
+	void *data;
+	size_t len;
+	size_t consumed;
+};
+
+struct mhi_wwan_dev {
+	unsigned int minor;
+	size_t mtu;
+
+	struct mhi_device *mhi_dev;
+	/* Protect against concurrent MHI device accesses (start, stop, open, close) */
+	struct mutex mhi_dev_lock;
+	unsigned int mhi_dev_open_count;
+
+	wait_queue_head_t ul_wq;
+	wait_queue_head_t dl_wq;
+
+	/* Protect download buf queue against concurent update (read/xfer_cb) */
+	spinlock_t dl_queue_lock;
+	struct list_head dl_queue;
+
+	/* For serializing write/queueing to a same MHI channel */
+	struct mutex write_lock;
+
+	unsigned long flags;
+
+	/* kref is used to safely track and release a mhi_wwan_dev instance,
+	 * shared between mhi device probe/remove and user open/close.
+	 */
+	struct kref ref_count;
+};
+
+static void mhi_wwan_ctrl_dev_release(struct kref *ref)
+{
+	struct mhi_wwan_dev *wwandev = container_of(ref, struct mhi_wwan_dev, ref_count);
+	struct mhi_wwan_buf *buf_itr, *tmp;
+
+	/* Release non consumed buffers */
+	list_for_each_entry_safe(buf_itr, tmp, &wwandev->dl_queue, node) {
+		list_del(&buf_itr->node);
+		kfree(buf_itr->data);
+	}
+
+	mutex_destroy(&wwandev->mhi_dev_lock);
+	mutex_destroy(&wwandev->write_lock);
+
+	kfree(wwandev);
+}
+
+static int mhi_wwan_ctrl_queue_inbound(struct mhi_wwan_dev *wwandev)
+{
+	struct mhi_device *mhi_dev = wwandev->mhi_dev;
+	struct device *dev = &mhi_dev->dev;
+	int nr_desc, i, ret = -EIO;
+	struct mhi_wwan_buf *ubuf;
+	void *buf;
+
+	/*
+	 * skip queuing without error if dl channel is not supported. This
+	 * allows open to succeed for udev, supporting ul only channel.
+	 */
+	if (!wwandev->mhi_dev->dl_chan)
+		return 0;
+
+	nr_desc = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
+
+	for (i = 0; i < nr_desc; i++) {
+		buf = kmalloc(wwandev->mtu + sizeof(*ubuf), GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+
+		/* save mhi_wwan_buf info at the end of buf */
+		ubuf = buf + wwandev->mtu;
+		ubuf->data = buf;
+
+		ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, wwandev->mtu, MHI_EOT);
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
+static int mhi_wwan_ctrl_open(struct inode *inode, struct file *filp)
+{
+	unsigned int minor = iminor(inode);
+	struct mhi_wwan_dev *wwandev = NULL;
+	int ret = 0;
+
+	/* Retrieve corresponding mhi_wwan_dev and get a reference */
+	mutex_lock(&mhi_wwan_ctrl_drv_lock);
+	wwandev = idr_find(&mhi_wwan_ctrl_idr, minor);
+	if (!wwandev) {
+		mutex_unlock(&mhi_wwan_ctrl_drv_lock);
+		return -ENODEV;
+	}
+	kref_get(&wwandev->ref_count);
+	mutex_unlock(&mhi_wwan_ctrl_drv_lock);
+
+	/* Start MHI channel(s) if not yet started and fill RX queue */
+	mutex_lock(&wwandev->mhi_dev_lock);
+	if (!wwandev->mhi_dev_open_count++) {
+		ret = mhi_prepare_for_transfer(wwandev->mhi_dev, 0);
+		if (!ret)
+			ret = mhi_wwan_ctrl_queue_inbound(wwandev);
+		if (ret)
+			wwandev->mhi_dev_open_count--;
+	}
+	mutex_unlock(&wwandev->mhi_dev_lock);
+
+	if (ret)
+		return ret;
+
+	filp->private_data = wwandev;
+
+	/* stream-like non-seekable file descriptor */
+	stream_open(inode, filp);
+
+	return 0;
+}
+
+static int mhi_wwan_ctrl_release(struct inode *inode, struct file *file)
+{
+	struct mhi_wwan_dev *wwandev = file->private_data;
+
+	/* Stop the channels, if not already destroyed */
+	mutex_lock(&wwandev->mhi_dev_lock);
+	if (!(--wwandev->mhi_dev_open_count) && wwandev->mhi_dev)
+		mhi_unprepare_from_transfer(wwandev->mhi_dev);
+	mutex_unlock(&wwandev->mhi_dev_lock);
+
+	file->private_data = NULL;
+
+	kref_put(&wwandev->ref_count, mhi_wwan_ctrl_dev_release);
+
+	return 0;
+}
+
+static __poll_t mhi_wwan_ctrl_poll(struct file *file, poll_table *wait)
+{
+	struct mhi_wwan_dev *wwandev = file->private_data;
+	__poll_t mask = 0;
+
+	poll_wait(file, &wwandev->ul_wq, wait);
+	poll_wait(file, &wwandev->dl_wq, wait);
+
+	/* Any buffer in the DL queue ? */
+	spin_lock_bh(&wwandev->dl_queue_lock);
+	if (!list_empty(&wwandev->dl_queue))
+		mask |= EPOLLIN | EPOLLRDNORM;
+	spin_unlock_bh(&wwandev->dl_queue_lock);
+
+	/* If MHI queue is not full, write is possible */
+	mutex_lock(&wwandev->mhi_dev_lock);
+	if (!wwandev->mhi_dev)
+		mask = EPOLLERR | EPOLLHUP;
+	else if (!mhi_queue_is_full(wwandev->mhi_dev, DMA_TO_DEVICE))
+		mask |= EPOLLOUT | EPOLLWRNORM;
+	mutex_unlock(&wwandev->mhi_dev_lock);
+
+	return mask;
+}
+
+static ssize_t mhi_wwan_ctrl_write(struct file *file, const char __user *buf,
+			     size_t count, loff_t *offp)
+{
+	struct mhi_wwan_dev *wwandev = file->private_data;
+	size_t bytes_xfered = 0;
+	void *kbuf = NULL;
+	int ret;
+
+	if (!test_bit(MHI_WWAN_UL_CAP, &wwandev->flags))
+		return -EOPNOTSUPP;
+
+	if (!buf || !count)
+		return -EINVAL;
+
+	/* Serialize MHI queueing */
+	if (mutex_lock_interruptible(&wwandev->write_lock))
+		return -EINTR;
+
+	while (count) {
+		size_t xfer_size;
+
+		/* Wait for available transfer descriptor */
+		ret = wait_event_interruptible(wwandev->ul_wq,
+				!test_bit(MHI_WWAN_CONNECTED, &wwandev->flags) ||
+				!mhi_queue_is_full(wwandev->mhi_dev, DMA_TO_DEVICE));
+		if (ret)
+			break;
+
+		if (!test_bit(MHI_WWAN_CONNECTED, &wwandev->flags)) {
+			ret = -EPIPE;
+			break;
+		}
+
+		xfer_size = min_t(size_t, count, wwandev->mtu);
+		kbuf = kmalloc(xfer_size, GFP_KERNEL);
+		if (!kbuf) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		ret = copy_from_user(kbuf, buf, xfer_size);
+		if (ret)
+			break;
+
+		/* Add buffer to MHI queue */
+		ret = mhi_queue_buf(wwandev->mhi_dev, DMA_TO_DEVICE, kbuf,
+				    xfer_size, MHI_EOT);
+		if (ret)
+			break;
+
+		bytes_xfered += xfer_size;
+		count -= xfer_size;
+		buf += xfer_size;
+		kbuf = NULL;
+	}
+
+	mutex_unlock(&wwandev->write_lock);
+
+	kfree(kbuf);
+
+	return ret ? ret : bytes_xfered;
+}
+
+static int mhi_wwan_ctrl_recycle_ubuf(struct mhi_wwan_dev *wwandev,
+				      struct mhi_wwan_buf *ubuf)
+{
+	int ret;
+
+	mutex_lock(&wwandev->mhi_dev_lock);
+
+	if (!wwandev->mhi_dev) {
+		ret = -ENODEV;
+		goto exit_unlock;
+	}
+
+	ret = mhi_queue_buf(wwandev->mhi_dev, DMA_FROM_DEVICE, ubuf->data,
+			    wwandev->mtu, MHI_EOT);
+
+exit_unlock:
+	mutex_unlock(&wwandev->mhi_dev_lock);
+
+	return ret;
+}
+
+static ssize_t mhi_wwan_ctrl_read(struct file *file, char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct mhi_wwan_dev *wwandev = file->private_data;
+	bool recycle_buf = false;
+	struct mhi_wwan_buf *ubuf;
+	size_t copy_len;
+	char *copy_ptr;
+	int ret = 0;
+
+	if (!test_bit(MHI_WWAN_DL_CAP, &wwandev->flags))
+		return -EOPNOTSUPP;
+
+	if (!buf)
+		return -EINVAL;
+
+	spin_lock_irq(&wwandev->dl_queue_lock);
+
+	/* Wait for at least one buffer in the dl queue (or device removal) */
+	ret = wait_event_interruptible_lock_irq(wwandev->dl_wq,
+				!list_empty(&wwandev->dl_queue) ||
+				!test_bit(MHI_WWAN_CONNECTED, &wwandev->flags),
+				wwandev->dl_queue_lock);
+	if (ret) {
+		goto err_unlock;
+	} else if (!test_bit(MHI_WWAN_CONNECTED, &wwandev->flags)) {
+		ret = -EPIPE;
+		goto err_unlock;
+	}
+
+	ubuf = list_first_entry_or_null(&wwandev->dl_queue, struct mhi_wwan_buf, node);
+	if (!ubuf) {
+		ret = -EIO;
+		goto err_unlock;
+	}
+
+	/* Consume the buffer */
+	copy_len = min_t(size_t, count, ubuf->len - ubuf->consumed);
+	copy_ptr = ubuf->data + ubuf->consumed;
+	ubuf->consumed += copy_len;
+
+	/* Remove buffer from the DL queue if entirely consumed */
+	if (ubuf->consumed == ubuf->len) {
+		list_del(&ubuf->node);
+		recycle_buf = true;
+	}
+
+	spin_unlock_irq(&wwandev->dl_queue_lock);
+
+	ret = copy_to_user(buf, copy_ptr, copy_len);
+	if (ret)
+		return -EFAULT;
+
+	if (recycle_buf) {
+		/* Give the buffer back to MHI queue */
+		ret = mhi_wwan_ctrl_recycle_ubuf(wwandev, ubuf);
+		if (ret) /* unable to recycle, release */
+			kfree(ubuf->data);
+	}
+
+	return copy_len;
+
+err_unlock:
+	spin_unlock_irq(&wwandev->dl_queue_lock);
+
+	return ret;
+}
+
+static const struct file_operations mhidev_fops = {
+	.owner = THIS_MODULE,
+	.open = mhi_wwan_ctrl_open,
+	.release = mhi_wwan_ctrl_release,
+	.read = mhi_wwan_ctrl_read,
+	.write = mhi_wwan_ctrl_write,
+	.poll = mhi_wwan_ctrl_poll,
+};
+
+static void mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
+			   struct mhi_result *mhi_result)
+{
+	struct mhi_wwan_dev *wwandev = dev_get_drvdata(&mhi_dev->dev);
+	struct device *dev = &mhi_dev->dev;
+
+	dev_dbg(dev, "%s: status: %d xfer_len: %zu\n", __func__,
+		mhi_result->transaction_status, mhi_result->bytes_xferd);
+
+	kfree(mhi_result->buf_addr);
+
+	/* Some space available in the 'upload' queue, advertise that */
+	if (!mhi_result->transaction_status)
+		wake_up_interruptible(&wwandev->ul_wq);
+}
+
+static void mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
+			   struct mhi_result *mhi_result)
+{
+	struct mhi_wwan_dev *wwandev = dev_get_drvdata(&mhi_dev->dev);
+	struct mhi_wwan_buf *ubuf;
+
+	dev_dbg(&mhi_dev->dev, "%s: status: %d receive_len: %zu\n", __func__,
+		mhi_result->transaction_status, mhi_result->bytes_xferd);
+
+	if (mhi_result->transaction_status &&
+	    mhi_result->transaction_status != -EOVERFLOW) {
+		kfree(mhi_result->buf_addr);
+		return;
+	}
+
+	/* ubuf is placed at the end of the buffer (cf mhi_wwan_ctrl_queue_inbound) */
+	ubuf = mhi_result->buf_addr + wwandev->mtu;
+
+	/* paranoia, should never happen */
+	if (WARN_ON(mhi_result->buf_addr != ubuf->data)) {
+		kfree(mhi_result->buf_addr);
+		return;
+	}
+
+	ubuf->data = mhi_result->buf_addr;
+	ubuf->len = mhi_result->bytes_xferd;
+	ubuf->consumed = 0;
+
+	spin_lock_bh(&wwandev->dl_queue_lock);
+	list_add_tail(&ubuf->node, &wwandev->dl_queue);
+	spin_unlock_bh(&wwandev->dl_queue_lock);
+
+	wake_up_interruptible(&wwandev->dl_wq);
+}
+
+static int mhi_wwan_ctrl_probe(struct mhi_device *mhi_dev,
+			 const struct mhi_device_id *id)
+{
+	struct mhi_wwan_dev *wwandev;
+	struct device *dev;
+	int index, err;
+
+	/* Create mhi_wwan data context */
+	wwandev = kzalloc(sizeof(*wwandev), GFP_KERNEL);
+	if (!wwandev)
+		return -ENOMEM;
+
+	/* Retrieve index */
+	mutex_lock(&mhi_wwan_ctrl_drv_lock);
+	index = idr_alloc(&mhi_wwan_ctrl_idr, wwandev, 0,
+			  MHI_WWAN_CTRL_MAX_MINORS, GFP_KERNEL);
+	mutex_unlock(&mhi_wwan_ctrl_drv_lock);
+	if (index < 0) {
+		err = index;
+		goto err_free_wwandev;
+	}
+
+	/* Init mhi_wwan data */
+	kref_init(&wwandev->ref_count);
+	mutex_init(&wwandev->mhi_dev_lock);
+	mutex_init(&wwandev->write_lock);
+	init_waitqueue_head(&wwandev->ul_wq);
+	init_waitqueue_head(&wwandev->dl_wq);
+	spin_lock_init(&wwandev->dl_queue_lock);
+	INIT_LIST_HEAD(&wwandev->dl_queue);
+	wwandev->mhi_dev = mhi_dev;
+	wwandev->minor = index;
+	wwandev->mtu = min_t(size_t, id->driver_data, MHI_MAX_MTU);
+	set_bit(MHI_WWAN_CONNECTED, &wwandev->flags);
+
+	if (mhi_dev->dl_chan)
+		set_bit(MHI_WWAN_DL_CAP, &wwandev->flags);
+	if (mhi_dev->ul_chan)
+		set_bit(MHI_WWAN_UL_CAP, &wwandev->flags);
+
+	dev_set_drvdata(&mhi_dev->dev, wwandev);
+
+	/* Creates a new device and registers it with sysfs */
+	dev = device_create(mhi_wwan_ctrl_class, &mhi_dev->dev,
+			    MKDEV(mhi_wwan_ctrl_major, index), wwandev,
+			    "wwan_%s", dev_name(&mhi_dev->dev));
+	if (IS_ERR(dev)) {
+		err = PTR_ERR(dev);
+		goto err_free_idr;
+	}
+
+	return 0;
+
+err_free_idr:
+	mutex_lock(&mhi_wwan_ctrl_drv_lock);
+	idr_remove(&mhi_wwan_ctrl_idr, wwandev->minor);
+	mutex_unlock(&mhi_wwan_ctrl_drv_lock);
+err_free_wwandev:
+	kfree(wwandev);
+	dev_set_drvdata(&mhi_dev->dev, NULL);
+
+	return err;
+};
+
+static void mhi_wwan_ctrl_remove(struct mhi_device *mhi_dev)
+{
+	struct mhi_wwan_dev *wwandev = dev_get_drvdata(&mhi_dev->dev);
+
+	dev_set_drvdata(&mhi_dev->dev, NULL);
+
+	mutex_lock(&mhi_wwan_ctrl_drv_lock);
+	idr_remove(&mhi_wwan_ctrl_idr, wwandev->minor);
+	mutex_unlock(&mhi_wwan_ctrl_drv_lock);
+
+	clear_bit(MHI_WWAN_CONNECTED, &wwandev->flags);
+	device_destroy(mhi_wwan_ctrl_class, MKDEV(mhi_wwan_ctrl_major, wwandev->minor));
+
+	/* Unlink mhi_dev from mhi_wwan_dev */
+	mutex_lock(&wwandev->mhi_dev_lock);
+	wwandev->mhi_dev = NULL;
+	mutex_unlock(&wwandev->mhi_dev_lock);
+
+	/* wake up any blocked user */
+	wake_up_interruptible(&wwandev->dl_wq);
+	wake_up_interruptible(&wwandev->ul_wq);
+
+	kref_put(&wwandev->ref_count, mhi_wwan_ctrl_dev_release);
+}
+
+/* .driver_data stores max mtu */
+static const struct mhi_device_id mhi_wwan_ctrl_match_table[] = {
+	{ .chan = MHI_WWAN_CTRL_PROTO_AT, .driver_data = 4096 },
+	{ .chan = MHI_WWAN_CTRL_PROTO_MBIM, .driver_data = 4096 },
+	{ .chan = MHI_WWAN_CTRL_PROTO_QMUX, .driver_data = 4096 },
+	{ .chan = MHI_WWAN_CTRL_PROTO_QCDM, .driver_data = MHI_MAX_MTU },
+	{ .chan = MHI_WWAN_CTRL_PROTO_FIREHOSE, .driver_data = MHI_MAX_MTU },
+	{},
+};
+MODULE_DEVICE_TABLE(mhi, mhi_wwan_ctrl_match_table);
+
+static struct mhi_driver mhi_wwan_ctrl_driver = {
+	.id_table = mhi_wwan_ctrl_match_table,
+	.remove = mhi_wwan_ctrl_remove,
+	.probe = mhi_wwan_ctrl_probe,
+	.ul_xfer_cb = mhi_ul_xfer_cb,
+	.dl_xfer_cb = mhi_dl_xfer_cb,
+	.driver = {
+		.name = MHI_WWAN_CTRL_DRIVER_NAME,
+	},
+};
+
+static int __init mhi_wwan_ctrl_init(void)
+{
+	int ret;
+
+	ret = register_chrdev(0, MHI_WWAN_CTRL_DRIVER_NAME, &mhidev_fops);
+	if (ret < 0)
+		return ret;
+
+	mhi_wwan_ctrl_major = ret;
+	mhi_wwan_ctrl_class = class_create(THIS_MODULE, MHI_WWAN_CTRL_DRIVER_NAME);
+	if (IS_ERR(mhi_wwan_ctrl_class)) {
+		unregister_chrdev(mhi_wwan_ctrl_major, MHI_WWAN_CTRL_DRIVER_NAME);
+		return PTR_ERR(mhi_wwan_ctrl_class);
+	}
+
+	ret = mhi_driver_register(&mhi_wwan_ctrl_driver);
+	if (ret) {
+		class_destroy(mhi_wwan_ctrl_class);
+		unregister_chrdev(mhi_wwan_ctrl_major, MHI_WWAN_CTRL_DRIVER_NAME);
+	}
+
+	return ret;
+}
+
+static void __exit mhi_wwan_ctrl_exit(void)
+{
+	mhi_driver_unregister(&mhi_wwan_ctrl_driver);
+	class_destroy(mhi_wwan_ctrl_class);
+	unregister_chrdev(mhi_wwan_ctrl_major, MHI_WWAN_CTRL_DRIVER_NAME);
+	idr_destroy(&mhi_wwan_ctrl_idr);
+}
+
+module_init(mhi_wwan_ctrl_init);
+module_exit(mhi_wwan_ctrl_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MHI WWAN CTRL Driver");
+MODULE_AUTHOR("Hemant Kumar <hemantk@codeaurora.org>");
+MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro.org>");
-- 
2.7.4

