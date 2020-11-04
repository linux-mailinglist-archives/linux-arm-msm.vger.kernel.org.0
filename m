Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D222E2A6939
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Nov 2020 17:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730456AbgKDQQF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 11:16:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730415AbgKDQQF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 11:16:05 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC88BC061A4A
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2020 08:16:04 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id c21so7704987oic.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 08:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vm2j+unua9jSWcYY0s5yNfN1HsGYkAhPRJxO+bukzZY=;
        b=uMO+82cqhLHaEZwDXvt5x1TzD1NweYoMzb2LGHJwLw31P5LfsxNbSjRYNC8YkWAWc0
         wqutSR1tLF55njbugfpXXxPAnZ8MIxIMlNSKKMAbY0F9uR3z29yNnqjy938w8gLWeu9o
         wUHtqvmkVVhxQ/cNqLCDYtP7PQHNrlZp+jM8k94u280hVblvlcvNeKK6hHr4N/8aeElh
         PqrcgA2doKiqiRSwvxyoQ/zbL2+w//FaDWYqSL1K+Pm8RYtubV0GS4tK+UWPHeWowpxg
         B/J4+ar4+/MnQGAY6stAOlnYueMMA/xHrJOblnGR4U8skXI6me60OMSSgA0usOlkT9/i
         HD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vm2j+unua9jSWcYY0s5yNfN1HsGYkAhPRJxO+bukzZY=;
        b=KM3BNhTBsr5lkDCBgBlvGDD14t29THhC/Ziw8gMFXtc5EtYTZTNbVzAvcwLf6yZ7ck
         MnFOmKvrDk5fFZzIukAuwkWtuXt5Xx2WOfdT4AuylU0CMjGj7lhEwgqa1lfN8ORCIpyC
         5G7luzo7be/xu4t2nsduq5zFsNHoF1yKItpkLP43v069ZjfLANXaFezxvVDFk/Cc64z/
         R+MQkySAC+kecCkbUovczebJWbWBrN8JclKqSHFAoNgIqEi0ooX7tTEueL+JPbtTb4pb
         qm7QApkSKHcDsrVsPqe7P2kfNTftHgefR8dBZ/e/d/FlxuYMHRlgc6llTDH91+eo/ph6
         3EHQ==
X-Gm-Message-State: AOAM532eQlq92xhlXQEJiK7u50w12BCDVb2fdRBojW1pZliVamRJmbj/
        +losRwO2HmHJDWF9QUWzAfkFjA==
X-Google-Smtp-Source: ABdhPJzLBsgz6GvVtHYFKPCzrAidieJH68623rW6bm6uqqwdU+ctjSXbvo+MrfHkHDLUKL5JA03cNg==
X-Received: by 2002:aca:d6d3:: with SMTP id n202mr2897215oig.74.1604506564180;
        Wed, 04 Nov 2020 08:16:04 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w79sm544253oia.28.2020.11.04.08.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:16:03 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] remoteproc: sysmon: Ensure remote notification ordering
Date:   Wed,  4 Nov 2020 08:16:25 -0800
Message-Id: <20201104161625.1085981-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The reliance on the remoteproc's state for determining when to send
sysmon notifications to a remote processor is racy with regard to
concurrent remoteproc operations.

Further more the advertisement of the state of other remote processor to
a newly started remote processor might not only send the wrong state,
but might result in a stream of state changes that are out of order.

Address this by introducing state tracking within the sysmon instances
themselves and extend the locking to ensure that the notifications are
consistent with this state.

The use of a big lock for all instances will cause contention for
concurrent remote processor state transitions, but the correctness of
the remote processors' view of their peers is more important.

Fixes: 1f36ab3f6e3b ("remoteproc: sysmon: Inform current rproc about all active rprocs")
Fixes: 1877f54f75ad ("remoteproc: sysmon: Add notifications for events")
Fixes: 1fb82ee806d1 ("remoteproc: qcom: Introduce sysmon")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_sysmon.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 9eb2f6bccea6..1e507b66354a 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -22,6 +22,8 @@ struct qcom_sysmon {
 	struct rproc_subdev subdev;
 	struct rproc *rproc;
 
+	int state;
+
 	struct list_head node;
 
 	const char *name;
@@ -448,7 +450,10 @@ static int sysmon_prepare(struct rproc_subdev *subdev)
 		.ssr_event = SSCTL_SSR_EVENT_BEFORE_POWERUP
 	};
 
+	mutex_lock(&sysmon_lock);
+	sysmon->state = SSCTL_SSR_EVENT_BEFORE_POWERUP;
 	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
+	mutex_unlock(&sysmon_lock);
 
 	return 0;
 }
@@ -472,15 +477,16 @@ static int sysmon_start(struct rproc_subdev *subdev)
 		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
 	};
 
+	mutex_lock(&sysmon_lock);
+	sysmon->state = SSCTL_SSR_EVENT_AFTER_POWERUP;
 	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
 
-	mutex_lock(&sysmon_lock);
 	list_for_each_entry(target, &sysmon_list, node) {
-		if (target == sysmon ||
-		    target->rproc->state != RPROC_RUNNING)
+		if (target == sysmon)
 			continue;
 
 		event.subsys_name = target->name;
+		event.ssr_event = target->state;
 
 		if (sysmon->ssctl_version == 2)
 			ssctl_send_event(sysmon, &event);
@@ -500,7 +506,10 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		.ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN
 	};
 
+	mutex_lock(&sysmon_lock);
+	sysmon->state = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN;
 	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
+	mutex_unlock(&sysmon_lock);
 
 	/* Don't request graceful shutdown if we've crashed */
 	if (crashed)
@@ -521,7 +530,10 @@ static void sysmon_unprepare(struct rproc_subdev *subdev)
 		.ssr_event = SSCTL_SSR_EVENT_AFTER_SHUTDOWN
 	};
 
+	mutex_lock(&sysmon_lock);
+	sysmon->state = SSCTL_SSR_EVENT_AFTER_SHUTDOWN;
 	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
+	mutex_unlock(&sysmon_lock);
 }
 
 /**
@@ -538,7 +550,7 @@ static int sysmon_notify(struct notifier_block *nb, unsigned long event,
 	struct sysmon_event *sysmon_event = data;
 
 	/* Skip non-running rprocs and the originating instance */
-	if (rproc->state != RPROC_RUNNING ||
+	if (sysmon->state != SSCTL_SSR_EVENT_AFTER_POWERUP ||
 	    !strcmp(sysmon_event->subsys_name, sysmon->name)) {
 		dev_dbg(sysmon->dev, "not notifying %s\n", sysmon->name);
 		return NOTIFY_DONE;
-- 
2.28.0

