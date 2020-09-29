Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36C527D51F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbgI2Rxq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbgI2Rxh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:53:37 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1FEC061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:37 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d9so5330784pfd.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I4sYG/yonx2Z4e3j5HjpsSaE/IQcEPtF5lwUAPBhXso=;
        b=VcUe4WF6dH2FXchwOaRd0598LuuqD1JkgolkZQFDXa81xOts4Z1XwgDAtSQuXm8b+B
         27dUXBF35E13arQCKfjBGqrKUgbK3z7oSoSZfUC/Z5GExKrg1MXkNUyaijFfaHXzdnqC
         L4mt9I/qfitl3NujaemogT5hIgYx2K9mmvWKzEpw0V/GMKsedYvUSdYWtSnNvf31ZxBw
         iL4qS7zHVrJnpkF4CxsRNEb2/ZB2XmHeqJpEl4aUnYq4DV26a7lGzWTGYvEoioKZTlgl
         +V+8ypQDw4Pl5lRVQZ+6/FzxW5zXeg6wq2bCZInDGNO26txhooYNzmSi43GRD2JmFvMx
         i3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=I4sYG/yonx2Z4e3j5HjpsSaE/IQcEPtF5lwUAPBhXso=;
        b=RCQn9vkYnFQJBQDmFxGsnYREbz6Y7+VPouxnZgW4gC73Q/7ObmpVjM4KJOzfH3avvE
         qDFGZtUYfrp7+v1F165V8Vuf+StAx9WnOHNREn3kLzMupzte2SNiJoJsWlmQhdSCvfBz
         iocpVqmwxRzrpDecmcx0hGewYb8widcBFDU9Vu2AP+fA1/NWVenZf4Bm+4kZUw17mmDG
         108xhdsOQdv+RGUoB9A+ide+cDRV72rPcs/lzjZ6B+fFXXynTx8I7MxGS//6iFilslFx
         qxzgxFejMpFX9pxQ+kO/DHyXcDVxa7QUndUqkXnPZwbKD6saK5bI3cqzJGXH4aSomIkl
         79oA==
X-Gm-Message-State: AOAM531pXg7QbMilmqkss4fhG2f3ZhSwdy11d01Sb9tyqWn8UKMIEGnn
        +zmoD4UXRyaZgibHdUbnyQpj
X-Google-Smtp-Source: ABdhPJwyv1MBf2jqrlH853GVV/DeEf2XXFzpFlnMa0Sr/YR4NjBPQBQ1mF2U67Trtcn8JqA1NTjbIg==
X-Received: by 2002:aa7:9635:0:b029:142:2501:3980 with SMTP id r21-20020aa796350000b029014225013980mr5185745pfg.69.1601402016739;
        Tue, 29 Sep 2020 10:53:36 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r188sm6271046pfc.67.2020.09.29.10.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:53:36 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 16/19] bus: mhi: core: Allow shared IRQ for event rings
Date:   Tue, 29 Sep 2020 23:22:15 +0530
Message-Id: <20200929175218.8178-17-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
References: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
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

