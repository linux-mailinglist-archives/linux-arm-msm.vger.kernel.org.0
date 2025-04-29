Return-Path: <linux-arm-msm+bounces-56114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D53D5AA099F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 13:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E7EE7A9519
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7CF29E05B;
	Tue, 29 Apr 2025 11:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hz4du+ZY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED97A2C1099;
	Tue, 29 Apr 2025 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926312; cv=none; b=U1EIS/Naw5dada8JprwxbdvXEPTOv6e+U/PmpFV6Z0SbBiszNLjnvtDaeTLzgmyuXOZtx5Ln6goH6CKOQ7kR11UXH0PavnRQevGfFXWOidGblHUvVDf9DJCN8D11VD3NjiZtas8LyFngh8dB5cvNxoWWwPywI/wjaC0GC1OsFUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926312; c=relaxed/simple;
	bh=BvpiRLn5q1zqS0ANt0tunGv+6IDfRdLg0j1ztQdGuEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atkoyUeVm7IL5itNrRdb+iS+69dGG0vBknvRdRjgkbyIJUkczcMAk/OZn3n9Xl8ZxudjbGcNZaonhen5nfCrKuXTX6X6Zfv1nUsMJXJxjVyYHfr8BIUj5066L1jNF/YDQgXoWkTf9TaWDOU5M/04+K90gqSFmzcjjFdnJbwdfd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hz4du+ZY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9CAC4CEE3;
	Tue, 29 Apr 2025 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745926311;
	bh=BvpiRLn5q1zqS0ANt0tunGv+6IDfRdLg0j1ztQdGuEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hz4du+ZYhItBH+pEiMVkEqulI3w44ZFoSVpduuKNU5Z31A2GbjpT38SI275Is2IGf
	 ctDOuoST6jACwtITo9MNGV3EQSj3NyCmq2Ge6tgJxIzlaCCI66370eTSxacfUpzmB7
	 bbP2EjVnOz8cvz+KDZd0mVZcROXDbCIRq9OISQOnbDrWvP2MIkpnlC1FaJjRJU4qIY
	 Etq/ThOSK6w7oE+e8Pk3c7fixwoYqBz97EeUa4QJeN7Xv6ZKIg6yfv4aT9dLhtQqKH
	 E3iOyy4o9ayi49TvMcynaNrWa7+qEVybDGm0Zx2O2x5CfT0QXH0e2FRYKgBxeLnHP9
	 JoeUuoZQaeo/g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u9jBp-000000003qx-1r60;
	Tue, 29 Apr 2025 13:31:53 +0200
Date: Tue, 29 Apr 2025 13:31:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aBC4qS0fx61qJxkh@hovoldconsulting.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com>
 <aBCE3wSG2g5pp7jg@linaro.org>
 <aBCH4oo7dbG8ajvP@hovoldconsulting.com>
 <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>

On Tue, Apr 29, 2025 at 12:57:16PM +0200, Aleksandrs Vinarskis wrote:
> On Tue, 29 Apr 2025 at 10:03, Johan Hovold <johan@kernel.org> wrote:
> > On Tue, Apr 29, 2025 at 10:50:55AM +0300, Abel Vesa wrote:
> > > On 25-04-29 09:23:46, Johan Hovold wrote:

> > > > But this is the crux; does any off-board LTTPRs in transparent mode add
> > > > to the count or not? If they don't, how would you ever learn that there
> > > > are any LTTPRs? If they do, it seems we may have a problem here.
> > >
> > > Count gets increased either way. It doesn't matter if they are in
> > > transparent mode or not.
> >
> > Thanks for confirming. So then it seems we do have a problem as since
> > 6.15-rc1 drm_dp_lttpr_init() will switch all LTTPRs to non-transparent
> > mode.
> 
> In this case, let me add Fixes to the entire series. Do you think we
> could land it in 6.15-rcX then?

That's for the msm drm maintainers to answer. It should be possible, and
if we agree (or could confirm) that this breaks existing setups then
this needs to be addressed before 6.15 final is out in some way.

Note that you'd need to rebase on rc4 which doesn't have that return
value rework that's in msm-next.

> The second option proposed to roll
> back current LTTPR support and wait until 6.16 will completely break
> DP output on all X1E, so it's very undesirable.

Right, but it wasn't enabled until 6.15-rc1 so that's technically not a
regression (i.e. since 6.14). Essentially, we'd only wait with enabling
DP for another cycle (and I believe DT changes to enable this never made
it into 6.15 either for most laptops anyway).

> This series was tested quite a bit on at least the X1E/X1P devices,
> both with and without docking stations, as it is also (v2 iirc) part
> of Ubuntu's concept tree since little over a month ago. You have
> confirmed that x13s also works with this change but without a docking
> station. If someone could confirm that x13s with this change does work
> with a docking station as well, it would be safe to merge the entire
> series as fix to 6.15, correct? I could reach out on #aarch64-laptops,
> perhaps someone has both x13s (or another qcom-based non X1(E) device)
> and a docking station.

If it fixes a regression then I would merge it for 6.15.

Johan

