Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20AAD3160FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 09:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbhBJI2O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 03:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbhBJI0h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 03:26:37 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B35CC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 00:25:57 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id lw17so2603837pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 00:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O1bP8tntg9pA9yGxdgncjvitmKPqyFRS1o/Fqe5r2Ps=;
        b=irzmiVZ4wsEOeiwpQwsrht1OIb9g5AKBV+N1HM9YcKJf95u9lyJqdetLbOTkFDPznA
         pt3dJRYpn77GMxLX5KfzWm9UcxtdOpKl3BY0APSVniGsRPb/cYMyomC9kk6IHQtN1IBe
         62WQsgGlydXrwhNxQYWvaT2qJ1QllCXUrUSq4gYfQ0JPshAX0wHZnm7yEsHOVf5Bhx6C
         ocs1C4cbTJGsZjvnLIeZA4RU8Rb8Uo/ikTUr1XUqBe5Hr/+agFQroAithue/yMzdxBJs
         YRrTiJ2hM9zbxq/mcy+wGmFd51sh0CYkQJWdD4wpILQsBuQ7QWb4Cg+v/5rrUlxeOT7U
         MVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O1bP8tntg9pA9yGxdgncjvitmKPqyFRS1o/Fqe5r2Ps=;
        b=oNSnDLXRF2FyP/1DoSLvlbIF7RaHGS8ZJ0NozMeEdcKMOXGImPRfGCLoP7RWkfzZjR
         CMoDKI2Ma/a2g1ceSoRbz39oyhRTlNd2zeMjJYypFwiUXEQFJywV1CimiMYH0Bl++7qd
         /V41/akTFdKnVcQwspPEwcxnYDN9u+OI/j0316LiZCN/yvI2NRXhqlyfDggMxC2UNdXj
         v2Fsjt0xotkZBK6JgSDmnC4qcfrluAa+lan1UiazzEs6FNeQ2aGmRZO1Yq6FtJ6x1W2j
         L9/NL2zlJPiMEagsV0EQKaH8gciKoW84TLVnCUKeKTHdEvh8hAb+4fUczMZJFgsJ0bPp
         fbuQ==
X-Gm-Message-State: AOAM532BLJ1C9pIvrvD7qprIPtgBHAoPMXFsV8vrw0bAne7XmijDaOLN
        br5LA0SjTk19pqsAdSVLmBxC
X-Google-Smtp-Source: ABdhPJy6tqTNSlx2DOfv6fYexq28jWCpsUkSSEJgihZIaNnqN6sYV+awW/kjax6hCq7LNSo2A8zgCQ==
X-Received: by 2002:a17:90a:a585:: with SMTP id b5mr2093367pjq.110.1612945557053;
        Wed, 10 Feb 2021 00:25:57 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.29])
        by smtp.gmail.com with ESMTPSA id r68sm1402963pfc.49.2021.02.10.00.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 00:25:56 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/1] mhi: Fix double dma free
Date:   Wed, 10 Feb 2021 13:55:38 +0530
Message-Id: <20210210082538.2494-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210082538.2494-1-manivannan.sadhasivam@linaro.org>
References: <20210210082538.2494-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

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

Fixes: a7f422f2f89e ("bus: mhi: Fix channel close issue on driver remove")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reported-by: Kalle Valo <kvalo@codeaurora.org>
Tested-by: Kalle Valo <kvalo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1612894264-15956-1-git-send-email-loic.poulain@linaro.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index aa575d3fb3ae..be4eebb0971b 100644
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
2.25.1

