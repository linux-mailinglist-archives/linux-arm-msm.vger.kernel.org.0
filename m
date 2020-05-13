Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E3D1D197E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 17:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389252AbgEMPeJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 11:34:09 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:32917 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732415AbgEMPeI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 11:34:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589384047; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/B1KwIugMNvRVoGioXQNdOUSYWGH6kyfWoajYo0fLLM=;
 b=HPaJiN/fNDtVYf+Nfj4GDl515ytCnUUD885Rw6uOUHCLo5hILTwwO64G4sfAYEp+/VF9Y+e2
 QJteM186xrJf4RsegyvE4XLusewBjrfeeNlcI1kx9BJ4gTy/86LyNrQAbVIMlDxSRUiJlpC3
 3VDESzlWrvFX3v6AJg/frl7biYg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebc1356.7efd1e400d18-smtp-out-n02;
 Wed, 13 May 2020 15:33:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2D9FC43637; Wed, 13 May 2020 15:33:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A27DC433D2;
        Wed, 13 May 2020 15:33:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 May 2020 21:03:41 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple
 connections
In-Reply-To: <CAJ9a7VjAoUmMG9pLEzE_rMSpOjwVOi-ZCinF87n9H0JgfMDsiQ@mail.gmail.com>
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org>
 <cf5852e9-c3c1-3d31-46f0-0370719947ab@arm.com>
 <CAJ9a7VgF3-Hdc7KSw9gVBeXSDHNguhqVhp60oK2XhCtr3DhDqg@mail.gmail.com>
 <84918e7d-c933-3fa1-a61e-0615d4b3cf2c@arm.com>
 <668ea1283a6dd6b34e701972f6f71034@codeaurora.org>
 <5b0f5d77c4eec22d8048bb0ffa078345@codeaurora.org>
 <759d47de-2101-39cf-2f1c-cfefebebd548@arm.com>
 <7d343e96cf0701d91152fd14c2fdec42@codeaurora.org>
 <CAJ9a7VgEiX19ukjwakNHBHDeZJ05f5Z7pAYG9iEnpXCuuDfBqg@mail.gmail.com>
 <a4bba03d41a2b0145b3c6c19d48698eb@codeaurora.org>
 <CAJ9a7Vj4eyv1n=RxuqfV=pdBN3SDG+ShYS5J4s40KJtqOnR7vw@mail.gmail.com>
 <ae0fe2050be01cc1403c7d53a0da8cb8@codeaurora.org>
 <b8c1cc35846d425a1677c73fddf5874d@codeaurora.org>
 <eee1b9a90266eed9a9c75401f0679777@codeaurora.org>
 <CAJ9a7Vjd0XG+rAvHptAAjGtE6xRhYsPaOSC_Bf9B-w-FZFu_Qw@mail.gmail.com>
 <47f6d51bfad0a0bf1553e101e6a2c8c9@codeaurora.org>
 <37b3749e-2363-0877-c318-9c334a5d1881@arm.com>
 <d47271ee6a2a6f0f30da7e140b6f196c@codeaurora.org>
 <CAJ9a7Vg95tcgMXgQKLAZc=TpV6FnPZ7wdF=Kwbuy7d2kRCjYQw@mail.gmail.com>
 <364049a30dc9d242ec611bf27a16a6c9@codeaurora.org>
 <CAJ9a7VjAoUmMG9pLEzE_rMSpOjwVOi-ZCinF87n9H0JgfMDsiQ@mail.gmail.com>
Message-ID: <5a76926a6532d3f91cca169d474ba98e@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

On 2020-05-13 03:22, Mike Leach wrote:

[...]

> 
> Looking at the AMBA driver there is a comment there that AMBA does not
> lose state when clocks are removed. This is consistent with the AMBA
> protocol spec which states that AMBA slaves can only be accessed /
> read / write on various strobe signals,  or state reset on PRESET
> signal, all timed by the rising edge of the bus clock. state changes
> are not permitted on clock events alone. Given this static nature of
> AMBA slaves then removing the clock should not have any effect.
> 
> The AMBA driver only /drivers/amba/bus.c  gives permission to
> remove/restore the clocks from the devices (pm_suspend pm_resume
> callbacks) - this reduces the power consumption of these devices if
> the clock is not running, but state must be retained.
> 

Thanks for the clarification.

>> >> >>
>> >> >> pid=0x2bb909 for both replicators. So part number is same.
>> >> >> UCI will be different for different implementation(QCOM maybe
>> >> >> different from ARM),
>> >> >> but will it be different for different replicators under the same
>> >> >> impl(i.e., on QCOM).
>> >> >
>> >> > May be use PIDR4.DES_2 to match the Implementor and apply the work
>> >> > around for all QCOM replicators ?
>> >> >
>> >> > To me that sounds the best option.
>> >> >
>> >>
>> >
>> > I agree, if it can be established that the register values that make
>> > up UCI (pid0-4, devarch, devtype, PID:CLASS==0x9), can correctly
>> > identify the parts then a flag can be set in the probe() function and
>> > acted on during the enable() function.
>> >
>> 
>> So here I have a doubt as to why we need to use UCI because PID =
>> 0x2bb909
>> and CID = 0xb105900d are same for both replicators, so UCI won't
>> identify the
>> different replicators(in same implementation i.e., on QCOM) here.
>> Am I missing something?
>> 
>> Thats why I think Suzuki suggested to use PIDR4_DES2 and check for 
>> QCOM
>> impl
>> and add a workaround for all replicators, something like below: (will
>> need cleaning)
>> 
>> #define PIDR4_DES2      0xFD0
>> 
>> if (FIELD_GET(GENMASK(3, 0), readl_relaxed(drvdata->base + 
>> PIDR4_DES2))
>> == 0x4)
>>         id0val = id1val = 0xff;
>> 
> 
> Please look at the CoreSight components specification 3.0 (ARM IHI
> 0029E) Section B2.1.2 which describes the Unique Component Identifier
> (UCI).
> As mentioned above this consists of a combination of bits from
> multiple registers, including PIDR4.
> 

Ok got it now, thanks for clearing the doubt. I will go ahead with
this method to identify QCOM impl and post a patch.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
