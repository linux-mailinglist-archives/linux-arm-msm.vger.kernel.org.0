Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D171DAEFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 11:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgETJkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 05:40:20 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:59823 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726435AbgETJkT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 05:40:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589967618; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=fdobeCzI/CD22Nkbsx1/8R3yNurmmcLKoiifkI1dTwM=; b=uAgEPT/XQ5PMuE1VUDMJrtvBs81H/2v0igS2FeljBRYqsRaIwiQHj0hzWFvXtiTDgRjRWh4W
 rlgjgxSwfhaN+lrlpya0TlnNgJc4tKiDanNP1wy/ekkcGU+SL2LyYSw+kHNXGNQ5qCOGCvqi
 +bC4UBHOdUALxAzcsfe+VZyu34Q=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec4faf7.7f8ac7368148-smtp-out-n01;
 Wed, 20 May 2020 09:40:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A8073C433CA; Wed, 20 May 2020 09:40:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from aneelaka-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: aneela)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D43DC43387;
        Wed, 20 May 2020 09:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1D43DC43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
Subject: [PATCH V6 3/5] rpmsg: glink: Add support for rpmsg glink chrdev
Date:   Wed, 20 May 2020 15:09:37 +0530
Message-Id: <1589967579-15559-4-git-send-email-aneela@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589967579-15559-1-git-send-email-aneela@codeaurora.org>
References: <1589967579-15559-1-git-send-email-aneela@codeaurora.org>
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
 drivers/rpmsg/qcom_glink_native.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index ea2f33f..b85433c 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1574,6 +1574,40 @@ static void qcom_glink_cancel_rx_work(struct qcom_glink *glink)
 		kfree(dcmd);
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
@@ -1633,6 +1667,10 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
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
2.7.4
