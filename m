Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD271D6C67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 21:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgEQThZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 15:37:25 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:14570 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726271AbgEQThZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 15:37:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589744244; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=CsqgeE+faSNQ00Ax1SuNjJJHtZAQakq3R2LnrPY8eDk=; b=T04bod5n+ER7Kecz4wzEbvxpWrwwHIZneOx7pqt686VoHVqXmSRdI0VIDJfBRbXmTezducg1
 uYUtXad/RATrTp9hBUI63MxfTV/735NnWIWkQVZF9UTlwMyBQ+W0ixi/dh9nXwmeGaIIbh6S
 7mhUALHkEsa92T5nxPoPBRgmka8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ec192748ebbf95ecb84825c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 17 May 2020 19:37:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 890DFC432C2; Sun, 17 May 2020 19:37:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F53FC433F2;
        Sun, 17 May 2020 19:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F53FC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [RFC PATCH 3/8] qaic: Create char dev
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     arnd@arndb.de, manivannan.sadhasivam@linaro.org,
        bjorn.andersson@linaro.org, wufan@codeaurora.org,
        pratanan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <1589465266-20056-4-git-send-email-jhugo@codeaurora.org>
 <20200514141211.GA2643665@kroah.com>
 <0421a64a-10f3-08df-9ef1-14fdb570db0d@codeaurora.org>
 <20200514155615.GA2963499@kroah.com>
 <4be546d3-b571-0659-0140-f34ec88f95ff@codeaurora.org>
 <4683046a-c6b5-30a5-ef02-2f610523ae1c@codeaurora.org>
 <20200516070131.GB3964535@kroah.com>
 <8e06c718-8b8a-f09a-4685-11c0c1581a0c@codeaurora.org>
 <20200517071417.GA3090070@kroah.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <46581ccf-9cd4-3b9f-9b03-ed1264dac03b@codeaurora.org>
Date:   Sun, 17 May 2020 13:37:20 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200517071417.GA3090070@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/17/2020 1:14 AM, Greg KH wrote:
> On Sat, May 16, 2020 at 03:29:19PM -0600, Jeffrey Hugo wrote:
>> On 5/16/2020 1:01 AM, Greg KH wrote:
>>> On Fri, May 15, 2020 at 03:08:59PM -0600, Jeffrey Hugo wrote:
>>>> 2. There are a limited number of dynamic minor numbers for misc devs (64),
>>>> so if you are expecting more devices than that, a misc dev is not
>>>> appropiate.  Also, these minors are shared with other misc dev users, so
>>>> depending on the system configuration, you might have significantly less
>>>> than 64 minors available for use.
>>>
>>> I'm pretty sure we can have more than 64 misc devices, that limitation
>>> should have been removed a while ago.  Try it and see :)
>>
>> In total, there can be more tha 64 misc devices.  However my previous
>> comment was specific to dynamic minors (ie devices which do not have an
>> assigned minor).  The limit on dynamic minors still apears to be 64. Looking
>> at the code -
>>
>> DYNAMIC_MINORS is still 64
>> https://elixir.bootlin.com/linux/v5.7-rc5/source/drivers/char/misc.c#L63
>>
>> I see the same in -next
>>
>> DYNAMIC_MINORS is used to size a bitmap - one bit for each dynamic minor
>> misc device that exists at one particular point in time.  After all 64 bits
>> are consumed by misc_register() by clients requesting a dynamic minor, no
>> more dynamic minor misc devices can be registered until some are
>> unregistered.
>>
>> What am I missing?
> 
> Oops, nothing, my fault.  We fixed up the allocation of more dynamic
> majors for chardev in 2017 and for some reason I thought we also
> increased the number of misc dynamic minors at the same time, but that
> was incorrect.

No problem.

> I'll gladly take patches that bump up the number of misc minors if
> needed.

I don't think its needed at this time, but I will keep that in mind.

> But to get back to the main issue here, you are only going to have 1 or
> maybe 2 of these devices in a system at a time, right?  So "burning" a
> whole major number for that feels like a waste.

Depends on what the customer wants to do.  We support a number of 
systems, but one in particular has the capability of 6-12 devices.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
