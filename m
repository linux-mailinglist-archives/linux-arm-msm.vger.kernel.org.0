Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB1928F8DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 20:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728729AbgJOSsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 14:48:01 -0400
Received: from z5.mailgun.us ([104.130.96.5]:49145 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbgJOSsB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 14:48:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602787680; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=B8lOXAcm+/ugLwAWCtJF7DzjnDIgFnngZ2Vc5EQ5emA=; b=BAPF6Y4Wzt5QW/fJQQGKA20Wxy+6IaqXLiybax6n/IlCqqw5k1CmZEVbvfdvlKB35uprhFR3
 tcDBzdAIBf++j5Zpwed8HAlhPCtSHXlOyhd7hMypXE7pB401gkGlMKwiC39dyQOrocXOtLRA
 pemZ2yaB9dw+kSx8AOiqFoZzIEA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f8899603711fec7b105cf66 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Oct 2020 18:48:00
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 531D0C43382; Thu, 15 Oct 2020 18:47:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 62367C433C9;
        Thu, 15 Oct 2020 18:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62367C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH] bus: mhi: core: Remove double locking from mhi_driver_remove()
Date:   Thu, 15 Oct 2020 11:47:51 -0700
Message-Id: <1602787671-9497-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is double acquisition of the pm_lock from mhi_driver_remove()
function. Remove the read_lock_bh/read_unlock_bh calls for pm_lock
taken during a call to mhi_device_put() as the lock is acquired
within the function already. This will help avoid a potential
kernel panic.

Fixes: 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
Reported-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 0ffdebd..0a09f82 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1276,10 +1276,8 @@ static int mhi_driver_remove(struct device *dev)
 		mutex_unlock(&mhi_chan->mutex);
 	}
 
-	read_lock_bh(&mhi_cntrl->pm_lock);
 	while (mhi_dev->dev_wake)
 		mhi_device_put(mhi_dev);
-	read_unlock_bh(&mhi_cntrl->pm_lock);
 
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

