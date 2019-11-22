Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D61910698D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 11:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfKVKFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 05:05:21 -0500
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:59840
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726962AbfKVKFU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 05:05:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574417119;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=1Kt+Xv8ET8+a4J4BrxOck/hJNtL4dX6RiaqgbkB0ekg=;
        b=Q0cn3i6X9o385NNyG2G71VKNGavw3C8Io3PpXtxapcksJkQPOs7LqpgpbFFi5yrE
        +QxE7t4Ab6tWPZMbaU4fGvyWCsZW9QQ1zCFapSAQRJtUbmgIbQEBw7rK/zO/7nhgOAT
        6D3KDq52D9Bv2B4XWg6DKg5IZX2dAJKCIsdHYiw4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574417119;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=1Kt+Xv8ET8+a4J4BrxOck/hJNtL4dX6RiaqgbkB0ekg=;
        b=QcN65piOAEfZy+qmCGshkFgFaqTy26EQb3qOBTZZ9OCORJLDRI3tTO1G8WhWB+Nd
        JRTw9S0zqE9TfTPznWG6FqBLZki52kXhBWHGF+CSWvVMVlfcF22Ic4/dR2ra0uoOJ8P
        ANSA8qYG+c3t6eMR5U+p+CDgUYI5bXqfT1MtHWAY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 03E3FC48B2F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
Subject: [PATCH V5 3/5] rpmsg: glink: Add support for rpmsg glink chrdev
Date:   Fri, 22 Nov 2019 10:05:19 +0000
Message-ID: <0101016e9292b923-a011a502-1986-4cc7-8b3f-05119cd27c90-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574417087-27594-1-git-send-email-aneela@codeaurora.org>
References: <1574417087-27594-1-git-send-email-aneela@codeaurora.org>
X-SES-Outgoing: 2019.11.22-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

RPMSG provides a char device interface to userspace. Probe the rpmsg
chrdev channel to enable the rpmsg_ctrl device creation on glink
transports.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 40 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 609a150f..c838c19 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1158,7 +1158,7 @@ static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
 	__be32 *val = defaults;
 	int size;
 
-	if (glink->intentless)
+	if (glink->intentless || !completion_done(&channel->open_ack))
 		return 0;
 
 	prop = of_find_property(np, "qcom,intents", NULL);
@@ -1544,6 +1544,40 @@ static void qcom_glink_work(struct work_struct *work)
 	}
 }
 
+static void qcom_glink_device_release(struct device *dev)
+{
+	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
+	struct glink_channel *channel = to_glink_channel(rpdev->ept);
+
+	/* Release qcom_glink_alloc_channel() reference */
+	kref_put(&channel->refcount, qcom_glink_channel_release);
+	kfree(rpdev);
+}
+
+static int qcom_glink_create_chrdev(struct qcom_glink *glink)
+{
+	struct rpmsg_device *rpdev;
+	struct glink_channel *channel;
+
+	rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
+	if (!rpdev)
+		return -ENOMEM;
+
+	channel = qcom_glink_alloc_channel(glink, "rpmsg_chrdev");
+	if (IS_ERR(channel)) {
+		kfree(rpdev);
+		return PTR_ERR(channel);
+	}
+	channel->rpdev = rpdev;
+
+	rpdev->ept = &channel->ept;
+	rpdev->ops = &glink_device_ops;
+	rpdev->dev.parent = glink->dev;
+	rpdev->dev.release = qcom_glink_device_release;
+
+	return rpmsg_chrdev_register_device(rpdev);
+}
+
 struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 					   unsigned long features,
 					   struct qcom_glink_pipe *rx,
@@ -1603,6 +1637,10 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = qcom_glink_create_chrdev(glink);
+	if (ret)
+		dev_err(glink->dev, "failed to register chrdev\n");
+
 	return glink;
 }
 EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
-- 
1.9.1

