Return-Path: <linux-arm-msm+bounces-87269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B07CEED6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 16:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D55E5300C0F5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 15:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D83F207A32;
	Fri,  2 Jan 2026 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPeRyB/l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88721F8AC5;
	Fri,  2 Jan 2026 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767367051; cv=none; b=bFUCzSkd3DcdWKomv/bL+yo8mWCfWKHYuh6XafDhseSY1fbHSg/21atCYHGumbMJo9Cmv1lsrB4082lkuvZ4Nlft83o6o03OlILAXg7gHIRAOASlp3jpKndp+oJQxjYaTyYkV6BGBBNEA8ZMMHUb0R4d9zpmXrlBOziMwPTXLko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767367051; c=relaxed/simple;
	bh=rulx+EHiKkHIaxqey/GNbl30vR/k8uss/CMSgWMUHm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jU8R5cPEWjhJ2I1NgmXLCDIa0LJJfIbhYG9SwW3dEIISs1oWkNms76X1l7q6VD3fZPIggh2wQVPNS2AmdJI0Ad9Sd4as3btFEpZ0ar3AefiwVPZkb0dsWXqBIAzJeG2emeXttxXeBzhrzJtMcY3vJ7F/mtWLDcgNK5Nua5Rcykg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPeRyB/l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B16C116B1;
	Fri,  2 Jan 2026 15:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767367050;
	bh=rulx+EHiKkHIaxqey/GNbl30vR/k8uss/CMSgWMUHm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aPeRyB/lM7PAZuJCMi+rKby9A+HuQ77O2vNTC3Ol0XMi5XQ+Rhd4pkGt1QPBgf8KQ
	 SP2QE2foTsYOsSCDdMjDFjky/LyEWHcKJan95zSANSFjC0Xz2RfHKB3SORZU7Ya7aw
	 H29TUFNJH3gcAY7/AfKvG7koaaBgCixokzfQSopcJA6XFQZu5woAueFMhd3CrVkhjp
	 iG1OSIKex6QGytqHHHJYDq/p8iyVR0x3z9nx4ZYDu97xEG8+AunALoiXIUAjqUUwyd
	 Y0q7hTK7Vn9dk2HmPAAE1JN6i1VKOVqZpqJ33oLhkGHXmCYnFlNGVrxmBpBkbA6MCx
	 9nwRSvSseJMuw==
Date: Fri, 2 Jan 2026 15:17:25 +0000
From: Will Deacon <will@kernel.org>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: SMP boot issue during system resume
Message-ID: <aVfhhXHfFE6lzlzp@willie-the-truck>
References: <dfa19ca7-c4c6-4386-a54d-44d623c8d3ed@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfa19ca7-c4c6-4386-a54d-44d623c8d3ed@quicinc.com>

On Mon, Dec 22, 2025 at 11:30:19AM +0530, Pavan Kondeti wrote:
> We are seeing a SMP boot issue during system resume when CPUs are brought 
> online via pm_sleep_enable_secondary_cpus()->thaw_secondary_cpus()->_cpu_up() 
> on ARM64.
> 
> The _cpu_up() sets a global variable
> 
> secondary_data.task = idle;
> 
> and wait for the secondary CPU to come online. A 5 second timeout is
> used here. If at all, the secondary CPU comes online after this timeout,
> we expect it to loop in kernel via __secondary_too_slow(). However, this
> depends on secondary_data.task value. Since we are bringing all disabled
> cores, after timeout, we set this global variable to the next CPU idle
> task and the late secondary CPU thinks the value is its idle task and
> does not enter __secondary_too_slow().
> 
> An earlier attempt [1] to fix similar issue incrased the timout to 5
> seconds. We could reproduce this issue in Linux guest where vCPU
> scheduling latency can be higher under heavy load on the host.
> 
> I would like to seek your inputs on how we can improve the current
> situation. We would like to avoid __secondary_too_slow() spin even when
> the CPU comes late. This is probably not a desired behavior for other cases like 
> Linux running bare metal or some guests. Having a Kconfig option or
> kernel param might help here.

You probably want to use the parallel hotplug machinery (or one of the
interim steps) for this, as it avoids the global state entirely. I spoke
about it at KVM forum [1] and I have some old hacks at [2]. I can dust
those off and post them to the list if you like?

Will

[1] https://www.youtube.com/watch?v=Q6kOshnnQuE
[2] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug

