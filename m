Return-Path: <linux-arm-msm+bounces-30279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B03966786
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 770B91C249F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4291509AE;
	Fri, 30 Aug 2024 17:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G9HN2hQe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F501B3B2D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 17:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725037306; cv=none; b=brXO19Jm2l75T//7/Upu1QE9dzxHxnodRGt1SNajFU6JFLX4fiFznFl+TNUg9GMbCOpfaL8v2rXiaezOCbBotQ1vaNSa53q14oqEo+7B4WkuwfLeFmjBMK7Ko1oVZqq60wXB+G9AnHVYFpRWWtspJYVKLiV5g5pHL6kV3w17fr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725037306; c=relaxed/simple;
	bh=g70LG6TKc6jXih17W3qdmZUbLNBrrfRdm6HuhA/xotM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkVrRVj1NBGe3QjtfT+591R3bHU9TrXeda976wxSefxAQTD+3af/YCQDOXDg48tkPQfEAXBXSqQ4JEVh1k9wk6fz3WwdtqscxvD57b+QR0TSuGzjO+o0jK+0tW8b9tvizsmhz1zgTbJjZe103i7t5mKGxYB/LI/DHlfVd5WbTSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G9HN2hQe; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3fea6a0a9so19056621fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 10:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725037302; x=1725642102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9e6nxlU1uy3OwWwU1U+BKOkR/SYcbY7cP9f18pPl24M=;
        b=G9HN2hQeLmTvWAMDGcUeEOWkf0uVQpbeRECvHcpMmMozUY8OVhTLwqBIjv9KwRkoaO
         jyzSzD8vAHPyGwlzgm0DT4HkvY1XjNpwPUNnvm74181shN0vUMNtdbTuYeodyd8CToLw
         y5TpHaOHywfXOugWJG8AKB64dYEw/nJc/HZNgiU+vxbeuddMeWmzVXc8BiT/MIzlMEt6
         SbzxV+ga3KSsAzd/wEh1WOkCaX5K2oI1NImxTtlisAXRiu0xnEdfwLXkB3It4un+kYg0
         mvf0s32PxMNowctErgT38AUHGfKgrfKOixrxw+lIGaZajVS4w8Tn2+8CSJDIptX7v6Os
         pquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725037302; x=1725642102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9e6nxlU1uy3OwWwU1U+BKOkR/SYcbY7cP9f18pPl24M=;
        b=abDLsxr+GyIqguhwqf+d8oq3ISgVON9U6gA6C3Z0Mh6NTyX18fhdXL+/XG/vLUEcCj
         L103hk1yZV/Xs/BGGguVCzk6p1lOEgRszFpNnzQUH53yR3D3UFLe11HaD4crOAmsnWGq
         huYQ0UQbBAYKenLSGw1c9isxedIr3LmSy0b0xkrlAUhWcJG4jd9LVMLxqSJ1fmC5Vxm/
         EX+ieRhCjH3VYBTTjR9uoLkM+IrJ9qwsxGQDlPCvKGXcsN238N07DTc89F6NBjVq5gLr
         30PcFUGlx+Q5eQfzKqknPNmj9Df2+v4obWQLT+ZBp2rmjI6kF1FtJp4i8XbGBKnOuJOQ
         juPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXkxafEYKUR06Td4v4yS1pjbMJoOkGlPBPwxYmBeci4yxCGjJ/XJfdR5LYr3aHuZVjK3mEHuxvksX8ZYgh@vger.kernel.org
X-Gm-Message-State: AOJu0YzRtSawzOBfv5qW9ifVhMgIvJ9TvlFKc5KQoTIygBUjy94ahDuD
	OF/JH78RJ9fDJXKQ6w9Cj8RDU6HE/Ba03Hy72vGqInTVu1dxsYyz1ehAi9qHx5o=
X-Google-Smtp-Source: AGHT+IHVZcra0jI/oqIBBxlspPQCALcjRHzAaZIYOgKseKUP0hM1DoYe9EJx8fi3Kk//VawoWLFVXg==
X-Received: by 2002:a2e:bc18:0:b0:2ef:28ed:1ff5 with SMTP id 38308e7fff4ca-2f612ae4c49mr23103861fa.15.1725037300112;
        Fri, 30 Aug 2024 10:01:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614f38ce5sm7125841fa.68.2024.08.30.10.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 10:01:39 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:01:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 05/21] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <4clfifnlalkzgf3fy2gl5enjam55vs24pf7zp64zevj64bh5mv@te4qvqe5oihc>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-5-502b16ae2ebb@quicinc.com>
 <fiydda6an5a4dc2gmrj4fnti4ymkk7ntbtpq6mgushmgnzl6cp@pwtz6goteljh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fiydda6an5a4dc2gmrj4fnti4ymkk7ntbtpq6mgushmgnzl6cp@pwtz6goteljh>

On Fri, Aug 30, 2024 at 07:42:52PM GMT, Dmitry Baryshkov wrote:
> On Thu, Aug 29, 2024 at 01:48:26PM GMT, Jessica Zhang wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > All resource allocation is centered around the LMs. Then other blocks
> > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > powers up the CRTC rather than the encoder.
> > 
> > Moreover if at some point the driver supports encoder cloning,
> > allocating resources from the encoder will be incorrect, as all clones
> > will have different encoder IDs, while LMs are to be shared by these
> > encoders.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state and
> > dropped clearing num_mixers in crtc_disable]
> 
> Hmm, I still see the chunk in dpu_crtc_disable(). I think the chunk is
> correct so that if there is a disable/enable pair of calls with no
> intermediate mode_set then num_mixers carry over the correct value.

As a second thought: maybe it should be moved to the next patch.

> 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  89 +++++++++++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
> >  3 files changed, 183 insertions(+), 126 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 4c1be2f0555f..3296b0650056 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1091,9 +1091,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
> >  
> >  	dpu_core_perf_crtc_update(crtc, 0);
> >  
> > -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > -	cstate->num_mixers = 0;
> > -
> >  	/* disable clk & bw control until clk & bw properties are set */
> >  	cstate->bw_control = false;
> >  	cstate->bw_split_vote = false;
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

