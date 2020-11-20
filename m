Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A8C2BA740
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 11:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbgKTKUr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 05:20:47 -0500
Received: from foss.arm.com ([217.140.110.172]:46716 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgKTKUr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 05:20:47 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D6EC1042;
        Fri, 20 Nov 2020 02:20:46 -0800 (PST)
Received: from bogus (unknown [10.57.54.72])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D13D3F70D;
        Fri, 20 Nov 2020 02:20:44 -0800 (PST)
Date:   Fri, 20 Nov 2020 10:20:42 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Neeraj Upadhyay <neeraju@codeaurora.org>, mark.rutland@arm.com,
        suzuki.poulose@arm.com, ionela.voinescu@arm.com,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, catalin.marinas@arm.com,
        Will Deacon <will@kernel.org>, valentin.schneider@arm.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: AMU extension v1 support for cortex A76, A77, A78 CPUs
Message-ID: <20201120102042.25caeib3iiuxkogt@bogus>
References: <2cc9dd44-0b4b-94a8-155a-7a2446a1b892@codeaurora.org>
 <1712842eb0767e51155a5396d282102c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1712842eb0767e51155a5396d282102c@kernel.org>
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 20, 2020 at 08:56:31AM +0000, Marc Zyngier wrote:
> On 2020-11-20 04:30, Neeraj Upadhyay wrote:
> > Hi,
> >
> > For ARM cortex A76, A77, A78 cores (which as per TRM, support AMU)
> > AA64PFR0[47:44] field is not set, and AMU does not get enabled for
> > them.
> > Can you please provide support for these CPUs in cpufeature.c?
>
> If that was the case, that'd be an erratum, and it would need to be
> documented as such. It could also be that this is an optional feature
> for these cores (though the TRM doesn't suggest that).
>
> Can someone at ARM confirm what is the expected behaviour of these CPUs?

IIRC discussion with Ionela long back, we intentionally decided not to
support IMPDEF(pre 8.4 non-architected so called AMUs) on the CPUs listed
in $subject.

--
Regards,
Sudeep
