Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E602CCA9E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 00:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgLBXlv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 18:41:51 -0500
Received: from a2.mail.mailgun.net ([198.61.254.61]:57705 "EHLO
        a2.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgLBXlq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 18:41:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606952487; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/zZ9PrMUSfJKaZKhW4LSC93iI89BZsWElZ7hzgxB2dg=; b=pmF5DGReFPKiqSTobSRUQYwrz2GkyJKFZSZMuk0ea1I8Yh7Dj8U7pafHkY6aIWYc2FPjisH5
 DfOr95pXKEopck+iravv9LCkbDl8rXA9wLu3J74v9eeIR/OiFROEiWxu3ok/WReJX7dwULZR
 u8PcanH9FcHDiVUa6uqJd+ED9CM=
X-Mailgun-Sending-Ip: 198.61.254.61
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fc82602a5d4da3a6c5b027c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Dec 2020 23:40:50
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 40543C433ED; Wed,  2 Dec 2020 23:40:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C24FC43464;
        Wed,  2 Dec 2020 23:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C24FC43464
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 2/7] bus: mhi: core: Allow channel to be disabled from stopped state
Date:   Wed,  2 Dec 2020 15:40:33 -0800
Message-Id: <1606952438-15321-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606952438-15321-1-git-send-email-bbhatt@codeaurora.org>
References: <1606952438-15321-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If a channel was explicitly stopped but not reset, allow it to
move to a disabled state so the channel context can be cleaned
up. As the channel remained in a stopped state, its context was
not reset and cleared, which needs to be done if a client driver
module is unloaded or a device crash occurs.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index f0697f4..e7b9a90 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1288,7 +1288,8 @@ static int mhi_driver_remove(struct device *dev)
 
 		mutex_lock(&mhi_chan->mutex);
 
-		if (ch_state[dir] == MHI_CH_STATE_ENABLED &&
+		if ((ch_state[dir] == MHI_CH_STATE_ENABLED ||
+		    ch_state[dir] == MHI_CH_STATE_STOP) &&
 		    !mhi_chan->offload_ch)
 			mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

