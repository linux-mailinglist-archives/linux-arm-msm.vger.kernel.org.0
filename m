Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E961D9ECD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 20:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbgESSHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 14:07:11 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:19774 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726510AbgESSHK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 14:07:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589911629; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=17pbhKPLb0x+5QvEAOVCbb6Ucpo1/xaIDMY482XpM0o=; b=nYV6xYawY9ugHC/tOCt4J287MnT3QXtdIv2EYl9OPtueQpWQtFUm+oqUBTDyjABjYwpKI46f
 nXFPeoinKfOExHAlkXsuiexmVBeOmL2YaXO0bQwt65GFfOMCuZboOp29WtgGMwcV13GvF9lz
 McHdCZyM86rXhQBDdIah14pdbxM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ec4204c087f08818e55d192 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 May 2020 18:07:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B93DAC072A4; Tue, 19 May 2020 18:07:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0DE89C4478F;
        Tue, 19 May 2020 18:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0DE89C4478F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Dave Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <CAPM=9txXskVu_yD3DNuR0HgSUsE2v1Pv98dm=AHGvv_z2XKTAQ@mail.gmail.com>
 <93238096-5861-c140-b94f-6137977c3d65@codeaurora.org>
 <20200519174120.GC1158284@kroah.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <ce0e69ef-116c-df95-c136-d4714e02e96e@codeaurora.org>
Date:   Tue, 19 May 2020 12:07:03 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519174120.GC1158284@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/19/2020 11:41 AM, Greg Kroah-Hartman wrote:
> On Tue, May 19, 2020 at 08:57:38AM -0600, Jeffrey Hugo wrote:
>> On 5/18/2020 11:08 PM, Dave Airlie wrote:
>>> On Fri, 15 May 2020 at 00:12, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>>>
>>>> Introduction:
>>>> Qualcomm Cloud AI 100 is a PCIe adapter card which contains a dedicated
>>>> SoC ASIC for the purpose of efficently running Deep Learning inference
>>>> workloads in a data center environment.
>>>>
>>>> The offical press release can be found at -
>>>> https://www.qualcomm.com/news/releases/2019/04/09/qualcomm-brings-power-efficient-artificial-intelligence-inference
>>>>
>>>> The offical product website is -
>>>> https://www.qualcomm.com/products/datacenter-artificial-intelligence
>>>>
>>>> At the time of the offical press release, numerious technology news sites
>>>> also covered the product.  Doing a search of your favorite site is likely
>>>> to find their coverage of it.
>>>>
>>>> It is our goal to have the kernel driver for the product fully upstream.
>>>> The purpose of this RFC is to start that process.  We are still doing
>>>> development (see below), and thus not quite looking to gain acceptance quite
>>>> yet, but now that we have a working driver we beleive we are at the stage
>>>> where meaningful conversation with the community can occur.
>>>
>>>
>>> Hi Jeffery,
>>>
>>> Just wondering what the userspace/testing plans for this driver.
>>>
>>> This introduces a new user facing API for a device without pointers to
>>> users or tests for that API.
>>
>> We have daily internal testing, although I don't expect you to take my word
>> for that.
>>
>> I would like to get one of these devices into the hands of Linaro, so that
>> it can be put into KernelCI.  Similar to other Qualcomm products. I'm trying
>> to convince the powers that be to make this happen.
>>
>> Regarding what the community could do on its own, everything but the Linux
>> driver is considered proprietary - that includes the on device firmware and
>> the entire userspace stack.  This is a decision above my pay grade.
> 
> Ok, that's a decision you are going to have to push upward on, as we
> really can't take this without a working, open, userspace.

Fair enough.  I hope that your position may have made things easier for me.

I hope this doesn't widen the rift as it were, but what is the "bar" for 
this userspace?

Is a simple test application that adds two numbers on the hardware 
acceptable?

What is the bar "working"?  I intend to satisfy this request in good 
faith, but I wonder, if no one has the hardware besides our customers, 
and possibly KernelCI, can you really say that I've provided a working 
userspace?

> Especially given the copyright owner of this code, that would be just
> crazy and foolish to not have open userspace code as well.  Firmware
> would also be wonderful as well, go poke your lawyers about derivative
> work issues and the like for fun conversations :)

Those are the kind of conversations I try to avoid  :)

> So without that changed, I'm not going to take this, and push to object
> that anyone else take this.
> 
> I'm not going to be able to review any of this code anymore until that
> changes, sorry.
> 
> thanks,
> 
> greg k-h
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
