Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7EBB1DB760
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 16:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgETOsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 10:48:21 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:63655 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726436AbgETOsV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 10:48:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589986100; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=qaZ6s9SOH0Sq4cNQeThLfRZPHMC2sU4KEh7rdlDegEs=; b=dg1xXsOA7B2xX2ktw1VkjT7NTrBKSyNXR+I0AY14jn2de6PXNuFNgRHOTL6uVT19u/INV5DP
 WgztcoBhHjrB9fIBuyVLV8P9zqA5YI2AUZBJUJS5czXQJnVUPC3J8aNrN4o5ABkBFFOepYif
 iEW6ET2JCyLt5NddNk8zcrDiclM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ec54333eb073d56919be703 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 May 2020 14:48:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 05497C433A0; Wed, 20 May 2020 14:48:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 271D9C433C6;
        Wed, 20 May 2020 14:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 271D9C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
To:     Daniel Vetter <daniel@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Olof Johansson <olof.johansson@gmail.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Dave Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
 <20200520051536.GA2141566@kroah.com>
 <CAKMK7uEbwTK68sxhf452fPHzAreQqRbRc7=RLGX-9SesXnJnLQ@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <5701b299-7800-1584-4b3a-6147e7ad3fca@codeaurora.org>
Date:   Wed, 20 May 2020 08:48:13 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEbwTK68sxhf452fPHzAreQqRbRc7=RLGX-9SesXnJnLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/20/2020 2:34 AM, Daniel Vetter wrote:
> On Wed, May 20, 2020 at 7:15 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Tue, May 19, 2020 at 10:41:15PM +0200, Daniel Vetter wrote:
>>> On Tue, May 19, 2020 at 07:41:20PM +0200, Greg Kroah-Hartman wrote:
>>>> On Tue, May 19, 2020 at 08:57:38AM -0600, Jeffrey Hugo wrote:
>>>>> On 5/18/2020 11:08 PM, Dave Airlie wrote:
>>>>>> On Fri, 15 May 2020 at 00:12, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>>>>>>
>>>>>>> Introduction:
>>>>>>> Qualcomm Cloud AI 100 is a PCIe adapter card which contains a dedicated
>>>>>>> SoC ASIC for the purpose of efficently running Deep Learning inference
>>>>>>> workloads in a data center environment.
>>>>>>>
>>>>>>> The offical press release can be found at -
>>>>>>> https://www.qualcomm.com/news/releases/2019/04/09/qualcomm-brings-power-efficient-artificial-intelligence-inference
>>>>>>>
>>>>>>> The offical product website is -
>>>>>>> https://www.qualcomm.com/products/datacenter-artificial-intelligence
>>>>>>>
>>>>>>> At the time of the offical press release, numerious technology news sites
>>>>>>> also covered the product.  Doing a search of your favorite site is likely
>>>>>>> to find their coverage of it.
>>>>>>>
>>>>>>> It is our goal to have the kernel driver for the product fully upstream.
>>>>>>> The purpose of this RFC is to start that process.  We are still doing
>>>>>>> development (see below), and thus not quite looking to gain acceptance quite
>>>>>>> yet, but now that we have a working driver we beleive we are at the stage
>>>>>>> where meaningful conversation with the community can occur.
>>>>>>
>>>>>>
>>>>>> Hi Jeffery,
>>>>>>
>>>>>> Just wondering what the userspace/testing plans for this driver.
>>>>>>
>>>>>> This introduces a new user facing API for a device without pointers to
>>>>>> users or tests for that API.
>>>>>
>>>>> We have daily internal testing, although I don't expect you to take my word
>>>>> for that.
>>>>>
>>>>> I would like to get one of these devices into the hands of Linaro, so that
>>>>> it can be put into KernelCI.  Similar to other Qualcomm products. I'm trying
>>>>> to convince the powers that be to make this happen.
>>>>>
>>>>> Regarding what the community could do on its own, everything but the Linux
>>>>> driver is considered proprietary - that includes the on device firmware and
>>>>> the entire userspace stack.  This is a decision above my pay grade.
>>>>
>>>> Ok, that's a decision you are going to have to push upward on, as we
>>>> really can't take this without a working, open, userspace.
>>>
>>> Uh wut.
>>>
>>> So the merge criteria for drivers/accel (atm still drivers/misc but I
>>> thought that was interim until more drivers showed up) isn't actually
>>> "totally-not-a-gpu accel driver without open source userspace".
>>>
>>> Instead it's "totally-not-a-gpu accel driver without open source
>>> userspace" _and_ you have to be best buddies with Greg. Or at least
>>> not be on the naughty company list. Since for habanalabs all you
>>> wanted is a few test cases to exercise the ioctls. Not the entire
>>> userspace.
>>
>> Also, to be fair, I have changed my mind after seeing the mess of
>> complexity that these "ioctls for everyone!" type of pass-through
>> these kinds of drivers are creating.  You were right, we need open
>> userspace code in order to be able to properly evaluate and figure out
>> what they are doing is right or not and be able to maintain things over
>> time correctly.
>>
>> So I was wrong, and you were right, my apologies for my previous
>> stubbornness.
> 
> Awesome and don't worry, I'm pretty sure we've all been stubborn
> occasionally :-)
> 
>  From a drivers/gpu pov I think still not quite there since we also
> want to see the compiler for these programmable accelerator thingies.
> But just having a fairly good consensus that "userspace library with
> all the runtime stuff excluding compiler must be open" is a huge step
> forward. Next step may be that we (kernel overall, drivers/gpu will
> still ask for the full thing) have ISA docs for these programmable
> things, so that we can also evaluate that aspect and gauge how many
> security issues there might be. Plus have a fighting chance to fix up
> the security leaks when (post smeltdown I don't really want to
> consider this an if) someone finds a hole in the hw security wall. At
> least in drivers/gpu we historically have a ton of drivers with
> command checkers to validate what userspace wants to run on the
> accelerator thingie. Both in cases where the hw was accidentally too
> strict, and not strict enough.

I think this provides a pretty clear guidance on what you/the community 
are looking for, both now and possibly in the future.

Thank you.

 From my perspective, it would be really nice if there was something 
like Mesa that was a/the standard for these sorts of accelerators.  Its 
somewhat the wild west, and we've struggled with it.

I don't work on the compiler end of things, but based on what I've seen 
in my project, I think the vendors are going to be highly resistant to 
opening that up.  There is more than just the raw instruction set that 
goes on in the device, and its viewed as "secret sauce" even though I 
agree with your previous statements on that viewpoint.
-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
