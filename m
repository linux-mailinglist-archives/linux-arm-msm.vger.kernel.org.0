Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E9F1D88CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 22:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgERUEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 16:04:15 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:23565 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727851AbgERUEO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 16:04:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589832252; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=M/rimLZ9072yv+rzqmHvJnR79FljZfewZOntJCZMjaA=; b=Ab68/ohIuMg8+mbj0yfil6faDt7oMUE+3gDC89ci7k6++imGXCoqUOx/w+rQIMKMDUJ8isOE
 Tpx/zLolWzmXPFavUybQy1d6JbnKbWMlGbzlpt8Lw0tnxiYSl0JxGGfalL1mDnvDFuOjX52l
 N95QY1phipD3BOYfszOa+Xkclis=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec2ea3c.7fbc62209bc8-smtp-out-n05;
 Mon, 18 May 2020 20:04:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 132BFC432C2; Mon, 18 May 2020 20:04:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 16052C433F2;
        Mon, 18 May 2020 20:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 16052C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 7/7] bus: mhi: core: Introduce sysfs entries for MHI
Date:   Mon, 18 May 2020 13:04:01 -0700
Message-Id: <1589832241-13867-8-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589832241-13867-1-git-send-email-bbhatt@codeaurora.org>
References: <1589832241-13867-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce sysfs entries to enable userspace clients the ability to read
the serial number and the OEM PK Hash values obtained from BHI. OEMs
need to read these device-specific hardware information values through
userspace for factory testing purposes and cannot be exposed via degbufs
as it may remain disabled for performance reasons. Also, update the
documentation for ABI to include these entries.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 Documentation/ABI/stable/sysfs-bus-mhi | 25 ++++++++++++++++
 MAINTAINERS                            |  1 +
 drivers/bus/mhi/core/init.c            | 53 ++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi

diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
new file mode 100644
index 0000000..65ef711
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-bus-mhi
@@ -0,0 +1,25 @@
+What:		/sys/bus/mhi/devices/.../serialnumber
+Date:		May 2020
+KernelVersion:  5.8
+Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
+Description:
+		The file holds the serial number of the endpoint device obtained
+		using a BHI (Boot Host Interface) register read after at least
+		one attempt to power up the device has been done. If read
+		without having the device power on at least once, the file will
+		read all 0's.
+Users:		Any userspace application or clients interested in the device
+		hardware information.
+
+What:		/sys/bus/mhi/devices/.../oem_pk_hash
+Date:		May 2020
+KernelVersion:  5.8
+Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
+Description:
+		The file holds the OEM PK Hash value of the endpoint device
+		obtained using a BHI (Boot Host Interface) register read after
+		at least one attempt to power up the device has been done. If
+		read without having the device power on at least once, the file
+		will read all 0's.
+Users:		Any userspace application or clients interested in the device
+		hardware information.
diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db..5e49316 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11018,6 +11018,7 @@ M:	Hemant Kumar <hemantk@codeaurora.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
+F:	Documentation/ABI/stable/sysfs-bus-mhi
 F:	Documentation/mhi/
 F:	drivers/bus/mhi/
 F:	include/linux/mhi.h
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 83ad544..9b6a5173 100644
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
+	return snprintf(buf, PAGE_SIZE, "Serial Number:%u\n",
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
+				"OEMPKHASH[%d]:0x%x\n", i,
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
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
