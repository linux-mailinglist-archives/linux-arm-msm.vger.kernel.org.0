Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5578F1A2C72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 01:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgDHXhU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 19:37:20 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:36179 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726530AbgDHXhK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 19:37:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586389030; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bml65BiZKqC8La35iek9YW4e+KEfIXfCCZ0eFO8GDNY=; b=PPKY/79bG1mQWovnnsAYJxNXivUiP4TxF12lBAqcFbZz8FPeLzTvQ4EUaP/FNUuhcTSc00mL
 ziHdo9TpGESzV/9d4iniEQH29SgLJgnbYEeoXDfCWw2O4xaTDCcVqcPXj0r3FHNkxt7WZ1f7
 77/DetoHn269bNq7aNOvnq8UZJY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8e601d.7efdfe178b58-smtp-out-n03;
 Wed, 08 Apr 2020 23:37:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8CB20C433D2; Wed,  8 Apr 2020 23:37:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 64491C433BA;
        Wed,  8 Apr 2020 23:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 64491C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: [PATCH v2 1/6] remoteproc: sysmon: Add ability to send type of notification
Date:   Wed,  8 Apr 2020 16:36:38 -0700
Message-Id: <1586389003-26675-2-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current implementation of the sysmon driver does not support adding
notifications for other remoteproc events - prepare, start, unprepare.
Clients on the remoteproc side might be interested in knowing when a
remoteproc boots up. This change adds the ability to send the notification
type along with the name. For example, audio DSP is interested in knowing
when modem has crashed so that it can perform cleanup and wait for modem to
boot up before it starts processing data again.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_sysmon.c | 54 +++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index faf3822..1366050 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -46,6 +46,25 @@ struct qcom_sysmon {
 	struct sockaddr_qrtr ssctl;
 };
 
+enum {
+	SSCTL_SSR_EVENT_BEFORE_POWERUP,
+	SSCTL_SSR_EVENT_AFTER_POWERUP,
+	SSCTL_SSR_EVENT_BEFORE_SHUTDOWN,
+	SSCTL_SSR_EVENT_AFTER_SHUTDOWN,
+};
+
+static const char * const sysmon_state_string[] = {
+	[SSCTL_SSR_EVENT_BEFORE_POWERUP]	= "before_powerup",
+	[SSCTL_SSR_EVENT_AFTER_POWERUP]		= "after_powerup",
+	[SSCTL_SSR_EVENT_BEFORE_SHUTDOWN]	= "before_shutdown",
+	[SSCTL_SSR_EVENT_AFTER_SHUTDOWN]	= "after_shutdown",
+};
+
+struct sysmon_event {
+	const char *subsys_name;
+	u32 ssr_event;
+};
+
 static DEFINE_MUTEX(sysmon_lock);
 static LIST_HEAD(sysmon_list);
 
@@ -54,13 +73,15 @@ static LIST_HEAD(sysmon_list);
  * @sysmon:	sysmon context
  * @name:	other remote's name
  */
-static void sysmon_send_event(struct qcom_sysmon *sysmon, const char *name)
+static void sysmon_send_event(struct qcom_sysmon *sysmon,
+			      const struct sysmon_event *event)
 {
 	char req[50];
 	int len;
 	int ret;
 
-	len = snprintf(req, sizeof(req), "ssr:%s:before_shutdown", name);
+	len = snprintf(req, sizeof(req), "ssr:%s:%s", event->subsys_name,
+		       sysmon_state_string[event->ssr_event]);
 	if (len >= sizeof(req))
 		return;
 
@@ -149,13 +170,6 @@ static int sysmon_callback(struct rpmsg_device *rpdev, void *data, int count,
 #define SSCTL_SUBSYS_NAME_LENGTH	15
 
 enum {
-	SSCTL_SSR_EVENT_BEFORE_POWERUP,
-	SSCTL_SSR_EVENT_AFTER_POWERUP,
-	SSCTL_SSR_EVENT_BEFORE_SHUTDOWN,
-	SSCTL_SSR_EVENT_AFTER_SHUTDOWN,
-};
-
-enum {
 	SSCTL_SSR_EVENT_FORCED,
 	SSCTL_SSR_EVENT_GRACEFUL,
 };
@@ -331,7 +345,8 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
  * @sysmon:	sysmon context
  * @name:	other remote's name
  */
-static void ssctl_send_event(struct qcom_sysmon *sysmon, const char *name)
+static void ssctl_send_event(struct qcom_sysmon *sysmon,
+			     const struct sysmon_event *event)
 {
 	struct ssctl_subsys_event_resp resp;
 	struct ssctl_subsys_event_req req;
@@ -346,9 +361,9 @@ static void ssctl_send_event(struct qcom_sysmon *sysmon, const char *name)
 	}
 
 	memset(&req, 0, sizeof(req));
-	strlcpy(req.subsys_name, name, sizeof(req.subsys_name));
+	strlcpy(req.subsys_name, event->subsys_name, sizeof(req.subsys_name));
 	req.subsys_name_len = strlen(req.subsys_name);
-	req.event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN;
+	req.event = event->ssr_event;
 	req.evt_driven_valid = true;
 	req.evt_driven = SSCTL_SSR_EVENT_FORCED;
 
@@ -432,8 +447,12 @@ static int sysmon_start(struct rproc_subdev *subdev)
 static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon, subdev);
+	struct sysmon_event event = {
+		.subsys_name = sysmon->name,
+		.ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN
+	};
 
-	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)sysmon->name);
+	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
 
 	/* Don't request graceful shutdown if we've crashed */
 	if (crashed)
@@ -456,19 +475,20 @@ static int sysmon_notify(struct notifier_block *nb, unsigned long event,
 {
 	struct qcom_sysmon *sysmon = container_of(nb, struct qcom_sysmon, nb);
 	struct rproc *rproc = sysmon->rproc;
-	const char *ssr_name = data;
+	struct sysmon_event *sysmon_event = data;
 
 	/* Skip non-running rprocs and the originating instance */
-	if (rproc->state != RPROC_RUNNING || !strcmp(data, sysmon->name)) {
+	if (rproc->state != RPROC_RUNNING ||
+	    !strcmp(sysmon_event->subsys_name, sysmon->name)) {
 		dev_dbg(sysmon->dev, "not notifying %s\n", sysmon->name);
 		return NOTIFY_DONE;
 	}
 
 	/* Only SSCTL version 2 supports SSR events */
 	if (sysmon->ssctl_version == 2)
-		ssctl_send_event(sysmon, ssr_name);
+		ssctl_send_event(sysmon, sysmon_event);
 	else if (sysmon->ept)
-		sysmon_send_event(sysmon, ssr_name);
+		sysmon_send_event(sysmon, sysmon_event);
 
 	return NOTIFY_DONE;
 }
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
