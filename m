Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D032734FE15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 12:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234666AbhCaKam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 06:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235016AbhCaKad (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 06:30:33 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D712AC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:30:32 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id x13so19108277wrs.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dX6bHe2FW/oYEYkR9uyXTD9bdOj55wnQiNXqF6qk1aA=;
        b=L61XMKb1h/+H8ez9Na5Cr0epjKpYUpWe2ZKEiirWbm+Ik/8eZggiPT2bHDY2icqT+Z
         OaZhcMpILgK1l3NKyZBfv3xUNXJLdIMQeff5o5/MijgwbS8R5YlU/QJN5CG/5MNm/Upu
         z10QplvQdt8PA62FsssD3jkwWJv3gBu9YCY2sjaeD2Scc8bP/hASRgZZsuIMQR6QpaHi
         1waRW7vqGnHUalHD9eoP7qb/5wt6TflIM9k2D6mSFgLx4BiskMEDN9F0TFu9t3bO1oZl
         KYRIJ11VJqd4xFZ/x9oEtjB1DW9yd52nob/np3l0nteLQTD7YISQlNJqcQZNDTIKlbLA
         6YGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dX6bHe2FW/oYEYkR9uyXTD9bdOj55wnQiNXqF6qk1aA=;
        b=YxRjsatCoepxULcliZfkYfCIyv0ZxDFZ7TYytAv9h1CxrBDK4mX9pn0wQg3JSbnYa9
         Gx2GS/w/5oqTeIfP9cFFQ6+TN0cALHuEE7ZO12K5eaVuxnUzinMsi2h7Xm++wx77EGmz
         1xlzpUCffWPR0BlnHp/Dc4ngA2li86xggYEuqRR5WjOzFUIqDwmNcISkmlpDTESFG60d
         KSCv+PBuwbRdHf+cnmi4UMQfKURoJm0+j5a2NJo7J9T9BXCIlI2et/kCgDcoyO9cw02E
         T2LXG4g0u2FOtqMFoIIfM5wE8+DuDL9V0MTDGz2coPQHcL/cgTqGOmskSZ4DtXqr0IWL
         /4AA==
X-Gm-Message-State: AOAM532x6iXoGbQs8xetsY7GTvBkc034lTvTOdjWwv1/tLMEmbppqMK+
        KHiWtD3SUbp7p1xHi2Ils//ffvmPmiudryKD
X-Google-Smtp-Source: ABdhPJwqLm/xDd3meJXPXCR+wVtXgbC1k4zFemu9sAHyMidpD//ocPMmkFMOBmFH2L3YU3oyU4jnzg==
X-Received: by 2002:adf:a1d8:: with SMTP id v24mr2796116wrv.378.1617186631427;
        Wed, 31 Mar 2021 03:30:31 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:8ca0:fa3:7d12:167b])
        by smtp.gmail.com with ESMTPSA id n6sm4385336wmd.27.2021.03.31.03.30.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Mar 2021 03:30:30 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     kuba@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, manivannan.sadhasivam@linaro.org,
        aleksander@aleksander.es, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH net-next v6 2/2] net: Add Qcom WWAN control driver
Date:   Wed, 31 Mar 2021 12:39:10 +0200
Message-Id: <1617187150-13727-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617187150-13727-1-git-send-email-loic.poulain@linaro.org>
References: <1617187150-13727-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MHI WWWAN control driver allows MHI QCOM-based modems to expose
different modem control protocols/ports to userspace, so that userspace
modem tools or daemon (e.g. ModemManager) can control WWAN config
and state (APN config, SMS, provider selection...). A QCOM-based
modem can expose one or several of the following protocols:
- AT: Well known AT commands interactive protocol (microcom, minicom...)
- MBIM: Mobile Broadband Interface Model (libmbim, mbimcli)
- QMI: QCOM MSM/Modem Interface (libqmi, qmicli)
- QCDM: QCOM Modem diagnostic interface (libqcdm)
- FIREHOSE: XML-based protocol for Modem firmware management
        (qmi-firmware-update)

The different interfaces are exposed as character devices through the
WWAN subsystem, in a similar way as for USB modem variants (cdc-wdm).

