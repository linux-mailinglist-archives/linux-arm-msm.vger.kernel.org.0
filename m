Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3A129A6A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 09:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894953AbgJ0Id0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 04:33:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33994 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2894936AbgJ0IdU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 04:33:20 -0400
Received: by mail-wr1-f68.google.com with SMTP id i1so887334wro.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2020 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kyNCk1nnSz645iYCcNPWj71o0yYMWwlI/sqvYy5mgj0=;
        b=L3Z7u/Alf2G7D0waF9sgzlbANvsNVO9aYqBJ5SgIoZofMFtQ7HIZgD7USROWa9IsBu
         hmLCw4PdJ/Ed1jxOODzlXJ/UcXLrPv/uTHWBGEG3wZz7kfhsmKu3ZcU/UT0QsjtItgZN
         +qyvhMKDmyBqXKNpeax/2z2fuWfPBe4KgBE7s5hOx0V3H5xA0gjBoJ5sbjfQ2Y6+gXyB
         6w+pQtw3nerYPszUnwCDmqI2n8TQ6fJDK9KTHY78aFACf80gyBNxwSuuSyF94wcRZqtz
         FdzYUibkwMJSwcf+t0Qu/8oMfFCHCToi0v+wlOrmcJf019/N1LgllIscl3uqjgCdooB4
         ZAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kyNCk1nnSz645iYCcNPWj71o0yYMWwlI/sqvYy5mgj0=;
        b=gZ4QvgUu4XW07E6cjql+JZtXDzdsQG/vFizlMIZHvliCWMReToLf9PtT3nagYWGJdb
         +VfAuACUk6PkXqCTGpdAOdDy4HxqObGSxjmhr5h/fw452NltDnihStsaiZhe24B5zNdt
         yU6viuffXLgEFai0AhWZe6pJq699UL5kpyYqkc+m3KGjWHibvZmwrBY2u+JBMRY1K7eh
         FUyHTNL/2QajDBrK/aSq8uEm6unKu61lewZaVL/cmewn/DnPUYcr+DkMppQp1eOHOZJ2
         9rvHrvaEOc3QrLNbk1kr7a3mpwcMXvAYJq4RtLIBjLQGghrFtVj/M2LXy4EaAbJZBz+z
         iAKQ==
X-Gm-Message-State: AOAM533L7R15zjvVyWelUBHQEDQFoGJNRG+CjzvxKz+V8bQ7iWLY+yyw
        X1YyjYx73tbvuNi8hNPytG90WQ==
X-Google-Smtp-Source: ABdhPJwndJwYE2ckNLF/2OhJ77dULP8Rs0F3Iw4Nwlcx6pgOYRYyFUYo2fIP/dbf4zDl/c8tZVPZQA==
X-Received: by 2002:a5d:6149:: with SMTP id y9mr1435816wrt.352.1603787596105;
        Tue, 27 Oct 2020 01:33:16 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id u6sm976361wmj.40.2020.10.27.01.33.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 01:33:15 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     kuba@kernel.org, davem@davemloft.net,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v7 2/2] net: Add mhi-net driver
Date:   Tue, 27 Oct 2020 09:39:37 +0100
Message-Id: <1603787977-6975-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603787977-6975-1-git-send-email-loic.poulain@linaro.org>
References: <1603787977-6975-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds a new network driver implementing MHI transport for
network packets. Packets can be in any format, though QMAP (rmnet)
is the usual protocol (flow control + PDN mux).

It support two MHI devices, IP_HW0 which is, the path to the IPA
(IP accelerator) on qcom modem, And IP_SW0 which is the software
driven IP path (to modem CPU).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
  v2: - rebase on net-next
      - remove useless skb_linearize
      - check error type on mhi_queue return
      - rate limited errors
      - Schedule RX refill only on 'low' buf level
      - SET_NETDEV_DEV in probe
      - reorder device remove sequence
  v3: - Stop channels on net_register error
      - Remove useles parentheses
      - Add driver .owner
  v4: - prevent potential cpu hog in rx-refill loop
      - Access mtu via READ_ONCE
  v5: - Fix access to u64 stats
  v6: - Stop TX queue earlier if queue is full
      - Preventing 'abnormal' NETDEV_TX_BUSY path
  v7: - Stop dl/ul cb operations on channel resetting

 drivers/net/Kconfig   |   7 ++
 drivers/net/Makefile  |   1 +
 drivers/net/mhi_net.c | 320 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 328 insertions(+)
 create mode 100644 drivers/net/mhi_net.c

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 1368d1d..11a6357 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -426,6 +426,13 @@ config VSOCKMON
 	  mostly intended for developers or support to debug vsock issues. If
 	  unsure, say N.
 
