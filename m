Return-Path: <linux-arm-msm+bounces-19196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 124BE8BB519
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 22:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C10D9282127
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 20:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37554347A2;
	Fri,  3 May 2024 20:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BBdUhysh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A320C18633
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 20:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714769916; cv=none; b=S19YxQMMpiYRW8PQPEGDCRyCrpW1drI3UapAjpWrpnWXY5txO+mentN5v5HnU4Ld5aGBOeKPnUohKLwL3cC4ZbvRYH4LjHCTkft2zuPIi8CUAVJlyvIrWyoqf2zA12qqwvCaMcNtSoBZDUbabziUk0pGBizS9ZhC3GI8i/x24Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714769916; c=relaxed/simple;
	bh=94QERUQW2vb0f5FVZ4FZtQuKYtVmZ8u6WNBcDLXpiZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4rp2C9cVisQ7feCq/fzzIaiFzCv3/aHauGhJAbGUu0Uk/Q77iL64m0FXcvQOocVVhMvLd9kq7r8hmFnz1Z6gA2fINUmPdhFpzGdpqSWoPu+/47DrAHEIPFbGz7mv9TQEGAFNdlGTFhy4BvLDom3TAKwhFFE5mOzlU0hx1o6vlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BBdUhysh; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51f57713684so80084e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 13:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714769912; x=1715374712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGCcksotH+kok5NpboUKTIlKHpdUeNSbaWOxB4FkSPs=;
        b=BBdUhyshgFkDSnhM3FymrOVuTdt93DoDTGPphE1cuntT++4xoEp6w8YN6MU/UlSN9m
         xxDzHer1FJXAEBLVpPz5pWzr0p1GnisFcqHNePQBPazcvxOPlDAhcdZd2rG0T9AG/Up7
         MvnJ9v+/dcBTAenFhk3spxFaht8tMj31k/QPLITvH7BN4VCQBxSnWYqVhT8xTcAZ/x1p
         T09TQw/ed13z5oHa6G4A3GvQZTf8UfP4p5a/i+mnFh/Y5ykCOnzLrOIo9LAyfd96y6Bl
         y8MVQ7G84iiQ6AysqpdvrbIcuGd7yBINw4nkXqK4w/un/vUPQ5IjpdPQ/E0QJ37CAQHI
         HoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714769912; x=1715374712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGCcksotH+kok5NpboUKTIlKHpdUeNSbaWOxB4FkSPs=;
        b=X1U9LUgxjneHIdUhJLr7WsgHBi2LeD4xIAH9lnRM/VAERzgsob3EqL6BQI5RokFa6v
         XEv6ET/pNZV2c+ClcSMfgbYKHnwtJ7H9OIenASvhUG1kBF0ZrLbWkDsY7gc9KIfzlMo6
         k6q/QJWJJeoDlyR5MRgb6WtvJqR/A/1F8Z5zg/spYjgt7lmbTWJO4J89XIq/83YhuFKO
         9uoj3A3f/Y0AK5JdKlGiYA+bXZvV6PkKvLX3ifmqcL+Nnb/biHvmYCwpGH6urWQ5LA6D
         eEyvKIGdzde6yDsjuNUgmcbbVWxviCa57sQxMQUz+fdoeC621IrL+jF6eNaPj9MlMMkw
         8VsA==
X-Forwarded-Encrypted: i=1; AJvYcCXULsa0ifrdHDIAHnFpFwA0i8LMYhgCjNL9HcLe7RA51/qqQSwOHyVUIy4erLx9DM/1K5LRrloySFe9ESft15NteLxGV0MvRqlYmOjk3g==
X-Gm-Message-State: AOJu0YxcxFL610K9/nvA7w13L6oOTgBUZli7MvR+MM9CZtbWa+lX5kvx
	98DU8SY7VuT0AR4zdYII74i/9stQ0riePnnE+I/rxmVronRCNcz+vul1VXqPtpCLPU5MMPsda6u
	by4M=
X-Google-Smtp-Source: AGHT+IGh163oqin4GlmPqJK3PbLBLGdZ4e4w6rDs1lNIuIE6Lk/Bcocl9QGPInbpoBXNrBomjORIHQ==
X-Received: by 2002:a05:6512:b18:b0:51b:fcfe:ed with SMTP id w24-20020a0565120b1800b0051bfcfe00edmr3062478lfu.25.1714769911856;
        Fri, 03 May 2024 13:58:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id o29-20020ac25b9d000000b0051da1d9e51dsm653034lfn.289.2024.05.03.13.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 13:58:31 -0700 (PDT)
Date: Fri, 3 May 2024 23:58:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/msm/gen_header: allow skipping the validation
Message-ID: <xtnfj6foaxy6upqydlozrm4bbg4cawjecuuud6szbgtpjitvag@fpc5bmpptelk>
References: <20240409-fd-fix-lxml-v1-1-e5c300d6c1c8@linaro.org>
 <20240503164812.GA4153965@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503164812.GA4153965@thelio-3990X>

On Fri, May 03, 2024 at 09:48:12AM -0700, Nathan Chancellor wrote:
> Hi Dmitry,
> 
> On Tue, Apr 09, 2024 at 05:22:54PM +0300, Dmitry Baryshkov wrote:
> > We don't need to run the validation of the XML files if we are just
> > compiling the kernel. Skip the validation unless the user enables
> > corresponding Kconfig option. This removes a warning from gen_header.py
> > about lxml being not installed.
> > 
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/all/20240409120108.2303d0bd@canb.auug.org.au/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/Kconfig                 |  8 ++++++++
> >  drivers/gpu/drm/msm/Makefile                |  9 ++++++++-
> >  drivers/gpu/drm/msm/registers/gen_header.py | 14 +++++++++++---
> >  3 files changed, 27 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index f202f26adab2..4c9bf237d4a2 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -54,6 +54,14 @@ config DRM_MSM_GPU_SUDO
> >  	  Only use this if you are a driver developer.  This should *not*
> >  	  be enabled for production kernels.  If unsure, say N.
> >  
> > +config DRM_MSM_VALIDATE_XML
> > +	bool "Validate XML register files against schema"
> > +	depends on DRM_MSM && EXPERT
> > +	depends on $(success,$(PYTHON3) -c "import lxml")
> > +	help
> > +	  Validate XML files with register definitions against rules-fd schema.
> > +	  This option is mostly targeting DRM MSM developers. If unsure, say N.
> 
> Is this change going to be applied? I have gotten a little tired of
> seeing "lxml not found, skipping validation" in all of my builds :)
> 
I've posted v2, including CI changes. The plan is to get it merged
before the drm/msm pull request.

-- 
With best wishes
Dmitry

