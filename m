Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C541D063F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 07:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgEMFKm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 01:10:42 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:37603 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728891AbgEMFKm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 01:10:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589346641; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=gOLhQscu2oEzn2VaWraaqHZ/5GFOyVJgmsmkxDlohJA=; b=C7SzpkdUku7enozZf9+6aeWCkAOemaRG1I72zkuB+uYY4PxyI1vMb6+2/bqgl+bw1iuMaFGw
 Slend4cHwCZ/PZa8p7SDp8o68edSj1MQ2KffAJf2uepX8+4dEnHbakHPlmgGd/yJ5fJlK3bX
 Rvakj0vjg+qOvGl+4DVLRcAWAuI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebb8151.7fdc6137f110-smtp-out-n05;
 Wed, 13 May 2020 05:10:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 105DBC4478F; Wed, 13 May 2020 05:10:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from aneelaka-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: aneela)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3AA5DC44792;
        Wed, 13 May 2020 05:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3AA5DC44792
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
Date:   Wed, 13 May 2020 10:40:06 +0530
Message-Id: <1589346606-15046-6-git-send-email-aneela@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589346606-15046-1-git-send-email-aneela@codeaurora.org>
References: <1589346606-15046-1-git-send-email-aneela@codeaurora.org>
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
index 0e8a28c0..fc8ef66 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1207,6 +1207,7 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 	struct qcom_glink *glink = channel->glink;
+	struct rpmsg_channel_info chinfo;
 	unsigned long flags;
 
 	spin_lock_irqsave(&channel->recv_lock, flags);
@@ -1214,6 +1215,13 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
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
@@ -1477,6 +1485,7 @@ static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
 
 		rpmsg_unregister_device(glink->dev, &chinfo);
 	}
+	channel->rpdev = NULL;
 
 	qcom_glink_send_close_ack(glink, channel->rcid);
 
-- 
2.7.4
