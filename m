Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31882D99AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 15:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440037AbgLNOT4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 09:19:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440034AbgLNOTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 09:19:54 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC49C0617A7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:37 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 91so16572236wrj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S8Vz3+deGb93+mWrPvYJGVU2WIAkVuBlEajZVdacAuo=;
        b=QNDgGHdTYCp9W2u1m6Zf7bM9gDys3YKtPrt3yC6niUomcomswTVYajt6YCvLvljK2G
         ZPY4d5RY5RiWfg+lHzAQuoBc5dzsiXfV4BiirS2Usn9gWYwkKq8ZNZWFY8MRN+3a6GQ+
         IkOlRXq2ItSPelfuzhibNJ8roXwxqpiFGzlcaULWBjMDKdZSokWBRQrQUAfemVqAuCmu
         1Xs+LqkxG+5Dn4OYWyI+yuNXEbrW7yzfpkJVbpMkPX4iJrHO0UVOkYoT8qGVMuy8dhBt
         BqYSmAZDmjiCYvCUw3h6j/mEdXX9oNZuWDKH8xHnTXydefy9j8pkumzXph67X4X6kAbD
         X3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S8Vz3+deGb93+mWrPvYJGVU2WIAkVuBlEajZVdacAuo=;
        b=g8W5orYyOmSswR5qINz/HR5BiCf7dZ/w4dbFVCk9Ajxx4wsQst+VQdKGRa//gTQzTE
         3bTWEXBvY6H2YNxiPOtUpK6xXz4/5btEgQ2ciomQrGc2xcUSY4/MiTh37nAdLtWb0C6t
         ro271MXjcTIMmlNhVszXDXwGzhLDKPlP0U5mK9mx35ebQ+Mft4uCWT10WAG+Zo5xbMea
         Ymc41K7stROChIPInqrlFc9lFVKnVR4Orv5x6Sv4djdMz0rSTjxO2fWBykeY43Hfx8uB
         153Av89rDdjSJp236euUQjltNezgU1WJJA3HEMPSYFFP9J801KxTJ2YAiVnrn7q8N6dw
         301w==
X-Gm-Message-State: AOAM531aMDw8LInE4A7XC7C2/cq9WYfiuikzmg7fNWfUst4MIKnDwVt4
        qi9XJ35zDGwLaM/envkZI2sXVg==
X-Google-Smtp-Source: ABdhPJzNpENL75w2LeGFz1fzu8RsgEVZP8iHH3BQvNe8lCwcryYvUSHeGATdnGzsT6KaHsv9pTTY6g==
X-Received: by 2002:adf:8b15:: with SMTP id n21mr28746992wra.426.1607955516016;
        Mon, 14 Dec 2020 06:18:36 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f2e4:25b3:2b53:52cd])
        by smtp.gmail.com with ESMTPSA id h5sm34126285wrp.56.2020.12.14.06.18.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Dec 2020 06:18:35 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 07/10] mhi: pci_generic: Add PCI error handlers
Date:   Mon, 14 Dec 2020 15:25:34 +0100
Message-Id: <1607955937-26951-8-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
References: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In AER capable root complex, errors are reported to the host which
can then act accordingly and perform PCI recovering procedure.

This patch enables error reporting and implements error_detected,
slot_reset and resume callbacks.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/pci_generic.c | 50 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 0936701..b4a68bd 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
  */
 
+#include <linux/aer.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mhi.h>
@@ -403,6 +404,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_save_state(pdev);
 	mhi_pdev->pci_state = pci_store_saved_state(pdev);
 
+	pci_enable_pcie_error_reporting(pdev);
+
 	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
 	if (err)
 		return err;
@@ -499,7 +502,54 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
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

