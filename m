Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D761C2C0CBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 15:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730130AbgKWOEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 09:04:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbgKWOEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 09:04:49 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33ABC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:48 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id x13so7768690wmj.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aJwDuVuDFzYWlPenmYT+5y0gUc768gX0/h1SRlfw534=;
        b=PIA6xLj/8vNx/bL0HZ4na6bXLvf+MZ4FMhXEzk/7lqgCB26v1M+tLqyC6a9ctOrBEf
         bvRPNLGHwZEWFtjlQLuang9avRIb/jUcncHRLy+t4lMNBnIxP8ZAF29PrqHpVS5svg3Q
         pPe+tlavqfbkIY339v3ksNlqfc3OBDmruEQlrpaGbkUUDcZXQl078dvDo1xw+hJrkMtI
         AWHT5nLWDYHItHegMjeR5Np+KM7A4UgrMXOFEqQ6Iy5n89QEqXfGFuj+xy7YRmPH2oGG
         zbzF/bb11PgxTTOh6S6oVLiqdx2aj7z/tiJOYOJ/AUtaiNRkW/Gxo9jWm/I12rMJEktW
         oiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aJwDuVuDFzYWlPenmYT+5y0gUc768gX0/h1SRlfw534=;
        b=Uos9r+tU+aLedBwBVC1FJm+3jL4KnLOF5PcpHaVEkMXFvBrbnFSrD+oiWfb5pdjl/Q
         IldqaKrbUQd9TJfzNCwxhVjXPaZRCe6ltSR5wjmW8vkOSCIoK4/Xq7O5NcjqR8lDaX7D
         4++z78rTM8ayJPRBIYPYerJTpP9fTJT9qhn21mk9HRGZdcdUALKtV06B5yULc0a9QNrb
         JGqLSHWXMcHHXPV8zKRyRXurfRhwR0KHuFXIKxqpYOSEojB0wBQGECq1kYGypTvdIg5L
         i0dmojeoz5kjOmK7M0g9GucccqefHM/7WFdb6cmQpkR1WPJNZQyEXtljSuRyJbykHCZK
         LCmQ==
X-Gm-Message-State: AOAM531fH+jpyxx/cxt//aikXuI80Vgc02AHWXae8AGDsGujvoDEWnDp
        H0lNtOGWY1yp7SMqyg+/Za5kBw==
X-Google-Smtp-Source: ABdhPJziTrG2It8azXuYmHGdyA0Wyx/OsjfYDPGh/dqFRdfJxBKSjamEbaWD5gJyJmSwbf+XOpb3FA==
X-Received: by 2002:a1c:61c2:: with SMTP id v185mr23735520wmb.152.1606140287652;
        Mon, 23 Nov 2020 06:04:47 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f5cd:e791:e88b:e3b7])
        by smtp.gmail.com with ESMTPSA id m9sm7102727wrx.59.2020.11.23.06.04.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 06:04:44 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 6/8] mhi: pci_generic: Add PCI error handlers
Date:   Mon, 23 Nov 2020 15:11:04 +0100
Message-Id: <1606140666-4986-7-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In AER capable root complex, errors are reported to the host which
can then act accordingly and perform PCI recovering procedure.

This patch enables error reporting and implements error_detected,
slot_reset and resume callbacks.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 50 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 3eefef3..b01b279 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
  */
 
+#include <linux/aer.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mhi.h>
@@ -407,6 +408,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_save_state(pdev);
 	mhi_pdev->pci_state = pci_store_saved_state(pdev);
 
+	pci_enable_pcie_error_reporting(pdev);
+
 	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
 	if (err)
 		return err;
@@ -506,7 +509,54 @@ void mhi_pci_reset_done(struct pci_dev *pdev)
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
 }
 
+static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
+					       pci_channel_state_t state)
+{
+	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+
+	dev_err(&pdev->dev, "PCI error detected, state = %u\n", state);
+
+	if (state == pci_channel_io_perm_failure)
+		return PCI_ERS_RESULT_DISCONNECT;
+
+	/* Clean up MHI state */
+	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
+		mhi_power_down(mhi_cntrl, false);
+		mhi_unprepare_after_power_down(mhi_cntrl);
+	} else {
+		/* Nothing to do */
+		return PCI_ERS_RESULT_RECOVERED;
+	}
+
+	pci_disable_device(pdev);
+
+	return PCI_ERS_RESULT_NEED_RESET;
+}
+
+static pci_ers_result_t mhi_pci_slot_reset(struct pci_dev *pdev)
+{
+	if (pci_enable_device(pdev)) {
+		dev_err(&pdev->dev, "Cannot re-enable PCI device after reset.\n");
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static void mhi_pci_io_resume(struct pci_dev *pdev)
+{
+	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
+
+	dev_err(&pdev->dev, "PCI slot reset done\n");
+
+	queue_work(system_long_wq, &mhi_pdev->recovery_work);
+}
+
 static const struct pci_error_handlers mhi_pci_err_handler = {
+	.error_detected = mhi_pci_error_detected,
+	.slot_reset = mhi_pci_slot_reset,
+	.resume = mhi_pci_io_resume,
 	.reset_prepare = mhi_pci_reset_prepare,
 	.reset_done = mhi_pci_reset_done,
 };
-- 
2.7.4

