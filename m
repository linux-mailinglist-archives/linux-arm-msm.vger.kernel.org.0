Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B422032F382
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 20:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhCETIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 14:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbhCETI1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 14:08:27 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41E3C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 11:08:26 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h98so3201345wrh.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 11:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=faIAP9pFaeyTPsM83fpq3GbW4v6kwIcv7zej+9Y4PP0=;
        b=qef7gdpTjh4V3ABvN98nFLaz40lUaTKPndB603NyEChTzqYTNiVEwGWWyl8ueJ1qWO
         i3wCaLGHJ+PEzpJb/5sn36zAlfJZZ5XDWKDjGJFkqpcVd6ApZXxdfJh17T2mR45Cxpa8
         9TPouScARKnA4CCRBuaajTcBbxsswvzv6kwjfTQAlQIseB2mY4D9J9xvvjzt9VztVOc7
         1ATQLiYuE4xvzoIZpwL6RnNTVKi6/W17YdCHgoskcNB6Og5bfFCqszVzkAXNVaZ9s7YY
         d86vpuITNA90JpL6Yh0wpM4MuOETBI5YX+I0mi2SAwGKK+bmxRqqg2ymyOc4WGh0MJZi
         LdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=faIAP9pFaeyTPsM83fpq3GbW4v6kwIcv7zej+9Y4PP0=;
        b=qL1W4dJBxFlEo7l9YiOJReW6lm+Qg5l5/cp/hKv5vrldr04tGYeOtkIO3vjLwhIXTY
         6kT7ZAv7EInHVflXskcdVucciU3wpagn7bhw4GyJR3ej4VU0sfkO6q01An7rZaMb1lhD
         U7lw8OIoyKTspKOpBTSBHYzCQKmFDMMxA2xzMgfVdpxFgggVw2tpF6ABFdwn0OOQ7oaz
         twIFu+snzxMW8CIe2ETNFogiPTZUNM6EjHYOH2etdRx9pLWodPxkB5P0/oyjRIrEmG9D
         mbwIpLA4v0EGe0aofGpzVM4SKXaXYJ5V+5DMjlLrdt9+FsJjpodwNFXhVl+Wj/VnuDeb
         WYow==
X-Gm-Message-State: AOAM532Ke9GeWf+zddk0VHbUupUl2MR7Mn5k7E6uTihbo55v/n3m4HgP
        j2reCq5Bt96hQWDrnMCVdYjnKg==
X-Google-Smtp-Source: ABdhPJxfuV4Hm7tBBysbQtHnxAY5MfCHGZhovdza0lbNg1408TVvohJTM8xKhQy1+sLMgG8hNTcuXQ==
X-Received: by 2002:a5d:6cab:: with SMTP id a11mr10858843wra.419.1614971305647;
        Fri, 05 Mar 2021 11:08:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id c11sm5355437wrs.28.2021.03.05.11.08.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 11:08:25 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 5/6] mhi: pci_generic: Use generic PCI power management
Date:   Fri,  5 Mar 2021 20:16:47 +0100
Message-Id: <1614971808-22156-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
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
 v2: no change
 v3: no change

 drivers/bus/mhi/pci_generic.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 4685a83..4ab0aa8 100644
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

