Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51BA31908B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 18:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbhBKRCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 12:02:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbhBKRAl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 12:00:41 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA96C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 08:59:59 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id y134so6468304wmd.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 08:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=uQ3Jo3HBhldTVgn2MdvEymZDPYZuHecIyEaku7JjC+I=;
        b=yH6n4zOdLK11+LiiyHPfnR9Wwlye2y5gnfDZKFwavmvspNEmJVI0FaYvbryfTnWwvH
         FnYzrg5zwY5/hTUi26V4R3LrqxfoDq+Yn3xqroVGS0YuerX5/BoSCZ78Vpbu7dvdTE3C
         6QUpW51dLo9/WoeFfjHUr6+4jBjw/NHXndzoS6pi3P/D+zJDDODAFWuCxzrqzQzsypOw
         rF/Id8Ic+IZjBY/CZbongBPD0lCYoBRQM+UDFMat1wA6bUxBv9MGd0WyJQkXjcWzgpNc
         qDXLc72/Vn2rxSw7K9wrQemv/WuxUVu9T/6guglYa495u8J1IViPod01xx5WRQ2LmqwK
         m9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uQ3Jo3HBhldTVgn2MdvEymZDPYZuHecIyEaku7JjC+I=;
        b=LlLlYvESPArJD+LCk/kPvr3GAOanvnaz94hlPwBjBGp7gntAj7xWLWdljtIBjzSo4c
         Y9Hw/gvh5E4nwY8TIqPPPvEJuPrkEcPttVaDrFaVJh0OzHNqAIKVG6y5/xdG8BVwX9l2
         mhpBR16A5wrtuOsou7H4AzVcJ4Qq9EWdXKvVdPDPN/WQjib1OJ/Nmj3nOCJEnj+EhWOD
         Ao/gIZf1JMAVCTkZHxPMV9reess6h2eSJQLrviL7FRb1rRXIryEYfl3F7/nMk0ShuiFI
         a9MFWl6HcUXtG8VE9HQN3pCMHdH/yPIKIAhj+Wh0PRZzp+lBzzd6dVSPXy/rGzEiubp4
         G3+g==
X-Gm-Message-State: AOAM530bxTUKbWoiNgipGDn3EgOFk9bNw1TCsNKJDwNgNbAKjXP0H9xz
        Gveptz4N1fArb3FqsYWgNgg6sWEDZaPl6w==
X-Google-Smtp-Source: ABdhPJxgcodARJSCY83ptkS/I0JJKQ3dp4Vf7eW/k+dRoRiqx6AxB5SOMDd/pyMotHxVcUpSOvLNsQ==
X-Received: by 2002:a05:600c:358e:: with SMTP id p14mr6032144wmq.73.1613062798649;
        Thu, 11 Feb 2021 08:59:58 -0800 (PST)
Received: from localhost.localdomain ([37.169.43.143])
        by smtp.gmail.com with ESMTPSA id w8sm5736387wrm.21.2021.02.11.08.59.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Feb 2021 08:59:58 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] mhi: pci_generic: Ensure device readiness before starting MHI
Date:   Thu, 11 Feb 2021 18:08:03 +0100
Message-Id: <1613063283-12029-1-git-send-email-loic.poulain@linaro.org>
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
 drivers/bus/mhi/pci_generic.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index c20f59e..bfa0a1e 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -17,6 +17,8 @@
 #include <linux/timer.h>
 #include <linux/workqueue.h>
 
+#include "core/internal.h"
+
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
 #define MHI_POST_RESET_DELAY_MS 500
@@ -391,6 +393,22 @@ static void health_check(struct timer_list *t)
 	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
 
+static void __mhi_sw_reset(struct mhi_controller *mhi_cntrl)
+{
+	unsigned int max_wait_ready = 200;
+
+	mhi_pci_write_reg(mhi_cntrl, mhi_cntrl->regs + MHICTRL,
+			  MHICTRL_RESET_MASK);
+
+	while (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_READY) {
+		if (!max_wait_ready--) {
+			dev_warn(mhi_cntrl->cntrl_dev, "Not ready\n");
+			break;
+		}
+		msleep(50);
+	}
+}
+
 static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
@@ -451,6 +469,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto err_unregister;
 	}
 
+	/* Before starting MHI, ensure device is in good initial state */
+	__mhi_sw_reset(mhi_cntrl);
+
 	err = mhi_sync_power_up(mhi_cntrl);
 	if (err) {
 		dev_err(&pdev->dev, "failed to power up MHI controller\n");
@@ -532,6 +553,8 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
 		return;
 	}
 
+	__mhi_sw_reset(mhi_cntrl);
+
 	err = mhi_sync_power_up(mhi_cntrl);
 	if (err) {
 		dev_err(&pdev->dev, "failed to power up MHI controller\n");
-- 
2.7.4

