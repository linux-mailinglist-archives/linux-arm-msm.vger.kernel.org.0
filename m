Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64E227D51C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbgI2Rxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728576AbgI2Rxd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:53:33 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018C9C0613D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:33 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d6so5304057pfn.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=L3CU+DoqUHiRxVgJAceWJlznOoGillE+BlhtluWnPFM=;
        b=IHdVpJcxXiMp1MfK/ckQ0DW8ljvSsIpYWAOjHKaz26YBfQrgZBuOfbf1EWOXIWUtVI
         OEd+tyR8rqFKIOUts36EuDYIHlLVI2qpAXd5i9upvFSlonCdPo9NlZx6dv6McwsXZFEc
         nBNjVzEHU6RepQSHlpxvD0o80z/ZjCeVW27iHsW9v6swJ+Tt1rivGHoO0dpxd02FvyUZ
         Is8s+0lYwhkrnzKp373bxDeQ79KjKMTiL4WcqB1tbzBPwxtT6p+3avdyzj92cKm+V69m
         oa/98k+zTeIQI4MXo6nRe0G1szc9y/PtIq2JQTMARPE2ztv4+8IHFlR2qziUwVoO1u2R
         MDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=L3CU+DoqUHiRxVgJAceWJlznOoGillE+BlhtluWnPFM=;
        b=scc2zC/jIvBzMoLFWmqDBE4iV2+bnU252RuEtjA4VVP1DSi0W7jfYuy/nBT56lmpbH
         8f3ooVutRi3Lp+m1RN3KrQwOlbUUOZyfOZcxu40/j4QrZr+lGOdNWEZ2rnXtU5JyUJ67
         UirpGexbSSnsUrUNWXrIVfgl33IT/x+5pFp/+oV4eBAEPGIfRKeCggzJU/c4jyXgN2do
         IiEBZLtwFY+bSnm5WDjMNd9nfcakkZSwMwiOSbqGRqKXOahlH0XL2Bif4ud0Sp7zyyYf
         DjS0MTqL+XCQyIJqSduqsgcL9uOssNWhvRYCvjOVfifswVJiDLhvWnclj7PDPxAL1wKb
         Og2w==
X-Gm-Message-State: AOAM533p7GMcQYm2EzFuqrsmbYuKQxCImDRBy0BQSa1kM4S6iZvYEVJI
        LomiF668PcqWFwkOThuitw2P
X-Google-Smtp-Source: ABdhPJyJcSx28lSC2XOPOG707RQ0nvJ2m8g3Eo+Wwxq7RbLfSZxltrjZ+DMx2EjQ8pdBr5a3Nqb2/A==
X-Received: by 2002:a63:e441:: with SMTP id i1mr4265509pgk.221.1601402012424;
        Tue, 29 Sep 2020 10:53:32 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r188sm6271046pfc.67.2020.09.29.10.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:53:31 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 15/19] bus: mhi: core: Introduce sysfs entries for MHI
Date:   Tue, 29 Sep 2020 23:22:14 +0530
Message-Id: <20200929175218.8178-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
References: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Introduce sysfs entries to enable userspace clients the ability to read
the serial number and the OEM PK Hash values obtained from BHI. OEMs
need to read these device-specific hardware information values through
userspace for factory testing purposes and cannot be exposed via degbufs
as it may remain disabled for performance reasons. Also, update the
documentation for ABI to include these entries.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
[mani: used dev_groups to manage sysfs attributes]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/ABI/stable/sysfs-bus-mhi | 21 +++++++++++++++
 MAINTAINERS                            |  1 +
 drivers/bus/mhi/core/init.c            | 37 ++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi

diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
new file mode 100644
index 000000000000..ecfe7662f8d0
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-bus-mhi
@@ -0,0 +1,21 @@
+What:		/sys/bus/mhi/devices/.../serialnumber
+Date:		Sept 2020
+KernelVersion:	5.10
+Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
+Description:	The file holds the serial number of the client device obtained
+		using a BHI (Boot Host Interface) register read after at least
+		one attempt to power up the device has been done. If read
+		without having the device power on at least once, the file will
+		read all 0's.
+Users:		Any userspace application or clients interested in device info.
+
+What:		/sys/bus/mhi/devices/.../oem_pk_hash
+Date:		Sept 2020
+KernelVersion:	5.10
+Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
+Description:	The file holds the OEM PK Hash value of the endpoint device
+		obtained using a BHI (Boot Host Interface) register read after
+		at least one attempt to power up the device has been done. If
+		read without having the device power on at least once, the file
+		will read all 0's.
+Users:		Any userspace application or clients interested in device info.
diff --git a/MAINTAINERS b/MAINTAINERS
index deaafb617361..11e7be9b9163 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11323,6 +11323,7 @@ M:	Hemant Kumar <hemantk@codeaurora.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
+F:	Documentation/ABI/stable/sysfs-bus-mhi
 F:	Documentation/mhi/
 F:	drivers/bus/mhi/
 F:	include/linux/mhi.h
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 61e5885a331a..a33665b7ee54 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -76,6 +76,42 @@ const char *to_mhi_pm_state_str(enum mhi_pm_state state)
 	return mhi_pm_state_str[index];
 }
 
+static ssize_t serial_number_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct mhi_device *mhi_dev = to_mhi_device(dev);
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+
+	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
+			mhi_cntrl->serial_number);
+}
+static DEVICE_ATTR_RO(serial_number);
+
+static ssize_t oem_pk_hash_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct mhi_device *mhi_dev = to_mhi_device(dev);
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	int i, cnt = 0;
+
+	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++)
+		cnt += snprintf(buf + cnt, PAGE_SIZE - cnt,
+				"OEMPKHASH[%d]: 0x%x\n", i,
+				mhi_cntrl->oem_pk_hash[i]);
+
+	return cnt;
+}
+static DEVICE_ATTR_RO(oem_pk_hash);
+
+static struct attribute *mhi_dev_attrs[] = {
+	&dev_attr_serial_number.attr,
+	&dev_attr_oem_pk_hash.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(mhi_dev);
+
 /* MHI protocol requires the transfer ring to be aligned with ring length */
 static int mhi_alloc_aligned_ring(struct mhi_controller *mhi_cntrl,
 				  struct mhi_ring *ring,
@@ -1301,6 +1337,7 @@ struct bus_type mhi_bus_type = {
 	.dev_name = "mhi",
 	.match = mhi_match,
 	.uevent = mhi_uevent,
+	.dev_groups = mhi_dev_groups,
 };
 
 static int __init mhi_init(void)
-- 
2.17.1

