Return-Path: <linux-arm-msm+bounces-42894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 168909F8A4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 03:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D215F7A1788
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2A013C8E8;
	Fri, 20 Dec 2024 02:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UaMNMDAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B38945948
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 02:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734663172; cv=none; b=Lp42QzjPz6eMFdrjunFH/RE5ZYuHF1iwPTPMvr2i9W09oLk+1/78pfuMrMMbYrbb+Vt4ElrRwJWhwllgv6snydjD9eZBxkXLD9ouaGA5qXfrXbw9fY1jrASeCewaWjZgEGrn6SFZTQYkZuwtyKDJn1JwRZ1UY8W8WNgtFf0kJn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734663172; c=relaxed/simple;
	bh=8YwMAOH5WnBtYbZop96qLuvwirjmXzRytsa68oY8vhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWVfxYjq4SVtQNX+8dTdLI+urO9p8QgDYrm8aUDXUMMaJJcyKiVF+83V1UHNMn5USO13ElGPLj3espQQBqf7hgLqCOTwUlqx7/CJrJ1Jsh/1vMQmFGzsmHEKRzpPKdZkfe16QcZH6+Y5cqTcg7AdoazyXou4eRyPCnBW8NG1Gx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UaMNMDAr; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30229d5b22fso17161221fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734663168; x=1735267968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ebM7tOJNXrOcKqbKfZBRf27LYz9fqH9eU/pGhDf6OYI=;
        b=UaMNMDArr0qLzAQDfCZLQE9aX9G1DkoKZlMuxossRk+bI/djXAmd9hYW+33/ol7B9C
         KDhGSa9cgiTFlTg5ypotkIGxbQpd0PsczNyBAIbB8xYLk9G3WzSIoCe5UYKlCCPssR60
         yn6mhAQIoTqlyLckKNNfc6Wx0X+kdkUERPI4+QE4U+yLZlDslUhmsZjY46gEy3mKpHQP
         5/vrbkjeFFETQK3QuiciduiN2iXXXS5lCavAGi/2FFYISh9z6bupMJnn+hh1X7bvKu1f
         8r6XVx7OQNBJDBdJlkSF1fU5kDOg/yGzFTZCYXzZz2QXm95GFmBkhWHys3pce/LA0w96
         +fFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734663168; x=1735267968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebM7tOJNXrOcKqbKfZBRf27LYz9fqH9eU/pGhDf6OYI=;
        b=uOS0WFZCxa//CcnRAUm/Cv26Z/vBl9u0SVmNIHCw/Rwf1jQM+iD4m+COkO/sq3urOZ
         nQAx7PggB1nu07P1O0tobbb3EWTql5WkMC8Fml4CMknCyaDzBGZUhVGO0I3mFx0qoIEU
         tUAyXVeGbwv4jvs7PQv0XCJMD5efT1dIV3Wpjy5XMKy7o9YQaJW9IzkduMDzn+nVnCAm
         AZAWTA3k3sdITwTvx6ah4QHwqQx6rk8shZskiDVG1XCmE/IcppeUsDCP4q3K7tsB+KYX
         NO1+up4+Ub1uZnoS0/QFrodZ8PDNsLofC+TVYogEaoTI6gtnwBsfjqdnQMaJXR7GYdod
         GC5w==
X-Forwarded-Encrypted: i=1; AJvYcCVWm9ZcKUnoJ9vipl3CNgqXt8OfUkXQjuwF0wqqo4GQ+zCnZ/QS1aFRvIvidYsElQ0JGTfeQDraFDoItnNq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+yyWW0TLWsNewM7Y+JO2039cN98ryJz53uHV5QhOAQdBCI/mN
	qRXt2NKVMPu59PwaIxqEat3qdtATlO7DvWE11V1m9WBcnbYi/HVml2DxMPO2Nww=
X-Gm-Gg: ASbGnctsZsgNOD7gp3aKhmqWpRaEFXt/iVAZr1/QQ/xZMrJri4nCjwMYlFQFiX5suqd
	MHxa6nliWCNC6wvfynS1fKdpeDLXNZlR65MGIpYCFZZdKg3kHqkwWrNmx4V9oHSNMhskTM9U5rB
	yQNf90JhuRvEFw0XmU1IKD2LUvRp76nzfOmNWkAPMdFXdcFCn48YD3gwoZV0BjNEl62l/phWrup
	M8aYwqXO9OxiZMz+upCFAAtImkggWpx/PT0DbpAUEQJ49BCzbAmeB1NcEplojKHMStwEUJawbFi
	eRNB746Xqu63nt/Cc8l9wXo5JP7532yNN2Ty
X-Google-Smtp-Source: AGHT+IFzV02MmKGDXd0vt9D85TphrHv4eqZedjbESCKzHnuM85tjxczSguvaGOLKOyaBAMIioabuNQ==
X-Received: by 2002:a2e:b887:0:b0:300:324e:3506 with SMTP id 38308e7fff4ca-304685462d0mr3804721fa.13.1734663168283;
        Thu, 19 Dec 2024 18:52:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adad6dcsm3964691fa.60.2024.12.19.18.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 18:52:47 -0800 (PST)
Date: Fri, 20 Dec 2024 04:52:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Simona Vetter <simona.vetter@ffwll.ch>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 08/25] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
Message-ID: <otki3hdn7fo6rico32cxi2jkqollzl2ncl5yhukmrwgthupg5i@z66y3ykeuy3r>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-8-fe220297a7f0@quicinc.com>
 <097a3d10-0992-46a4-8f89-aa54538c9776@quicinc.com>
 <pqy2qa2ikvadchox3jtrfuimmzeauuxkuyalpelzzfjzsddk3i@htband4aqjxr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pqy2qa2ikvadchox3jtrfuimmzeauuxkuyalpelzzfjzsddk3i@htband4aqjxr>

On Fri, Dec 20, 2024 at 04:40:52AM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 05:39:15PM -0800, Abhinav Kumar wrote:
> > 
> > 
> > On 12/16/2024 4:43 PM, Jessica Zhang wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
> > > from dpu_crtc_assign_resources().
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > [quic_abhinavk@quicinc.com: cleaned up formatting]
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 29 +++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
> > >   2 files changed, 31 insertions(+), 2 deletions(-)
> > > 
> > 
> > <snip>
> > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 2b999a0558b2a016644ed5d25bf54ab45c38d1d9..a895d48fe81ccc71d265e089992786e8b6268b1b 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -1138,7 +1138,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > > -	int num_ctl, num_pp, num_dsc;
> > > +	int num_pp, num_dsc, num_ctl;
> > >   	unsigned int dsc_mask = 0;
> > >   	int i;
> > > @@ -1166,7 +1166,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> > >   		ARRAY_SIZE(hw_pp));
> > >   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > +			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > >   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> > >   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> > > 
> > 
> > This chunk of diff is unnecessary. You are just changing the order of
> > defines and fixing alignment. Does not have to be in this change.
> 
> I can drop it while applying.

And with that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

