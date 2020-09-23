Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90094275898
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 15:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgIWNYn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 09:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWNYn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 09:24:43 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF64C0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 06:24:43 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id w5so21056851wrp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 06:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=HVe2HaNB3yd1YXAI9Zrl3A8+oR6+kzsd+HJuX9oQr+U=;
        b=Yf5EndKEk2FLZwmtzk9NIyuyzYYkhFKar/lZvkshu3/q5RzjjhWIcbnczQqbVWUohN
         UFPTfV2DrLHz0zmIiLB+ssCzzNMNnJb0TyuyqpAiMHiJcJzv0pyaxQa1LBrD2Zne+cCL
         fni/Odiu/8xWyyttJjfgaya/f92F9tR8ozOiVL5v2NzrJHm4ukW4q9t5EVsmD+kk2p6Q
         z24o9SBCn5ZI9eUW8ye2s/FLe0zNedmui/oO5pRdhYo2Cj9zNxWMTIzUoki69FD+oOVx
         hlvSP5yiuzyQDNE7JuTs8uuKRNjcpI19k9Zjan7Myv0YAzP4J0GpktfgVZut1BCr//Np
         8G5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HVe2HaNB3yd1YXAI9Zrl3A8+oR6+kzsd+HJuX9oQr+U=;
        b=t1qLxy9t/iBao6kjMpmH/AMzQYJsSMIXz2UOQsG+pbgyG2t148CHznTkGH2wqWhZSX
         Nm+3DUmSjOqFyu+444MGpkFKOoKBVikDwoyjxpxy++UrvyMSw+GMM/vGwWb8NTPBWnzE
         4O0rZH7df2Ob1WsAspbrjGoLiIcUgzOXNFrYCbPuvqtKw0OkpYnWROIGoImQKkCbzUUE
         vCL8ieN/IhmYvgt8IPGfuzcuoZH6n9aZvABamj6d8lfpl0hc9+tW/Ra5FWiZoCKqv3H/
         kSTtivEYa9/idnqvf/WfQH2Q3GRw+c9i7JzRsSifTMQUS7yYnI4IAfuQ7UX1VSzRYzee
         8rqA==
X-Gm-Message-State: AOAM531GHFyKU29vfgTFN11VN8O5Nw2PcScKvkFjhgpHAzAJgwmTB2Xy
        /ynsZ+cO9vODiOkSsvtnsurrS1aRYcj6nw==
X-Google-Smtp-Source: ABdhPJw81PY6jOaaEBPvzFbBT02hSBhfBlTidSgqK4C0f7/8d8CwBTujQuG63gHusOPbIh4vEtRvbA==
X-Received: by 2002:a5d:668b:: with SMTP id l11mr824473wru.89.1600867482192;
        Wed, 23 Sep 2020 06:24:42 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id m13sm29945690wrr.74.2020.09.23.06.24.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2020 06:24:41 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: debugfs: Print channel context read-pointer
Date:   Wed, 23 Sep 2020 15:30:28 +0200
Message-Id: <1600867828-26881-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This value was missing in the channel debugfs output.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
index 53d05a8..2354c09 100644
--- a/drivers/bus/mhi/core/debugfs.c
+++ b/drivers/bus/mhi/core/debugfs.c
@@ -115,8 +115,9 @@ static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
 		seq_printf(m, " type: 0x%x event ring: %u", chan_ctxt->chtype,
 			   chan_ctxt->erindex);
 
-		seq_printf(m, " base: 0x%llx len: 0x%llx wp: 0x%llx",
-			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->wp);
+		seq_printf(m, " base: 0x%llx len: 0x%llx rp: 0x%llx wp: 0x%llx",
+			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->rp,
+			   chan_ctxt->wp);
 
 		seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
 			   (u64)ring->rp, (u64)ring->wp,
-- 
2.7.4

