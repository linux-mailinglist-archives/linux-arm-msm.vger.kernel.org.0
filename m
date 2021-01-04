Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B40B2E963D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 14:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbhADNna (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 08:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbhADNna (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 08:43:30 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F67C06179F
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 05:42:16 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id d26so32153292wrb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 05:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EOo3BNm4x4mG1DWr8qM1BD2pKXPDPKK8io/piH3q8xM=;
        b=L6wvuTc+1u/60ET5ddZI4mKwQ7b5L/Snp5jkKl0OmWy/7Bld3JYHIRYb3bYavH9udS
         VDV3dB4gotsbgYS0+K0q2sHD3Dn7ruiiOGUf5JltnzU5Zp2aiSoSN7oHao+hNqKuy66j
         ExAhP5YBw0qMZCcRcCYqNLi9eBQhWXleIUBirRG5yGW1qQJsIdYm8OxWfCc4uoY/MsZH
         bZRd41tP5QGy2mcgjhVt1AgCjFmnkLG8Jip4kt5CNaWpRJqsNB/SbXoNxzqQ69PBBBHq
         lUxKOCeRbF4kEzA1IzEBkWJLoYll1ffbi83JbWt0U+JLRh8xpZI3Zo0yafI5TFdIebhP
         55tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EOo3BNm4x4mG1DWr8qM1BD2pKXPDPKK8io/piH3q8xM=;
        b=beDEKlW9QTg5rvTV0b9hlVD0iyLCvRb45oS/zvZu5uiJnzhLLLIOMDcgXbRmQchiDI
         Sse/84YwESMBxXeXoB6x8RtXp1ERQ5eO6B4ldOjA+zNCHVaQ65qv0IWxMj+/xXlqUc/Y
         yv2bf7xFjcAbYECGkeR/QwFP32x6YzST3LJHwG98CmUKciIZi6B6ugid8zhfi2d+Mcjn
         SCGCsc1C3ruuvr/HpLO9Fe4ybZSoZc8pWaaoJjyom6q/YT8z8NzzwSLfdkwMIihTuFD2
         k2l9xEdHUtfNaQBabKV1RL6iz4cHkdRnserbXwOkFB/zsjtyGuOYuVAdfsAUzkjQAsq5
         N5rA==
X-Gm-Message-State: AOAM530ZNs0TmIHy8Bghs4F1r88njFLAgD9bmZvRxQevvivdn+a7oZ1o
        4ttZrnrn5AQfqqUYf8ITJyfHQQ==
X-Google-Smtp-Source: ABdhPJwbXEu0EBbCPjTlWSoV6JEMQEnPBn9wtGtlA8WgINIH4jjz4IDqhX1sm8QXTAkj4wH/7vUPIA==
X-Received: by 2002:adf:97ce:: with SMTP id t14mr80328599wrb.368.1609767734920;
        Mon, 04 Jan 2021 05:42:14 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id w4sm34042968wmc.13.2021.01.04.05.42.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 05:42:14 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v7 07/10] mhi: pci_generic: Add health-check
Date:   Mon,  4 Jan 2021 14:49:36 +0100
Message-Id: <1609768179-10132-8-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
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
index 0c12027..7e54d88 100644
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
@@ -376,6 +399,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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

