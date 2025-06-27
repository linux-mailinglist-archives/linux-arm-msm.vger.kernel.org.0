Return-Path: <linux-arm-msm+bounces-62768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60481AEB77A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3462F1C41006
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C55F2D3ED9;
	Fri, 27 Jun 2025 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkwl5b7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9902D320B;
	Fri, 27 Jun 2025 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026606; cv=none; b=TA2k1yVAxn4OA6y0kJFpepGjf4dyFKajrlMVjm99EOFLuEW2q2kwmD01X3QEmlf9gQ6a/mcihT/ghUr5/I0nQciSBsB4pdPjNVmip0f93RF1PD7nxAkzti/cvrfOpqhsEVsNKOs7gOEdOZ2lar7RAeTJsJ7XDIL05POqCjNZKTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026606; c=relaxed/simple;
	bh=7A7qCQZs6xFLzHx63vTNdNWHDnU2QpuntINEtIjhKm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0NRHLFB6X9u4OLAlOqGVj5hpA5ATFtjxFeDTsCtNLLM22YjBQUFFZ8ZsnQsodE9ASKCePJknUvEh75Yc9SGUH5fFHq1ukz4By4rrwgFtqk5vEyPF6Gi1dOBV+Cm7wCrctDW1WYO3e2Ud5eZN+rxgM249PKazGs5YmSbkUvEadg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkwl5b7C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D129DC4CEE3;
	Fri, 27 Jun 2025 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751026603;
	bh=7A7qCQZs6xFLzHx63vTNdNWHDnU2QpuntINEtIjhKm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fkwl5b7Ctyr0Nihpk8KmYMbiDLsQw8g11iJT5EVHCfgp1tc+VQNpzzazpsS3folvE
	 JhlamtpTZui6EwWb2y0amcHAXNDTxl4kqMpPBwTjFY6VYwL2G1+56sB6MSoN65iRm3
	 LWIEmCvXB3GYuxwrJ7k/8y1Yt1gzCyM8W/pEJLLfvA5PLJyldWuNmHZRbkUoFf8Gnu
	 H75TcRu7ho2FTucOQLet9LZ3mxaF6THrn66vnj+yDxvYwR3EoSXStNAZRj0bI3+tOM
	 MQa6z9W3bqs8+wnsZXcx26EbVoyAonpDmO1wf+pmAEEWubLd9PJ8yR7gPg7WA2Q5yf
	 Fdm7ehbkkpKPA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uV80Z-000000004Ub-3YOy;
	Fri, 27 Jun 2025 14:16:44 +0200
Date: Fri, 27 Jun 2025 14:16:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Message-ID: <aF6Lq8EFEsyeJ0Ma@hovoldconsulting.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
 <aFlps9iUcD42vN4w@hovoldconsulting.com>
 <diarijcqernpm4v5s6u22jep3gzdrzy7o4dtw5wzmlec75og6y@wlbyjbtvnv3s>
 <aF0WGmnN_8rvI9n1@hovoldconsulting.com>
 <zufyvg4hoxxz4i45pynzta3gyglqvecrmeslnpphsgwmtujivl@t2zbdtejt3x4>
 <aF1Hhs0JAS747SVi@hovoldconsulting.com>
 <4v5gi2woexvho6hc5enhjg5w2couvw2s6ywyhg7rhz7zdtyouo@fcw2bixmqxoh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4v5gi2woexvho6hc5enhjg5w2couvw2s6ywyhg7rhz7zdtyouo@fcw2bixmqxoh>

On Fri, Jun 27, 2025 at 02:09:51AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 26, 2025 at 03:13:42PM +0200, Johan Hovold wrote:

> > Furthermore, getting an allocated block of addresses in SDAM for Linux
> > could be useful for other things too.
> 
> Yes, but this obviously can't happen for released platforms.

We managed to get one for sc8280xp post release (was harder for x1e for
some reason).

> > > > > I think the slightly drifted RTC is still much better than ending up
> > > > > with an RTC value which is significantly off, because it was set via the
> > > > > file modification time.
> > > > 
> > > > I measured drift of 1 second every 3.5 h on the X13s, so having an
> > > > almost correct time with massive drift that cannot be corrected for may
> > > > not necessarily be better.
> > > 
> > > For me it provided a better user experience. Yes, I'm using C630 from
> > > time to time, including the kernel development. A drifted but ticking
> > > RTC is better than the RTC that rolls backs by several months at a
> > > reboot, because of the missing RTC offset info.
> > 
> > Does it have to roll back? Can't you just keep it running after whatever
> > semi-random date it started at?
> 
> It rolls back after reboot.

That's odd. Doesn't happen here with the X1E CRD if I drop the uefi
offset property in DT. I'm back in the seventies but time is strictly
increasing also after reboots.

Perhaps you have some user space setting that resets it?

> > And there is ntp and services like
> > fake-hwclock which saves the time on shutdown too.
> 
> Likewise I can plug in the USB RTC or do something else. NTP requires
> network access, which is fun to have if you are debugging modem of WiFi.
>
> > Anyway, I still do no understand why you seem so reluctant to having a
> > proper functioning RTC using an SDAM offset.
> 
> Because that would be a one-off solution for this particular laptop,
> etc. I want something that other laptops can use without having to find
> another magic value which suits a particular laptop instance.

My point is that it's not really a solution. These machines still do not
have persistent UEFI variables, and now they have an apparently
functional but still broken RTC.

I added support for the UEFI offset to the driver so that the time could
be set on Qualcomm machines. With this series that is still not the
case, even if people may now initially get the impression that it works
since the time is only off by a few seconds (until it becomes minutes
and hours and you starting missing your trains).

Johan

