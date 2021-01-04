Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA1D2E9A61
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 17:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbhADQJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 11:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729614AbhADQIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 11:08:51 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846E2C061796
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 08:07:33 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id q18so32751993wrn.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 08:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=i+nXOsRRfuAtpnA3uXgsRZmPRSsd7wECnNCxfQNlAfM=;
        b=sqGu3Jegtum2/EQUFnAqPWWabqbYcaEJEFUQMdcFEa3kbXB0U/vi8ZC6fzieL1M6BQ
         DlP7N7XUbqLwziKu8HuXrdh0w2mPxHD+NuBTLUudsIkBQr8pDajG5NUudulCxf58Or3E
         58wSE3AaXywMBjE5TaPcAb2cf39i5ueeZaIad0drV3jWqH+FFaajiBOJxmYuDQTnjWcz
         r5zuAzi+dqM/nZ5GjluDXS/2hmaQ/gS/jOOlfcrBfo8LgbYKh4HndQa9QNApQ+/EK606
         gumHZwt9ZRQAFyLUJKFPx9Z92TW2CCIkHX/NDwymNqKrauoO0cmtxBDq8JRe6ecKdIyi
         Favw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=i+nXOsRRfuAtpnA3uXgsRZmPRSsd7wECnNCxfQNlAfM=;
        b=MAUxV5zsq3cbDlVMIZ/bX6COuPG6caOiQCU9KgeATG3WHWPijuCBg9HSWanUi+Sguf
         L1wOsvX/L/2Tx6GPIatk6wCP7TYtLmE5wXKMy7VoE/RkBkNB89WJ+oSuHfz0pWVXIS4P
         rjKiDf1RQaBPogkHYDAyDi160/HtabqDFLxXmkYCXCH2nvKueVhEXoSnuc5JqRh2sOf1
         gp6n9pFBggMiZ/9+rPxPrn+RUvHVyf4Bnp/5FdLLARvsT8YnQBlk+gc2jwBI5Tu8HdDa
         ZHsknHEWLhWvDje7xlJgYT4bNggcsRr8bUAvurne1STFjrpq0Ht9PxeX9AyYvyr+hNYx
         e+qQ==
X-Gm-Message-State: AOAM532mf4Pl0Pzwze/4SEcbHcu7cZvvQgHGTRk20Pfn2amnsmlgZO7i
        SKLyRzjhnfRpBJwKMltPmsyDiA==
X-Google-Smtp-Source: ABdhPJyVKzQiCg8KgdeuiNpztZn0JPCrty5dufP4bRjXas2YV9CpXXPQdmjo2b6oHBzDqDW1477HqQ==
X-Received: by 2002:a5d:660b:: with SMTP id n11mr80856024wru.407.1609776452238;
        Mon, 04 Jan 2021 08:07:32 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id h9sm89278049wre.24.2021.01.04.08.07.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 08:07:31 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v8 05/10] mhi: pci_generic: Add suspend/resume/recovery procedure
Date:   Mon,  4 Jan 2021 17:14:54 +0100
Message-Id: <1609776899-30664-6-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
References: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
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
index f0dfa62..2552c2e 100644
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

