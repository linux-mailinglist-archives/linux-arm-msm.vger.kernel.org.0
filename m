Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190912B1DCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 15:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgKMOxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 09:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgKMOxg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 09:53:36 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97093C0617A6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:36 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h62so8733366wme.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sb+B+lk24n6McXkJFe00J2bKZLycBjlElhhwfCEx/hk=;
        b=iEz9zGVkrlDcroA0Uh0c4YhUpiJ8TzhgEnGDcId39+huk6uEGoliT7D8K960lfKu7G
         PLt2euGIqFjnHMZBj6qlmET4lsWIHxVL5wzkbvNw7pTwsdVnmcY9N7T0zsRkrxX4WtQ4
         HRGG8/GZjDf8RP/nPxlratvMJva8QHgzeV0rAVxAba27rCMiVipEo++lP1Rst7HSvoIw
         DLXAMmQgTk7z4G5DrORk0S1iKgiLNChpV3F0lbwdX8+hnd1y1V5RGeOY5IK1p3nZ4wW8
         4xu09wFo1GxDRL2wj/pfxs2t72QEfRIuwwR0eflXqClvwz9e+ZBy5Rv6ha4F825b7gHC
         ivuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sb+B+lk24n6McXkJFe00J2bKZLycBjlElhhwfCEx/hk=;
        b=IW34qVvraT5WI5YbnLjIWBrARWBs303n9C+t8M+M5ae/Gr356PmHQf2kTdv5dxMsnx
         J7prJZgU9KHlNzALWzKoMI0qXoKO4rjtKz3QRueznagmqLDZVOwuo08sVANDpDkpBfzl
         +/mR9aZxk2r1yJAHqJ9zOgg8jAlutOhQCKWXkPA0qoCe/VEw3nZ2Ua3ISUi1m7Daculj
         +ZH9yoDtDR5gZV9FsFuoeywWWPrlBDQiivGWQvGttn3fcdTXcwWSlN6F6Z5byPItlwzF
         WV+4Lw3Miwbc6gxNPOV+4NXL58rrOux17ZQUDXWz2oG2RN6ihb721fiB5W1NglhIKjoX
         /1MQ==
X-Gm-Message-State: AOAM533H8hqNB6Lb9ftDFqBghHfCkA8/S93erIxLHFf+GzzkE2ciRRHy
        hG59E+xz6EodG0HOiLIS4hTT/Q==
X-Google-Smtp-Source: ABdhPJwnxk1r55bu0UyY6vaS0nwF9YVZanEm2gSrcYpfjSLsMQjeeIehISFsMnYwreQidh7D1h2EZg==
X-Received: by 2002:a1c:a5d8:: with SMTP id o207mr2973527wme.0.1605279215333;
        Fri, 13 Nov 2020 06:53:35 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:304f:e9d4:6385:8ac5])
        by smtp.gmail.com with ESMTPSA id i6sm10729341wma.42.2020.11.13.06.53.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 06:53:34 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 6/8] mhi: pci_generic: Add PCI error handlers
Date:   Fri, 13 Nov 2020 16:00:00 +0100
Message-Id: <1605279602-18749-7-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
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
index 75f565b..a7fbba5 100644
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

