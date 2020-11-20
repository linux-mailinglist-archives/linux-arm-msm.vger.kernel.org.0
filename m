Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED712BA72F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 11:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgKTKOx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 05:14:53 -0500
Received: from foss.arm.com ([217.140.110.172]:46614 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726172AbgKTKOw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 05:14:52 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 830031042;
        Fri, 20 Nov 2020 02:14:51 -0800 (PST)
Received: from [10.57.26.201] (unknown [10.57.26.201])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B19D03F70D;
        Fri, 20 Nov 2020 02:14:49 -0800 (PST)
Subject: Re: AMU extension v1 support for cortex A76, A77, A78 CPUs
To:     Marc Zyngier <maz@kernel.org>
Cc:     Neeraj Upadhyay <neeraju@codeaurora.org>, mark.rutland@arm.com,
        suzuki.poulose@arm.com, ionela.voinescu@arm.com,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, catalin.marinas@arm.com,
        Will Deacon <will@kernel.org>, valentin.schneider@arm.com,
        linux-arm-kernel@lists.infradead.org
References: <2cc9dd44-0b4b-94a8-155a-7a2446a1b892@codeaurora.org>
 <1712842eb0767e51155a5396d282102c@kernel.org>
 <e15de351-63c1-2599-82bf-22c95e8a6a62@arm.com>
 <d77713992e5abef5c6066d9f1939e8db@kernel.org>
From:   Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <9c504d04-8d20-91cb-6284-2891589eff37@arm.com>
Date:   Fri, 20 Nov 2020 10:14:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d77713992e5abef5c6066d9f1939e8db@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/20/20 9:54 AM, Marc Zyngier wrote:
> On 2020-11-20 09:09, Vladimir Murzin wrote:
>> On 11/20/20 8:56 AM, Marc Zyngier wrote:
>>> On 2020-11-20 04:30, Neeraj Upadhyay wrote:
>>>> Hi,
>>>>
>>>> For ARM cortex A76, A77, A78 cores (which as per TRM, support AMU)
>>>> AA64PFR0[47:44] field is not set, and AMU does not get enabled for
>>>> them.
>>>> Can you please provide support for these CPUs in cpufeature.c?
>>>
>>> If that was the case, that'd be an erratum, and it would need to be
>>> documented as such. It could also be that this is an optional feature
>>> for these cores (though the TRM doesn't suggest that).
>>>
>>> Can someone at ARM confirm what is the expected behaviour of these CPUs?
>>
>> Not a confirmation, but IIRC, these are imp def features, while our cpufeatures
>> catches architected one.
> 
> Ah, good point. So these CPUs implement some sort of AMU, and not *the* AMU.
> 
> Yet the register names are the same. Who thought that'd be a good idea?

IMO, it is the case where imp def has been generalized into arch extension, so
something have been moved over.

Cheers
Vladimir

> 
>         M.

