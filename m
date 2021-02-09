Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCFE315314
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 16:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbhBIPpu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 10:45:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbhBIPpr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 10:45:47 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302C6C06178A
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 07:45:06 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id b3so22519812wrj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 07:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ABItdWGRGB5buiMzSb0NZJyau1C1bdQlMKBzWQzFZYg=;
        b=LpZFf8cLFAmaDvSn+gG5NPYFOi0zqy1vMdcj+yZvxk5IrhdUWO2avtIE49Hcl5Zrar
         i1fqOVn0pCU9F0ycWVBzrpGLMBJBxhUB+6PNkRHMKOFGyz+ugKJXaXgLGI/yZYbGSjub
         ukYwDwdAoteJNWJrpAIc3X8Tb6zwRA6zI4uPbVFqTSTGUFFOuh3q5AcoRn5nGsICTOZi
         TeaBC74zaKmwOPla5XUsmGAXzOZP9tLxvk6D/mYascR19bSyYbSDp3ChxVejorzdkGbv
         oAvTYQWkinlG/4Mtdg1+ecR3lVD05XsUCHu9XoGoEjCDWDGBfZBhh4YiTVBoVWNM30JC
         cT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ABItdWGRGB5buiMzSb0NZJyau1C1bdQlMKBzWQzFZYg=;
        b=Fn3KaW/OyafRMtAzD10blJSlWJ0F6+OXrS+5iuswCG0m8cHF5Xrd9fB3R5Uq/bp51n
         GQfMjVxPeKlmQ958VlCn08cduHOByh5d7ZcvnxUtySx3sGDkrF51t/A8TJKIodHxWPR2
         ARwpxg+72/yYHVFfgTm1qU3x5ZqZLX7JidX0wR1dB8v0um8xxaEgN+lmbd8NqZ+vnIpW
         30qYkYthm7ZiIWQ3BR+wlzRujgA2QU4iZhy7aySMyUPdSDwNJ3Z4sNLvcSKXiMftA6CX
         prJgQSoxxbu18tR2FXke5kquY3i05oy4SUpG4QNSyY1RrB6HovaG5Pi1urgv+g4wpRwt
         BuEA==
X-Gm-Message-State: AOAM532bSBMBDpGbTcYY1dv5vScbbMDikLbhxvUd05sY63d71xuGU4AY
        O3z6CCfptnQs5LsTlgy+rT1HwQ==
X-Google-Smtp-Source: ABdhPJzwOdqcBkeGJ0Nqvcm4eFhDq+wBRf2UHCef4tuEFgEGsTHZYsksVxS+Ro7GG5VZ5r68PGvqEQ==
X-Received: by 2002:adf:f60f:: with SMTP id t15mr26720910wrp.53.1612885504832;
        Tue, 09 Feb 2021 07:45:04 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id w11sm5123244wmi.37.2021.02.09.07.45.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Feb 2021 07:45:04 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        kvalo@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] mhi: Fix double dma free
Date:   Tue,  9 Feb 2021 16:53:09 +0100
Message-Id: <1612885989-12288-1-git-send-email-loic.poulain@linaro.org>
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

