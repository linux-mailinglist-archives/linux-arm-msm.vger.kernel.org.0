Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9845B165553
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 03:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgBTC6N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 21:58:13 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:49700 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727912AbgBTC6M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 21:58:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582167491; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=9u8BlgWrFHwG4Ht6CWfv3d3zqguh9fPrghJWyshx0+Y=; b=LUvSfLWMu7RgWgfWj07FlEt343ifKSz1Q4seRserUNdBdzP0LAOH7GetHLNmqen3+5S2CY6d
 CEglNy6WQ++x4SbShwKA+bIYT+NB6AOhiAalMkGC8+0fdXTQyCrQmFbGAzv2k6QfSTwqdWMQ
 LLGaGzw7dXrdsWLehXSzNDQ2cs8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4df5b4.7fcf295124c8-smtp-out-n02;
 Thu, 20 Feb 2020 02:57:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F279AC4479D; Thu, 20 Feb 2020 02:57:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E6962C43383;
        Thu, 20 Feb 2020 02:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E6962C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH 4/6] drivers: remoteproc: Add name field for every subdevice
Date:   Wed, 19 Feb 2020 18:57:43 -0800
Message-Id: <1582167465-2549-5-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
References: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
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
index 60650bc..5d59538 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -58,6 +58,7 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
 	glink->dev = dev;
 	glink->subdev.start = glink_subdev_start;
 	glink->subdev.stop = glink_subdev_stop;
+	glink->subdev.name = kstrdup("glink", GFP_KERNEL);
 
 	rproc_add_subdev(rproc, &glink->subdev);
 }
@@ -73,6 +74,7 @@ void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glin
 	if (!glink->node)
 		return;
 
+	kfree(glink->subdev.name);
 	rproc_remove_subdev(rproc, &glink->subdev);
 	of_node_put(glink->node);
 }
@@ -154,6 +156,7 @@ void qcom_add_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
 	smd->dev = dev;
 	smd->subdev.start = smd_subdev_start;
 	smd->subdev.stop = smd_subdev_stop;
+	smd->subdev.name = kstrdup("smd", GFP_KERNEL);
 
 	rproc_add_subdev(rproc, &smd->subdev);
 }
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
index e2eaba9..e2f60cc 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -519,6 +519,7 @@ struct rproc {
 /**
  * struct rproc_subdev - subdevice tied to a remoteproc
  * @node: list node related to the rproc subdevs list
+ * @name: name of the subdevice
  * @prepare: prepare function, called before the rproc is started
  * @start: start function, called after the rproc has been started
  * @stop: stop function, called before the rproc is stopped; the @crashed
@@ -527,6 +528,7 @@ struct rproc {
  */
 struct rproc_subdev {
 	struct list_head node;
+	char *name;
 
 	int (*prepare)(struct rproc_subdev *subdev);
 	int (*start)(struct rproc_subdev *subdev);
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
