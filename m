Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6281B106992
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 11:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfKVKF3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 05:05:29 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:48558
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727123AbfKVKFZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 05:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574417124;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=UcJ4g0DZFioVFDbOkKTR0vmHpihCH6Qln9IMg8wzbyg=;
        b=dXSO1L/N6LFfADYyKCr3MRRMcanIS/vuO6MW7/0tKIS2G6QGyc+sMfUmy3juFuwl
        UcWNzKILDHIl2Aps8x+ecBmQi77iaeWHsiqJFLzHXz0LZibwlHgymyjgUdmo971GYda
        beESkcFMSOZgKUpUfLty9rn6yVz4YgazGjDYA4cs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574417124;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=UcJ4g0DZFioVFDbOkKTR0vmHpihCH6Qln9IMg8wzbyg=;
        b=B4yDg4ck1mwJLcL+v1i9F8XQE3HZYrGwOCCwnifsdrtPudReMi6tEcJp87ZyrX9C
        Fdt2VConzWULVzwyTr0x0y/vBVWbCgz0rHl/Wax/FAJ7BOpL/TPnSrM7Sg8uBEu0BSb
        be3AOwVE8OM+iYuhc+MH4fdfsJJJq+wIhK0uyF6Y=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B41E2C348AB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
Subject: [PATCH V5 5/5] rpmsg: glink: unregister rpmsg device during endpoint destroy
Date:   Fri, 22 Nov 2019 10:05:24 +0000
Message-ID: <0101016e9292cd9d-ebab0468-29d4-4c8f-b2f8-58f2a4a5e65e-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574417087-27594-1-git-send-email-aneela@codeaurora.org>
References: <1574417087-27594-1-git-send-email-aneela@codeaurora.org>
X-SES-Outgoing: 2019.11.22-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rpmsg device unregister is not happening if channel close is triggered
from local side and causing re-registration of device failures.

Unregister rpmsg device for local close in endpoint destroy path.

Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 3732fc6..0ff4cbe 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1187,6 +1187,7 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 	struct qcom_glink *glink = channel->glink;
+	struct rpmsg_channel_info chinfo;
 	unsigned long flags;
 
 	spin_lock_irqsave(&channel->recv_lock, flags);
@@ -1194,6 +1195,13 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 	spin_unlock_irqrestore(&channel->recv_lock, flags);
 
 	/* Decouple the potential rpdev from the channel */
+	if (channel->rpdev) {
+		strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
+		chinfo.src = RPMSG_ADDR_ANY;
+		chinfo.dst = RPMSG_ADDR_ANY;
+
+		rpmsg_unregister_device(glink->dev, &chinfo);
+	}
 	channel->rpdev = NULL;
 
 	qcom_glink_send_close_req(glink, channel);
@@ -1459,6 +1467,7 @@ static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
 
 		rpmsg_unregister_device(glink->dev, &chinfo);
 	}
+	channel->rpdev = NULL;
 
 	qcom_glink_send_close_ack(glink, channel->rcid);
 
-- 
1.9.1

