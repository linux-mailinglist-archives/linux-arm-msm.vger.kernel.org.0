Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECFF2CB987
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388583AbgLBJo7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:44:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388602AbgLBJom (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:42 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE308C061A4F
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:44:10 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id iq13so702651pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D7gHV9XT2NDWWAcMQEmr5435W+1ty8KPE5zJq5MQ2Ns=;
        b=pqwnNnV0h3+5O5CnqaViisplV0agqqErehuxFHMdojbDFXpO5xIILjGF8Gtj72eXie
         EeL3LZpwJEZCFKC56dOt8GJZqkzq14dQnRq3F2nJ7dOLjQTWCtrpuzhO3yx01Ai8bIej
         l6l/rsTfM2A0H9ycDZYgK3JaeavvD6uwceAJ8F+1QLqfVbaL7Z1PB8WamZUYf0CyjdGa
         sNjDmEW3bdkERhmLvIvPHiyEAboPdQpVdcKLF76Yc6sKeV4JrRWXgEHbj2s/xtBMlUZt
         tHbUFftlEcewBbIdeCZXiVLcDh++4+G0KfQfKXfzebv8Q5+EqR1w/k+T6ShtxqkFtF0m
         Un2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D7gHV9XT2NDWWAcMQEmr5435W+1ty8KPE5zJq5MQ2Ns=;
        b=IZkRo0EyWi+z7UPBCKowDbIXmZmRy9OnrvJJMyVUqaXbq3DzCKy1seCh1ZAiks3s3i
         JN5pA4u/B0ARwIBYMTqc2tJuSm6LlQuHCtpUhHxEdMc1M+yaxL5UfDO/p0i35OmK2nCK
         qD9bYH30C2d2knsIFJEFi46Fqd7daYYfRvCixRPxokTJ/9taLeAdFQMKVeV6J33UxG68
         LfysBcXOx407/YNNLGX7vAnJksBZG4KYNV/r5oPr4yZAHN1vNVcfYHU9/orxYWw5bN3H
         xC1+DryIaDQO09rvIqLcx4eAS75F80n2tlnGToYoIY8FLH9QQ/bX5fiKkXZnJvv0Ev4x
         QlRw==
X-Gm-Message-State: AOAM531NrCm6EdXHDt1BVEZFpqXnUXHB29L4FSXEJf8o3UeUv5+Mjybw
        /YErWwcKFQX3/svZixbdDvkCz1vy4RID
X-Google-Smtp-Source: ABdhPJy69ErJ/XLa5jfirwl7+7TO3Xq+DhS52l6g1k/bCYUpHt9jD/lkyBDuiCvvAgl92emVdYg5EQ==
X-Received: by 2002:a17:902:8bcb:b029:d9:d765:d7f3 with SMTP id r11-20020a1709028bcbb02900d9d765d7f3mr1926816plo.69.1606902250339;
        Wed, 02 Dec 2020 01:44:10 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:44:09 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 26/29] bus: mhi: core: Indexed MHI controller name
Date:   Wed,  2 Dec 2020 15:11:56 +0530
Message-Id: <20201202094159.107075-27-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

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
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 18 ++++++++++++++++--
 drivers/bus/mhi/core/main.c |  2 +-
 include/linux/mhi.h         |  2 ++
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 655d539c6808..1d6f7b6c1fcd 100644
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
index 4eb93d8bea1d..702c31b6aefa 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -331,7 +331,7 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
 		/* Channel name is same for both UL and DL */
 		mhi_dev->name = mhi_chan->name;
 		dev_set_name(&mhi_dev->dev, "%s_%s",
-			     dev_name(mhi_cntrl->cntrl_dev),
+			     dev_name(&mhi_cntrl->mhi_dev->dev),
 			     mhi_dev->name);
 
 		/* Init wakeup source if available */
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index d31efcf02ae7..aa9757e71f1f 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -348,6 +348,7 @@ struct mhi_controller_config {
  * @read_reg: Read a MHI register via the physical link (required)
  * @write_reg: Write a MHI register via the physical link (required)
  * @buffer_len: Bounce buffer length
+ * @index: Index of the MHI controller instance
  * @bounce_buf: Use of bounce buffer
  * @fbc_download: MHI host needs to do complete image transfer (optional)
  * @pre_init: MHI host needs to do pre-initialization before power up
@@ -438,6 +439,7 @@ struct mhi_controller {
 			  u32 val);
 
 	size_t buffer_len;
+	int index;
 	bool bounce_buf;
 	bool fbc_download;
 	bool pre_init;
-- 
2.25.1

