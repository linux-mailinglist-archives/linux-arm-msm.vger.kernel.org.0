Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6CBB2D99AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 15:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440025AbgLNOT4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 09:19:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440033AbgLNOTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 09:19:54 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A30C06179C
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:35 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id 190so3622481wmz.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=A8ghSZC0o/frzSbWNus1KBuo0kNzFEb9nrR9JTZVUY8=;
        b=DZIM9YJfKhpnscyFz4qfCprhv5PizD2Bsbgb2e+lHLVNting01MbTYAPY6JbFDy3I0
         69mLqJGlFZa0ow69vxsO5ZpaBZHrdEVxeNr74bY2PNRDgsqjoU/lM+vfceRROMl0SKmV
         JMIyZNA3ATLtqPbj2Ki8cUVwRZUbZNpSeyUwYkUipir8/bXnC7CvbP1TkSqdpS0EWyzf
         iSgzL75UJOZWxPFlOc36YGcz+Gq74vnzI9rYEqHk8LB2uyJ3d6wV4rkK1ysosZ1UG23y
         v6+ZGoBIKGjwx+wswEdsk388p2Kru13WBM5z847dp/9iLuKMthmUHKe1Px+D1/a5rtYd
         Nd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=A8ghSZC0o/frzSbWNus1KBuo0kNzFEb9nrR9JTZVUY8=;
        b=cj1KiJ1fneQ61zm7CwlGNWC9WTY9qfT6oMMM2mHwry/3RGlFRGiIZXF7TNJdqcvBHG
         0V3hIv2WPazMh99FEWa25wPXFpqFCGryERljRV+y8h8zaEt0pXHRcldLNnqo+zTlPKrl
         4xi4ZZpMOw2qHd+lyuSuQhY3q9A8BAO+0fETX4eet/ZW+KAkd0GHtA97ViWT8TQjZuDK
         84l289G9mlZYVBeKBQkg3mkIin2bkzcOvj1LQ3UuiRuQh9rRUfL12VuirSqe/08ntf5m
         XyBEYHTOAl4WaxjNUn4OFxhqgEefow3CdaOyOo+cqDSsiG00kyZDdDJfVsOKaayqlqhf
         GB4g==
X-Gm-Message-State: AOAM5301ojJoxIAdmibZ4oSFi8OShoZQN3reVdzpUacbv+5UUZAei60b
        qSUTpVU8Z6mtxF1DRKYPz9CfAA==
X-Google-Smtp-Source: ABdhPJw4lqR07xXs1YksW6s+/JruZpMvOgPHfhi2nyXlNlFXcMRfBOt2uQNbAvHjKoqbe+XCJRkCHg==
X-Received: by 2002:a1c:e3c4:: with SMTP id a187mr27686834wmh.58.1607955514129;
        Mon, 14 Dec 2020 06:18:34 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f2e4:25b3:2b53:52cd])
        by smtp.gmail.com with ESMTPSA id h5sm34126285wrp.56.2020.12.14.06.18.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Dec 2020 06:18:33 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 05/10] mhi: pci_generic: Add support for reset
Date:   Mon, 14 Dec 2020 15:25:32 +0100
Message-Id: <1607955937-26951-6-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
References: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for resetting the device, reset can be triggered in case
of error or manually via sysfs (/sys/bus/pci/devices/*/reset).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 121 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 108 insertions(+), 13 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 077595c..2521cd4 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
  */
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mhi.h>
 #include <linux/module.h>
@@ -15,6 +16,7 @@
 
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
+#define MHI_POST_RESET_DELAY_MS 500
 /**
  * struct mhi_pci_dev_info - MHI PCI device specific information
  * @config: MHI controller configuration
@@ -177,6 +179,16 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
 
+enum mhi_pci_device_status {
+	MHI_PCI_DEV_STARTED,
+};
+
+struct mhi_pci_device {
+	struct mhi_controller mhi_cntrl;
+	struct pci_saved_state *pci_state;
+	unsigned long status;
+};
+
 static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
 			    void __iomem *addr, u32 *out)
 {
@@ -196,6 +208,20 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 	/* Nothing to do for now */
 }
 
