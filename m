Return-Path: <linux-arm-msm+bounces-41337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF859EB571
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D246A2830ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 15:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A508F20767C;
	Tue, 10 Dec 2024 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYnf0lkm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2AF38DEC;
	Tue, 10 Dec 2024 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733846171; cv=none; b=c3GKTsqUMkOzG/Ty2EsB128FD1kaF51GmFx0C++adNiYAF3DIKjXlnZLUaNHEDnfHEhVmkWNOjIORsEO4HpNRV7BxOq0skgPY/2eT9OocoAJTHgZ/UbyrwTvI/PAZQoLjinAYzfqLOPKLiiuknv4s9XuWHobX99PM57a0Eu59wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733846171; c=relaxed/simple;
	bh=HhaKkPOWT5t8vHReXiS0uw+iv66ryKvHxe3eQejeGhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQgSDF2C/lQQ9VZA3j5B0WgrHKpQmQBQvQ1U/sGoIjDCx+nbh07owWpd9Qrm6/2oraRkHaObceWu20DDVdtHobAyRN8LGpH9tIpjtwYDdaIrKVlLk+y5Uxp7vg5GrhJoA35yxYqWf/qAFNN9bRaVI2chx3zhDGRq2SEwssM94ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYnf0lkm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E08EC4CED6;
	Tue, 10 Dec 2024 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733846171;
	bh=HhaKkPOWT5t8vHReXiS0uw+iv66ryKvHxe3eQejeGhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYnf0lkmS2caHfW7c0KzqTuWpehCijP/2ZLpxOSHTHEYqm/JZhMCxKvROr3HrA9G1
	 O5AgjLUjvSm3P1Q9Wqu+jAgWKPbiGaZxOxdaHjAIB4vLgKnNRT/lWY59ZK8mKO4oke
	 TXZ9UIfD1wVCzuoVqcRwrz02qMsAtherzVCKZpsY9UHc0gk4/p80931LUCyxbTvxTB
	 AIMXvwSxi9Fi+BlEPzbg/CGjEatYT+Ev1Q7v+C107xo4YsthKH4Y+0l8DArI+39mK7
	 c1pD08WZmG8xk2MV1F97AUWI102nYXuCgUKqI2iJOOljLlvyAtGho8k3SWw3fWhq/Z
	 HpZpeTygf83kQ==
Date: Tue, 10 Dec 2024 15:56:04 +0000
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org,
	james.morse@arm.com
Subject: Re: [PATCH 0/6] arm64: errata: Add Qualcomm CPUs to the Spectre
 mitigation lists
Message-ID: <20241210155604.GA15918@willie-the-truck>
References: <20241209174430.2904353-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209174430.2904353-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Doug,

On Mon, Dec 09, 2024 at 09:43:10AM -0800, Douglas Anderson wrote:
> 
> Since Qualcomm CPUs are all derivatives of ARM cores they all have
> unique MIDR values. This means that the tables listing necessary
> Spectre mitigations need special entries for them. However, those
> entries are not present and that means that some Spectre mitigations
> are lacking for Qualcomm CPUs.
> 
> I've made an attempt at **GUESSING** what the right patches should be
> to enable mitigations for Qualcomm CPUs. This is mostly me searching
> the web to figure out what ARM cores various Qualcomm cores are based
> off of.
> 
> These patches get more and more sketchy as the series progresses and I
> have noted that the later patces DON'T EVEN COMPILE. I have included
> them to make it obvious that I think these cores are affected even if
> I don't have all the right information to mitigate them. Hopefully
> Qualcomm can come and fix this mess for me.
> 
> I'll note that I am certainly no expert on Spectre. Mostly I ended up
> here running `lscpu` on a device and noticing that it thought that it
> wasn't affected by Spectre v2 when I thought it was.

Whilst only Qualcomm can say definitively whether or not they are
affected (and what values of 'k' are required for the loop-based
workarounds), I can't help but wonder whether the current mitigation
code is structured the wrong way around in this case.

It looks to me like we don't have a way to identify a "vulnerable" CPU
for Spectre-BHB; either a CPU has some sort of mitigation or it's
unaffected. That means that there's very little incentive for vendors
to add their CPUs to one of the lists -- if they do nothing, userspace
is told that everything is golden and they don't pay the performance
hit of a workaround!

So I think we should consider turning this on its head and assume that
CPUs we don't know about are vulnerable, having a list of unaffected
cores that predate the introduction of CSV2.3 which can be queried by
is_spectre_bhb_affected(). We can do that without the assistance of the
CPU vendors.

Does that make sense, or did I miss something?

Will

