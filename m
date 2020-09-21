Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F27272B11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgIUQJR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbgIUQJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:09:16 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E34C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:09:16 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id w7so9667227pfi.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=U2zjAyHMv+vNvI44PVm7WKt9xsmBm2Pl8T9zrZbzqsE=;
        b=RHzxsrckT/eMMi0ETqEu4Gdcz2j8ah8y3sUVa3w3gJC4JEYlMUTGCgNZU8FsvKPT8A
         2Ge7FS0LlWx7eqQNwLyjsAw65cSkF7k0dzQu2V+XZzs3+NZAqEFNbbJY19ZJRTWnjt9s
         qrNJvtKHbATB70MTUbfvqCmrLFR0Q34pTsBzkRwpOjoi9cPXqRupiAJuLrVK9i8pX0VK
         znvOomIkpQ7fDtFvTmjtyArlYTI1ZGAmq9WZWd1023quxm1GSljLQ7Sy0Y4xJ3uspJsh
         V4bgm7YV5T2T1YbBr8Hu1OUFmZhrKtGneUDLHq9IR1a2EhpsHnOC5AripnH3QReDCk6F
         sPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=U2zjAyHMv+vNvI44PVm7WKt9xsmBm2Pl8T9zrZbzqsE=;
        b=tNmonccUVWzawkXQYksfAZKdNId8AVxODtIpUITkaqfzwMDmuJaIxDPwKbAgE0e/SZ
         1NirxAwIE/wkeYnu3fF7c0y+lpRTAEdAFt8qKGulesJlIa3/6aVSHxresvR49trgzfUA
         7Wh4ofcI44cTiuvgYK2W74wd0bxr9HywN2O0KvVfThf4bjyoqKVGepES8XoPAA3iVKEU
         HkRF+Nl8+0DyGEjEitPo7u5vlHRVM1UbCAoi60epPQGmG/sum0oU7YiK1BUqjw4C/Ec+
         EWzRN/VUrraXQlQhAi9EI+73gnusKpEwT7jvm+8kRmHo9NfejLgx7n0chTVnB0fVhxC1
         5/5w==
X-Gm-Message-State: AOAM530WkYqwrmxiw2RQeEU8jHMGXFfB9INiQZulVyFiq22iTmeYxUur
        BG+O7MG9rP9gITgvzRKnvCz4
X-Google-Smtp-Source: ABdhPJzvVF03dR0sAwhJ205kg8Rtzbo2JPj4Cg9MTbZuQ7twyp5TXjHKyLh74/izds7eUnYO2nIdJQ==
X-Received: by 2002:a63:c64f:: with SMTP id x15mr267779pgg.135.1600704556001;
        Mon, 21 Sep 2020 09:09:16 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:09:15 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 04/18] bus: mhi: core: Use helper API to trigger a non-blocking host resume
Date:   Mon, 21 Sep 2020 21:38:01 +0530
Message-Id: <20200921160815.28071-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Autonomous low power mode support requires the MHI host to resume from
multiple places and post a wakeup source to exit system suspend. This
needs to be done in a non-blocking manner. Introduce a helper API to
trigger the host resume for data transfers and other non-blocking use
cases while supporting implementation of autonomous low power modes.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/internal.h |  7 +++++++
 drivers/bus/mhi/core/main.c     | 21 +++++++--------------
 drivers/bus/mhi/core/pm.c       | 13 ++++---------
 3 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index bcfa7b6558ef..1bbd6e99d38d 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -599,6 +599,13 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl);
 int mhi_send_cmd(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 		 enum mhi_cmd_type cmd);
 
+static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
+{
+	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
+	mhi_cntrl->runtime_get(mhi_cntrl);
+	mhi_cntrl->runtime_put(mhi_cntrl);
+}
+
 /* Register access methods */
 void mhi_db_brstmode(struct mhi_controller *mhi_cntrl, struct db_cfg *db_cfg,
 		     void __iomem *db_addr, dma_addr_t db_val);
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 1f622ce6be8b..79be18ec2ebf 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -909,8 +909,7 @@ void mhi_ctrl_ev_task(unsigned long data)
 		 * process it since we are probably in a suspended state,
 		 * so trigger a resume.
 		 */
-		mhi_cntrl->runtime_get(mhi_cntrl);
-		mhi_cntrl->runtime_put(mhi_cntrl);
+		mhi_trigger_resume(mhi_cntrl);
 
 		return;
 	}
@@ -971,10 +970,8 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	}
 
 	/* we're in M3 or transitioning to M3 */
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
-		mhi_cntrl->runtime_get(mhi_cntrl);
-		mhi_cntrl->runtime_put(mhi_cntrl);
-	}
+	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
+		mhi_trigger_resume(mhi_cntrl);
 
 	/* Toggle wake to exit out of M2 */
 	mhi_cntrl->wake_toggle(mhi_cntrl);
@@ -1032,10 +1029,8 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	}
 
 	/* we're in M3 or transitioning to M3 */
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
-		mhi_cntrl->runtime_get(mhi_cntrl);
-		mhi_cntrl->runtime_put(mhi_cntrl);
-	}
+	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
+		mhi_trigger_resume(mhi_cntrl);
 
 	/* Toggle wake to exit out of M2 */
 	mhi_cntrl->wake_toggle(mhi_cntrl);
@@ -1147,10 +1142,8 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
 
 	/* we're in M3 or transitioning to M3 */
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
-		mhi_cntrl->runtime_get(mhi_cntrl);
-		mhi_cntrl->runtime_put(mhi_cntrl);
-	}
+	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
+		mhi_trigger_resume(mhi_cntrl);
 
 	/* Toggle wake to exit out of M2 */
 	mhi_cntrl->wake_toggle(mhi_cntrl);
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 661d704c8093..b227d415e937 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -824,11 +824,8 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
 	/* Wake up the device */
 	read_lock_bh(&mhi_cntrl->pm_lock);
 	mhi_cntrl->wake_get(mhi_cntrl, true);
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
-		pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
-		mhi_cntrl->runtime_get(mhi_cntrl);
-		mhi_cntrl->runtime_put(mhi_cntrl);
-	}
+	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
+		mhi_trigger_resume(mhi_cntrl);
 	read_unlock_bh(&mhi_cntrl->pm_lock);
 
 	ret = wait_event_timeout(mhi_cntrl->state_event,
@@ -1139,10 +1136,8 @@ void mhi_device_put(struct mhi_device *mhi_dev)
 
 	mhi_dev->dev_wake--;
 	read_lock_bh(&mhi_cntrl->pm_lock);
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
-		mhi_cntrl->runtime_get(mhi_cntrl);
-		mhi_cntrl->runtime_put(mhi_cntrl);
-	}
+	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
+		mhi_trigger_resume(mhi_cntrl);
 
 	mhi_cntrl->wake_put(mhi_cntrl, false);
 	read_unlock_bh(&mhi_cntrl->pm_lock);
-- 
2.17.1

