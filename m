Return-Path: <linux-arm-msm+bounces-18006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6E18AB858
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 03:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA895B211F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 01:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7357FE;
	Sat, 20 Apr 2024 01:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CmGz4B3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612A57F9
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 01:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713576905; cv=none; b=VkXhiOw4C+CuAubqGmiHLaQvvQCj2dXga1rUyfc2pgK9jLfqV8nUHN5G4iTQ9iTNnuOkUUGMeGhNehBzwMtCCxM37oYSpUTif3qvZ7ymldDfCkfAQJzVqjN8gDSfaMYufZFzA9WP2q7o5QiucvY+NC4tOc0gNu0CLz/URD8dlwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713576905; c=relaxed/simple;
	bh=cUmZgPE1i6nSQ6mckB2Ev6OCTK1y9421zY6UwjOcYLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DN4T+eVfULjd8gxzoehMpRxEkN8g5eoU4XT7/zJeX0oUWD8Epr57xPMx5MoPkfVGU0jzhq3JKZ3enhz0EuKvJXI7CPQUqUzYBGZMFzMiE1J+qaAIwSARxgYPKM2QuNswrtRZ90xErh1JjzACfaMWIWTh5omJcF5fpnB7emb454E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CmGz4B3K; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2db7c6b5598so35659031fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 18:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713576901; x=1714181701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wgAQ/k6ftf3kEmS4VwOGK2aR3cS1PKvV6nYGLQ/jFMA=;
        b=CmGz4B3KtOf5A4UBdlhWcvoTDkvchzyCz4X/vpZiQX5prSA9VErz3/DvRGNuqiezF3
         WXn1P3tULIgpkup3mqKZeM8VEPb+9gtXxAQtdO+Ro4mCjmag4658fZjnmpwBqaG6MABs
         b6k2Gkm4pu/0dCzuazRskXQ7RmCaoDViremdZ2O2Uz6LumJmAFvr5NZatXorq3uKe8po
         8d0nbdtWoWOPzGpkvG1HHKvfaiM6aMPnvgc/SAcdbnmmbRVdH6BT2LyHrORmi04FlIAA
         dm/qrhR72lTpzC+20AYkVA5OjxvZ174AjY5uVCpTrD/yBXftiIscM8KW2MSCDwyTuIAY
         d6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713576901; x=1714181701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgAQ/k6ftf3kEmS4VwOGK2aR3cS1PKvV6nYGLQ/jFMA=;
        b=tcuYsZWUgUXpgH9W+8qBmqg5uF+JKwdM3XVTogY5EnFJri9j7tH4wbQFglvWGNl6uo
         nX7a3CwczCdEoAhKidbLnNUnwFD4rTM61PsyS2d+BZQTmIrjm7ekTYw/RozDCwTI3nnL
         2sij9h9zxqXKXvMmHjDoTGwB2wZEDOndbGD3do/IjlX7uGOCSIMy+ulhgCVy8OGpD2dd
         EwFMB3mc/ZwcboQAbd+/KG3nGQFLB5MK19FNRdG7SatYeQUwixN1/0NZ4h/QuwrvnUz+
         0nqHfMmYNqYmJKJ6oE36qmBojifsrmSQBDubOrcnc54sjejDsAI4NrBgpCHPKBLjUlJz
         0+Kw==
X-Forwarded-Encrypted: i=1; AJvYcCW/+ltlOp2xdaSNytUtLzmUb2tE2k1Ics44wLr2sJEO+Zsrrj/RiZxHrSxHJgkx9yB8gGfiI/dxJEsrV13nvfLewhFK/g+lZpzFzqDODA==
X-Gm-Message-State: AOJu0Yy5+8uTPMOePSuSmprNzSmjd3F8/Xc87ySHTokNdfu2WV/e7E6E
	KOBYS2rImR7GJU/Bk+l2Ms+1vXdigNKoYUL3omjEgOPHzPgx5DWfuoVJxcyASlI=
X-Google-Smtp-Source: AGHT+IEG6UkWO9sIFqMDD0T/BshwP0AYdtwN/X6v+kaloTqHDQPNP766LYg8ZRKTcjRMLZeQMwntlA==
X-Received: by 2002:a2e:8386:0:b0:2da:a3ff:524e with SMTP id x6-20020a2e8386000000b002daa3ff524emr2687356ljg.9.1713576901417;
        Fri, 19 Apr 2024 18:35:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id t3-20020a2e9c43000000b002dcb831d958sm615016ljj.56.2024.04.19.18.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 18:35:01 -0700 (PDT)
Date: Sat, 20 Apr 2024 04:34:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 4/9] drm/msm/dpu: move dpu_format_populate_plane_sizes to
 atomic_check
Message-ID: <rqddqmqznhq4liusiyvowt4lfybb25qfdxak6ql6hdrreduutt@6uwkrlsxa4gw>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-4-d0fe6bf81bf1@linaro.org>
 <a122a43a-8def-0c11-41ef-b01fab33f98e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a122a43a-8def-0c11-41ef-b01fab33f98e@quicinc.com>

On Fri, Apr 19, 2024 at 05:14:01PM -0700, Abhinav Kumar wrote:
> 
> 
> On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> > Move a call to dpu_format_populate_plane_sizes() to the atomic_check
> > step, so that any issues with the FB layout can be reported as early as
> > possible.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index d9631fe90228..a9de1fbd0df3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -673,12 +673,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
> >   		}
> >   	}
> > -	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
> > -	if (ret) {
> > -		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
> > -		return ret;
> > -	}
> > -
> >   	/* validate framebuffer layout before commit */
> >   	ret = dpu_format_populate_addrs(pstate->aspace,
> >   					new_state->fb,
> > @@ -864,6 +858,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >   		return -E2BIG;
> >   	}
> > +	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
> > +	if (ret) {
> > +		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
> > +		return ret;
> > +	}
> > +
> 
> I think we need another function to do the check. It seems incorrect to
> populate the layout to the plane state knowing it can potentially fail.

why? The state is interim object, which is subject to checks. In other
parts of the atomic_check we also fill parts of the state, perform
checks and then destroy it if the check fails.

Maybe I'm missing your point here. Could you please explain what is the
problem from your point of view?

> 
> Can we move the validation part of dpu_format_populate_plane_sizes() out to
> another helper dpu_format_validate_plane_sizes() and use that?
> 
> And then make the remaining dpu_format_populate_plane_sizes() just a void
> API to fill the layout?

-- 
With best wishes
Dmitry

