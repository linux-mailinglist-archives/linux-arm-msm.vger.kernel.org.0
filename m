Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB5CF2C5081
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 09:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388917AbgKZIbr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 03:31:47 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:29215 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727953AbgKZIbq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 03:31:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606379506; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=pCwSQlf0qnuyc2pBtanhq4bzyUOsyOocqXKJhXbLSM0=; b=f+qXs8SCvQLhPmm0uNYbBciYFVUfEDIaR9nxZYXZAYPYEzLDx5ThqMREWHuMAl+9psEOacRJ
 vRz6kRxW5YcOWiCMEf/74CFAnGFfEU+WhpBDjBCXnRFrUX7jTQtYAEA7eGJ/UuXIKxUluwMp
 0T7fae7/3J0k54WN8SAiPZrCGzw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fbf67f177b63cdb34eb9453 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Nov 2020 08:31:45
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9E1D2C433C6; Thu, 26 Nov 2020 08:31:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1CB9C433ED;
        Thu, 26 Nov 2020 08:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1CB9C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     andy.gross@linaro.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dianders@chromium.org, swboyd@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [RESEND] soc: qcom: rpmh: Use __fill_rpmh_msg API during rpmh_write()
Date:   Thu, 26 Nov 2020 14:01:30 +0530
Message-Id: <1606379490-4052-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use __fill_rpmh_msg API during rpmh_write(). This allows to
remove duplication of code in error checking, copying commands
and setting message state.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/rpmh.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index ad1f062..01765ee 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -181,8 +181,6 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 	struct cache_req *req;
 	int i;
 
-	rpm_msg->msg.state = state;
-
 	/* Cache the request in our store and link the payload */
 	for (i = 0; i < rpm_msg->msg.num_cmds; i++) {
 		req = cache_rpm_request(ctrlr, state, &rpm_msg->msg.cmds[i]);
@@ -190,8 +188,6 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 			return PTR_ERR(req);
 	}
 
-	rpm_msg->msg.state = state;
-
 	if (state == RPMH_ACTIVE_ONLY_STATE) {
 		WARN_ON(irqs_disabled());
 		ret = rpmh_rsc_send_data(ctrlr_to_drv(ctrlr), &rpm_msg->msg);
@@ -268,11 +264,9 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
 	int ret;
 
-	if (!cmd || !n || n > MAX_RPMH_PAYLOAD)
-		return -EINVAL;
-
-	memcpy(rpm_msg.cmd, cmd, n * sizeof(*cmd));
-	rpm_msg.msg.num_cmds = n;
+	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n);
+	if (ret)
+		return ret;
 
 	ret = __rpmh_write(dev, state, &rpm_msg);
 	if (ret)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

