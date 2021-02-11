Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2473A3192EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 20:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhBKTRo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 14:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhBKTRm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 14:17:42 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5719C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 11:17:01 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id u16so2875305wmq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 11:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=eNM2loqZLgUISKtmppHRROdqmAqpVuvjidMFH6gwtdQ=;
        b=LGndeLaLnnC1+iw5OBfgUkD9B3QK8G25GpQgu6GEmkQ6dype2y5/hJyc8j7Hh4XqYV
         nvN98bRyX+3Grs6DC3n/9pTKcZagJOmYJsMsIMdMwKgJ8gSwtveSVe/eBu8u48gYCeIQ
         nD6sBNFsCaGWi4Y0gD5NJIDoowrFH96TinnmMsC5eZln26pnHiROtJOO7ruzhhlK8Gia
         ebGodzohhI65Udnxfa/GkHqZvwfVQU3Clt9/T18iv+8Id7cE6qY+X6cNwVibIf6zBihO
         Spg6Tsfo2xUFe/5kr3os9IQQxI9m3nTcO8h6IFmRO8aZ+f67mMsAnuKj6uOHhXm8FGiz
         6+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eNM2loqZLgUISKtmppHRROdqmAqpVuvjidMFH6gwtdQ=;
        b=AEFbHCeuVqUbqlgz90QqhtOzJDP+jp6Hyj5yaz/utAsYFGqNf7SGFF+juUhTHdSsiE
         Cd6v9kcKEVoYsbDs4NitwpiL6EEMvtrBEfYGjvD3jdCJohmboF7b3mG+uo6naDSplfRS
         pNpENudoloZ6S/TTajR8smZ2/p8sbuRrp/cMhXmUsh/w4dPXMVl1URhNTHVlzHe7RxJW
         +Iq85//uOMfGvsQozI+wgSbFEpGcOc30vxoEAeMbqHCu2oiw7BJGMjc+9r1nYrwwl4Gg
         M7dTDG4Fh6UhUV0kOrSXGrtRrLmW4P4c4uTX9CdPzB88FRaL4siLAAxY1sks0eZviUA6
         7r2w==
X-Gm-Message-State: AOAM530LghZfWkfpFYpjxQcJZBHFz6SwlPoKc4ZOLNhdinfJFz9+qc60
        1P9akBVzgk4Y2Iyrfxm4E25A8w==
X-Google-Smtp-Source: ABdhPJzYGyZtFDIBjPiEBM5wRqkv3dK9RqPQtDG/Ig7OBzlmFH4IrgPZQrJ3Fo4epceupsQm0RH/NQ==
X-Received: by 2002:a1c:5a54:: with SMTP id o81mr6597512wmb.50.1613071020558;
        Thu, 11 Feb 2021 11:17:00 -0800 (PST)
Received: from localhost.localdomain ([37.164.74.23])
        by smtp.gmail.com with ESMTPSA id f2sm6240558wrt.7.2021.02.11.11.16.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Feb 2021 11:16:59 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3] mhi: pci_generic: Ensure device readiness before starting MHI
Date:   Thu, 11 Feb 2021 20:25:07 +0100
Message-Id: <1613071507-31489-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PCI device may have not been bound from cold boot and be in
undefined state, or simply not yet ready for MHI operations. This
change ensures that the MHI layer is reset to initial state and
ready for MHI initialization and power up.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: reset only if necessary
 v3: do not wait for MHI readiness in PBL context

 drivers/bus/mhi/pci_generic.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index c20f59e..87abd7c 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -17,6 +17,8 @@
 #include <linux/timer.h>
 #include <linux/workqueue.h>
 
+#include "core/internal.h"
+
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
 #define MHI_POST_RESET_DELAY_MS 500
@@ -256,6 +258,7 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 		return err;
 	}
 	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
+	mhi_cntrl->bhi = mhi_cntrl->regs + readl(mhi_cntrl->regs + BHIOFF);
 
 	err = pci_set_dma_mask(pdev, dma_mask);
 	if (err) {
@@ -391,6 +394,31 @@ static void health_check(struct timer_list *t)
 	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
 
+static void __mhi_sw_reset(struct mhi_controller *mhi_cntrl)
+{
+	unsigned int max_wait_ready = 100;
+
+	if (MHI_IN_PBL(mhi_get_exec_env(mhi_cntrl))) {
+		/* nothing to do, ready for BHI */
+		return;
+	}
+
+	if (mhi_get_mhi_state(mhi_cntrl) >= MHI_STATE_M0) {
+		dev_warn(mhi_cntrl->cntrl_dev, "Need reset\n");
+		writel(MHICTRL_RESET_MASK, mhi_cntrl->regs + MHICTRL);
+		msleep(10);
+	}
+
+	while (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_READY) {
+		if (!max_wait_ready--) {
+			dev_warn(mhi_cntrl->cntrl_dev, "Not ready (state %u)\n",
+				 mhi_get_mhi_state(mhi_cntrl));
+			break;
+		}
+		msleep(50);
+	}
+}
+
 static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
@@ -451,6 +479,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto err_unregister;
 	}
 
+	/* Before starting MHI, ensure device is in good initial state */
+	__mhi_sw_reset(mhi_cntrl);
+
 	err = mhi_sync_power_up(mhi_cntrl);
 	if (err) {
 		dev_err(&pdev->dev, "failed to power up MHI controller\n");
@@ -532,6 +563,8 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
 		return;
 	}
 
+	__mhi_sw_reset(mhi_cntrl);
+
 	err = mhi_sync_power_up(mhi_cntrl);
 	if (err) {
 		dev_err(&pdev->dev, "failed to power up MHI controller\n");
-- 
2.7.4

