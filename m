Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9742E6F07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 09:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgL2Iht (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 03:37:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgL2Ihs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 03:37:48 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0896C06179F
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:33 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id cw27so11929977edb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nEn/OUbK+5BNC0SGN0UoGUUqsvJDQ/HeZj3c89NIANo=;
        b=fcZmAhjjN9QIRsJR0/Qu3yoCpFrMb6Q/D4THDmAVq7oG2/tbNO7EAHf/z6m6ykLbzV
         WURTVzuQqOpfXEMTKou0FM7q6lQu3cv/dA6+VApIR1mnBhaq79qzF+CySJusMlxcGMA0
         yu8MVeU9FF3wFia6F8S7piYpUrYnIYdj+W91dC2JgcJrkgGO3s0En5edNiOVLzwS5/8q
         EMN82+xbKp84YtZMGAvi/BIn4c/MXEyykU67GdjtenqE3xRzYnxxzN8ds6FgXSW41DmJ
         rUC742/h7jeIdmU+yUw4ar0GJZ7b4vUrAYOpaGLREG/X+DHK32IK10JUaSr3h+VcmRcv
         wDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nEn/OUbK+5BNC0SGN0UoGUUqsvJDQ/HeZj3c89NIANo=;
        b=kcbuPeCK7EB8pSYCWW+MrceFbmvg5JeVzIJ60hCw4/5smT/I+F6A/TFRNstYuhFDQl
         BZ4EUEQmCnoWfVDrV3YMccxRvmp97FSHrmzBRRoBKf1xftHoiho0p2MQYVpaoiQ7FLSC
         wsZaR5nwgUNEV/yLf4EgciEHtRYjNWzfo6P9dwXgFXONbtrtVzml27F+0/d5Qk5I8L77
         EtviecieIan9mnP7vi3r7Vb6lSjSw2QWvE+2PdcbsafV06vQ9rLY1Pxjb/NBVB/BBFio
         dPz66qecNyTXsk4Px0//tuJDpNJumgmrR5ur11m4QpIcN3dpLGamBzIU/8C+xv8xUKyL
         8F6g==
X-Gm-Message-State: AOAM532L3StNhXY6cUYCSS175+8d8Lez1gUClNy9bgfU35WRQrtQAs4y
        ivZ9WgRHx7AQuEH9XoOXG/pcTQ==
X-Google-Smtp-Source: ABdhPJy5K3bSlFRSJsB2BjMiN8e0TvZd72BjzfqtoG+llg8QidKHdVi2vmVHMSML8+9YT10XXUQqKA==
X-Received: by 2002:a50:d888:: with SMTP id p8mr45538202edj.147.1609230992532;
        Tue, 29 Dec 2020 00:36:32 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:6f69:290a:2b46:b9])
        by smtp.gmail.com with ESMTPSA id c23sm37265143eds.88.2020.12.29.00.36.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Dec 2020 00:36:32 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 08/10] mhi: pci_generic: Add health-check
Date:   Tue, 29 Dec 2020 09:43:49 +0100
Message-Id: <1609231431-10048-9-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the modem crashes for any reason, we may not be able to detect
it at MHI level (MHI registers not reachable anymore).

This patch implements a health-check mechanism to check regularly
that device is alive (MHI layer can communicate with). If device
is not alive (because a crash or unexpected reset), the recovery
procedure is triggered.

Tested successfully with Telit FN980m module.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/pci_generic.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 9fe1e30..812d54f 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -14,11 +14,15 @@
 #include <linux/mhi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/timer.h>
 #include <linux/workqueue.h>
 
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
 #define MHI_POST_RESET_DELAY_MS 500
+
+#define HEALTH_CHECK_PERIOD (HZ * 2)
+
 /**
  * struct mhi_pci_dev_info - MHI PCI device specific information
  * @config: MHI controller configuration
@@ -189,6 +193,7 @@ struct mhi_pci_device {
 	struct mhi_controller mhi_cntrl;
 	struct pci_saved_state *pci_state;
 	struct work_struct recovery_work;
+	struct timer_list health_check_timer;
 	unsigned long status;
 };
 
@@ -326,6 +331,8 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 
 	dev_warn(&pdev->dev, "device recovery started\n");
 
+	del_timer(&mhi_pdev->health_check_timer);
+
 	/* Clean up MHI state */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, false);
@@ -351,6 +358,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 	dev_dbg(&pdev->dev, "Recovery completed\n");
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 	return;
 
 err_unprepare:
@@ -360,6 +368,21 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 		dev_err(&pdev->dev, "Recovery failed\n");
 }
 
+static void health_check(struct timer_list *t)
+{
+	struct mhi_pci_device *mhi_pdev = from_timer(mhi_pdev, t, health_check_timer);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+
+	if (!mhi_pci_is_alive(mhi_cntrl)) {
+		dev_err(mhi_cntrl->cntrl_dev, "Device died\n");
+		queue_work(system_long_wq, &mhi_pdev->recovery_work);
+		return;
+	}
+
+	/* reschedule in two seconds */
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+}
+
 static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
@@ -375,6 +398,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return -ENOMEM;
 
 	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
+	timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
 
 	mhi_cntrl_config = info->config;
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
@@ -427,6 +451,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
 
+	/* start health check */
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+
 	return 0;
 
 err_unprepare:
@@ -442,6 +469,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	del_timer(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
@@ -459,6 +487,8 @@ static void mhi_pci_reset_prepare(struct pci_dev *pdev)
 
 	dev_info(&pdev->dev, "reset\n");
 
+	del_timer(&mhi_pdev->health_check_timer);
+
 	/* Clean up MHI state */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, false);
@@ -502,6 +532,7 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
 	}
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
 
 static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
@@ -562,6 +593,7 @@ static int  __maybe_unused mhi_pci_suspend(struct device *dev)
 	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	del_timer(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	/* Transition to M3 state */
@@ -597,6 +629,9 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
 		goto err_recovery;
 	}
 
+	/* Resume health check */
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+
 	return 0;
 
 err_recovery:
-- 
2.7.4

