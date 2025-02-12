Return-Path: <linux-arm-msm+bounces-47802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C57A32D36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 735F2161284
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9746320F079;
	Wed, 12 Feb 2025 17:16:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38308253F09
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 17:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380565; cv=none; b=AvKItrg6B8FUoGSW3dQMC9QObjtMMjXj2bFn+RIk1roBg5aeDIwKhVRYOWOOteS6C6CRfEYmkvfWFEm3fejrxXjDQvt1NPAC12W/od8oSfnV/09BRPy2JR4pgA+iIp6ejwfegb8r6+4Q3ycRHP3N63WkdNeTEMXkNcxDFaY3a98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380565; c=relaxed/simple;
	bh=TrCwhG4Ecrz+hxqBnhqwYXX3fOtazBP9ufWetBAOYaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asH96R9sjONFYEneD8wIyk64jr1EUgePj2+6Upr5NVCyt1tMcvuNHqheeKitwb9KXtZtrrPMUSSdNe/k3kF4eY5r/KKbdzZXEdwO06VdKHqvDgYblwqp6bOsKdQAwgBP+ih6MoM5Pfp9EXEwdBmZ86SCxvD2HQmkOLc/x3DOtDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3D32120163;
	Wed, 12 Feb 2025 18:15:53 +0100 (CET)
Date: Wed, 12 Feb 2025 18:15:51 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, 
	sean@poorly.run, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <ythh7pwdr4g6ih5phkhmsmkpghigfrxieka4lkcqivckvw77j3@jscdxwdloqus>
References: <20250212034225.2565069-1-james.a.macinnes@gmail.com>
 <20250212034225.2565069-3-james.a.macinnes@gmail.com>
 <v4lpt45c7miwt45ld4sfinixnpje6tb73dhqmahl6kin4i7wyj@6ss563kvk63v>
 <20250212082303.7c37f8fc@jamesmacinnes-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212082303.7c37f8fc@jamesmacinnes-VirtualBox>

On 2025-02-12 08:23:03, James A. MacInnes wrote:
> On Wed, 12 Feb 2025 11:13:24 +0100
> Marijn Suijten <marijn.suijten@somainline.org> wrote:
> 
> > On 2025-02-11 19:42:25, James A. MacInnes wrote:
> > > Type-C DisplayPort inop due to incorrect settings.
> > > 
> > > SDM845 (DPU 4.0) lacks wide_bus support; porch shift removed.
> > 
> > Same comment on "inop", elaborating the meaning of "incorrect
> > settings" and describing relevance to DPU 4.0 from patch 1/2.
> > 
> 
> Again, happy to use more words.
> 
> > > 
> > > Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> > 
> > This commit came long before wide bus support, are you sure this is
> > the right Fixes tag?
> > 
> 
> Yes, I went back to the Android 4.9 driver (that was working) and found
> that the porch shift was not there. After experimenting with removing
> the porch shift code, I had fully working video. As the SDM845 is the
> only chip that doesn't use wide_bus, the pair are not related, but each
> one contributes to no/poor video output.

Ack: such information is exactly critical to have in the patch description.
Looking forward to seeing it in v2 :).  It's not something I have been able to
deduce from "SDM845 lacks wide_bus support; porch shift removed".

> > > 
> > 
> > Drop empty line between tags.
> > 
> > > Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c index
> > > abd6600046cb..3e0fef0955ce 100644 ---
> > > a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c +++
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c @@ -94,17
> > > +94,17 @@ static void drm_mode_to_intf_timing_params(
> > > timing->vsync_polarity = 0; }
> > >  
> > > +	timing->wide_bus_en =
> > > dpu_encoder_is_widebus_enabled(phys_enc->parent);
> > > +	timing->compression_en =
> > > dpu_encoder_is_dsc_enabled(phys_enc->parent); +
> > >  	/* for DP/EDP, Shift timings to align it to bottom right */
> > > -	if (phys_enc->hw_intf->cap->type == INTF_DP) {
> > > +	if (phys_enc->hw_intf->cap->type == INTF_DP &&
> > > timing->wide_bus_en) {
> > 
> > This code existed long before widebus: are you sure this is correct?
> > 
> > Note that an identical `if` condtion exists right below, under the
> > "for DP, divide the horizonal parameters by 2 when widebus is
> > enabled" comment.  If this "Shift timings to align it to bottom
> > right" should really only happen when widebus is enabled, move the
> > code into that instead.
> > 
> > - Marijn
> > 
> 
> Happy to condense it. I left it in two sections for clear review at
> this point. As stated above, I reused the wide_bus parameter as the
> SDM845 appears to be the only affected chip.

If you plan on reusing the wide_bus_en feature to "detect" SDM845, such a thing
should be very clearly described in both commit and comment description.  Though
I'm certain such behaviour is buggy, this'll be set to false on other SoCs if
the output format is yuv420 for example.

Without looking at the code too much, you should be able to get access to the
current DPU version through some of these structures which I'd recommend.

At the same time we should analyze _when_ downstream added this exception
for other SoCs, perhaps there's a hint or clearer conditional in one of their
patches or descriptions or code comments?

- Marijn

> > >  		timing->h_back_porch += timing->h_front_porch;
> > >  		timing->h_front_porch = 0;
> > >  		timing->v_back_porch += timing->v_front_porch;
> > >  		timing->v_front_porch = 0;
> > >  	}
> > >  
> > > -	timing->wide_bus_en =
> > > dpu_encoder_is_widebus_enabled(phys_enc->parent);
> > > -	timing->compression_en =
> > > dpu_encoder_is_dsc_enabled(phys_enc->parent); -
> > >  	/*
> > >  	 * for DP, divide the horizonal parameters by 2 when
> > >  	 * widebus is enabled
> > > -- 
> > > 2.43.0
> > > 
> 

