Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 329B9315651
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 19:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233281AbhBIStG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 13:49:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233450AbhBIS1k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 13:27:40 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AF6C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 10:03:01 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id m13so23066575wro.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 10:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=JOqW2sysxBT+kJSt9zV8ddtRx3PSB2WBYlaQUXlXGdk=;
        b=jkUVuZccQ3n8oou/ZTRg9Wdn17ljY9+fUMkHLZWqpwHM/ISuhveokSS0BQ5Jn5aSuI
         5wN1PsON+TNAyWuF1kFVA0unDquTNpgf4kKNyCE+cvh0Ud3NWaxNoOnJJbZtI1Dd8tSc
         YeDz5RAtHGU3mttcydHIZZres/kglqynquZfRSlVCBfJi3tkuqLKSxPvivY2Naa4wQeN
         U5IhlzODo3xeDEczzU3e6sAt0gPyNChg8rdKcD+eYp/k6AwMPiZX4WsIFZ9DjPopoHDm
         0HmAOI4BqhXR5emY1WWfj6KSpgXhoJMae0l6YKirPdiXhUMTmpX6kE56q3hXYoKKrNZq
         guWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JOqW2sysxBT+kJSt9zV8ddtRx3PSB2WBYlaQUXlXGdk=;
        b=EITOiARL8+ZrHDTtUw4Hax6m9EvnO1BxmOfMpbvI/PtH9RLiT2+qARalHz94fEDugz
         KW7dLdGaPo8E5p/obU680pFtB1nJoWF+tBPzAuahqxPGxQ7xXLoi5b/C7ktc1Wasf71r
         ajYhjxBe+CMkYsmd7GOiS4xjyuroOT1VpygK3B1PKM9QTcYg4H3M8z3Oo5zW9FpdPC6h
         xl2bwojyj57gpUphhxSoUJbkGBJPcnowh0TKtjYUYwzMTdzWu2xnSMrAHqqYsue8+kFg
         dL33/iMwjppe+wwrUqgemGFpk3SPc/3hHT7K4qXbBS3gJXdOt52d6f38mrRZcodKKM1G
         TbLQ==
X-Gm-Message-State: AOAM53388JU8RRgpbmGcJOj6lSAUxZWdAx3xYxuxa/aLDfLiMUJiEDwO
        BWQW8EWmJJzvlAa26shv0F+GSw==
X-Google-Smtp-Source: ABdhPJwv/WmJh5YnFn+oDUuxcChOigE5JeY3h41Y+qbroL0Y8c7V37mZuVTa0WhGAqnFeQZX5q1h+g==
X-Received: by 2002:adf:decb:: with SMTP id i11mr26526950wrn.78.1612893779920;
        Tue, 09 Feb 2021 10:02:59 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id o17sm37221142wrm.52.2021.02.09.10.02.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Feb 2021 10:02:59 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, kvalo@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] mhi: Fix double dma free
Date:   Tue,  9 Feb 2021 19:11:04 +0100
Message-Id: <1612894264-15956-1-git-send-email-loic.poulain@linaro.org>
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

Fixes: a7f422f2f89e ("bus: mhi: Fix channel close issue on driver remove")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reported-by: Kalle Valo <kvalo@codeaurora.org>
Tested-by: Kalle Valo <kvalo@codeaurora.org>
---
 v2: add Fixes tag

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

