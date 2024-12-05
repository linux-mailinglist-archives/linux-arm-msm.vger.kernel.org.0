Return-Path: <linux-arm-msm+bounces-40527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFDA9E5A25
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D1581881819
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 15:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F7921C164;
	Thu,  5 Dec 2024 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFBUsTAu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3667C18FDDB;
	Thu,  5 Dec 2024 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733413604; cv=none; b=nUMc3fyMwBkAoAUYtngWa7tgG6Hj2yAOcJayNXRw1egu1pKOcZTl1x2oQKPC1wnNTArOWniPZ0/vpLx0vUwB923awvOrnG2Dd1SPzi6QTlk15slFj0CAgFOIjSqRuhcuvL9+LA7qkBxoRKlTSz0hEbSODrcpe0OFvGArmQwxjcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733413604; c=relaxed/simple;
	bh=XUgUfvQhqp6TE+FyN56I+N5z39+0v+8ATiYd5tg1pEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VThorHiSrY+b17TBrJNdZhfe/YBjQkEz7QWeoiF67kTWo+2FFZYUoGJpSn3ap04j9GnyVw50fNnFAf12EHbSuIaZ7Qdki6g9E4242HK70XZFYKSutw3N/pHsxoXr+ceolG4R64lGNtO6rkjHfaHIwaqePIlsGThCKxu8CR8iMRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFBUsTAu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AC3C4CEDC;
	Thu,  5 Dec 2024 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733413603;
	bh=XUgUfvQhqp6TE+FyN56I+N5z39+0v+8ATiYd5tg1pEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFBUsTAuX+uomTaDzADkbFeUd+l02brO3a0+U0d3Ly4EUtVZE1ofxw9kEZwfjeeMj
	 Hjk5tm8++cXYJB3KP6ZSnfTtrw6AgBssLt9rA9RWRHsKHunGI4ibAGmz3EBDqiN6wW
	 /kVsK6++pI83i1KS08SHyj/wfUm0iASxMtbxL/3QgKpLNQK33vqUSeQZpCB2zQD7//
	 mxAPNZzcr8uGBKPwPUCj0CCBgdzlOOwjlmHSWWUwxFPHmhUfEJ9qkb9NTgNbAqOcEa
	 3CxUAdq7hgLXVgqVl+wVAthxboLE5qeDJkWnz5rOMa5urhmpL0WrlKpH7/AL8gjdd3
	 m6IGusOXydvkg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tJE3u-000000002XY-1U6F;
	Thu, 05 Dec 2024 16:46:43 +0100
Date: Thu, 5 Dec 2024 16:46:42 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Marc Zyngier <maz@kernel.org>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	quic_nkela@quicinc.com, quic_psodagud@quicinc.com,
	abel.vesa@linaro.org
Subject: Re: [PATCH V7 0/2] qcom: x1e80100: Enable CPUFreq
Message-ID: <Z1HK4qIF9dT3x1OY@hovoldconsulting.com>
References: <20241030130840.2890904-1-quic_sibis@quicinc.com>
 <ZyTQ9QD1tEkhQ9eu@hovoldconsulting.com>
 <86plnf11yf.wl-maz@kernel.org>
 <ZyTjiiGc2ApoID9Y@hovoldconsulting.com>
 <86o72z10b6.wl-maz@kernel.org>
 <ZypOY-NCDN9fdMAR@hovoldconsulting.com>
 <86ed3p1rdq.wl-maz@kernel.org>
 <0fd14fb1-736d-cf7f-128f-658bda0de583@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fd14fb1-736d-cf7f-128f-658bda0de583@quicinc.com>

On Thu, Dec 05, 2024 at 04:53:05PM +0530, Sibi Sankar wrote:
> On 11/5/24 23:42, Marc Zyngier wrote:
> > On Tue, 05 Nov 2024 16:57:07 +0000,
> > Johan Hovold <johan@kernel.org> wrote:
> >> On Fri, Nov 01, 2024 at 02:43:57PM +0000, Marc Zyngier wrote:

> >>> I wonder whether the same sort of reset happen on more "commercial"
> >>> systems (such as some of the laptops). You expect that people look at
> >>> the cpufreq stuff closely, and don't see things exploding like we are.
> >>
> >> I finally got around to getting my Lenovo ThinkPad T14s to boot (it
> >> refuses to start the kernel when using GRUB, and it's not due to the
> >> known 64 GB memory issue as it only has 32 GB)
> > 
> > <cry>
> > I know the feeling. My devkit can't use GRUB either, so I added a
> > hook to the GRUB config to generate EFI scripts that directly execute
> > the kernel with initrd, dtb, and command line.
> > 
> > This is probably the worse firmware I've seen in a very long while.
> 
> The PERF_LEVEL_GET implementation in the SCP firmware side
> is the reason for the crash :|, currently there is a bug
> in the kernel that picks up index that we set with LEVEL_SET
> with fast channel and that masks the crash. I was told the
> crash happens when idle states are enabled and a regular
> LEVEL_GET message is triggered from the kernel. This was
> fixed a while back but it will take a while to flow back
> to all the devices. It should already be out CRD's.
> 
> Johan,
> Now that you are aware of the the limitations can we make
> a call on how to deal with this and land cpufreq?

As Marc said, it seems you need to come up with a way to detect and work
around the broken firmware.

We want to get the fast channel issue fixed, but when we merge that fix
it will trigger these crashes if we also merge cpufreq support for x1e.

Can you expand the on the PERF_LEVEL_GET issue? Is it possible to
implement some workaround for the buggy firmware? Like returning a dummy
value? How exactly are things working today? Can't that be used a basis
for a quirk?

> > </cry>
> > 
> >> and can confirm that it
> >> hard resets when accessing the cpufreq sysfs attributes as well.

Johan

