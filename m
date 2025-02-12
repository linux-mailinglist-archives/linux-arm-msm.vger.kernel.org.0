Return-Path: <linux-arm-msm+bounces-47813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 892E3A3302E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 20:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EADC8188B9D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 19:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BFB1FFC60;
	Wed, 12 Feb 2025 19:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcHOUvX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89211FCF62;
	Wed, 12 Feb 2025 19:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390224; cv=none; b=S+JTdtPunJZORdCFMU6DIvM/AE6IfMKXEUyBeO5D1uVX3war0Bs5TuCxKw/zepk92g4TspF/VmbW3A92KzqFtNHSYdvC0Wa/Da5Zoi/GMV1/H0Dk/ILBjpPHMimj3MLX6AX2VzPVHd7UB2r++J5ULvX5dwFA/AoxuRBDRLSP5VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390224; c=relaxed/simple;
	bh=ACQHBqWtN83ylGkE46KP/7i87267dyQVpuuZMrGTnPo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IOMOnXYbetKdihYLwO7KZn4LQ6vUc6e5wt2i2hXxzCEAi79csi/1I+SikGwfVV+xIIihTHCw241XYV2vU39MrtWNRvxvYkc2fwK/dr7bDQXIo3oChFk+oRBfNNIbPR/ErHKrgQvsU3WtBNLjaBg3kiBr9kSV94owTyJcZHuDZ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcHOUvX4; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220c92c857aso1804775ad.0;
        Wed, 12 Feb 2025 11:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739390222; x=1739995022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xoLSibciUEQ7Vm7jBM+r9y3xSL7gSulwEQdVhX0F/I=;
        b=NcHOUvX4Kz6/TIwzqX5LJo2pv1Gtxqzl5WoO6T7fl+eBchngmSUAfDqbK//1imQXyH
         dOnQT7TD0xqEpdavT87Qro0UbxczjsheKn1TvPj9VNM2X6n2BSPufUoLyAjIUvWBWvhV
         Zlv4HdrztZnBreIZLkF//Bz4baosT+g4LJt3m20Ods1ZWWdVp1vC2sBKYvxJ51UjY8Si
         Syg7/eps0F1R7Tsa0orZNl66hLWZQDSLSGQFI3aMosFDMzkDRi3pO4tuobRpZLx4MLv7
         qfgfzqUjrlR4ghdiO+kZcLguhGudwCr3sa84c+GmlIiuq6A/Q+pRnOQ1+R9NkMHUONMR
         iVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739390222; x=1739995022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xoLSibciUEQ7Vm7jBM+r9y3xSL7gSulwEQdVhX0F/I=;
        b=S8lyf71JlgpBnOfMwVQMhKCd43Qw95FlZ117QwtwbrcKYqEUUbTSfxtMgOzjZ5Q2K2
         MnhoulwTNyiFUa7HFsdFE8YfoEukXcvwIAwsSFdzsgUsTqkGOy5Tev3kAMpDGToOIZ2a
         AjNZFQz4LPQqbVZxlNAeqqkYWc4lTshVBzv8YYewWlW5g1uIEnShkO+piGUcA2yBsxC3
         6duzTm3ezZ7ZNRmsOD58UunjlbsFoR5t6SYTZ5PV/YzyxsEhVVey9YK+w6OtzsbtVP9I
         I0+bL7z/nCHpocZ4B3uDt+x2mucG7DzmDdndfxzgOYB6VtCo5uD6ELOwYfWDEYI7jCnQ
         s/JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJIN2EVow+bTy0YcVsWJraIm8Y9fSQmHlBqAq9IdSFHqi0iIvX6iTKhYWp3lz+YtN4tpfmKkgTStzsN4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuTASheJugX0XnIQ+EzKIZ3hTyx67oFNUan4o4vUwmnHzQIXpu
	yXOx9rSFzB2qSypf4Rv/15oYle2Gcts3L15oFEgDoMWokXawHlRoRnsE+Htj
X-Gm-Gg: ASbGncubcOvR67hN7ECa1nRY/SEeyLm6teCYTh8fuzr5dWxzqfi1O1J4bE1unsJWJ4B
	WJW/rEwUqc+igE8T8uVMENF6x+68lrflfwvAEGTFhjLMrDOan3SEG+KwcCvdEJq1nw6bvbv4jUm
	QKIz/ZrLd4Jt+UFjvqWShcmJkNn4HgLVanJMuOypE35N+JqewGiYpNedR3zCMMhBu7SmfWJiMEk
	614V00R2HEvo8KJGRdnOmE6gbO1NNz/10x2fh4WK2CAiOCwus7QEIst3MbgdLoYHwawIPGGFzFT
	ihjJJNhylOWPsNpRv8dRrdLe07/lx8U7qRLGJf/r5Q==
X-Google-Smtp-Source: AGHT+IFwE64MjK1fuTmGKdKO881V7E9wCwS1BIFx0WU9oV5HapnAMwO4vhMk6NkpJAfvFt9wDD6tnw==
X-Received: by 2002:a17:902:cf0d:b0:215:58be:334e with SMTP id d9443c01a7336-220d36ebfb4mr2648495ad.10.1739390221900;
        Wed, 12 Feb 2025 11:57:01 -0800 (PST)
