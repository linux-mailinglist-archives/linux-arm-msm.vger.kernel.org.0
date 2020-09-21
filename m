Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E95271BDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 09:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgIUHbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 03:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgIUHbM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 03:31:12 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46548C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 00:31:12 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j2so11578298wrx.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 00:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=qThituOruGqfJmANB4icVDJLbT7XwfYfdRi5PVcvaHc=;
        b=V+/v2ZQBqJJuvojgm7zCRBV4CVpCmG4KL+KhecuKzD41YajWMpuyCMnRbNDSSQULNY
         bTXPNyri/wEDokJNhweiVzo7Y+TI2yl9d579/b4lBI84172yAEeoi7i76DcCAPh8y3uj
         nZvZt/dYja5vxl3k1B4Xml+IzAWBtDDEjqnlRH8umIHWhdvmd5fe1yx4j085rtjdD20P
         oVyjyVKqf2jAfZGR97m1SIF4wbeUoDZQNXoB6WpXf4SJJhqwOuTSaQwrwkWZMMZPquSp
         CVyQQCxUP9UkVcfA0ApHK6s7PkSzEAovT7gEjKkcPxHIh5HlVZycaCS197KNfh92c6oG
         51GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qThituOruGqfJmANB4icVDJLbT7XwfYfdRi5PVcvaHc=;
        b=TAMQvzsdhjkddtr6wcM1VSi2Yp1FNKieHu4X1srTl30bnrmX7DVUiSemIsa1aK2kr4
         Ubnb4jiAMFc0TXrsHbuAAKnVhrrQTE4gTXxbgTrS9ERrWaJhmGcw04fU9iC+5gzzmVLH
         R+yB9Uoc1eB5eDdS0dXEwZH7rsDN5AUL+/qBu58fDOH4dsME6ROaIVheJ9YP/33S+25Y
         ydlHy7+JtHVV3/P/LIUD4u/XnVydKlad1C+JamNlLFTheOi/GQLr5kKvP7jR9ExpazkC
         tFBIDYvEOG09yO3YIPKCcHWJCC1IXp3vppz0BOSHvSeb9SQtfebyENsiImWYkiUZVZJm
         3c5g==
X-Gm-Message-State: AOAM532TDJfJGPtyndFzJbEgf94OGd+zRXrtkvHjzCDh6I0MvNvq2uRW
        BXV4zzPqjz+z2OL5+AW5SzCM1A==
X-Google-Smtp-Source: ABdhPJyqhAb2P82honw+gvl6Q0MUzwYw9Oksssjjnpn2VKdXNrSximkE72wMT6s0T48BaFhy7eZ0Vg==
X-Received: by 2002:adf:fc81:: with SMTP id g1mr49497243wrr.31.1600673470836;
        Mon, 21 Sep 2020 00:31:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:490:8730:5875:9da3:b857:e7f4])
        by smtp.gmail.com with ESMTPSA id u13sm18331995wrm.77.2020.09.21.00.31.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 00:31:10 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        clew@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 1/2] bus: mhi: core: Allow shared IRQ for event rings
Date:   Mon, 21 Sep 2020 09:36:58 +0200
Message-Id: <1600673819-1698-1-git-send-email-loic.poulain@linaro.org>
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
 v2: keep nr_irqs check early in init sequence

 drivers/bus/mhi/core/init.c | 7 +++++++
 drivers/bus/mhi/core/pm.c   | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 19ade8a..31961af 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -125,6 +125,13 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
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
index ce4d969..3de7b16 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -918,7 +918,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	dev_info(dev, "Requested to power ON\n");
 
-	if (mhi_cntrl->nr_irqs < mhi_cntrl->total_ev_rings)
+	if (mhi_cntrl->nr_irqs < 1)
 		return -EINVAL;
 
 	/* Supply default wake routines if not provided by controller driver */
-- 
2.7.4

