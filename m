Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B65248A01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 17:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgHRPhk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 11:37:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27711 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728025AbgHRPhj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 11:37:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597765059; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hsDdRxoJeEJ8Y/dmt5JkrFOLYYx8r7UcYhdUGHIviGc=;
 b=B083McDmsp5Ci5RfE3BmiEUpS0Z8/v9RyNywB09PG3JBjPSCnuVfxFfnWxSWsKC92MXo8UZ7
 fWRyEgyWTzRwH9US3DxBJx3xUaTqexEOqdDdYZWD183+PNQAqj6DKNMY2fb+JurkNc+7uKsT
 3tKyHqWxP4yzOmnGFn+Sl4lSxL4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f3bf5c2ba4c2cd367552f9f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 15:37:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7CE07C43391; Tue, 18 Aug 2020 15:37:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D0ADC433C6;
        Tue, 18 Aug 2020 15:37:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 18 Aug 2020 21:07:36 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCHv2] soc: qcom: llcc: Support chipsets that can write to
 llcc registers
In-Reply-To: <CAD=FV=X8yS1gUNhhVNyfuRPzDUheG2Rco2g16KMegCG6fKJw7Q@mail.gmail.com>
References: <20200817144722.6665-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=VE6vCPjDvvP0e73tnd8u5rPuMUa-mwvDazrfUpXP+bKQ@mail.gmail.com>
 <2a0c5fa189dbb2e810ba88f59621b65c@codeaurora.org>
 <CAD=FV=X8yS1gUNhhVNyfuRPzDUheG2Rco2g16KMegCG6fKJw7Q@mail.gmail.com>
Message-ID: <d949bdfa15b133f74a47727401553c76@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 2020-08-18 20:42, Doug Anderson wrote:
> Hi,
> 
<snip>...

> 
> I guess to start, it wasn't obvious (to me) that there were two
> choices and we were picking one.  Mentioning that the other
> alternative was way-based allocation would help a lot.  Even if you
> can't fully explain the differences between the two, adding something
> to the commit message indicating that this is a policy decision (in
> other words, both work but each have their tradeoffs) would help.
> Something like this, if it's correct:
> 
> In general we try to enable capacity based allocation (instead of the
> default way based allocation) since that gives us better performance
> with the current software / hardware configuration.
> 

Thanks, I will add it for next version. Let me also go poke some arch 
teams
to understand if we actually do gain something with this selection, who 
knows
we might get some additional details as well.

>> >
>> > Why are you introducing a whole second table?  Shouldn't you just add
>> > a field to "struct qcom_llcc_config" ?
>> >
>> 
>> This was my 2nd option, first one was to have this based on the 
>> version
>> of LLCC
>> which are exposed by hw info registers. But that didn't turn out good
>> since I
>> couldn't find any relation of this property with LLCC version.
>> 
>> Second option was as you mentioned to have a field to 
>> qcom_llcc_config.
>> Now this is good,
>> but then I thought that if we add LLCC support for 20(random number)
>> SoCs of which
>> 10 is capable of supporting cap_based_alloc and rest 10 are not, then 
>> we
>> will still be adding
>> 20 more lines to each SoC's llcc_config if we follow this 2nd option.
> 
> If you do it right, you'd only need to add lines to the SoCs that need
> it.  Linux conventions in general are that it's OK (and encouraged) to
> rely on the fact that if you don't mention a variable in static
> initialization it's initted to 0/False/NULL.  So if the member
> variable is "need_llcc_config" then you only need to add this in
> places where you're setting it to true.  It only needs to be a boolean
> so if later someone really is worried about all the bytes that flags
> like this are taking up we can use a bitfield.  For now (presumably)
> just adding a boolean would be more efficient since (presumably) the
> extra code needed to access a bitfield would be more than the extra
> data bytes used.  In theory this could also be initdata probably, too.
> 

Yes but in this case we would better be explicit about the capable SoCs
because for someone in QCOM it would be easier to confirm if the SoC is
actually capable but it will not be very obvious for outside folks that
the particular SoC actually supports it. I will use a boolean field 
properly
initialized to indicate if a particular SoC is capable or not.

> 
>> So why not opt for a 3rd option with the table where you just need to
>> specify only the capable
>> targets which is just 10 in our sample case above.
> 
> Are you trying to save space?  ...or complexity?  Sure a good compiler
> will probably pool the constant string here so you won't need to
> allocate it twice, but IMO having a second match table is more
> complex.  You also need at least a pointer + bool per entry.  Each
> probe will now need to parse through all these strings, too.  None of
> this is a big deal, but I'd bet just adding a field to the existing
> struct is lower overhead all around.
> 

Mostly space, but I agree now that the boolean field is indeed better 
than
a separate table.

> 
>> Am I just overthinking this too much and should just go with the 2nd
>> option as you mentioned?
> 
> Someone could feel free to vote against me, but I'd just add to the
> existing config.
> 

I vote for you :)

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
