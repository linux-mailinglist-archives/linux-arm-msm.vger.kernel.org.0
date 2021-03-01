Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCBA328368
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 17:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237701AbhCAQS2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 11:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237707AbhCAQRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 11:17:46 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452FBC06178C
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 08:17:04 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h98so16741985wrh.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 08:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jsyqTAbWOYH12GXgEyrYcHvBDKRbWqhbbW9V0ah26q8=;
        b=LYrj+8dViEblyipd9eQYcPBVxLZ0F2kn/VARIc0tBvRCYrgQ7sLbNNuAY8wq3exZtN
         sTdCc32UUX3xjY5UyhSM/YhvBo3It2i2XnudGnlRLy5qujddWTDrCYtv5L34gK7HAlRU
         fhDra+biZzv+0l78csdWYuUHMUn9JwrbPQeBeEz8pVKQnojWqhXBBVjn1IWTr2Kj2Dod
         QdIfmzb7zOVBXTpzcJcxIGIK89QPuXyLCIuboGTEeSTv8sYDOGNRSPzzgo7RWFXCvYCZ
         gmJuLUAfI32TLHepGnMfqSTmstE/rIEWYVjLpFYSVIVRfVlwa3i7j2mso9ptaRJ0RfsA
         fImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jsyqTAbWOYH12GXgEyrYcHvBDKRbWqhbbW9V0ah26q8=;
        b=jsAK/NC1O31ZYDGd3E7UaC53y9Whmx1vvq5PSKSLq+1bD6dxAfVDd0pd8BDs+6wDTq
         J69jYLQIZi8hqrfOrm1EzYuuInjWz1uKY0y2LrC9At6OMfm8lwLuko1U/erNNVFse1K4
         wUfX1TXCqCPPTnp0JoE4iiRiLGbdMYJtne6vrC06U/eGwXEcNnyYmuFoCFvgKv/McBH+
         YnntW6GDq7UkYWrBbuLvaeA8LOXX0P1HxX7BMwPJQ1aQCmnKN0zDccJeJU2I/yRWUmqZ
         Xyriq+sqaF3X+rTFrZvLamrSqhJ6nvwTgf//2S4e4xTqtstB12eiqVLg68ddQTt+zed2
         N1/Q==
X-Gm-Message-State: AOAM5326sj2boUf+5uBMuOadAiwbSkfx9LWm1zSH7f0uYi2AOTrQg6ms
        3rby/A6ThdfmIUkCyJrE0JORag==
X-Google-Smtp-Source: ABdhPJzrSwqxG/awT6tAQVUOm2TYgrnU0/Q2GYtlsUNHATV15u+HesJR5rA1SaXIwvNAS1hpjkS5yA==
X-Received: by 2002:a5d:61c9:: with SMTP id q9mr8896966wrv.219.1614615423014;
        Mon, 01 Mar 2021 08:17:03 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:5a20:c00c:6ec3:cc84])
        by smtp.gmail.com with ESMTPSA id w6sm3919789wrl.49.2021.03.01.08.17.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 08:17:02 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 5/6] mhi: pci_generic: Use generic PCI power management
Date:   Mon,  1 Mar 2021 17:25:10 +0100
Message-Id: <1614615911-18794-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
References: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PCI core can take care of proper PCI suspend/resume operations, but
this is discarded when the driver saves PCI state by its own. This
currently prevents the PCI core to enable PME (for modem initiated
D3 exit) which is requested for proper runtime pm support.

This change deletes explicit PCI state-saving and state-set from
suspend callback, letting the PCI doing the appropriate work.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 8423293..2a66f80 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -544,9 +544,12 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	pci_set_drvdata(pdev, mhi_pdev);
 
-	/* Have stored pci confspace at hand for restore in sudden PCI error */
+	/* Have stored pci confspace at hand for restore in sudden PCI error.
+	 * cache the state locally and discard the PCI core one.
+	 */
 	pci_save_state(pdev);
 	mhi_pdev->pci_state = pci_store_saved_state(pdev);
+	pci_load_saved_state(pdev, NULL);
 
 	pci_enable_pcie_error_reporting(pdev);
 
@@ -717,10 +720,8 @@ static int  __maybe_unused mhi_pci_suspend(struct device *dev)
 	/* Transition to M3 state */
 	mhi_pm_suspend(mhi_cntrl);
 
-	pci_save_state(pdev);
 	pci_disable_device(pdev);
 	pci_wake_from_d3(pdev, true);
-	pci_set_power_state(pdev, PCI_D3hot);
 
 	return 0;
 }
@@ -732,14 +733,13 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 	int err;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	pci_set_master(pdev);
-
 	err = pci_enable_device(pdev);
 	if (err)
 		goto err_recovery;
 
+	pci_set_master(pdev);
+	pci_wake_from_d3(pdev, false);
+
 	/* Exit M3, transition to M0 state */
 	err = mhi_pm_resume(mhi_cntrl);
 	if (err) {
-- 
2.7.4

