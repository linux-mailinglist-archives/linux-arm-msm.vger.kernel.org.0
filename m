Return-Path: <linux-arm-msm+bounces-29833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E8F96315C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 22:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46EE8B233AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 20:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299FC1AC437;
	Wed, 28 Aug 2024 19:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="azpt6wv/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F861AB53D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 19:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724875195; cv=none; b=FWPQnKqHsqzZ65F2F5EAVojyNwJwMyRsmnMSRJcAsychuDubWJWHG6Pgo/8hZIIpp6PceXLCm03HkrP4fkDm5wlsVzsXTATmcgfw2CMy5jBH4luAuYfY661ZzCgd6JpTA/EYuIP6dhCFgdLPcYnHkIElA/GpntS4m/iEyDqH//E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724875195; c=relaxed/simple;
	bh=EF31OWz0253e9blSGsQ5Q82/ZBUquUx8AsXyW+D8yXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjzelL8UOz+SgcsU2Egqctpgkb/3VGiBbuwXwztd3YerPy+aeRecEedR/GYqjT5Z7AObgGimek8GbPO3VnBvczmVmXkfaZMjhbwR25ca2DFE5VjWUyMtvqlLgzSdOWv3B5ix41bxzA3dwvapiUciC76qTpWF126+9j3q4e0FEcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=azpt6wv/; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f3fea6a0a9so9030521fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 12:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724875190; x=1725479990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8zHkfisckPodXDwU4YrlbbeO+jKzfoe0P8xfdKKL2o=;
        b=azpt6wv/wd3GpH5ITDNjqM9pDjkMlvsw+6Z49nxVFzV2qvxYoqNU1myDurnTs7/0Vr
         TxwNN2YhTYRPHEij9ki2SZBcIQJHAjwxTABvxh9nYboWRmSe16BKoCdzxfOuTJgzMDYf
         p3evfHC3KEH+KVJyQtvw5x4okgpBrQrVA0xwsWfiTzeC5Cp7qhw6B5FvvvDe7xp/D/R5
         4rppboBvH1/1mI2DUbtnAGVTCv8eRPwOjysb9Mpzp50KGwwsHBm5kgyrvEi15xTthJQ9
         /2bLTkYzWO3TsQbBKODaVPYPmNNs+7F2NBXWHh04R/ix/5DJnPTPCoGkpNAEigDyVsou
         FLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724875190; x=1725479990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8zHkfisckPodXDwU4YrlbbeO+jKzfoe0P8xfdKKL2o=;
        b=gLQ+qFr0q6hLo8h1lmbkZIcpVxdOJfLnmOavlsmAk/jefhnIYNorYKj4wtsR4Q+07O
         yPDczTPB5vu9AAuJUNYJXUByncDwvaYruyZQEhiaG/86x2NDK2Kj/ClGkWco0bQfMHQu
         6KEgkrCvFS6aIKlFe22sK7CeoJrc6j2T1Ja18eyw/AXTl5L9e8HzQxytJdoqZ14BgrdG
         mtF87fGKqWcm5gz3FmH20wV8azbn5p5AWdi8ZZYtalp2pihBcvA+L9XARFNA3PZrce/7
         oL5LaZaaZNzNaq19tJ9rFZwAhBaLf5xwwY1l/j6xADuk3te9yrlIw8aiIMYNoTC3Ol0+
         PrkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7VFSEFzhQWFRI5Jf9rR02X57Gzg9P0pfx1yoJyITGlNebZZrvVEkm1GIgYMZfLUnVNzDvYfYz2L4Om/vd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk3fUXzVlwboAk1wbOAsTNP75kSevxWEuFmfQkXP6MlRL+OROP
	lOp8GN7AbOLNSbHICM6iyeT6pnkzS5HlKnFc8wgnzb+pqrk5vIAedqnS/30FslY=
X-Google-Smtp-Source: AGHT+IHUPZgRjwjhGXUYisGlSBvBIIptTwT7XL/6mzdnfRbs3tQwYO6A+cS/VdeREgw8PkHAmaFlbA==
X-Received: by 2002:a2e:a989:0:b0:2ef:2768:619d with SMTP id 38308e7fff4ca-2f61299bce6mr827061fa.5.1724875189428;
        Wed, 28 Aug 2024 12:59:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f40484c6c0sm20011361fa.75.2024.08.28.12.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 12:59:49 -0700 (PDT)
Date: Wed, 28 Aug 2024 22:59:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, dianders@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix the highest_bank_bit for sc7180
Message-ID: <fbhb7hlpmxxfqv5iwtuhuxz4nx4qifd6kygo5fxvfiqsh2idpu@tzqwxkxaszq6>
References: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
 <CAE-0n53qMJVbfb9oXbDexqhOj6qTBq9k5kMj1e6CXadObhBmLg@mail.gmail.com>
 <c2218911-650a-4f43-9119-bd2cfc46f3aa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2218911-650a-4f43-9119-bd2cfc46f3aa@quicinc.com>

On Mon, Aug 12, 2024 at 12:41:40PM GMT, Abhinav Kumar wrote:
> 
> 
> On 8/12/2024 11:40 AM, Stephen Boyd wrote:
> > Quoting Abhinav Kumar (2024-08-08 16:52:27)
> > > sc7180 programs the ubwc settings as 0x1e as that would mean a
> > > highest bank bit of 14 which matches what the GPU sets as well.
> > > 
> > > However, the highest_bank_bit field of the msm_mdss_data which is
> > > being used to program the SSPP's fetch configuration is programmed
> > > to a highest bank bit of 16 as 0x3 translates to 16 and not 14.
> > > 
> > > Fix the highest bank bit field used for the SSPP to match the mdss
> > > and gpu settings.
> > > 
> > > Fixes: 6f410b246209 ("drm/msm/mdss: populate missing data")
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/msm_mdss.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > > index d90b9471ba6f..faa88fd6eb4d 100644
> > > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > > @@ -577,7 +577,7 @@ static const struct msm_mdss_data sc7180_data = {
> > >          .ubwc_enc_version = UBWC_2_0,
> > >          .ubwc_dec_version = UBWC_2_0,
> > >          .ubwc_static = 0x1e,
> > > -       .highest_bank_bit = 0x3,
> > > +       .highest_bank_bit = 0x1,
> > 
> > Usually when I see hex it's because there's a mask. This isn't a mask
> > though? Can it just be '1'?
> 
> I just retained the same convention that was used earlier. It seems like a
> mix and match right now. sc7180, sm6115 and qcm2290 were using 0x.
> 
> I can post a separate change to change all of them.

We probably need to do a +13 to all of them to follow the approach of
the a6xx code.

-- 
With best wishes
Dmitry

