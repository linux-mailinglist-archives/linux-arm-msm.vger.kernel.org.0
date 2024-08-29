Return-Path: <linux-arm-msm+bounces-29997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D58C89642FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F901B24FAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C475B190698;
	Thu, 29 Aug 2024 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNYP7RCT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F3218A923
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724931048; cv=none; b=hU+7Qt/9XYbmXmiR+ndO0NV06PfEmlt8+rBKR05lvSa3Tx7Il7AWionJeINtyzPNdYnOq6pP5HihE9QFYZRdbF1ZIkvQS0i35L5OWOk34gx9ADB+rXF/gnWtGMpJ6WoWmAEFH+qHLj765KrStGoyf7PWdKtEToBCTBHi96FtKN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724931048; c=relaxed/simple;
	bh=RXf5XnyjxXzPYrjzh0dJt5iTU1Fh5vM2+LPu5cXxgAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQ3BAeaA7rwzs2Novmosh+0yJtsClXDbn8wJG2wXTEH5DTNoPyrG2dXrzR/50P17iRyKkpe8GQ+gIanz9bshTcDlXZgScGdBDkiwCs/FKDaR43wQgXymMV4W0pS0ULd96Kr3JnRvXg/MIasKkK2eNV0OJQCh5t9IizWz6bf4BfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNYP7RCT; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7093b53f315so201696a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 04:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724931046; x=1725535846; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ReWorqYY0VGDLTBveQGdWy9bVyDQzpWAgTpeL0AFwY4=;
        b=kNYP7RCTCifDszMwfgplfvzgQYtCjJ2/C3B6iXgLzCh53Q9yqCdQrWR+LZHq8wUjrm
         WfyzMM3OxQsJwbLyjh94iZDzoodxudY5NIKm64sigob1nb2cLPAIk486WKoe1lGQIzPS
         9QuxC6NUY8S4QzbiE1V2XPllQSxhtq56EOJNZ5J1JVIQO1BNqyS221Ej6CbMl4KjggkS
         vwq8zg6W/SUQp5qf9zpP7jBCJborG17OXHYxY8Go2l0tGEZQZbQ7j1kbJAWfBJU6lgPY
         2piCKqravF81QyCFg3FLso/SwZzHEVVscbDKCxKfgasdoJZgtjvnQSE6nl9b5p81gJ0H
         0h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724931046; x=1725535846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReWorqYY0VGDLTBveQGdWy9bVyDQzpWAgTpeL0AFwY4=;
        b=hwEIWxJyqjVtKyMudkE6pomHAl9n6ct0KPpP67dRdANiQsY2voXu7QWE6mXtCXGr3n
         nmz+dljx1jDxfNHIsIn0mtXjV6s/eqVxmIUgFvtQ88KNFPvKb6YtdnQDo6r6FnZgqaFT
         SjnTTzwjJ6VOAm6ecWToyEjQ0e38WpyySgvZ2uHWOLiDzzMYQNGtX8O/qh9lXmpH4Rmx
         VdzxDnRDGKigfkL4aYEy5A5b7KgAkHm0gr/oh/fG0e8teP9lpZbaci94ohSowJS58OPv
         uEwOCVUOXRR2iXR6Kuc7CYq2ijEG/i0k69Se9c/F7e7laKx/M0zF/ZtIKgYxmrCoL00Z
         g0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIEKKVijoqQiaNMPPHu8GuFeMyckel9hF/rzRdHxc+I8034xQGMVUxR3XKam2G+nWYQG3dZ0xaLZYTHziu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw7ki3bo/2SEx3h1bJIJ+PgaUNAZ355A5nczoKtkqJ/ozns4dt
	r83w7ETTy8d7SivQudFW3M0O8q9SDv5yE3F4IDLxu/X2HKEQSoZzetrjjfFL4PMI8YHOjl5wpr6
	/BlHBGFZVX70mMoLBev3Kq9BTF1zA8Ves49XPBQ==
X-Google-Smtp-Source: AGHT+IEm6BpoCMJsMfPee0AxB7OK/BDhaR2otSKRjnCeYj7NqNbE55ilZhyParmXKAp88a/NdIInEA0aKqv3uoj+iQI=
X-Received: by 2002:a05:6830:7190:b0:70b:2999:2d7e with SMTP id
 46e09a7af769-70f5c3a239bmr2489351a34.1.1724931044713; Thu, 29 Aug 2024
 04:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-13-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-13-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:30:32 +0300
Message-ID: <CAA8EJpoRiF5uYUeeVog6QU+5f64eBzVDwafopXLnRkW5EiW6Eg@mail.gmail.com>
Subject: Re: [PATCH 13/21] drm/msm/dpu: Support quad pipe in header files
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
> Support 4 pipes and their configs at most. They are for 2 SSPP
> and their multi-rect mode. Because one SSPP can co-work with
> 2 mixer at most, 2 pair of mixer are needed for 2 SSPP in quad-
> pipe case. So 2 mixer configs are needed in quad-pipe case.

