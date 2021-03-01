Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD95B32837A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 17:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237790AbhCAQTQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 11:19:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237620AbhCAQSu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 11:18:50 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F4BC061793
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 08:17:05 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id e10so16525122wro.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 08:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LaV6X0F5DQzXiJGVsgwJy4CH3I5tNDQd/ra57eKQDJU=;
        b=OXdxDkGTv8Vvr5bfhn/6QtXYVKbfPIfi8236twIKlc6MkBQhd73Y/Bw2M6o14XONzY
         sjtvx8VQGHY4VtEh6UD3lLFzAiy/XIecQnSUUhf1w7BHvLxEiWGtDH3uf5K0RIBSwQmu
         wmniB2xuDc0ufS4ZSgDfq9IdoMbqzcc/Im4D8ojDTk2BxgtX7NwKi833/rnTQMqn7NAD
         QfND/jlxmd3E5T+4kmeRp0XfqmxL4ttecTvDJj/6NASnffj47lk6yq6IdmXSfB1xLT7s
         37a1zz6HlfGsR2hXeo8yO2v0RVEEGN+g+5qc5F/WyQY9HLx/MgC/gF0zunnBftUEo/kk
         K1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LaV6X0F5DQzXiJGVsgwJy4CH3I5tNDQd/ra57eKQDJU=;
        b=neiANzNBN+EZHZ9hNjqB9MEIGc9gpRvelw2hPKIXhjjvSQQHTn83JzWBoFwyTshyok
         2JwJck9ikgwczk+NGsjfBg76oOCeVI1Oxa2b71tASs5I6vG/3hndIvhRgPWEeoH0F18N
         YxGIcoKh0d0x2UAxsG623z/6bTqyvyq6VnV6d0HmMwX5i7Vnp1ulocjl0qd5aaGgMWT6
         xPO1qStzOCaSJ0whiz+iIfVEdngSuIkBFVpwgyFpiyPZiyfEg1Q2XyzG0hVtdpo1hCwF
         nv0LyOg2yUmd2WOgiarVh+kwm5wJ9lPFjUWUbteZGcTyqdw18aG/jVqp1Ph06L5ZpcEC
         ih5w==
X-Gm-Message-State: AOAM531pJ0xmrNtNfAwKuA2cWq3zQP8U/DZrNfsz9+/19zseMZuru4Bm
        JVRsdhl0aqC6sPItII/8Y4D/mPOCwZTh6buI
X-Google-Smtp-Source: ABdhPJwy/TfsmjAAXnJaz2E/zbWXHL4srvGzUqBgGh+s0iot3uczNCxplrg99iz3gQhu8euAW1TFiQ==
X-Received: by 2002:adf:a4d1:: with SMTP id h17mr17715091wrb.57.1614615424131;
        Mon, 01 Mar 2021 08:17:04 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:5a20:c00c:6ec3:cc84])
        by smtp.gmail.com with ESMTPSA id w6sm3919789wrl.49.2021.03.01.08.17.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 08:17:03 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 6/6] mhi: pci_generic: Add support for runtime PM
Date:   Mon,  1 Mar 2021 17:25:11 +0100
Message-Id: <1614615911-18794-6-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
References: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When the device is idle it is possible to move it into the lowest MHI
PM state (M3). In that mode, all MHI operations are suspended and the
PCI device can be safely put into PCI D3 state.

The device is then resumed from D3/M3 either because of host initiated
MHI operation (e.g. buffer TX) or because the device (modem) has
triggered wake-up via PME feature (e.g. on incoming data).

Same procedures can be used for system wide or runtime suspend/resume.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 65 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 2a66f80..2bc834d 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -14,6 +14,7 @@
 #include <linux/mhi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 #include <linux/timer.h>
 #include <linux/workqueue.h>
 