+config MHI_NET
+	tristate "MHI network driver"
+	depends on MHI_BUS
+	help
+	  This is the network driver for MHI.  It can be used with
+	  QCOM based WWAN modems (like SDX55).  Say Y or M.
+
 endif # NET_CORE
 
 config SUNGEM_PHY
diff --git a/drivers/net/Makefile b/drivers/net/Makefile
index 94b6080..8312037 100644
--- a/drivers/net/Makefile
+++ b/drivers/net/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_GTP) += gtp.o
 obj-$(CONFIG_NLMON) += nlmon.o
 obj-$(CONFIG_NET_VRF) += vrf.o
 obj-$(CONFIG_VSOCKMON) += vsockmon.o
+obj-$(CONFIG_MHI_NET) += mhi_net.o
 
 #
 # Networking Drivers
diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
new file mode 100644
index 0000000..3c8e258
--- /dev/null
+++ b/drivers/net/mhi_net.c
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* MHI Network driver - Network over MHI
+ *
+ * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
+ */
+
+#include <linux/if_arp.h>
+#include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/netdevice.h>
+#include <linux/skbuff.h>
+#include <linux/u64_stats_sync.h>
+
+#define MIN_MTU		ETH_MIN_MTU
+#define MAX_MTU		0xffff
+#define DEFAULT_MTU	8192
+
+struct mhi_net_stats {
+	u64_stats_t rx_packets;
+	u64_stats_t rx_bytes;
+	u64_stats_t rx_errors;
+	u64_stats_t rx_dropped;
+	u64_stats_t tx_packets;
+	u64_stats_t tx_bytes;
+	u64_stats_t tx_errors;
+	u64_stats_t tx_dropped;
+	atomic_t rx_queued;
+	struct u64_stats_sync tx_syncp;
+	struct u64_stats_sync rx_syncp;
+};
+
+struct mhi_net_dev {
+	struct mhi_device *mdev;
+	struct net_device *ndev;
+	struct delayed_work rx_refill;
+	struct mhi_net_stats stats;
+	u32 rx_queue_sz;
+};
+
+static int mhi_ndo_open(struct net_device *ndev)
+{
+	struct mhi_net_dev *mhi_netdev = netdev_priv(ndev);
+
+	/* Feed the rx buffer pool */
+	schedule_delayed_work(&mhi_netdev->rx_refill, 0);
+
+	/* Carrier is established via out-of-band channel (e.g. qmi) */
+	netif_carrier_on(ndev);
+
+	netif_start_queue(ndev);
+
+	return 0;
+}
+
+static int mhi_ndo_stop(struct net_device *ndev)
+{
+	struct mhi_net_dev *mhi_netdev = netdev_priv(ndev);
+
+	netif_stop_queue(ndev);
+	netif_carrier_off(ndev);
+	cancel_delayed_work_sync(&mhi_netdev->rx_refill);
+
+	return 0;
+}
+
+static int mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
+{
+	struct mhi_net_dev *mhi_netdev = netdev_priv(ndev);
+	struct mhi_device *mdev = mhi_netdev->mdev;
+	int err;
+
+	/* mhi_queue_skb is not thread-safe, but xmit is serialized by the
+	 * network core. Once MHI core will be thread save, migrate to
+	 * NETIF_F_LLTX support.
+	 */
+	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
+	if (unlikely(err)) {
+		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
+				    ndev->name, err);
+
+		u64_stats_update_begin(&mhi_netdev->stats.tx_syncp);
+		u64_stats_inc(&mhi_netdev->stats.tx_dropped);
+		u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
+
+		/* drop the packet */
+		kfree_skb(skb);
+	}
+
+	if (mhi_queue_is_full(mdev, DMA_TO_DEVICE))
+		netif_stop_queue(ndev);
+
+	return NETDEV_TX_OK;
+}
+
+static void mhi_ndo_get_stats64(struct net_device *ndev,
+				struct rtnl_link_stats64 *stats)
+{
+	struct mhi_net_dev *mhi_netdev = netdev_priv(ndev);
+	unsigned int start;
+
+	do {
+		start = u64_stats_fetch_begin_irq(&mhi_netdev->stats.rx_syncp);
+		stats->rx_packets = u64_stats_read(&mhi_netdev->stats.rx_packets);
+		stats->rx_bytes = u64_stats_read(&mhi_netdev->stats.rx_bytes);
+		stats->rx_errors = u64_stats_read(&mhi_netdev->stats.rx_errors);
+		stats->rx_dropped = u64_stats_read(&mhi_netdev->stats.rx_dropped);
+	} while (u64_stats_fetch_retry_irq(&mhi_netdev->stats.rx_syncp, start));
+
+	do {
+		start = u64_stats_fetch_begin_irq(&mhi_netdev->stats.tx_syncp);
+		stats->tx_packets = u64_stats_read(&mhi_netdev->stats.tx_packets);
+		stats->tx_bytes = u64_stats_read(&mhi_netdev->stats.tx_bytes);
+		stats->tx_errors = u64_stats_read(&mhi_netdev->stats.tx_errors);
+		stats->tx_dropped = u64_stats_read(&mhi_netdev->stats.tx_dropped);
+	} while (u64_stats_fetch_retry_irq(&mhi_netdev->stats.tx_syncp, start));
+}
+
+static const struct net_device_ops mhi_netdev_ops = {
+	.ndo_open               = mhi_ndo_open,
+	.ndo_stop               = mhi_ndo_stop,
+	.ndo_start_xmit         = mhi_ndo_xmit,
+	.ndo_get_stats64	= mhi_ndo_get_stats64,
+};
+
+static void mhi_net_setup(struct net_device *ndev)
+{
+	ndev->header_ops = NULL;  /* No header */
+	ndev->type = ARPHRD_NONE; /* QMAP... */
+	ndev->hard_header_len = 0;
+	ndev->addr_len = 0;
+	ndev->flags = IFF_POINTOPOINT | IFF_NOARP;
+	ndev->netdev_ops = &mhi_netdev_ops;
+	ndev->mtu = DEFAULT_MTU;
+	ndev->min_mtu = MIN_MTU;
+	ndev->max_mtu = MAX_MTU;
+	ndev->tx_queue_len = 1000;
+}
+
+static void mhi_net_dl_callback(struct mhi_device *mhi_dev,
+				struct mhi_result *mhi_res)
+{
+	struct mhi_net_dev *mhi_netdev = dev_get_drvdata(&mhi_dev->dev);
+	struct sk_buff *skb = mhi_res->buf_addr;
+	int remaining;
+
+	remaining = atomic_dec_return(&mhi_netdev->stats.rx_queued);
+
+	if (unlikely(mhi_res->transaction_status)) {
+		u64_stats_update_begin(&mhi_netdev->stats.rx_syncp);
+		u64_stats_inc(&mhi_netdev->stats.rx_errors);
+		u64_stats_update_end(&mhi_netdev->stats.rx_syncp);
+
+		kfree_skb(skb);
+
+		/* MHI layer resetting the DL channel */
+		if (mhi_res->transaction_status == -ENOTCONN)
+			return;
+	} else {
+		u64_stats_update_begin(&mhi_netdev->stats.rx_syncp);
+		u64_stats_inc(&mhi_netdev->stats.rx_packets);
+		u64_stats_add(&mhi_netdev->stats.rx_bytes, mhi_res->bytes_xferd);
+		u64_stats_update_end(&mhi_netdev->stats.rx_syncp);
+
+		skb->protocol = htons(ETH_P_MAP);
+		skb_put(skb, mhi_res->bytes_xferd);
+		netif_rx(skb);
+	}
+
+	/* Refill if RX buffers queue becomes low */
+	if (remaining <= mhi_netdev->rx_queue_sz / 2)
+		schedule_delayed_work(&mhi_netdev->rx_refill, 0);
+}
+
+static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
+				struct mhi_result *mhi_res)
+{
+	struct mhi_net_dev *mhi_netdev = dev_get_drvdata(&mhi_dev->dev);
+	struct net_device *ndev = mhi_netdev->ndev;
+	struct sk_buff *skb = mhi_res->buf_addr;
+
+	/* Hardware has consumed the buffer, so free the skb (which is not
+	 * freed by the MHI stack) and perform accounting.
+	 */
+	consume_skb(skb);
+
+	u64_stats_update_begin(&mhi_netdev->stats.tx_syncp);
+	if (unlikely(mhi_res->transaction_status)) {
+		u64_stats_inc(&mhi_netdev->stats.tx_errors);
+
+		/* MHI layer resetting the UL channel */
+		if (mhi_res->transaction_status == -ENOTCONN)
+			return;
+	} else {
+		u64_stats_inc(&mhi_netdev->stats.tx_packets);
+		u64_stats_add(&mhi_netdev->stats.tx_bytes, mhi_res->bytes_xferd);
+	}
+	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
+
+	if (netif_queue_stopped(ndev))
+		netif_wake_queue(ndev);
+}
+
+static void mhi_net_rx_refill_work(struct work_struct *work)
+{
+	struct mhi_net_dev *mhi_netdev = container_of(work, struct mhi_net_dev,
+						      rx_refill.work);
+	struct net_device *ndev = mhi_netdev->ndev;
+	struct mhi_device *mdev = mhi_netdev->mdev;
+	int size = READ_ONCE(ndev->mtu);
+	struct sk_buff *skb;
+	int err;
+
+	do {
+		skb = netdev_alloc_skb(ndev, size);
+		if (unlikely(!skb))
+			break;
+
+		err = mhi_queue_skb(mdev, DMA_FROM_DEVICE, skb, size, MHI_EOT);
+		if (err) {
+			if (unlikely(err != -ENOMEM))
+				net_err_ratelimited("%s: Failed to queue RX buf (%d)\n",
+						    ndev->name, err);
+			kfree_skb(skb);
+			break;
+		}
+
+		atomic_inc(&mhi_netdev->stats.rx_queued);
+
+		/* Do not hog the CPU if rx buffers are completed faster than
+		 * queued (unlikely).
+		 */
+		cond_resched();
+	} while (1);
+
+	/* If we're still starved of rx buffers, reschedule latter */
+	if (unlikely(!atomic_read(&mhi_netdev->stats.rx_queued)))
+		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
+}
+
+static int mhi_net_probe(struct mhi_device *mhi_dev,
+			 const struct mhi_device_id *id)
+{
+	const char *netname = (char *)id->driver_data;
+	struct mhi_net_dev *mhi_netdev;
+	struct net_device *ndev;
+	struct device *dev = &mhi_dev->dev;
+	int err;
+
+	ndev = alloc_netdev(sizeof(*mhi_netdev), netname, NET_NAME_PREDICTABLE,
+			    mhi_net_setup);
+	if (!ndev)
+		return -ENOMEM;
+
+	mhi_netdev = netdev_priv(ndev);
+	dev_set_drvdata(dev, mhi_netdev);
+	mhi_netdev->ndev = ndev;
+	mhi_netdev->mdev = mhi_dev;
+	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
+
+	/* All MHI net channels have 128 ring elements (at least for now) */
+	mhi_netdev->rx_queue_sz = 128;
+
+	INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work);
+	u64_stats_init(&mhi_netdev->stats.rx_syncp);
+	u64_stats_init(&mhi_netdev->stats.tx_syncp);
+
+	/* Start MHI channels */
+	err = mhi_prepare_for_transfer(mhi_dev);
+	if (err)
+		goto out_err;
+
+	err = register_netdev(ndev);
+	if (err) {
+		mhi_unprepare_from_transfer(mhi_dev);
+		goto out_err;
+	}
+
+	return 0;
+
+out_err:
+	free_netdev(ndev);
+	return err;
+}
+
+static void mhi_net_remove(struct mhi_device *mhi_dev)
+{
+	struct mhi_net_dev *mhi_netdev = dev_get_drvdata(&mhi_dev->dev);
+
+	unregister_netdev(mhi_netdev->ndev);
+
+	mhi_unprepare_from_transfer(mhi_netdev->mdev);
+
+	free_netdev(mhi_netdev->ndev);
+}
+
+static const struct mhi_device_id mhi_net_id_table[] = {
+	{ .chan = "IP_HW0", .driver_data = (kernel_ulong_t)"mhi_hwip%d" },
+	{ .chan = "IP_SW0", .driver_data = (kernel_ulong_t)"mhi_swip%d" },
+	{}
+};
+MODULE_DEVICE_TABLE(mhi, mhi_net_id_table);
+
+static struct mhi_driver mhi_net_driver = {
+	.probe = mhi_net_probe,
+	.remove = mhi_net_remove,
+	.dl_xfer_cb = mhi_net_dl_callback,
+	.ul_xfer_cb = mhi_net_ul_callback,
+	.id_table = mhi_net_id_table,
+	.driver = {
+		.name = "mhi_net",
+		.owner = THIS_MODULE,
+	},
+};
+
+module_mhi_driver(mhi_net_driver);
+
+MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro.org>");
+MODULE_DESCRIPTION("Network over MHI");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

