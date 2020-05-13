Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D841D0637
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 07:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgEMFK1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 01:10:27 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:58677 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726092AbgEMFK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 01:10:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589346626; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Qw+4P/R9wWZW2AWyEuW8ad7PiceDW8cyznou4kkoxlU=; b=b+eIeVGPoSoIzIGvgyUfiFZ6VvbSZmhYeoeX+MS3QW0r6OT3xCy7G3xqssIWRAiFhdgnbDBN
 +LQ2jCDBfUBBRKMnleOpvFlNsZdHzImIRsW16XtFKAfFx9/+U6xbyF0ZYJK1b/fT0fj546RV
 hZHR/gOTCQ0gNU4MV9QH+OpX6Pg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebb8142.7f00682d9ea0-smtp-out-n02;
 Wed, 13 May 2020 05:10:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 28DA6C433CB; Wed, 13 May 2020 05:10:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from aneelaka-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: aneela)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DBBF8C433BA;
        Wed, 13 May 2020 05:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DBBF8C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
Subject: [PATCH V5 1/5] rpmsg: glink: Use complete_all for open states
Date:   Wed, 13 May 2020 10:40:02 +0530
Message-Id: <1589346606-15046-2-git-send-email-aneela@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589346606-15046-1-git-send-email-aneela@codeaurora.org>
References: <1589346606-15046-1-git-send-email-aneela@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

The open_req and open_ack completion variables are the state variables
to represet a remote channel as open. Use complete_all so there are no
races with waiters and using completion_done.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 1995f5b..604f11f 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -970,7 +970,7 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
 		return -EINVAL;
 	}
 
-	complete(&channel->open_ack);
+	complete_all(&channel->open_ack);
 
 	return 0;
 }
@@ -1413,7 +1413,7 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 	channel->rcid = ret;
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
 
-	complete(&channel->open_req);
+	complete_all(&channel->open_req);
 
 	if (create_device) {
 		rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
-- 
2.7.4
