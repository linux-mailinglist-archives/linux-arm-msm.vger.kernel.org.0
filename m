Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33F842709E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 04:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgISCDI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 22:03:08 -0400
Received: from so254-54.mailgun.net ([198.61.254.54]:49074 "EHLO
        so254-54.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbgISCDC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 22:03:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600480982; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ntU9ESFtCMTZuTbwP8UstmSzL85B3vm8HNNo34Ro4RM=; b=nxlG7hBFt9imNaEIHeAR5whOTKo17Vd5WggiFdBOsHzyV9etzlyQ08E2G27Xjfl/e/r32+20
 6WqVK73Ulxk2wWPF0pZta1iFWtljIUMKfEEZviwUWRE9pJyDkfHXDA7J4kj8t913R3mfdMWn
 ONVtrxHohmjguc41R/QfoHXUzbY=
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f6566c52131f7663aca9fad (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Sep 2020 02:02:45
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3FA57C433C8; Sat, 19 Sep 2020 02:02:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F65BC433CB;
        Sat, 19 Sep 2020 02:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3F65BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 02/10] bus: mhi: core: Move to using high priority workqueue
Date:   Fri, 18 Sep 2020 19:02:27 -0700
Message-Id: <1600480955-16827-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI work is currently scheduled on the global/system workqueue and can
encounter delays on a stressed system. To avoid those unforeseen
delays which can hamper bootup or shutdown times, use a dedicated high
priority workqueue instead of the global/system workqueue.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 7 +++++++
 drivers/bus/mhi/core/pm.c   | 2 +-
 include/linux/mhi.h         | 2 ++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 1b4161e..ca32563 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -890,6 +890,11 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
 	init_waitqueue_head(&mhi_cntrl->state_event);
 
+	mhi_cntrl->hiprio_wq = alloc_ordered_workqueue
+				("mhi_hiprio_wq", WQ_MEM_RECLAIM | WQ_HIGHPRI);
+	if (!mhi_cntrl->hiprio_wq)
+		goto error_alloc_cmd;
+
 	mhi_cmd = mhi_cntrl->mhi_cmd;
 	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++)
 		spin_lock_init(&mhi_cmd->lock);
@@ -977,10 +982,12 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 error_alloc_dev:
 	kfree(mhi_cntrl->mhi_cmd);
+	destroy_workqueue(mhi_cntrl->hiprio_wq);
 
 error_alloc_cmd:
 	vfree(mhi_cntrl->mhi_chan);
 	kfree(mhi_cntrl->mhi_event);
+	destroy_workqueue(mhi_cntrl->hiprio_wq);
 
 	return ret;
 }
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index ce4d969..9d4789d 100644
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
index fb45a0f..7677676 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -338,6 +338,7 @@ struct mhi_controller_config {
  * @wlock: Lock for protecting device wakeup
  * @mhi_link_info: Device bandwidth info
  * @st_worker: State transition worker
+ * @hiprio_wq: High priority workqueue
  * @state_event: State change event
  * @status_cb: CB function to notify power states of the device (required)
  * @wake_get: CB function to assert device wake (optional)
@@ -421,6 +422,7 @@ struct mhi_controller {
 	spinlock_t wlock;
 	struct mhi_link_info mhi_link_info;
 	struct work_struct st_worker;
+	struct workqueue_struct *hiprio_wq;
 	wait_queue_head_t state_event;
 
 	void (*status_cb)(struct mhi_controller *mhi_cntrl,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

