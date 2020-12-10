Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48802D57B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 10:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbgLJJ47 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 04:56:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729847AbgLJJ4u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 04:56:50 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C289EC0611BB
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:56:03 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id d3so4063134wmb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nl9F9FRgkpFT4WTwWLSdAjHNz9zUsK8BvjIh4l0ThtY=;
        b=H+EfUfU6BOwBmQqTmbslSGYsxLm5FNuTKPc81mIXTxk4h9kr0cX9BJ4CSmFs/nih6C
         yo8xua3UeVRDSsGFS/pBuPn+IJY9fdmD7L5y/FdeW3alqajwgWXhk2nIDneMqGYCC16/
         zIaBgeZ96rZOkcir805+1GRt8BYeRDJhginNGkoY+EPYYuSUxbmtb638UnyPmv4CiA/3
         YghO5eDNuM/iCdiSqI2AfcxR0YCHCd5kopq1s/NQJJnakebx2c1xwXemLaOg1itkOgVb
         P/+oxpaEtDOFDaGw4m55pHp8j5VLDEwGkpXO0OmHv/Tn4RHke3ceUzGS64UEntPlvQDL
         fZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nl9F9FRgkpFT4WTwWLSdAjHNz9zUsK8BvjIh4l0ThtY=;
        b=rfB8x0y3u4IwEtOZXVCRbjbvimdYi7dZ41fB4yYa5G/O5Al+iGODagrLt0L8rt1zni
         Vpng/7mkMSfmF7dgtXgk+3bt6exmwmWfG0uw/brPGTFTIz15ai23ey5rST88b1aqGKVy
         Q0qnSS5NTlXgwppjPkpSIP3K1Vtnu3OZOjnctIlfcaBf2xGFuRmyAIj7Sdw9TqlXtwMN
         Dgn5l8gzh+vvevMp+eLtZ7UfaHi5jbsChWRkWen25hRWBZKjh6NW5XmNsbLlk8BubdNV
         KY+9ZGoNMe/KCXQ+378jB//Iif7pZ8cw++ChhCgVerKwaKtRogbb847PTZMnQdCjIZSg
         6pgA==
X-Gm-Message-State: AOAM533aLBulrk03+air/zAERqPz/NCXA+2wFxuRoeYdEl3Z8YbaXjVZ
        c3SNV6DPvui1W3/sk7aOcfF/ZQ==
X-Google-Smtp-Source: ABdhPJwkKI6+kaspWprTe4HceXrzYZ/IavXUn+WiVB7zv0KB7UKXKFtvFQQslulF0RQi4lJ40aFH5g==
X-Received: by 2002:a05:600c:274d:: with SMTP id 13mr7223991wmw.77.1607594162483;
        Thu, 10 Dec 2020 01:56:02 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:4468:1cc2:be0c:233f])
        by smtp.gmail.com with ESMTPSA id l16sm9043721wrx.5.2020.12.10.01.56.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 01:56:02 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 08/10] mhi: pci_generic: Add health-check
Date:   Thu, 10 Dec 2020 11:02:53 +0100
Message-Id: <1607594575-31590-9-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
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
 drivers/bus/mhi/pci_generic.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 04be74b..b427d34 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -14,10 +14,13 @@
 #include <linux/mhi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/timer.h>
 #include <linux/workqueue.h>
 
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
+#define HEALTH_CHECK_PERIOD (HZ * 5)
+
 /**
  * struct mhi_pci_dev_info - MHI PCI device specific information
  * @config: MHI controller configuration
@@ -188,6 +191,7 @@ struct mhi_pci_device {
 	struct mhi_controller mhi_cntrl;
 	struct pci_saved_state *pci_state;
 	struct work_struct recovery_work;
+	struct timer_list health_check_timer;
 	unsigned long status;
 };
 
@@ -325,6 +329,8 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 
 	dev_warn(&pdev->dev, "device recovery started\n");
 
+	del_timer(&mhi_pdev->health_check_timer);
+
 	/* Clean up MHI state */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, false);
@@ -348,6 +354,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 		goto err_unprepare;
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 	return;
 
 err_unprepare:
@@ -357,6 +364,21 @@ static void mhi_pci_recovery_work(struct work_struct *work)
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
@@ -372,6 +394,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return -ENOMEM;
 
 	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
+	timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
 
 	mhi_cntrl_config = info->config;
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
@@ -424,6 +447,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
 
+	/* start health check */
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+
 	return 0;
 
 err_unprepare:
@@ -439,6 +465,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	del_timer(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
@@ -456,6 +483,8 @@ void mhi_pci_reset_prepare(struct pci_dev *pdev)
 
 	dev_info(&pdev->dev, "reset\n");
 
+	del_timer(&mhi_pdev->health_check_timer);
+
 	/* Clean up MHI state */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, false);
@@ -499,6 +528,7 @@ void mhi_pci_reset_done(struct pci_dev *pdev)
 	}
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
 
 static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
@@ -559,6 +589,7 @@ int  __maybe_unused mhi_pci_suspend(struct device *dev)
 	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	del_timer(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	/* Transition to M3 state */
@@ -594,6 +625,9 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
 		goto err_recovery;
 	}
 
+	/* Resume health check */
+	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+
 	return 0;
 
 err_recovery:
-- 
2.7.4

