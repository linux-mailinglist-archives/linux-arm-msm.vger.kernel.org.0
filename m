Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E63122B9B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 00:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbgGWWhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 18:37:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47184 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728199AbgGWWhE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 18:37:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595543823; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=T//9T+37XVZl3nGOhX+X3lszo/UOFmeF+qd3HIsjEZs=; b=d+J3JW467q8TygvjF56NQaU468LqKd9uL+S/H8uHCqpqqOHeUrTaofndsWIx1HZwyxYx2z8I
 Qi3WNM8f0xqsMYgBGYnOOdB1qPjS4YiiwMuiYBonydNeC/JlNyZOBe0E7Xa/kyR7fFKW16JH
 rhYY1fKxFkba+jw14bguXVcltVQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f1a1105c7a053446acc9f8b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Jul 2020 22:36:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0B7E2C43395; Thu, 23 Jul 2020 22:36:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3E619C43391;
        Thu, 23 Jul 2020 22:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3E619C43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v5 03/10] bus: mhi: core: Use helper API to trigger a non-blocking host resume
Date:   Thu, 23 Jul 2020 15:36:35 -0700
Message-Id: <1595543802-17859-4-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595543802-17859-1-git-send-email-bbhatt@codeaurora.org>
References: <1595543802-17859-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Autonomous low power mode support requires the MHI host to resume from
multiple places and post a wakeup source to exit system suspend. This
needs to be done in a non-blocking manner. Introduce a helper API to
trigger the host resume for data transfers and other non-blocking use
cases while supporting implementation of autonomous low power modes.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/internal.h |  7 +++++++
 drivers/bus/mhi/core/main.c     | 21 +++++++--------------
 drivers/bus/mhi/core/pm.c       | 13 ++++---------
 3 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index bcfa7b6..1bbd6e9 100644
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
index 1f622ce..79be18e 100644
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
index 661d704..b227d41 100644
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
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

