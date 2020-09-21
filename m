Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3675D272B2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbgIUQLR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbgIUQLR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:11:17 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8241DC061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:11:17 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k13so9156505pfg.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=t7YL/sHl4cdMau2Whx59EhUvH+vo5PeoHAXBaAy8cvg=;
        b=c9k5iknwn/GrvfZhHp/Cpu6YCcJXdHDwzCtsvNIeMggPw6QM4qtDbFjTX/idNoeTgs
         Qz36wKL7cbPFWNJC5qZqsJOuw9p+5AWvf9nWfJShJ2Bk+JnAd0synd9rRGFdER9xlC1K
         VUc+QVBcVbUnYm0hLzRLKRtEwFsou3y3vSTYSJuSNvaK9N0MSDfmGjhf3sMDdetKnw5n
         A/Q2u2AqUvE+dMmy2Ax6P9G0kGxkamoiPMPMRlFjDM/3Jv05a6XYUbFVgAD9alc+eaCz
         /VQnK5VrArNu5CPu1pkyXDShtglF2/5HIpX5ki3Yl9fXvTAkznABjJDGBzFSbmtPj7NA
         f8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=t7YL/sHl4cdMau2Whx59EhUvH+vo5PeoHAXBaAy8cvg=;
        b=a2uf6AsygrV2nw9t+lW7KlRdcUkTbhVRAavoM7cwbMqy3tMMGfx5CjvBguRZelTc19
         gibBhe6EgbtVCc8aSAJFCGLGHIEYvL4Bs2Ar+p+tl6P0OWfjCj2QmiBAXMHEELac8H5l
         iCp7ZxEoC0SpkE6wZADqWy9O9ThZ7Nck5x2WYD+UcRqo1wNRjHmt2LoSuZyzGAql1UYC
         VlrwLX227RjfFEttZC5hbEjXhl8+1Gvv52ZQrhAfrrI4WRikRcuuNtwJiUmGtwye1YiJ
         adQ7KOQpQMp+n3RdnjKmonvY8PnubjdfS0RwL6+bLgWvtK+ChA0d33IcotrS9jbDqPWz
         4zcA==
X-Gm-Message-State: AOAM532AZFAEpm4BTvkAtC7WKUQXxYG9iInMIhPFt16EhVU8o9xiVoo7
        ao8THmFfwdloZBp8ukQZGnYYtNgYRrmL
X-Google-Smtp-Source: ABdhPJyadhhD+8e8EsAvuZXkGKlrm/WuwbkaudLPezjS5yYHOpdoX2rYBFyJ2Ze5WfIzhIHi+OLN9Q==
X-Received: by 2002:a63:d242:: with SMTP id t2mr295254pgi.47.1600704676971;
        Mon, 21 Sep 2020 09:11:16 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:11:16 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 15/18] bus: mhi: core: Introduce sysfs entries for MHI
Date:   Mon, 21 Sep 2020 21:38:12 +0530
Message-Id: <20200921160815.28071-17-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
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
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/ABI/stable/sysfs-bus-mhi | 21 ++++++++++
 MAINTAINERS                            |  1 +
 drivers/bus/mhi/core/init.c            | 53 ++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)
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
index 61e5885a331a..1b4161eaf0d8 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -76,6 +76,56 @@ const char *to_mhi_pm_state_str(enum mhi_pm_state state)
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
+static struct attribute *mhi_sysfs_attrs[] = {
+	&dev_attr_serial_number.attr,
+	&dev_attr_oem_pk_hash.attr,
+	NULL,
+};
+
+static const struct attribute_group mhi_sysfs_group = {
+	.attrs = mhi_sysfs_attrs,
+};
+
+static int mhi_create_sysfs(struct mhi_controller *mhi_cntrl)
+{
+	return sysfs_create_group(&mhi_cntrl->mhi_dev->dev.kobj,
+				  &mhi_sysfs_group);
+}
+
+static void mhi_destroy_sysfs(struct mhi_controller *mhi_cntrl)
+{
+	sysfs_remove_group(&mhi_cntrl->mhi_dev->dev.kobj, &mhi_sysfs_group);
+}
+
 /* MHI protocol requires the transfer ring to be aligned with ring length */
 static int mhi_alloc_aligned_ring(struct mhi_controller *mhi_cntrl,
 				  struct mhi_ring *ring,
@@ -917,6 +967,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	mhi_cntrl->mhi_dev = mhi_dev;
 
 	mhi_create_debugfs(mhi_cntrl);
+	if (mhi_create_sysfs(mhi_cntrl))
+		dev_err(mhi_cntrl->cntrl_dev, "Failed to create sysfs entries\n");
 
 	return 0;
 
@@ -940,6 +992,7 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 	struct mhi_chan *mhi_chan = mhi_cntrl->mhi_chan;
 	unsigned int i;
 
+	mhi_destroy_sysfs(mhi_cntrl);
 	mhi_destroy_debugfs(mhi_cntrl);
 
 	kfree(mhi_cntrl->mhi_cmd);
-- 
2.17.1

