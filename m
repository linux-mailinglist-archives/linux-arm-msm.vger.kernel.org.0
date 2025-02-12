Return-Path: <linux-arm-msm+bounces-47781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 289D9A32B7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BD5718854C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 16:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76806211297;
	Wed, 12 Feb 2025 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dc/7QO+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDEA211A3F;
	Wed, 12 Feb 2025 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739377389; cv=none; b=jg3b2kmazM1AdF0QA3c8EZ77l/uiWHxUQvzFJZpgAlan9HrClXUmQ+G9FlI6ibSZnFvxkPwtrSLX/KGC38sE8OplkEWWyCJ7c7jfqJ6Ux8tlatgpxWqEqqfLoBQpzl7rTNeFqDjoQkOgnf9wX0HCfumt+2lCqaydA+JV62zMQGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739377389; c=relaxed/simple;
	bh=m7akHSXGBiZpCcrZGA4GjfcD6mi18Eh1ekR0+/hfm5U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jvr0zyWDFrAWV1H3gLaopho+jkIujgGue+nR6D7Mupr2pbh93H+tXbYqBF9Cj1lUJkBMx05cstiyFJJKYg8kzcw3Mjtuw2vIBQpVWk595bMWl6Q8sDX0LGeR44pSZiPKk7AXx1bwO9gHs7dI8UsmEcv51g2XtNz0oeg1LeC0LlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dc/7QO+Y; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f6d2642faso114831265ad.1;
        Wed, 12 Feb 2025 08:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739377387; x=1739982187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfS0qjYTR2lJzWWN3+qH19TLHAlA/gI2SPTg61bsso0=;
        b=Dc/7QO+YEXYUdyG2r0l3aoxtDel48HCDWtkLvs4v7UhAmJgGHVHA18+M8yToMTXC3K
         DYqnkMFQb0E1m+PxxeGeDCaL9THWwQewHzLZT1bH+KCZ1kDUm55j+jnBuxObR/EDRSh8
         5DIGN6MgYuvA+vATkFNDykjM5blvrdFmmPCeoQi6durPAplKUAcyBaKOMcEWRHWYaG5t
         2Hb2Am0/Mx4Xyurpt/qpQgXq87Y1dWM9srIaIjFac/9HYJe1Sriibsb7Ad6N5d/cISUu
         /6VD/mhKrgcLcfRCyH7hUZOHUVfKp7ZDNKl1gM+Q3M2jbsnXvT0Lgtc6QdjUc1DaNayl
         eoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739377387; x=1739982187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfS0qjYTR2lJzWWN3+qH19TLHAlA/gI2SPTg61bsso0=;
        b=SDexulzzGgqqWXxWpmPSJiDUF1/VGCv4sNBGQKz7PBT1g13YRhjivOv0ISdoNN/JD7
         jp8B4wcIjj6/H46h/K2v0RSL6nWi10ikGwNDtjpAZPGN0Hrj9aYwAw8RHVwyhdv5yM5y
         ufY4d/Dzdd2qUmRL+9MZRTKwNOOHsXk5Xg4bOj2p1zJRsarVjrzdI72k/9P94fhQe41W
         6pdRY7FIkzBPVevrWdvk9INh1nNJUr8yMuAlz58mLsgHRFGMiIpEqMzxxXGO2NHbIPVy
         8ZGTt5ciVW4cQM8VBpvr1cO/qJtFxNGaqO1RTmmiCb9cdER5xzbKBjgYX0IpFvOBd83c
         F5eg==
X-Forwarded-Encrypted: i=1; AJvYcCU+MGq176GppeTYcJLcNslOo4bUDzjC+u6RirMs+stQ5cXP0435KI46rXULHfWaQf5aB3zsI18uud6Twzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvF30UCv2YVWTuUbZqg4TBT69aZYl18r7De9IPWB9oaYxAhruL
	M0K9xFZ8R1+6kzVW/lWK+qOO9dCn6iD1l1dipEjzlFvXozQI/vj8
X-Gm-Gg: ASbGncuUhs+yA7gH2ccILDW1C9j7TmKPRcUBjkzhigVcoFu8jIMZH2+LjJRL2Dg4Vq5
	RHMTrvMAccXrwceJ3AowYxf8O2itHykIu0iIQKGVFa/+m2csVmUt9+fk8V84Q2a2LeA8zGh1k8f
	rfZj906F77V6pcI+osp6CNN5Ek7sAhuLlSTHOTc4OJR5i8xPkoiQ3pmyaoB27SbFjaJn4BdqVts
	FBZr0JS4cLKe8wUgtRex4GeKNZ0SEMfjb3VbGBKdsKajUf4mhlNGMJuWkUO/c2vx5c/pGa6qbCh
	NHVozsm+f6whnmt9HIB32jMZpuEkn72jCTnOwQQyDw==
