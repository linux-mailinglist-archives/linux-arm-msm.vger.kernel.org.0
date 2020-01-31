Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8D4A14EDDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgAaNuc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:50:32 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:40054 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728919AbgAaNua (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:50:30 -0500
Received: by mail-pj1-f66.google.com with SMTP id 12so2853197pjb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 05:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=agUAm9uv6vAOO1BvpHiBcuA3PYfae7rXx4Xbwwfil5c=;
        b=uqY2CEiwQTSCzixCvnQxD66XtXjavwcTMp7qSy6kSjl7fdzWs9+jUM+0ufwRHS9iLJ
         LysBZaClkyDnWLUuWdOysSFowIF+LN2j8TePN/Zkwa/5dY2flIu54xREPF3lxj26R5Wp
         xCmJeZACw42Y3rlET5WDlMe4Gyg63hq2ap+ujwzcSiJsgIroeMZuEFOOxlGXBiCLN540
         YTiqErUxCl6ntsuW8mS11cE+qtrUTFVm/O703IaSghG6tP+aDsiAIOnrZfSX2E3gpDpr
         QJPmonIpas78vGF6810zMmAqEBxl5f/2oHjRKLimWA02WOBDNrRuOipKuj9mKy2bmSGY
         PAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=agUAm9uv6vAOO1BvpHiBcuA3PYfae7rXx4Xbwwfil5c=;
        b=bUZngNEkCex16VNcZkgevdP8ccz80jy3chYFV20HJXlGLT9rFiOUOwDeG+3raUGMqn
         XPpl31j99ne87u/q6k1ZOCqKk3qBAQbHZHtxchcXhjEcwQcPuAFHhyZupswcKr0JieDV
         hHquca8B/qMsRE0NbotSrnaROMwkyXAgkq5Oiwr4e+jDwhOI/jXr277Ypkyr5/K3g68k
         sLJieCwk+7sPDAxyFjhof02sCK6InV9LU+BmezwVwHaey6w2f2StXC+1LmCVgeUi1Do7
         6VidKcpMJzMeHNk+QmVfoWO6oOqbYTeUCYu20tleWRGCrDm0POGEBVhEVso0ZwThvLVp
         EynA==
X-Gm-Message-State: APjAAAX/Oequa8UlpS+yRWNwnq0g+uj29+IaqYJNf60FUBuAMZUzbx/c
        S0TfpQgNyi1y+5O2xVXCQ0Mm
X-Google-Smtp-Source: APXvYqyjHOwKx1XZ30DOo3GbA+vF7t5J+Iu93nqC7QI8LVxrS1Eg/V/bnhL75JkmjsIeGH/ZXBVN+g==
X-Received: by 2002:a17:902:7883:: with SMTP id q3mr10063792pll.113.1580478629815;
        Fri, 31 Jan 2020 05:50:29 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id p3sm10625632pfg.184.2020.01.31.05.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 05:50:29 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 03/16] bus: mhi: core: Add support for registering MHI client drivers
Date:   Fri, 31 Jan 2020 19:19:56 +0530
Message-Id: <20200131135009.31477-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
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
 include/linux/mhi.h         |  39 ++++++++++
 2 files changed, 188 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index a00f1547d252..999a675a5f0e 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -379,8 +379,157 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
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
index 02330236ced8..137f1891701f 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -372,6 +372,8 @@ struct mhi_controller {
  * @dl_chan: DL channel for the device
  * @dev: Driver model device node for the MHI device
  * @dev_type: MHI device type
+ * @ul_chan_id: MHI channel id for UL transfer
+ * @dl_chan_id: MHI channel id for DL transfer
  * @tiocm: Device current terminal settings
  * @dev_wake: Device wakeup counter
  */
@@ -383,6 +385,8 @@ struct mhi_device {
 	struct mhi_chan *dl_chan;
 	struct device dev;
 	enum mhi_device_type dev_type;
+	int ul_chan_id;
+	int dl_chan_id;
 	u32 tiocm;
 	u32 dev_wake;
 };
@@ -401,6 +405,29 @@ struct mhi_result {
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
@@ -417,4 +444,16 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
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