+static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
+{
+	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
+	u16 vendor = 0;
+
+	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
+		return false;
+
+	if (vendor == (u16) ~0 || vendor == 0)
+		return false;
+
+	return true;
+}
+
 static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 			 unsigned int bar_num, u64 dma_mask)
 {
@@ -291,16 +317,20 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
 	const struct mhi_controller_config *mhi_cntrl_config;
+	struct mhi_pci_device *mhi_pdev;
 	struct mhi_controller *mhi_cntrl;
 	int err;
 
 	dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
 
-	mhi_cntrl = mhi_alloc_controller();
-	if (!mhi_cntrl)
+	mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
+	if (!mhi_pdev)
 		return -ENOMEM;
 
 	mhi_cntrl_config = info->config;
+	mhi_cntrl = &mhi_pdev->mhi_cntrl;
+
+	mhi_initialize_controller(mhi_cntrl);
 	mhi_cntrl->cntrl_dev = &pdev->dev;
 	mhi_cntrl->iova_start = 0;
 	mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
@@ -315,17 +345,21 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
 	if (err)
-		goto err_release;
+		return err;
 
 	err = mhi_pci_get_irqs(mhi_cntrl, mhi_cntrl_config);
 	if (err)
-		goto err_release;
+		return err;
+
+	pci_set_drvdata(pdev, mhi_pdev);
 
-	pci_set_drvdata(pdev, mhi_cntrl);
+	/* Have stored pci confspace at hand for restore in sudden PCI error */
+	pci_save_state(pdev);
+	mhi_pdev->pci_state = pci_store_saved_state(pdev);
 
 	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
 	if (err)
-		goto err_release;
+		return err;
 
 	/* MHI bus does not power up the controller by default */
 	err = mhi_prepare_for_power_up(mhi_cntrl);
@@ -340,33 +374,94 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto err_unprepare;
 	}
 
+	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
+
 	return 0;
 
 err_unprepare:
 	mhi_unprepare_after_power_down(mhi_cntrl);
 err_unregister:
 	mhi_unregister_controller(mhi_cntrl);
-err_release:
-	mhi_free_controller(mhi_cntrl);
 
 	return err;
 }
 
 static void mhi_pci_remove(struct pci_dev *pdev)
 {
-	struct mhi_controller *mhi_cntrl = pci_get_drvdata(pdev);
+	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+
+	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
+		mhi_power_down(mhi_cntrl, true);
+		mhi_unprepare_after_power_down(mhi_cntrl);
+	}
 
-	mhi_power_down(mhi_cntrl, true);
-	mhi_unprepare_after_power_down(mhi_cntrl);
 	mhi_unregister_controller(mhi_cntrl);
-	mhi_free_controller(mhi_cntrl);
 }
 
+static void mhi_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+
+	dev_info(&pdev->dev, "reset\n");
+
+	/* Clean up MHI state */
+	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
+		mhi_power_down(mhi_cntrl, false);
+		mhi_unprepare_after_power_down(mhi_cntrl);
+	}
+
+	/* cause internal device reset */
+	mhi_reg_soc_reset(mhi_cntrl);
+
+	/* Be sure device reset has been executed */
+	msleep(MHI_POST_RESET_DELAY_MS);
+}
+
+static void mhi_pci_reset_done(struct pci_dev *pdev)
+{
+	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+	int err;
+
+	/* Restore initial known working PCI state */
+	pci_load_saved_state(pdev, mhi_pdev->pci_state);
+	pci_restore_state(pdev);
+
+	/* Is device status available ? */
+	if (!mhi_pci_is_alive(mhi_cntrl)) {
+		dev_err(&pdev->dev, "reset failed\n");
+		return;
+	}
+
+	err = mhi_prepare_for_power_up(mhi_cntrl);
+	if (err) {
+		dev_err(&pdev->dev, "failed to prepare MHI controller\n");
+		return;
+	}
+
+	err = mhi_sync_power_up(mhi_cntrl);
+	if (err) {
+		dev_err(&pdev->dev, "failed to power up MHI controller\n");
+		mhi_unprepare_after_power_down(mhi_cntrl);
+		return;
+	}
+
+	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
+}
+
+static const struct pci_error_handlers mhi_pci_err_handler = {
+	.reset_prepare = mhi_pci_reset_prepare,
+	.reset_done = mhi_pci_reset_done,
+};
+
 static struct pci_driver mhi_pci_driver = {
 	.name		= "mhi-pci-generic",
 	.id_table	= mhi_pci_id_table,
 	.probe		= mhi_pci_probe,
-	.remove		= mhi_pci_remove
+	.remove		= mhi_pci_remove,
+	.err_handler	= &mhi_pci_err_handler,
 };
 module_pci_driver(mhi_pci_driver);
 
-- 
2.7.4

