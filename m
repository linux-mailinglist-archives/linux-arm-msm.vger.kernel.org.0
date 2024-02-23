Return-Path: <linux-arm-msm+bounces-12410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F51861E2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 21:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 482C3B2291E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 20:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7CF146E96;
	Fri, 23 Feb 2024 20:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cw+HpZ5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A5926291
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 20:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708721574; cv=none; b=KAD2ucrthxFBEXwf1ELbbozsA04PASH6FnAdC9JiGW1tXqBFKPcyFLL3STvw/ca9ImUeXrB0dweZ2uYOfAPhchMRH+rF+LT+VSYVVOE97nEai/soabZk6xxApOAiAYIig7q2NkTj4jlvq8k9VnCoQtx6uAns+z6LImY4LpQYPyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708721574; c=relaxed/simple;
	bh=n2xMVgNJCTCFhDUromHbPvL5mRoUyWkPJfqjF4Y21Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mo0OeIkFnTtFxNILGVyn6BoIPNhpR6wzDrHwc3ipDPE4pirbHA/ZuBafkXZYm6gqlutLN1pyv02R5jkCKJTS+DQWFqNLJ9XbEf8nnLM/5vADIfyRSkxc6xeeeis1lJIdU0+lJ9w3EE1Jw4JLheRnWm5lg1jQ1R1kts/mEM9zCr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cw+HpZ5B; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso857047276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 12:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708721571; x=1709326371; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NxODghQMamK2SljX5x9IFGf+/9bKTXqE2yI7GzUqoio=;
        b=cw+HpZ5B+SQM/bE0j92+3lNI5keheEJ383iP72NKc9yBkXcw6fEIB7jomkAHMMnDpv
         whFzE338pRa65ADClXjaAkCcDcgG+e6lKZJyxcGuVGU2ZU1J7lQJ7g2z8rqAGYOk9Lse
         xQpzwKzSomV5SSYQuBNQ1j1DkHIJbd0g2P+/jVEf4+UC8UlHXQryZ5pUoLC/h6eOzbkS
         gXfuLNc1jIbB4YYIqorbrIhkyfPX8Vrw0a/17wcQUdnLfWLIU48Huv7hPBWq5HPFKpxd
         zIW7q2RBVrHp1SV++0pP6faLDJJJwNZIbQ2QTb+z0Reyxsj1xyoK9paS4pF3T6qxaM3T
         mn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708721571; x=1709326371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxODghQMamK2SljX5x9IFGf+/9bKTXqE2yI7GzUqoio=;
        b=QsRnMUXdBe0ElV1kJBkPqwJPJ7BQQtfTIPJ7bZdKTviObvpL68zs08Ct4/xKSBTmqn
         nlnanqHyRX2ngoQ+j96Pa1cXriPUibfljQFSZvdq6vCOs31Ewa2N/ZzBBuN2jOZ7Rn5V
         ICV1pyjE5EUqI1FkuDx5944JIrOGKlXL0XyFVZh2ZOjj8J2B08mQI1Z4aOACF1Xr/y5r
         683/iYATFDfohLllF+8uiBi+1cNo1Vx3fsODgCWcHk6ZCw+6/H7gwSEcV4aciEVoW3EM
         8ipltw94NYsyx/IveatGOh53ibnIYAhQvUrpRZ35ID+eKfnsTtJwNYkDFAtJsG4i2GDa
         zQpw==
X-Forwarded-Encrypted: i=1; AJvYcCUnL3PtSXTY3aiF7GZNnnRRTbhjN+OR/6a/zEjcjR/EMZ748X2z5LNd1Ifm/H3h7VTxDi1nznuz9HZjZCzUzoIAfVaqSRhACH437ilbOA==
X-Gm-Message-State: AOJu0YxixtMJZBOIbrxnbjvrTme3GfzguOJjoopMzCkjAQWh2vecu0xx
	vCmepsQL+TauMv0oYaJgQ7R5zIMdEfhTAVyLfcz678Prauy/MLdn+9Pv0r5SRumYFwHG2epg657
	q9jT6JvvDdkqYIt06NH/QsSGgzxYxfSxCwKmKTiGGJwq/5517
