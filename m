Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA2F2D57BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 10:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbgLJJ5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 04:57:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729811AbgLJJ4u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 04:56:50 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C84BC0611E4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:56:02 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id g185so4627815wmf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yeJ7UJTTg63FJPR9LRVHa4RUK5AEtcITdTCsHkt1rMU=;
        b=O48BMZJBZsVMM8rMj94xdWEidI3sUQhcWi1DsnmXlRLp5RK4sd56s+txR5vY4eIEZF
         kPsC7b7sfkBBGW8nTjgMIEo+sro5nYwg2NAiH/ID3PdBjHxa0CrR+yb/nfTQRzKdJJ4U
         TyvLvOxq9gRpmKSwXgk3mFcB1QdH5EDnm/+dcE40JkUal3FGEvfHXll/cuE0PteNDnGZ
         AOqSGiyOFtmANgR2gM4GBgFhwhcCoRva8JKn2PMm1UVbmqjP5tjfXCL+To8S5aMnSp26
         g1vEdGJJAcdirWMEpxtj84R7HYQWdcTerwruV99l2E4nlaLgHGLSSpFIPLgCg/6QiAKy
         zaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yeJ7UJTTg63FJPR9LRVHa4RUK5AEtcITdTCsHkt1rMU=;
        b=G3YD0wFOZhuecmiEPgVxNRDzQMb+YGI8bY6QhcGWzDdaZzMBZL1H7d/T8KfWqJXDWp
         ojf2ALBS69ml14CATpqyi4cMG7IxVD3bNj8j3wviTO7bmOet4WQu4qNTu0JDYPC/VVU1
         tSGsaZXPG5miCJc6dtTkDgXbDC9ss5mYsY0cmPLJbTQCynWX+MwRX5921cNUxecXzPdY
         3JRf7cNQfnbdBSyE4bsRlLIO8fuDCRRqO8LasnDzMeugfX/lOPo2mOWGmYaWctrCFHuf
         hzAvmoKsx3RMR3UD0SG5IZciWX16GE6L1PIqQrYqymqHV0IC9jA9wKAW0bEW8jdnRVHE
         IHbA==
X-Gm-Message-State: AOAM532Bji11CQdUaHlOjgFzGUrLYswBKkZiaVNgESwBBeBh30eLe8Xc
        KFKRdcChK5thsPWncBP+6Kulhw==
X-Google-Smtp-Source: ABdhPJymJUq9pVhAKU7GNUYtdfAastxC4hfj/xD/6GwzUBw6fhN8aUlsQ5OqrOU3TbPGpsaE7kWZuQ==
X-Received: by 2002:a05:600c:258:: with SMTP id 24mr7395600wmj.16.1607594161416;
        Thu, 10 Dec 2020 01:56:01 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:4468:1cc2:be0c:233f])
        by smtp.gmail.com with ESMTPSA id l16sm9043721wrx.5.2020.12.10.01.56.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 01:56:01 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 07/10] mhi: pci_generic: Add PCI error handlers
Date:   Thu, 10 Dec 2020 11:02:52 +0100
Message-Id: <1607594575-31590-8-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
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
index 0c16f36..04be74b 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
  */
 
+#include <linux/aer.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mhi.h>
@@ -402,6 +403,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_save_state(pdev);
 	mhi_pdev->pci_state = pci_store_saved_state(pdev);
 
+	pci_enable_pcie_error_reporting(pdev);
+
 	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
 	if (err)
 		return err;
@@ -498,7 +501,54 @@ void mhi_pci_reset_done(struct pci_dev *pdev)
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

