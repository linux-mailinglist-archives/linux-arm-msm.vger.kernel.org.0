Return-Path: <linux-arm-msm+bounces-44668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E79CA081EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 22:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3951E160399
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 21:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7101FCF44;
	Thu,  9 Jan 2025 21:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOqkXnAZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8139A19A28D;
	Thu,  9 Jan 2025 21:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736456511; cv=none; b=WiyLXRZmeWjPQfx4d+FvL9MsbWoDezGy9Z6JsNhgDV2SKoRezJDKJZQEdYlT4H+cxOgeuhCSi6fdtkTmQWKmSkvhyY0Dhq8dAet8Iwd+H4gtCrXDO8crZGUw6ZPXgEPPT9m2Re2Ag1IcIdK2jbAojYpOeugmqTGBkaiyaebfaNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736456511; c=relaxed/simple;
	bh=evpyLrwb5xCzL3KqsbV/UkQP1iasF7HeO3v4iOk9K7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8KxbHN0jZCvdBdWlB3UNsFwuWCsZkHJfiZEovc2DuAYg5KeMU15957ou4i0MDMoi3PSPNe/N7hXrOrice8w/EEl1JwRjynXEBulUZ3ZQcXVeOI+TaIxk0s7EswwhADOh8PCj1S12f6aq+gI5ACEx8xtaHsK/xgkkOIdmhUdvdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOqkXnAZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7474EC4CED2;
	Thu,  9 Jan 2025 21:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736456511;
	bh=evpyLrwb5xCzL3KqsbV/UkQP1iasF7HeO3v4iOk9K7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOqkXnAZ3O7YadMWj3OQFiBkPeIWUa8VIw/15/sjDjDp6IB4dsIV0BP5n5XuSK75r
	 kOsldSU3GT2+/71SvKaLghzRf3ZS6ORgmULsYh4eShwXP865lZhBVF5aua8zf1zUim
	 b/l9lDR6dW57mw8X0QBEWDm9+53rMcs23PTnQV5goBXHl/ubxQKD/Me2PZ7F0oxEt/
	 4Z3VhRrWk3gjXPf7jz9bzg98D21aFf47WGooNThCoZvoHZg1kMHvuAnJr7Rbmjk4KP
	 mT+468rzSCvpquEEY8zFyMGayaD2Z/rY0iol7ne0rxyNN1F7RKjcWnkvjLR5SZL0JN
	 ODBy6dYkFp3BQ==
Date: Thu, 9 Jan 2025 15:01:48 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8650: setup cpu thermal with
 idle on high temperatures
Message-ID: <rcoviajiv4wrtnggbrd3l7toysxohu3ysu6xzynjr4fx7j6s5q@5dcepoujtupw>
References: <20250103-topic-sm8650-thermal-cpu-idle-v1-0-faa1f011ecd9@linaro.org>
 <20250103-topic-sm8650-thermal-cpu-idle-v1-1-faa1f011ecd9@linaro.org>
 <qszkxmtrqr62wgd3qx7uctu22w4qrkietasvffinzwmzt7ccum@r26dikuqp7a4>
 <11ca788f-67e6-4e5c-9ace-083b730bc9ce@linaro.org>
 <2xp2xz4w7drpnql5khevz4wenlmiu3omwcilfisb3vvq2jlnwg@tcmjb475kghk>
 <2fcd9a10-ae9e-480f-87a1-5b49e5082ef5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fcd9a10-ae9e-480f-87a1-5b49e5082ef5@linaro.org>

On Wed, Jan 08, 2025 at 10:15:34AM +0100, Neil Armstrong wrote:
> On 08/01/2025 04:11, Bjorn Andersson wrote:
> > On Tue, Jan 07, 2025 at 09:13:18AM +0100, Neil Armstrong wrote:
> > > Hi,
> > > 
> > > On 07/01/2025 00:39, Bjorn Andersson wrote:
> > > > On Fri, Jan 03, 2025 at 03:38:26PM +0100, Neil Armstrong wrote:
> > > > > On the SM8650, the dynamic clock and voltage scaling (DCVS) is done in an
> > > > > hardware controlled loop using the LMH and EPSS blocks with constraints and
> > > > > OPPs programmed in the board firmware.
> > > > > 
> > > > > Since the Hardware does a better job at maintaining the CPUs temperature
> > > > > in an acceptable range by taking in account more parameters like the die
> > > > > characteristics or other factory fused values, it makes no sense to try
> > > > > and reproduce a similar set of constraints with the Linux cpufreq thermal
> > > > > core.
> > > > > 
> > > > > In addition, the tsens IP is responsible for monitoring the temperature
> > > > > across the SoC and the current settings will heavily trigger the tsens
> > > > > UP/LOW interrupts if the CPU temperatures reaches the hardware thermal
> > > > > constraints which are currently defined in the DT. And since the CPUs
> > > > > are not hooked in the thermal trip points, the potential interrupts and
> > > > > calculations are a waste of system resources.
> > > > > 
> > > > > Instead, set higher temperatures in the CPU trip points, and hook some CPU
> > > > > idle injector with a 100% duty cycle at the highest trip point in the case
> > > > > the hardware DCVS cannot handle the temperature surge, and try our best to
> > > > > avoid reaching the critical temperature trip point which should trigger an
> > > > > inevitable thermal shutdown.
> > > > > 
> > > > 
> > > > Are you able to hit these higher temperatures? Do you have some test
> > > > case where the idle-injection shows to be successful in blocking us from
> > > > reaching the critical temp?
> > > 
> > > No, I've been able to test idle-injection and observed a noticeable effect
> > > but I had to set lower trip, do you know how I can easily "block" LMH/EPSS from
> > > scaling down and let the temp go higher ?
> > > 
> > 
> > I don't know how to override that configuration.
> > 
> > > > 
> > > > E.g. in X13s (SC8280XP) we opted for relying on LMH/EPSS and define only
> > > > the critical trip for when the hardware fails us.
> > > 
> > > It's the goal here aswell
> > > 
> > 
> > How about simplifying the patch by removing the idle-injection step and
> > just rely on LMH/EPSS and the "critical" trip (at least until someone
> > can prove that there's value in the extra mitigation)?
> 
> OK, but I see value in this idle injection mitigation in that case LMH/EPSS
> fails, the only factor in control of HLOS is by stopping scheduling tasks
> since frequency won't be able to scale anymore.
> 

I think that sounds good, but afaict we don't have any indication of
this being a problem and we don't have any way to test that it actually
solves that problem.

> Anyway, I agree it can be added later on, so should I drop the 2 trip points
> and only leave the critical one ?
> 

I think that's a simple and functional starting point - and it solves
your IRQ issue.

Regards,
Bjorn

