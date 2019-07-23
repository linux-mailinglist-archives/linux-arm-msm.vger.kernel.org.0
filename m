Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD2C72276
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 00:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389491AbfGWWf1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 18:35:27 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45483 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbfGWWf0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 18:35:26 -0400
Received: by mail-pf1-f193.google.com with SMTP id r1so19837390pfq.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 15:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x0riv3qXFNUHW9aogl2u0KORFwMPTEBgnFJrb7TrTKo=;
        b=NdUtwPTDmyF+MRh1jbsokxVgxD6AafcT12ED5L6Y9I5m2QfLdOnwiR6uwiYtOV9tk0
         h6VY892u4JoMBt9AMQKwRr3HNCU5gkqEMiFHV7K7lGmwXCVIOMPwP+eNArEltUq4Htwk
         hZS5Zxmjtgtn/s7/3OKCx94HAQCliNP+XIaOEFOLyGWmeqk9aYexZPS0KUaFd0cAlQJQ
         SDEKqRKPo4kEiGUAXM+TRKI3qSZr/0FLyRhUmimH4ErvW+ecrpeSW7bbOQVlwkym9WLT
         e1rMnmwknhLBjz5GK9JBdbitBQZl7iFX0SPhBn3UI9mUaXPGBhAsUr5bmwvdaKhKiHrq
         odSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x0riv3qXFNUHW9aogl2u0KORFwMPTEBgnFJrb7TrTKo=;
        b=QYtEcMuGdGojcOhcsj41KKKsH7ociksNu5mZQxgH8ZxHOqe2Rn5PX3h4QU/qFOa4KS
         DMh8NJXdt0lF3uP2pBu0wfwfz/H5eOzxZYf82hfuuEhTrQAvf6rqSeyqG+Uuty+7GBzh
         N1eJJDXGBSgqy+TzOeY+8q4ocIyCbmG8P8gRzhNx64LAX1TYMjD/c8YP8wBXzbpa0Yj9
         q1ekaX/7lk4Q5epp5v6n9BWhRZAdAmMBHDI9tsgqC6qBCX0vD5pbz4M1wh8wpEET5oUA
         Ip6fySUqBPtu40r+bJUbuoLCveksrSxIoHk9OY3bDdE4gTBYiVkA93N4MQcRt6PE8M6J
         wwAQ==
X-Gm-Message-State: APjAAAXr+rA3wATB8bpDdxtgtdT2SkOvaQvArWNuqIz+z7qMgAjN846q
        lYFY4EtIg6mEa8ZN+QVFuD7PmA==
X-Google-Smtp-Source: APXvYqwkeWnj9VJarEoWXWZKcZ/pRvGNriNTC5RrGifBufFMtBzss48lhq5w0+ZlOY9imCz35H802g==
X-Received: by 2002:aa7:9481:: with SMTP id z1mr8048059pfk.92.1563921326084;
        Tue, 23 Jul 2019 15:35:26 -0700 (PDT)
Received: from localhost.localdomain ([115.99.187.56])
        by smtp.gmail.com with ESMTPSA id h16sm49036917pfo.34.2019.07.23.15.35.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 15:35:25 -0700 (PDT)
From:   Vaishali Thakkar <vaishali.thakkar@linaro.org>
To:     agross@kernel.org
Cc:     david.brown@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        Vaishali Thakkar <vaishali.thakkar@linaro.org>
Subject: [PATCH v6 1/5] base: soc: Add serial_number attribute to soc
Date:   Wed, 24 Jul 2019 04:05:11 +0530
Message-Id: <20190723223515.27839-2-vaishali.thakkar@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
References: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add new attribute named "serial_number" as a standard interface for
user space to acquire the serial number of the device.

For ST-Ericsson SoCs this is exposed by the cryptically named "soc_id"
attribute, but this provides a human readable standardized name for this
property.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vaishali Thakkar <vaishali.thakkar@linaro.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes since v5:
	- No code changes, fix diff.context setting for formatting
          patches. Version 5 was adding context at the bottom of
          the file with 'git am'.
Changes since v4:
	- Add Stephen's reviewed-by
Changes since v3:
        - Add Greg's Reviewed-by
Changes since v2:
        - None
Changes since v1:
	- Make comment more clear for the case when serial
	  number is not available
---
 Documentation/ABI/testing/sysfs-devices-soc | 7 +++++++
 drivers/base/soc.c                          | 7 +++++++
 include/linux/sys_soc.h                     | 1 +
 3 files changed, 15 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-soc b/Documentation/ABI/testing/sysfs-devices-soc
index 6d9cc253f2b2..ba3a3fac0ee1 100644
--- a/Documentation/ABI/testing/sysfs-devices-soc
+++ b/Documentation/ABI/testing/sysfs-devices-soc
@@ -26,6 +26,13 @@ Description:
 		Read-only attribute common to all SoCs. Contains SoC family name
 		(e.g. DB8500).
 
+What:		/sys/devices/socX/serial_number
+Date:		January 2019
+contact:	Bjorn Andersson <bjorn.andersson@linaro.org>
+Description:
+		Read-only attribute supported by most SoCs. Contains the SoC's
+		serial number, if available.
+
 What:		/sys/devices/socX/soc_id
 Date:		January 2012
 contact:	Lee Jones <lee.jones@linaro.org>
diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 10b280f30217..b0933b9fe67f 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -33,6 +33,7 @@ static struct bus_type soc_bus_type = {
 
 static DEVICE_ATTR(machine,  S_IRUGO, soc_info_get,  NULL);
 static DEVICE_ATTR(family,   S_IRUGO, soc_info_get,  NULL);
+static DEVICE_ATTR(serial_number, S_IRUGO, soc_info_get,  NULL);
 static DEVICE_ATTR(soc_id,   S_IRUGO, soc_info_get,  NULL);
 static DEVICE_ATTR(revision, S_IRUGO, soc_info_get,  NULL);
 
@@ -57,6 +58,9 @@ static umode_t soc_attribute_mode(struct kobject *kobj,
 	if ((attr == &dev_attr_revision.attr)
 	    && (soc_dev->attr->revision != NULL))
 		return attr->mode;
+	if ((attr == &dev_attr_serial_number.attr)
+	    && (soc_dev->attr->serial_number != NULL))
+		return attr->mode;
 	if ((attr == &dev_attr_soc_id.attr)
 	    && (soc_dev->attr->soc_id != NULL))
 		return attr->mode;
@@ -77,6 +81,8 @@ static ssize_t soc_info_get(struct device *dev,
 		return sprintf(buf, "%s\n", soc_dev->attr->family);
 	if (attr == &dev_attr_revision)
 		return sprintf(buf, "%s\n", soc_dev->attr->revision);
+	if (attr == &dev_attr_serial_number)
+		return sprintf(buf, "%s\n", soc_dev->attr->serial_number);
 	if (attr == &dev_attr_soc_id)
 		return sprintf(buf, "%s\n", soc_dev->attr->soc_id);
 
@@ -87,6 +93,7 @@ static ssize_t soc_info_get(struct device *dev,
 static struct attribute *soc_attr[] = {
 	&dev_attr_machine.attr,
 	&dev_attr_family.attr,
+	&dev_attr_serial_number.attr,
 	&dev_attr_soc_id.attr,
 	&dev_attr_revision.attr,
 	NULL,
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index b7c70c3e953f..48ceea867dd6 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -12,6 +12,7 @@ struct soc_device_attribute {
 	const char *machine;
 	const char *family;
 	const char *revision;
+	const char *serial_number;
 	const char *soc_id;
 	const void *data;
 };
-- 
2.17.1

