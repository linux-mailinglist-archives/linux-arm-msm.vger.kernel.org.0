Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F13B165550
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 03:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgBTC6H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 21:58:07 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:11173 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727912AbgBTC6H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 21:58:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582167486; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=iuWKVPRXslKzC7/ZGLleZutVx9tH9oVwDuvKGKDkAFg=; b=gUH6MuSZb7NcG0IQ9nqtMPul/VNMTDHZbLFVWgIHPCRoFX2cEzkNxllCOvUODlR84A3OeTJr
 h9rABGz0Xg1eRsZYKfpmBn7iPQ/UvxEGWNlA8ajmJ+oUTCay6Iiyfm9pLfiO8IhtTfArIXis
 e7+t+XNyBR32a84CCsywB4jworg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4df5b4.7f24babe5378-smtp-out-n02;
 Thu, 20 Feb 2020 02:57:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 94F6EC433A2; Thu, 20 Feb 2020 02:57:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8ECE4C4479C;
        Thu, 20 Feb 2020 02:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8ECE4C4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: [PATCH 5/6] remoteproc: qcom: Add per subsystem SSR notification
Date:   Wed, 19 Feb 2020 18:57:44 -0800
Message-Id: <1582167465-2549-6-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
References: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently there is a global notification chain which is called whenever any
remoteproc shuts down. This leads to all the listeners being notified, and
is not an optimal design as kernel drivers might only be interested in
listening to notifications from a particular remoteproc. Create an
individual notifier chain for every SSR subdevice, and modify the
notification registration API to include the remoteproc struct as an
argument. Update the existing user of the registration API to get the
phandle of the remoteproc dt node to register for SSR notifications.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_common.c      | 49 +++++++++++++++++++++++++++--------
 drivers/remoteproc/qcom_common.h      |  1 +
 drivers/soc/qcom/glink_ssr.c          | 20 ++++++++++++--
 include/linux/remoteproc/qcom_rproc.h | 17 ++++++++----
 4 files changed, 69 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 5d59538..6714f27 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -23,8 +23,6 @@
 #define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
 
-static BLOCKING_NOTIFIER_HEAD(ssr_notifiers);
-
 static int glink_subdev_start(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
@@ -180,27 +178,52 @@ EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
 
 /**
  * qcom_register_ssr_notifier() - register SSR notification handler
+ * @rproc:	pointer to the remoteproc structure
  * @nb:		notifier_block to notify for restart notifications
  *
- * Returns 0 on success, negative errno on failure.
+ * Returns pointer to srcu notifier head on success, ERR_PTR on failure.
  *
- * This register the @notify function as handler for restart notifications. As
- * remote processors are stopped this function will be called, with the SSR
- * name passed as a parameter.
+ * This registers the @notify function as handler for restart notifications. As
+ * remote processors are stopped this function will be called, with the rproc
+ * pointer passed as a parameter.
  */
-int qcom_register_ssr_notifier(struct notifier_block *nb)
+void *qcom_register_ssr_notifier(struct rproc *rproc, struct notifier_block *nb)
 {
-	return blocking_notifier_chain_register(&ssr_notifiers, nb);
+	struct rproc_subdev *subdev;
+	struct qcom_rproc_ssr *ssr;
+	int ret;
+
+	if (!rproc)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&rproc->lock);
+	list_for_each_entry(subdev, &rproc->subdevs, node) {
+		ret = strcmp(subdev->name, "ssr_notifs");
+		if (!ret)
+			break;
+	}
+	mutex_unlock(&rproc->lock);
+	if (ret)
+		return ERR_PTR(-ENOENT);
+
+	ssr = to_ssr_subdev(subdev);
+	srcu_notifier_chain_register(ssr->rproc_notif_list, nb);
+
+	return ssr->rproc_notif_list;
 }
 EXPORT_SYMBOL_GPL(qcom_register_ssr_notifier);
 
 /**
  * qcom_unregister_ssr_notifier() - unregister SSR notification handler
+ * @notify:	pointer to srcu notifier head
  * @nb:		notifier_block to unregister
  */
-void qcom_unregister_ssr_notifier(struct notifier_block *nb)
+int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
 {
-	blocking_notifier_chain_unregister(&ssr_notifiers, nb);
+	if (!notify)
+		return -EINVAL;
+
+	return srcu_notifier_chain_unregister(notify, nb);
 }
 EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
 
@@ -208,7 +231,7 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
 
