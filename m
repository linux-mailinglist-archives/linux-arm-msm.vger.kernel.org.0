Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDE82BA583
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 10:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgKTJJC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 04:09:02 -0500
Received: from foss.arm.com ([217.140.110.172]:45148 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726739AbgKTJJB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 04:09:01 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DD751042;
        Fri, 20 Nov 2020 01:09:01 -0800 (PST)
Received: from [10.57.26.201] (unknown [10.57.26.201])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B85B3F70D;
        Fri, 20 Nov 2020 01:08:59 -0800 (PST)
Subject: Re: AMU extension v1 support for cortex A76, A77, A78 CPUs
To:     Marc Zyngier <maz@kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>
Cc:     mark.rutland@arm.com, suzuki.poulose@arm.com,
        ionela.voinescu@arm.com, MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, catalin.marinas@arm.com,
        Will Deacon <will@kernel.org>, valentin.schneider@arm.com,
        linux-arm-kernel@lists.infradead.org
References: <2cc9dd44-0b4b-94a8-155a-7a2446a1b892@codeaurora.org>
 <1712842eb0767e51155a5396d282102c@kernel.org>
From:   Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <e15de351-63c1-2599-82bf-22c95e8a6a62@arm.com>
Date:   Fri, 20 Nov 2020 09:09:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1712842eb0767e51155a5396d282102c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/20/20 8:56 AM, Marc Zyngier wrote:
> On 2020-11-20 04:30, Neeraj Upadhyay wrote:
>> Hi,
>>
>> For ARM cortex A76, A77, A78 cores (which as per TRM, support AMU)
>> AA64PFR0[47:44] field is not set, and AMU does not get enabled for
>> them.
>> Can you please provide support for these CPUs in cpufeature.c?
> 
> If that was the case, that'd be an erratum, and it would need to be
> documented as such. It could also be that this is an optional feature
> for these cores (though the TRM doesn't suggest that).
> 
> Can someone at ARM confirm what is the expected behaviour of these CPUs?

Not a confirmation, but IIRC, these are imp def features, while our cpufeatures
catches architected one.

Cheers
Vladimir

> 
>         M.

