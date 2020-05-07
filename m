Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 642021C973B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 19:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgEGRNB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 13:13:01 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:22728 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726356AbgEGRNB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 13:13:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588871579; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vzkpzJDEjNzJyUMHwaXm9g/03jBlK8TCDgK+mM91/A0=; b=QMwcWeacRMRfOLujEoY1mlcj9YSJfFHkaaq7o9ChX4ccsftUNACfCwoauomkx/naYU3nHbOA
 RNYEqa1cO8Z+13b7AH4LV0iog7TW8ipjmbtR+DmGXrV+jjr1mqmIu2tp7xHKBmIskJK774KE
 GmBHHGtDGykLIr/nzGRn1OlND5A=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb44199.7f979d3003e8-smtp-out-n01;
 Thu, 07 May 2020 17:12:57 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 80424C433D2; Thu,  7 May 2020 17:12:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E783DC433F2;
        Thu,  7 May 2020 17:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E783DC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        gregkh@linuxfoundation.org, rafael@kernel.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH] bus: mhi: core: Add soc_reset sysfs
Date:   Thu,  7 May 2020 11:12:44 -0600
Message-Id: <1588871564-18357-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MHI bus supports a standardized hardware reset, which is known as the
"SoC Reset".  This reset is similar to the reset sysfs for PCI devices -
a hardware mechanism to reset the state back to square one.

The MHI SoC Reset is described in the spec as a reset of last resort.  If
some unrecoverable error has occurred where other resets have failed, SoC
Reset is the "big hammer" that ungracefully resets the device.  This is
effectivly the same as yanking the power on the device, and reapplying it.
However, depending on the nature of the particular issue, the underlying
transport link may remain active and configured.  If the link remains up,
the device will flag a MHI system error early in the boot process after
the reset is executed, which allows the MHI bus to process a fatal error
event, and clean up appropiately.

While the SoC Reset is generally intended as a means of recovery when all
else has failed, it can be useful in non-error scenarios.  For example,
if the device loads firmware from the host filesystem, the device may need
to be fully rebooted inorder to pick up the new firmware.  In this
scenario, the system administrator may use the soc_reset sysfs to cause
the device to pick up the new firmware that the admin placed on the
filesystem.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 Documentation/ABI/testing/sysfs-bus-mhi | 10 +++++++++
 MAINTAINERS                             |  1 +
 drivers/bus/mhi/core/boot.c             |  4 +---
 drivers/bus/mhi/core/init.c             | 40 +++++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/main.c             |  9 ++++++++
 include/linux/mhi.h                     |  6 +++++
 6 files changed, 67 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-mhi

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi b/Documentation/ABI/testing/sysfs-bus-mhi
new file mode 100644
index 0000000..8b06404
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi
@@ -0,0 +1,10 @@
+What:           /sys/bus/mhi/devices/<controller device>/soc_reset
+Date:		May 2020
+KernelVersion:  5.8
+Contact:        linux-arm-msm@vger.kernel.org
+Description:
+                Initiates a SoC reset on the MHI controller.  A SoC reset is
+		a reset of last resort, and will require a complete re-init.
+		This can be useful as a method of recovery if the device is
+		non-responsive, or as a means of loading new firmware as a
+		system administration task.
diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db..f38edac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11018,6 +11018,7 @@ M:	Hemant Kumar <hemantk@codeaurora.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
+F:	Documentation/ABI/testing/sysfs-bus-mhi
 F:	Documentation/mhi/
 F:	drivers/bus/mhi/
 F:	include/linux/mhi.h
diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index ebad5eb..ebb8e00 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -112,9 +112,7 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 			/* Hardware reset so force device to enter RDDM */
 			dev_dbg(dev,
 				"Did not enter RDDM, do a host req reset\n");
-			mhi_write_reg(mhi_cntrl, mhi_cntrl->regs,
-				      MHI_SOC_RESET_REQ_OFFSET,
-				      MHI_SOC_RESET_REQ);
+			mhi_do_soc_reset(mhi_cntrl);
 			udelay(delayus);
 		}
 
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index eb2ab05..198afe3 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -799,6 +799,39 @@ static int parse_config(struct mhi_controller *mhi_cntrl,
 	return ret;
 }
 
+static ssize_t soc_reset_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	unsigned long value;
+	int rc;
+
+	rc = kstrtoul(buf, 0, &value);
+
+	if (rc) {
+		count = -EINVAL;
+		goto out;
+	}
+
+	mhi_do_soc_reset(mhi_cntrl);
+
+out:
+	return count;
+}
+
+DEVICE_ATTR_WO(soc_reset);
+
+static struct attribute *reset_attrs[] = {
+	&dev_attr_soc_reset.attr,
+	NULL,
+};
+
+static struct attribute_group cntrl_soc_reset_group = {
+	.attrs = reset_attrs,
+};
+
 int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 			    struct mhi_controller_config *config)
 {
@@ -909,8 +942,15 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 	mhi_cntrl->mhi_dev = mhi_dev;
 
+	ret = device_add_group(&mhi_dev->dev, &cntrl_soc_reset_group);
+	if (ret)
+		goto error_add_reset;
+
 	return 0;
 
+error_add_reset:
+	device_del(&mhi_dev->dev);
+
 error_add_dev:
 	put_device(&mhi_dev->dev);
 
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 0ac0643..ec7c3a0 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1519,3 +1519,12 @@ int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mhi_poll);
+
+void mhi_do_soc_reset(struct mhi_controller *mhi_cntrl)
+{
+	if (mhi_cntrl)
+		mhi_write_reg(mhi_cntrl, mhi_cntrl->regs,
+			      MHI_SOC_RESET_REQ_OFFSET,
+			      MHI_SOC_RESET_REQ);
+}
+EXPORT_SYMBOL_GPL(mhi_do_soc_reset);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 3d7c3c2..dcdacf2 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -701,4 +701,10 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 		  struct sk_buff *skb, size_t len, enum mhi_flags mflags);
 
+/**
+ * mhi_do_soc_reset - Perform a SoC reset to the specified controller
+ * @mhi_cntrl: Controller to reset
+ */
+void mhi_do_soc_reset(struct mhi_controller *mhi_cntrl);
+
 #endif /* _MHI_H_ */
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
