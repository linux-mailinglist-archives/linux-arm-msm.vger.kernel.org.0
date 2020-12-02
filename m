Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109C72CB96B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbgLBJoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388504AbgLBJoR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:17 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE5DC08E860
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:43:22 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t3so741620pgi.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aCVtwoMEwnU/q7ikh6vCgAOZIiE0p1Na8j+wCbAr6Fw=;
        b=LsgQwzr8NayEzWH8Zpz2N6+tUkMRQ5zH74sppdFiihHLKEdgw/x26915JpwBZZ5W7w
         BXpC22qtd0YICfJZgopjxUG7b3SXLJFMOnbZlz+jxS8cpZ/gOmPXFeumavBBocG2Gxha
         UJOaArO8V7qZ3fLT31JfY7pxjoGgpEi2n33qnBDDKc2kbAkj7QXOz9kE9vnrS3aB5vI+
         xskFx/7nNWWb0kfibXURJ7yssXvLIRUDXQ08lWTmwkoxA88qC6cmsAOUaOZbSQ43NToE
         iPQY5jkGC/h3dDqtkBp8t1oSvKKoixdJA9EzFUmAXld5vsNyz/40Gvr0VxMPSI32dc6Z
         U+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aCVtwoMEwnU/q7ikh6vCgAOZIiE0p1Na8j+wCbAr6Fw=;
        b=s6AMl8ZrAJUKpwMgoVW1EcjhZpWvA4ij2HEJl899u38QbfoCdQuBu3HrR22XbMpM9A
         i66cQoOHU7EyW74E1qPcQxJZjeuw4ltlpJFqs5vs5h+pLYZzj08urNn1go5gi8rx/uSr
         rSUX52zhrlVNsVKkbqmoRPXl6cytaX8lUiKMjV9Ua8qFEeleLQ9LnqflBxwhsh1rql5l
         WFAg2uxKodyJf3mCiI75coOO6/YsvQyhsVg8P7jIb8KMRAqEDUH0qqsDYPky3f1BtJ3I
         3z+d/C0Un9XbI6z1LV0AS6ZbxBvaonC3qPsJPrSIP9vQXXqjWfMHgZMfiuJ2VPHY0qC3
         NL+w==
X-Gm-Message-State: AOAM5325NhucEUMSC2m992YF9q8/fUeI9tDVRvshCB/ZC5RN9nx9XTt3
        CFT/73LD6zgwMw6KypCgKW4B
X-Google-Smtp-Source: ABdhPJzhk2VbqZ/xmIPTdYZWFB13gB/jDS39iyXcMbEatSnVq8vVoiERQp9mlh+WPrC2KcFk0KjrYA==
X-Received: by 2002:a63:fa0e:: with SMTP id y14mr1899263pgh.225.1606902201790;
        Wed, 02 Dec 2020 01:43:21 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:43:21 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 14/29] bus: mhi: core: Move to using high priority workqueue
Date:   Wed,  2 Dec 2020 15:11:44 +0530
Message-Id: <20201202094159.107075-15-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

MHI work is currently scheduled on the global/system workqueue and can
encounter delays on a stressed system. To avoid those unforeseen
delays which can hamper bootup or shutdown times, use a dedicated high
priority workqueue instead of the global/system workqueue.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 9 +++++++++
 drivers/bus/mhi/core/pm.c   | 2 +-
 include/linux/mhi.h         | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 8cefa359fccd..877e40c86801 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -880,6 +880,13 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
 	init_waitqueue_head(&mhi_cntrl->state_event);
 
+	mhi_cntrl->hiprio_wq = alloc_ordered_workqueue
+				("mhi_hiprio_wq", WQ_MEM_RECLAIM | WQ_HIGHPRI);
+	if (!mhi_cntrl->hiprio_wq) {
+		dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate workqueue\n");
+		goto error_alloc_cmd;
+	}
+
 	mhi_cmd = mhi_cntrl->mhi_cmd;
 	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++)
 		spin_lock_init(&mhi_cmd->lock);
@@ -969,6 +976,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 error_alloc_cmd:
 	vfree(mhi_cntrl->mhi_chan);
 	kfree(mhi_cntrl->mhi_event);
+	destroy_workqueue(mhi_cntrl->hiprio_wq);
 
 	return ret;
 }
@@ -982,6 +990,7 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 
 	mhi_destroy_debugfs(mhi_cntrl);
 
+	destroy_workqueue(mhi_cntrl->hiprio_wq);
 	kfree(mhi_cntrl->mhi_cmd);
 	kfree(mhi_cntrl->mhi_event);
 
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 3de7b1639ec6..805b6fa748f0 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -597,7 +597,7 @@ int mhi_queue_state_transition(struct mhi_controller *mhi_cntrl,
 	list_add_tail(&item->node, &mhi_cntrl->transition_list);
 	spin_unlock_irqrestore(&mhi_cntrl->transition_lock, flags);
 
-	schedule_work(&mhi_cntrl->st_worker);
+	queue_work(mhi_cntrl->hiprio_wq, &mhi_cntrl->st_worker);
 
 	return 0;
 }
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 52b3c60bf9bb..1ed5f2aa224b 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -337,6 +337,7 @@ struct mhi_controller_config {
  * @wlock: Lock for protecting device wakeup
  * @mhi_link_info: Device bandwidth info
  * @st_worker: State transition worker
+ * @hiprio_wq: High priority workqueue for MHI work such as state transitions
  * @state_event: State change event
  * @status_cb: CB function to notify power states of the device (required)
  * @wake_get: CB function to assert device wake (optional)
@@ -419,6 +420,7 @@ struct mhi_controller {
 	spinlock_t wlock;
 	struct mhi_link_info mhi_link_info;
 	struct work_struct st_worker;
+	struct workqueue_struct *hiprio_wq;
 	wait_queue_head_t state_event;
 
 	void (*status_cb)(struct mhi_controller *mhi_cntrl,
-- 
2.25.1

