Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 811CACB283
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 01:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730746AbfJCXwA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 19:52:00 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47762 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729621AbfJCXwA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 19:52:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A755461A10; Thu,  3 Oct 2019 23:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570146719;
        bh=cl9xkH0w0FKN0pmP7VZ3Xg2ZjgZ9N+oQO1yY5EuTDzo=;
        h=From:To:Cc:Subject:Date:From;
        b=msWdkhI/jetL7+Kj8XYJ+0maP3hhNUc4AszUpcFr25s/ZTIIrUpWDRsggUS5VYggM
         5cByx2LIHfJRD75knkUpTI2Iz8SpU/KbLmH8iS+TWViz8qBuUgNk1C5nrYl4VcSVe4
         Lhs7AKD7DdkhZP8jVXIh8bk901xrjKmlTfz8iiaQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mnalajal@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68D2260ADE;
        Thu,  3 Oct 2019 23:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570146718;
        bh=cl9xkH0w0FKN0pmP7VZ3Xg2ZjgZ9N+oQO1yY5EuTDzo=;
        h=From:To:Cc:Subject:Date:From;
        b=naeK+hERzuGyFFxxQsyXTsDbhNKcUFW94mZPxiIHZQBuZVd52bZ5/HQ/RMAZsH7OD
         LlIQQJ6B5nNX9j7FGA1r03aXOqzxPT6C/+L4bJQg5nUQ1edlEbwGuz/HnFtUSvzECo
         BasLfXqVappHfAZiTA6icSIhZjOKwq7bcXGg7OuA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68D2260ADE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mnalajal@codeaurora.org
From:   Murali Nalajala <mnalajal@codeaurora.org>
To:     gregkh@linuxfoundation.org, rafael@kernel.org, swboyd@chromium.org
Cc:     mnalajal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v1] base: soc: Handle custom soc information sysfs entries
Date:   Thu,  3 Oct 2019 16:51:50 -0700
Message-Id: <1570146710-13503-1-git-send-email-mnalajal@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Soc framework exposed sysfs entries are not sufficient for some
of the h/w platforms. Currently there is no interface where soc
drivers can expose further information about their SoCs via soc
framework. This change address this limitation where clients can
pass their custom entries as attribute group and soc framework
would expose them as sysfs properties.

Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
---
Changes in v1:
- Remove NULL initialization of "soc_attr_groups"
- Taken care of freeing "soc_attr_groups" in soc_release()
- Addressed Stephen Boyd comments on usage of "kalloc"

 drivers/base/soc.c      | 23 +++++++++++++++--------
 include/linux/sys_soc.h |  1 +
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 7c0c5ca..ad30d58 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -104,15 +104,11 @@ static ssize_t soc_info_get(struct device *dev,
 	.is_visible = soc_attribute_mode,
 };
 
-static const struct attribute_group *soc_attr_groups[] = {
-	&soc_attr_group,
-	NULL,
-};
-
 static void soc_release(struct device *dev)
 {
 	struct soc_device *soc_dev = container_of(dev, struct soc_device, dev);
 
+	kfree(soc_dev->dev.groups);
 	kfree(soc_dev);
 }
 
@@ -121,6 +117,7 @@ static void soc_release(struct device *dev)
 struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr)
 {
 	struct soc_device *soc_dev;
+	const struct attribute_group **soc_attr_groups;
 	int ret;
 
 	if (!soc_bus_type.p) {
@@ -136,10 +133,18 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 		goto out1;
 	}
 
+	soc_attr_groups = kcalloc(3, sizeof(*soc_attr_groups), GFP_KERNEL);
+	if (!soc_attr_groups) {
+		ret = -ENOMEM;
+		goto out2;
+	}
+	soc_attr_groups[0] = &soc_attr_group;
+	soc_attr_groups[1] = soc_dev_attr->custom_attr_group;
+
 	/* Fetch a unique (reclaimable) SOC ID. */
 	ret = ida_simple_get(&soc_ida, 0, 0, GFP_KERNEL);
 	if (ret < 0)
-		goto out2;
+		goto out3;
 	soc_dev->soc_dev_num = ret;
 
 	soc_dev->attr = soc_dev_attr;
@@ -151,14 +156,16 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 
 	ret = device_register(&soc_dev->dev);
 	if (ret)
-		goto out3;
+		goto out4;
 
 	return soc_dev;
 
-out3:
+out4:
 	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
 	put_device(&soc_dev->dev);
 	soc_dev = NULL;
+out3:
+	kfree(soc_attr_groups);
 out2:
 	kfree(soc_dev);
 out1:
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index 48ceea8..d9b3cf0 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -15,6 +15,7 @@ struct soc_device_attribute {
 	const char *serial_number;
 	const char *soc_id;
 	const void *data;
+	const struct attribute_group *custom_attr_group;
 };
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