Note that this patch is mostly a rework of the earlier MHI UCI
tentative that was a generic interface for accessing MHI bus from
userspace. As suggested, this new version is WWAN specific and is
dedicated to only expose channels used for controlling a modem, and
for which related opensource userpace support exist.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: not part of the series
 v3: not part of the series
 v4: Introduce WWAN framework/subsystem
 v5: Specify WWAN_CORE module name in Kconfig
 v6: - Move to unified wwan_core.c file
     - Make wwan_port a device
     - Get rid of useless various dev lists (use wwan class)
     - Get rid of useless wwan dev usage counter and mutex
     - do not expose wwan_create_device, it's indirectly called via create_port
     - Increase minor count to the whole available minor range
     - private_data as wwan_create_port parameter

 drivers/net/wwan/Kconfig         |  14 +
 drivers/net/wwan/Makefile        |   2 +
 drivers/net/wwan/mhi_wwan_ctrl.c | 534 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 550 insertions(+)
 create mode 100644 drivers/net/wwan/mhi_wwan_ctrl.c

diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
index 545fe54..ce0bbfb 100644
--- a/drivers/net/wwan/Kconfig
+++ b/drivers/net/wwan/Kconfig
@@ -19,4 +19,18 @@ config WWAN_CORE
 	  To compile this driver as a module, choose M here: the module will be
 	  called wwan.
 
+config MHI_WWAN_CTRL
+	tristate "MHI WWAN control driver for QCOM-based PCIe modems"
+	select WWAN_CORE
+	depends on MHI_BUS
+	help
+	  MHI WWAN CTRL allows QCOM-based PCIe modems to expose different modem
+	  control protocols/ports to userspace, including AT, MBIM, QMI, DIAG
+	  and FIREHOSE. These protocols can be accessed directly from userspace
+	  (e.g. AT commands) or via libraries/tools (e.g. libmbim, libqmi,
+	  libqcdm...).
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called mhi_wwan_ctrl
+
 endif # WWAN
diff --git a/drivers/net/wwan/Makefile b/drivers/net/wwan/Makefile
index 934590b..556cd90 100644
--- a/drivers/net/wwan/Makefile
+++ b/drivers/net/wwan/Makefile
@@ -5,3 +5,5 @@
 
 obj-$(CONFIG_WWAN_CORE) += wwan.o
 wwan-objs += wwan_core.o
