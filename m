Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE0F146682
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 12:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbgAWLS7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 06:18:59 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36075 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729047AbgAWLS5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 06:18:57 -0500
Received: by mail-pl1-f194.google.com with SMTP id a6so1229955plm.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 03:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/ciesSehnrIZLgszGAVgbuMPEfl8YFzNthyWVaOTgD8=;
        b=FzQbWT4epM0w/2PUcR3c7S6UERgcxZ8NR14dOUmOeVn9tBjk7wO3oIPI3UpxXC5c5o
         FnIcs6xhpTyhKmk5z4IgjJlGKG4hem3e6vD80cNyUV5x3xpH7dc89FePmV8v6GtlmFa4
         mOrNn0iicX3b8NzCsZLhQW6F7T0fRDJ3Yy+G9ktyxi7h1z0Ha7fzVycvJyaAdHV71YDo
         rCInuHUxFLiQCn+I1gAA9Qmw3VrI4nysRh5gngP3rzVWodBT84bqBwHZR0ECe1Hhy9Du
         4Sfz2z3MLqvcommizRkWdx5lUtQFc9xid1Q79hXS06mM6zMLJJUMus+X6tIy2UwRB77S
         MmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/ciesSehnrIZLgszGAVgbuMPEfl8YFzNthyWVaOTgD8=;
        b=Kc3o3ZQkhjpYtCR490+uGVZT65FsSyoeUZn2HI1h+yF8PXYdLc3cmgA3JU6XQhR3zJ
         ykWOmtCXL8cV+rwjR/bWlA9DXWBbfWX5SXf86nys3X5sKKpB8qHTP0pJCgoC63m6Gm0z
         g+KcK2+/UCOkfNhrGTxo8qsor/gCT7BM/jAJCKFOj7CU/R9uFyKFjLuNCmVPreMA6psP
         C5KXuy7MN0zOUkgtk1uVvbn1uUBF7WB/cCD9GfKCJCWDrla187YewsLyijGhg56vjnph
         G/cSmyKHJFR+oDvFA4m2h87MCnkXAognH9+XUk1d50VRkqfhkOkt1OFsIKV+Z9azoVN3
         sOLQ==
X-Gm-Message-State: APjAAAWh+todPoSMsHeAlajwqYMe0GKy5zvkbX5LZEOkKwiIBd6BCybR
        8ykvU07nCh1dtKHfFs+FS5Va
X-Google-Smtp-Source: APXvYqx7EmNwYLK9IVNhdpsqVKoIchq+rzj2hHKuLowgUMDJevua9Yu+M9JTbumsSprt//wwkp7mpA==
X-Received: by 2002:a17:902:b611:: with SMTP id b17mr15663534pls.23.1579778336418;
        Thu, 23 Jan 2020 03:18:56 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id y6sm2627559pgc.10.2020.01.23.03.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 03:18:55 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 03/16] bus: mhi: core: Add support for registering MHI client drivers
Date:   Thu, 23 Jan 2020 16:48:23 +0530
Message-Id: <20200123111836.7414-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for registering MHI client drivers with the
MHI stack. MHI client drivers binds to one or more MHI devices inorder
to sends and receive the upper-layer protocol packets like IP packets,
modem control messages, and diagnostics messages over MHI bus.

This is based on the patch submitted by Sujeev Dias:
https://lkml.org/lkml/2018/7/9/987

Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
[mani: splitted and cleaned up for upstream]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 149 ++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h         |  35 +++++++++
 2 files changed, 184 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 5b817ec250e0..60dcf2ad3a5f 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -376,8 +376,157 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
 	return mhi_dev;
 }
 
