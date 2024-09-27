Return-Path: <linux-arm-msm+bounces-32690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF2E988912
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 18:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4928C280EE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 16:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F53718BBB4;
	Fri, 27 Sep 2024 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9G4Q8QZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30405234;
	Fri, 27 Sep 2024 16:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727454612; cv=none; b=JcVOauZo4Riv85f1TmVRZrGHSc4SbSh1XJDOuH7VSp10NeiWUYQjzjZD0mG/f6ZhYllYhgboxhcjJKeneZsdy4AWbSQbAs1W8NuaufPEJjAjkrhFx1Njo18OtT01PEn572mzxPBVbTzr1OVYkOQXtGk4nWRnXm1LhAxGoNYqA38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727454612; c=relaxed/simple;
	bh=Khb7fI3t4uKvIa6tRoyoYLkwmsnRWW2zobCmTiJO5F4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MiIdw45TB1NCwGAlZhLYj71QsFgtG5jbFs5RX4QBvOjHToaclTkkD2qdLgClja/OEAdIeiSWNLzLBnD+OzL5SwQ07owuNgj6b66TgjHH6XMVW8K9m1EwCj5HAqUTZxzgDBsEcOSk12XaC9MxT4IP+U1kyl8pOwVtxOx/BQoH9r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9G4Q8QZ; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a274ef3bdeso9557435ab.2;
        Fri, 27 Sep 2024 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454610; x=1728059410; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvTgw6Pk9gBEviwsx0Cqlnka/Mthb1oy+t9pJwb6oKE=;
        b=j9G4Q8QZJ1t4gUKHnxXZr6f0FWsbBc+hTfkXudQ50wdjPxY/TcA86cXvTlaopjRz+r
         u08rkNN3R1HZFvRmJyQx/nbOUsm1NIvOWHkATAWt8SByu5w+F/gqosT86rZyviakEyAw
         vzyHqvMOkNzW5/zfiyUY7I9HQWRx0pxi9u0DKQMKX6o3DsJC517e3nz5yFG2b0NeKUFv
         3+P1Kg0HKF+d7FqC+RR4kftOMHa9PwrWOSY6JbClKMbTu3BfFNDLx4zVDZ6gbo52HO5x
         wm9vsq8jgJEVgZm94T6AlWq2PSCWpFdFF/xpiBTvZgEZ0pdPJGDY4EOyxa+7V2HAfybD
         FSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454610; x=1728059410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvTgw6Pk9gBEviwsx0Cqlnka/Mthb1oy+t9pJwb6oKE=;
        b=sfGv3j8p2NZ9WLlVY+d74rrKKswPO31B5teGA+pU/l+p3NRy0/vscSeWXige6Br3Tg
         lY0NfSHwRW3DJutmSLlDkLAAV/RJir18F89HVlf+7Zq77Gxe3yTJydpJzk0Z3D8Wq9KE
         3WiFNpeItFQ08kprspEWW/dor0ZXNLF1dhIpx/9VnewtHcKR1FcICnKtXhwr37v9zbay
         osshNjN0T8EhUhtqYjRuAyhbipjB+AIph/1O0iHUFYfjOCCMMNWK621POmqTFrgR/2Dm
         ZIFHwk51z+rRrkfP6oO/qdxKM88xVfYKAyjxzIECFFV61+r1H+2ajwy41fz7gCkx+nYJ
         981w==
X-Forwarded-Encrypted: i=1; AJvYcCVr4orAU+j1fvhS5cFNR5yf7q+NXCnn0mbddHAgC/dyHh+rtgLPuG06nJsNmIKTzCiQ1g6nhQIUBTDF+6DG@vger.kernel.org, AJvYcCW7DbD9rwKaMKguPCFo7KYwJdWyM5n1kvJdVmkXsfRNm0VeoUigjlwlSSNvxHX4jSwAp2VStn1g/8lkOBKZ@vger.kernel.org, AJvYcCXBkq65AjWKUX4cjUOZVuRaqMk1sEWIbm4vD+l3YHCouRWdQ6/bitWYeWJ9bVoSzMLDW3/ZiJBNgpEO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8OfL4OA9TkmrQ+WyRJhUz5Pb1WVxuuK40YCCI9zouXlCx3h81
	y24kkb3QZZrzUIwgW1igdXR5fFK79zuEOFgp5S0FDb3nmxGVTBOh58Cwvu+a0u2jMQEGUI7rDDE
	r1cHcydtsYIIYpo8O0GyCdoJJ9+k=
X-Google-Smtp-Source: AGHT+IHG8fZKXSPzJQdh8hWyj5jDzymKjpbFKeFVmqIY8B/+EwO1m/phqt/38c7UgSoytYslwNezKZlcY211D56O0qY=
X-Received: by 2002:a05:6e02:1564:b0:3a0:4df2:52e2 with SMTP id
 e9e14a558f8ab-3a34515ca34mr35037475ab.4.1727454609859; Fri, 27 Sep 2024
 09:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com> <20240926-preemption-a750-t-v6-5-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-5-7b6e1ef3648f@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 27 Sep 2024 09:29:58 -0700
Message-ID: <CAF6AEGviMOLoZKHf4DX9mEj84Y5Xx2hH4tvrkRVLsYyQz35Bwg@mail.gmail.com>
Subject: Re: [PATCH v6 05/11] drm/msm/a6xx: Implement preemption for a7xx targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Sharat Masetty <smasetty@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 2:17=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> This patch implements preemption feature for A6xx targets, this allows
> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> hardware as such supports multiple levels of preemption granularities,
> ranging from coarse grained(ringbuffer level) to a more fine grained
> such as draw-call level or a bin boundary level preemption. This patch
> enables the basic preemption level, with more fine grained preemption
> support to follow.
>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/Makefile              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 283 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 +++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 377 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>  5 files changed, 825 insertions(+), 11 deletions(-)
>

[snip]

> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 6e065500b64d6d95599d89c33e6703c92f210047..355a3e210335d60a5bed0ee28=
7912271c353402a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c

[snip]

> @@ -784,6 +1015,16 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>                 msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
>         }
>
> +       a6xx_gpu->pwrup_reglist_ptr =3D msm_gem_kernel_new(gpu->dev, PAGE=
_SIZE,
> +                                                        MSM_BO_WC  | MSM=
_BO_MAP_PRIV,
> +                                                        gpu->aspace, &a6=
xx_gpu->pwrup_reglist_bo,
> +                                                        &a6xx_gpu->pwrup=
_reglist_iova);

Couldn't this also be MSM_BO_GPU_READONLY?  And same for the
preempt_postamble_ptr, I assume?

Also, it looks like we are only writing the smmu_info from the
kernel.. is there any way that could be split out into a RO buffer?

BR,
-R

> +
> +       if (IS_ERR(a6xx_gpu->pwrup_reglist_ptr))
> +               return PTR_ERR(a6xx_gpu->pwrup_reglist_ptr);
> +
> +       msm_gem_object_set_name(a6xx_gpu->pwrup_reglist_bo, "pwrup_reglis=
t");
> +
>         return 0;
>  }
>

