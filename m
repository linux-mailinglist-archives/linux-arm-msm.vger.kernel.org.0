Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC7B25B18D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 18:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIBQY7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 12:24:59 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:43437 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728041AbgIBQYp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 12:24:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599063884; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=PWopmoPYmvBb6c4l4UvCri+PTIKOehyoMRDeBLGjvow=; b=iEtvp+CzYvQXjwQR9R8M6agGRZvqfD3N2uijM975HqhwNtt3vn9KM9HjoEKijkK8BhrZYKB3
 U9A2vo8X48C52Tc6i69KqieoQ1nbz7cNAd+83pPl+krIJQI7rHg9oxa0c0EeQXD+T575EeH7
 VKWs6bY6Vh0Jn0Ewm6+GTY9NVaU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f4fc74025e1ee7586f57302 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Sep 2020 16:24:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A4F05C43391; Wed,  2 Sep 2020 16:24:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ABF4DC433CA;
        Wed,  2 Sep 2020 16:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ABF4DC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        mathieu.poirier@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: [PATCH V7 3/4] rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
Date:   Wed,  2 Sep 2020 21:54:06 +0530
Message-Id: <1599063847-2347-4-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599063847-2347-1-git-send-email-deesin@codeaurora.org>
References: <1599063847-2347-1-git-send-email-deesin@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arun Kumar Neelakantam <aneela@codeaurora.org>

Add TICOMGET and TIOCMSET ioctl support for rpmsg char device nodes
to get/set the low level transport signals.

Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/rpmsg_char.c | 54 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 4bbbacd..43ceac0 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (c) 2018, The Linux Foundation.
  * Copyright (c) 2016, Linaro Ltd.
  * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
  * Copyright (c) 2012, PetaLogix
@@ -19,6 +20,7 @@
 #include <linux/rpmsg.h>
 #include <linux/skbuff.h>
 #include <linux/slab.h>
+#include <linux/termios.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/rpmsg.h>
 
@@ -269,15 +271,61 @@ static __poll_t rpmsg_eptdev_poll(struct file *filp, poll_table *wait)
 	return mask;
 }
 
+static int rpmsg_eptdev_tiocmset(struct file *fp, unsigned int cmd,
+				 int __user *arg)
+{
+	struct rpmsg_eptdev *eptdev = fp->private_data;
+	u32 set, clear, val;
+	int ret;
+
+	ret = get_user(val, arg);
+	if (ret)
+		return ret;
+	set = clear = 0;
+	switch (cmd) {
+	case TIOCMBIS:
+		set = val;
+		break;
+	case TIOCMBIC:
+		clear = val;
+		break;
+	case TIOCMSET:
+		set = val;
+		clear = ~val;
+		break;
+	}
+
+	set &= TIOCM_DTR | TIOCM_RTS | TIOCM_CD | TIOCM_RI;
+	clear &= TIOCM_DTR | TIOCM_RTS | TIOCM_CD | TIOCM_RI;
+
+	return rpmsg_set_signals(eptdev->ept, set, clear);
+}
+
 static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 			       unsigned long arg)
 {
 	struct rpmsg_eptdev *eptdev = fp->private_data;
+	int ret;
 
-	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
-		return -EINVAL;
+	switch (cmd) {
+	case TIOCMGET:
+		ret = rpmsg_get_signals(eptdev->ept);
+		if (ret >= 0)
+			ret = put_user(ret, (int __user *)arg);
+		break;
+	case TIOCMSET:
+	case TIOCMBIS:
+	case TIOCMBIC:
+		ret = rpmsg_eptdev_tiocmset(fp, cmd, (int __user *)arg);
+		break;
+	case RPMSG_DESTROY_EPT_IOCTL:
+		ret = rpmsg_eptdev_destroy(&eptdev->dev, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+	}
 
-	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
+	return ret;
 }
 
 static const struct file_operations rpmsg_eptdev_fops = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

