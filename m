Return-Path: <linux-arm-msm+bounces-86543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97404CDBE1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C7513007885
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0F04086A;
	Wed, 24 Dec 2025 10:00:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF93A2356D9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570428; cv=none; b=AR0G3Hg3qaVXBfR4eCEtbImTAnr3rmcT9sIhxHB7TKgf5dawTQpAzWkBKvqYXmVMr9HApABiHDRJ06iHaNZdx41+OEcZD+0HDWda72tt9P1x/ZqzQX3FlNiitZenj3dBB0MDQsxEiAd4+t0MS74uEobpibmsDHyLFly1/JACN1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570428; c=relaxed/simple;
	bh=8WRui3komkudJp6lQhR5KV6aBd0COa8Hc7aJchRvIWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgMlIk/4tRsvuoGuop11Qx/vTG+78x5ySrpbYpASsaiFcI7WcVSeBuEdgg2GvhT9n4uLLM7yl/ocJiZ9s4LQ267l1FJ3AWEKTZj+jfC9wktzk1povMdFzYhsvVbee8rpUa9UcJMJ3MBmNiGPP2oJTvaZrtt7rkFkaKFMkybiA3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4AB612083D;
	Wed, 24 Dec 2025 11:00:24 +0100 (CET)
Date: Wed, 24 Dec 2025 11:00:23 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Teguh Sobirin <teguh@sobir.in>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <aUu4RyJyZROn-FzQ@SoMainline.org>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
 <52avqc3n4fxuypv6fkejuxkmuounxa67e5lsnfeynek6yxq6tm@ink6yoklpxes>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52avqc3n4fxuypv6fkejuxkmuounxa67e5lsnfeynek6yxq6tm@ink6yoklpxes>

On 2025-11-21 14:16:55, Dmitry Baryshkov wrote:
> On Fri, Nov 21, 2025 at 02:02:08PM +0800, Teguh Sobirin wrote:
> > Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> > INTF blocks.  Currently all code to setup vsync_source is only exectued
> > if MDP TOP implements the setup_vsync_source() callback. However on
> > DPU >= 8.x this callback is not implemented, making DPU driver skip all
> > vsync setup. Move the INTF part out of this condition, letting DPU
> > driver to setup TE vsync selection on all new DPU devices.
> > 
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > ---
> > Changes in v2:
> > - Corrected commit message suggested by Dmitry Baryshkov.
> > - Link to v1: https://lore.kernel.org/linux-arm-msm/TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com/
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
> >  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> Fixes: e955a3f0d86e ("drm/msm/dpu: Implement tearcheck support on INTF block")

Back at that commit, setup_vsync_source was still always assigned:

https://github.com/torvalds/linux/blob/e955a3f0d86e4a789364af62495ac37546eb71c8/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c#L260-L263

While that was technically a wrong assumption by me - I should've put this loop
outside the hw_mdptop check in case that ever happened, it got unassigned in
commit 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP
on >= SM8450").

Note that this patch is a severe regression on DPU <5 and doesn't set up the WD
timer on DPU [5, 8), but I'll comment in-line on the diff.

- Marijn

