Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A14B419A58A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 08:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731683AbgDAGpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 02:45:14 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34251 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731868AbgDAGpO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 02:45:14 -0400
Received: by mail-pl1-f195.google.com with SMTP id a23so9232589plm.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2020 23:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/86LCZpkdCCI2aQCkzyWwEuy6AbVAj1IJKzL58DHDfQ=;
        b=Pa6VtaEMzqbmuRKWOKeNTV1VG7JPCarrnGBwPfOg+89OwMJAH+TA+UwofmMViJcZWr
         +IHGKY01tR/V60G1nOhQHC080Ohr6iQ/gA6yk6hlvEe0Z8WRc3nmJ9s1PkRF4Yvh0Wc5
         1Dtsze2+n4KEW+HFSYzrwzD6jcMIi134rRyZV1uLcxVUtuVgyS0vYZA+gwTBBDM13NEw
         CglYuz+p3PW3pHQikPmR2F9eYmjf/cW/O3YIY/gv4sv1bUUdJ+R/hCSPZzcrrUNHV8sf
         UHQ0qjKWNYOv7LAc5TJbwGLQ7nRQhp4mPYZrnQ+ibbglCMmQBHYytrgRw/AX13CekfiK
         kCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/86LCZpkdCCI2aQCkzyWwEuy6AbVAj1IJKzL58DHDfQ=;
        b=ZUCyWle5wdMLK6v97+C3sgBkNb83wu3ZVQAuqrE13Rb+klk9hNDbcieTMZxpD7ut+G
         TZY1fsQ2tf5lcUJO7AQIR5FsQk2p/rnjlzrsiEjBtSrL181r6Emk6RhZXy7gttYxsPlw
         YFH7lwln/OPFXq7FqxiYPG8rtZ6MtxAYybr/KA72ONLtZ5HNBtnJLJYn4OT36zOKO+nx
         34irrYp36yXV3BhebCWW2FE8CMnP/o8yM3+siGpCNdG76xHeXUGoWsIG3YMwnMu0S2vn
         RYjcSomjUGpjRluRQY3FZLmNe8O72CgCf9c0WgtCnhz8m1fEaN3/VigNLZQzXejJGr6W
         IhOA==
X-Gm-Message-State: AGi0PuZympuDtUjOCQ50lkx+upSutdErzFm6VlNyUOtp0PFUofhVkOzk
        BLxeWJFfJC3NfkSux5fWXMDdHLWA5xAE
X-Google-Smtp-Source: APiQypLLcaicR4CC2kT6JFO230ntsZf0OeOZHNmaJ4vK6hQIkRRfoalkLe8g0UKZEtuaMZCgXBGJLg==
X-Received: by 2002:a17:902:7896:: with SMTP id q22mr9787124pll.75.1585723511547;
        Tue, 31 Mar 2020 23:45:11 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:648c:592d:60f5:6f58:e46:db78])
        by smtp.gmail.com with ESMTPSA id w24sm831962pjn.14.2020.03.31.23.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 23:45:11 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/3] bus: mhi: core: Add support for MHI suspend and resume
Date:   Wed,  1 Apr 2020 12:14:33 +0530
Message-Id: <20200401064435.12676-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200401064435.12676-1-manivannan.sadhasivam@linaro.org>
References: <20200401064435.12676-1-manivannan.sadhasivam@linaro.org>
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

