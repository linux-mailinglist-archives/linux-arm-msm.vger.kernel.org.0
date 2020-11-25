Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB0C2C3EDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 12:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgKYLQc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 06:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgKYLQb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 06:16:31 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03DE5C061A4D
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 03:16:27 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 1so1782874wme.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 03:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bUWAz+7oC4r88ijrzPoeEe5nNVdgzuIo0a9R1/WrO0E=;
        b=okwqCZ1JJCP0WvyT8T/guMksh+4YoHfEjpOnUupzS7eW7qnWyIThSxmP4yHONvYLst
         7WMEJsgzbSBXgySQxzXvo4Iw1nBYIjPNaAEBLUBH2BOpIB4EeO/GC2ighL08GLG/fq7L
         BIiKUk/ekdSMXDQo1SGdq9+bbyMY8A0ez2XTU+dUz3h6LXG+L7qRPovEmM4MUxAYyg/C
         aLiKkF6xdfLY6blJqIWfkRMB3VUdEbv48aLh3Dgpbar0Pn84ykXbX6yKbcSX1rQ08S1s
         fTTe4hnxvAaa0E1ePQSkO4xV6MEEF6YkOqh+9KxyZ84Z8ztGo74g4Ef0zONjTEWzxEKs
         Im4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bUWAz+7oC4r88ijrzPoeEe5nNVdgzuIo0a9R1/WrO0E=;
        b=Vf7XnbaoVekHkiZT/qz1bLs5EP95qfOzvSn0vxaUu9xlPnJSQYVPLiIG3/X5LbKCTY
         tDZboWXSBflUFQpx4I8wfnHf+hDa9mfPrXkZylqaScN7P41xnr6NBnbrIiHrCX9t+bod
         dwAzs/oKJtjx4ipt3jtMFZ3MxVoDqR3GnDD55MTNwsDHkkFmJtS0YM/WuXbMJ3wcy8RC
         cQV98vVwVpXkVKsF7YusObtvgRVIgkB4v6wDfwBihoqHR24WjAVMQfqEE2NY2ZGGsx0s
         SV+jJmIYfme7KRIxP1Y+uapnt1t7eicWYtZB/s4HQODvsQJwV8lhRy1laqNzXKPLwwue
         ePNw==
X-Gm-Message-State: AOAM531DvWzFRAg5U+cPw1/lMGxpuzkQmbFsKyRErhNW87hbmUdX6HjP
        57PhIsJCOLq9E+5WAC4L3qYCgQ==
X-Google-Smtp-Source: ABdhPJwJ5hY5iT/tvUiA1wHxErGlClp0/vD5c9IYjUlp2IneYug59d+jKwqu6Z1+wGHqjgXNnPUGww==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr3363365wmj.162.1606302985662;
        Wed, 25 Nov 2020 03:16:25 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id n9sm3928166wmd.4.2020.11.25.03.16.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 03:16:25 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        jhugo@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4] bus: mhi: core: Fix device hierarchy
Date:   Wed, 25 Nov 2020 12:23:16 +0100
Message-Id: <1606303396-5588-1-git-send-email-loic.poulain@linaro.org>
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

 drivers/bus/mhi/core/init.c | 10 +++++++++-
 drivers/bus/mhi/core/pm.c   |  4 ++--
 2 files changed, 11 insertions(+), 3 deletions(-)

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

