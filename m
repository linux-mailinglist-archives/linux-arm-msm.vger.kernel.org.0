Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F4E2C0CBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 15:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730255AbgKWOEl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 09:04:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730130AbgKWOEk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 09:04:40 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15928C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:40 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id e7so1178877wrv.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7hGqz0DXG1r/91eN8wyw/In0sVZggxxLUfBYKuvAK5E=;
        b=Ij/wqtdPAuSqIa8UpQMHshF277wr5EEotkqqNP39u+nX2bSIyz0Ca4847x6bj9gzWD
         u/j6gBNgfbeUMDb7YxG4F/eqr8j+2mo75wRh/iWVBHrVMq0MMtWQyrbVoqw+INaIwcY+
         sOYUvUppVhZo4Tsh79/d/xrVpJ8j4mFUU+i/+s9sxXg6jSQvPcz6VQgeOVD7P5z/21h1
         21AOeaThzhREW4NNESkkHT6uuB7VecEbd42QxQuX+QcHabzkpljY4FXg7/RFAq24VvQ8
         KnFjVIEWKWtIo+N7FWXhfA1fgVr9GBVNNA9VcgkNWqiq+PyYJbkvjYt0ADGWDntF5Zjk
         j/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7hGqz0DXG1r/91eN8wyw/In0sVZggxxLUfBYKuvAK5E=;
        b=jFkkCnUiZetYmJoqvF2BvX6yBuj5AsEAsPPrP/GYLHUVxmX7cZ4cs4Q9wg0UQRLz/6
         B/2jO+pC+gjPQOIZTT0/7KW56AChOtcRa3S2657LAPCMSvtjWAolJydF+3naSIKAA8Eq
         8u8MlXPzwRezfDKLKXcVT7ETlq/dHH/OX8JM/Z97YeBqS0M5uh+jm43kZ/tA5GtbTPtZ
         Zn0KdaUbXkTfKvdSsrLOEZ4GiVJzWHkKsw0xy9fGfYc5DMecoIxzZXlBbN2FJOnOLjjE
         xj/mchnCpQT6fKgKJprVGGaZmYMimrjmbgJXy3ICDhPXlhCjTdNYk788KBA8n9PO6XX1
         AkRg==
X-Gm-Message-State: AOAM5307Hc3k/9+HUwYMpBTnfAkuwdJDaxi4Ngng4zA0CL03rir5E6Mz
        Nr2zV21F7yylSls9d8rxB9HDSQ==
X-Google-Smtp-Source: ABdhPJySiRxwqMpcLA2eNPOa2/0eVN3zGCn+e+6NH2JJTEMvX59tNOXyxUKsl3Lp9BmdOoSS+srzHA==
X-Received: by 2002:adf:f90f:: with SMTP id b15mr31726884wrr.343.1606140278770;
        Mon, 23 Nov 2020 06:04:38 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f5cd:e791:e88b:e3b7])
        by smtp.gmail.com with ESMTPSA id m9sm7102727wrx.59.2020.11.23.06.04.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 06:04:33 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 5/8] mhi: pci_generic: Add suspend/resume/recovery procedure
Date:   Mon, 23 Nov 2020 15:11:03 +0100
Message-Id: <1606140666-4986-6-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
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
 drivers/bus/mhi/pci_generic.c | 102 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index b48c382..3eefef3 100644
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
@@ -463,12 +511,66 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
 	.reset_done = mhi_pci_reset_done,
 };
 
+int  __maybe_unused mhi_pci_suspend(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+
+	cancel_work_sync(&mhi_pdev->recovery_work);
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

