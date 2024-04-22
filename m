Return-Path: <linux-arm-msm+bounces-18173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641328ACCB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 14:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B4D71C20956
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 12:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185144F213;
	Mon, 22 Apr 2024 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QeKnMPgT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4085C4AEE0
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713788569; cv=none; b=u67E0VAqZ2UKUXu7O1kZBkXLYrk+rUmfXSl5KvAmKq4kS2jsJ3WDVScy8mKZ8b4NBDRHQFTRz6/ukOegG5U54J+0yMwQ3wn3FWwRxRGLXJgpkSqnmvlOJuJpBrPecE0szkKhJsWC5vwUQ7n+RmTyZ+d1Pei+xnOb2Hvh29Syiog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713788569; c=relaxed/simple;
	bh=zsAjOGFW/ovhfYrakFZgk3NXRPeEIYW7Z8zvJm6nKTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3ZSELH43FrpFvDWjjxzPBscJHfksfCJeOhyixXQDg28vR1dibhEQAu6nYqC4PWf2xaMP9G6oU5T+z6tmzm7aBqACr+nNtrMKBDqkGHwuFODqOgQjilZvBhN9v6ZWG5Vu7PQpgaxOxKxbA9oY9W+rApKxQ8GCjTmaknkTH7/DPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QeKnMPgT; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d8863d8a6eso61546271fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 05:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713788565; x=1714393365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0N97Un7iKJy6ZaKa37UlkZBwuE/KTJjFA85IfE4WHbE=;
        b=QeKnMPgT+Ihq9ke47lF6h7eQYd6I/7SRuxxbBmnkKg9qxXkH8Nis2S1k++NlzWF7Pe
         9jahU6LwAX80wTcLM3k+r4h36Lq4LE2v2tDm9JWsSJ5XPR/nmMRVc/UFX8icUndIZW8O
         XlwBqR9yCdjWFbfg027MbUo2VfMKdaVags38qmdFUTySuOUWmTdO8Tr/nsl1t19mdGQk
         nNBndBuKlizC7hEdxije6ML3nNgl5gI1+t4DqvNDJCBqNklWevwEA77F3v8RL4eIn2CP
         gGQRmtrS6wGZFL+OwbSJm5OyVJ+L5wAJiktBkigto2L726hRKjxMs6+ky1wF6aZ7gpKA
         Uajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713788565; x=1714393365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N97Un7iKJy6ZaKa37UlkZBwuE/KTJjFA85IfE4WHbE=;
        b=HotTdYRkgRflQgy0r+nR6HWXOptsxr3068356SG1wYnFWUgJ//+NU+G5nr3kINXybR
         N3oJB6lqQf4+1IzRI7jPPyrYOn8K9obpIF1USJzjsjhsmt6te+KgZQ/djyI8INT4stI+
         uJAilx2NW8feDPM3ympxJP1mJPHBavY5/gt95MdkR4p8bi3jyymtl9KPrjmVxLrzxsIO
         68lxmYk0DcHmSGQ4sdbL3Nrj5n8BrZ/kH2MG38BQlih6QfHhtGi3R1v933/G2FZrCvzr
         a0QmO6swA7GEIQ4cfmhWnslWNDBfMqJvqQ58q7KYULPwVZqD+KWpSJtc+1ahBpqMvuWL
         Lhcg==
X-Forwarded-Encrypted: i=1; AJvYcCVOoY9kZ/jlFoDcfpxV1y4CjZDNvZo98nmrlBWlYqLh+ENQly9rKIIRCiruklgn/naB3cXeazROx6pm2Ox4ux0LCygObtZhs740LUlOJg==
X-Gm-Message-State: AOJu0Ywd3FAXQ+1CtpzFswzpsmmjP15djSsWk0RdmeR4fimpCW84oAGA
	9d8r0fH69nlAeFSDyxW9qXPGZMPdSzkxJgh+zg3SFRt01d/W5fA5hBqG0YyWgZo=
X-Google-Smtp-Source: AGHT+IHEwl9kdeoIRBSg/s27Fmo9cBqQ8a+PpvHL/HWOE1hVoBjq2Q2cW4BifI+Wc2xbXVRZ04Q9xw==
X-Received: by 2002:a05:6512:104a:b0:519:5a60:5fe7 with SMTP id c10-20020a056512104a00b005195a605fe7mr9132480lfb.66.1713788565217;
        Mon, 22 Apr 2024 05:22:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512104900b00516be0a0579sm1661591lfb.75.2024.04.22.05.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:22:44 -0700 (PDT)
Date: Mon, 22 Apr 2024 15:22:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 4/9] drm/msm/dpu: move dpu_format_populate_plane_sizes to
 atomic_check
Message-ID: <7uqzoioa6enpxocrcsbykmdcucfgb4mglgep3k6b7strevs7cc@dqeyxrmieuvv>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-4-d0fe6bf81bf1@linaro.org>
 <a122a43a-8def-0c11-41ef-b01fab33f98e@quicinc.com>
 <rqddqmqznhq4liusiyvowt4lfybb25qfdxak6ql6hdrreduutt@6uwkrlsxa4gw>
 <81322c16-8d82-16e7-dafd-93c29b07f169@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81322c16-8d82-16e7-dafd-93c29b07f169@quicinc.com>

On Fri, Apr 19, 2024 at 07:37:44PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/19/2024 6:34 PM, Dmitry Baryshkov wrote:
> > On Fri, Apr 19, 2024 at 05:14:01PM -0700, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> > > > Move a call to dpu_format_populate_plane_sizes() to the atomic_check
> > > > step, so that any issues with the FB layout can be reported as early as
> > > > possible.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
> > > >    1 file changed, 6 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > index d9631fe90228..a9de1fbd0df3 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -673,12 +673,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
> > > >    		}
> > > >    	}
> > > > -	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
> > > > -	if (ret) {
> > > > -		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
> > > > -		return ret;
> > > > -	}
> > > > -
> > > >    	/* validate framebuffer layout before commit */
> > > >    	ret = dpu_format_populate_addrs(pstate->aspace,
> > > >    					new_state->fb,
> > > > @@ -864,6 +858,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> > > >    		return -E2BIG;
> > > >    	}
> > > > +	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
> > > > +	if (ret) {
> > > > +		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > 
> > > I think we need another function to do the check. It seems incorrect to
> > > populate the layout to the plane state knowing it can potentially fail.
> > 
> > why? The state is interim object, which is subject to checks. In other
> > parts of the atomic_check we also fill parts of the state, perform
> > checks and then destroy it if the check fails.
> > 
> 
> Yes, the same thing you wrote.
> 
> I felt we can perform the validation and reject it before populating it in
> the state as it seems thats doable here rather than populating it without
> knowing whether it can be discarded.

But populate function does the check. It seems like an overkill to add
another function. Also I still don't see the point. It was fine to call
this function from .prepare_fb, but it's not fine to call it from
.atomic_check?

> 
> > Maybe I'm missing your point here. Could you please explain what is the
> > problem from your point of view?
> > 
> > > 
> > > Can we move the validation part of dpu_format_populate_plane_sizes() out to
> > > another helper dpu_format_validate_plane_sizes() and use that?
> > > 
> > > And then make the remaining dpu_format_populate_plane_sizes() just a void
> > > API to fill the layout?
> > 

-- 
With best wishes
Dmitry

