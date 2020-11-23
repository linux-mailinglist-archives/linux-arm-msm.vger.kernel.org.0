Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522DF2C0CBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 15:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730268AbgKWOEz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 09:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbgKWOEy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 09:04:54 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6C7C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:53 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id x22so325854wmc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1HI0pCo2+/oozX8CtYZKHUpelVlKiv7qQ+fzYe8BBCY=;
        b=sP/fqK9gPXSCZu46S6/DJRelk4wjqlqlOokVTXoYh79EBwAqifxyOdfvZyTqu2ylTW
         qKQ6Qak5DK3h/EL31UWgpwSfiaw+eDsWfpxnekAj/FRqPex6skn4u4dNOwQw5ARm1hT8
         tapQRC7YangiQQVqN6hhZ6rZ3RmXwwLS189wr3Bp5GXgC9qcSSeS/cUz07sJrSFxpams
         rmuRaY3x9rXvD4BJuOw+nPjcQcbF9jV5QKa7yLoQf/pDnQy/ZSMrrK1y8ufyebiN6ek6
         6IeC4QL/pT5JgRX05IJiogc0EG17FfNkVPz9bi+ZYpmisIn+No9AzIm2qeNdBM+23OZb
         vMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1HI0pCo2+/oozX8CtYZKHUpelVlKiv7qQ+fzYe8BBCY=;
        b=mkGfXUo2vjnKT8Q4/IgQZduBB6gYA3Ukwipsz8Q7AsubbFiWrGE6AuycHa1xzaXd1r
         YRHIalL0SZlInjfCsojYsvfdvwGpebsW/fXHntc3BCL+Tjv1D3JmLesfzBGYp4q7wNcF
         zUo9iWcSIk7vhUNFXsC9sA6d1awTXesdq9OlXKKhguPA0fnggH2iXeOAlT4dx2/SSdpJ
         TDwH697K3B4rbVsfpmxhDehko35WbJ7LTp58TYEd0vGqzDkPpR18uQLwWRENLCptthl+
         ovl3rlie3nED5xizQTYgLP5PZPMNuMtjtSDjygubQdS3mGCa1KgMW9bbr8Ze11JDmBqn
         tlsQ==
X-Gm-Message-State: AOAM531SCQJ7LKADd4hBbkQ3SSamLNdCVPaHmtdyuMy0eg824LErWa1i
        t2+KhzFAqP/rxyYwBsZ2dwwE/w==
X-Google-Smtp-Source: ABdhPJylOU2/2f/GA5GBugBfuhwTEDnUFPC1DrbxtMtztrsUBgcSolZaud7RCaeL8eMmr3InzWMcsg==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr23470936wmf.14.1606140291682;
        Mon, 23 Nov 2020 06:04:51 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f5cd:e791:e88b:e3b7])
        by smtp.gmail.com with ESMTPSA id m9sm7102727wrx.59.2020.11.23.06.04.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 06:04:48 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 7/8] mhi: pci_generic: Add health-check
Date:   Mon, 23 Nov 2020 15:11:05 +0100
Message-Id: <1606140666-4986-8-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
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
---
 drivers/bus/mhi/pci_generic.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index b01b279..3e00658 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -14,12 +14,15 @@
 #include <linux/mhi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/timer.h>
 #include <linux/workqueue.h>
 
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
 #define DEV_RESET_REG (0xB0)
 
+#define HEALTH_CHECK_PERIOD (HZ * 5)
+
 /**
  * struct mhi_pci_dev_info - MHI PCI device specific information
  * @config: MHI controller configuration
@@ -190,6 +193,7 @@ struct mhi_pci_device {
 	struct mhi_controller mhi_cntrl;
 	struct pci_saved_state *pci_state;
 	struct work_struct recovery_work;
+	struct timer_list health_check_timer;
 	unsigned long status;
 };
 
@@ -332,6 +336,8 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 
 	dev_warn(&pdev->dev, "device recovery started\n");
 
+	del_timer(&mhi_pdev->health_check_timer);
+
 	/* Clean up MHI state */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, false);
@@ -355,6 +361,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 		goto err_unprepare;
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 	return;
 
 err_unprepare:
@@ -364,6 +371,21 @@ static void mhi_pci_recovery_work(struct work_struct *work)
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
@@ -379,6 +401,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return -ENOMEM;
 
 	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
+	timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
 
 	mhi_cntrl_config = info->config;
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
@@ -429,6 +452,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
 
+	/* start health check */
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+
 	return 0;
 
 err_unprepare:
@@ -444,6 +470,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	del_timer(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
@@ -464,6 +491,8 @@ void mhi_pci_reset_prepare(struct pci_dev *pdev)
 
 	dev_info(&pdev->dev, "reset\n");
 
+	del_timer(&mhi_pdev->health_check_timer);
+
 	/* Clean up MHI state */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, false);
@@ -507,6 +536,7 @@ void mhi_pci_reset_done(struct pci_dev *pdev)
 	}
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
 
 static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
@@ -567,6 +597,7 @@ int  __maybe_unused mhi_pci_suspend(struct device *dev)
 	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	del_timer(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	/* Transition to M3 state */
@@ -602,6 +633,9 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
 		goto err_recovery;
 	}
 
+	/* Resume health check */
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+
 	return 0;
 
 err_recovery:
-- 
2.7.4

