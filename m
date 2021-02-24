Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80CB324178
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 17:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbhBXP5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 10:57:01 -0500
Received: from z11.mailgun.us ([104.130.96.11]:32165 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234040AbhBXPQQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 10:16:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614179724; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=aw/tFs/cjUkoG4kb5SPWP4OoSHXpHKlRuPlwbJQiEa8=; b=rLEKr3En2Kq5lK5IwFwRjRTEXSN0053NIwXdBakx45bkzF6Jh28ysf/2sWMeSFayL2Y3qi42
 scY3FTRZpIuC663NGNsBE7aJu96gQxDw2RVoIUOwaje1w/vEkn4Kp1MymLnesV60k+Dvbl2R
 nY4FTcGNbx8i+HlIGBmfAx5W3WM=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60366d6fba086638307932a9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 15:14:55
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 97736C433ED; Wed, 24 Feb 2021 15:14:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 939CAC433C6;
        Wed, 24 Feb 2021 15:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 939CAC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Check state before processing
 power_down
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1613580211-22744-1-git-send-email-jhugo@codeaurora.org>
 <20210224095504.GQ27945@work>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <c67dac35-49d8-212f-824d-5ba52513ac8a@codeaurora.org>
Date:   Wed, 24 Feb 2021 08:14:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224095504.GQ27945@work>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/24/2021 2:55 AM, Manivannan Sadhasivam wrote:
> On Wed, Feb 17, 2021 at 09:43:31AM -0700, Jeffrey Hugo wrote:
>> We cannot process a power_down if the power state is DISABLED.  There is
>> no valid mhi_ctxt in that case, so attepting to process the power_down
>> will likely result in a null pointer dereference.  If the power state is
>> DISABLED, there is nothing to do anyways, so just bail early.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>
>> v2: Fix subject and tweak the locking to avoid needless lock/unlock/relock
>>
>>   drivers/bus/mhi/core/pm.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> index 56ba3ab..47f6621 100644
>> --- a/drivers/bus/mhi/core/pm.c
>> +++ b/drivers/bus/mhi/core/pm.c
>> @@ -1144,6 +1144,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>>   		mhi_deinit_dev_ctxt(mhi_cntrl);
>>   
>>   error_dev_ctxt:
>> +	mhi_cntrl->pm_state = MHI_PM_DISABLE;
>>   	mutex_unlock(&mhi_cntrl->pm_mutex);
>>   
>>   	return ret;
>> @@ -1155,11 +1156,17 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>>   	enum mhi_pm_state cur_state, transition_state;
>>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>   
>> +	mutex_lock(&mhi_cntrl->pm_mutex);
>> +	cur_state = mhi_cntrl->pm_state;
> 
> As I said in my previous review, you should use pm_lock for reading the
> pm_state.

You also said on IRC that is a refactor of the entire driver, and not a 
blocker for this fix.  Based on that, I intrepreted your comments as 
nothing needed to be done regarding the locking, so I'm confused by this 
comment.

I'm not entirely sure what you want since I feel like you are giving 
conflicting direction, but I'm guessing you want the lock of the pm_lock 
to be moved up to just under the mutex lock then?

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