X-Google-Smtp-Source: AGHT+IHZ4hv1SyiQwuPj/DGpQnYbZ1k7ZnN6iq5FQGS2hnMIJawQ/6XD7dXtl7UaSQWqFV1jxKvJifN7iBXBctwJ910=
X-Received: by 2002:a05:6902:2ca:b0:dc6:9d35:f9aa with SMTP id
 w10-20020a05690202ca00b00dc69d35f9aamr972227ybh.19.1708721571664; Fri, 23 Feb
 2024 12:52:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org> <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
In-Reply-To: <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 22:52:40 +0200
Message-ID: <CAA8EJpr3BJF_F231L3D8Qmx0Onvua7wcm2g=FM_YxMukw5-swQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 22:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/22/2024 3:43 AM, Dmitry Baryshkov wrote:
> > The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
> > Extend it to also support 4:2:2 and 4:4:4 plat formats.
> >
>
> I checked myself and also internally on this. On sm8250, the DPU planes
> do not support YUV444 and YUV422 (and the corresponding YVU formats).
>
> May I know what was the reference to add these formats to DPU
> considering that even downstream sources didn't add them?

No reference. I was interested in checking different YUV formats for
the test. It worked, so I wanted to discuss this. In the end, we are
just changing several bits, which are used for other formats.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
> > the clock inefficiency factor from 105 to 117. I'm not sure that it is a
> > correct way to handle it, so I'm sending this as an RFC. If we agree
> > that bumping the .clk_inefficiency_factor is a correct way, I'll send
> > v2, including catalog changes.
> >
> > I had no such issues for the YV16/YU16 formats.
>
> We don't support this too on sm8250. But interesting it worked.

As I wrote, YV24 also works if I slightly bump the clock inefficiency.
I think this points out that maybe we should calculate clock factor
dynamically.

>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 24 ++++++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++++
> >   2 files changed, 28 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > index e366ab134249..1b763cd95e5a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > @@ -475,6 +475,30 @@ static const struct dpu_format dpu_format_map[] = {
> >               C1_B_Cb, C2_R_Cr, C0_G_Y,
> >               false, DPU_CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
> >               DPU_FETCH_LINEAR, 3),
> > +
> > +     PLANAR_YUV_FMT(YUV422,
> > +             0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> > +             C2_R_Cr, C1_B_Cb, C0_G_Y,
> > +             false, DPU_CHROMA_H2V1, 1, DPU_FORMAT_FLAG_YUV,
> > +             DPU_FETCH_LINEAR, 3),
> > +
> > +     PLANAR_YUV_FMT(YVU422,
> > +             0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> > +             C1_B_Cb, C2_R_Cr, C0_G_Y,
> > +             false, DPU_CHROMA_H2V1, 1, DPU_FORMAT_FLAG_YUV,
> > +             DPU_FETCH_LINEAR, 3),
> > +
> > +     PLANAR_YUV_FMT(YUV444,
> > +             0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> > +             C2_R_Cr, C1_B_Cb, C0_G_Y,
> > +             false, DPU_CHROMA_RGB, 1, DPU_FORMAT_FLAG_YUV,
> > +             DPU_FETCH_LINEAR, 3),
> > +
> > +     PLANAR_YUV_FMT(YVU444,
> > +             0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> > +             C1_B_Cb, C2_R_Cr, C0_G_Y,
> > +             false, DPU_CHROMA_RGB, 1, DPU_FORMAT_FLAG_YUV,
> > +             DPU_FETCH_LINEAR, 3),
> >   };
> >
> >   /*
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index ccbee0f40ad7..949c86a44ec7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -195,6 +195,10 @@ static const uint32_t plane_formats_yuv[] = {
> >       DRM_FORMAT_YVYU,
> >       DRM_FORMAT_YUV420,
> >       DRM_FORMAT_YVU420,
> > +     DRM_FORMAT_YUV422,
> > +     DRM_FORMAT_YVU422,
> > +     DRM_FORMAT_YUV444,
> > +     DRM_FORMAT_YVU444,
> >   };
> >
> >   static const u32 rotation_v2_formats[] = {
> >
> > ---
> > base-commit: ffa0c87f172bf7a0132aa960db412f8d63b2f533
> > change-id: 20240222-fd-dpu-yv16-yv24-6bf152dfa7f3
> >
> > Best regards,



-- 
With best wishes
Dmitry

