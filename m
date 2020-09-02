Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8843625B1B3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 18:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgIBQbF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 12:31:05 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:15824 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726426AbgIBQbF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 12:31:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599064264; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=v7KI2IOZSWqzeky+H8zIluMlkBlqx7++lCpZiGls5wk=; b=NFSvDO0rVMaLtNYPXB/hGJvddvRfKu6/SRITZwGcD0jBQp/oZMr2y2Etdo2s4sDK0z6AzvpK
 z5zTw3mNxbENxBctBDHir1qJ8qLIR96UWwX4SaQDnrMEfcgHTRrW9nCo97LbJuvWMcXj50+N
 GLaVYGsNmApv+d8sOxUpTSAO+uU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f4fc8b673afa3417ee89ed6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Sep 2020 16:30:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E445AC433C9; Wed,  2 Sep 2020 16:30:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.1.38] (unknown [59.99.0.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC518C433C6;
        Wed,  2 Sep 2020 16:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC518C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
Subject: Re: [PATCH V5 0/4] Signaling api support in glink/rpmsg clients
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1593182819-30747-1-git-send-email-deesin@codeaurora.org>
 <20200706180437.GB614737@xps15>
From:   Deepak Kumar Singh <deesin@codeaurora.org>
Message-ID: <5ce032b8-6b26-d0a7-f92d-f8487d810f0c@codeaurora.org>
Date:   Wed, 2 Sep 2020 22:00:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200706180437.GB614737@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/6/2020 11:34 PM, Mathieu Poirier wrote:
> Hi Deepak,
>
> On Fri, Jun 26, 2020 at 08:16:55PM +0530, Deepak Kumar Singh wrote:
>> Change from version 5
>> [V5,4/4] rpmsg: char: Add signal callback and POLLPRI support
>> Updated for sparse warning. Replaced POLLPRI => EPOLLPRI to fix
>> warning.
>>
>> Change from version 4
>> I am taking over these patches from aneela@codeaurora.org
>> Fixed all the trivial review comments.
>>
>> Signal conversion to and from native signal as done in patch V4,2/4
>> is intentional.
>>
>> Arun Kumar Neelakantam (3):
>>    rpmsg: glink: Add support to handle signals command
>>    rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
>>    rpmsg: char: Add signal callback and POLLPRI support
>>
>> Deepak Kumar Singh (1):
>>    rpmsg: core: Add signal API support
> I'm confused here - V5 (or what I think it is) was sent out on June 24th without
> a cover letter.  This set has a cover letter but it is labeled V5.  So is this
> the cover letter that should have been sent out on the 24th and the content
> herein relevent to that set?  Or is it accurate and the label on the cover
> letter of this set is wrong and should have been V6?
>
> I have little confidence in both sets and as such won't be reviewing them.
> Please send a new revision that is properly labeled.
>
> Thanks,
> Mathieu
>
Mistakenly i forgot to update label for cover letter to V6.

I have uploaded patch set V7 with updated cover letter.

There is no change in patches.

>>   drivers/rpmsg/qcom_glink_native.c | 125 ++++++++++++++++++++++++++++++++++++++
>>   drivers/rpmsg/rpmsg_char.c        |  76 ++++++++++++++++++++++-
>>   drivers/rpmsg/rpmsg_core.c        |  40 ++++++++++++
>>   drivers/rpmsg/rpmsg_internal.h    |   5 ++
>>   include/linux/rpmsg.h             |  27 ++++++++
>>   5 files changed, 270 insertions(+), 3 deletions(-)
>>
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