+static int mhi_driver_probe(struct device *dev)
+{
+	struct mhi_device *mhi_dev = to_mhi_device(dev);
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct device_driver *drv = dev->driver;
+	struct mhi_driver *mhi_drv = to_mhi_driver(drv);
+	struct mhi_event *mhi_event;
+	struct mhi_chan *ul_chan = mhi_dev->ul_chan;
+	struct mhi_chan *dl_chan = mhi_dev->dl_chan;
+
+	if (ul_chan) {
+		/*
+		 * If channel supports LPM notifications then status_cb should
+		 * be provided
+		 */
+		if (ul_chan->lpm_notify && !mhi_drv->status_cb)
+			return -EINVAL;
+
+		/* For non-offload channels then xfer_cb should be provided */
+		if (!ul_chan->offload_ch && !mhi_drv->ul_xfer_cb)
+			return -EINVAL;
+
+		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
+	}
+
+	if (dl_chan) {
+		/*
+		 * If channel supports LPM notifications then status_cb should
+		 * be provided
+		 */
+		if (dl_chan->lpm_notify && !mhi_drv->status_cb)
+			return -EINVAL;
+
+		/* For non-offload channels then xfer_cb should be provided */
+		if (!dl_chan->offload_ch && !mhi_drv->dl_xfer_cb)
+			return -EINVAL;
+
+		mhi_event = &mhi_cntrl->mhi_event[dl_chan->er_index];
+
+		/*
+		 * If the channel event ring is managed by client, then
+		 * status_cb must be provided so that the framework can
+		 * notify pending data
+		 */
+		if (mhi_event->cl_manage && !mhi_drv->status_cb)
+			return -EINVAL;
+
+		dl_chan->xfer_cb = mhi_drv->dl_xfer_cb;
+	}
+
+	/* Call the user provided probe function */
+	return mhi_drv->probe(mhi_dev, mhi_dev->id);
+}
+
+static int mhi_driver_remove(struct device *dev)
+{
+	struct mhi_device *mhi_dev = to_mhi_device(dev);
+	struct mhi_driver *mhi_drv = to_mhi_driver(dev->driver);
+	struct mhi_chan *mhi_chan;
+	enum mhi_ch_state ch_state[] = {
+		MHI_CH_STATE_DISABLED,
+		MHI_CH_STATE_DISABLED
+	};
+	int dir;
+
+	/* Skip if it is a controller device */
+	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
+		return 0;
+
+	/* Reset both channels */
+	for (dir = 0; dir < 2; dir++) {
+		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
+
+		if (!mhi_chan)
+			continue;
+
+		/* Wake all threads waiting for completion */
+		write_lock_irq(&mhi_chan->lock);
+		mhi_chan->ccs = MHI_EV_CC_INVALID;
+		complete_all(&mhi_chan->completion);
+		write_unlock_irq(&mhi_chan->lock);
+
+		/* Set the channel state to disabled */
+		mutex_lock(&mhi_chan->mutex);
+		write_lock_irq(&mhi_chan->lock);
+		ch_state[dir] = mhi_chan->ch_state;
+		mhi_chan->ch_state = MHI_CH_STATE_SUSPENDED;
+		write_unlock_irq(&mhi_chan->lock);
+
+		mutex_unlock(&mhi_chan->mutex);
+	}
+
+	mhi_drv->remove(mhi_dev);
+
+	/* De-init channel if it was enabled */
+	for (dir = 0; dir < 2; dir++) {
+		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
+
+		if (!mhi_chan)
+			continue;
+
+		mutex_lock(&mhi_chan->mutex);
+
+		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
+
+		mutex_unlock(&mhi_chan->mutex);
+	}
+
+	return 0;
+}
+
+int mhi_driver_register(struct mhi_driver *mhi_drv)
+{
+	struct device_driver *driver = &mhi_drv->driver;
+
+	if (!mhi_drv->probe || !mhi_drv->remove)
+		return -EINVAL;
+
+	driver->bus = &mhi_bus_type;
+	driver->probe = mhi_driver_probe;
+	driver->remove = mhi_driver_remove;
+
+	return driver_register(driver);
+}
+EXPORT_SYMBOL_GPL(mhi_driver_register);
+
+void mhi_driver_unregister(struct mhi_driver *mhi_drv)
+{
+	driver_unregister(&mhi_drv->driver);
+}
+EXPORT_SYMBOL_GPL(mhi_driver_unregister);
+
 static int mhi_match(struct device *dev, struct device_driver *drv)
 {
+	struct mhi_device *mhi_dev = to_mhi_device(dev);
+	struct mhi_driver *mhi_drv = to_mhi_driver(drv);
+	const struct mhi_device_id *id;
+
+	/*
+	 * If the device is a controller type then there is no client driver
+	 * associated with it
+	 */
+	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
+		return 0;
+
+	for (id = mhi_drv->id_table; id->chan[0]; id++)
+		if (!strcmp(mhi_dev->chan_name, id->chan)) {
+			mhi_dev->id = id;
+			return 1;
+		}
+
 	return 0;
 };
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 69cf9a4b06c7..0fdad987dd70 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -400,6 +400,29 @@ struct mhi_result {
 	int transaction_status;
 };
 
+/**
+ * struct mhi_driver - Structure representing a MHI client driver
+ * @probe: CB function for client driver probe function
+ * @remove: CB function for client driver remove function
+ * @ul_xfer_cb: CB function for UL data transfer
+ * @dl_xfer_cb: CB function for DL data transfer
+ * @status_cb: CB functions for asynchronous status
+ * @driver: Device driver model driver
+ */
+struct mhi_driver {
+	const struct mhi_device_id *id_table;
+	int (*probe)(struct mhi_device *mhi_dev,
+		     const struct mhi_device_id *id);
+	void (*remove)(struct mhi_device *mhi_dev);
+	void (*ul_xfer_cb)(struct mhi_device *mhi_dev,
+			   struct mhi_result *result);
+	void (*dl_xfer_cb)(struct mhi_device *mhi_dev,
+			   struct mhi_result *result);
+	void (*status_cb)(struct mhi_device *mhi_dev, enum mhi_callback mhi_cb);
+	struct device_driver driver;
+};
+
+#define to_mhi_driver(drv) container_of(drv, struct mhi_driver, driver)
 #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
 
 /**
@@ -435,4 +458,16 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
  */
 void mhi_unregister_controller(struct mhi_controller *mhi_cntrl);
 
+/**
+ * mhi_driver_register - Register driver with MHI framework
+ * @mhi_drv: Driver associated with the device
+ */
+int mhi_driver_register(struct mhi_driver *mhi_drv);
+
+/**
+ * mhi_driver_unregister - Unregister a driver for mhi_devices
+ * @mhi_drv: Driver associated with the device
+ */
+void mhi_driver_unregister(struct mhi_driver *mhi_drv);
+
 #endif /* _MHI_H_ */
-- 
2.17.1

