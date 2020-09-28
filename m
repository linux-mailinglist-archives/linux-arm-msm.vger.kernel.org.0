Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94FE227A63F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgI1ELi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgI1ELh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:11:37 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7565BC0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:37 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id o20so8133326pfp.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I4sYG/yonx2Z4e3j5HjpsSaE/IQcEPtF5lwUAPBhXso=;
        b=JOr0kWpvxIwSipBfP+YmyZnOa9oYI+cAwTFhN44O7ZJQM/y0tSQJUF1aVfARGPQZR2
         5NZniJyc6+NoQULJrmQ2zUL8mvo4Y/mm/bvVgXDz0GWjZ8KpL4aJulf9hIk0jvlL2WIA
         dDV7gBHIwF1fh6uUyHl+soeGv3f1qf0b8eOXwZF3/mfmtyCXCizlBZDy7ZkV0Hf3uMjN
         lzD4LBl1LNtPor4vBxp0dSJyii8rgXzz+NBL5BeBGGzopCDMkCxVmNQNi7+ceu7M2PFY
         9VxdrR7Z5ajJyHRgKwr8fXcMaklFW0avudimSFXM2FArwo6HUKj61D/h1Ea8Zc+ID3oD
         Bd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=I4sYG/yonx2Z4e3j5HjpsSaE/IQcEPtF5lwUAPBhXso=;
        b=saM4T2k4ZP2qbrrRB4FuiW7fktPMracFyry8bccauavi9vgEAtayc5v5yDJ5Uua8GP
         6cOYNZ0TIdsc3ZqIOm9zzY1mlFf4MFocX220EYMIr4UR8ARJQXh6Zyqc8uxr/X2WuHBw
         dKFld9ov0CfAr+klZBhqf4SFPHm9XshYsCbuYKFjY/zLSjljqwN8IJlSIPeTzXIY54Qi
         1C4DWkKtFF4vz2AOr4YA1DHPtUifGynAwiaBBJP9tNzeyM6db3A3c62U/0W2x218s65A
         8KW8BIrwwHT0Anogl/7ECk2LZ1/6cj1o05ixMAyEtKwiSJDME8kFdA2+KmpdgG5mSWWU
         kauw==
X-Gm-Message-State: AOAM532kflWiHhQP4ByBrTfkwRyhlEVn5Hg3I1eUylUW95bwiu34/oYi
        jC+oy81PI721kziuQhMr4n/t
X-Google-Smtp-Source: ABdhPJwQm5agO+LBr1X5clx74u+gGn6503Q4nj3KvSBitxHdozj5fS0fGDl7TnwclaUDUNIoApwRDQ==
X-Received: by 2002:a63:1a50:: with SMTP id a16mr7454288pgm.331.1601266296971;
        Sun, 27 Sep 2020 21:11:36 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id n21sm8306322pgl.7.2020.09.27.21.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 21:11:36 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 16/21] bus: mhi: core: Allow shared IRQ for event rings
Date:   Mon, 28 Sep 2020 09:39:46 +0530
Message-Id: <20200928040951.18207-17-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

There is no requirement for using a dedicated IRQ per event ring.
Some systems does not support multiple MSI vectors (e.g. intel
without CONFIG_IRQ_REMAP), In that case the MHI controller can
configure all the event rings to use the same interrupt (as fallback).

Allow this by removing the nr_irqs = ev_ring test and add extra check
in the irq_setup function.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 7 +++++++
 drivers/bus/mhi/core/pm.c   | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index a33665b7ee54..103d51f35e28 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -162,6 +162,13 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 		if (mhi_event->offload_ev)
 			continue;
 
+		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
+			dev_err(dev, "irq %d not available for event ring\n",
+				mhi_event->irq);
+			ret = -EINVAL;
+			goto error_request;
+		}
+
 		ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
 				  mhi_irq_handler,
 				  IRQF_SHARED | IRQF_NO_SUSPEND,
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index ce4d969818b4..3de7b1639ec6 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -918,7 +918,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	dev_info(dev, "Requested to power ON\n");
 
-	if (mhi_cntrl->nr_irqs < mhi_cntrl->total_ev_rings)
+	if (mhi_cntrl->nr_irqs < 1)
 		return -EINVAL;
 
 	/* Supply default wake routines if not provided by controller driver */
-- 
2.17.1

