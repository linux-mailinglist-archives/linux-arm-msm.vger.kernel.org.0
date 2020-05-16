Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9491D643F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2020 23:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgEPV3i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 May 2020 17:29:38 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:42873 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726671AbgEPV3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 May 2020 17:29:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589664577; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=yyI11KWmcGi5NQVxIZYxF6jFoW7UiVn3lFSVRfQoiBk=; b=WrC8AIXqJAgz/3P6sRCckI7HnbQZ/9oZUneCAItSG+Gh8ZatgLlZdNzgZA2JsbiD4bjot0Iy
 bLbcW0efwUZS+MDF34kK5PoYkPCBzQV6pJtjcJccPhkUkzdVhtW4B+pDRwu14j0ZioAS/7dL
 xLu2N/tNHJGabnRobCXmDpi6VCA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec05b33.7f0270f4d1b8-smtp-out-n04;
 Sat, 16 May 2020 21:29:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA65AC43637; Sat, 16 May 2020 21:29:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 60A3AC433D2;
        Sat, 16 May 2020 21:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 60A3AC433D2
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
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <8e06c718-8b8a-f09a-4685-11c0c1581a0c@codeaurora.org>
Date:   Sat, 16 May 2020 15:29:19 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200516070131.GB3964535@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/16/2020 1:01 AM, Greg KH wrote:
> On Fri, May 15, 2020 at 03:08:59PM -0600, Jeffrey Hugo wrote:
>> 2. There are a limited number of dynamic minor numbers for misc devs (64),
>> so if you are expecting more devices than that, a misc dev is not
>> appropiate.  Also, these minors are shared with other misc dev users, so
>> depending on the system configuration, you might have significantly less
>> than 64 minors available for use.
> 
> I'm pretty sure we can have more than 64 misc devices, that limitation
> should have been removed a while ago.  Try it and see :)

In total, there can be more tha 64 misc devices.  However my previous 
comment was specific to dynamic minors (ie devices which do not have an 
assigned minor).  The limit on dynamic minors still apears to be 64. 
Looking at the code -

DYNAMIC_MINORS is still 64
https://elixir.bootlin.com/linux/v5.7-rc5/source/drivers/char/misc.c#L63

I see the same in -next

DYNAMIC_MINORS is used to size a bitmap - one bit for each dynamic minor 
misc device that exists at one particular point in time.  After all 64 
bits are consumed by misc_register() by clients requesting a dynamic 
minor, no more dynamic minor misc devices can be registered until some 
are unregistered.

What am I missing?

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
