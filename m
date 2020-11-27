Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E272C6909
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 16:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731150AbgK0P6d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 10:58:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730892AbgK0P6d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 10:58:33 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B72C0613D1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 07:58:33 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id x22so5528274wmc.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 07:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=0KZCF6C6jgGn7713BeHOSCjzxrVz2BXNpCr8xzrvK24=;
        b=lKu26lZlqJTuLDuD/+uxXvfbXWEkx9RUVuAlwvWk6to1JbUJAotFkrTSoNNkbUHxLS
         fQr2S9aPmzBd4LKHjzLqAo21MccnIWgRix3Zpw+iuMtn4yAMijjMUcQiUi3sB5V3TaZk
         jOHBJxxz82FxmfVbRycR33eXSW13hP6ECB/86k8c9bqQqXmpT71S9mfPtU5msHVBPL5N
         nrMpS76p6OHVVBT7yew4HpS6MkEFkkmDE6//jx/zt8opTsXxiOaFqqIB1x8LtRjeHCUG
         u8OK0qahf/simKzOBJTVMnSRBamlO69b/iRaYaCnDSmdRj2/A3Rp1nQEF0JfNZA8a1T4
         mI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0KZCF6C6jgGn7713BeHOSCjzxrVz2BXNpCr8xzrvK24=;
        b=szNjPS6EsUvoi9v6Tf/HKfDZ73rfS3EjZykC/2Qrz3lmzOjzFVBoQ4Mcg5LvIrzZ47
         J1hfpkC0rqhNT+EtOOnW97gNu9TrmiNigPBodNEbO8NgAO5ZHJlsC5rwlqBqGGDnAB1w
         lE+BYEOqdbL0Ipq2ujPJzZk/W16nPB+X62vOvQpxeH+Ov8AK89wb1dNNmAL/k7fMoIyq
         CUMKyAJsJsfK1rMF14ffSNrmbYlgbyE1pE+M7e0HnvP2gf/I0HoG0SdPmauC8an/YPI1
         AIDINgRFYaz3NeurJPnM/7p60dTDVV3cL2D41WBHhwH7k/AqCLV4ufU21ltEn8CQOH5l
         CHNg==
X-Gm-Message-State: AOAM530H/hOumyKihqI1JPaoJWV3rJBGtpHPIRtF51f6WrZPnSHxEILw
        oc39bNaBclOItqrdDaFb9DJduw==
X-Google-Smtp-Source: ABdhPJx4T0Vcbq5xhfkYY495jIWVwY6CxwXzmhIzwWwzK/Xfs6W7NCnpPZ0eAAnFM++m/BuVt/h4dg==
X-Received: by 2002:a05:600c:2287:: with SMTP id 7mr10246766wmf.189.1606492709270;
        Fri, 27 Nov 2020 07:58:29 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id o203sm7852952wmb.0.2020.11.27.07.58.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Nov 2020 07:58:28 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3] bus: mhi: core: Indexed MHI controller name
Date:   Fri, 27 Nov 2020 17:05:21 +0100
Message-Id: <1606493121-12540-1-git-send-email-loic.poulain@linaro.org>
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
 v2: move index field at the end of mhi_controller struct (before bool)
     to avoid breaking well packed alignment.
 v3: Align debugfs directory name

 drivers/bus/mhi/core/debugfs.c |  2 +-
 drivers/bus/mhi/core/init.c    | 18 ++++++++++++++++--
 drivers/bus/mhi/core/main.c    |  2 +-
 include/linux/mhi.h            |  2 ++
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
index 7d43138..858d751 100644
--- a/drivers/bus/mhi/core/debugfs.c
+++ b/drivers/bus/mhi/core/debugfs.c
@@ -377,7 +377,7 @@ static struct dentry *mhi_debugfs_root;
 void mhi_create_debugfs(struct mhi_controller *mhi_cntrl)
 {
 	mhi_cntrl->debugfs_dentry =
-			debugfs_create_dir(dev_name(mhi_cntrl->cntrl_dev),
+			debugfs_create_dir(dev_name(&mhi_cntrl->mhi_dev->dev),
 					   mhi_debugfs_root);
 
 	debugfs_create_file("states", 0444, mhi_cntrl->debugfs_dentry,
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index c7a7354..4acad28 100644
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
@@ -950,8 +959,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 	mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
 	mhi_dev->mhi_cntrl = mhi_cntrl;
-	dev_set_name(&mhi_dev->dev, "%s", dev_name(mhi_cntrl->cntrl_dev));
-	mhi_dev->name = dev_name(mhi_cntrl->cntrl_dev);
+	dev_set_name(&mhi_dev->dev, "mhi%d", mhi_cntrl->index);
+	mhi_dev->name = dev_name(&mhi_dev->dev);
 
 	/* Init wakeup source */
 	device_init_wakeup(&mhi_dev->dev, true);
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
index 7f3c990..ea39df0 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -350,7 +350,7 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
 		/* Channel name is same for both UL and DL */
 		mhi_dev->name = mhi_chan->name;
 		dev_set_name(&mhi_dev->dev, "%s_%s",
-			     dev_name(mhi_cntrl->cntrl_dev),
+			     dev_name(&mhi_cntrl->mhi_dev->dev),
 			     mhi_dev->name);
 
 		/* Init wakeup source if available */
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 27078db..30c676d 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -356,6 +356,7 @@ struct mhi_controller_config {
  * @read_reg: Read a MHI register via the physical link (required)
  * @write_reg: Write a MHI register via the physical link (required)
  * @buffer_len: Bounce buffer length
+ * @index: Index of the MHI controller instance
  * @bounce_buf: Use of bounce buffer
  * @fbc_download: MHI host needs to do complete image transfer (optional)
  * @pre_init: MHI host needs to do pre-initialization before power up
@@ -446,6 +447,7 @@ struct mhi_controller {
 			  u32 val);
 
 	size_t buffer_len;
+	int index;
 	bool bounce_buf;
 	bool fbc_download;
 	bool pre_init;
-- 
2.7.4

