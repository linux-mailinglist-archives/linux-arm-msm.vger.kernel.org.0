Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7E620796C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 18:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404878AbgFXQq0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 12:46:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17103 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404173AbgFXQq0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 12:46:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593017185; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=FQW6R/Y5yszDbWH3tFWr/9C27YRcinGb1+LS8Db7YDE=; b=SP64jr7U1Bb3pqqzlKjS+1ymH7G681CvpS+QYVL4ATvewRkTxKpdmwVQbe+YxK9/+dF6P+Uw
 KUi0h8XicfZ0Pf1B47LKsugh7hyqDxDbB+b9ZptNy97HIwodsNWajx54GTBr/wX6RmEwyhPl
 5AHoCVkF+ebwPeraBnGIqErTaKM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5ef38350567385e8e74b8103 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Jun 2020 16:46:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 67C9CC433C6; Wed, 24 Jun 2020 16:46:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2248AC433CB;
        Wed, 24 Jun 2020 16:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2248AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        mathieu.poirier@linaro.org
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR MESSAGING
        (RPMSG) SUBSYSTEM), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V7 1/4] rpmsg: glink: Use complete_all for open states
Date:   Wed, 24 Jun 2020 22:15:18 +0530
Message-Id: <1593017121-7953-2-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593017121-7953-1-git-send-email-deesin@codeaurora.org>
References: <1593017121-7953-1-git-send-email-deesin@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

The open_req and open_ack completion variables are the state variables
to represet a remote channel as open. Use complete_all so there are no
races with waiters and using completion_done.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 1995f5b..d5114ab 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -970,7 +970,7 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
 		return -EINVAL;
 	}
 
-	complete(&channel->open_ack);
+	complete_all(&channel->open_ack);
 
 	return 0;
 }
@@ -1178,7 +1178,7 @@ static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
 	__be32 *val = defaults;
 	int size;
 
-	if (glink->intentless)
+	if (glink->intentless || !completion_done(&channel->open_ack))
 		return 0;
 
 	prop = of_find_property(np, "qcom,intents", NULL);
@@ -1413,7 +1413,7 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 	channel->rcid = ret;
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
 
-	complete(&channel->open_req);
+	complete_all(&channel->open_req);
 
 	if (create_device) {
 		rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

