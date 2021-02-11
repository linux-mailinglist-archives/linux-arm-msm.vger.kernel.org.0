Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433FE3190BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 18:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbhBKROj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 12:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbhBKRMv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 12:12:51 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EBCC061786
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 09:12:11 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 190so6227819wmz.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 09:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6j+6BrO1behWKG+nU+b6WRDJY2qQFVwKOgzdhsCWLCo=;
        b=MJXoBw+LwXw6qXzhHQGliNC6THtVmHZfvNc6zN8ZQYMdpRX+toovFRgstQXY8F0ecf
         9HFQPQpWN/eXlZRsNtA8VTt26aDVPqu5Xq1lLAuhsTYsdL4sCMVZXk2P3Gcdndog8F27
         VCq7vTh+rTP7z+9luNPrNRXQtInHfFgbjOQkWhvT861boa3/RBpHNUVWf3VAjSn6wo27
         F6U+tpAT2brJmu75Q0f+RjXCQQ5vqsiv4rtMvrfMLO0cwm+OUAhUcygeh4UUilkX2htW
         /YTGplaB5Tt+dWf5m7H2mzXtUKoQvc1Fa/MsXUijcS4iNyvK2eyT9VASpq6sADrOuC6d
         4cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6j+6BrO1behWKG+nU+b6WRDJY2qQFVwKOgzdhsCWLCo=;
        b=qCe9Pff59sc55zGCYpvCniw0Ny/mzZEPRYOelcVYWtAR5OhUt84bvTfWB0bh5dkVOF
         R3Yc0Kq4oX1JejMwgR/j+DWOpsNYiYBaNfw/TvPfMncjt31Of8YZ29RPw5JW/TH/1ew3
         MXKSzzgZofDnkqAe7cVUwqC0Z+Xko+DuBbZ/c+mTrsBphCYdzeNIsh3gYgvDtwT7FXVZ
         0C4kNwgE+LhxEYZBR9GmCeo3F3PpcLQPnqIJi3jhx2Uco2+0qxF+WQ1i0ONg2avp1KyG
         OeAr+XiIkgcLrUiC2at/wk4BP8YUxO0Q2S+9CJSi1OjKNnc+Ot/qsuzrc0KwIK6WJZUD
         cKHA==
X-Gm-Message-State: AOAM531PJh6Jf7K4Bv61KmjlVqGvcoVcpon2b60CJHQnVpC8ggPMEvp9
        izkM8JX+KEtls9fk8u1n+Zg4Fw==
X-Google-Smtp-Source: ABdhPJwCj3UEOy5UhGWKI4/n4hGMk+SN0xW0zfySRaUdaex4RlmeeP7qij+NqZUZqbOSXaEh4YIvAA==
X-Received: by 2002:a05:600c:4857:: with SMTP id j23mr6242465wmo.66.1613063529738;
        Thu, 11 Feb 2021 09:12:09 -0800 (PST)
Received: from localhost.localdomain ([37.169.43.143])
        by smtp.gmail.com with ESMTPSA id v17sm1698026wru.85.2021.02.11.09.12.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Feb 2021 09:12:09 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] mhi: pci_generic: Ensure device readiness before starting MHI
Date:   Thu, 11 Feb 2021 18:20:16 +0100
Message-Id: <1613064016-16276-1-git-send-email-loic.poulain@linaro.org>
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

 drivers/bus/mhi/pci_generic.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index c20f59e..ea68c9d 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -17,6 +17,8 @@
 #include <linux/timer.h>
 #include <linux/workqueue.h>
 
+#include "core/internal.h"
+
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
 #define MHI_POST_RESET_DELAY_MS 500
@@ -391,6 +393,27 @@ static void health_check(struct timer_list *t)
 	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
 
+static void __mhi_sw_reset(struct mhi_controller *mhi_cntrl)
+{
+	unsigned int max_wait_ready = 100;
+
+	if (mhi_get_mhi_state(mhi_cntrl) >= MHI_STATE_M0) {
+		dev_warn(mhi_cntrl->cntrl_dev, "Need reset\n");
+		/* try to reset */
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
@@ -451,6 +474,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto err_unregister;
 	}
 
+	/* Before starting MHI, ensure device is in good initial state */
+	__mhi_sw_reset(mhi_cntrl);
+
 	err = mhi_sync_power_up(mhi_cntrl);
 	if (err) {
 		dev_err(&pdev->dev, "failed to power up MHI controller\n");
@@ -532,6 +558,8 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
 		return;
 	}
 
+	__mhi_sw_reset(mhi_cntrl);
+
 	err = mhi_sync_power_up(mhi_cntrl);
 	if (err) {
 		dev_err(&pdev->dev, "failed to power up MHI controller\n");
-- 
2.7.4

