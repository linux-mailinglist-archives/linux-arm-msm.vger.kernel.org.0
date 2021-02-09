Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB5A315313
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 16:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbhBIPo5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 10:44:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbhBIPos (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 10:44:48 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26294C06178B
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 07:44:08 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id i9so3932449wmq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 07:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ABItdWGRGB5buiMzSb0NZJyau1C1bdQlMKBzWQzFZYg=;
        b=AApIhTxC9tfQZJBaOa/Qa7UfoV/DMdMCT4SgV5jKHmlt2Ns3RR8n5w7gmDACAr5Xcf
         ZXwjuI4SvTAMFLXd2+NGS1BO3poe53CxnfSiaEMFNPkrbTyjIoL1aT4zCbND/8SUmj3t
         9OPjVtopRbRScV7kPrPb1GVkzXi+o2SAr/jZ1Eb1Q046OF80YW+EVQScrpjfujJOUqnw
         bJnWgHsOHqk96R7E7qytaiQx0bssVQaiCm6sPjxyNd1BlEJs2Sax0NLCVVu0sR+bqjtS
         GRw8zwTffyzxxXmiwA3OXpVaYx7fajPdLUYXpRksby9EBGp2gw+DMNJ1JdKpiMYKS4sO
         JyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ABItdWGRGB5buiMzSb0NZJyau1C1bdQlMKBzWQzFZYg=;
        b=VFfVSz5gYQydv9OD6K20BH1fXxMoTzd0VaYo0s9CBlDvFvyYF3Dlq8oNGU0KoKUBjV
         vHlIhPYpnd/eDF811GK4vshHvIJQy55wzt7si0+A96Csoq7YKKIdCthXtdZE3RfcuH2o
         w37SF6/3HU05ydgHra9nyGg/qs1iWdV9tHXMBMWwzZtFLbHl8QwCmbUbH0AFZhnppwoC
         h2dlNXSsbqjHBje1RN1NfOpKRyeYJqT3D+jagc+xN82++CATFLp9bvYZsHm+XA30jxLB
         tphOZp0TgOBntNC536oecg5X0/8KxsA6hMCFuPJDd02AUV9OMwG+oE9LdoDl/6bey42B
         yq3Q==
X-Gm-Message-State: AOAM530UxcPxsjGFuvDizF9BdcJfs5eAobC2oT/WewIAqghlnXP/m1P2
        26zNogASFNCvJOlBk6TVe0fHOg==
X-Google-Smtp-Source: ABdhPJxRQaQXQKnkO5RRhU1/BVKpXVkw4y8FYcwBdUkAfaaGODdFZbfMRq/NAmtDSPAXghIHwONrZw==
X-Received: by 2002:a1c:5584:: with SMTP id j126mr3622728wmb.153.1612885446790;
        Tue, 09 Feb 2021 07:44:06 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id s4sm35088486wrt.85.2021.02.09.07.44.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Feb 2021 07:44:06 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] mhi: Fix double dma free
Date:   Tue,  9 Feb 2021 16:52:10 +0100
Message-Id: <1612885930-12201-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

mhi_deinit_chan_ctxt functionthat takes care of unitializing channel
resources, including unmapping coherent MHI areas, can be called
from different path in case of controller unregistering/removal:
 - From a client driver remove callback, via mhi_unprepare_channel
 - From mhi_driver_remove that unitialize all channels

mhi_driver_remove()
|-> driver->remove()
|    |-> mhi_unprepare_channel()
|        |-> mhi_deinit_chan_ctxt()
|...
|-> mhi_deinit_chan_ctxt()

This leads to double dma freeing...

Fix that by preventing deinit for already uninitialized channel.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reported-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index aa575d3..be4eebb 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -557,6 +557,9 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
 	tre_ring = &mhi_chan->tre_ring;
 	chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
 
+	if (!chan_ctxt->rbase) /* Already uninitialized */
+		return;
+
 	mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
 			  tre_ring->pre_aligned, tre_ring->dma_handle);
 	vfree(buf_ring->base);
-- 
2.7.4

