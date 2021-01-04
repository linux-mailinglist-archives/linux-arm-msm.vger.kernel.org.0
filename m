Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7DF2E9637
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 14:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbhADNna (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 08:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbhADNn3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 08:43:29 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568A0C06179A
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 05:42:14 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a12so32183845wrv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 05:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2kCHLSwMyeWN7et3oMjoEv/8izgQd9h8l2LVl20Grzk=;
        b=hSZS6gaE3IpOyg3OCvyMlvZ1euanjHmhUXVzng/5abkhtwN7NDI9ebqQP1z7QCrBDm
         czhjw6/WpqFzmgKY74GcPLXvgLjgJM2+XzX/uHlomzb4XGm4+DDCe6+ecxqxtrvLMS9O
         InpSBBwsBA5AdEKnNnj4htbv3+NE07+lbY6NugTXCe/lzbkCM1oNQy5xOePNLUELOnGy
         QRxaa72TtZyBYbqq1nplLHwybwUIHF6QENQfCkAu+BKF3Iv0x/LT+7bGxv2YgiBIQduN
         3rwVFGrGgYt/zyL+czLTIscdfD6KGFcDOsue3eKkAg8JNJYvpEDfv3ZgiUS38Bh7hVPz
         FyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2kCHLSwMyeWN7et3oMjoEv/8izgQd9h8l2LVl20Grzk=;
        b=sAWtu7qVrnp1Gdq5HpZOQcEaiY9mSnm1smSPAeTRfKSwKlcdvT+F01RA6BVpajvft4
         4u+RTBu/FTPHUyZONKpu3W5ac0sZWj8KuhIkoLykiYFqfesN3N9taYjVlM5k/3YM1Dqf
         GETgb7gKGyx9PipJaDiIWHzJiZJxZZQJ6eQ7pv0htMQcxgdULKDOEvCCvv9qeQW0TYv7
         DOR1Oeo1Mp+VbxA61I5RI5lZFQnGBSOUEsdklFY9DXu/423Q4VWHxxDg30GQUTXaz8uf
         KIq0kboGL85nioVRsV1JyCKkv4XUj8fab9hVECwZwPKcKRE0qWQKLjanO3AYezq81frP
         mITQ==
X-Gm-Message-State: AOAM530TWHEYQKCKMb3MZ4HFU0vcKvycV6NhwWTRhx37EkX+mUdpdkqr
        mV1jwKVLwb/Ld6K0MDzR6qVh+A==
X-Google-Smtp-Source: ABdhPJzYppGV5BliFP/YpIu0JHCU7yYAUjxZz/eIO2CZ7UddfFvZa9Zy+QzDW8uc/MWWwVjOZZNbfw==
X-Received: by 2002:a05:6000:143:: with SMTP id r3mr80151368wrx.331.1609767733038;
        Mon, 04 Jan 2021 05:42:13 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id w4sm34042968wmc.13.2021.01.04.05.42.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 05:42:12 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v7 05/10] mhi: pci_generic: Add suspend/resume/recovery procedure
Date:   Mon,  4 Jan 2021 14:49:34 +0100
Message-Id: <1609768179-10132-6-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 105 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index b2307e7..3d459f3 100644
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
 
@@ -313,6 +315,50 @@ static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
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
+	dev_dbg(&pdev->dev, "Recovery completed\n");
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
@@ -328,6 +374,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!mhi_pdev)
 		return -ENOMEM;
 
+	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
+
 	mhi_cntrl_config = info->config;
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
@@ -391,6 +439,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	cancel_work_sync(&mhi_pdev->recovery_work);
+
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, true);
 		mhi_unprepare_after_power_down(mhi_cntrl);
@@ -456,12 +506,67 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
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
+
+	return err;
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

