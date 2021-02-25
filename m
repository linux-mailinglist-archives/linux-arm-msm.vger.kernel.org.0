Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B800B3255A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 19:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbhBYSh3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 13:37:29 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:38273 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232861AbhBYSgR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 13:36:17 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614278149; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3CC93ti6IkBL1OZ7aIKkJiCIAn4gUSUa1+USAaQVhXk=;
 b=k5N0PrxGlNDx5n2MakaAB7DHhOHB9jecBzNKbS+j8VBps/JgCk4rJmDP5NciL0oCi8lEeRDN
 e39D1sgTj+t28eYKdjIwlgIrs0regDBlt0n0XSJ68Jo8PNo9egk1mO1wEbVxD5jZNU/XESjP
 yVMcxrs1ZiwZxyJvWsN6bwfOFew=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6037ede37f306299bfef6e13 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Feb 2021 18:35:15
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 09B47C433C6; Thu, 25 Feb 2021 18:35:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 571ABC433CA;
        Thu, 25 Feb 2021 18:35:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 25 Feb 2021 10:35:13 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo=codeaurora.org@codeaurora.org
Subject: Re: [PATCH] mhi: Fix invalid error returning in mhi_queue
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <b2ddde03-cc80-ad5a-97b0-62ea2091271b@codeaurora.org>
References: <1614247980-1776-1-git-send-email-loic.poulain@linaro.org>
 <b2ddde03-cc80-ad5a-97b0-62ea2091271b@codeaurora.org>
Message-ID: <1bcb75145c431488164f772216007441@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-25 08:18 AM, Jeffrey Hugo wrote:
> On 2/25/2021 3:13 AM, Loic Poulain wrote:
>> mhi_queue returns an error when the doorbell is not accessible in
>> the current state. This can happen when the device is in non M0
>> state, like M3, and needs to be waken-up prior ringing the DB. this
>> case is manager earlier by triggering an asynchronous M3 exit via
> 
> "This case is managed"?
> 
>> controller resume/suspend callbacks, that in turn will cause M0
>> transition and DB update.
>> 
>> So, since it's not an error but just delaying of doorbell update do 
>> not
>> return an error.
>> 
>> That also fix a use after free error for skb case, indeed a caller
> 
> "This also fixes"?
> 
>> queuing skb will try to free the skb if the queueing fails, but in
>> that case queueing has been done.
>> 
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> 
> Is Fixes appropriate since you mention fixing a use after free?
> 
>> ---
>>   drivers/bus/mhi/core/main.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 7fc2482..c780234 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -1031,12 +1031,8 @@ static int mhi_queue(struct mhi_device 
>> *mhi_dev, struct mhi_buf_info *buf_info,
>>   	if (mhi_chan->dir == DMA_TO_DEVICE)
>>   		atomic_inc(&mhi_cntrl->pending_pkts);
>>   -	if (unlikely(!MHI_DB_ACCESS_VALID(mhi_cntrl))) {
>> -		ret = -EIO;
>> -		goto exit_unlock;
>> -	}
>> -
>> -	mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>> +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
>> +		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>>     exit_unlock:
>>   	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>> 
> 
> Seems good to me.  Feel free to add the below on the next revision -
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

Agree with Jeff. Just as a suggestion, I recommend running the commit 
text
through grammarly or any such service once before posting it to avoid 
back
and forth over it.

Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
