Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEC8DBE37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 09:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbfJRHVA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 03:21:00 -0400
Received: from inca-roads.misterjones.org ([213.251.177.50]:38292 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389963AbfJRHU7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 03:20:59 -0400
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iLMZE-0002Pk-F0; Fri, 18 Oct 2019 09:20:56 +0200
To:     Stephen Boyd <swboyd@chromium.org>
Subject: Re: Relax CPU features sanity checking on heterogeneous architectures
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Oct 2019 08:20:56 +0100
From:   Marc Zyngier <maz@kernel.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>, <rnayak@codeaurora.org>,
        <suzuki.poulose@arm.com>, <catalin.marinas@arm.com>,
        linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <jeremy.linton@arm.com>,
        <bjorn.andersson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <andrew.murray@arm.com>, <will@kernel.org>, <dave.martin@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <marc.w.gonzalez@free.fr>
In-Reply-To: <5da8c868.1c69fb81.ae709.97ff@mx.google.com>
References: <b3606e76af42f7ecf65b1bfc2a5ed30a@codeaurora.org>
 <20191011105010.GA29364@lakrids.cambridge.arm.com>
 <7910f428bd96834c15fb56262f3c10f8@codeaurora.org>
 <20191011143442.515659f4@why>
 <ac7599b30461d6a814e4f36d68bba6c2@codeaurora.org>
 <5da8c868.1c69fb81.ae709.97ff@mx.google.com>
Message-ID: <c9285391dbbe936d3f242bdd0d226b93@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: swboyd@chromium.org, saiprakash.ranjan@codeaurora.org, mark.rutland@arm.com, rnayak@codeaurora.org, suzuki.poulose@arm.com, catalin.marinas@arm.com, linux-arm-kernel-bounces@lists.infradead.org, linux-kernel@vger.kernel.org, jeremy.linton@arm.com, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, andrew.murray@arm.com, will@kernel.org, dave.martin@arm.com, linux-arm-kernel@lists.infradead.org, marc.w.gonzalez@free.fr
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-17 21:00, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2019-10-11 06:40:13)
>> On 2019-10-11 19:04, Marc Zyngier wrote:
>> > On Fri, 11 Oct 2019 18:47:39 +0530
>> > Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> wrote:
>> >
>> >> Hi Mark,
>> >>
>> >> Thanks a lot for the detailed explanations, I did have a look at 
>> all
>> >> the variations before posting this.
>> >>
>> >> On 2019-10-11 16:20, Mark Rutland wrote:
>> >> > Hi,
>> >> >
>> >> > On Fri, Oct 11, 2019 at 11:19:00AM +0530, Sai Prakash Ranjan 
>> wrote:
>> >> >> On latest QCOM SoCs like SM8150 and SC7180 with big.LITTLE 
>> arch, below
>> >> >> warnings are observed during bootup of big cpu cores.
>> >> >
>> >> > For reference, which CPUs are in those SoCs?
>> >> >
>> >>
>> >> SM8150 is based on Cortex-A55(little cores) and Cortex-A76(big 
>> cores).
>> >> I'm afraid I cannot give details about SC7180 yet.
>> >>
>> >> >> SM8150:
>> >> >> >> [    0.271177] CPU features: SANITY CHECK: Unexpected 
>> variation in
>> >> >> SYS_ID_AA64PFR0_EL1. Boot CPU: 0x00000011112222, CPU4: >> 
>> 0x00000011111112
>> >> >
>> >> > The differing fields are EL3, EL2, and EL1: the boot CPU 
>> supports
>> >> > AArch64 and AArch32 at those exception levels, while the 
>> secondary only
>> >> > supports AArch64.
>> >> >
>> >> > Do we handle this variation in KVM?
>> >>
>> >> We do not support KVM.
>> >
>> > Mainline does. You don't get to pick and choose what is supported 
>> or
>> > not.
>> >
>>
>> Ok thats good.
>>
>
> I want KVM on sc7180. How do I get it? Is something going to not 
> work?

If this SoC is anythinig like SM8150, 32bit guests will be hit and 
miss,
depending on the CPU your guest runs on, or is migrated to. We need to
either drop capabilities from the 32bit-capable CPU, or prevent the
non-32bit capable CPU from booting if a 32bit guest has been started.

You just have to hope that the kernel is entered at EL2, and that QC's
"value add" has been moved somewhere else...

         M.
-- 
Jazz is not dead. It just smells funny...
