Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814833540F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 12:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240241AbhDEJoQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 05:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240202AbhDEJoP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 05:44:15 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A426DC061788
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 02:44:09 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id f6so4343316wrv.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 02:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rEfxwFa9aRihWqiEpLVZwH8m4iHNhizOOU1k1FZxLo0=;
        b=IR7tRUGAvfnlr+ba/aq0K36SRPpxC0i2TJM8b+soQq/Ni77TFF/0Rw8/rnL5VyM04w
         m58HZp0Qzi4zfyqMZrzK5q0FbuSoUf1qtx9ShP9uKWKV6E/0HX16RrNBUsUFvL6Vlsuo
         Y87SFNXWT14oAZAV9oadSHMGrq2XEXjbTlt6bM3FsrGwxIEIcZRf9KdFeJkdwxj0KCz+
         AaPZVHyyO0cDhlaxjLMvO8VLxIF9dTiuMRBL2VJ2IkbTdr3xvZQAoQl7L3g2cP5ZPP1l
         FrxEj7Obw0R47+6JyZzurz5pmtouQb1wyMh/qYsSC5nLBcxPOAYBaYIhCC87Kfw+VTFd
         IUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rEfxwFa9aRihWqiEpLVZwH8m4iHNhizOOU1k1FZxLo0=;
        b=iBIwzuqVFW1eE+1C443vAcIiKDXuskDUWPp+F+Ml3gImFSJi50JRB/WRAy3MiHg+pf
         GpD5s46w/SDfiznAyURO/KEZMzwZ88q8B/8mZQOjyUsdNiZb9ic4dklHnFS/RmJsqSMs
         jOs25JTbvBG75yDZQ4EumA1nhwVSeOYa/Oe9E/n1Cs+K/bSwQzlmuAyc2nK6sSj5I8P9
         GgMDTXBsFppH4WfynblB8205iTiH+y6/xTEsruOQJFmLIL8wfLzHquwirAIGm2jIWPEu
         OdXsk5VIFOzfRa+rQuiSpigB4v9L7U3S7VEJOWFk1HBuLL3SluHRr7+m4gtddqR2cm/r
         Rnbw==
X-Gm-Message-State: AOAM530KMc6xAUfuzaUoIoEMllWWL2g1JgQWIMmhETLYbntxsnRiovoT
        bhDyasPpCA5AoEGHewyiIND+Lg==
X-Google-Smtp-Source: ABdhPJydMrIUR/vMcvjDex9B5rdo5P4+uAJhz6egZVxyWfxWGGFv+tOGP8puT4BblKljcc89+gIz2g==
X-Received: by 2002:a5d:47c4:: with SMTP id o4mr27993128wrc.138.1617615848184;
        Mon, 05 Apr 2021 02:44:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:5167:245d:4a0a:9d97])
        by smtp.gmail.com with ESMTPSA id o1sm34822wrw.23.2021.04.05.02.44.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Apr 2021 02:44:07 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     gregkh@linuxfoundation.org, kuba@kernel.org, davem@davemloft.net
Cc:     linux-arm-msm@vger.kernel.org, aleksander@aleksander.es,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        bjorn.andersson@linaro.org, manivannan.sadhasivam@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH net-next v9 2/2] net: Add Qcom WWAN control driver
Date:   Mon,  5 Apr 2021 11:52:49 +0200
Message-Id: <1617616369-27305-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617616369-27305-1-git-send-email-loic.poulain@linaro.org>
References: <1617616369-27305-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MHI WWWAN control driver allows MHI QCOM-based modems to expose
different modem control protocols/ports via the WWAN framework, so that
userspace modem tools or daemon (e.g. ModemManager) can control WWAN
config and state (APN config, SMS, provider selection...). A QCOM-based
modem can expose one or several of the following protocols:
- AT: Well known AT commands interactive protocol (microcom, minicom...)
- MBIM: Mobile Broadband Interface Model (libmbim, mbimcli)
- QMI: QCOM MSM/Modem Interface (libqmi, qmicli)
- QCDM: QCOM Modem diagnostic interface (libqcdm)
- FIREHOSE: XML-based protocol for Modem firmware management
        (qmi-firmware-update)