Received: from jamesmacinnes-VirtualBox ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650cdbcsm117768455ad.3.2025.02.12.11.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:57:01 -0800 (PST)
Date: Wed, 12 Feb 2025 11:56:58 -0800
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch
Subject: Re: [PATCH 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <20250212115658.34c89705@jamesmacinnes-VirtualBox>
In-Reply-To: <ythh7pwdr4g6ih5phkhmsmkpghigfrxieka4lkcqivckvw77j3@jscdxwdloqus>
References: <20250212034225.2565069-1-james.a.macinnes@gmail.com>
	<20250212034225.2565069-3-james.a.macinnes@gmail.com>
	<v4lpt45c7miwt45ld4sfinixnpje6tb73dhqmahl6kin4i7wyj@6ss563kvk63v>
	<20250212082303.7c37f8fc@jamesmacinnes-VirtualBox>
	<ythh7pwdr4g6ih5phkhmsmkpghigfrxieka4lkcqivckvw77j3@jscdxwdloqus>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Feb 2025 18:15:51 +0100
Marijn Suijten <marijn.suijten@somainline.org> wrote:

> On 2025-02-12 08:23:03, James A. MacInnes wrote:
> > On Wed, 12 Feb 2025 11:13:24 +0100
> > Marijn Suijten <marijn.suijten@somainline.org> wrote:
> >   
> > > On 2025-02-11 19:42:25, James A. MacInnes wrote:  
> > > > Type-C DisplayPort inop due to incorrect settings.
> > > > 
> > > > SDM845 (DPU 4.0) lacks wide_bus support; porch shift removed.  
> > > 
> > > Same comment on "inop", elaborating the meaning of "incorrect
> > > settings" and describing relevance to DPU 4.0 from patch 1/2.
> > >   
> > 
> > Again, happy to use more words.
> >   
> > > > 
> > > > Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver
> > > > support")  
> > > 
> > > This commit came long before wide bus support, are you sure this
> > > is the right Fixes tag?
> > >   
> > 
> > Yes, I went back to the Android 4.9 driver (that was working) and
> > found that the porch shift was not there. After experimenting with
> > removing the porch shift code, I had fully working video. As the
> > SDM845 is the only chip that doesn't use wide_bus, the pair are not
> > related, but each one contributes to no/poor video output.  
> 
> Ack: such information is exactly critical to have in the patch
> description. Looking forward to seeing it in v2 :).  It's not
> something I have been able to deduce from "SDM845 lacks wide_bus
> support; porch shift removed".
> 
> > > >   
> > > 
> > > Drop empty line between tags.
> > >   
> > > > Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8
> > > > ++++---- 1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git
> > > > a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c index
> > > > abd6600046cb..3e0fef0955ce 100644 ---
> > > > a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c +++
> > > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c @@
> > > > -94,17 +94,17 @@ static void drm_mode_to_intf_timing_params(
> > > > timing->vsync_polarity = 0; } 
> > > > +	timing->wide_bus_en =
> > > > dpu_encoder_is_widebus_enabled(phys_enc->parent);
> > > > +	timing->compression_en =
> > > > dpu_encoder_is_dsc_enabled(phys_enc->parent); +
> > > >  	/* for DP/EDP, Shift timings to align it to bottom
> > > > right */
> > > > -	if (phys_enc->hw_intf->cap->type == INTF_DP) {
> > > > +	if (phys_enc->hw_intf->cap->type == INTF_DP &&
> > > > timing->wide_bus_en) {  
> > > 
> > > This code existed long before widebus: are you sure this is
> > > correct?
> > > 
> > > Note that an identical `if` condtion exists right below, under the
> > > "for DP, divide the horizonal parameters by 2 when widebus is
> > > enabled" comment.  If this "Shift timings to align it to bottom
> > > right" should really only happen when widebus is enabled, move the
> > > code into that instead.
> > > 
> > > - Marijn
> > >   
> > 
> > Happy to condense it. I left it in two sections for clear review at
> > this point. As stated above, I reused the wide_bus parameter as the
> > SDM845 appears to be the only affected chip.  
> 
> If you plan on reusing the wide_bus_en feature to "detect" SDM845,
> such a thing should be very clearly described in both commit and
> comment description.  Though I'm certain such behaviour is buggy,
> this'll be set to false on other SoCs if the output format is yuv420
> for example.
> 
> Without looking at the code too much, you should be able to get
> access to the current DPU version through some of these structures
> which I'd recommend.
> 
> At the same time we should analyze _when_ downstream added this
> exception for other SoCs, perhaps there's a hint or clearer
> conditional in one of their patches or descriptions or code comments?
> 
> - Marijn
> 

I will perform my due diligence for this fix. From what I could see in
the file history, this was an arbitrary change that probably worked
fine on all the 5.x.x hardware, but lacking a working type-c port, it
was never tested on the SDM845.

I can also see if this part of the driver has access to the catalog
description or elements within. I would greatly prefer to not create
some new variable that fixes this one bug!

Quick summary: The preference would be to have a specific declared item
that references the SoC instead of re-using the wide_bus_supported
element? 

- James

> > > >  		timing->h_back_porch += timing->h_front_porch;
> > > >  		timing->h_front_porch = 0;
> > > >  		timing->v_back_porch += timing->v_front_porch;
> > > >  		timing->v_front_porch = 0;
> > > >  	}
> > > >  
> > > > -	timing->wide_bus_en =
> > > > dpu_encoder_is_widebus_enabled(phys_enc->parent);
> > > > -	timing->compression_en =
> > > > dpu_encoder_is_dsc_enabled(phys_enc->parent); -
> > > >  	/*
> > > >  	 * for DP, divide the horizonal parameters by 2 when
> > > >  	 * widebus is enabled
> > > > -- 
> > > > 2.43.0
> > > >   
> >   


