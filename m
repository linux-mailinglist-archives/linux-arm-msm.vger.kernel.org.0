Return-Path: <linux-arm-msm+bounces-24538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C52E91B2A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 01:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACB8F1C20E19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 23:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A661A0B1B;
	Thu, 27 Jun 2024 23:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bmUPoDIA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C641A08D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 23:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719530566; cv=none; b=KhekYdE66iu7nr5h3YfOzS+y/90hjr0DfgRwZB0NBgrcomxH6MeN3/ZyPHxkeobapX2vbxWvXwN6oohc2IA6mDJYqGJjasv2rQ25OhtaSk8c9ILfUOCgUYsW90qmmHD4rAzjbvJMqi86fT1hGyOZQJaVMxQln+wBJ84eyYqvzyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719530566; c=relaxed/simple;
	bh=vDn4zbbwQN2LrueYoVu0Wjy6pY1bsY3BKxpWDC1yVf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z12cxOwBYD916Bbp8kamE/rNk3JzuDuR+E/KodlZHEcKRtTwbG41PK+uZtB5Z/RRbkRgcmIb7jp/L6G7IDpK0lgX56MZQOhW6HSwZOCmCmWGpzD7Fci2hq4nXrVg1t6Pzt9GBC67xC78jkWmMh7MXIiw6+j0i3T1Jl/Xxzxgxu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bmUPoDIA; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-632597a42b8so17437b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 16:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719530564; x=1720135364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LB7gCAzcMu24VqG7bE0lt079FWwJNySL9zyflCf6kE=;
        b=bmUPoDIAzjQb0rtfw/fLtbs9m4Mr7h6EluaT+ImdbLFBGVRtBCWonevRj0arUaPRnd
         3U8W79ziHGW6fvjulS2ij984UO5xxDrHVdreJ+aLjGj8AI/Cai2ZfpoapH065PfAYkcM
         LgiSQ23CbSYBmef6Dmty8bDgwp/ul1T2Y5kEGxLhT2bzyOKEaSMUUr6cixWSxvb83kXc
         1eb6/VuHjXUyYh/Oy0ztTl7tY3PBaCnAVwh0+eyj8SqShVrF1FbPJYOUCmEwKwIIsMUi
         ROk59OsMYmv7FyPOFXLUcu2j84BONA0NCqSq2JU8qNhNcKRIFYQM0HEjm4BC1F0cGO12
         I//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719530564; x=1720135364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LB7gCAzcMu24VqG7bE0lt079FWwJNySL9zyflCf6kE=;
        b=wqXhG0OfHg9IVbARRGk8kW94ZkK/s2WZ3w3hoP+mGIMqO8Fd/tG9Vkmib7vvIDdgH/
         g+eQeCxuIKI/VrmJJKUA6PYX7NZZTic98RBHvWo4qm5Am/Gu865cDpie8OGaITHivneS
         xivDcUoewiSVw6xIyarb8Rq4SXENWoR7WkHB34TAXfvwrwxfLgnv/XyHJd77HCjpBucZ
         mrtBzg76XI62oQtsveXogYJcM7pBNwhbmMXU4czqgcVWThDwNWpeF1m9KEpJGatKKLux
         sZ4QJlJS/BG8AITMg3D2awV054xdzd1aYXbd/T2ioE1/CH6wntHI7I6FdF/y2sO0kXLo
         xdow==
X-Forwarded-Encrypted: i=1; AJvYcCVQc8ahT1tQIhtd2SovPUY8mry4Hz8pzg+j0MgeQlmX9TNmBIB4h5JOfgGQ1y2lf2r6A8BcDqWpz9qMuWJaFo5GyY+JfFivYoE0hEEDqA==
X-Gm-Message-State: AOJu0Yws58U8LW+SlGSg7daYyVhBNqTAgMgRTqET/SX9vfcHW72tBBQB
	yIC//3MYyyhXh/F4tamvsfOmVrfxytS867pkbnoG1o+6cRcwvKh+aCTvbPO90GXHGZWDRcW3P3W
	74o4QclDs4BUjw750RrQ5D97EZhwifK/jdlGVvw==
X-Google-Smtp-Source: AGHT+IHVr+5tNjDkazfolV1Z/Izc4wyGgRDTTfMMbJrJozuIjcL1Ax1K2NLH9YQJmTc28hAZR6/sL18+n2Y2dm8UqRQ=
X-Received: by 2002:a05:690c:d8a:b0:627:972f:baba with SMTP id
 00721157ae682-643aae70b44mr194087277b3.31.1719530564028; Thu, 27 Jun 2024
 16:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627205328.2912859-1-quic_abhinavk@quicinc.com>
 <CAF6AEGuGYG5mO-4KdNFbQFMA4dKj2PWT22xeh-3AFgedAG0uHw@mail.gmail.com> <3749ac14-54d0-fb62-345b-cef62399b6d4@quicinc.com>
In-Reply-To: <3749ac14-54d0-fb62-345b-cef62399b6d4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jun 2024 02:22:32 +0300
Message-ID: <CAA8EJppM1429sGzW6hq4QzLEjVX5Cf+8Jt5y94+VocFmPyxz+Q@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm/dpu: check ubwc support before adding
 compressed formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Jun 2024 at 00:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
>
>
> On 6/27/2024 2:13 PM, Rob Clark wrote:
> > On Thu, Jun 27, 2024 at 1:53=E2=80=AFPM Abhinav Kumar <quic_abhinavk@qu=
icinc.com> wrote:
> >>
> >> On QCM2290 chipset DPU does not support UBWC.
> >>
> >> Add a dpu cap to indicate this and do not expose compressed formats
> >> in this case.
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 ++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c               | 5 ++++-
> >>   3 files changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b=
/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >> index 3cbb2fe8aba2..6671f798bacc 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >> @@ -12,6 +12,7 @@ static const struct dpu_caps qcm2290_dpu_caps =3D {
> >>          .max_mixer_blendstages =3D 0x4,
> >>          .has_dim_layer =3D true,
> >>          .has_idle_pc =3D true,
> >> +       .has_no_ubwc =3D true,
> >>          .max_linewidth =3D 2160,
> >>          .pixel_ram_size =3D DEFAULT_PIXEL_RAM_SIZE,
> >>   };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> index af2ead1c4886..676d0a283922 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> @@ -342,6 +342,7 @@ struct dpu_rotation_cfg {
> >>    * @has_dim_layer      dim layer feature status
> >>    * @has_idle_pc        indicate if idle power collapse feature is su=
pported
> >>    * @has_3d_merge       indicate if 3D merge is supported
> >> + * @has_no_ubwc        indicate if UBWC is supported
> >>    * @max_linewidth      max linewidth for sspp
> >>    * @pixel_ram_size     size of latency hiding and de-tiling buffer i=
n bytes
> >>    * @max_hdeci_exp      max horizontal decimation supported (max is 2=
^value)
> >> @@ -354,6 +355,7 @@ struct dpu_caps {
> >>          bool has_dim_layer;
> >>          bool has_idle_pc;
> >>          bool has_3d_merge;
> >> +       bool has_no_ubwc;
> >
> > has_no_ubwc sounds kinda awkward compared to has_ubwc.  But I guess
> > you wanted to avoid all that churn..
> >
>
> Yes I wanted to avoid modifying all the catalogs.
>
> > How about instead, if msm_mdss_data::ubwc_{enc,dec}_version are zero,
> > then we know there is no ubwc support in the display.
> >
>
> hmm ... should work .... I can post a v2 with this and avoid touching
> the catalog altogether.

Yes, this sounds much better.

--=20
With best wishes
Dmitry

