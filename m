Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09B4DCED9E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 22:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728980AbfJGUhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 16:37:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37616 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbfJGUhy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 16:37:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 03A1D60247; Mon,  7 Oct 2019 20:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570480673;
        bh=SEnedzx2FMZvyrh+5jvrhsQBlHkAyi4t9VFjjBFhgW0=;
        h=From:To:Cc:Subject:Date:From;
        b=IS0gf27qnWncyecm9//EW0AoT8v/Y2u+zrT/Ps5y4YTagufHxkOaUYl7OBlnUvu9x
         neqOyDSKRJ6OGenzhCRkrpEejlgkTOhXmVVIlLUtj5UPJlSSJI9ArrdFGG4ExAoRNN
         Q0EIcCpdhQIrlCPEsdIbUZngYSzaNgcm+cEPrOzg=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AEC9160247;
        Mon,  7 Oct 2019 20:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570480672;
        bh=SEnedzx2FMZvyrh+5jvrhsQBlHkAyi4t9VFjjBFhgW0=;
        h=From:To:Cc:Subject:Date:From;
        b=HaJY6c9LFhtOvGGneyuH/oJoUaeRGGiE/qMxt2WnVZ5ayWomPMp9qUyIrBDYFGKy5
         Lc497TtmBkcT01tJt0Dran7M/BzlCAU7tHhgTNUYO1S795ZbM3mCaADtnGzvCDlCGk
         4FADQmKR1gwCEw/0s5SEhUukKy2efirrv5EwyGjo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AEC9160247
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mnalajal@codeaurora.org
From:   Murali Nalajala <mnalajal@codeaurora.org>
To:     gregkh@linuxfoundation.org, rafael@kernel.org, swboyd@chromium.org
Cc:     mnalajal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v2] base: soc: Handle custom soc information sysfs entries
Date:   Mon,  7 Oct 2019 13:37:42 -0700
Message-Id: <1570480662-25252-1-git-send-email-mnalajal@codeaurora.org>
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
Changes in v2:
- Address comments from Stephen Boyd about "soc_dev" clean up in error paths.

Changes in v1:
- Remove NULL initialization of "soc_attr_groups"
- Taken care of freeing "soc_attr_groups" in soc_release()
- Addressed Stephen Boyd comments on usage of "kalloc"

 drivers/base/soc.c      | 30 +++++++++++++++++-------------
 include/linux/sys_soc.h |  1 +
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 7c0c5ca..4af11a4 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -104,15 +104,12 @@ static ssize_t soc_info_get(struct device *dev,
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
 
+	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
+	kfree(soc_dev->dev.groups);
 	kfree(soc_dev);
 }
 
@@ -121,6 +118,7 @@ static void soc_release(struct device *dev)
 struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr)
 {
 	struct soc_device *soc_dev;
+	const struct attribute_group **soc_attr_groups;
 	int ret;
 
 	if (!soc_bus_type.p) {
@@ -136,10 +134,18 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
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
@@ -150,15 +156,15 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 	dev_set_name(&soc_dev->dev, "soc%d", soc_dev->soc_dev_num);
 
 	ret = device_register(&soc_dev->dev);
-	if (ret)
-		goto out3;
+	if (ret) {
+		put_device(&soc_dev->dev);
+		return ERR_PTR(ret);
+	}
 
 	return soc_dev;
 
 out3:
-	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
-	put_device(&soc_dev->dev);
-	soc_dev = NULL;
+	kfree(soc_attr_groups);
 out2:
 	kfree(soc_dev);
 out1:
@@ -169,8 +175,6 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 /* Ensure soc_dev->attr is freed prior to calling soc_device_unregister. */
 void soc_device_unregister(struct soc_device *soc_dev)
 {
-	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
-
 	device_unregister(&soc_dev->dev);
 	early_soc_dev_attr = NULL;
 }
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

