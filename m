Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F1926F6AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 09:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgIRHW5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 03:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgIRHW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 03:22:57 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A04BC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 00:22:57 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id o5so4494918wrn.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 00:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=5V+8cud3rzv0k+ZRd43+2+GB8tXQrCGwtBK+wQfmnRs=;
        b=Xm2quYGq2qVjvkQkQLL79kbjPahCfQQJpkbmKpkx5NjKq8Vy4gZx40qdPixJBYqDmB
         0kplQ3EpJeEkcEsu5P3/GC0zesoLZodbaPq7t+q0r7da9veJ3f8Gety46ZbyhwZ6RekH
         C82mwDqypyAUUqRxkbj6QuDbTGagsGjogsUW6nI5oPjsm2piaP+YBk1UKJ9Hjmncd84W
         dqmh3Y5iazNUn4zKqbSY34ke10ZUpCBVVMJKbrmnzLn86qBLJwMWhNUQ9jHX8SnxL9N3
         Lun6+RSg81nWdmhjjmO0p59ctG1GMBP4AV0SgVMI39vFiYQTEQAjwaMbl8pTZNgj961n
         bhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5V+8cud3rzv0k+ZRd43+2+GB8tXQrCGwtBK+wQfmnRs=;
        b=WTqyEoOH6gN/tyPM3WT7T9p7ssFzuVsq+yAf2X9mmzeEk1gJUxSmcylBshyZaICHid
         mp3FECvPl2Y70M2ipBkMpOP3zaaEuOcZGYNUUe309kSrgm9cpVn0DuDYJ1rV7bB0JS1C
         aug+F6kDn2uuKZqlEAF6MZgaEJ4wBDfWGNr4P5hojOctsJP5cdcRnvz7q+aVq8aOjuk+
         L3BE6+vavTo4LLycIauOgkvpqz0XtA4RnJyLi+2Xe44bFUWqK4z3h4ysulvgzQZ6fvOO
         o48z3pgX/i94l34abrBAsCXzcSwQwaRWrqRq0loCdDkJdy0Gmz0vaBsokJiZrGx9kJ3J
         PTzg==
X-Gm-Message-State: AOAM532Jc1q4fyBG2kntgXNTHgsN14S4eScchx7C0E2O6bNv2B0mSMbv
        g1d64xf7okyPvp6EksW5FuvsD+bKXg7VCQ==
X-Google-Smtp-Source: ABdhPJxl2TlVrZiYaYTgJWWjEIIE8blyuqSB+WNdeqaiU5dGnMhdtHF83DXuOXam9/v43uj3MgBlcA==
X-Received: by 2002:adf:e9c3:: with SMTP id l3mr35669616wrn.63.1600413775807;
        Fri, 18 Sep 2020 00:22:55 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:490:8730:c407:647e:3839:49ce])
        by smtp.gmail.com with ESMTPSA id e18sm3757015wra.36.2020.09.18.00.22.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Sep 2020 00:22:55 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: core: Allow shared IRQ for event rings
Date:   Fri, 18 Sep 2020 09:28:47 +0200
Message-Id: <1600414128-5510-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no requirement for using a dedicated IRQ per event ring.
Some systems does not support multiple MSI vectors (e.g. intel
without CONFIG_IRQ_REMAP), In that case the MHI controller can
configure all the event rings to use the same interrupt (as fallback).

Allow this by removing the nr_irqs = ev_ring test and add extra check
in the irq_setup function.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/init.c | 10 ++++++++++
 drivers/bus/mhi/core/pm.c   |  3 ---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index d232938..ac19067 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -113,6 +113,9 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	int i, ret;
 
+	if (mhi_cntrl->nr_irqs < 1)
+		return -EINVAL;
+
 	/* Setup BHI_INTVEC IRQ */
 	ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
 				   mhi_intvec_threaded_handler,
@@ -125,6 +128,13 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
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
index ce4d969..07efdbc 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -918,9 +918,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	dev_info(dev, "Requested to power ON\n");
 
-	if (mhi_cntrl->nr_irqs < mhi_cntrl->total_ev_rings)
-		return -EINVAL;
-
 	/* Supply default wake routines if not provided by controller driver */
 	if (!mhi_cntrl->wake_get || !mhi_cntrl->wake_put ||
 	    !mhi_cntrl->wake_toggle) {
-- 
2.7.4

