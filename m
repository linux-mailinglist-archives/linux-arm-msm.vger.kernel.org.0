Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37FA92C40FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 14:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgKYNSA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 08:18:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgKYNR7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 08:17:59 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982C2C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 05:17:59 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id e7so1890156wrv.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=kPnCe0iP66NBkbh+1iOCSM1ukgKDhz2EkysGZ2zJSqg=;
        b=g2ZwHgvsV4FKZ6atq6zr5IQjZ2QqbY1r8liKxF/K+jf1b2wXWnxh2gN0ke0sD4QovQ
         UmoWu3Wqd5XucNsI1I1lqq11YSnWDfJEx460NNCVJXJIKLbGW9/Ssc/buwDCBB+tDgcE
         skq/OderLdbhHv2p+9M0SNIERgVOGsGo4GU6UxsOtg1RTRAomG1yv5Qrdkvy436/1MAg
         6SuUssSJWHUk5dbpvmpxtvECSAeyZjFwufS7xiXLGBfZC4TYgaQx8DhHdacxApmmoSnZ
         tqlKbQAMRdXt9zKCQmNOjVxwjYjKkT6ESSTrehTYpV/2FgfBk4/3UMnIvnOXSkiSBOMr
         S3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kPnCe0iP66NBkbh+1iOCSM1ukgKDhz2EkysGZ2zJSqg=;
        b=LTuhu24QeamOecbhrCA3Vh8zsxhx3l+6oQ+yPk05xs/yhai/ATbktB9IEwlJimSHKe
         frbmLwhfmnPVKnRb7qAP+MKY2Ipz42Q33THnbLFSRJfoNsRV8O1fPJH/NQ+bors3O2vm
         dg6MSde4ytpMoSj0mylhZ3FgWFkdlSD3GCPvO7Z+DbnVTe4ZaQg4m8FvO03VlXnQWLx7
         FZD3nrKxSxccUnwX47CKlYzBepYmjRre9Sj8TUVDy2X5njCMEQOQUUd43u253GslJU2O
         uw6QWUGvPrequ1F8W34c28mZmJB9Ye6jXDKw+OwJIUSD8h6c9Xs0xrR5hUL500FnTMIc
         Mi3g==
X-Gm-Message-State: AOAM533SqJiuY2al6b22CVvIQJ+wMq93vX6/HCYq+IAEi95TG2+iNPmY
        UvSYLlpPxX9lFln4XCHZDJjjmg==
X-Google-Smtp-Source: ABdhPJxyJwlPONl814nSKavVIqmGaB01ZLr6h+ZsYP5PHSsX2BraTnUG04qMUFqCyDV5jwST4TCzdw==
X-Received: by 2002:adf:8143:: with SMTP id 61mr4053660wrm.318.1606310278337;
        Wed, 25 Nov 2020 05:17:58 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id f17sm4389304wmh.10.2020.11.25.05.17.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 05:17:57 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        jhugo@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5] bus: mhi: core: Fix device hierarchy
Date:   Wed, 25 Nov 2020 14:24:49 +0100
Message-Id: <1606310689-7189-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch fixes the hierarchical structure of MHI devices. Indeed,
MHI client devices are directly 'enumerated' from the mhi controller
and therefore must be direct descendants/children of their mhi
controller device, in accordance with the Linux Device Model.

Today both MHI clients and controller devices are at the same level,
this patch ensures that MHI controller is parent of its client devices.

The hierarchy is especially important for power management (safe
suspend/resume order). It is also useful for userspace to determine
relationship between MHI client devices and controllers.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 v2: fix commit message
 v3: reword commit message
 v4: fix device destroy
 v5: fix debugfs device show

 drivers/bus/mhi/core/debugfs.c |  4 +++-
 drivers/bus/mhi/core/init.c    | 10 +++++++++-
 drivers/bus/mhi/core/pm.c      |  4 ++--
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
index 3a48801..7d43138 100644
--- a/drivers/bus/mhi/core/debugfs.c
+++ b/drivers/bus/mhi/core/debugfs.c
@@ -159,7 +159,9 @@ static int mhi_debugfs_devices_show(struct seq_file *m, void *d)
 		return -ENODEV;
 	}
 
-	device_for_each_child(mhi_cntrl->cntrl_dev, m, mhi_device_info_show);
+	/* Show controller and client(s) info */
+	mhi_device_info_show(&mhi_cntrl->mhi_dev->dev, m);
+	device_for_each_child(&mhi_cntrl->mhi_dev->dev, m, mhi_device_info_show);
 
 	return 0;
 }
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 436221c..c7a7354 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1137,7 +1137,15 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
 	device_initialize(dev);
 	dev->bus = &mhi_bus_type;
 	dev->release = mhi_release_device;
-	dev->parent = mhi_cntrl->cntrl_dev;
+
+	if (mhi_cntrl->mhi_dev) {
+		/* for MHI client devices, parent is the MHI controller device */
+		dev->parent = &mhi_cntrl->mhi_dev->dev;
+	} else {
+		/* for MHI controller device, parent is the bus device (e.g. pci device) */
+		dev->parent = mhi_cntrl->cntrl_dev;
+	}
+
 	mhi_dev->mhi_cntrl = mhi_cntrl;
 	mhi_dev->dev_wake = 0;
 
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index a671f58..681960c 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -504,7 +504,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
 	wake_up_all(&mhi_cntrl->state_event);
 
 	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
-	device_for_each_child(mhi_cntrl->cntrl_dev, NULL, mhi_destroy_device);
+	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
 
 	mutex_lock(&mhi_cntrl->pm_mutex);
 
@@ -637,7 +637,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 	wake_up_all(&mhi_cntrl->state_event);
 
 	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
-	device_for_each_child(mhi_cntrl->cntrl_dev, NULL, mhi_destroy_device);
+	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
 
 	mutex_lock(&mhi_cntrl->pm_mutex);
 
-- 
2.7.4

