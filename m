Return-Path: <linux-arm-msm+bounces-46024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A25EEA1AFD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 06:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55D743AE66D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 05:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663501D63C5;
	Fri, 24 Jan 2025 05:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z0GxDbnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634711D5CF2
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 05:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737695995; cv=none; b=tzfKsNHD3ORCZ0Wz3oVlRS1rTGDmomiXUcwsOGjTq8LUVplF6Xti/8pz5DGwwz+9Yk4D8+hIIakMp2z/JQirgp6IjEDfjU2L74nCsZMtmfiF93ZmJJ6HqieTBzS3sK4H9raV+w02tvrUxXAEB9Oxw7g05jwKPZxwKRoBCPEOQxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737695995; c=relaxed/simple;
	bh=DJW/yYlznm4mkiuFT2VmQaKq7Zj3CaWKyRoc3MPk/kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZ0EyMyQMkIL2f0nrALBQDdxOCsWDbIa5irmZdv7aYSdaw7VcyIv+VonmX4OgBVG7oXe62RkbqTuydlB2L45RaO0R/ODIaXbMIwOdfJLPXBXQmwUE+QWGjk72rNMlA5Ar5MuhqrFdMthb3iIboprQz+xpgotdYcNLIRvpNpTda0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z0GxDbnW; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401c52000fso1408037e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 21:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737695991; x=1738300791; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3o8gTZu6BR29eomWLMiFERLH4W2XG5CknLwAkj4XFWs=;
        b=z0GxDbnWfy1UKvOkFA8uUYaccT52i0PPbSvhitg0qVRF6V1K4Ady9RoVjehKuj4C5E
         dsskYctvqcuSnxzXA2fTDj9XPTFWEMo47TLDEMvA58/P78V/0DtfSempbu8e6ZHjeCIH
         NnkdmiZ9fPpYrG65wDYefeSwXev6E7vLf++thCiAN9iVU5PIH1l/YlNL2f1b1Wcy93bq
         TOTm5CuDieuTWmmf3YcmJf0OKEWR1Vd/bjGeFKIFY/u+MUjxcGoTiFhE0WDMDSewKWWM
         gNlVi91pwjDigh88mTAsMfzDWVycLqmlPWtfWCjgvwH8EQTtrlswyZlbsSf2KmNbblUc
         XyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737695991; x=1738300791;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3o8gTZu6BR29eomWLMiFERLH4W2XG5CknLwAkj4XFWs=;
        b=muMKgBrRq+uyhIDTPkW/hslgLDUUaRGxtXKqAcUKYBkvI4gFUVTbH04BSGALKhxdeS
         Uq0VZ+HC9RtZy3eUkR+igpAAHD/4+aAbJZIqOwSmDD6S0c+DuqdYrgBIbHlPY1sYmJVN
         kWv1DoIxud8JBFascnvvAaYEnEb02rMIDWC5rpR9p3npw5IJ2C3JYrMTVqG/NxmwHvLj
         RfOhaLeBMrgiZ/4FJReqHiZ+XSSw3dWnaPtU0ADzxZTf65yUzgcBXffMUn1U02u4M4gQ
         ATOiyvVRnz0ipPzeqZQ2K4O4cB6kE6bdHX7Qqd4pmwCzfrOKznOj7gZTJ6qKQcT6IWgj
         XzeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjDWbdBk9BS1YyxqjRzlMJWpf1Hi5aK0Wme6mePTmfTJpEYn6FyPS6GEDYH207o10ncBaB3Ec4cW5tZE0O@vger.kernel.org
X-Gm-Message-State: AOJu0YweB3lU/R+Gaar+mld7J2NpRp79LrKewwn8nF847mugGZM6wQpC
	LVyDalmqYMMZPBRh+NEkpmNMuYDTAWdIjx4uWaYKRl1HBm5RZjGMWrwdhe5Z+yU=
