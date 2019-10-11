Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0018D4244
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 16:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbfJKOGQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 10:06:16 -0400
Received: from inca-roads.misterjones.org ([213.251.177.50]:60603 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728691AbfJKOGP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 10:06:15 -0400
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by cheepnis.misterjones.org with esmtpsa (TLSv1.2:AES256-GCM-SHA384:256)
        (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iIvYa-0007hw-Ao; Fri, 11 Oct 2019 16:06:12 +0200
Date:   Fri, 11 Oct 2019 15:06:10 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        rnayak@codeaurora.org, suzuki.poulose@arm.com,
        catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        jeremy.linton@arm.com, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, andrew.murray@arm.com,
        will@kernel.org, Dave.Martin@arm.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Relax CPU features sanity checking on heterogeneous
 architectures
Message-ID: <20191011150610.4e528a2d@why>
In-Reply-To: <20191011135431.GB33537@lakrids.cambridge.arm.com>
References: <b3606e76af42f7ecf65b1bfc2a5ed30a@codeaurora.org>
        <20191011105010.GA29364@lakrids.cambridge.arm.com>
        <20191011143343.541da66c@why>
        <20191011135431.GB33537@lakrids.cambridge.arm.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: mark.rutland@arm.com, saiprakash.ranjan@codeaurora.org, rnayak@codeaurora.org, suzuki.poulose@arm.com, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, jeremy.linton@arm.com, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, andrew.murray@arm.com, will@kernel.org, Dave.Martin@arm.com, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 11 Oct 2019 14:54:31 +0100
Mark Rutland <mark.rutland@arm.com> wrote:

> On Fri, Oct 11, 2019 at 02:33:43PM +0100, Marc Zyngier wrote:
> > On Fri, 11 Oct 2019 11:50:11 +0100
> > Mark Rutland <mark.rutland@arm.com> wrote:
> >   
> > > Hi,
> > > 
> > > On Fri, Oct 11, 2019 at 11:19:00AM +0530, Sai Prakash Ranjan wrote:  
> > > > On latest QCOM SoCs like SM8150 and SC7180 with big.LITTLE arch, below
> > > > warnings are observed during bootup of big cpu cores.    
> > > 
> > > For reference, which CPUs are in those SoCs?
> > >   
> > > > SM8150:
> > > > 
> > > > [    0.271177] CPU features: SANITY CHECK: Unexpected variation in
> > > > SYS_ID_AA64PFR0_EL1. Boot CPU: 0x00000011112222, CPU4: 0x00000011111112    
> > > 
> > > The differing fields are EL3, EL2, and EL1: the boot CPU supports
> > > AArch64 and AArch32 at those exception levels, while the secondary only
> > > supports AArch64.
> > > 
> > > Do we handle this variation in KVM?  
> > 
> > We do, at least at vcpu creation time (see kvm_reset_vcpu). But if one
> > of the !AArch32 CPU comes in late in the game (after we've started a
> > guest), all bets are off (we'll schedule the 32bit guest on that CPU,
> > enter the guest, immediately take an Illegal Exception Return, and
> > return to userspace with KVM_EXIT_FAIL_ENTRY).  
> 
> Ouch. We certainly can't remove the warning untill we deal with that
> somehow, then.

Indeed. Same thing applies for hot-removing the AArch32-capable CPUs,
by the way. You'd end-up in a situation where guests can't run, despite
the initial contract that we're happy that configuration.

> > Not sure we could do better, given the HW. My preference would be to
> > fail these CPUs if they aren't present at boot time.  
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

Probably. There are bizarre overlaps, in the sense that some
capabilities (such as this AArch32 EL1 support) are firmly kernel
related, and yet have a direct impact on userspace. KVM blurs the lines
in "interesting" ways... :-(.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
