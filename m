Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9D92AC63F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 21:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730205AbgKIUro (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 15:47:44 -0500
Received: from z5.mailgun.us ([104.130.96.5]:25667 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730330AbgKIUrn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 15:47:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604954862; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=XmlA0bdBqdg1GTOdQywIuNHcP/sshcHAEElrV7VUZlY=; b=MDnkLzUjrxl4tWEfXO93dldQLbU5mGyk3LgrnTMw037XYg2DQBvFURuQkYS5JAcT6kGrVj/k
 r1EJzkvw4mFm2BH4GZgjKdtSNP5gei3PM5EFmB0TKx2C35wmho699W6HQ3NFg7p4r72yiygg
 Ycbyr3ALVA/wmwQldYeEqBa8hak=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fa9aaee02f4ee3801422165 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 20:47:42
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 323E1C433C8; Mon,  9 Nov 2020 20:47:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 13E35C433C8;
        Mon,  9 Nov 2020 20:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 13E35C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 02/12] bus: mhi: core: Move to using high priority workqueue
Date:   Mon,  9 Nov 2020 12:47:21 -0800
Message-Id: <1604954851-23396-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
References: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI work is currently scheduled on the global/system workqueue and can
encounter delays on a stressed system. To avoid those unforeseen
delays which can hamper bootup or shutdown times, use a dedicated high
priority workqueue instead of the global/system workqueue.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 9 +++++++++
 drivers/bus/mhi/core/pm.c   | 2 +-
 include/linux/mhi.h         | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 8cefa35..877e40c 100644
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
index 3de7b16..805b6fa74 100644
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
index 52b3c60..1ed5f2a 100644
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
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

