Return-Path: <linux-arm-msm+bounces-45589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D24EA16D3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 14:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49F7616244A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 13:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBC4154433;
	Mon, 20 Jan 2025 13:16:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6421DED4B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378980; cv=none; b=Yv50U5HsA9oHHUPQBUXVlnxfHm90IB/zQlglTEM6Z4WH5YzK7ejLjpdD1+6pfqIOGjG5oPkX0DQiRzdLid6KTeSYGWogTFwIqb3/slL3s8BMIKK3oTgD5dSBIJm6jyJ6WxYR2Chl4VhXXfpRYf0eqebCTsCx2uEcjzGnHEqpcFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378980; c=relaxed/simple;
	bh=bA0gPH9v1H9JSPirVwOw0NkAOiLOnn8VC4iQWNwLRf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4stJx8kPvpcKbNdC4gnjg+rV9McYbk2Nh/Fe7Eh2Wxah6IaMmQyRLY0nZGMIIdFKxvoFR5u9nJ5sB96LRro5dj/vpJGzy+VPxAnbxnCnSV3ZhAdZRN/H7vB2atPs6vCMYtYuIYwLasnw2nOCNHap8uIUFzoK9HOMXCFUhQwjNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id BCBE1200A8;
	Mon, 20 Jan 2025 13:58:11 +0100 (CET)
Date: Mon, 20 Jan 2025 13:58:09 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 16/16] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <6ds6wxlf56kt3lislorxubwbjldpknz74c76smglynzh4jxcpq@dcr2ptutaopa>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-16-74749c6eba33@linaro.org>
 <mw7zc4ljagxs6sjpl2wfjicq56w7ru2dd43u55rrtwyux62bb5@3w4zayfqxlai>
 <CABymUCMnYy-L2Bd6dgYzPTB+qzpFLbU-LyCLDKxCSWy19x_A5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMnYy-L2Bd6dgYzPTB+qzpFLbU-LyCLDKxCSWy19x_A5g@mail.gmail.com>

On 2025-01-17 15:32:44, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 16:32写道：
> >
> > On Thu, Jan 16, 2025 at 03:26:05PM +0800, Jun Nie wrote:
> > > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> > > enabled.
> >
> > Why? What is the issue that you are solving?
> 
>     To support high-resolution cases that exceed the width limitation of

How high is high?  Some Sony phones use a bonded 2:2:2 setup.

>     a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
>     additional pipes are necessary to enable parallel data processing
>     within the SSPP width constraints and MDP clock rate.
> 
>     Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
>     and dual interfaces are enabled. More use cases can be incorporated
>     later if quad-pipe capabilities are required.
> 
> >
> > > 4 pipes are preferred for dual DSI case for it is power optimal
> > > for DSC.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++++------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> > >  6 files changed, 29 insertions(+), 14 deletions(-)
> > >
> >
> > > @@ -664,15 +664,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
> > >
> > >       /* Datapath topology selection
> > >        *
> > > -      * Dual display
> > > +      * Dual display without DSC
> > >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > >        *
> > > +      * Dual display with DSC
> > > +      * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > > +      * 4 LM, 2 INTF ( Split display using 2 interfaces)

Are these always bonded (i.e. single display with dual-DSI link), or can it be
two independent panels?

> > > +      *
> > >        * Single display
> > >        * 1 LM, 1 INTF
> > >        * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> > >        *
> > >        * Add dspps to the reservation requirements if ctm is requested
> > >        */
> > > +
> >
> > irrlevant extra line, please drop.
> >
> > >       if (intf_count == 2)
> > >               topology.num_lm = 2;
> > >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > > @@ -691,10 +696,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
> > >                * 2 DSC encoders, 2 layer mixers and 1 interface
> > >                * this is power optimal and can drive up to (including) 4k
> > >                * screens
> > > +              * But for dual display case, we prefer 4 layer mixers. Because
> > > +              * the resolution is always high in the case and 4 DSCs are more
> > > +              * power optimal.
> >
> > I think this part is thought about in a wrong way. If it was just about
> > power efficiency, we wouldn't have to add quad pipe support.
> > Please correct me if I'm wrong, but I think it is about the maximum
> > width supported by a particular topology being too low for a requested
> > resolution. So, if there is a DSC and mode width is higher than 5120
> > (8.x+) / 4096 ( <= 7.x), then we have to use quad pipe. Likewise if
> > there is no DSC in play, the limitation should be 2 * max_mixer_width.
> 
> Both width limitation and clock rate contribute to pipe number decision.
> To support high resolution, the MDP clock may be required to overclock
> to a higher rate than the safe rate. Current implementation does not
> support checking clock rate when deciding topology. We can add the
> clock rate check later with a new patch.
> >
> > >                */
> > > -             topology.num_dsc = 2;
> > > -             topology.num_lm = 2;
> > > -             topology.num_intf = 1;
> > > +
> > > +             if (intf_count == 2) {
> > > +                     topology.num_dsc = dpu_kms->catalog->dsc_count >= 4 ? 4 : 2;

What if there are other encoders that have already reserved DSC blocks, reducing
the current available number of DSC blocks?  This patch seems to cover multiple
panels/interfaces on a single virtual encoder, how does one get to such a
scenario?  Bonded display?  If one or more DP panel is connected, do they use
their own virtual encoder, and hence miss out on logic that properly divides
available DSC blocks?

That idea is what's been holding back a quick hack to support 1:1:1
topology for sc7280 / FairPhone 5 to perform a similar workaround:

	if (catalog->dsc_count < 2)
		num_dsc = num_lm = 1;.

> >
> > This assumes that the driver can support 2:2:2. Is it the case?
> 
> The code falls back to 2:2:2 case here. But I guess 2:2:2 does not work yet.
> How about below code for DSC case?

I've been working on 2:2:2 support [1] but have stalled it to see how your
series here pans out.  Doesn't look like it's heading in a compatible direction
though, going for quick wins rather than redesigning how DSC blocks are
allocated (to name one of the many topics).

[1]: https://lore.kernel.org/linux-arm-msm/20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org/

- Marijn

> 
>                  if (intf_count == 2 && dpu_kms->catalog->dsc_count >= 4) {
>                          topology.num_dsc = 4;
>                          topology.num_lm = 4;
>                          topology.num_intf = 2;
>                  } else {
>                          topology.num_dsc = 2;
>                          topology.num_lm = 2;
>                          topology.num_intf = 1;
>                  }
> 
> >
> > > +                     topology.num_lm = topology.num_dsc;
> > > +                     topology.num_intf = 2;
> > > +             } else {
> > > +                     topology.num_dsc = 2;
> > > +                     topology.num_lm = 2;
> > > +                     topology.num_intf = 1;
> > > +             }
> > >       }
> > >
> > >       return topology;
> >
> > --
> > With best wishes
> > Dmitry

