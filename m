Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B0D272B30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgIUQL0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbgIUQLZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:11:25 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1904C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:11:25 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o25so4506378pgm.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=W6u4t3Pbx0oHy8S60PgkiPGv5xHHohbjjHW48fCGizs=;
        b=OlOZByl6C6kArp5eQ9uN20JHij+N3zfzyM1G11l4zjnzvFQC9YfIzA2ZePN4r61Fmp
         5UNCLzc8Afn4Fu2kQxjIeV1pUZeX6f7vm/4ZzJsrvrcQCS4JBVDThduFyXd/EyqIf8bm
         jvu8Gvr/1ZKOcNK+MC8IaeC84pcqO8jg7dsmi7pFaZ6N/BfvQ0x97ipg/a+A7QIwJOWv
         eWHby3cZdkWnlvAk40TBuvub+sKtGcr6zw71yyCiXNTcJ/S4hW9JifTgMBREnRkw7IfE
         p2z4JNLx9A2dGSlzn6XBfETy6MBYGRNkVHpxtLErwZmgj+bGWoDwM2GsGi4FKZX6gtEy
         l2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=W6u4t3Pbx0oHy8S60PgkiPGv5xHHohbjjHW48fCGizs=;
        b=J3Qsbh89kqyto2Ga280qAf7hl9t45qPDoZ7r1HzhBr7dSfUkpY332nmpXO3bO7oLdY
         m+WA0PVmTYql1gpyDjxeksPIQFIrnkyIcu4UM8kLdI5ImcpyGHQ80UqMriobMWd8dqsA
         Fb+R75HQQeFUu0RTguYHMVDL1AdY+yrNCNrqgVbCmk2gOs1YVQj1763xqTwa0CjdRjB5
         2Gp5lzcOIN32Yp8JWBxs9ERDxSMkMZ2ea4FqIR/3grQYy7OW3KDvWapfOJwrN6V2ebnU
         vGQkNXLlEO/JB9maYoxCdBw5qB9Yy8Wtp6WRu8fcpGA6H9Mkk1r/jVlT0lsePULywsq3
         06Cg==
X-Gm-Message-State: AOAM531luerYgRsSKwWWdjhvOVL8nThFUpALGz4ynbBuRpgLmYQhOk3f
        lH4byp+aA+D09e8m+z0WDTTS
X-Google-Smtp-Source: ABdhPJxUV5ExId9rP2h82ljXLR9+5mzdOyCY2LmK38cQFKKn16nqUGgI/Rlvu0x/rRQ15sgSpNatZg==
X-Received: by 2002:a17:902:c3d3:b029:d1:e5e7:c4da with SMTP id j19-20020a170902c3d3b02900d1e5e7c4damr704218plj.46.1600704685107;
        Mon, 21 Sep 2020 09:11:25 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:11:24 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 16/18] bus: mhi: core: Allow shared IRQ for event rings
Date:   Mon, 21 Sep 2020 21:38:13 +0530
Message-Id: <20200921160815.28071-18-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
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
index 1b4161eaf0d8..049a10fa42d7 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -176,6 +176,13 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
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

