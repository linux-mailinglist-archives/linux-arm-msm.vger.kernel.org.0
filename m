Return-Path: <linux-arm-msm+bounces-87426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06819CF3BA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12983302F83A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC20A2BCF5;
	Mon,  5 Jan 2026 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHqnu5dU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813681E50E;
	Mon,  5 Jan 2026 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767618205; cv=none; b=Kl/UJUm9vFC9nqTOvQu8l7MgM0ucuRqXU0nUcxLDfd8azJ2TzGZtmcd60oNa46INkkBsfKUaMJPY0m2sugaKClYIAD0V/p93CWO3hupSGxAPdQTjyVp+YwqOnkzmVd7WN0Uo71bODjdYs1WFeKBnvfV4S17dvLSuU3mgfq9w6+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767618205; c=relaxed/simple;
	bh=hC1uV+95Tl2qc7sflCQpdulQ3kTuQer5LRR4vuk0b8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEbWxWOrCKFtwu/XFYlZGGFf33tOYb9o/zMa9YjmZZhjICuq2U4OYw1yOxEkTMu0g7TPSJl0k7Abu9k67HD5XKIkc/bugug/yAKQZ8LN3wNmYd6PEuA+7XD+LdR9VrFgW0mYTbcSBjukUygIbkP31eAs89UPd7fbNt7hL2Kfdac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHqnu5dU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31BEC116D0;
	Mon,  5 Jan 2026 13:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767618204;
	bh=hC1uV+95Tl2qc7sflCQpdulQ3kTuQer5LRR4vuk0b8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHqnu5dUw+v3TuJu2saXeC3PPCAoc2XsGsS6VWJT9Kfx+2cQpEnQpobcyY7PEm968
	 eElqWuB3EOx0ksbNUUCsnibYmj9b+spf4AgQuvmynTMgX8/pa+4+/U8sV50xF11vgE
	 It0IoSRIgWL+5gRhGCjSsA5kLG3GuCLKrTTqDVNusicIIMV0vhq6BBzZxo2OixA90c
	 uGXLBK2aX2smbadNHVCdgox0h37xX5Y7ACcHIZbIjoyUOyTYYwNxtmQY+mQfMHpAme
	 1upDAeBxlgz90BT9UjM0sLK010Ee17jLprgr7uU2nOibcxUdXW5Imm5kWj4ygcbjyx
	 9FrZ31FwuXTKg==
Date: Mon, 5 Jan 2026 13:03:20 +0000
From: Will Deacon <will@kernel.org>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: SMP boot issue during system resume
Message-ID: <aVu2mEldTlpMK0hh@willie-the-truck>
References: <dfa19ca7-c4c6-4386-a54d-44d623c8d3ed@quicinc.com>
 <aVfhhXHfFE6lzlzp@willie-the-truck>
 <e71b9bc5-42c1-4295-998e-4a9d71d84b25@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e71b9bc5-42c1-4295-998e-4a9d71d84b25@quicinc.com>

On Mon, Jan 05, 2026 at 04:24:44PM +0530, Pavan Kondeti wrote:
> On Fri, Jan 02, 2026 at 03:17:25PM +0000, Will Deacon wrote:
> > On Mon, Dec 22, 2025 at 11:30:19AM +0530, Pavan Kondeti wrote:
> > > We are seeing a SMP boot issue during system resume when CPUs are brought 
> > > online via pm_sleep_enable_secondary_cpus()->thaw_secondary_cpus()->_cpu_up() 
> > > on ARM64.
> > > 
> > > The _cpu_up() sets a global variable
> > > 
> > > secondary_data.task = idle;
> > > 
> > > and wait for the secondary CPU to come online. A 5 second timeout is
> > > used here. If at all, the secondary CPU comes online after this timeout,
> > > we expect it to loop in kernel via __secondary_too_slow(). However, this
> > > depends on secondary_data.task value. Since we are bringing all disabled
> > > cores, after timeout, we set this global variable to the next CPU idle
> > > task and the late secondary CPU thinks the value is its idle task and
> > > does not enter __secondary_too_slow().
> > > 
> > > An earlier attempt [1] to fix similar issue incrased the timout to 5
> > > seconds. We could reproduce this issue in Linux guest where vCPU
> > > scheduling latency can be higher under heavy load on the host.
> > > 
> > > I would like to seek your inputs on how we can improve the current
> > > situation. We would like to avoid __secondary_too_slow() spin even when
> > > the CPU comes late. This is probably not a desired behavior for other cases like 
> > > Linux running bare metal or some guests. Having a Kconfig option or
> > > kernel param might help here.
> > 
> > You probably want to use the parallel hotplug machinery (or one of the
> > interim steps) for this, as it avoids the global state entirely. I spoke
> > about it at KVM forum [1] and I have some old hacks at [2]. I can dust
> > those off and post them to the list if you like?
> 
> Thanks Will for pointing to your informative talk. I see that your patch
> depends on PSCIv0.2 extension to CPU_ON (context argument) [1]. I am not
> sure if this suit our immediate needs, but it is good to know that we
> have a plan for parallel vCPU hotplug.
> 
> I am happy to test if you have any other patches that address /
> workaround this problem w/o depending on backend/firmware.

Surely you're not using PSCI v0.1 in 2026?

Will

