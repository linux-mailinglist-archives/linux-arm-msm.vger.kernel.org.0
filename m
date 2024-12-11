Return-Path: <linux-arm-msm+bounces-41570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EDA9ED8DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72EF91688C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FDC1EC4EB;
	Wed, 11 Dec 2024 21:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGiodUnE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAF71EC4D6;
	Wed, 11 Dec 2024 21:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733952858; cv=none; b=YNEuYG4QmRJhblTdoziOyeiKzKOUY0//acGQd4N0dGsnxTCH3ZdlIQ+wq7G1Ebo6Tq5121FDTcHIy2e0XIq4Lx4uI8Qvk5LjrbiqXgS1ZWRfzBAC6wvgPf8TBrdog27uamB02dBWmdE5Ya4ccL1dIXy6sfOTfxm8RN/KCQtt9Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733952858; c=relaxed/simple;
	bh=A4SsJa/gV21qeqY5SupSQf+YT6zTnX33XWVSHXjPKLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9ArUbntPqDMnLwQSFoStcfl4R0e47WpHtomt3PbfR3CjqBvLpx75QwxYzIYe3o6F8ybhasYLW2amph6c+iNJA5RlBQfLX7ZDbOALJuVVhCwo2yFkjLTry6ZEJ5hIdn1puUpe/jIzAPuoqPlfb3XM747Ed5OmKdLylJmMvHfzE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGiodUnE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731DAC4CED2;
	Wed, 11 Dec 2024 21:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733952857;
	bh=A4SsJa/gV21qeqY5SupSQf+YT6zTnX33XWVSHXjPKLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGiodUnETIVdlukXlYOxY5nBS8nYII7/A7aVBVY0mCY7ks8RUzNdDi2051tUWc4hF
	 bPRduByAPOoINo6L1VyQZ2taADNS5SmUeRduni+lqMGoh6+yUeohi8GT7H8na9Z6KK
	 TWlIrR6x6m6GyWWu1/5jZTQDAygYOW9JDWjWnUlFBomEFP695vOa2HD2Shjn5785ki
	 qMdh0zoevPYStzIF9xFofWBQKwOREhsFfowu4PBQNtHPpGethamkGVgvV6aOWkH9aU
	 jqvlfkBU0cxj4M/JyAWIzQKxAjWrVPJd7e+TwGGrvKQeeJv9XXlWBN/UYJFGzCIF1a
	 Qz20EKMWmRrDw==
Date: Wed, 11 Dec 2024 21:34:11 +0000
From: Will Deacon <will@kernel.org>
To: Doug Anderson <dianders@chromium.org>
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
Message-ID: <20241211213410.GB17486@willie-the-truck>
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241210155604.GA15918@willie-the-truck>
 <CAD=FV=U5xraosVuDGXxBN5Ajo0n=s50JZqtgQGPs1C9jM3YaFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U5xraosVuDGXxBN5Ajo0n=s50JZqtgQGPs1C9jM3YaFw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Dec 10, 2024 at 08:53:46AM -0800, Doug Anderson wrote:
> On Tue, Dec 10, 2024 at 7:56 AM Will Deacon <will@kernel.org> wrote:
> > On Mon, Dec 09, 2024 at 09:43:10AM -0800, Douglas Anderson wrote:
> > >
> > > Since Qualcomm CPUs are all derivatives of ARM cores they all have
> > > unique MIDR values. This means that the tables listing necessary
> > > Spectre mitigations need special entries for them. However, those
> > > entries are not present and that means that some Spectre mitigations
> > > are lacking for Qualcomm CPUs.
> > >
> > > I've made an attempt at **GUESSING** what the right patches should be
> > > to enable mitigations for Qualcomm CPUs. This is mostly me searching
> > > the web to figure out what ARM cores various Qualcomm cores are based
> > > off of.
> > >
> > > These patches get more and more sketchy as the series progresses and I
> > > have noted that the later patces DON'T EVEN COMPILE. I have included
> > > them to make it obvious that I think these cores are affected even if
> > > I don't have all the right information to mitigate them. Hopefully
> > > Qualcomm can come and fix this mess for me.
> > >
> > > I'll note that I am certainly no expert on Spectre. Mostly I ended up
> > > here running `lscpu` on a device and noticing that it thought that it
> > > wasn't affected by Spectre v2 when I thought it was.
> >
> > Whilst only Qualcomm can say definitively whether or not they are
> > affected (and what values of 'k' are required for the loop-based
> > workarounds), I can't help but wonder whether the current mitigation
> > code is structured the wrong way around in this case.
> >
> > It looks to me like we don't have a way to identify a "vulnerable" CPU
> > for Spectre-BHB; either a CPU has some sort of mitigation or it's
> > unaffected. That means that there's very little incentive for vendors
> > to add their CPUs to one of the lists -- if they do nothing, userspace
> > is told that everything is golden and they don't pay the performance
> > hit of a workaround!
> >
> > So I think we should consider turning this on its head and assume that
> > CPUs we don't know about are vulnerable, having a list of unaffected
> > cores that predate the introduction of CSV2.3 which can be queried by
> > is_spectre_bhb_affected(). We can do that without the assistance of the
> > CPU vendors.
> >
> > Does that make sense, or did I miss something?
> 
> It makes sense to me. I'm not sure I'd be the best person to actually
> implement that, though. Maybe someone CCed on this thread could take a
> stab at it? It seems like folks from ARM would know the most about the
> various mitigations and which pre-CSV2.3 cores were safe.

I think we could start with an empty list tbh. If you take a stab at it,
I'm happy to review it. Folks with knowledge about the specific CPUs
can send patches on top.

Will

