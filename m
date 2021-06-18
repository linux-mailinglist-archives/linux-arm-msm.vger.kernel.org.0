Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267DF3AD4FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jun 2021 00:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234829AbhFRWZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 18:25:31 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:53627 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234826AbhFRWZb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 18:25:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624055001; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ubzEVrSdPA3vjYU/6eZRiUqOhwzl9y2ios8I9n7VFPw=; b=ttIUEPlyTlLkxH0oT42Lnj3tQNuVUUySDXKrU4/rntlZY/zZ4Da/Bog1V/TC9lLxm9blpqZc
 GdwIIvVxOxoJkFufcw2nKlWvdsiycKMt3E6gxMPZ6mK8CqniD6jNm9J4yVIvN7/HIXCGwrpy
 fc4e8kElfLSqWB4EE4/3vKLazrk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60cd1cd4ea2aacd7291bdf36 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 22:23:16
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D694DC43460; Fri, 18 Jun 2021 22:23:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B80F9C433D3;
        Fri, 18 Jun 2021 22:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B80F9C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH] bus: mhi: core: Disable pre-emption for data events tasklet processing
Date:   Fri, 18 Jun 2021 15:23:05 -0700
Message-Id: <1624054985-31365-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With spin_lock_bh(), it is possible that a tasklet processing data
events gets scheduled out if another higher priority tasklet is
ready to run. While the tasklet is sleeping, it can hold the event
ring spinlock and block another tasklet, for example, one processing
an M0 state change event, from acquiring it. This can starve the
core which blocks in an attempt to acquire the spinlock until it
gets released. Fix this issue by disabling pre-emption on the core
processing data events and allow it to run to completion such that
other tasklets do not block for long periods.

Fixes: 1d3173a3bae7 ("bus: mhi: core: Add support for processing events from client device")
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 3775c77..02c8c09 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1036,11 +1036,12 @@ void mhi_ev_task(unsigned long data)
 {
 	struct mhi_event *mhi_event = (struct mhi_event *)data;
 	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
+	unsigned long flags;
 
 	/* process all pending events */
-	spin_lock_bh(&mhi_event->lock);
+	spin_lock_irqsave(&mhi_event->lock, flags);
 	mhi_event->process_event(mhi_cntrl, mhi_event, U32_MAX);
-	spin_unlock_bh(&mhi_event->lock);
+	spin_unlock_irqrestore(&mhi_event->lock, flags);
 }
 
 void mhi_ctrl_ev_task(unsigned long data)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

