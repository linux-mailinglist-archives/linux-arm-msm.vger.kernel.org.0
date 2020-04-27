Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B980B1B9924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 09:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgD0H6w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 03:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgD0H6v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 03:58:51 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1A8C061A10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 00:58:51 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t7so781445plr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/86LCZpkdCCI2aQCkzyWwEuy6AbVAj1IJKzL58DHDfQ=;
        b=yXhjLF63xzunAobd/XvUojuDkxfYHrIxbF0Jm4orkjBrwAw36qjEQVMfCvnQCOdkei
         AAn7G/mKCudsL5FhWaoqvf4tlBdxeWHIaFIasQA7rOVNVjbA3AJbfblEIN5IAR89nILF
         aPDRfLVY47Il9oiRJvM0X+p95Wb5xW51KZvuBIN3L/aikcbSuiMfCF8qrvaWyLDtl0jg
         t2u+1XVhPrBlflpve+cfAZ7Z2rYnEt5Gy7ofk+/ydKoP1DbASVYUKu9ZiZQdxYH4W1fE
         zvH9ZBVRIixLamt+C8sl4qExv3BXC1UbyVfPG6MSyUpEvKDZAM6VfF5mBrd2iPV3sg3b
         iSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/86LCZpkdCCI2aQCkzyWwEuy6AbVAj1IJKzL58DHDfQ=;
        b=b8lxlpQreBEm/bFcLNzJbgALvLjsRwtdaDm0gCkwamiGgIaT2HU7DMvPrNFqTTA0fK
         JmeUwoVHdveZvwxwDOzxx7qy0iujlkRfkBHmOFnuqfUxR2z2LVDx7NT/Curt1DXrNj3k
         DmI3FK9OC369EqXxu9NmNiR2/+lrrqffH5AkCRGwMRCpQqDAhsP+RR6Ai+3hEytzQ0Or
         BL4HDSU440LfVqDgZARGoXAC13H84ebRDxWHmYbnVQsTU1R7kLBG6lAXE6s1WbH5gkhe
         V1u40gjWCxInVgouC1QIbh42o81fORLf8+Y5WjydlCs6L3+TReno+mF4KDjaRfLVKjEz
         gF/w==
X-Gm-Message-State: AGi0Pub5D76lsvllbYgm6eHvaFtp/PNSgT4MwXW9is9XkBj6H4VNyY8g
        82z+uEOXxUYrC3YhQpPD/cGd
X-Google-Smtp-Source: APiQypLM262f7ZIbLqNkWXm5Lqjv+SMpPIU6Cw8zioTr7QgWZp/l4Q8sx14fEBQo0ESZ5NOWyzHWpg==
X-Received: by 2002:a17:90a:17ed:: with SMTP id q100mr23094930pja.80.1587974330931;
        Mon, 27 Apr 2020 00:58:50 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:996:8534:f925:aed4:6e41:e1dd])
        by smtp.gmail.com with ESMTPSA id a12sm11621190pfr.28.2020.04.27.00.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 00:58:50 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clew@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/3] bus: mhi: core: Add support for MHI suspend and resume
Date:   Mon, 27 Apr 2020 13:28:27 +0530
Message-Id: <20200427075829.9304-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427075829.9304-1-manivannan.sadhasivam@linaro.org>
References: <20200427075829.9304-1-manivannan.sadhasivam@linaro.org>
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

