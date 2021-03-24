Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F213476BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 12:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbhCXLCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 07:02:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20920 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230334AbhCXLCE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 07:02:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616583724; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=2RVQ/sfwwJRnutauPnT2IsRxUbVjmr4PCprCzzVpFBM=; b=KZGSCa27SUqVKGRaApXWBhTp7aBMqG0ICRGMuLb9RyFqHYLSK/DoFCtHw79uhDiUSvJ3Twsz
 fLmGmThPHYIUhOXBYIY4QUJ71FHhQJ2pPQJ2jo5rRr4KNDcJtYuIqQxx1ctSqUe9XNDkrWcA
 JMZudTcpTQRUoLZpDOaN1c+vijs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 605b1c1ce3fca7d0a616f0f1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Mar 2021 11:01:48
 GMT
Sender: ylal=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2AA70C43461; Wed, 24 Mar 2021 11:01:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hu-ylal-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ylal)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CDE84C433C6;
        Wed, 24 Mar 2021 11:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CDE84C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=ylal@codeaurora.org
From:   Yogesh Lal <ylal@codeaurora.org>
To:     gregkh@linuxfoundation.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yogesh Lal <ylal@codeaurora.org>
Subject: [PATCH V2] driver core: Use unbound workqueue for deferred probes
Date:   Wed, 24 Mar 2021 16:31:38 +0530
Message-Id: <1616583698-6398-1-git-send-email-ylal@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Deferred probe usually runs only on pinned kworkers, which might take
longer time if a device contains multiple sub-devices. One such case
is of sound card on mobile devices, where we have good number of
mixers and controls per mixer.

We observed boot up improvement - deferred probes take ~600ms when bound
to little core kworker and ~200ms when deferred probe is queued on
unbound wq. This is due to scheduler moving the worker running deferred
probe work to big CPUs. Without this change, we see the worker is running
on LITTLE CPU due to affinity.

Since kworker runs deferred probe of several devices, the locality may
not be important. Also, init thread executing driver initcalls, can
potentially migrate as it has cpu affinity set to all cpus.In addition
to this, async probes use unbounded workqueue. So, using unbounded wq for
deferred probes looks to be similar to these w.r.t. scheduling behavior.

Signed-off-by: Yogesh Lal <ylal@codeaurora.org>
---
Changes in v2:
Updating the Changelog with issue description.

 drivers/base/dd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 9179825f..c9c174a 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -182,7 +182,7 @@ static void driver_deferred_probe_trigger(void)
 	 * Kick the re-probe thread.  It may already be scheduled, but it is
 	 * safe to kick it again.
 	 */
-	schedule_work(&deferred_probe_work);
+	queue_work(system_unbound_wq, &deferred_probe_work);
 }
 
 /**
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation

