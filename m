Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23622F69B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 19:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbhANSiW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 13:38:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:50812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbhANSiW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 13:38:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A80423B1A;
        Thu, 14 Jan 2021 18:37:39 +0000 (UTC)
Date:   Thu, 14 Jan 2021 18:37:37 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Srinivas Ramana <sramana@codeaurora.org>, will@kernel.org,
        pajay@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: cpufeature: Add filter function to control
Message-ID: <20210114183737.GG16561@gaia>
References: <1610152163-16554-1-git-send-email-sramana@codeaurora.org>
 <6dfdf691b5ed57df81c4c61422949af5@misterjones.org>
 <c028d65d-27c3-826a-b16c-407e9cf48aac@codeaurora.org>
 <7b53c01dd5afcb29679c3a9cf72407a9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b53c01dd5afcb29679c3a9cf72407a9@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 14, 2021 at 08:20:52AM +0000, Marc Zyngier wrote:
> On 2021-01-14 07:15, Srinivas Ramana wrote:
> > On 1/11/2021 5:40 AM, Marc Zyngier wrote:
> > > On 2021-01-09 00:29, Srinivas Ramana wrote:
> > > > This patchset adds a control function for cpufeature framework
> > > > so that the feature can be controlled at runtime.
> > > > 
> > > > Defer PAC on boot core and use the filter function added to disable
> > > > PAC from command line. This will help toggling the feature on systems
> > > > that do not support PAC or where PAC needs to be disabled at runtime,
> > > > without modifying the core kernel.
[...]
> > > I've been working for some time on a similar series to allow a feature
> > > set to be disabled during the early boot phase, initially to prevent
> > > booting a kernel with VHE, but the mechanism is generic enough to
> > > deal with most architectural features.
> > > 
> > > I took the liberty to lift your first patch and to add it to my
> > > series[1],
> > > further allowing PAuth to be disabled at boot time on top of BTI and
> > > VHE.
> > > 
> > > I'd appreciate your comments on this.
> > 
> > Thanks for sending this series. It seems to be more flexible compared
> > you what we did.
> > Following your discussion on allowing EXACT ftr_reg values.
> > 
> > Btw, do you have plan to add MTE in similar lines to control the
> > feature?
> > We may be needing this on some systems.
> 
> I don't have any need for this at the moment, as my initial goal was
> to enable a different boot flow for VHE. The BTI "support" was added
> as a way to demonstrate the use of __read_sysreg_by_encoding(), and
> your patches were a good opportunity to converge on a single solution.
> 
> But if you write the patches that do that, I can add them to the series,
> and Catalin/Will can decide whether they want to take them.

For MTE it's trickier (probably similar to VHE) as we do the setup early
in proc.S before we hit the cpufeature infrastructure.

So far we haven't agreed on disabling MTE means - is it disabled
completely (no Normal Tagged memory type) or we just need to disable tag
checking? The former is required if we expect buggy hardware (SoC-level,
not necessarily CPU). The latter, at least for the kernel, is already
handled via the kasan.mode cmdline. For user, we can disable the tagged
address ABI via sysctl (or kernel cmdline) and it indirectly disabled
MTE since the C library detects this.

-- 
Catalin
