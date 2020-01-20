Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C29091421A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 03:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgATCrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jan 2020 21:47:25 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:22649 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728949AbgATCrZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jan 2020 21:47:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579488445; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VMIU6qr3Wgt3xkflneQ7e/aD1ybOQyncDm4GEzhwaY8=;
 b=OswGjo+Ez8QO3NEVvrZiriUQvl1Yayt3E7cSV0eDs9dr6/PfumWtQBgEkTuQYA11DAE+TlS4
 ahzUDDJAwkabnt8RW0PWhRPdf8lPABnteOgF5UOTP1ndeeMmhgwf7ctFomt8gw9n9i7yhonz
 NR3/xqAGBkKtz7NonHb0NjR9u9A=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2514b7.7f584f5d91b8-smtp-out-n02;
 Mon, 20 Jan 2020 02:47:19 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 73A3DC4479F; Mon, 20 Jan 2020 02:47:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9620CC43383;
        Mon, 20 Jan 2020 02:47:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 20 Jan 2020 08:17:17 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        catalin.marinas@arm.com
Cc:     suzuki.poulose@arm.com, linux-kernel@vger.kernel.org,
        jeremy.linton@arm.com, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, andrew.murray@arm.com,
        will@kernel.org, Dave.Martin@arm.com,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: Relax CPU features sanity checking on heterogeneous architectures
In-Reply-To: <20191011135431.GB33537@lakrids.cambridge.arm.com>
References: <b3606e76af42f7ecf65b1bfc2a5ed30a@codeaurora.org>
 <20191011105010.GA29364@lakrids.cambridge.arm.com>
 <20191011143343.541da66c@why>
 <20191011135431.GB33537@lakrids.cambridge.arm.com>
Message-ID: <a6987e0c5a1c986a962fec282dac690d@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark,

On 2019-10-11 19:24, Mark Rutland wrote:
> On Fri, Oct 11, 2019 at 02:33:43PM +0100, Marc Zyngier wrote:
>> On Fri, 11 Oct 2019 11:50:11 +0100
>> Mark Rutland <mark.rutland@arm.com> wrote:
>> 
>> > Hi,
>> >
>> > On Fri, Oct 11, 2019 at 11:19:00AM +0530, Sai Prakash Ranjan wrote:
>> > > On latest QCOM SoCs like SM8150 and SC7180 with big.LITTLE arch, below
>> > > warnings are observed during bootup of big cpu cores.
>> >
>> > For reference, which CPUs are in those SoCs?
>> >
>> > > SM8150:
>> > >
>> > > [    0.271177] CPU features: SANITY CHECK: Unexpected variation in
>> > > SYS_ID_AA64PFR0_EL1. Boot CPU: 0x00000011112222, CPU4: 0x00000011111112
>> >
>> > The differing fields are EL3, EL2, and EL1: the boot CPU supports
>> > AArch64 and AArch32 at those exception levels, while the secondary only
>> > supports AArch64.
>> >
>> > Do we handle this variation in KVM?
>> 
>> We do, at least at vcpu creation time (see kvm_reset_vcpu). But if one
>> of the !AArch32 CPU comes in late in the game (after we've started a
>> guest), all bets are off (we'll schedule the 32bit guest on that CPU,
>> enter the guest, immediately take an Illegal Exception Return, and
>> return to userspace with KVM_EXIT_FAIL_ENTRY).
> 
> Ouch. We certainly can't remove the warning untill we deal with that
> somehow, then.
> 
>> Not sure we could do better, given the HW. My preference would be to
>> fail these CPUs if they aren't present at boot time.
> 
> I agree; I think we need logic to check the ID register fields against
> their EXACT, {LOWER,HIGHER}_SAFE, etc rules regardless of whether we
> have an associated cap. That can then abort a late onlining of a CPU
> which violates those rules w.r.t. the finalised system value.
> 
> I suspect that we may want to split the notion of
> safe-for-{user,kernel-guest} in the feature tables, as if nothing else
> it will force us to consider those cases separately when adding new
> stuff.
> 

I can help with testing these if you have any sample patches.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
