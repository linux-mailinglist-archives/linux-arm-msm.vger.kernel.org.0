Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5F81BE191
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 16:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgD2Osv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 10:48:51 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:29038 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726781AbgD2Osv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 10:48:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588171729; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cBvwW5avddGOz4+VMKe7nngaLFyj5X3264YJy7F3MiY=;
 b=C30yu2faJjDInPApxiWIRdKCiQw0wNe0dm6Nwk85VF+ju2jngeQIBdOrUupk0u42Rrpy3rgS
 +d16dRq3x5PvFYUHZ/5pMhpDMgxWzI5neQ3gflhonNk8665A1nRmlyKMHsXap569l62Vj7C0
 HVpYDt5jYDqvD6GoieCFf3uO8dM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea993c7.7fd1c86a4ca8-smtp-out-n05;
 Wed, 29 Apr 2020 14:48:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 254D4C433D2; Wed, 29 Apr 2020 14:48:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B7F75C433CB;
        Wed, 29 Apr 2020 14:48:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 29 Apr 2020 20:18:37 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple
 connections
In-Reply-To: <CAJ9a7VgEiX19ukjwakNHBHDeZJ05f5Z7pAYG9iEnpXCuuDfBqg@mail.gmail.com>
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org>
 <cf5852e9-c3c1-3d31-46f0-0370719947ab@arm.com>
 <CAJ9a7VgF3-Hdc7KSw9gVBeXSDHNguhqVhp60oK2XhCtr3DhDqg@mail.gmail.com>
 <84918e7d-c933-3fa1-a61e-0615d4b3cf2c@arm.com>
 <668ea1283a6dd6b34e701972f6f71034@codeaurora.org>
 <5b0f5d77c4eec22d8048bb0ffa078345@codeaurora.org>
 <759d47de-2101-39cf-2f1c-cfefebebd548@arm.com>
 <7d343e96cf0701d91152fd14c2fdec42@codeaurora.org>
 <CAJ9a7VgEiX19ukjwakNHBHDeZJ05f5Z7pAYG9iEnpXCuuDfBqg@mail.gmail.com>
Message-ID: <a4bba03d41a2b0145b3c6c19d48698eb@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

On 2020-04-29 19:57, Mike Leach wrote:
> Hi,
> 

[...]

>> >> Looking more into replicator1(swao_replicator) values as 0x0 even
>> >> after replicator_reset()
>> >> in replicator probe, I added dynamic_replicator_reset in
>> >> dynamic_replicator_enable()
>> >> and am not seeing any hardlockup. Also I added some prints to check
>> >> the idfilter
>> >> values before and after reset and found that its not set to 0xff even
>> >> after replicator_reset()
>> >> in replicator probe, I don't see any other path setting it to 0x0.
>> >>
>> >> After probe:
>> >>
>> >> [    8.477669] func replicator_probe before reset replicator
>> >> replicator1 REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
>> >> [    8.489470] func replicator_probe after reset replicator
>> >> replicator1 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
>> >
>> > AFAICS, after the reset both of them are set to 0xff.
>> 
>> Yes I see this too as we call replicator_reset() in probe. What I 
>> wanted
>> to highlight was the below part where it is set to 0x0 before enabling
>> dynamic replicator.
>> 
>> >
>> >> [    8.502738] func replicator_probe before reset replicator
>> >> replicator0 REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
>> >> [    8.515214] func replicator_probe after reset replicator
>> >> replicator0 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
>> >
>> >
>> >
>> >> localhost ~ #
>> >> localhost ~ #
>> >> localhost ~ # echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>> >> localhost ~ #
>> >> localhost ~ # echo 1 > /sys/bus/coresight/devices/etm0/enable_source
>> >> [   58.490485] func dynamic_replicator_enable before reset replicator
>> >> replicator0 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
>> >> [   58.503246] func dynamic_replicator_enable after reset replicator
>> >> replicator0 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
>> >> [   58.520902] func dynamic_replicator_enable before reset replicator
>> >> replicator1 REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
>> >
>> > You need to find what is resetting the IDFILTERs to 0 for replicator1.
>> >
>> 
>> That is right.
>> 
> 
> By default all replicators have the IDFILTER registers set to 0 out of
> hardware reset. This ensures that programmable replicators behave in
> the same way as non-programmable replicators out of reset.
> 
> The  dynamic_replicator_reset() is of course a driver state reset -
> which filters out all trace on the output ports. The trace is then
> enabled when we set the trace path from source to sink.
> 

Thanks for these explanations.

> It seems to me that you have 2 problems that need solving here:
> 
> 1) Why does the reset_replicator() called from probe() _not_ work
> correctly on replicator 1? It seems to work later if you introduce a
> reset after more of the system has powered and booted. This is
> startiing to look a little like a PM / clocking issue.

reset_replicator() does work in probe correctly for both replicators, 
below logs is collected before and after reset in probe. It is later 
that it's set back to 0x0 and hence the suggestion to look at firmware 
using this replicator1.

[    8.477669] func replicator_probe before reset replicator replicator1 
REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
[    8.489470] func replicator_probe after reset replicator replicator1 
REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff

> 
> This failure is causing the state when we are trying to set an output
> port that both branches of this replicator are enabled for output.
> In effect for this replicator, setting the output port has no effect
> as it is already enabled.
> 
> 2) Why does having both ports of this repilicator enabled cause a hard
> lockup? This is a separate hardware  / system issue.
> 
> The worst that should happen if both branches of a replicator are
> enabled is that you get undesirable back pressure. (e.g. there is a
> system we have seen - I think it is Juno - where there is a static
> replicator feeding the TPIU and ETR - we need to disable the TPIU to
> prevent undesired back pressure).
> 

Ok so hardlockup is not expected because of this backpressure.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
