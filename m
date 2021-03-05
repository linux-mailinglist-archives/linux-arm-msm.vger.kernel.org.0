Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1254E32EAB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 13:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233266AbhCEMjx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 07:39:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232930AbhCEMji (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 07:39:38 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87D8C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 04:39:37 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id o2so1333741wme.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 04:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vwZP6CmHJ7pwo/dc1QlCiNITnkzK3g1H3RNDeoUYb4g=;
        b=VmMD0w9ywL/dyi2V/93aajylbKf8XUqMc8gLQuSaAwRxTCLLYz0PpnQqQS/aZbjwpM
         z+vILheRfED5qi/pGRI/4faAOcdrtWGSM1vrPWSEaVBzEtyT4lgQPnCg/L/fbYLfRpP8
         FhJjXlkIWev8x7yM72hwA/Bgne7EP6+wurg8dInMP7vauYJPKDW1VmEjj8g33okiEFds
         tkbXbh3w2VNpKNXWk87rQIOAF2aZA8j9hdueOAWrti/AZlhXkwQ6gl+md8i1qpuOrpmg
         LKRn6ODSNGlBqj0aA6fkAKRzi4VAaWvEsw+fUkOlPgP5vREGwlGVoUPT8qbRm2UQaur5
         Xnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vwZP6CmHJ7pwo/dc1QlCiNITnkzK3g1H3RNDeoUYb4g=;
        b=elReb/lwIGc32PQrW82XUOFE/9sZ0BgqFuRI0Bl7/ZrJ9VJHs03V1yqE92XbR8u81C
         gYDOCCVwBlGjzK0vjFr/d7TDjrKGR7DffVxA/xn/gKxtIvgJsqiR295FGLEg9AtMUnIt
         /RXWVHO0bBrNIz0GVeyBnc6OA22n+7ySNWfwT7eRCMqVDl2kFIc+/ehhsC2yoxeCjjeI
         ei/ZpV9vE5ItLq4SqvE1WhAlgPsyuMjWLN+ruFtD84eU1eskebNaEPm26/y1+SWRgKkm
         okYVXMFdPuQ44h7XuIR+lBUVaNrQ3fp6nw0lm1Ic+Mrq7ma0v+O418ZrASWSxUnlIqMH
         fYMQ==
X-Gm-Message-State: AOAM533YXE5BAkV0iV0EGDdNL4rz2X01cGunUj3TpDuL4FQBoy7VuiiW
        7p0wGYarb0Tp9smIXTIfYLz/8g==
X-Google-Smtp-Source: ABdhPJxdH3TdrWmLzbkYgyf1ek1kztnhCKrpT6Holw8FVs0mHutxC1djHV8iSkf3VrSBFszffQJlyQ==
X-Received: by 2002:a7b:c5d0:: with SMTP id n16mr8718920wmk.27.1614947976488;
        Fri, 05 Mar 2021 04:39:36 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id f5sm4173256wrx.39.2021.03.05.04.39.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 04:39:35 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 6/6] mhi: pci_generic: Add support for runtime PM
Date:   Fri,  5 Mar 2021 13:47:58 +0100
Message-Id: <1614948478-2284-6-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614948478-2284-1-git-send-email-loic.poulain@linaro.org>
References: <1614948478-2284-1-git-send-email-loic.poulain@linaro.org>
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
 v2: replace force_runtime_suspend/resume via local function to ensure
     device is always resumed during system resume whatever its runtime
     pm state.

 drivers/bus/mhi/pci_generic.c | 95 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 86 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 4ab0aa8..e36f5a9 100644
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
@@ -306,6 +308,11 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 	case MHI_CB_FATAL_ERROR:
 	case MHI_CB_SYS_ERROR:
 		dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
+		pm_runtime_forbid(&pdev->dev);
+		break;
+	case MHI_CB_EE_MISSION_MODE:
+		pm_runtime_mark_last_busy(&pdev->dev);
+		pm_runtime_allow(&pdev->dev);
 		break;
 	default:
 		break;
@@ -427,13 +434,19 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
 
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
@@ -447,6 +460,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 	dev_warn(&pdev->dev, "device recovery started\n");
 
 	del_timer(&mhi_pdev->health_check_timer);
+	pm_runtime_forbid(&pdev->dev);
 
 	/* Clean up MHI state */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
@@ -454,7 +468,6 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 		mhi_unprepare_after_power_down(mhi_cntrl);
 	}
 
-	/* Check if we can recover without full reset */
 	pci_set_power_state(pdev, PCI_D0);
 	pci_load_saved_state(pdev, mhi_pdev->pci_state);
 	pci_restore_state(pdev);
@@ -488,6 +501,10 @@ static void health_check(struct timer_list *t)
 	struct mhi_pci_device *mhi_pdev = from_timer(mhi_pdev, t, health_check_timer);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
+			test_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
+		return;
+
 	if (!mhi_pci_is_alive(mhi_cntrl)) {
 		dev_err(mhi_cntrl->cntrl_dev, "Device died\n");
 		queue_work(system_long_wq, &mhi_pdev->recovery_work);
@@ -575,6 +592,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
@@ -598,6 +623,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 		mhi_unprepare_after_power_down(mhi_cntrl);
 	}
 
+	/* balancing probe put_noidle */
+	if (pci_pme_capable(pdev, PCI_D3hot))
+		pm_runtime_get_noresume(&pdev->dev);
+
 	mhi_unregister_controller(mhi_cntrl);
 }
 
@@ -708,31 +737,48 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
 	.reset_done = mhi_pci_reset_done,
 };
 
-static int  __maybe_unused mhi_pci_suspend(struct device *dev)
+static int  __maybe_unused mhi_pci_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+	int err;
+
+	if (test_and_set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
+		return 0;
 
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
 
+	if (!test_and_clear_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
+		return 0;
+
 	err = pci_enable_device(pdev);
 	if (err)
 		goto err_recovery;
@@ -740,6 +786,13 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
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
@@ -753,13 +806,37 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
 	return 0;
 
 err_recovery:
-	/* The device may have loose power or crashed, try recovering it */
+	/* Do not fail to not mess up our PCI device state, the device likely
+	 * lost power (d3cold) and we simply need to reset it from the recovery
+	 * procedure, trigger the recovery asynchronously to prevent system
+	 * suspend exit delaying.
+	 */
 	queue_work(system_long_wq, &mhi_pdev->recovery_work);
 
-	return err;
+	return 0;
+}
+
+static int  __maybe_unused mhi_pci_suspend(struct device *dev)
+{
+	pm_runtime_disable(dev);
+	return mhi_pci_runtime_suspend(dev);
+}
+
+static int __maybe_unused mhi_pci_resume(struct device *dev)
+{
+	int ret;
+
+	/* Depending the platform, device may have lost power (d3cold), we need
+	 * to resume it now to check its state and recover when necessary.
+	 */
+	ret = mhi_pci_runtime_resume(dev);
+	pm_runtime_enable(dev);
+
+	return ret;
 }
 
 static const struct dev_pm_ops mhi_pci_pm_ops = {
+	SET_RUNTIME_PM_OPS(mhi_pci_runtime_suspend, mhi_pci_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(mhi_pci_suspend, mhi_pci_resume)
 };
 
-- 
2.7.4

