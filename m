Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5FF1CFC91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 19:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgELRqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 13:46:49 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:45233 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726287AbgELRqs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 13:46:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589305607; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3aBaEIECgRDmS2ZgIu590wveJw/9XS2o1jwt2Ngu7M0=;
 b=j0AIrzQeFtB5gfcUsyPt+wzAJOGGJPeF0wIVecX+P17mps9OuemfKMaHt2m8LEPtIjIhC5eB
 Hc/EgfMqcUj4wKv2gDMIXQCCeEessXYPwxVTwT8VK6R1hbUi10g4mQgp/1blMjBbEP2SdCjA
 pzGhxsM6urI3DMTqBbZdcYGxUXw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebae0f7.7f97a0e7b730-smtp-out-n03;
 Tue, 12 May 2020 17:46:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB116C433CB; Tue, 12 May 2020 17:46:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D88DC43636;
        Tue, 12 May 2020 17:46:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 12 May 2020 23:16:29 +0530
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
In-Reply-To: <CAJ9a7Vg95tcgMXgQKLAZc=TpV6FnPZ7wdF=Kwbuy7d2kRCjYQw@mail.gmail.com>
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
Message-ID: <364049a30dc9d242ec611bf27a16a6c9@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

On 2020-05-12 17:19, Mike Leach wrote:
[...]

>> >>
>> >> Sorry for hurrying up and sending the patch -
>> >> https://lore.kernel.org/patchwork/patch/1239923/.
>> >> I will send v2 based on further feedbacks here or there.
>> >>
>> >>>
>> >>> 1) does this replicator part have a unique ID that differs from the
>> >>> standard ARM designed replicators?
>> >>> If so perhaps link the modification into this. (even if the part no
>> >>> in
>> >>> PIDR0/1 is the same the UCI should be different for a different
>> >>> implementation)
>> >>>
> I have reviewed the replicator driver, and compared to all the other CS 
> drivers.
> This driver appears to be the only one that sets hardware values in
> probe() and expects them to remain in place on enable, and uses that
> state for programming decisions later, despite telling the PM
> infrastructure that it is clear to suspend the device.
> 
> Now we have a system where the replicator hardware is behaving
> differently under the driver, but is it behaving unreasonably?

Thanks for taking your time to review this. For new replicator behaving
unreasonably, I think the assumption that the context is not lost on
disabling clock is flawed since its implementation defined. Is such
assumption documented in any TRM?

>> >>
>> >> pid=0x2bb909 for both replicators. So part number is same.
>> >> UCI will be different for different implementation(QCOM maybe
>> >> different from ARM),
>> >> but will it be different for different replicators under the same
>> >> impl(i.e., on QCOM).
>> >
>> > May be use PIDR4.DES_2 to match the Implementor and apply the work
>> > around for all QCOM replicators ?
>> >
>> > To me that sounds the best option.
>> >
>> 
> 
> I agree, if it can be established that the register values that make
> up UCI (pid0-4, devarch, devtype, PID:CLASS==0x9), can correctly
> identify the parts then a flag can be set in the probe() function and
> acted on during the enable() function.
> 

So here I have a doubt as to why we need to use UCI because PID = 
0x2bb909
and CID = 0xb105900d are same for both replicators, so UCI won't 
identify the
different replicators(in same implementation i.e., on QCOM) here.
Am I missing something?

Thats why I think Suzuki suggested to use PIDR4_DES2 and check for QCOM 
impl
and add a workaround for all replicators, something like below: (will 
need cleaning)

#define PIDR4_DES2	0xFD0

if (FIELD_GET(GENMASK(3, 0), readl_relaxed(drvdata->base + PIDR4_DES2)) 
== 0x4)
	id0val = id1val = 0xff;

... and the rest as you suggested.

> 
> This was a design decision made by the original driver writer. A
> normal AMBA device should not lose context due to clock removal (see
> drivers/amba/bus.c), so resetting in probe means this operation is
> done only once, rather than add overhead in the enable() function,and
> later decisions can be made according to the state of the registers
> set.
> 
> As you have pointed out, for this replicator implementation  the
> context is unfortunately not retained when clocks are removed - so an
> alternative method is required.
> 
> perhaps something like:-
> 
> probe()
> ...
> if (match_id_non_persistent_state_regs(ID))
>     drvdata->check_filter_val_on_enable;
> ....
> 
> and a re-write of enable:-
> 
> enable()
> ...
> CS_UNLOCK()
> id0val = read(IDFILTER0);
> id1val = read(IDFILTER1);
> 
> /* some replicator designs lose context when AMBA clocks are removed -
> check for this */
> if (drvdata->check_filter_val_on_enable && (id0val == id1val == 0x0))
>    id0val = id1val = 0xff;
> 
> if(id0xal == id1val == 0xff)
>    rc =  claim_device()
> 
> if (!rc)
>    switch (outport)
>       case 0: id0val  = 0x0; break
>       case 1: id1va; = 0x0; break;
>      default: rc = -EINVAL;
> 
> if (!rc)
>    write(id0val);
>    write(id1val);
> CS_LOCK()
> return rc;
> ....
> 

Thanks for this detailed idea for workaround. I will add this once we
know whether we need to use UCI or PIDR4_DES2.

> Given that the access to the enable() function is predicated on a
> reference count per active port, there is also a case for dropping the
> check_filter_val_on_enable flag completely - once one port is active,
> then the device will remain enabled until both ports are inactive.
> This still allows for future development of selective filtering per
> port.
> 
> One other point here - there is a case as I mentioned above for moving
> to a stored value model for the driver - as this is the only coresight
> driver that appears to set state in the probe() function rather than
> write all on enable.
> This however would necessitate a more comprehensive re-write.
> 

I would defer this to experts as you or suzuki will have more idea
regarding this than me.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
