Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7136B1A2C62
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 01:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgDHXhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 19:37:05 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:44145 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726523AbgDHXhF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 19:37:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586389025; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=sd4ovfJpZhdxAUPqCMdrQUjnd3KMRkpIg+xta7RYHBA=; b=Zncq4IMHIuX7Q0T5/UloV6xS/JaRunJX8Mogl+pehUZxyadNiP44zzLTifaUKgaHl7xGxGnw
 TeT8Ng8L2alWin7AlcAcxYJ4bgo4B2FVcFZOTznqnSX5wtUQe3kO+sHDtf6lgZaZNXO7oeux
 DaF0p+8mrOtntF+1HBHJN4aqCTo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8e601e.7f618e0b6ca8-smtp-out-n05;
 Wed, 08 Apr 2020 23:37:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B8A63C43636; Wed,  8 Apr 2020 23:37:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B99AC43637;
        Wed,  8 Apr 2020 23:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B99AC43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: [PATCH v2 2/6] remoteproc: sysmon: Add notifications for events
Date:   Wed,  8 Apr 2020 16:36:39 -0700
Message-Id: <1586389003-26675-3-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add notification for other stages of remoteproc boot and shutdown. This
includes adding callback functions for the prepare and unprepare events,
and fleshing out the callback function for start.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_sysmon.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 1366050..851664e 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -439,8 +439,31 @@ static const struct qmi_ops ssctl_ops = {
 	.del_server = ssctl_del_server,
 };
 
+static int sysmon_prepare(struct rproc_subdev *subdev)
+{
+	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
+						  subdev);
+	struct sysmon_event event = {
+		.subsys_name = sysmon->name,
+		.ssr_event = SSCTL_SSR_EVENT_BEFORE_POWERUP
+	};
+
+	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
+
+	return 0;
+}
+
 static int sysmon_start(struct rproc_subdev *subdev)
 {
+	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
+						  subdev);
+	struct sysmon_event event = {
+		.subsys_name = sysmon->name,
+		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
+	};
+
+	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
+
 	return 0;
 }
 
@@ -464,6 +487,18 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		sysmon_request_shutdown(sysmon);
 }
 
+static void sysmon_unprepare(struct rproc_subdev *subdev)
+{
+	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
+						  subdev);
+	struct sysmon_event event = {
+		.subsys_name = sysmon->name,
+		.ssr_event = SSCTL_SSR_EVENT_AFTER_SHUTDOWN
+	};
+
+	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
+}
+
 /**
  * sysmon_notify() - notify sysmon target of another's SSR
  * @nb:		notifier_block associated with sysmon instance
@@ -563,8 +598,10 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 
 	qmi_add_lookup(&sysmon->qmi, 43, 0, 0);
 
+	sysmon->subdev.prepare = sysmon_prepare;
 	sysmon->subdev.start = sysmon_start;
 	sysmon->subdev.stop = sysmon_stop;
+	sysmon->subdev.unprepare = sysmon_unprepare;
 
 	rproc_add_subdev(rproc, &sysmon->subdev);
 
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
