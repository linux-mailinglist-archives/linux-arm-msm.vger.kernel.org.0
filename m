Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B072E963E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 14:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbhADNna (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 08:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbhADNna (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 08:43:30 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCDCC06179E
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 05:42:15 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id y23so19351134wmi.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 05:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YJu4FsftztdNld+v5ps46kBwzrXN2ucDSJ/S6u+qN24=;
        b=KgMgBWl8TMKs0QtdCcVQFsGA4/P2ybafTFxNsur676hsNCWurBp/KDkdiRYM4Lg/d1
         dMwOIKY95XtPFCGfvzj6dxUJDxZ2QxGI9kgINRJ2smGOJ8+DV0OqzDgjfHO3zwr9b0vj
         OuYQkv9YawsfWstxlyZrVllcohMfFOxaAuvQFz3P9lQOnoAFPcZ/04k24TJoGBYEOgbW
         sMfLAYjvY9bdJesEWOKIihR5Z8gYTGTIw5cKnCO9qN8GTgTMdwMvq//gmYla45sTTKHw
         joo6IWB98x/qhd29QF61brzu7TP0BifioE7ouq8OBLWosN/BG1BNo+KjKSNiioZaYhC8
         JAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YJu4FsftztdNld+v5ps46kBwzrXN2ucDSJ/S6u+qN24=;
        b=YPOxSNbC0YvWarIr3PjSE+lCYYR8MfdjGfhZXeq9JR93xF1zZ5pMykAQk0hRTk1p10
         1Szd6imRxXH4F6XFQVxmVRizoOskFaEYhXxirobaFq1jJMRme/gEvZygKqtZ36dsFY2F
         K02JgWhUWTw4xpRi2XQqR3MUGfIquQwFcyLZw8FLNZYhgt372hQLC0uMxBmeliYG6Oj6
         t98EwMY3jTyC9ds8ga00iP1WQtLQCMf0QgCXS9LyvuLWQYjzIvKc0xAH7S3XQfqoO0f1
         t8Akrrhgua8tYdekrFWKj17ngLZs2FlRFeA3o2YRwEbuvJunzwiZlsKykFz0EQAARNrt
         gyDQ==
X-Gm-Message-State: AOAM5324PpWpYlptWBxy2GrMSwGMkijNf6nUs+2EoaCqBj1TcziuJmp5
        WfXbxXXIDife/aYXCdO5j6s5QA==
X-Google-Smtp-Source: ABdhPJw9uE+Bcfa+ScrD2Z10RDQ1edVIQk4vFCcmd7D2sFzuEnkoniJpWSE/6vVVA7bHdp6+WFpu+w==
X-Received: by 2002:a1c:6283:: with SMTP id w125mr26663520wmb.155.1609767733925;
        Mon, 04 Jan 2021 05:42:13 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id w4sm34042968wmc.13.2021.01.04.05.42.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 05:42:13 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v7 06/10] mhi: pci_generic: Add PCI error handlers
Date:   Mon,  4 Jan 2021 14:49:35 +0100
Message-Id: <1609768179-10132-7-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
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
index 3d459f3..0c12027 100644
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

