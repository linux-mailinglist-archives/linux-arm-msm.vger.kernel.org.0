Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA0E323BB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 12:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235218AbhBXL5z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 06:57:55 -0500
Received: from z11.mailgun.us ([104.130.96.11]:48288 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235132AbhBXL4m (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 06:56:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614167775; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=1xTiwHVQbpcOCq4r5WdQ2Bx3kJjvFsMZTTmQdPsZALM=; b=D0FIzjha69bDZx6FGsp6YC3Ly0nFJ7zi8H4tf0UY2vtn9cCChafyG4oaFymOaiaUFAn21c7K
 fflDCCqyUZ9V0F224pCZDMIx0r1SOuGWOKdBL9/rx2zPr04PTR1/ga/gjsnGEjMEPdpGTQRY
 s+/74Opng+yAqNmGqq9WTyOglvo=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60363ed448e80e1dc58ae12c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 11:56:04
 GMT
Sender: ylal=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0C43EC43461; Wed, 24 Feb 2021 11:56:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hu-ylal-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ylal)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D095C433C6;
        Wed, 24 Feb 2021 11:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9D095C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=ylal@codeaurora.org
From:   Yogesh Lal <ylal@codeaurora.org>
To:     gregkh@linuxfoundation.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yogesh Lal <ylal@codeaurora.org>
Subject: [PATCH] driver core: Use unbound workqueue for deferred probes
Date:   Wed, 24 Feb 2021 17:25:49 +0530
Message-Id: <1614167749-22005-1-git-send-email-ylal@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Queue deferred driver probes on unbounded workqueue, to allow
scheduler better manage scheduling of long running probes.

Signed-off-by: Yogesh Lal <ylal@codeaurora.org>
---
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

