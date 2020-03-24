Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41D4919058D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 07:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgCXGLb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 02:11:31 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:53496 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727430AbgCXGLa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 02:11:30 -0400
Received: by mail-pj1-f66.google.com with SMTP id l36so995332pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 23:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/86LCZpkdCCI2aQCkzyWwEuy6AbVAj1IJKzL58DHDfQ=;
        b=vrtwUcqhU1l9wLZyKBZEW4mDGC9KBIBLFjtZ3UfXYB/Qz0U0Hc2k9GcoKevL7uDtaS
         7GXCtoWPGYDhplHae3R/r5X2o0rrJ2uNfFFMEq2Do9EL7sXt0d031QjzTa3VV40llKc1
         Evt248p+agdfSRVHBaks347mtnq4EyD4auzSv41h+mEGm5Z4omkqbHWLnNL2flYrqfIu
         XPqOXQFWJdUC+TpOezYzq+DBYPqUOs2W7O/f+GGaPRumSz33Ovlu2kri4K8Tjezyv7t1
         PRlhPGSyDu3gq+n+3t7puJ+YO9CyZ/EYigHMjV9qqb57JXeMpNq+3cW1/IWqCfPC7o8E
         y96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/86LCZpkdCCI2aQCkzyWwEuy6AbVAj1IJKzL58DHDfQ=;
        b=TpBM/BKllbnR14Qeh9mrUxerqyz/tDqxOHbSUnXRih66260Y69lSVvGaCf66grAiaY
         y8N7wuQA4ZN5ay3FmzB216KgOHGIJpG9I4k4tkVudzCTBeo/3YUgw75tlRBIFgmHNnuf
         +WQjdVRIKZ1t6w9SJjqey+n7uK3AI3pjORpqcrlbZXQlvSKrafs9H9CAl/u1JAF6CKTI
         rKFBlPtQBpP4HjFlPkkX2OfboTV8EQmlF2LkArdSvl/NzLdtcwko0fuI5QNC2KqiyDMo
         sj0JuhlPFJUUz6tLYgFayHvZ5G1U+yU/iKYnNKpXdAWyure4ItgDgMqHcS03CGJx4i84
         7EUA==
X-Gm-Message-State: ANhLgQ2LDx11lrAbKo8PDBM2UWqhoQX3rtpCDvnbj+X3l80117kvvo6j
        h6Qq/5lf7VbR76Nq8DQ+96Wm
X-Google-Smtp-Source: ADFU+vtT7adukjvlk9uTw7E6MHGu38E1BVbffnegU9VP/VYKG7E3XbjWykfRkoNk0VRxDEUGKXKDeA==
X-Received: by 2002:a17:902:b7c8:: with SMTP id v8mr13871187plz.174.1585030289088;
        Mon, 23 Mar 2020 23:11:29 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:59b:91e:2dd6:dffe:3569:b473])
        by smtp.gmail.com with ESMTPSA id d3sm1198230pjc.42.2020.03.23.23.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 23:11:28 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 5/7] bus: mhi: core: Add support for MHI suspend and resume
Date:   Tue, 24 Mar 2020 11:40:48 +0530
Message-Id: <20200324061050.14845-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324061050.14845-1-manivannan.sadhasivam@linaro.org>
References: <20200324061050.14845-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for MHI suspend and resume states. While at it, the
mhi_notify() function needs to be exported as well.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c |   3 +-
 drivers/bus/mhi/core/pm.c   | 143 ++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h         |  19 +++++
 3 files changed, 164 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index eb4256b81406..3e9aa3b2da77 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -267,7 +267,7 @@ int mhi_destroy_device(struct device *dev, void *data)
 	return 0;
 }
 
-static void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason)
+void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason)
 {
 	struct mhi_driver *mhi_drv;
 
@@ -279,6 +279,7 @@ static void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason)
 	if (mhi_drv->status_cb)
 		mhi_drv->status_cb(mhi_dev, cb_reason);
 }
+EXPORT_SYMBOL_GPL(mhi_notify);
 
 /* Bind MHI channels to MHI devices */
 void mhi_create_devices(struct mhi_controller *mhi_cntrl)
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 52690cb5c89c..3529419d076b 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -669,6 +669,149 @@ void mhi_pm_st_worker(struct work_struct *work)
 	}
 }
 