+
+obj-$(CONFIG_MHI_WWAN_CTRL) += mhi_wwan_ctrl.o
diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
new file mode 100644
index 0000000..0f70b07
--- /dev/null
+++ b/drivers/net/wwan/mhi_wwan_ctrl.c
@@ -0,0 +1,534 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.*/
+
+#include <linux/kernel.h>
+#include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/poll.h>
+#include <linux/wwan.h>
+
+/* MHI wwan device flags */
+#define MHI_WWAN_DL_CAP		BIT(0)
+#define MHI_WWAN_UL_CAP		BIT(1)
+#define MHI_WWAN_CONNECTED	BIT(2)
+#define MHI_WWAN_TX_FULL	BIT(3)
+
+#define MHI_WWAN_MAX_MTU	0x8000
+
+struct mhi_wwan_buf {
+	struct list_head node;
+	void *data;
+	size_t len;
+	size_t consumed;
+};
+
+struct mhi_wwan_dev {
+	/* Lower level is a mhi dev, upper level is a wwan port */
+	struct mhi_device *mhi_dev;
+	struct wwan_port *wwan_port;
+
+	/* Protect mhi device against concurrent accesses (queue, remove...) */
+	struct mutex mhi_dev_lock;
+	unsigned int mhi_dev_start_count;
+
+	/* read/write wait queues */
+	wait_queue_head_t ul_wq;
+	wait_queue_head_t dl_wq;
+
+	/* Protect local download queue against concurent update (read/xfer_cb) */
+	spinlock_t dl_queue_lock;
+	struct list_head dl_queue;
+
+	unsigned long flags;
+	size_t mtu;
+
+	/* kref is used to safely refcount and release a mhi_wwan_dev instance,
+	 * which is shared between mhi-dev probe/remove and wwan-port fops.
+	 */
+	struct kref refcnt;
+};
+
+static void mhi_wwan_ctrl_dev_release(struct kref *ref)
+{
+	struct mhi_wwan_dev *mhiwwan = container_of(ref, struct mhi_wwan_dev, refcnt);
+	struct mhi_wwan_buf *buf_itr, *tmp;
+
+	/* Release non consumed buffers (lock-free safe in release)  */
+	list_for_each_entry_safe(buf_itr, tmp, &mhiwwan->dl_queue, node) {
+		list_del(&buf_itr->node);
+		kfree(buf_itr->data);
+	}
+
+	mutex_destroy(&mhiwwan->mhi_dev_lock);
+
+	kfree(mhiwwan);
+}
+
+static int mhi_wwan_ctrl_fill_inbound(struct mhi_wwan_dev *mhiwwan)
+{
+	struct mhi_device *mhi_dev = mhiwwan->mhi_dev;
+	int nr_desc, ret = -EIO;
+
+	lockdep_assert_held(&mhiwwan->mhi_dev_lock);
+
+	/* skip queuing without error if dl channel is not supported. This
+	 * allows open to succeed for devices supporting ul channels only.
+	 */
+	if (!mhi_dev->dl_chan)
+		return 0;
+
+	nr_desc = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
+
+	while (nr_desc--) {
+		struct mhi_wwan_buf *mhibuf;
+		void *buf;
+
+		buf = kmalloc(mhiwwan->mtu + sizeof(*mhibuf), GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+
+		/* save mhi_wwan_buf meta info at the end of the buffer */
+		mhibuf = buf + mhiwwan->mtu;
+		mhibuf->data = buf;
+
+		ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, mhiwwan->mtu, MHI_EOT);
+		if (ret) {
+			dev_err(&mhi_dev->dev, "Failed to queue buffer\n");
+			kfree(buf);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static int mhi_wwan_ctrl_start(struct mhi_wwan_dev *mhiwwan)
+{
+	struct mhi_device *mhi_dev;
+	int ret = 0;
+
+	mutex_lock(&mhiwwan->mhi_dev_lock);
+
+	mhi_dev = mhiwwan->mhi_dev;
+	if (!mhi_dev) { /* mhi dev got hot-unplugged */
+		ret = -ENODEV;
+		goto exit_unlock;
+	}
+
+	/* Do not start if already started (by previous open) */
+	if (mhiwwan->mhi_dev_start_count)
+		goto exit_started;
+
+	/* Start mhi device's channel(s) */
+	ret = mhi_prepare_for_transfer(mhi_dev);
+	if (ret)
+		goto exit_unlock;
+
+	/* Add buffers to inbound queue */
+	ret = mhi_wwan_ctrl_fill_inbound(mhiwwan);
+	if (ret) {
+		mhi_unprepare_from_transfer(mhi_dev);
+		goto exit_unlock;
+	}
+
+exit_started:
+	mhiwwan->mhi_dev_start_count++;
+exit_unlock:
+	mutex_unlock(&mhiwwan->mhi_dev_lock);
+	return ret;
+}
+
+static void mhi_wwan_ctrl_stop(struct mhi_wwan_dev *mhiwwan)
+{
+	mutex_lock(&mhiwwan->mhi_dev_lock);
+
+	mhiwwan->mhi_dev_start_count--;
+
+	if (mhiwwan->mhi_dev && !mhiwwan->mhi_dev_start_count)
+		mhi_unprepare_from_transfer(mhiwwan->mhi_dev);
+
+	mutex_unlock(&mhiwwan->mhi_dev_lock);
+}
+
+static int mhi_wwan_ctrl_open(struct inode *inode, struct file *filp)
+{
+	struct mhi_wwan_dev *mhiwwan = filp->private_data;
+	int ret = 0;
+
+	kref_get(&mhiwwan->refcnt);
+
+	ret = mhi_wwan_ctrl_start(mhiwwan);
+	if (ret)
+		kref_put(&mhiwwan->refcnt, mhi_wwan_ctrl_dev_release);
+
+	return ret;
+}
+
+static int mhi_wwan_ctrl_release(struct inode *inode, struct file *filp)
+{
+	struct mhi_wwan_dev *mhiwwan = filp->private_data;
+
+	mhi_wwan_ctrl_stop(mhiwwan);
+	kref_put(&mhiwwan->refcnt, mhi_wwan_ctrl_dev_release);
+
+	return 0;
+}
+
+static __poll_t mhi_wwan_ctrl_poll(struct file *filp, poll_table *wait)
+{
+	struct mhi_wwan_dev *mhiwwan = filp->private_data;
+	__poll_t mask = 0;
+
+	poll_wait(filp, &mhiwwan->ul_wq, wait);
+	poll_wait(filp, &mhiwwan->dl_wq, wait);
+
+	/* Any buffer in the DL queue ? */
+	spin_lock_bh(&mhiwwan->dl_queue_lock);
+	if (!list_empty(&mhiwwan->dl_queue))
+		mask |= EPOLLIN | EPOLLRDNORM;
+	spin_unlock_bh(&mhiwwan->dl_queue_lock);
+
+	/* If MHI queue is not full, write is possible */
+	mutex_lock(&mhiwwan->mhi_dev_lock);
+	if (!mhiwwan->mhi_dev) /* mhi dev got hot-unplugged */
+		mask = EPOLLHUP;
+	else if (!mhi_queue_is_full(mhiwwan->mhi_dev, DMA_TO_DEVICE))
+		mask |= EPOLLOUT | EPOLLWRNORM;
+	mutex_unlock(&mhiwwan->mhi_dev_lock);
+
+	return mask;
+}
+
+static bool is_write_blocked(struct mhi_wwan_dev *mhiwwan)
+{
+	return test_bit(MHI_WWAN_TX_FULL, &mhiwwan->flags) &&
+		test_bit(MHI_WWAN_CONNECTED, &mhiwwan->flags);
+}
+
+static int mhi_wwan_wait_writable(struct mhi_wwan_dev *mhiwwan, bool nonblock)
+{
+	int ret;
+
+	if (is_write_blocked(mhiwwan)) {
+		if (nonblock)
+			return -EAGAIN;
+
+		ret = wait_event_interruptible(mhiwwan->ul_wq,
+					       !is_write_blocked(mhiwwan));
+		if (ret < 0)
+			return -ERESTARTSYS;
+	}
+
+	if (!test_bit(MHI_WWAN_CONNECTED, &mhiwwan->flags))
+		return -ENODEV;
+
+	return 0;
+}
+
+static ssize_t mhi_wwan_ctrl_write(struct file *filp, const char __user *buf,
+				   size_t count, loff_t *offp)
+{
+	struct mhi_wwan_dev *mhiwwan = filp->private_data;
+	size_t xfer_size = min_t(size_t, count, mhiwwan->mtu);
+	void *kbuf;
+	int ret;
+
+	if (!test_bit(MHI_WWAN_UL_CAP, &mhiwwan->flags))
+		return -EOPNOTSUPP;
+
+	if (!buf || !count)
+		return -EINVAL;
+
+	ret = mhi_wwan_wait_writable(mhiwwan, filp->f_flags & O_NONBLOCK);
+	if (ret)
+		return ret;
+
+	kbuf = kmalloc(xfer_size, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	if (copy_from_user(kbuf, buf, xfer_size)) {
+		ret = -EFAULT;
+		goto exit_free_buf;
+	}
+
+	mutex_lock(&mhiwwan->mhi_dev_lock);
+
+	if (!mhiwwan->mhi_dev) { /* mhi dev got hot-unplugged */
+		ret = -ENODEV;
+		goto exit_unlock;
+	}
+
+	ret = mhi_queue_buf(mhiwwan->mhi_dev, DMA_TO_DEVICE, kbuf, xfer_size, MHI_EOT);
+	if (ret)
+		goto exit_unlock;
+
+	kbuf = NULL; /* Buffer is owned by MHI core now, prevent freeing */
+
+	if (mhi_queue_is_full(mhiwwan->mhi_dev, DMA_TO_DEVICE))
+		set_bit(MHI_WWAN_TX_FULL, &mhiwwan->flags);
+
+exit_unlock:
+	mutex_unlock(&mhiwwan->mhi_dev_lock);
+exit_free_buf:
+	kfree(kbuf);
+
+	return ret ? ret : xfer_size;
+}
+
+static void mhi_wwan_ctrl_recycle_mhibuf(struct mhi_wwan_dev *mhiwwan,
+					 struct mhi_wwan_buf *mhibuf)
+{
+	struct mhi_device *mhi_dev;
+	int ret;
+
+	mutex_lock(&mhiwwan->mhi_dev_lock);
+
+	mhi_dev = mhiwwan->mhi_dev;
+	if (!mhi_dev) /* mhi dev got hot-unplugged */
+		kfree(mhibuf->data);
+
+	ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, mhibuf->data,
+			    mhiwwan->mtu, MHI_EOT);
+	if (ret) {
+		dev_warn(&mhi_dev->dev, "Unable to recycle buffer (%d)\n", ret);
+		kfree(mhibuf->data);
+	}
+
+	mutex_unlock(&mhiwwan->mhi_dev_lock);
+}
+
+static bool is_read_blocked(struct mhi_wwan_dev *mhiwwan)
+{
+	return test_bit(MHI_WWAN_CONNECTED, &mhiwwan->flags) &&
+		list_empty(&mhiwwan->dl_queue);
+}
+
+/* Called with dl_queue lock to wait for buffer in the dl_queue */
+static int mhi_wwan_wait_dlqueue_lock_irq(struct mhi_wwan_dev *mhiwwan, bool nonblock)
+{
+	int ret;
+
+	lockdep_assert_held(&mhiwwan->dl_queue_lock);
+
+	if (is_read_blocked(mhiwwan)) {
+		if (nonblock)
+			return -EAGAIN;
+
+		ret = wait_event_interruptible_lock_irq(mhiwwan->dl_wq,
+							!is_read_blocked(mhiwwan),
+							mhiwwan->dl_queue_lock);
+		if (ret < 0)
+			return -ERESTARTSYS;
+	}
+
+	if (!test_bit(MHI_WWAN_CONNECTED, &mhiwwan->flags))
+		return -ENODEV;
+
+	return 0;
+}
+
+static ssize_t mhi_wwan_ctrl_read(struct file *filp, char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct mhi_wwan_dev *mhiwwan = filp->private_data;
+	struct mhi_wwan_buf *mhibuf;
+	size_t copy_len;
+	char *copy_ptr;
+	int ret = 0;
+
+	if (!test_bit(MHI_WWAN_DL_CAP, &mhiwwan->flags))
+		return -EOPNOTSUPP;
+
+	if (!buf)
+		return -EINVAL;
+
+	/* _irq variant to use wait_event_interruptible_lock_irq() */
+	spin_lock_irq(&mhiwwan->dl_queue_lock);
+
+	ret = mhi_wwan_wait_dlqueue_lock_irq(mhiwwan, filp->f_flags & O_NONBLOCK);
+	if (ret)
+		goto err_unlock;
+
+	mhibuf = list_first_entry_or_null(&mhiwwan->dl_queue, struct mhi_wwan_buf, node);
+	if (!mhibuf) {
+		ret = -EIO;
+		goto err_unlock;
+	}
+
+	/* Consume the buffer */
+	copy_len = min_t(size_t, count, mhibuf->len - mhibuf->consumed);
+	copy_ptr = mhibuf->data + mhibuf->consumed;
+	mhibuf->consumed += copy_len;
+
+	if (mhibuf->consumed != mhibuf->len) {
+		/* buffer has not been fully consumed, and stay in the local
+		 * dl_queue.
+		 */
+		if (copy_to_user(buf, copy_ptr, copy_len))
+			ret = -EFAULT;
+		spin_unlock_irq(&mhiwwan->dl_queue_lock);
+	} else {
+		/* buffer has been fully consumed, it can be removed from
+		 * the local dl queue and recycled for a new mhi transfer.
+		 */
+		list_del(&mhibuf->node);
+		spin_unlock_irq(&mhiwwan->dl_queue_lock);
+
+		if (copy_to_user(buf, copy_ptr, copy_len))
+			ret = -EFAULT;
+
+		mhi_wwan_ctrl_recycle_mhibuf(mhiwwan, mhibuf);
+	}
+
+	return ret ? ret : copy_len;
+
+err_unlock:
+	spin_unlock_irq(&mhiwwan->dl_queue_lock);
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
+	struct mhi_wwan_dev *mhiwwan = dev_get_drvdata(&mhi_dev->dev);
+
+	dev_dbg(&mhi_dev->dev, "%s: status: %d xfer_len: %zu\n", __func__,
+		mhi_result->transaction_status, mhi_result->bytes_xferd);
+
+	kfree(mhi_result->buf_addr);
+
+	if (!mhi_queue_is_full(mhiwwan->mhi_dev, DMA_TO_DEVICE)) {
+		clear_bit(MHI_WWAN_TX_FULL, &mhiwwan->flags);
+		wake_up_interruptible(&mhiwwan->ul_wq);
+	}
+}
+
+static void mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
+			   struct mhi_result *mhi_result)
+{
+	struct mhi_wwan_dev *mhiwwan = dev_get_drvdata(&mhi_dev->dev);
+	struct mhi_wwan_buf *mhibuf;
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
+	/* mhibuf is placed at the end of the buffer (cf mhi_wwan_ctrl_fill_inbound) */
+	mhibuf = mhi_result->buf_addr + mhiwwan->mtu;
+	mhibuf->data = mhi_result->buf_addr;
+	mhibuf->len = mhi_result->bytes_xferd;
+	mhibuf->consumed = 0;
+
+	spin_lock_bh(&mhiwwan->dl_queue_lock);
+	list_add_tail(&mhibuf->node, &mhiwwan->dl_queue);
+	spin_unlock_bh(&mhiwwan->dl_queue_lock);
+
+	wake_up_interruptible(&mhiwwan->dl_wq);
+}
+
+static int mhi_wwan_ctrl_probe(struct mhi_device *mhi_dev,
+			       const struct mhi_device_id *id)
+{
+	struct mhi_controller *cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_wwan_dev *mhiwwan;
+
+	/* Create mhi_wwan data context */
+	mhiwwan = kzalloc(sizeof(*mhiwwan), GFP_KERNEL);
+	if (!mhiwwan)
+		return -ENOMEM;
+
+	/* Init mhi_wwan data */
+	kref_init(&mhiwwan->refcnt);
+	mutex_init(&mhiwwan->mhi_dev_lock);
+	init_waitqueue_head(&mhiwwan->ul_wq);
+	init_waitqueue_head(&mhiwwan->dl_wq);
+	spin_lock_init(&mhiwwan->dl_queue_lock);
+	INIT_LIST_HEAD(&mhiwwan->dl_queue);
+	mhiwwan->mhi_dev = mhi_dev;
+	mhiwwan->mtu = MHI_WWAN_MAX_MTU;
+	set_bit(MHI_WWAN_CONNECTED, &mhiwwan->flags);
+
+	if (mhi_dev->dl_chan)
+		set_bit(MHI_WWAN_DL_CAP, &mhiwwan->flags);
+	if (mhi_dev->ul_chan)
+		set_bit(MHI_WWAN_UL_CAP, &mhiwwan->flags);
+
+	dev_set_drvdata(&mhi_dev->dev, mhiwwan);
+
+	/* Register as a wwan port, id->driver_data contains wwan port type */
+	mhiwwan->wwan_port = wwan_create_port(&cntrl->mhi_dev->dev,
+					      id->driver_data,
+					      &mhidev_fops, mhiwwan);
+	if (IS_ERR(mhiwwan->wwan_port)) {
+		mutex_destroy(&mhiwwan->mhi_dev_lock);
+		kfree(mhiwwan);
+		return PTR_ERR(mhiwwan->wwan_port);
+	}
+
+	return 0;
+};
+
+static void mhi_wwan_ctrl_remove(struct mhi_device *mhi_dev)
+{
+	struct mhi_wwan_dev *mhiwwan = dev_get_drvdata(&mhi_dev->dev);
+
+	wwan_remove_port(mhiwwan->wwan_port);
+	dev_set_drvdata(&mhi_dev->dev, NULL);
+	clear_bit(MHI_WWAN_CONNECTED, &mhiwwan->flags);
+
+	/* Unlink mhi_dev from mhi_wwan_dev */
+	mutex_lock(&mhiwwan->mhi_dev_lock);
+	mhiwwan->mhi_dev = NULL;
+	mutex_unlock(&mhiwwan->mhi_dev_lock);
+
+	/* wake up any blocked user */
+	wake_up_interruptible(&mhiwwan->dl_wq);
+	wake_up_interruptible(&mhiwwan->ul_wq);
+
+	kref_put(&mhiwwan->refcnt, mhi_wwan_ctrl_dev_release);
+}
+
+static const struct mhi_device_id mhi_wwan_ctrl_match_table[] = {
+	{ .chan = "DUN", .driver_data = WWAN_PORT_AT },
+	{ .chan = "MBIM", .driver_data = WWAN_PORT_MBIM },
+	{ .chan = "QMI", .driver_data = WWAN_PORT_QMI },
+	{ .chan = "DIAG", .driver_data = WWAN_PORT_QCDM },
+	{ .chan = "FIREHOSE", .driver_data = WWAN_PORT_FIREHOSE },
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
+		.name = "mhi_wwan_ctrl",
+	},
+};
+
+module_mhi_driver(mhi_wwan_ctrl_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MHI WWAN CTRL Driver");
+MODULE_AUTHOR("Hemant Kumar <hemantk@codeaurora.org>");
+MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro.org>");
-- 
2.7.4