@@ -274,6 +275,7 @@ MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
 
 enum mhi_pci_device_status {
 	MHI_PCI_DEV_STARTED,
+	MHI_PCI_DEV_SUSPENDED,
 };
 
 struct mhi_pci_device {
@@ -306,6 +308,10 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 	case MHI_CB_FATAL_ERROR:
 	case MHI_CB_SYS_ERROR:
 		dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
+		pm_runtime_forbid(&pdev->dev);
+		break;
+	case MHI_CB_EE_MISSION_MODE:
+		pm_runtime_allow(&pdev->dev);
 		break;
 	default:
 		break;
@@ -427,13 +433,19 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
 
 static int mhi_pci_runtime_get(struct mhi_controller *mhi_cntrl)
 {
-	/* no PM for now */
-	return 0;
+	/* The runtime_get() MHI callback means:
+	 *    Do whatever is requested to leave M3.
+	 */
+	return pm_runtime_get(mhi_cntrl->cntrl_dev);
 }
 
 static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
 {
-	/* no PM for now */
+	/* The runtime_put() MHI callback means:
+	 *    Device can be moved in M3 state.
+	 */
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 }
 
 static void mhi_pci_recovery_work(struct work_struct *work)
@@ -494,6 +506,10 @@ static void health_check(struct timer_list *t)
 		return;
 	}
 
+	if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
+			test_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
+		return;
+
 	/* reschedule in two seconds */
 	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
@@ -575,6 +591,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* start health check */
 	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
+	/* Only allow runtime-suspend if PME capable (for wakeup) */
+	if (pci_pme_capable(pdev, PCI_D3hot)) {
+		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
+		pm_runtime_use_autosuspend(&pdev->dev);
+		pm_runtime_mark_last_busy(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+	}
+
 	return 0;
 
 err_unprepare:
@@ -598,6 +622,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 		mhi_unprepare_after_power_down(mhi_cntrl);
 	}
 
+	/* balancing probe put_noidle */
+	if (pci_pme_capable(pdev, PCI_D3hot))
+		pm_runtime_get_noresume(&pdev->dev);
+
 	mhi_unregister_controller(mhi_cntrl);
 }
 
@@ -708,31 +736,45 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
 	.reset_done = mhi_pci_reset_done,
 };
 
-static int  __maybe_unused mhi_pci_suspend(struct device *dev)
+static int  __maybe_unused mhi_pci_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+	int err;
 
+	set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status);
 	del_timer(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
+	if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
+			mhi_cntrl->ee != MHI_EE_AMSS)
+		goto pci_suspend; /* Nothing to do at MHI level */
+
 	/* Transition to M3 state */
-	mhi_pm_suspend(mhi_cntrl);
+	err = mhi_pm_suspend(mhi_cntrl);
+	if (err) {
+		dev_err(&pdev->dev, "failed to suspend device: %d;\n", err);
+		clear_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status);
+		return -EBUSY;
+	}
 
+pci_suspend:
 	pci_disable_device(pdev);
 	pci_wake_from_d3(pdev, true);
 
 	return 0;
 }
 
-static int __maybe_unused mhi_pci_resume(struct device *dev)
+static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 	int err;
 
+	clear_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status);
+
 	err = pci_enable_device(pdev);
 	if (err)
 		goto err_recovery;
@@ -740,6 +782,13 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
 	pci_set_master(pdev);
 	pci_wake_from_d3(pdev, false);
 
+	/* It can be a remote wakeup (no mhi runtime_get), update access time */
+	pm_runtime_mark_last_busy(dev);
+
+	if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
+			mhi_cntrl->ee != MHI_EE_AMSS)
+		return 0; /* Nothing to do at MHI level */
+
 	/* Exit M3, transition to M0 state */
 	err = mhi_pm_resume(mhi_cntrl);
 	if (err) {
@@ -760,7 +809,9 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops mhi_pci_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(mhi_pci_suspend, mhi_pci_resume)
+	SET_RUNTIME_PM_OPS(mhi_pci_runtime_suspend, mhi_pci_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct pci_driver mhi_pci_driver = {
-- 
2.7.4

