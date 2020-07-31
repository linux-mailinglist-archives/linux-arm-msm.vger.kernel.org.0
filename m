Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2789234CC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 23:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbgGaVOc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 17:14:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26410 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728209AbgGaVOb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 17:14:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596230071; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=nh+RSm6RsPXE+qcY152AR0CU4QrxqI5oIYGuVIflNG4=; b=ci8kX4Fv+mB6DFV+/vtt0K2U2URHJxPry6asUGPTGZUMxD747ZZuxnTfWI0fipPS6vIg7EWw
 esHjfns9MO7/otKpGvSSVeFQ8FKh7K7UyHkFxOYTQH1nruDOF522wzwaXwvLNXQk6eaL9Cdb
 u+mL04zA4Whn2iLGK9o+yAmljjA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f2489b3f89b692ba28b0380 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 31 Jul 2020 21:14:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 78A7AC433B7; Fri, 31 Jul 2020 21:14:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6080EC433B1;
        Fri, 31 Jul 2020 21:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6080EC433B1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Subject: [PATCH 3/4] power: reset: Add support for reboot mode alternate properties
Date:   Fri, 31 Jul 2020 14:14:19 -0700
Message-Id: <1596230060-6065-4-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596230060-6065-1-git-send-email-eberman@codeaurora.org>
References: <1596230060-6065-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reboot mode driver does not currently support reboot commands with
spaces in them [1]. Add an optional new node "reboot-mode-names" and
"reboot-mode-magic" which add an array of strings and u32s, respectively
which would permit any string in this framework.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/power/reset/reboot-mode.c | 42 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index b4076b1..363734d 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -64,8 +64,9 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct mode_info *info;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
+	const char *mode_name;
 	size_t len = strlen(PREFIX);
-	int ret;
+	int ret, count, i;
 
 	INIT_LIST_HEAD(&reboot->head);
 
@@ -101,6 +102,45 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		list_add_tail(&info->list, &reboot->head);
 	}
 
+	count = of_property_count_u32_elems(np, "reboot-mode-magic");
+	for (i = 0; i < count; i++) {
+		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		if (!info) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		if (of_property_read_string_index(np, "reboot-mode-names", i,
+						  &mode_name)) {
+			dev_err(reboot->dev, "unable to read reboot-mode-names[%d]\n",
+				i);
+			ret = -EINVAL;
+			goto error;
+		}
+		info->mode = kstrdup_const(mode_name, GFP_KERNEL);
+		if (!info->mode) {
+			ret = -ENOMEM;
+			goto error;
+		} else if (info->mode[0] == '\0') {
+			dev_err(reboot->dev, "invalid reboot-mode-names[%d]: too short!\n",
+				i);
+			kfree_const(info->mode);
+			ret = -EINVAL;
+			goto error;
+		}
+
+		if (of_property_read_u32_index(np, "reboot-mode-magic", i,
+					       &info->magic)) {
+			dev_err(reboot->dev, "unable to read reboot-mode-magic[%d]\n",
+				i);
+			kfree_const(info->mode);
+			ret = -EINVAL;
+			goto error;
+		}
+
+		list_add_tail(&info->list, &reboot->head);
+	}
+
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

