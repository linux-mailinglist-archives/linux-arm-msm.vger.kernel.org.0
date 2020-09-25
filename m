Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404C2278F71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Sep 2020 19:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728466AbgIYRQU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 13:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgIYRQU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 13:16:20 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C43C0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 10:16:20 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w7so3809763pfi.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 10:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0isoKQexThfGyA/SiFQeIDNV9ZfZnsCVryK8Eef/oeU=;
        b=TE+e2X4QcS/SKq6v578mn9aG4g494ViU0i4tel+fuwb/WZQMxx/1SvHlVz/Sh9vDIE
         +LFmm24DmAJUjQAkO0yFtY1pr+/ddeAFkjxl7Vjz3zqwepZIy3xrMXjn8V8FUTZkvTZd
         N6xuO3oDw9GfbY2HmoHk2eAAQSqTCAG2A1Lrqr1n50wRjJtmOV7vd7w698X15jDpndlj
         kf2RXKc1Z0dzLYaZDB4OtfzspVMDhAf7KQD+CTYj5CoNH4wOBuV3JOMihcQVhLNGkOnT
         xiO1UjgxqXJzC8fuzVFrR8lpqht5zi0ceXTjohyI4RDR6atiJusq8FmtHbC2uAAl3GdM
         au6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0isoKQexThfGyA/SiFQeIDNV9ZfZnsCVryK8Eef/oeU=;
        b=jsV8/dmfUjIJI6dKj8E3bJCKGM/dlO4uYhxbnn7uenGq7G7/sWF5InNU7m6/xThOln
         PfH0AohxM+ImU4ybTF03azQFOf0my+HvlbLvkZgiyr3OXu8W9JpHe021lM4zuprYcEk4
         tOQYJUNLYtzPk9Y/fOvsaJWkG6YDdAZzEYpAtHdydyDM2namSQsS79vYNJVOCs2e03DF
         O9atKiLZDKDygMmt9VWNuZwhoaS+mi6iffaMwbPFB3SaDogq7ypN90YKrCziyjHTRmBO
         QSX/uePMhyvSs0QAGaTsr1im5KjJ4bQTc2cr+MBxruVCX9D1RYDtNz8H95VzVbdZS+AP
         2KLA==
X-Gm-Message-State: AOAM532+kT/2OpyZEcZFeowUID3nl+0Vesyv/MR6jEOYB4CdELm78vT8
        74Siz8nO0toMWqVWnfYQ21pW
X-Google-Smtp-Source: ABdhPJz+2VDYqCnvYwybRjQv2+3TBafhRa4neGVFw6EbqMn2U+ZqSJ0ki6HWcr8L1/t9t5D8B+CNbA==
X-Received: by 2002:aa7:9f4e:0:b029:142:2501:39f1 with SMTP id h14-20020aa79f4e0000b0290142250139f1mr356651pfr.64.1601054179498;
        Fri, 25 Sep 2020 10:16:19 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id 25sm3171394pfj.35.2020.09.25.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 10:16:18 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: core: debugfs: Use correct format specifiers for addresses
Date:   Fri, 25 Sep 2020 22:46:08 +0530
Message-Id: <20200925171608.30881-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For exposing the addresses of read/write pointers and doorbell register,
let's use the correct format specifiers. This fixes the following issues
generated using W=1 build in ARM32 and reported by Kbuild bot:

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/core/debugfs.c:75:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
                              mhi_event->db_cfg.db_val);
                              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/debugfs.c:123:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
                              mhi_chan->db_cfg.db_val);
                              ^~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.

drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_events_show’:
drivers/bus/mhi/core/debugfs.c:74:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
   seq_printf(m, " local rp: 0x%llx db: 0x%pad\n", (u64)ring->rp,
                                                   ^
drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_channels_show’:
drivers/bus/mhi/core/debugfs.c:122:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
       (u64)ring->rp, (u64)ring->wp,
       ^
drivers/bus/mhi/core/debugfs.c:122:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
       (u64)ring->rp, (u64)ring->wp,
                      ^
drivers/bus/mhi/core/debugfs.c:121:62: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 5 has type ‘dma_addr_t {aka unsigned int}’ [-Wformat=]
   seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
                                                           ~~~^
                                                           %x
drivers/bus/mhi/core/debugfs.c:123:7:
       mhi_chan->db_cfg.db_val);

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Greg: This fixes the issue seen while testing the char-misc/char-misc-testing
branch.

 drivers/bus/mhi/core/debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
index 53d05a8e168d..2536ff92b76f 100644
--- a/drivers/bus/mhi/core/debugfs.c
+++ b/drivers/bus/mhi/core/debugfs.c
@@ -71,8 +71,8 @@ static int mhi_debugfs_events_show(struct seq_file *m, void *d)
 		seq_printf(m, " rp: 0x%llx wp: 0x%llx", er_ctxt->rp,
 			   er_ctxt->wp);
 
-		seq_printf(m, " local rp: 0x%llx db: 0x%llx\n", (u64)ring->rp,
-			   mhi_event->db_cfg.db_val);
+		seq_printf(m, " local rp: 0x%px db: 0x%pad\n", ring->rp,
+			   &mhi_event->db_cfg.db_val);
 	}
 
 	return 0;
@@ -118,9 +118,9 @@ static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
 		seq_printf(m, " base: 0x%llx len: 0x%llx wp: 0x%llx",
 			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->wp);
 
-		seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
-			   (u64)ring->rp, (u64)ring->wp,
-			   mhi_chan->db_cfg.db_val);
+		seq_printf(m, " local rp: 0x%px local wp: 0x%px db: 0x%pad\n",
+			   ring->rp, ring->wp,
+			   &mhi_chan->db_cfg.db_val);
 	}
 
 	return 0;
-- 
2.17.1

