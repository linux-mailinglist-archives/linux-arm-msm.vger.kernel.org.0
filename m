Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4FB066149
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 23:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbfGKVjX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 17:39:23 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40728 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729130AbfGKVjX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 17:39:23 -0400
Received: by mail-pl1-f195.google.com with SMTP id a93so3695060pla.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 14:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EzNAMttS2AF92NQ3UASWjBRJOhFuJT/fWhFSd6d/ebA=;
        b=z4O/+qkLA4vXpJ3nNov59+9U3SeoYQEqGfLYay+BW7MFGHoSgA6Xn12KTpwXryLJDa
         kSdWHgvJHON1OZY/G7R/jEYhWD3YuXocMikT7pFnmEi0y0MAlhVK5Z2cD0FHx35XVxco
         c3ASNcnkXB5LpHB4QV4MZeb7lTJniA4IELJQjPbMhw+mztJT9Zirbj7YH2N4EvD5Yy5N
         ZUi3i27poxAiArc1ot2+gaUhMVBBHRVnt/NtXIYIMv+UxzqIkyCydOSueXVgw0FI0OJs
         L01/sAKO8lTUZTmO3w7KvzYTSEuNbbl4iqXIIApSvkO8BtpiU5jWOwpU6VJQghMhFkqH
         8fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EzNAMttS2AF92NQ3UASWjBRJOhFuJT/fWhFSd6d/ebA=;
        b=Z6y6jTJ3IzoTluaYCeLJoY7DKUQIoACQFUXDDYRghxepPea2WeyB4JwVCccyQ8k6w8
         lUFYf5znnHT0lJLRed2YcTy3Z3nzV5RGCGFK7i+V39gjBh3ZrNjd797BfJzCEU89tEfQ
         ITCpH76fFzeuxL0Jf478GVsKbxmqfEG11jEDS8KfyVVfbxDcPUp2TrebQ/r3GnQp4ZTB
         38SunC7jqwXOc9JE8uWn9qfcIhPMgMQixvDnKvSrFiaK/6RXApZmiL/h50X9AiKuPaEb
         FZqC4zrtngXPSJ37mkr5KtiImBttOfoHKHRQaXkYoJImxaGU5BkAMywIqOymATK50u+9
         pFyQ==
X-Gm-Message-State: APjAAAWTB0DWKD4scbMhF1WDZrQ/W2fgG4gk1EZZC9dJLUVm5gBBobIT
        dpUW+5xsqxew+88L02Pirp+xc3d2hsM=
X-Google-Smtp-Source: APXvYqzo+CQ+1Gwk9JZOCpnK2gpRq3pumMDay93fwPttE2pGSr0GQaIjmhvL9TZf6VTacDgWLa+rNA==
X-Received: by 2002:a17:902:bd94:: with SMTP id q20mr7045643pls.307.1562881162390;
        Thu, 11 Jul 2019 14:39:22 -0700 (PDT)
Received: from localhost.localdomain ([27.7.91.104])
        by smtp.gmail.com with ESMTPSA id w3sm5709795pgl.31.2019.07.11.14.39.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 14:39:22 -0700 (PDT)
From:   Vaishali Thakkar <vaishali.thakkar@linaro.org>
To:     agross@kernel.org
Cc:     david.brown@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        Vaishali Thakkar <vaishali.thakkar@linaro.org>
Subject: [PATCH v5 1/5] base: soc: Add serial_number attribute to soc
Date:   Fri, 12 Jul 2019 03:09:07 +0530
Message-Id: <20190711213911.23180-2-vaishali.thakkar@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190711213911.23180-1-vaishali.thakkar@linaro.org>
References: <20190711213911.23180-1-vaishali.thakkar@linaro.org>
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
@@ -28,0 +29,7 @@ Description:
+What:		/sys/devices/socX/serial_number
+Date:		January 2019
+contact:	Bjorn Andersson <bjorn.andersson@linaro.org>
+Description:
+		Read-only attribute supported by most SoCs. Contains the SoC's
+		serial number, if available.
+
diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 10b280f30217..b0933b9fe67f 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -35,0 +36 @@ static DEVICE_ATTR(family,   S_IRUGO, soc_info_get,  NULL);
+static DEVICE_ATTR(serial_number, S_IRUGO, soc_info_get,  NULL);
@@ -59,0 +61,3 @@ static umode_t soc_attribute_mode(struct kobject *kobj,
+	if ((attr == &dev_attr_serial_number.attr)
+	    && (soc_dev->attr->serial_number != NULL))
+		return attr->mode;
@@ -79,0 +84,2 @@ static ssize_t soc_info_get(struct device *dev,
+	if (attr == &dev_attr_serial_number)
+		return sprintf(buf, "%s\n", soc_dev->attr->serial_number);
@@ -89,0 +96 @@ static struct attribute *soc_attr[] = {
+	&dev_attr_serial_number.attr,
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index b7c70c3e953f..48ceea867dd6 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -14,0 +15 @@ struct soc_device_attribute {
+	const char *serial_number;
-- 
2.17.1

