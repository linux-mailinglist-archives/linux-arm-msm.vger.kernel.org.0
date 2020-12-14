Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765FE2D99AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 15:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731900AbgLNOT4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 09:19:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440025AbgLNOTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 09:19:54 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E88BC0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:36 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id a12so16568142wrv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SQkFVpz5akWmuWPyyDeP6Bwq5eCvtJqCABU8uWkUUW8=;
        b=KfPVnnKMiGDLSeA2ZexpxK+77+GkQkkrc/Uxi0TSjcPyR6XKdZzepvIzOFG790bqBu
         h94CS6tyk0POrq9V8JZSIej6ybMO/itccr7pG30NoTFUCnaNT2sJpI2yni5MqFJDcRlO
         h8OIykV6iWGc7pvLSM8Ig188cCAbhlPRhQPYNHs8/mQrNbG3m8Aid9c8ZeAlnZLenzjZ
         mdiULvQbePf5Y4tGjwdR2Yjp6+hfudglByYktSUb1WCKS3Uf5DUgsOTwhrmVc0LXjs0i
         udBaqMl5MMeI+cU0QqGgVVZLriZsq70BFUYqTsZdrz4fyyjD0Fvw8zWL6ek5a2cVFbIS
         8Pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SQkFVpz5akWmuWPyyDeP6Bwq5eCvtJqCABU8uWkUUW8=;
        b=t2Q7H0qvgJSpkbEBQJ2C+AFszUGMHVti2xrhnhK9NKdVYfJD1rBp0WIyo6ZUF6A1m6
         mz2Kl/Rm86RLqFv8h8GQUBFUcmKw+D1VuMXomSeCyor/kCJptd3/CpAzNPWH5++y8a1U
         wvTjCJuZdykAXsjfdxsJXHaXK8Rd7rW/2yVf+OaJatWntYrGKZFlGFyl2X6PNPtD2wky
         lNeC6B9b35kQYB1C3GYiHZEcKVdMAmQxCZzTOfKHiCJk3XFAMcDyk2Wsr3xHRDpC3Rjh
         jL80kZS/bAvzv7FCNXlrq9lWB2EAByza7EIt3Ch9q3Jo5YGSmc7aSZPxwSvFJi1jfkaS
         70bg==
X-Gm-Message-State: AOAM5306zeO+cE6EU0I2T7VHXNEAsou7JtQoH8g3v3347NOua0FEDHE/
        aTkFqWTYke2UOkjhIBOHl0BudA==
X-Google-Smtp-Source: ABdhPJzLq7KS+Q7/f+FszicpY2GsBo6iRU2AAQ86z7sXApWF5xEkwwGGykTGUkpzoMR5zhy3znZK/w==
X-Received: by 2002:adf:bc92:: with SMTP id g18mr28636372wrh.160.1607955515017;
        Mon, 14 Dec 2020 06:18:35 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f2e4:25b3:2b53:52cd])
        by smtp.gmail.com with ESMTPSA id h5sm34126285wrp.56.2020.12.14.06.18.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Dec 2020 06:18:34 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 06/10] mhi: pci_generic: Add suspend/resume/recovery procedure
Date:   Mon, 14 Dec 2020 15:25:33 +0100
Message-Id: <1607955937-26951-7-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
References: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for system wide suspend/resume. During suspend, MHI
device controller must be put in M3 state and PCI bus in D3 state.

Add a recovery procedure allowing to reinitialize the device in case
of error during resume steps, which can happen if device loses power
(and so its context) while system suspend.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/pci_generic.c | 102 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 2521cd4..0936701 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -13,6 +13,7 @@
 #include <linux/mhi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/workqueue.h>
 
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
@@ -186,6 +187,7 @@ enum mhi_pci_device_status {
 struct mhi_pci_device {
 	struct mhi_controller mhi_cntrl;
 	struct pci_saved_state *pci_state;
+	struct work_struct recovery_work;
 	unsigned long status;
 };
 
@@ -313,6 +315,48 @@ static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
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
@@ -327,6 +371,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!mhi_pdev)
 		return -ENOMEM;
 
+	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
+
 	mhi_cntrl_config = info->config;
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
@@ -391,6 +437,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	cancel_work_sync(&mhi_pdev->recovery_work);
+
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, true);
 		mhi_unprepare_after_power_down(mhi_cntrl);
@@ -456,12 +504,66 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
 	.reset_done = mhi_pci_reset_done,
 };
 
+static int  __maybe_unused mhi_pci_suspend(struct device *dev)
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

