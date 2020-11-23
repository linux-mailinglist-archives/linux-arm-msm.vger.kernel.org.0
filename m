Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF9E2C0CBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 15:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730232AbgKWOEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 09:04:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730130AbgKWOEf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 09:04:35 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFAA3C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:34 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id a186so15186303wme.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dQci3mBBoR0tqqcwGOSS/7KOqdTfROUDHNeFyEKodBo=;
        b=LFB+qPMHlWpiQk6y0xgQO8Jy1uMq+Ygq6fFfnU/vAs12KP8o0ZV+/zcCT6HRpknKoA
         plVgFZDJn+TEDkqZusrzQ+Eu2Ve+9cSIvaTlxbxlsiyXuThtNuOGrfSQrZAZOtWmtVre
         q5z6iC1jKTLqG2hG7fmUbES/+TLwYcneVFeqdbMg0TZofqrAW21ysRhC8wv4kfz5ZWCo
         nvYNk72CK7fMtitr4tlsS+2H9hAvheO24c5umCZfgilqbZbb+nsm1O3CqtU2GyjX6sm0
         kQsuSA+8z/HvM1UGwhExAi8duRF+vRsoWbZbBEgOaJsLqaP55g57drSJuPNce4HQ7BUS
         lF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dQci3mBBoR0tqqcwGOSS/7KOqdTfROUDHNeFyEKodBo=;
        b=lAcWtK0uJU2Hme661ea4mZcE7e9sIlUg2fESg9SYMpF3kxEIqvbDoPuX1v6DrPyiev
         eEe2mPj313oKUHSTi3+WGYykuDN6z/Q9CErT66XVdH/Q//qEaesxeTnWQ51xv/wEHWu/
         kesZ9lYaFsXQzsHHZtYHeuWcukjTJRbf/QiInmeaKVg6DSnLAeOwcA40xW/Aua5kR7Ri
         FBhKx5r6ciMCTH5hkW/t72xXnQTauI7wuPATbHRmTV+4EVuRW8GHiXNRPKqQw1+2gADU
         gmx2UiTIPzhZPMc51rTm+P8cs3dIUKqK2V+ZYcpUZ3VTL+CMAgI3lTEiwvjXns4R933c
         jQKA==
X-Gm-Message-State: AOAM5318fo8yk0ETp5BJ9ja3hlRqu32p+5aU6t74zVXEXKptYuxstSNX
        uzL+FFY1iDJV6h2KO/UFNzGucHOD75Z5teRAtZE=
X-Google-Smtp-Source: ABdhPJxJ8XVgxW7OpIgif+CcC9LGyT1+JjSciq5mshG6dRBvtCyhwmIy6nsD8/Q00yP/RMPEvDPkfQ==
X-Received: by 2002:a7b:c015:: with SMTP id c21mr24651646wmb.79.1606140272963;
        Mon, 23 Nov 2020 06:04:32 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f5cd:e791:e88b:e3b7])
        by smtp.gmail.com with ESMTPSA id m9sm7102727wrx.59.2020.11.23.06.04.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 06:04:30 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 4/8] mhi: pci_generic: Add support for reset
Date:   Mon, 23 Nov 2020 15:11:02 +0100
Message-Id: <1606140666-4986-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for resetting the device, reset can be triggered in case
of error or manually via sysfs (/sys/bus/pci/devices/*/reset).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 117 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 104 insertions(+), 13 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 0c07cf5..b48c382 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
  */
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mhi.h>
 #include <linux/module.h>
@@ -179,6 +180,16 @@ static const struct pci_device_id mhi_pci_id_table[] = {
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
@@ -203,6 +214,20 @@ static inline void mhi_pci_reset(struct mhi_controller *mhi_cntrl)
 	writel(1, mhi_cntrl->regs + DEV_RESET_REG);
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
@@ -298,16 +323,18 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
 	mhi_cntrl->cntrl_dev = &pdev->dev;
 	mhi_cntrl->iova_start = 0;
 	mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
@@ -322,17 +349,21 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
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
@@ -347,37 +378,97 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
 
 	/* MHI-layer reset could not be enough, always hard-reset the device */
 	mhi_pci_reset(mhi_cntrl);
+}
+
+void mhi_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+
+	dev_info(&pdev->dev, "reset\n");
 
-	mhi_free_controller(mhi_cntrl);
+	/* Clean up MHI state */
+	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
+		mhi_power_down(mhi_cntrl, false);
+		mhi_unprepare_after_power_down(mhi_cntrl);
+	}
+
+	/* cause internal device reset */
+	mhi_pci_reset(mhi_cntrl);
+
+	/* Be sure device reset has been executed */
+	msleep(500);
 }
 
+void mhi_pci_reset_done(struct pci_dev *pdev)
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

