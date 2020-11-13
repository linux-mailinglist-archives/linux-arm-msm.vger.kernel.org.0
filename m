Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345392B1DD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 15:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgKMOxy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 09:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgKMOxy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 09:53:54 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BF2C0613D1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:35 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a3so8719079wmb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hhHhDYdP+8BPJr5kgR7RD3Uk81FZFDX0ZASxs+JRlko=;
        b=bv3QPb3TQGfOZkMEevSqRGPcljPWTCf4P0D4GnOlVcK4RdXeiWSsnBzOqsFqBzvs18
         38Bpj1b/DohLToMS3nYgryeR6n0K1eWKyK6nJEqlyqnh/KTch3rGtGBHaGHVwGeorwYG
         ipmKWRCo7rMZO8QJrigrX2GD+rLu4ecrn6UUyzG77TfYvVuUliHa0zBpJIMTUC0Om1eX
         UnI6MIZb5Z9/K2ZQ3xaRAFh5eo/dcjJ4n2Oq3V09MKlctZwBHQ3Ivd29RIU/KsAO2Uti
         1x0MlMBxdgJ1BtShN4sbzSPaAH70/S34iEtVXhNGzAgMjaW+zuZXEIRqS4moU6l42WhJ
         PCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hhHhDYdP+8BPJr5kgR7RD3Uk81FZFDX0ZASxs+JRlko=;
        b=Ch1lNTgJ1oRk8mNsZmCjXcz9/JXWcKx3/KlOUUWkXXe67CfWUtf70tRq8VrJz1xUWW
         pySMKYbad1Dg9DfkD8caxqrzZIoK9VFXSWJYRh1AiOFIPBOoc0t9qsiEcBUQjpN7Df29
         PVhGqmltSqu1SJT1ALeY4PgTm0ozcsmf2ujXlNQMpUTq5C1XPNiFXP28Frm4W2lOr2SR
         6OdJRVhP6p4Jna8j3RvEBMptoperX+JYOgAnHG4KDmT5UbjBKHuiZkbLjw6+VkHNtd2Q
         sSxqzq6Rtu27zRVobcMwEaYvV0ODGdUFdrbpKCQIhDoRTMfkfbwJzaRMFrAAjAUjJg6+
         WeNw==
X-Gm-Message-State: AOAM531D8VnBqsjnF9r+R4Jxo/BuhNCrnxYzwvfdxDwGS6AWnn86zF+D
        N38kb3FaeCeND9j0Ayk/tKtSyA==
X-Google-Smtp-Source: ABdhPJx0Tw1Y9IWC61nREt10eeD9G4PeWzfwZOPXh6Sza1/q2FmqjzrOB3SJ9wE1HwzEmx5Sq40jaA==
X-Received: by 2002:a1c:f612:: with SMTP id w18mr2994885wmc.11.1605279214464;
        Fri, 13 Nov 2020 06:53:34 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:304f:e9d4:6385:8ac5])
        by smtp.gmail.com with ESMTPSA id i6sm10729341wma.42.2020.11.13.06.53.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 06:53:33 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 5/8] mhi: pci_generic: Add suspend/resume/recovery procedure
Date:   Fri, 13 Nov 2020 15:59:59 +0100
Message-Id: <1605279602-18749-6-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for system wide suspend/resume. During suspend, MHI
device controller must be put in M3 state and PCI bus in D3 state.

Add a recovery procedure allowing to reinitialize the device in case
of error during resume steps, which can happen if device loses power
(and so its context) while system suspend.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 100 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index b48c382..75f565b 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -13,6 +13,7 @@
 #include <linux/mhi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/workqueue.h>
 
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
@@ -187,6 +188,7 @@ enum mhi_pci_device_status {
 struct mhi_pci_device {
 	struct mhi_controller mhi_cntrl;
 	struct pci_saved_state *pci_state;
+	struct work_struct recovery_work;
 	unsigned long status;
 };
 
@@ -319,6 +321,48 @@ static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
 	/* no PM for now */
 }
 
+static void mhi_pci_recovery_work(struct work_struct *work)
+{
+	struct mhi_pci_device *mhi_pdev = container_of(work, struct mhi_pci_device,
+						       recovery_work);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
+	int err;
+
+	dev_warn(&pdev->dev, "device recovery started\n");
+
+	/* Clean up MHI state */
+	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
+		mhi_power_down(mhi_cntrl, false);
+		mhi_unprepare_after_power_down(mhi_cntrl);
+	}
+
+	/* Check if we can recover without full reset */
+	pci_set_power_state(pdev, PCI_D0);
+	pci_load_saved_state(pdev, mhi_pdev->pci_state);
+	pci_restore_state(pdev);
+
+	if (!mhi_pci_is_alive(mhi_cntrl))
+		goto err_try_reset;
+
+	err = mhi_prepare_for_power_up(mhi_cntrl);
+	if (err)
+		goto err_try_reset;
+
+	err = mhi_sync_power_up(mhi_cntrl);
+	if (err)
+		goto err_unprepare;
+
+	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
+	return;
+
+err_unprepare:
+	mhi_unprepare_after_power_down(mhi_cntrl);
+err_try_reset:
+	if (pci_reset_function(pdev))
+		dev_err(&pdev->dev, "Recovery failed\n");
+}
+
 static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
@@ -333,6 +377,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!mhi_pdev)
 		return -ENOMEM;
 
+	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
+
 	mhi_cntrl_config = info->config;
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
 	mhi_cntrl->cntrl_dev = &pdev->dev;
@@ -395,6 +441,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	cancel_work_sync(&mhi_pdev->recovery_work);
+
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, true);
 		mhi_unprepare_after_power_down(mhi_cntrl);
@@ -463,12 +511,64 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
 	.reset_done = mhi_pci_reset_done,
 };
 
+int  __maybe_unused mhi_pci_suspend(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+
+	/* Transition to M3 state */
+	mhi_pm_suspend(mhi_cntrl);
+
+	pci_save_state(pdev);
+	pci_disable_device(pdev);
+	pci_wake_from_d3(pdev, true);
+	pci_set_power_state(pdev, PCI_D3hot);
+
+	return 0;
+}
+
+static int __maybe_unused mhi_pci_resume(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+	int err;
+
+	pci_set_power_state(pdev, PCI_D0);
+	pci_restore_state(pdev);
+	pci_set_master(pdev);
+
+	err = pci_enable_device(pdev);
+	if (err)
+		goto err_recovery;
+
+	/* Exit M3, transition to M0 state */
+	err = mhi_pm_resume(mhi_cntrl);
+	if (err) {
+		dev_err(&pdev->dev, "failed to resume device: %d\n", err);
+		goto err_recovery;
+	}
+
+	return 0;
+
+err_recovery:
+	/* The device may have loose power or crashed, try recovering it */
+	queue_work(system_long_wq, &mhi_pdev->recovery_work);
+	return 0;
+}
+
+static const struct dev_pm_ops mhi_pci_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mhi_pci_suspend, mhi_pci_resume)
+};
+
 static struct pci_driver mhi_pci_driver = {
 	.name		= "mhi-pci-generic",
 	.id_table	= mhi_pci_id_table,
 	.probe		= mhi_pci_probe,
 	.remove		= mhi_pci_remove,
 	.err_handler	= &mhi_pci_err_handler,
+	.driver.pm	= &mhi_pci_pm_ops
 };
 module_pci_driver(mhi_pci_driver);
 
-- 
2.7.4

