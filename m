Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F2D1A2C6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 01:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgDHXhQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 19:37:16 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:25190 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726584AbgDHXhN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 19:37:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586389033; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=PODbbgtVWuPslDvV4MMEBLr5qth9MTMMFxaZhWZlnyU=; b=u7YYT5YQ+DmRP6dRXXQkK+gwnIgFG1uD6uCZyMSFih16tpAyoUNCOtOXM9n5wEWh1BATqFxd
 7Mfr4eXCVqg6zeIj+EMYtSjT7slgYqBwnAguQ3bnA4+vSIUhjfIz3cSkTKNs1qjd4/zzQ1q0
 N+5l7PuMfka1hYEuYHaM5nhcKpc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8e601f.7f6ee5d03298-smtp-out-n02;
 Wed, 08 Apr 2020 23:37:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 73EF8C43636; Wed,  8 Apr 2020 23:37:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 59808C433F2;
        Wed,  8 Apr 2020 23:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 59808C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH v2 4/6] remoteproc: qcom: Add name field for every subdevice
Date:   Wed,  8 Apr 2020 16:36:41 -0700
Message-Id: <1586389003-26675-5-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rishabh Bhatnagar <rishabhb@codeaurora.org>

When a client driver wishes to utilize functionality from a particular
subdevice of a remoteproc, it cannot differentiate between the subdevices
that have been added. This patch allows the client driver to distinguish
between subdevices and thus utilize their functionality.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_common.c | 6 ++++++
 include/linux/remoteproc.h       | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 60650bc..1d2351b 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -56,6 +56,7 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
 		return;
 
 	glink->dev = dev;
+	glink->subdev.name = kstrdup("glink", GFP_KERNEL);
 	glink->subdev.start = glink_subdev_start;
 	glink->subdev.stop = glink_subdev_stop;
 
@@ -73,6 +74,7 @@ void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glin
 	if (!glink->node)
 		return;
 
+	kfree(glink->subdev.name);
 	rproc_remove_subdev(rproc, &glink->subdev);
 	of_node_put(glink->node);
 }
@@ -152,6 +154,7 @@ void qcom_add_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
 		return;
 
 	smd->dev = dev;
+	smd->subdev.name = kstrdup("smd", GFP_KERNEL);
 	smd->subdev.start = smd_subdev_start;
 	smd->subdev.stop = smd_subdev_stop;
 
@@ -169,6 +172,7 @@ void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
 	if (!smd->node)
 		return;
 
+	kfree(smd->subdev.name);
 	rproc_remove_subdev(rproc, &smd->subdev);
 	of_node_put(smd->node);
 }
@@ -220,6 +224,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
 			 const char *ssr_name)
 {
 	ssr->name = ssr_name;
+	ssr->subdev.name = kstrdup("ssr_notifs", GFP_KERNEL);
 	ssr->subdev.unprepare = ssr_notify_unprepare;
 
 	rproc_add_subdev(rproc, &ssr->subdev);
@@ -233,6 +238,7 @@ EXPORT_SYMBOL_GPL(qcom_add_ssr_subdev);
  */
 void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
 {
+	kfree(ssr->subdev.name);
 	rproc_remove_subdev(rproc, &ssr->subdev);
 }
 EXPORT_SYMBOL_GPL(qcom_remove_ssr_subdev);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index c5d36e6..687e1eb 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -523,6 +523,7 @@ struct rproc {
 /**
  * struct rproc_subdev - subdevice tied to a remoteproc
  * @node: list node related to the rproc subdevs list
+ * @name: name of the subdevice
  * @prepare: prepare function, called before the rproc is started
  * @start: start function, called after the rproc has been started
  * @stop: stop function, called before the rproc is stopped; the @crashed
@@ -531,6 +532,7 @@ struct rproc {
  */
 struct rproc_subdev {
 	struct list_head node;
+	char *name;
 
 	int (*prepare)(struct rproc_subdev *subdev);
 	int (*start)(struct rproc_subdev *subdev);
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
