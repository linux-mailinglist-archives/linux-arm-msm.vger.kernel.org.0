Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4F02C5806
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 16:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391296AbgKZPWX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 10:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391314AbgKZPWX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 10:22:23 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE6FC061A04
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:22 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id p22so2475182wmg.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=phsWo5rhJkqxVPJl/pJrjqtmY1DQTnnTQTDcXmRwkgA=;
        b=XsqiME4sq+d22N78uMt0i1Oq5ZWB1i3SPR62fXxjci/K9nTiYU9NDjY57J+IPCc+3U
         EvVLS/cjHajhgD9navBNBS8bLr39tzyJVs8CxbXLnfz4slr4eN9x5oi2f8z/F59Y2/8O
         rpBbNQpuxF+Lyd3y4eKWWblYaNeg36gc6c+Bmp7AUDHmAZAqzk5ZeY4olz5Td+fcvIjz
         92auzppgTd5D5GlwX1Cku024hLGljgUKFaGA6gFDyel1urE8I7jhzzp2GP8jyhGZBltH
         dGII85vVfxoE3YQR8iBdD8dwWoEfHgy2PFaeQoZaMnqZbhh+7esG1uX8vYRbmFfnns+y
         I9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=phsWo5rhJkqxVPJl/pJrjqtmY1DQTnnTQTDcXmRwkgA=;
        b=EOswnpUTJPE4YH3D+uTHLDeplnQgr0HGKnq8nMpGFGvQQcB8CZrOff/ZutMHkFz7Mt
         WpyIDcyWFzK9JiuuxnGM2aAP6UctNm57mafKXdCsmgqrWiTEJBdfPDxOPGDP/tWJkqAd
         yARGFDYijqTvjcvUfiOVofz+7XGtfOwc09SlJghIJhiz3CwD9EdDwyzgTUpo0y2Xz5fK
         ZFQhabzHKRZEm8jXaAZDL8f6SFFJmB1qUCWXO6EZlHVZXqZE53Rim2E7fTb4gYmu9Ruq
         Q0PJWpxmsxXAw+iN9ceqwIo4lC13xF1Bry47EeW5XFnds8NLdtoJBiIvsv8a7jYjaRxW
         +hwA==
X-Gm-Message-State: AOAM532j1CI799JIWijg50nywthiJijsTpCG7kpasMiQOIZ5dwJNRJKp
        bKICYstd5mNP5s1s0VVzpRvlsw==
X-Google-Smtp-Source: ABdhPJzRiGv/D/2NzUCJTk11sICaJE94sQOr7zLqxBZtAjRIysyCUrk5DPHXo86mS4misOAQ4AQXZA==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr3906056wmi.186.1606404141563;
        Thu, 26 Nov 2020 07:22:21 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id l10sm2756144wme.42.2020.11.26.07.22.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:22:20 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 7/9] mhi: pci_generic: Add PCI error handlers
Date:   Thu, 26 Nov 2020 16:29:05 +0100
Message-Id: <1606404547-10737-8-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
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
index 9919ad6..3ac5cd2 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
  */
 
+#include <linux/aer.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mhi.h>
@@ -409,6 +410,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_save_state(pdev);
 	mhi_pdev->pci_state = pci_store_saved_state(pdev);
 
+	pci_enable_pcie_error_reporting(pdev);
+
 	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
 	if (err)
 		return err;
@@ -508,7 +511,54 @@ void mhi_pci_reset_done(struct pci_dev *pdev)
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

