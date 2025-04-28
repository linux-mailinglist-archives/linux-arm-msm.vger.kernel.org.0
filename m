Return-Path: <linux-arm-msm+bounces-55919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E31DA9F148
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 14:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 492F93B5DDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 12:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810442222A0;
	Mon, 28 Apr 2025 12:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evPeBLpa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BE4F9D9;
	Mon, 28 Apr 2025 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844426; cv=none; b=rSrkyvz/qgIK2KpNwU2Wqh+Ap1x1w2ni0e57sp1xzSAJvDjgAFQRjNEofV1UqKuo64a6nwpFcXZZ1nLLloHyF+EweyeF9cJZOPaXuORudPVsvCrgQUnqIMAzuFFsdLdComNK1Ic1kawZ+DreZ5A2eJLXfARALdnz8cEVfAvMKSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844426; c=relaxed/simple;
	bh=HsH8nSf/ZGhRZOeMHnaNQznU6FZlvjFFRODGQYmj+JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRNRlu5+uOVJ3rSn/wosoUVzjyVLHujqiu+RK+mH10C/5Lw5OAcf/x2Lu04sACsGdLD1tP3iW8lGp8VwCFcyOnFi2SFT47YaCnDDnYTLftU3CkEWmSXOeZ/8Ae7hFqVE2JsthixKwVisHIqJPmDXH2PgNc6iB/Go1ntNLrjTfgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evPeBLpa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B601CC4CEEE;
	Mon, 28 Apr 2025 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745844424;
	bh=HsH8nSf/ZGhRZOeMHnaNQznU6FZlvjFFRODGQYmj+JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evPeBLpaoctrC5GT63OrxExzUsjgpxglDn0tp5Lk8sirEe7wne4kUoXS8RapfZ3Sl
	 PDaO/2qt4VKJhE5rskd5h2CAlBlSniCYmN19BMYrch4HLuQYHBx6a+UFh6NLXuEgj8
	 8sAeKb9tPeVHSJgLGxAPENU8bPkh/5cQQsGvx1qUWxZjfRxXL3YVoLhIhOrhQg9wl7
	 Osm9FTUWcRiM5N1b7Y3JAQcf9CVdqiMDM8VCAQfzMgo3nln0KS4+qOMJUYRfSxEQWJ
	 /fXC0xTXBPy9ko+uu/Dp1GG13ch0vhXPf+yGhnagiopkwzn4n4XCUA0RXKE5dYC4A5
	 mezPocQXwjeDQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u9Nt2-000000004Gi-3jfr;
	Mon, 28 Apr 2025 14:47:05 +0200
Date: Mon, 28 Apr 2025 14:47:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com, abel.vesa@linaro.org
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aA94yOjsayZHNDpx@hovoldconsulting.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>

On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > to non-transparent mode to enable video output on X1E-based devices
> > > that come with LTTPR on the motherboards. However, video would not work
> > > if additional LTTPR(s) are present between sink and source, which is
> > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> >
> > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > adapters or docks with retimers in transparent mode?
> 
> I am actually not 100% sure.
> - If without LTTPR initialization, they default to transparent mode,
> then yes, incomplete LTTPR support sets them to non-transparent
> without per-segment training and breaks docks with retimers, while it
> would've worked if LTTPR(s) would've been left in default transparent
> mode. Note that in this case, X1E devices with ps883x are somehow an
> exception, because without LTTPR initialization at all the training
> always fails.

Right, I'm concerned about breaking working setups for users of machines
like the X13s.

> - If LTTPR has to be initialized either way, and explicitly set to
> transparent mode if we do not want non-transparent, then no,
> incomplete LTTPR support in 6.15-rcX did not explicitly break docks
> with retimers, as those never worked in the first place. As per my
> understanding, this is the case, unless something (firmware?) has
> already placed LTTPR to transparent mode before the driver takes over
> - then 1st case would be applicable.
> 
> Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> if it did work before, as I do not have a Qualcomm based device
> without LTTPR on the baseboard.

Abel (or anyone else), do you have one of these docks that you could
test with the X13s to confirm whether this series fixes a regression or
not?

> > You describe at least one of this patches as a fix but I'm not seeing
> > any Fixes tags or indication that these need to go into 6.15-rc to fix
> > a regression.
> 
> You are right, I will add Fixes tag to the 1st patch to make it clear:
> Fixes 72d0af4accd (drm/msm/dp: Add support for LTTPR handling)
> 
> Or should I mark the entire series with Fixes, so that the docking
> stations with retimers can be fixed in 6.15 already? Landing only the
> 1st patch will fix inconsistency with DP spec, but will not fix
> docking stations with retimers. I guess this comes down to whether
> existing LTTPR (but not multiple LTTPRs) support is considered a bug
> (and patches 2,3,4 are a fix) or lack of functionality (and patches
> 2,3,4 are a new feature).

Indeed. If LTTPR support broke existing setups, then I think all should
be marked with a Fixes tag and merged for 6.15. If we can't get it into
6.15 we may consider just disabling LTTPR support in 6.15 to address the
regression and then enable it again once fixed in 6.16.

But if this series is just enabling support for docks (and USB-C ports)
that did not used to work, then I guess this can all wait for 6.16.

Johan

