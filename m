Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37527232B40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 07:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbgG3FSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 01:18:51 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40258 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728529AbgG3FSv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 01:18:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596086330; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bmfApZyPxP9TmARvhrZuUv+d4h/8CzHTSJHmdz+vQaU=; b=SnhThTsis1/Z6KTXhkmftAMoSJuVZ+4sFIU7iKtT9Vt06vmELLRdg43lfbS8lb3yUGqhMtrP
 ZekTDbAVNcT41NfLFiaBvWDQfnx6A1xt23HnzUp23g0JYRBgbNc2Z8NmT+WwEgYwRFjjLebJ
 SKJcIoyhsLBae6H10nnVcK/Vcdc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5f22583a8db7256a9593367e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Jul 2020 05:18:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 64794C433C6; Thu, 30 Jul 2020 05:18:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1DE1EC433C6;
        Thu, 30 Jul 2020 05:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1DE1EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V1 3/6] rpmsg: glink: Add TX_DATA_CONT command while sending
Date:   Thu, 30 Jul 2020 10:48:13 +0530
Message-Id: <1596086296-28529-4-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596086296-28529-1-git-send-email-deesin@codeaurora.org>
References: <1596086296-28529-1-git-send-email-deesin@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arun Kumar Neelakantam <aneela@codeaurora.org>

With current design the transport can send packets of size upto
FIFO_SIZE which is 16k and return failure for all packets above 16k.

Add TX_DATA_CONT command to send packets greater than 16k by splitting
into 8K chunks.

Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index df3c608..ac179b1 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1289,6 +1289,8 @@ static int __qcom_glink_send(struct glink_channel *channel,
 	} __packed req;
 	int ret;
 	unsigned long flags;
+	int chunk_size = len;
+	int left_size = 0;
 
 	if (!glink->intentless) {
 		while (!intent) {
@@ -1322,18 +1324,46 @@ static int __qcom_glink_send(struct glink_channel *channel,
 		iid = intent->id;
 	}
 
+	if (wait && (chunk_size > SZ_8K)) {
+		chunk_size = SZ_8K;
+		left_size = len - chunk_size;
+	}
 	req.msg.cmd = cpu_to_le16(RPM_CMD_TX_DATA);
 	req.msg.param1 = cpu_to_le16(channel->lcid);
 	req.msg.param2 = cpu_to_le32(iid);
-	req.chunk_size = cpu_to_le32(len);
-	req.left_size = cpu_to_le32(0);
+	req.chunk_size = cpu_to_le32(chunk_size);
+	req.left_size = cpu_to_le32(left_size);
 
-	ret = qcom_glink_tx(glink, &req, sizeof(req), data, len, wait);
+	ret = qcom_glink_tx(glink, &req, sizeof(req), data, chunk_size, wait);
 
 	/* Mark intent available if we failed */
-	if (ret && intent)
+	if (ret && intent) {
 		intent->in_use = false;
+		return ret;
+	}
 
+	while (left_size > 0) {
+		data = (void *)((char *)data + chunk_size);
+		chunk_size = left_size;
+		if (chunk_size > SZ_8K)
+			chunk_size = SZ_8K;
+		left_size -= chunk_size;
+
+		req.msg.cmd = cpu_to_le16(RPM_CMD_TX_DATA_CONT);
+		req.msg.param1 = cpu_to_le16(channel->lcid);
+		req.msg.param2 = cpu_to_le32(iid);
+		req.chunk_size = cpu_to_le32(chunk_size);
+		req.left_size = cpu_to_le32(left_size);
+
+		ret = qcom_glink_tx(glink, &req, sizeof(req), data,
+				    chunk_size, wait);
+
+		/* Mark intent available if we failed */
+		if (ret && intent) {
+			intent->in_use = false;
+			break;
+		}
+	}
 	return ret;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

