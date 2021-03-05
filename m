Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF46032EAB5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 13:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbhCEMjw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 07:39:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232891AbhCEMjh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 07:39:37 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2796C061756
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 04:39:36 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id w11so1904296wrr.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 04:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a3GgDD69zl4/2/h19pwS+AI+qQbgB4hX4JHShxDn3Xk=;
        b=dyu2kPYxikI2ZQ6c9dVGbLUqMTGrV3RQ/z7I2gMtxxb1cUDnD0TS/CnoXHRrFT1mo4
         hO5y2eqx+UcfLsmRn7HCEFsQSr4FqaZkiDsfukrMfZj8IjyFAU4pHFqMsiMsGuUhLLie
         5UINke1A9hNM1DpNd0XlxG+ccxcSvW/+/gO6rBQh0tE9OfprSRgpreiYUsIolURXKv98
         v9Ai4Ff0nps+71AFjhki1M664SYNXwDfu/Oe5+ckAZ9fuN+O24QiD1Py5XGPfEMAqiWF
         30S9egjHzJRtp3E9mLzfHxjp79gSG6QVFMdXjKv3jMAuJfjK9U0ToWdfuVzEq7f5dkOl
         UONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a3GgDD69zl4/2/h19pwS+AI+qQbgB4hX4JHShxDn3Xk=;
        b=Q67Yi6Ex4TfDcKkX/atmrKIEWCConi1rtOMBAD1I2W9iIkLwLgZTqNixbIn4XmSDhN
         0oEms3L1pV8p0y+x+W+LbxGTbX9Ez0cqfPbikP0agEV69ghoEGI+6HNW+DeGn8mrbn8g
         g4dbHT284kkvIvcF1XQzxXncoySxewvoh+JwSzJeft82ppWsyfUicx7M3xxrJV0mTyVU
         M98oCukAZBWMj/tsF4W9akVYinJLahfJjccAErV+d09uSKo1K2PRJ50unuF7gql+EGvS
         +tJUxWYnhv9MQbRRfGz7O01gmEkTvv8mtwsq5cNXd/9PptlTATKXZ9aAe1td8mXgIos0
         o26w==
X-Gm-Message-State: AOAM532s5EQ8YeuMPuRKBq0ztvTsbA9WnD+fMSJXtI+L5Q5YTJswhxXa
        L/i39RVFt9DxYfKE18zAL7/QHZupZJTJOl+v
X-Google-Smtp-Source: ABdhPJx0xsH1tm5TOFEi6Tlwy741oRkl74kAR8zqk3Dh1zgaajaOrULzcaSCW8FZr3jTCTgIwaVwNA==
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr9226925wrq.54.1614947975429;
        Fri, 05 Mar 2021 04:39:35 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id f5sm4173256wrx.39.2021.03.05.04.39.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 04:39:34 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 5/6] mhi: pci_generic: Use generic PCI power management
Date:   Fri,  5 Mar 2021 13:47:57 +0100
Message-Id: <1614948478-2284-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614948478-2284-1-git-send-email-loic.poulain@linaro.org>
References: <1614948478-2284-1-git-send-email-loic.poulain@linaro.org>
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