-	blocking_notifier_call_chain(&ssr_notifiers, 0, (void *)ssr->name);
+	srcu_notifier_call_chain(ssr->rproc_notif_list, 0, (void *)ssr->name);
 }
 
 /**
@@ -226,6 +249,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
 	ssr->name = ssr_name;
 	ssr->subdev.name = kstrdup("ssr_notifs", GFP_KERNEL);
 	ssr->subdev.unprepare = ssr_notify_unprepare;
+	ssr->rproc_notif_list = kzalloc(sizeof(struct srcu_notifier_head),
+								GFP_KERNEL);
+	srcu_init_notifier_head(ssr->rproc_notif_list);
 
 	rproc_add_subdev(rproc, &ssr->subdev);
 }
@@ -239,6 +265,7 @@ EXPORT_SYMBOL_GPL(qcom_add_ssr_subdev);
 void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
 {
 	kfree(ssr->subdev.name);
+	kfree(ssr->rproc_notif_list);
 	rproc_remove_subdev(rproc, &ssr->subdev);
 }
 EXPORT_SYMBOL_GPL(qcom_remove_ssr_subdev);
diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index 58de71e..7792691 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -27,6 +27,7 @@ struct qcom_rproc_subdev {
 struct qcom_rproc_ssr {
 	struct rproc_subdev subdev;
 
+	struct srcu_notifier_head *rproc_notif_list;
 	const char *name;
 };
 
diff --git a/drivers/soc/qcom/glink_ssr.c b/drivers/soc/qcom/glink_ssr.c
index d7babe3..2b39683 100644
--- a/drivers/soc/qcom/glink_ssr.c
+++ b/drivers/soc/qcom/glink_ssr.c
@@ -7,6 +7,7 @@
 #include <linux/completion.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
+#include <linux/remoteproc.h>
 #include <linux/rpmsg.h>
 #include <linux/remoteproc/qcom_rproc.h>
 
@@ -49,6 +50,7 @@ struct glink_ssr {
 	struct rpmsg_endpoint *ept;
 
 	struct notifier_block nb;
+	void *notifier_head;
 
 	u32 seq_num;
 	struct completion completion;
@@ -112,6 +114,7 @@ static int qcom_glink_ssr_notify(struct notifier_block *nb, unsigned long event,
 static int qcom_glink_ssr_probe(struct rpmsg_device *rpdev)
 {
 	struct glink_ssr *ssr;
+	struct rproc *rproc;
 
 	ssr = devm_kzalloc(&rpdev->dev, sizeof(*ssr), GFP_KERNEL);
 	if (!ssr)
@@ -125,14 +128,27 @@ static int qcom_glink_ssr_probe(struct rpmsg_device *rpdev)
 
 	dev_set_drvdata(&rpdev->dev, ssr);
 
-	return qcom_register_ssr_notifier(&ssr->nb);
+	rproc = rproc_get_by_child(&rpdev->dev);
+	if (!rproc) {
+		dev_err(&rpdev->dev, "glink device not child of rproc\n");
+		return -EINVAL;
+	}
+
+	ssr->notifier_head = qcom_register_ssr_notifier(rproc, &ssr->nb);
+	if (IS_ERR(ssr->notifier_head)) {
+		dev_err(&rpdev->dev,
+			"failed to register for ssr notifications\n");
+		return PTR_ERR(ssr->notifier_head);
+	}
+
+	return 0;
 }
 
 static void qcom_glink_ssr_remove(struct rpmsg_device *rpdev)
 {
 	struct glink_ssr *ssr = dev_get_drvdata(&rpdev->dev);
 
-	qcom_unregister_ssr_notifier(&ssr->nb);
+	qcom_unregister_ssr_notifier(ssr->notifier_head, &ssr->nb);
 }
 
 static const struct rpmsg_device_id qcom_glink_ssr_match[] = {
diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
index fa8e386..89e830a 100644
--- a/include/linux/remoteproc/qcom_rproc.h
+++ b/include/linux/remoteproc/qcom_rproc.h
@@ -2,20 +2,27 @@
 #define __QCOM_RPROC_H__
 
 struct notifier_block;
+struct rproc;
 
 #if IS_ENABLED(CONFIG_QCOM_RPROC_COMMON)
 
-int qcom_register_ssr_notifier(struct notifier_block *nb);
-void qcom_unregister_ssr_notifier(struct notifier_block *nb);
+void *qcom_register_ssr_notifier(struct rproc *rproc,
+				 struct notifier_block *nb);
+int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb);
 
 #else
 
-static inline int qcom_register_ssr_notifier(struct notifier_block *nb)
+static inline void *qcom_register_ssr_notifier(struct rproc *rproc,
+					       struct notifier_block *nb)
 {
-	return 0;
+	return NULL;
 }
 
-static inline void qcom_unregister_ssr_notifier(struct notifier_block *nb) {}
+static inline int qcom_unregister_ssr_notifier(void *notify,
+					       struct notifier_block *nb)
+{
+	return 0;
+}
 
 #endif
 
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