+int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_chan *itr, *tmp;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	enum mhi_pm_state new_state;
+	int ret;
+
+	if (mhi_cntrl->pm_state == MHI_PM_DISABLE)
+		return -EINVAL;
+
+	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
+		return -EIO;
+
+	/* Return busy if there are any pending resources */
+	if (atomic_read(&mhi_cntrl->dev_wake))
+		return -EBUSY;
+
+	/* Take MHI out of M2 state */
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	mhi_cntrl->wake_get(mhi_cntrl, false);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	ret = wait_event_timeout(mhi_cntrl->state_event,
+				 mhi_cntrl->dev_state == MHI_STATE_M0 ||
+				 mhi_cntrl->dev_state == MHI_STATE_M1 ||
+				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
+				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
+
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	mhi_cntrl->wake_put(mhi_cntrl, false);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
+		dev_err(dev,
+			"Could not enter M0/M1 state");
+		return -EIO;
+	}
+
+	write_lock_irq(&mhi_cntrl->pm_lock);
+
+	if (atomic_read(&mhi_cntrl->dev_wake)) {
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		return -EBUSY;
+	}
+
+	dev_info(dev, "Allowing M3 transition\n");
+	new_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_M3_ENTER);
+	if (new_state != MHI_PM_M3_ENTER) {
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		dev_err(dev,
+			"Error setting to PM state: %s from: %s\n",
+			to_mhi_pm_state_str(MHI_PM_M3_ENTER),
+			to_mhi_pm_state_str(mhi_cntrl->pm_state));
+		return -EIO;
+	}
+
+	/* Set MHI to M3 and wait for completion */
+	mhi_set_mhi_state(mhi_cntrl, MHI_STATE_M3);
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+	dev_info(dev, "Wait for M3 completion\n");
+
+	ret = wait_event_timeout(mhi_cntrl->state_event,
+				 mhi_cntrl->dev_state == MHI_STATE_M3 ||
+				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
+				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
+
+	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
+		dev_err(dev,
+			"Did not enter M3 state, MHI state: %s, PM state: %s\n",
+			TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+			to_mhi_pm_state_str(mhi_cntrl->pm_state));
+		return -EIO;
+	}
+
+	/* Notify clients about entering LPM */
+	list_for_each_entry_safe(itr, tmp, &mhi_cntrl->lpm_chans, node) {
+		mutex_lock(&itr->mutex);
+		if (itr->mhi_dev)
+			mhi_notify(itr->mhi_dev, MHI_CB_LPM_ENTER);
+		mutex_unlock(&itr->mutex);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mhi_pm_suspend);
+
+int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_chan *itr, *tmp;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	enum mhi_pm_state cur_state;
+	int ret;
+
+	dev_info(dev, "Entered with PM state: %s, MHI state: %s\n",
+		 to_mhi_pm_state_str(mhi_cntrl->pm_state),
+		 TO_MHI_STATE_STR(mhi_cntrl->dev_state));
+
+	if (mhi_cntrl->pm_state == MHI_PM_DISABLE)
+		return 0;
+
+	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
+		return -EIO;
+
+	/* Notify clients about exiting LPM */
+	list_for_each_entry_safe(itr, tmp, &mhi_cntrl->lpm_chans, node) {
+		mutex_lock(&itr->mutex);
+		if (itr->mhi_dev)
+			mhi_notify(itr->mhi_dev, MHI_CB_LPM_EXIT);
+		mutex_unlock(&itr->mutex);
+	}
+
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_M3_EXIT);
+	if (cur_state != MHI_PM_M3_EXIT) {
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		dev_info(dev,
+			 "Error setting to PM state: %s from: %s\n",
+			 to_mhi_pm_state_str(MHI_PM_M3_EXIT),
+			 to_mhi_pm_state_str(mhi_cntrl->pm_state));
+		return -EIO;
+	}
+
+	/* Set MHI to M0 and wait for completion */
+	mhi_set_mhi_state(mhi_cntrl, MHI_STATE_M0);
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+
+	ret = wait_event_timeout(mhi_cntrl->state_event,
+				 mhi_cntrl->dev_state == MHI_STATE_M0 ||
+				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
+				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
+
+	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
+		dev_err(dev,
+			"Did not enter M0 state, MHI state: %s, PM state: %s\n",
+			TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+			to_mhi_pm_state_str(mhi_cntrl->pm_state));
+		return -EIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mhi_pm_resume);
+
 int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
 {
 	int ret;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index ad1996001965..a4288f4d656f 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -568,6 +568,13 @@ void mhi_driver_unregister(struct mhi_driver *mhi_drv);
 void mhi_set_mhi_state(struct mhi_controller *mhi_cntrl,
 		       enum mhi_state state);
 
+/**
+ * mhi_notify - Notify the MHI client driver about client device status
+ * @mhi_dev: MHI device instance
+ * @cb_reason: MHI callback reason
+ */
+void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason);
+
 /**
  * mhi_prepare_for_power_up - Do pre-initialization before power up.
  *                            This is optional, call this before power up if
@@ -604,6 +611,18 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
  */
 void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl);
 
+/**
+ * mhi_pm_suspend - Move MHI into a suspended state
+ * @mhi_cntrl: MHI controller
+ */
+int mhi_pm_suspend(struct mhi_controller *mhi_cntrl);
+
+/**
+ * mhi_pm_resume - Resume MHI from suspended state
+ * @mhi_cntrl: MHI controller
+ */
+int mhi_pm_resume(struct mhi_controller *mhi_cntrl);
+
 /**
  * mhi_download_rddm_img - Download ramdump image from device for
  *                         debugging purpose.
-- 
2.17.1