X-Google-Smtp-Source: AGHT+IHIMv22mMXoA9eC/SwzcrvYhnZccCk9wE2WmNJ8twYqeBEQsS89jAatUo3dy0fvvDoXwOE8/w==
X-Received: by 2002:a05:6a21:6e4c:b0:1ee:63d7:1d32 with SMTP id adf61e73a8af0-1ee63d72190mr4459813637.0.1739377387028;
        Wed, 12 Feb 2025 08:23:07 -0800 (PST)
Received: from jamesmacinnes-VirtualBox ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73091b2a97asm5465683b3a.152.2025.02.12.08.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:23:06 -0800 (PST)
Date: Wed, 12 Feb 2025 08:23:03 -0800
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch
Subject: Re: [PATCH 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <20250212082303.7c37f8fc@jamesmacinnes-VirtualBox>
In-Reply-To: <v4lpt45c7miwt45ld4sfinixnpje6tb73dhqmahl6kin4i7wyj@6ss563kvk63v>
References: <20250212034225.2565069-1-james.a.macinnes@gmail.com>
	<20250212034225.2565069-3-james.a.macinnes@gmail.com>
	<v4lpt45c7miwt45ld4sfinixnpje6tb73dhqmahl6kin4i7wyj@6ss563kvk63v>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Feb 2025 11:13:24 +0100
Marijn Suijten <marijn.suijten@somainline.org> wrote:

> On 2025-02-11 19:42:25, James A. MacInnes wrote:
> > Type-C DisplayPort inop due to incorrect settings.
> > 
> > SDM845 (DPU 4.0) lacks wide_bus support; porch shift removed.
> 
> Same comment on "inop", elaborating the meaning of "incorrect
> settings" and describing relevance to DPU 4.0 from patch 1/2.
> 

Again, happy to use more words.

> > 
> > Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> 
> This commit came long before wide bus support, are you sure this is
> the right Fixes tag?
> 

Yes, I went back to the Android 4.9 driver (that was working) and found
that the porch shift was not there. After experimenting with removing
the porch shift code, I had fully working video. As the SDM845 is the
only chip that doesn't use wide_bus, the pair are not related, but each
one contributes to no/poor video output.

> > 
> 
> Drop empty line between tags.
> 
> > Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c index
> > abd6600046cb..3e0fef0955ce 100644 ---
> > a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c +++
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c @@ -94,17
> > +94,17 @@ static void drm_mode_to_intf_timing_params(
> > timing->vsync_polarity = 0; }
> >  
> > +	timing->wide_bus_en =
> > dpu_encoder_is_widebus_enabled(phys_enc->parent);
> > +	timing->compression_en =
> > dpu_encoder_is_dsc_enabled(phys_enc->parent); +
> >  	/* for DP/EDP, Shift timings to align it to bottom right */
> > -	if (phys_enc->hw_intf->cap->type == INTF_DP) {
> > +	if (phys_enc->hw_intf->cap->type == INTF_DP &&
> > timing->wide_bus_en) {
> 
> This code existed long before widebus: are you sure this is correct?
> 
> Note that an identical `if` condtion exists right below, under the
> "for DP, divide the horizonal parameters by 2 when widebus is
> enabled" comment.  If this "Shift timings to align it to bottom
> right" should really only happen when widebus is enabled, move the
> code into that instead.
> 
> - Marijn
> 

Happy to condense it. I left it in two sections for clear review at
this point. As stated above, I reused the wide_bus parameter as the
SDM845 appears to be the only affected chip.

> >  		timing->h_back_porch += timing->h_front_porch;
> >  		timing->h_front_porch = 0;
> >  		timing->v_back_porch += timing->v_front_porch;
> >  		timing->v_front_porch = 0;
> >  	}
> >  
> > -	timing->wide_bus_en =
> > dpu_encoder_is_widebus_enabled(phys_enc->parent);
> > -	timing->compression_en =
> > dpu_encoder_is_dsc_enabled(phys_enc->parent); -
> >  	/*
> >  	 * for DP, divide the horizonal parameters by 2 when
> >  	 * widebus is enabled
> > -- 
> > 2.43.0
> > 


