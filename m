Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE42C25C88A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 20:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgICSMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 14:12:45 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:39052 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726025AbgICSMY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 14:12:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599156743; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8/XMhamBhdcUCOmD0hfBr7ADxe7XwLTi7SF/wqJMN48=;
 b=A/Qf77zrFa4N91mPFmSxMe2c5Wrv/XqSzIqAleQmw+boXc6bzalPumc7Yv43+adS57nAomTJ
 lTi8guG4Ff0SrBJ6zU2k/bRNIOR7uL2ZHXcwuYbDSjcqGcCX7XyhPwGJgGUlW3kx+TakSF1K
 RrHk43J8+tYACnof+5S+0HwVFTI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f5131e57f21d51b30e1a5ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 18:11:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1CDFCC43387; Thu,  3 Sep 2020 18:11:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34849C433C8;
        Thu,  3 Sep 2020 18:11:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 03 Sep 2020 23:41:48 +0530
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
In-Reply-To: <CAD=FV=Xbq6nv6t907XScJcfPDzB7B3LWtiT-f3RW3Pgg8uCAXg@mail.gmail.com>
References: <20200817144722.6665-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=VE6vCPjDvvP0e73tnd8u5rPuMUa-mwvDazrfUpXP+bKQ@mail.gmail.com>
 <2a0c5fa189dbb2e810ba88f59621b65c@codeaurora.org>
 <CAD=FV=X8yS1gUNhhVNyfuRPzDUheG2Rco2g16KMegCG6fKJw7Q@mail.gmail.com>
 <d949bdfa15b133f74a47727401553c76@codeaurora.org>
 <7714ee57f75542839d5c33b28f232aa6@codeaurora.org>
 <CAD=FV=Xt0NTNjCEJ2USfyd2qZ+FfBz9xwctbpv+hSWvvCoAZFg@mail.gmail.com>
 <dd60dafcea8b75b10516bf2bc4952abb@codeaurora.org>
 <CAD=FV=WrEh9_XqOvA5mNYQRMDujOWBqeeDFDFj_C3XKy-okGVQ@mail.gmail.com>
 <2fe7e79f4fc877eb5d488d799fbf44d6@codeaurora.org>
 <CAD=FV=Xbq6nv6t907XScJcfPDzB7B3LWtiT-f3RW3Pgg8uCAXg@mail.gmail.com>
Message-ID: <23d34b2a3481900ae06de89623c962ec@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-03 23:08, Doug Anderson wrote:
> Hi,
> 
> On Thu, Sep 3, 2020 at 9:04 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi,
>> 
>> On 2020-09-03 21:24, Doug Anderson wrote:
>> > Hi,
>> >
>> > On Thu, Sep 3, 2020 at 8:47 AM Sai Prakash Ranjan
>> > <saiprakash.ranjan@codeaurora.org> wrote:
>> >>
>> >> On 2020-09-03 19:16, Doug Anderson wrote:
>> >> > Hi,
>> >> >
>> >> > On Thu, Sep 3, 2020 at 2:58 AM Sai Prakash Ranjan
>> >> > <saiprakash.ranjan@codeaurora.org> wrote:
>> >> >>
>> >> >> Hi,
>> >> >>
>> >> >> On 2020-08-18 21:07, Sai Prakash Ranjan wrote:
>> >> >> > Hi Doug,
>> >> >> >
>> >> >> >>
>> >> >> >> I guess to start, it wasn't obvious (to me) that there were two
>> >> >> >> choices and we were picking one.  Mentioning that the other
>> >> >> >> alternative was way-based allocation would help a lot.  Even if you
>> >> >> >> can't fully explain the differences between the two, adding something
>> >> >> >> to the commit message indicating that this is a policy decision (in
>> >> >> >> other words, both work but each have their tradeoffs) would help.
>> >> >> >> Something like this, if it's correct:
>> >> >> >>
>> >> >> >> In general we try to enable capacity based allocation (instead of the
>> >> >> >> default way based allocation) since that gives us better performance
>> >> >> >> with the current software / hardware configuration.
>> >> >> >>
>> >> >> >
>> >> >> > Thanks, I will add it for next version. Let me also go poke some arch
>> >> >> > teams
>> >> >> > to understand if we actually do gain something with this selection, who
>> >> >> > knows
>> >> >> > we might get some additional details as well.
>> >> >> >
>> >> >>
>> >> >> I got some information from arch team today, to quote them exactly:
>> >> >>
>> >> >> 1) What benefits capacity based allocation brings over the default way
>> >> >> based allocation?
>> >> >>
>> >> >> "Capacity based allows finer grain partition. It is not about improved
>> >> >> performance but more flexibility in configuration."
>> >> >>
>> >> >> 2) Retain through power collapse, doesn’t it burn more power?
>> >> >>
>> >> >> "This feature is similar to the standard feature of retention. Yes,
>> >> >> when
>> >> >> we
>> >> >> have cache in retention mode it burns more power but it keeps the
>> >> >> values
>> >> >> so
>> >> >> that when we wake up we can get more cache hits."
>> >> >>
>> >> >>
>> >> >> If its good enough, then I will add this info to the commit msg and
>> >> >> post
>> >> >> next version.
>> >> >
>> >> > Sounds fine to me.  I was mostly looking for a high level idea of what
>> >> > was happening here.  I am at least a little curious about the
>> >> > retention bit.  Is that retention during S3, or during some sort of
>> >> > Runtime PM?  Any idea how much power is burned?  Unless the power is
>> >> > miniscule it seems hard to believe that it would be a net win to keep
>> >> > a cache powered up during S3 unless you're planning on waking up a
>> >> > lot.
>> >> >
>> >>
>> >> The retention setting is based on sub cache id(SCID), so I think its
>> >> for
>> >> runtime pm, the power numbers weren't provided. But I believe these
>> >> decisions are made after solid testing and not some random
>> >> approximations.
>> >
>> > Right, I believe it was tested, I just wonder if it was tested on a
>> > phone vs. a laptop.  A phone is almost constantly waking up to deal
>> > with stuff (which is why my phone battery barely lasts till the end of
>> > the day).  Phones also usually have some type of self refresh on their
>> > panels so they can be suspended even when they look awake which means
>> > even more constant wakeups.  A laptop (especially without panel self
>> > refresh) may have very different usage models.  I'm trying to confirm
>> > that this setting is appropriate for both classes of devices or if it
>> > has been only measured / optimized for the cell phone use case.
>> >
>> 
>> Could be, but there are windows laptops based on QCOM SoCs where these
>> must have also been tested (note that this setting can also be in
>> firmware
>> and no one would know), but I don't have numbers to quantify.
> 
> OK, fair enough.  Thanks for the discussion.  I'm good with a somewhat
> broad explanation in the commit message then and if we find that this
> somehow affects power numbers in a bad way we can track down further.
> 

Thanks, I agree that we should keep an eye in case of any fluctuations 
in power numbers.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
