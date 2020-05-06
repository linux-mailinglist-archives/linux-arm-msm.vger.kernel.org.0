Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2D51C72F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 16:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgEFOfK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 10:35:10 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:32886 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729070AbgEFOfF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 10:35:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588775704; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=VGWu+jgcC6PXT/LdkNQ8zizPYREz2ezvMgLbsLUy08w=; b=ZIV3HIQcwl4Uc3ia0fknHVE/A6C62mmTiRZCNPDDBTbNaoGOtama1aI4J5AEPjIfS05L7khr
 TF0npKVFLFwPVugn+JY+fzoqZOKKDqwsye4WJGsFkmmF2o1ZK47B5bZJxRy+yumbGls5UkRK
 ajU5q+OYMyZ9Dxo3Ofo9ErM2PLQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb2cb0d.7f424385a068-smtp-out-n02;
 Wed, 06 May 2020 14:34:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A5B50C43637; Wed,  6 May 2020 14:34:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F57CC433D2;
        Wed,  6 May 2020 14:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F57CC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     stummala@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        <stable@vger.kernel.org>, Baolin Wang <baolin.wang@linaro.org>,
        Avri Altman <avri.altman@wdc.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH V1 1/2] mmc: core: Check request type before completing the request
Date:   Wed,  6 May 2020 20:04:02 +0530
Message-Id: <1588775643-18037-2-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588775643-18037-1-git-send-email-vbadigan@codeaurora.org>
References: <1588775643-18037-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the request completion path with CQE, request type is being checked
after the request is getting completed. This is resulting in returning
the wrong request type and leading to the IO hang issue.

ASYNC request type is getting returned for DCMD type requests.
Because of this mismatch, mq->cqe_busy flag is never getting cleared
and the driver is not invoking blk_mq_hw_run_queue. So requests are not
getting dispatched to the LLD from the block layer.

All these eventually leading to IO hang issues.
So, get the request type before completing the request.

Cc: <stable@vger.kernel.org> # v4.19+
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/core/block.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 8499b56..c5367e2 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -1370,6 +1370,7 @@ static void mmc_blk_cqe_complete_rq(struct mmc_queue *mq, struct request *req)
 	struct mmc_request *mrq = &mqrq->brq.mrq;
 	struct request_queue *q = req->q;
 	struct mmc_host *host = mq->card->host;
+	enum mmc_issue_type issue_type = mmc_issue_type(mq, req);
 	unsigned long flags;
 	bool put_card;
 	int err;
@@ -1399,7 +1400,7 @@ static void mmc_blk_cqe_complete_rq(struct mmc_queue *mq, struct request *req)
 
 	spin_lock_irqsave(&mq->lock, flags);
 
-	mq->in_flight[mmc_issue_type(mq, req)] -= 1;
+	mq->in_flight[issue_type] -= 1;
 
 	put_card = (mmc_tot_in_flight(mq) == 0);
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
