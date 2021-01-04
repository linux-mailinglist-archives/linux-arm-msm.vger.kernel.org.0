Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88432E9A63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 17:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbhADQJE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 11:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729613AbhADQIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 11:08:51 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46FE4C06179A
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 08:07:34 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id y23so19838431wmi.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 08:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=34XOBF83gNVVKnvz/aUxsZHTWtTtAZLPpXEIjEVGhRo=;
        b=LpJWeo4szLK1Xt/vGxUx89bMndVwpBNdUQoN64QbsBMIOosnHL6XEYXs1qaUsW1TIm
         8clWaKJufZesuv0mQ+ydtaZC/96VNBrQxSL2qsPUg0nCIepliNS7pwXG9bAo11mr0ouN
         onY8J5tilmPzDdrTUi6G4xNZaveZDtqknAq74DPG7OBvMuCTLE9owkrhAsMxnHv3MpEM
         sTGdXEPF5a0gN/LoI4Hg/ZL6XZ0yOK/N8FTLEA207ZDPlVT6W8J9cZKEOHbkpkKpsOpn
         n/Bp9xdDUMUMJSS++j9jVarrzSg3WhR1YBaXO6xK+Vtj3BD7cYUOwcWhQrl/T8n83N+K
         75IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=34XOBF83gNVVKnvz/aUxsZHTWtTtAZLPpXEIjEVGhRo=;
        b=G/aLOnLH65Xt7mHvdHPpv7RDXGgClWzoic/9VOqSPzqpTYue+8a5gbpkWb4b0aWSlB
         uGTapTjVFRG1+prl4ot1Yli0N7aJ64mEAELaedk9hzu7t48pH6u3Cu2buPr68ofODg6B
         2LGsoX1D0znrsaevVeKOBfD4Ft5azijQ3xzNrCWJ7l7PUd8TT1oGkARUyYOMnfargelT
         8m/qQh+mMzuXHMgwNLbwjhwMO1j3bCtdy2bc9+9P16qvNEku/0PAnZgoNjI5Gao8PX1+
         jgQlT3vcGw26hynzu325WVnrJkv+CiQ+3btVCjYMeSvAkPXmQ0/noD8+ZXCj+fr5jIWi
         h7/w==
X-Gm-Message-State: AOAM531KngqRB8ET5xh7unECdermmhseefsepsRuSYyzJO4pgzOgWxqd
        MwFviBZYYfz1N2KBbUMBkY36ig==
X-Google-Smtp-Source: ABdhPJzUL2Dc4IZtSUkygeFJvatxpCZO4NYemkRI1bE4iXdP50VNG8Era79ww3D3gtZlAJWLjKIgqw==
X-Received: by 2002:a1c:7d88:: with SMTP id y130mr26906465wmc.158.1609776453013;
        Mon, 04 Jan 2021 08:07:33 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id h9sm89278049wre.24.2021.01.04.08.07.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 08:07:32 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v8 06/10] mhi: pci_generic: Add PCI error handlers
Date:   Mon,  4 Jan 2021 17:14:55 +0100
Message-Id: <1609776899-30664-7-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
References: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In AER capable root complex, errors are reported to the host which
can then act accordingly and perform PCI recovering procedure.

This patch enables error reporting and implements error_detected,
slot_reset and resume callbacks.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 50 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 2552c2e..2cc4410 100644
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

