Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C566A2E6F05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 09:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgL2Ihs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 03:37:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgL2Ihr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 03:37:47 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD450C06179E
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:32 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id 6so17221974ejz.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HRI/zQl0AztAy0cvfEZ3YruuvCxYV1sLSbd5prZLqRg=;
        b=kIjp+hniPCKZ44zRL0Vx18QRUVIzMaVsZA57pEfDai8h15VI4yo0X6CFHvY+si8l2I
         gSwqr1UV3QD0l+MRrReqScthidY58WrYvttMtrw2Xjygr/DgLe3WQeHbKMHdyGO89Sbx
         MWpYYfNtk9yepxleziZGE892T4xps+lIxqaxiUtWSXgcXNjmulAQcJ/swJ4ZQBzSmQSf
         ka7R9b80qg0QzuPida/d/LbiZ0+a04pk8rU5Hq3tZNZolsWW2/b46O0aUhYExZfuqrGX
         M+H6RIDFckZU8UycrY3+O63ni/6acoOOT1qELuZxgqiFQR91yQGqEhddk9xvlTNmxg8v
         TyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HRI/zQl0AztAy0cvfEZ3YruuvCxYV1sLSbd5prZLqRg=;
        b=msXJ7Kryd7W533AasSPH7UIg5UdE8M19nMdYBWLw5MOYu67+kWc5lEi68cFZXz/rNp
         Z5Z1svOV5hLHE/T5kUuXo9lAWwRorI8uzemHTv627UylH3onAWpIcsFrhy+d33NuVyE4
         N628wfq0wxHFhBP1NjGn+zJXsLKK1IvDNPZk6mD34ydQHLVHD3Ehs5G0JUB1e0eW2Gfk
         DxZcszc4Knv8pUEH0Y82bEgG9VOD855Zrg7uXLI5eM5MVSe48Izp2ynT1ZH84YyMmpd2
         Z0tWbnpBUqb4xdcUaYMrc8L3Co7HzkGgXg1YfXc6fkCy1LnnpDFdVHVJQNnXG8+UXfaL
         HYiw==
X-Gm-Message-State: AOAM530kKZl0xZNTGu1qykc3sbbTrG+rQ3MkHYNUQM5jqSg/bRGu2+Yo
        aurN7YOeAcO9FQnUkjonAf784A==
X-Google-Smtp-Source: ABdhPJwcIoDXnavQm8vjgJsu8R+UYQZfJNREr+td8YXevYkr84HOwWC99oYvvzMLvVdzyZM12r9Obg==
X-Received: by 2002:a17:907:da7:: with SMTP id go39mr46177746ejc.58.1609230991596;
        Tue, 29 Dec 2020 00:36:31 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:6f69:290a:2b46:b9])
        by smtp.gmail.com with ESMTPSA id c23sm37265143eds.88.2020.12.29.00.36.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Dec 2020 00:36:31 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 07/10] mhi: pci_generic: Add PCI error handlers
Date:   Tue, 29 Dec 2020 09:43:48 +0100
Message-Id: <1609231431-10048-8-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
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
index 3297d95..9fe1e30 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
  */
 
+#include <linux/aer.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mhi.h>
@@ -405,6 +406,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_save_state(pdev);
 	mhi_pdev->pci_state = pci_store_saved_state(pdev);
 
+	pci_enable_pcie_error_reporting(pdev);
+
 	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
 	if (err)
 		return err;
@@ -501,7 +504,54 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
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

