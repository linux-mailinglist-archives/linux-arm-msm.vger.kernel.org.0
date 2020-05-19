Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F381D9A7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 16:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgESO5y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 10:57:54 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:23871 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728725AbgESO5x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 10:57:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589900271; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=eQq0+XA7BHUTFnG43onEtGZel2grOtppjsJggmTLEhg=; b=pMSCJkwzMGgaVkTg2bICwivdxF4z2Dpc8069oUe/f7Qz7h/dU4OQUH63/jascAPFFmqhSETt
 k1ShvcVMamm44Irz6q5hUnkcQg36gpQwFkVe5S1J9YAYmEAPKqdkK16MnFvVF+CTOGWd2Z7r
 Ll7gwMmOu1nwqRrgrFqoQKGs/nU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec3f3e6.7fc6707bb730-smtp-out-n05;
 Tue, 19 May 2020 14:57:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3EE4C43637; Tue, 19 May 2020 14:57:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7B3BAC433F2;
        Tue, 19 May 2020 14:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7B3BAC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
To:     Dave Airlie <airlied@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <CAPM=9txXskVu_yD3DNuR0HgSUsE2v1Pv98dm=AHGvv_z2XKTAQ@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <93238096-5861-c140-b94f-6137977c3d65@codeaurora.org>
Date:   Tue, 19 May 2020 08:57:38 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9txXskVu_yD3DNuR0HgSUsE2v1Pv98dm=AHGvv_z2XKTAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/18/2020 11:08 PM, Dave Airlie wrote:
> On Fri, 15 May 2020 at 00:12, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> Introduction:
>> Qualcomm Cloud AI 100 is a PCIe adapter card which contains a dedicated
>> SoC ASIC for the purpose of efficently running Deep Learning inference
>> workloads in a data center environment.
>>
>> The offical press release can be found at -
>> https://www.qualcomm.com/news/releases/2019/04/09/qualcomm-brings-power-efficient-artificial-intelligence-inference
>>
>> The offical product website is -
>> https://www.qualcomm.com/products/datacenter-artificial-intelligence
>>
>> At the time of the offical press release, numerious technology news sites
>> also covered the product.  Doing a search of your favorite site is likely
>> to find their coverage of it.
>>
>> It is our goal to have the kernel driver for the product fully upstream.
>> The purpose of this RFC is to start that process.  We are still doing
>> development (see below), and thus not quite looking to gain acceptance quite
>> yet, but now that we have a working driver we beleive we are at the stage
>> where meaningful conversation with the community can occur.
> 
> 
> Hi Jeffery,
> 
> Just wondering what the userspace/testing plans for this driver.
> 
> This introduces a new user facing API for a device without pointers to
> users or tests for that API.

We have daily internal testing, although I don't expect you to take my 
word for that.

I would like to get one of these devices into the hands of Linaro, so 
that it can be put into KernelCI.  Similar to other Qualcomm products. 
I'm trying to convince the powers that be to make this happen.

Regarding what the community could do on its own, everything but the 
Linux driver is considered proprietary - that includes the on device 
firmware and the entire userspace stack.  This is a decision above my 
pay grade.

I've asked for authorization to develop and publish a simple userspace 
application that might enable the community to do such testing, but 
obtaining that authorization has been slow.

> Although this isn't a graphics driver, and Greg will likely merge
> anything to the kernel you throw at him, I do wonder how to validate
> the uapi from a security perspective. It's always interesting when
> someone wraps a DMA engine with user ioctls, and without enough
> information to decide if the DMA engine is secure against userspace
> misprogramming it.

I'm curious, what information might you be looking for?  Are you 
concerned about the device attacking the host, or the host attacking the 
device?

> Also if we don't understand the programming API on board the device,
> we can't tell if the "core" on the device are able to reprogram the
> device engines either.

So, you are looking for details about the messaging protocol which are 
considered opaque to the kernel driver?  Or something else?

> Figuring this out is difficult at the best of times, it helps if there
> is access to the complete device documentation or user space side
> drivers in order to faciliate this.

Regarding access to documentation, sadly that isn't going to happen now, 
or in the near future.  Again, above my pay grade.  The only public 
"documentation" is what you can see from my emails.

I understand your position, and if I can "bound" the information you are 
looking for, I can see what I can do about getting you what you want. 
No promises, but I will try.

> The other area I mention is testing the uAPI, how do you envisage
> regression testing and long term sustainability of the uAPI?

Can you clarify what you mean by "uAPI"?  Are you referring to the 
interface between the device and the kernel driver?

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