X-Gm-Gg: ASbGnct6G81374JOxRmXUdsvT9vh1d82coPBPhY7LqXw1h2RMTQ/lHqEnzx8BD5PaNr
	5Tv+89/oHdC4Ou7N2luphUs0EJluS/VStkTN/JcIbGh0DhjtM8NwglioVBGiF1Sfp/kHQX7BGTz
	hP+0lvCoE6TI3S8SZR4/dHE2Q5RSGP5yc8KwYQ+RHXWseFCMy4kepIQE17GWZO/DSGqzAaK8cuw
	JKpqOIWdRnCfi8l2NbuepOA8RiEYRjGsd1wmnZlCGvcAApYZWVNvMtySX7o+t3ZMCxqUfutGb0k
	O5Ax1/uOHED03PrBd1qo4Blf3UwEJxdNNo4S0LWcS40MN+FTFT1TUxNY2HZs
X-Google-Smtp-Source: AGHT+IEwnJ9j1k553+NJYN6NU1urekTvAiaOkFEFC2RQFT0hhnn33FzgCNI1K9Ys6RSk3s/xp4ZF6A==
X-Received: by 2002:ac2:550a:0:b0:53e:38fd:7518 with SMTP id 2adb3069b0e04-5439c22d6e5mr9306949e87.3.1737695991441;
        Thu, 23 Jan 2025 21:19:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8379953sm166799e87.187.2025.01.23.21.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 21:19:50 -0800 (PST)
Date: Fri, 24 Jan 2025 07:19:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/35] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
Message-ID: <esyb2hdp3rutcoiblqnxshta3x47ymdyotphasliprmkp643ic@eyopzwlihcpk>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-18-988f0662cb7e@linaro.org>
 <1b429f3f-2fff-45bb-86dd-48b1d164ccc8@quicinc.com>
 <c3c70f9a-7a1c-4575-af93-b519117d0084@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3c70f9a-7a1c-4575-af93-b519117d0084@quicinc.com>

On Thu, Jan 23, 2025 at 01:41:14PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/23/2025 1:32 PM, Abhinav Kumar wrote:
> > 
> > 
> > On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> > > Continue migration to the MDSS-revision based checks and replace
> > > DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 --
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 -
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 --
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  6 ++----
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 10
> > > ++--------
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
> > >   7 files changed, 5 insertions(+), 20 deletions(-)
> > > 
> > 
> > <snip>
> > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0
> > > 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > @@ -319,7 +319,7 @@ struct dpu_hw_pingpong
> > > *dpu_hw_pingpong_init(struct drm_device *dev,
> > >           c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
> > >       }
> > > -    if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
> > > +    if (mdss_rev->core_major_ver < 7) {
> > >           c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> > >           c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> > >           c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> > > 
> > 
> > So far in this series, we replaced the feature bits with >= checks of
> > core_revisions. That kind of works as usually feature bits get added
> > after a specific version.
> > 
> > With this patch and later, whenever we use < checks it gets a bit tricky
> > as we might also need an upper bound. Feature bits gave individual
> > control of chipsets but generalizing that all chipsets < 7 have PP DSC
> > is also not correct. I have to really cross-check but there could be
> > some old chipsets which do not have DSC at all.
> 
> This raises another question as well.
> 
> what if some register was introduced >= X version but was then dropped in a
> newer chipset.
> 
> Is it not difficult for the user to go back to the files of each of the
> sub-blocks and alter these checks rather than just fixing up the catalog.

Well, the obvious example we are going to have is the CTL_LAYER_EXT4,
but if I understand correctly the whole block is going to be dropped, so
maybe it's not that relevant.

Another example might be CWB, where we are going to have 5.x-7.x and
8.x+ DPU ranges.

Basically, yes, when adding support for a new platform we have to audit
HW blocks. But this applied even beforehand, where new platforms could
be drooping existing regs (8.x+ dropping a part of the TOP region).

-- 
With best wishes
Dmitry