Note that this patch is mostly a rework of the earlier MHI UCI
tentative that was a generic interface for accessing MHI bus from
userspace. As suggested, this new version is WWAN specific and is
dedicated to only expose channels used for controlling a modem, and
for which related opensource userpace support exist.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: update copyright (2021)
 v3: Move driver to dedicated drivers/net/wwan directory
 v4: Rework to use wwan framework instead of self cdev management
 v5: Fix errors/typos in Kconfig
 v6: - Move to new wwan interface, No need dedicated call to wwan_dev_create
     - Cleanup code (remove legacy from mhi_uci, unused defines/vars...)
     - Remove useless write_lock mutex
     - Add mhi_wwan_wait_writable and mhi_wwan_wait_dlqueue_lock_irq helpers
     - Rework locking
     - Add MHI_WWAN_TX_FULL flag
     - Add support for NONBLOCK read/write
 v7: Fix change log (mixed up 1/2 and 2/2)
 v8: - Implement wwan_port_ops instead of fops
     - Remove all obsolete elements (kref, lock, waitqueues)
     - Add tracking of RX buffer budget
     - Use WWAN TX flow control function to stop TX when MHI queue is full
 v9: - Add proper locking for rx_budget + rx_refill scheduling
     - Fix cocci errors (use-after-free, ERR_CAST)

 drivers/net/wwan/Kconfig         |  14 ++
 drivers/net/wwan/Makefile        |   2 +
 drivers/net/wwan/mhi_wwan_ctrl.c | 282 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 298 insertions(+)
 create mode 100644 drivers/net/wwan/mhi_wwan_ctrl.c

diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
index fc3f3a1..7ad1920 100644
--- a/drivers/net/wwan/Kconfig
+++ b/drivers/net/wwan/Kconfig
@@ -20,4 +20,18 @@ config WWAN_CORE
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
+	  called mhi_wwan_ctrl.
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
index 0000000..479bb92
--- /dev/null
+++ b/drivers/net/wwan/mhi_wwan_ctrl.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2021, Linaro Ltd <loic.poulain@linaro.org> */
+#include <linux/kernel.h>
+#include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/wwan.h>
+
+/* MHI wwan flags */
+#define MHI_WWAN_DL_CAP		BIT(0)
+#define MHI_WWAN_UL_CAP		BIT(1)
+#define MHI_WWAN_RX_REFILL	BIT(2)
+
+#define MHI_WWAN_MAX_MTU	0x8000
+
+struct mhi_wwan_dev {
+	/* Lower level is a mhi dev, upper level is a wwan port */
+	struct mhi_device *mhi_dev;
+	struct wwan_port *wwan_port;
+
+	/* State and capabilities */
+	unsigned long flags;
+	size_t mtu;
+
+	/* Protect against concurrent TX and TX-completion (bh) */
+	spinlock_t tx_lock;
+
+	/* Protect RX budget and rx_refill scheduling */
+	spinlock_t rx_lock;
+	struct work_struct rx_refill;
+
+	/* RX budget, initially sets to the size of the MHI RX queue, is used to
+	 * limit the number of allocated and queued packets. It is decremented
+	 * on data queueing and incremented on data release.
+	 */
+	unsigned int rx_budget;
+};
+
+/* Increment RX budget and schedule RX refill if necessary */
+static void mhi_wwan_rx_budget_inc(struct mhi_wwan_dev *mhiwwan)
+{
+	spin_lock(&mhiwwan->rx_lock);
+
+	mhiwwan->rx_budget++;
+
+	if (test_bit(MHI_WWAN_RX_REFILL, &mhiwwan->flags))
+		schedule_work(&mhiwwan->rx_refill);
+
+	spin_unlock(&mhiwwan->rx_lock);
+}
+
+/* Decrement RX budget if non-zero and return true on success */
+static bool mhi_wwan_rx_budget_dec(struct mhi_wwan_dev *mhiwwan)
+{
+	bool ret = false;
+
+	spin_lock(&mhiwwan->rx_lock);
+
+	if (mhiwwan->rx_budget)
+		mhiwwan->rx_budget--;
+
+	if (mhiwwan->rx_budget && test_bit(MHI_WWAN_RX_REFILL, &mhiwwan->flags))
+		ret = true;
+
+	spin_unlock(&mhiwwan->rx_lock);
+
+	return ret;
+}
+
+static void __mhi_skb_destructor(struct sk_buff *skb)
+{
+	/* RX buffer has been consumed, increase the allowed budget */
+	mhi_wwan_rx_budget_inc(skb_shinfo(skb)->destructor_arg);
+}
+
+static void mhi_wwan_ctrl_refill_work(struct work_struct *work)
+{
+	struct mhi_wwan_dev *mhiwwan = container_of(work, struct mhi_wwan_dev, rx_refill);
+	struct mhi_device *mhi_dev = mhiwwan->mhi_dev;
+
+	while (mhi_wwan_rx_budget_dec(mhiwwan)) {
+		struct sk_buff *skb;
+
+		skb = alloc_skb(mhiwwan->mtu, GFP_KERNEL);
+		if (!skb) {
+			mhi_wwan_rx_budget_inc(mhiwwan);
+			break;
+		}
+
+		/* To prevent unlimited buffer allocation if nothing consumes
+		 * the RX buffers (passed to WWAN core), track their lifespan
+		 * to not allocate more than allowed budget.
+		 */
+		skb->destructor = __mhi_skb_destructor;
+		skb_shinfo(skb)->destructor_arg = mhiwwan;
+
+		if (mhi_queue_skb(mhi_dev, DMA_FROM_DEVICE, skb, mhiwwan->mtu, MHI_EOT)) {
+			dev_err(&mhi_dev->dev, "Failed to queue buffer\n");
+			kfree_skb(skb);
+			break;
+		}
+	}
+}
+
+static int mhi_wwan_ctrl_start(struct wwan_port *port)
+{
+	struct mhi_wwan_dev *mhiwwan = wwan_port_get_drvdata(port);
+	int ret;
+
+	/* Start mhi device's channel(s) */
+	ret = mhi_prepare_for_transfer(mhiwwan->mhi_dev);
+	if (ret)
+		return ret;
+
+	/* Don't allocate more buffers than MHI channel queue size */
+	mhiwwan->rx_budget = mhi_get_free_desc_count(mhiwwan->mhi_dev, DMA_FROM_DEVICE);
+
+	/* Add buffers to the MHI inbound queue */
+	if (test_bit(MHI_WWAN_DL_CAP, &mhiwwan->flags)) {
+		set_bit(MHI_WWAN_RX_REFILL, &mhiwwan->flags);
+		mhi_wwan_ctrl_refill_work(&mhiwwan->rx_refill);
+	}
+
+	return 0;
+}
+
+static void mhi_wwan_ctrl_stop(struct wwan_port *port)
+{
+	struct mhi_wwan_dev *mhiwwan = wwan_port_get_drvdata(port);
+
+	spin_lock(&mhiwwan->rx_lock);
+	clear_bit(MHI_WWAN_RX_REFILL, &mhiwwan->flags);
+	spin_unlock(&mhiwwan->rx_lock);
+
+	cancel_work_sync(&mhiwwan->rx_refill);
+
+	mhi_unprepare_from_transfer(mhiwwan->mhi_dev);
+}
+
+static int mhi_wwan_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
+{
+	struct mhi_wwan_dev *mhiwwan = wwan_port_get_drvdata(port);
+	int ret;
+
+	if (skb->len > mhiwwan->mtu)
+		return -EMSGSIZE;
+
+	if (!test_bit(MHI_WWAN_UL_CAP, &mhiwwan->flags))
+		return -EOPNOTSUPP;
+
+	/* Queue the packet for MHI transfer and check fullness of the queue */
+	spin_lock_bh(&mhiwwan->tx_lock);
+	ret = mhi_queue_skb(mhiwwan->mhi_dev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
+	if (mhi_queue_is_full(mhiwwan->mhi_dev, DMA_TO_DEVICE))
+		wwan_port_txoff(port);
+	spin_unlock_bh(&mhiwwan->tx_lock);
+
+	return ret;
+}
+
+static const struct wwan_port_ops wwan_pops = {
+	.start = mhi_wwan_ctrl_start,
+	.stop = mhi_wwan_ctrl_stop,
+	.tx = mhi_wwan_ctrl_tx,
+};
+
+static void mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
+			   struct mhi_result *mhi_result)
+{
+	struct mhi_wwan_dev *mhiwwan = dev_get_drvdata(&mhi_dev->dev);
+	struct wwan_port *port = mhiwwan->wwan_port;
+	struct sk_buff *skb = mhi_result->buf_addr;
+
+	dev_dbg(&mhi_dev->dev, "%s: status: %d xfer_len: %zu\n", __func__,
+		mhi_result->transaction_status, mhi_result->bytes_xferd);
+
+	/* MHI core has done with the buffer, release it */
+	consume_skb(skb);
+
+	/* There is likely new slot available in the MHI queue, re-allow TX */
+	spin_lock_bh(&mhiwwan->tx_lock);
+	if (!mhi_queue_is_full(mhiwwan->mhi_dev, DMA_TO_DEVICE))
+		wwan_port_txon(port);
+	spin_unlock_bh(&mhiwwan->tx_lock);
+}
+
+static void mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
+			   struct mhi_result *mhi_result)
+{
+	struct mhi_wwan_dev *mhiwwan = dev_get_drvdata(&mhi_dev->dev);
+	struct wwan_port *port = mhiwwan->wwan_port;
+	struct sk_buff *skb = mhi_result->buf_addr;
+
+	dev_dbg(&mhi_dev->dev, "%s: status: %d receive_len: %zu\n", __func__,
+		mhi_result->transaction_status, mhi_result->bytes_xferd);
+
+	if (mhi_result->transaction_status &&
+	    mhi_result->transaction_status != -EOVERFLOW) {
+		kfree_skb(skb);
+		return;
+	}
+
+	/* MHI core does not update skb->len, do it before forward */
+	skb_put(skb, mhi_result->bytes_xferd);
+	wwan_port_rx(port, skb);
+
+	/* Do not increment rx budget nor refill RX buffers now, wait for the
+	 * buffer to be consumed. Done from __mhi_skb_destructor().
+	 */
+}
+
+static int mhi_wwan_ctrl_probe(struct mhi_device *mhi_dev,
+			       const struct mhi_device_id *id)
+{
+	struct mhi_controller *cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_wwan_dev *mhiwwan;
+	struct wwan_port *port;
+
+	mhiwwan = kzalloc(sizeof(*mhiwwan), GFP_KERNEL);
+	if (!mhiwwan)
+		return -ENOMEM;
+
+	mhiwwan->mhi_dev = mhi_dev;
+	mhiwwan->mtu = MHI_WWAN_MAX_MTU;
+	INIT_WORK(&mhiwwan->rx_refill, mhi_wwan_ctrl_refill_work);
+	spin_lock_init(&mhiwwan->tx_lock);
+	spin_lock_init(&mhiwwan->rx_lock);
+
+	if (mhi_dev->dl_chan)
+		set_bit(MHI_WWAN_DL_CAP, &mhiwwan->flags);
+	if (mhi_dev->ul_chan)
+		set_bit(MHI_WWAN_UL_CAP, &mhiwwan->flags);
+
+	dev_set_drvdata(&mhi_dev->dev, mhiwwan);
+
+	/* Register as a wwan port, id->driver_data contains wwan port type */
+	port = wwan_create_port(&cntrl->mhi_dev->dev, id->driver_data,
+				&wwan_pops, mhiwwan);
+	if (IS_ERR(mhiwwan->wwan_port)) {
+		kfree(mhiwwan);
+		return PTR_ERR(port);
+	}
+
+	mhiwwan->wwan_port = port;
+
+	return 0;
+};
+
+static void mhi_wwan_ctrl_remove(struct mhi_device *mhi_dev)
+{
+	struct mhi_wwan_dev *mhiwwan = dev_get_drvdata(&mhi_dev->dev);
+
+	wwan_remove_port(mhiwwan->wwan_port);
+	kfree(mhiwwan);
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
+MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro.org>");
-- 
2.7.4

