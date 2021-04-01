Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410573521C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 23:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233974AbhDAVmD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 17:42:03 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58880 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234211AbhDAVmC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 17:42:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617313322; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7u0OwwrXPKL1bucWQ9WibD5tcBQEFubjqnsp6gZDcGI=; b=ZbIT5p6mETwerwUCahDDDr2+KH+F+ATuWcHalt3d4UDveQBQr+BZSGtKa8QCGyTamiQpf6gK
 Leq5wVdyuJ9l3n3QuVtVeZKIn+JR1KKQsKc+XAPpLfgdmhjdnuMyBxKqQfBMlA6W8E+itYmy
 YiuoYS94VYHFFJNXh888bJ0PbNA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60663e29f34440a9d4e124d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Apr 2021 21:42:01
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CFCE4C433ED; Thu,  1 Apr 2021 21:42:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EA15C433CA;
        Thu,  1 Apr 2021 21:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EA15C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, loic.poulain@linaro.org,
        kvalo@codeaurora.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [RESEND PATCH] bus: mhi: core: Remove pre_init flag used for power purposes
Date:   Thu,  1 Apr 2021 14:41:49 -0700
Message-Id: <1617313309-24035-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some controllers can choose to skip preparation for power up.
In that case, device context is initialized based on the pre_init
flag not being set during mhi_prepare_for_power_up(). There is no
reason MHI host driver should maintain and provide controllers
with two separate paths for preparing MHI.

Going forward, all controllers will be required to call the
mhi_prepare_for_power_up() API followed by their choice of sync
or async power up. This allows MHI host driver to get rid of the
pre_init flag and sets up a common way for all controllers to use
MHI. This also helps controllers fail early on during preparation
phase in some failure cases.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
This patch was tested on arm64 architecture.

 drivers/bus/mhi/core/init.c |  3 ---
 drivers/bus/mhi/core/pm.c   | 20 --------------------
 include/linux/mhi.h         |  2 --
 3 files changed, 25 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index d1d9b0d..1f61352 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1080,8 +1080,6 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 			mhi_rddm_prepare(mhi_cntrl, mhi_cntrl->rddm_image);
 	}
 
-	mhi_cntrl->pre_init = true;
-
 	mutex_unlock(&mhi_cntrl->pm_mutex);
 
 	return 0;
@@ -1112,7 +1110,6 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
 	}
 
 	mhi_deinit_dev_ctxt(mhi_cntrl);
-	mhi_cntrl->pre_init = false;
 }
 EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
 
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index e4aff77..b23eec5 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1062,13 +1062,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	mutex_lock(&mhi_cntrl->pm_mutex);
 	mhi_cntrl->pm_state = MHI_PM_DISABLE;
 
-	if (!mhi_cntrl->pre_init) {
-		/* Setup device context */
-		ret = mhi_init_dev_ctxt(mhi_cntrl);
-		if (ret)
-			goto error_dev_ctxt;
-	}
-
 	ret = mhi_init_irq_setup(mhi_cntrl);
 	if (ret)
 		goto error_setup_irq;
@@ -1150,10 +1143,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	mhi_deinit_free_irq(mhi_cntrl);
 
 error_setup_irq:
-	if (!mhi_cntrl->pre_init)
-		mhi_deinit_dev_ctxt(mhi_cntrl);
-
-error_dev_ctxt:
 	mhi_cntrl->pm_state = MHI_PM_DISABLE;
 	mutex_unlock(&mhi_cntrl->pm_mutex);
 
@@ -1203,15 +1192,6 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
 	flush_work(&mhi_cntrl->st_worker);
 
 	free_irq(mhi_cntrl->irq[0], mhi_cntrl);
-
-	if (!mhi_cntrl->pre_init) {
-		/* Free all allocated resources */
-		if (mhi_cntrl->fbc_image) {
-			mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
-			mhi_cntrl->fbc_image = NULL;
-		}
-		mhi_deinit_dev_ctxt(mhi_cntrl);
-	}
 }
 EXPORT_SYMBOL_GPL(mhi_power_down);
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index b16afd3..c9b36a3 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -354,7 +354,6 @@ struct mhi_controller_config {
  * @index: Index of the MHI controller instance
  * @bounce_buf: Use of bounce buffer
  * @fbc_download: MHI host needs to do complete image transfer (optional)
- * @pre_init: MHI host needs to do pre-initialization before power up
  * @wake_set: Device wakeup set flag
  * @irq_flags: irq flags passed to request_irq (optional)
  *
@@ -447,7 +446,6 @@ struct mhi_controller {
 	int index;
 	bool bounce_buf;
 	bool fbc_download;
-	bool pre_init;
 	bool wake_set;
 	unsigned long irq_flags;
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

