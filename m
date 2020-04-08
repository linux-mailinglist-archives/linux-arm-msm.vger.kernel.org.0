Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBEC1A2C74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 01:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgDHXhY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 19:37:24 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:16989 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726627AbgDHXhJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 19:37:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586389029; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qptNmHUGIaiinw/HDGnYvf9ekz8pYIo5r0zLW+lMxJ4=; b=wG285wk4RaKXSsnbiCDOrkDpW6GeTFhpvQcNmgVuog+nMep0mrI+7fZwBUGeu04iycfLEydK
 2yRGwx9wtiLEQOVVg2TEwtefnIpcBPxrnUKOmM0csyEz1J9uEtpyRl+CVozRF3PXOryCYflF
 c6Nz6vsTtsDhurklnSZJKg5dyfA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8e6021.7fe55cf3cab0-smtp-out-n03;
 Wed, 08 Apr 2020 23:37:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 10978C433F2; Wed,  8 Apr 2020 23:37:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A48CEC44791;
        Wed,  8 Apr 2020 23:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A48CEC44791
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: [PATCH v2 6/6] remoteproc: qcom: Add notification types to SSR
Date:   Wed,  8 Apr 2020 16:36:43 -0700
Message-Id: <1586389003-26675-7-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SSR subdevice only adds callback for the unprepare event. Add callbacks
for unprepare, start and prepare events. The client driver for a particular
remoteproc might be interested in knowing the status of the remoteproc
while undergoing SSR, not just when the remoteproc has finished shutting
down.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_common.c | 39 +++++++++++++++++++++++++++++++++++----
 include/linux/remoteproc.h       | 15 +++++++++++++++
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 56b0c3e..06611f2 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -183,9 +183,9 @@ EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
  *
  * Returns pointer to srcu notifier head on success, ERR_PTR on failure.
  *
- * This registers the @notify function as handler for restart notifications. As
- * remote processors are stopped this function will be called, with the rproc
- * pointer passed as a parameter.
+ * This registers the @notify function as handler for powerup/shutdown
+ * notifications. This function will be invoked inside the callbacks registered
+ * for the ssr subdevice, with the rproc pointer passed as a parameter.
  */
 void *qcom_register_ssr_notifier(struct rproc *rproc, struct notifier_block *nb)
 {
@@ -227,11 +227,39 @@ int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
 
+static int ssr_notify_prepare(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
+
+	srcu_notifier_call_chain(ssr->rproc_notif_list,
+				 RPROC_BEFORE_POWERUP, (void *)ssr->name);
+	return 0;
+}
+
+static int ssr_notify_start(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
+
+	srcu_notifier_call_chain(ssr->rproc_notif_list,
+				 RPROC_AFTER_POWERUP, (void *)ssr->name);
+	return 0;
+}
+
+static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
+{
+	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
+
+	srcu_notifier_call_chain(ssr->rproc_notif_list,
+				 RPROC_BEFORE_SHUTDOWN, (void *)ssr->name);
+}
+
+
 static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
 
-	srcu_notifier_call_chain(ssr->rproc_notif_list, 0, (void *)ssr->name);
+	srcu_notifier_call_chain(ssr->rproc_notif_list,
+				 RPROC_AFTER_SHUTDOWN, (void *)ssr->name);
 }
 
 /**
@@ -248,6 +276,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
 {
 	ssr->name = ssr_name;
 	ssr->subdev.name = kstrdup("ssr_notifs", GFP_KERNEL);
+	ssr->subdev.prepare = ssr_notify_prepare;
+	ssr->subdev.start = ssr_notify_start;
+	ssr->subdev.stop = ssr_notify_stop;
 	ssr->subdev.unprepare = ssr_notify_unprepare;
 	ssr->rproc_notif_list = kzalloc(sizeof(struct srcu_notifier_head),
 								GFP_KERNEL);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 687e1eb..facadb07 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -452,6 +452,21 @@ struct rproc_dump_segment {
 };
 
 /**
+ * enum rproc_notif_type - Different stages of remoteproc notifications
+ * @RPROC_BEFORE_SHUTDOWN:	unprepare stage of  remoteproc
+ * @RPROC_AFTER_SHUTDOWN:	stop stage of  remoteproc
+ * @RPROC_BEFORE_POWERUP:	prepare stage of  remoteproc
+ * @RPROC_AFTER_POWERUP:	start stage of  remoteproc
+ */
+enum rproc_notif_type {
+	RPROC_BEFORE_SHUTDOWN,
+	RPROC_AFTER_SHUTDOWN,
+	RPROC_BEFORE_POWERUP,
+	RPROC_AFTER_POWERUP,
+	RPROC_MAX
+};
+
+/**
  * struct rproc - represents a physical remote processor device
  * @node: list node of this rproc object
  * @domain: iommu domain
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
