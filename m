Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CEF2BA727
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 11:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgKTKNf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 05:13:35 -0500
Received: from foss.arm.com ([217.140.110.172]:46578 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726554AbgKTKNe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 05:13:34 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3975B1042;
        Fri, 20 Nov 2020 02:13:34 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.27.176])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93C723F70D;
        Fri, 20 Nov 2020 02:13:31 -0800 (PST)
Date:   Fri, 20 Nov 2020 10:13:24 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Vladimir Murzin <vladimir.murzin@arm.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        suzuki.poulose@arm.com, ionela.voinescu@arm.com,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, catalin.marinas@arm.com,
        Will Deacon <will@kernel.org>, valentin.schneider@arm.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: AMU extension v1 support for cortex A76, A77, A78 CPUs
Message-ID: <20201120101249.GA2328@C02TD0UTHF1T.local>
References: <2cc9dd44-0b4b-94a8-155a-7a2446a1b892@codeaurora.org>
 <1712842eb0767e51155a5396d282102c@kernel.org>
 <e15de351-63c1-2599-82bf-22c95e8a6a62@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e15de351-63c1-2599-82bf-22c95e8a6a62@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 20, 2020 at 09:09:00AM +0000, Vladimir Murzin wrote:
> On 11/20/20 8:56 AM, Marc Zyngier wrote:
> > On 2020-11-20 04:30, Neeraj Upadhyay wrote:
> >> Hi,
> >>
> >> For ARM cortex A76, A77, A78 cores (which as per TRM, support AMU)
> >> AA64PFR0[47:44] field is not set, and AMU does not get enabled for
> >> them.
> >> Can you please provide support for these CPUs in cpufeature.c?
> > 
> > If that was the case, that'd be an erratum, and it would need to be
> > documented as such. It could also be that this is an optional feature
> > for these cores (though the TRM doesn't suggest that).
> > 
> > Can someone at ARM confirm what is the expected behaviour of these CPUs?
> 
> Not a confirmation, but IIRC, these are imp def features, while our cpufeatures
> catches architected one.

We generally don't make use of IMP-DEF featurees because of all the pain
it brings. 

Looking at the Cortex-A76 TRM, the encoding for AMCNTENCLR is:

 Op0: 3  (0b11)
 Op1: 3  (0b011)
 CRn: 15 (0b1111)
 CRm: 9  (0b1001)
 Op2: 7  (0b111)

... whereas the architected encoding (from our sysreg.h) is:

 Op0: 3
 Op1: 3
 CRn: 13
 CRm: 2
 Op2: 4

... so that's a different register with the same name, which is
confusing and unfortunate.

The encodings are different (and I haven't checked whether the fields /
semantics are the same), so it's not just a matter of wiring up new
detection code. There are also IMP-DEF traps in ACTLR_EL3 and ACTLR_EL2
which we can't be certain of the configuration of, and as the registers
are in the IMP-DEF encoding space they'll be trapped by HCR_EL2.TIDCP
and emulated as UNDEFINED by a hypervisor. All of that means that going
by the MIDR alone is not sufficient to know we can safely access the
registers.

So as usual for IMP-DEF stuff I don't think we can or should make use of
this.

Thanks,
Mark.
