Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62F71CA3C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 08:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgEHGWQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 02:22:16 -0400
Received: from mga06.intel.com ([134.134.136.31]:24128 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727770AbgEHGWO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 02:22:14 -0400
IronPort-SDR: YwEr+wjliCFSMMF5hdlG5SkFgXtOTO77I9OtFK7cpkNHx/nyVa8kCIQE+8UqG7E6KXLst5HCt8
 BFE2+ad9JhPg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 23:22:10 -0700
IronPort-SDR: azBkB2zReMIRea4nr8iqnhF23nH8YNMx7xCa674lRJsz0a/NiGX79HxSVrTkw+t1KLQBS2ryzl
 Hj6QdGpZZndQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="370353268"
Received: from ahunter-desktop.fi.intel.com ([10.237.72.157])
  by fmsmga001.fm.intel.com with ESMTP; 07 May 2020 23:22:07 -0700
From:   Adrian Hunter <adrian.hunter@intel.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sarthak Garg <sartgarg@codeaurora.org>,
        Baolin Wang <baolin.wang@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH RESEND] mmc: block: Fix request completion in the CQE timeout path
Date:   Fri,  8 May 2020 09:22:27 +0300
Message-Id: <20200508062227.23144-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAPDyKFo10JFbe7ZFnRBE2e55eGs-odAWYxU+Ep0S74003aLGpg@mail.gmail.com>
References: <CAPDyKFo10JFbe7ZFnRBE2e55eGs-odAWYxU+Ep0S74003aLGpg@mail.gmail.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

First, it should be noted that the CQE timeout (60 seconds) is substantial
so a CQE request that times out is really stuck, and the race between
timeout and completion is extremely unlikely. Nevertheless this patch
fixes an issue with it.

Commit ad73d6feadbd7b ("mmc: complete requests from ->timeout")
preserved the existing functionality, to complete the request.
However that had only been necessary because the block layer
timeout handler had been marking the request to prevent it from being
completed normally. That restriction was removed at the same time, the
result being that a request that has gone will have been completed anyway.
That is, the completion was unnecessary.

At the time, the unnecessary completion was harmless because the block
layer would ignore it, although that changed in kernel v5.0.

Note for stable, this patch will not apply cleanly without patch "mmc:
core: Fix recursive locking issue in CQE recovery path"

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Fixes: ad73d6feadbd7b ("mmc: complete requests from ->timeout")
Cc: stable@vger.kernel.org
---
 drivers/mmc/core/queue.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
index 72bef39d7011..10ea67892b5f 100644
--- a/drivers/mmc/core/queue.c
+++ b/drivers/mmc/core/queue.c
@@ -110,8 +110,7 @@ static enum blk_eh_timer_return mmc_cqe_timed_out(struct request *req)
 				mmc_cqe_recovery_notifier(mrq);
 			return BLK_EH_RESET_TIMER;
 		}
-		/* No timeout (XXX: huh? comment doesn't make much sense) */
-		blk_mq_complete_request(req);
+		/* The request has gone already */
 		return BLK_EH_DONE;
 	default:
 		/* Timeout is handled by mmc core */
-- 
2.17.1

