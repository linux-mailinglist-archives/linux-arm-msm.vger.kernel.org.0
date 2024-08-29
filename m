Return-Path: <linux-arm-msm+bounces-29994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6039642BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAD9A1F227B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A84190685;
	Thu, 29 Aug 2024 11:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EBrgC1rd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C6B15AD9E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929829; cv=none; b=SKbRfK95aA4VPcUpy0UDmyhE7aB9gc8ZzZN02OWVUhLE8OjWeGvz2uNewRnXG3LP3uT9icj7b7qFf04p2cBCcp91dwt12DueTnWT6u8RG6c1UEC4oQrV+n74IvS9z1aU9ZO90ptAdRSIR6LdpYktITLkNwcOZHhOT8hXQcAQZmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929829; c=relaxed/simple;
	bh=ZILWOizrwMsUda6cQqGOf30Fw9nb4FMaJ7/AwYYDyXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHtMTLWNE7ecxADcwzGF6/x16G8B0iZWZC3+UdkRT4V+u9G6Ym2dz17FRlUy1QE0FkFx5utuU4C4h4sRX3Uq0CNJV3Z4tm03zwNZpxqHcliwoCCKfCDe62QVQjsUeWZ/6w4W3vtpBiO/x+Vmele50MvH9hUP5Y4qmZwHoERVyqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EBrgC1rd; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e026a2238d8so604646276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724929826; x=1725534626; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IMZRn0sUhAT7QPLtxYhsMgrNJCWGnuhAKggHYsS2Lvc=;
        b=EBrgC1rdT2nBUAmgN8easAjqGnHY15UprcEGlMQlxe9nk+n7QlLZ2Z/KlEQo9Na6zU
         Uh+vD0DQrXCPi/UuNWF1VoU/BPdlr5/Yxn+IfbWc/yz8ORKLajZB6Jzi2A9O+0/8kK32
         iOc3uJB1IjhgSFtUhqh2ymDjmApz0FXWQAxM8zTQqpHcw76XULy7kzByGKjOpQSytU5Y
         AFgEdluGZHwrkL05YwigL8t5IR5u8fA2qOXD97aktDsQOOPhXBWrgPwNTyW9XVsC0Fcl
         3WGbEI/LKNQqybQJFbj78OCaTWiwRw9Jhh0T1UL26orKFKoEkGW6k48LmoZwrcDahWl9
         7toQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929826; x=1725534626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMZRn0sUhAT7QPLtxYhsMgrNJCWGnuhAKggHYsS2Lvc=;
        b=w/euqmQCc7299Md30RFst4JgnCD3FAD2uL5BlrVIhRyiNzRchnuUDyETW4O7XUzx5+
         XjiiQcuddNgViDZrD+sS97AZD1uv8uZuqZLpqrtqX0yOdOdjtukK+P+ASdOE9cf9IEJJ
         P8dhOG0K9ly4NP0XQLbaqkqCeI6bgRp5KiHsqUmGSzUpUdwmcDx1Br9emYltLRWynX2s
         19qSSODBl07zh+ZUcITzs6nJtEP4x5MLhZn2Ae6q9Cr7YiFB/+2qjGQljETgP/aqF/YY
         MnJGY1a5PyjVyIoer9KGfvhsPcGakCxCzkacY8vxAJG6x+qXCRD5LPh6jtgSL3K4+MR6
         V+ow==
X-Forwarded-Encrypted: i=1; AJvYcCWWgEvYw88meDQ9VbLhNT6ocJDBQiSLLhzC3jpv5m8iUV3bNvrznewyM+kNLLn99mfSu6509DFQ3O4VSsJk@vger.kernel.org
X-Gm-Message-State: AOJu0YyXfe1/wYlaae69ytA3FSzBlPsi6FIR8bCXSiPBgC7cyg7jsuC8
	WF0KKaivV2vEv3mMUOIYwWdh7nAWR6s5skj2/FCCufQMeayGKUlFUEGSxneovNKH7zST5tM1S1s
	4D2XVHG+lRbZ3ix44DwO5QHh/l/Y5owCjVj3o9g==
X-Google-Smtp-Source: AGHT+IExKB2y+YYKi+w/X2u1O51Cl6dOZJ7yQ6Ws+aZXHZmk8aKxUzPH5YQQBBnmoCI91r2oWOFUFXCggGYyUusPgOo=
X-Received: by 2002:a05:6902:e0b:b0:e13:cb58:dd15 with SMTP id
 3f1490d57ef6-e1a5ab47dfbmr2665701276.8.1724929826178; Thu, 29 Aug 2024
 04:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-7-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-7-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:10:15 +0300
Message-ID: <CAA8EJpqZjO9rfVgVkhyCpg9qfyc13MHtz=RRhZG6ihMsVM+bSA@mail.gmail.com>
Subject: Re: [PATCH 07/21] drm/msm/dpu: Support dynamic DSC number
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
>
> Do not assume DSC number as 2. Because there are 4 DSC in
> quad pipe case.

Please expand the commit message. You prefer brevity, but your
comments lack clarifications.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 6bdd9c21ff3ed..05b203be2a9bc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -553,9 +553,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>                 if (dpu_enc->phys_encs[i])
>                         intf_count++;
>
> -       /* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> +       /* DSC and mixer are mapped 1:1, so reuse the mixer number */

Why? DSCmerge is a valid topology even if it is not supported yet.

>         if (dpu_enc->dsc)
> -               num_dsc = 2;
> +               num_dsc = dpu_crtc_get_lm_num(drm_enc->crtc->state);
>
>         return (num_dsc > 0) && (num_dsc > intf_count);
>  }
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

