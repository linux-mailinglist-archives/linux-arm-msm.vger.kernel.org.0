Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83652C4444
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 16:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731126AbgKYPmi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 10:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730457AbgKYPgO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 10:36:14 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49D8C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 07:36:13 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id p22so2368399wmg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 07:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bbVgkKAS62hFBcCu5bcswXZ0DTtj+/XPH5dTWv21sVY=;
        b=TQ9EbIqmdPdjQUPaoLxnzMqs5PiEK61LUk3gmc3JqktB/NRcCY+YXJcuMjSQMZHCG1
         NeYhHQ/MTvV7Z9DXeDrRjH19yJwqZUXwLIHePzmqrE/XKkTbrCQTgu7Ryr7fkLG59zet
         7o8yeM9kKmlIstRU/+6bygLr3dcD1c5eWsnzGFIULIU2E3ZYMClxVYwTbOiySfbbuinj
         txDX8jO0C1pYm4qleYg6zJsXQm1pZ0pth68aVtFuVFwrYi6cxfPemRk9DCdKOFvt8R7o
         DbPBZQR25QksJYmoZfkSQprFLcf5WLgD6hwKmqX0ueNV/F0ijyCxa6uIPZrrf64yQMft
         oGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bbVgkKAS62hFBcCu5bcswXZ0DTtj+/XPH5dTWv21sVY=;
        b=kORaXQrKsFMI5kJvIe8fgeAdYXIvlUq0wpaKN/s25c0pH5NwyZu7mjV3TK3K983/NK
         Xh26+27R18HQZ2yDLRQiqSxCmWE3ZDRieMO+qEARw78xhI0SksTQzcP3CHbbJcgD7edF
         RfdD/CidZ7iYq2jyQSFwB+sceQvSgjtivefR5QXkrGF0YoiRd5jyc9cdiHvGt0MzYDNs
         DTQadw5E/tsnVpK/68+chCzb0wEyF+A9/U1En5iq/bmBzM33rVSRGqZfQ3bmFTNQeis4
         3TtsbweGjhqqNCw4hM3YizjMWXHXZVrbspGIx/PSBJNmDkf/6qDcsrxhixoWhr81sVwb
         e1zA==
X-Gm-Message-State: AOAM530DowEa/MYxQLRkg8QN34yC/e1puG0MCJRcegWXlcKqwo7NGqXu
        FlqoY92/lrgcHpUV0VFHXWl/9Q==
X-Google-Smtp-Source: ABdhPJzNlgNyOzscL+mB6/xrtsdUyEON5cAsn7Q3E0ZsrJJh/7qAINzupS4ZEvoX/NxRGH1+ZXMxow==
X-Received: by 2002:a1c:9916:: with SMTP id b22mr4475343wme.182.1606318572362;
        Wed, 25 Nov 2020 07:36:12 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id d8sm4777811wmb.11.2020.11.25.07.36.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 07:36:11 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: core: Indexed MHI controller name
Date:   Wed, 25 Nov 2020 16:43:03 +0100
Message-Id: <1606318983-24898-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Today the MHI controller name is simply cloned from the underlying
bus device (its parent), that gives the following device structure
for e.g. a MHI/PCI controller:
devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0
devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0/0000:02:00.0_IPCR
...

That's quite misleading/confusing and can cause device registering
issues because of duplicate dev name (e.g. if a PCI device register
two different MHI instances).

This patch changes MHI core to create indexed mhi controller names
(mhi0, mhi1...) in the same way as other busses (i2c0, usb0...).

The previous example becomes:
devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0
devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0/mhi0_IPCR
...

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/init.c | 16 +++++++++++++++-
 drivers/bus/mhi/core/main.c |  2 +-
 include/linux/mhi.h         |  2 ++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index c7a7354..ecfffb0 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -8,6 +8,7 @@
 #include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
+#include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/list.h>
 #include <linux/mhi.h>
@@ -18,6 +19,8 @@
 #include <linux/wait.h>
 #include "internal.h"
 
+static DEFINE_IDA(mhi_controller_ida);
+
 const char * const mhi_ee_str[MHI_EE_MAX] = {
 	[MHI_EE_PBL] = "PBL",
 	[MHI_EE_SBL] = "SBL",
@@ -940,6 +943,12 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	mhi_cntrl->minor_version = (soc_info & SOC_HW_VERSION_MINOR_VER_BMSK) >>
 					SOC_HW_VERSION_MINOR_VER_SHFT;
 
+	mhi_cntrl->index = ida_alloc(&mhi_controller_ida, GFP_KERNEL);
+	if (mhi_cntrl->index < 0) {
+		ret = mhi_cntrl->index;
+		goto error_ida_alloc;
+	}
+
 	/* Register controller with MHI bus */
 	mhi_dev = mhi_alloc_device(mhi_cntrl);
 	if (IS_ERR(mhi_dev)) {
@@ -950,7 +959,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 	mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
 	mhi_dev->mhi_cntrl = mhi_cntrl;
-	dev_set_name(&mhi_dev->dev, "%s", dev_name(mhi_cntrl->cntrl_dev));
+	dev_set_name(&mhi_dev->dev, "mhi%d", mhi_cntrl->index);
 	mhi_dev->name = dev_name(mhi_cntrl->cntrl_dev);
 
 	/* Init wakeup source */
@@ -970,6 +979,9 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	put_device(&mhi_dev->dev);
 
 error_alloc_dev:
+	ida_free(&mhi_controller_ida, mhi_cntrl->index);
+
+error_ida_alloc:
 	kfree(mhi_cntrl->mhi_cmd);
 
 error_alloc_cmd:
@@ -1004,6 +1016,8 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 
 	device_del(&mhi_dev->dev);
 	put_device(&mhi_dev->dev);
+
+	ida_free(&mhi_controller_ida, mhi_cntrl->index);
 }
 EXPORT_SYMBOL_GPL(mhi_unregister_controller);
 
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 188501c0..4818f42 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -349,7 +349,7 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
 		/* Channel name is same for both UL and DL */
 		mhi_dev->name = mhi_chan->name;
 		dev_set_name(&mhi_dev->dev, "%s_%s",
-			     dev_name(mhi_cntrl->cntrl_dev),
+			     dev_name(&mhi_cntrl->mhi_dev->dev),
 			     mhi_dev->name);
 
 		/* Init wakeup source if available */
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 27078db..2a89533 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -297,6 +297,7 @@ struct mhi_controller_config {
  * @cntrl_dev: Pointer to the struct device of physical bus acting as the MHI
  *            controller (required)
  * @mhi_dev: MHI device instance for the controller
+ * @index: Index of the MHI controller instance
  * @debugfs_dentry: MHI controller debugfs directory
  * @regs: Base address of MHI MMIO register space (required)
  * @bhi: Points to base of MHI BHI register space
@@ -377,6 +378,7 @@ struct mhi_controller_config {
 struct mhi_controller {
 	struct device *cntrl_dev;
 	struct mhi_device *mhi_dev;
+	int index;
 	struct dentry *debugfs_dentry;
 	void __iomem *regs;
 	void __iomem *bhi;
-- 
2.7.4

