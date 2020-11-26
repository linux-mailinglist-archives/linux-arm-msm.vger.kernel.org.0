Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B852C51DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 11:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387673AbgKZKNs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 05:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387672AbgKZKNr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 05:13:47 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321EEC0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 02:13:46 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id u12so1538471wrt.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 02:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=TcO2+V8Trb7q4awlpL7qSZ4Ba95y6l5NN7GUNtBcA18=;
        b=ub6AU6c0u5M6XwLreQQgP9Z0j98QsfN38YuF9jLe6ywD60g+mZ7q0fsPfPTINS+jcT
         xTW6B2Xvkc7sN/+F5Z/fdxySKIQzH0T/Ks2SUAireFCvKUAkDhbkBgA2xpZ+z+DsIh6U
         cfqvYbc+gfu+oFGEocDJflVjcyROD2RPd7aS6g5sMs41dR/mKQvtqonp6qL3lz09bYO8
         VGttUGHjmjQEXjByBlMs2A2dGYOV2RXYSuiDTWJdX0d7UrcT7zgX2p21uT1p9ALOrCsB
         Bt1VEZv0raANT7Yw8NpUNHZ3+OhyidNO21fYVkjKR0/lwJWp1GP4/ZjzveXYQcmfS6GJ
         jmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TcO2+V8Trb7q4awlpL7qSZ4Ba95y6l5NN7GUNtBcA18=;
        b=NHPXk4W/JnC+JOjNpF4tNFcVGYOW0u6KY8Qvb61LaDykIz3W2g7HC0fnYnqBHa4rvs
         6R9QQI6aHUy64VoFeanqUO/9YVG2biAt4qb7THzoKOTBFzxDBhD/sdBf+cyP5dDCsjVf
         9caAM0Vhx4C9nrhMf0TAjpV9tGCusAf0YqRrlNGuDQJSorImiQW/xzFTw8hnU1EjIy8Y
         c+rZC8OMlwrUVZpETtiG5FktK0GWm389ta55vwsCXhhoIEI+Us+JqMn8ieYQnpuHtoN4
         kNlE/CHC8z/3U/l+azV4Zy+3XuEPKZQNHU72HGMu5nUno5PL+PTb7Y1kqQqnnUfbFnpG
         XJiQ==
X-Gm-Message-State: AOAM531NCO++DzFSWrho3RJHa61MDWyt5r0CHUS3NQv6cvSSSZnLO91l
        xQ6DpQKW9MIu8gaET1nfP0UCYg==
X-Google-Smtp-Source: ABdhPJwExA4SroWEPwssH0uGRzQt5dQgk4ClHFZGYzxte05q4albRBcH8gNtDna2nSJDL0oPVYVJvA==
X-Received: by 2002:adf:e544:: with SMTP id z4mr2973966wrm.83.1606385624740;
        Thu, 26 Nov 2020 02:13:44 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id 34sm7784825wrh.78.2020.11.26.02.13.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 02:13:44 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] bus: mhi: core: Indexed MHI controller name
Date:   Thu, 26 Nov 2020 11:20:35 +0100
Message-Id: <1606386035-15982-1-git-send-email-loic.poulain@linaro.org>
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
 v2: move index field at the end of mhi_controller struct (before bool)
     to avoid breaking well packed alignment.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/init.c | 18 ++++++++++++++++--
 drivers/bus/mhi/core/main.c |  2 +-
 include/linux/mhi.h         |  2 ++
 3 files changed, 19 insertions(+), 3 deletions(-)

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