As you wrote this is based (depends?) on the virtual planes, then you
know that the code already uses either one or two SSPP blocks to drive
one sw_pipe. I'm not sure what do you mean by "2 mixer configs". There
are 4 LMs and 4 mixer configurations in the quad-pipe case. The commit
message is thus misleading.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 11 ++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   | 30 +++++++++++++++++++++--------
>  3 files changed, 33 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index a2eff36a2224c..424725303ccad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -32,7 +32,7 @@
>  #define DPU_MAX_PLANES                 4
>  #endif
>
> -#define PIPES_PER_STAGE                        2
> +#define PIPES_PER_STAGE                        4
>  #ifndef DPU_MAX_DE_CURVES
>  #define DPU_MAX_DE_CURVES              3
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index fc54625ae5d4f..ae6beff2c294b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -143,11 +143,20 @@ struct dpu_hw_pixel_ext {
>   *             such as decimation, flip etc to program this field
>   * @dest_rect: destination ROI.
>   * @rotation: simplified drm rotation hint
> + * @visible: mark this cfg is valid

So is it valid or visible?

> + * @mxcfg_id: mixer config ID for left or right half screen.
> + *             We have single SSPP, dual SSPP, single SSPP+multi_rect or dual
> + *             SSPP+multi_rect case. mxcfg_id mark current pipe will use
> + *             which mixer cfg. The first mxcfg is for the left half of screen,
> + *             the 2nd mxcfg is for the right half screen. The heading cfg may
> + *             be skipped by pipe with the first mxcfg_id = 1 if the plane is
> + *             only displayed in the right side, thus SSPP goes to later mixers.

too long description for an unreadable name.

>   */
>  struct dpu_sw_pipe_cfg {
>         struct drm_rect src_rect;
>         struct drm_rect dst_rect;
> -       unsigned int rotation;
> +       unsigned int rotation, mxcfg_id;
> +       bool visible;
>  };
>
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index e225d5baceb09..9e79cf9eba264 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -14,14 +14,30 @@
>  #include "dpu_hw_mdss.h"
>  #include "dpu_hw_sspp.h"
>
> +/**
> + * Max number of mixer configs. Because we support 4 pipes at most,
> + * the 4 pipes are with 2 SSPP and their multi-rect mode. While one

Or 4 SSPPs. Or 3 SSPPs. Or even a single SSPP if it doesn't cover the
whole screen.

I'm really sorry to say, but I can not understand this text.

> + * SSPP can co-work with 2 mixer at most, then 2 pair of mixer are
> + * needed for 2 SSPP in quad-pipe case. Thus 2 mixer configs are
> + * needed in quad-pipe case.
> + */
> +#define MIX_CFGS_IN_CRTC 2
> +
>  /**
>   * struct dpu_plane_state: Define dpu extension of drm plane state object
>   * @base:      base drm plane state object
>   * @aspace:    pointer to address space for input/output buffers
> - * @pipe:      software pipe description
> - * @r_pipe:    software pipe description of the second pipe
> - * @pipe_cfg:  software pipe configuration
> - * @r_pipe_cfg:        software pipe configuration for the second pipe
> + * @pipe:      software pipe description. Some or all of fields in array can

array has elements, not fields.

> + *             be in use per topology. The heading fields are used first,
> + *             and the later fields is invalid if visible field of pipe_cfg
> + *             is not set. For example, the visible fields of pipe_cfg are set
> + *             in the first 2 pipe_cfg fields, and the mxcfg_id for them are
> + *             0 and 1. That means the first pipe is for left half screen and
> + *             the 2nd pipe is for right half. The visible field of the 3rd
> + *             pipe_cfg is not set, which means the 3rd and 4th pipe are not
> + *             in use.

NAK. A single LM pair might already need two sw pipes.
After reading the comment I have doubts that you understand what the
code is currently doing.

> + * @pipe_cfg:  software pipe configuration. The 4 fields are for SSPP and their
> +               parallel rect as above pipes.
>   * @stage:     assigned by crtc blender
>   * @needs_qos_remap: qos remap settings need to be updated
>   * @multirect_index: index of the rectangle of SSPP
> @@ -34,10 +50,8 @@
>  struct dpu_plane_state {
>         struct drm_plane_state base;
>         struct msm_gem_address_space *aspace;
> -       struct dpu_sw_pipe pipe;
> -       struct dpu_sw_pipe r_pipe;
> -       struct dpu_sw_pipe_cfg pipe_cfg;
> -       struct dpu_sw_pipe_cfg r_pipe_cfg;
> +       struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
> +       struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
>         enum dpu_stage stage;
>         bool needs_qos_remap;
>         bool pending;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

