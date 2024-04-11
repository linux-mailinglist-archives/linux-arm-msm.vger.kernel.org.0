Return-Path: <linux-arm-msm+bounces-17285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A17F8A1F5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 21:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9FC8B218B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 19:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E073205E2B;
	Thu, 11 Apr 2024 19:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q3rmeP1f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98583D9E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 19:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712863056; cv=none; b=onnsZdILNzeMBZgd6tr/HvnZGokZ/SE7CzxvK5sYlGUviZNexx7AL50lkCAIh/VTkgl99nAW6dxsutI82wpeWVAdenIlY/1uFzXlcFSZd6oeSbs36k7f2kthWGU79PnQtcOkzeTDbRfDyNWvrpjzQHEEP0drmvgJDxGaZNhgjqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712863056; c=relaxed/simple;
	bh=8EjvgUd3wbUZBBxGAMEXOpGq+WfxvPb6kMOpSTenxDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqgLqy7hhvT/LpE9am8tgohCjSbE2d9AjLQ4jACma+Eog/MbrBS39EMymy2QOYVPsz49y5kNTMrjkCCP5Cb4Qai31vUALix4LNIdHW5ZDOYZM2W1MWQrUHGPxnnge0AmhSvigIm4VnG5EdrYA11ubKebfvOCo0i+45pBgsWhMvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q3rmeP1f; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso170164276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 12:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712863054; x=1713467854; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j7eWquxqAMjYK6VihEdOuCucSW8IggeB6/1qHvvdeSw=;
        b=Q3rmeP1fxPy8DX5uRZzKTZjVxZv5gEzPaMr7yYeST/CK9BDcWbqL+wNrsBTEGlHMT8
         7PnpI+tsGOPT5vWH31G1pfPWT8LEmOMgwpTgNG5XYyGKwRBeXOCpQE7n6IMCMY9v5q0X
         DC+ewhynrXamM34Y1c41rZdCcyEgThDGL9w8xlh98mt4kiubnr9j8gdX/l0hpQesSb9p
         9X+mgp+ENxYgn3N7D5AI0zKXrlLVJDVmqCKTM00Gqf/iR+4O5NyxxT7Bx0Yurb0tbwyY
         W223hWqVykFKhT+UnV07ZbEnQslEON0ZW87PBmWzzrnQ9181Onp+rpua837Bt5gsLFD+
         oq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712863054; x=1713467854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7eWquxqAMjYK6VihEdOuCucSW8IggeB6/1qHvvdeSw=;
        b=TZ//CyNBnt11ABxgyTj4Y3dGbOPCW8rXdhZa5iXFdLA9/cRPMU14yEr6VHFv0pjo9w
         BTF40ud5Y9NXJIpN2xKXZmwVXJI0MflLfIV3lVqwrLu1g8s59LI+JSzM0EN85N4H6foz
         u+4uw9z6Lgw9EGli1POHhja5hq4BXq9OubbH0fts/odBjnEz/8oV+8bC+3cXqbitVSV1
         NjByA+Ziv2XNq4Cz86O4yOkYHLWI9RP77X4OjdhWeg4c8CrVvAF+EaB3XJYgnx5jbo75
         UEe+fBR12Oyyrl8J5GpI2ULhowj5VlTED4v/3D6RtXE1mz+9V8AQ6U7VVeBT9bmhj0tA
         YrjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5gPR+vyY3u5YVGCPHgVSFryioCS0DleX+ZLUWCvhRPFOTk7UIVh8zNIMo6a8SkYYoWe02iwg3N3Evc2z418haBusUVWoCqqO9q1G+8w==
X-Gm-Message-State: AOJu0YyPUaSfoLAeoV4D7LODOdXTk7vdi9JcEVxfJDl19T7Bjb7tBvKA
	jcXLAmF/uCHjGLfdXPAirs16icFopdDftGTY8g+th22b4D7fEsqpuIlJxovx6ftuEzF4uF3PJQ+
	t/QRARbqEr1h/XP6CRSyW52WMf7qtd2aHkYDMxA==
X-Google-Smtp-Source: AGHT+IEVbxHhaYUYjwSUfMZSHyB+FLGNEeS3qJzD72p2Onb5zw3ffC8t5q4TGARlkUDzB6BdQd6ztNh4j0dMx1ga560=
X-Received: by 2002:a25:ced3:0:b0:dcc:4b44:336c with SMTP id
 x202-20020a25ced3000000b00dcc4b44336cmr521172ybe.53.1712863053956; Thu, 11
 Apr 2024 12:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-8-dmitry.baryshkov@linaro.org> <1e7706ab-d2f4-baf9-90c7-f5a81959920f@quicinc.com>
In-Reply-To: <1e7706ab-d2f4-baf9-90c7-f5a81959920f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 22:17:22 +0300
Message-ID: <CAA8EJpp377V9=+e-b=1pHB63BoY0zPZgN_OhAhh_N-+jnm6-VA@mail.gmail.com>
Subject: Re: [PATCH 07/12] drm/msm: merge dpu_format and mdp_format in struct msm_format
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 22:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > Structures dpu_format and mdp_format are largely the same structures.
> > In order to remove duplication between format databases, merge these two
> > stucture definitions into the global struct msm_format.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  12 +-
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   2 +-
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 184 ++++++++++--------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |   2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  10 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |   2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  41 +---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  30 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   6 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  14 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   4 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  16 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     |   2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  74 +++----
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |   4 +-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |  26 +--
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |   7 +-
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  54 ++---
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c      |   4 +-
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h      |   2 +-
> >   drivers/gpu/drm/msm/disp/mdp_format.c         |  28 ++-
> >   drivers/gpu/drm/msm/disp/mdp_kms.h            |  13 --
> >   drivers/gpu/drm/msm/msm_drv.h                 |  28 +++
> >   24 files changed, 279 insertions(+), 288 deletions(-)
> >
>
> <snip>
>
> >   int mdp5_smp_assign(struct mdp5_smp *smp, struct mdp5_smp_state *state,
> > diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> > index 30919641c813..5fc55f41e74f 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> > @@ -63,26 +63,24 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
> >   };
> >
> >   #define FMT(name, a, r, g, b, e0, e1, e2, e3, alpha, tight, c, cnt, fp, cs, yuv) { \
> > -             .base = {                                        \
> > -                     .pixel_format = DRM_FORMAT_ ## name,     \
> > -                     .flags = yuv ? MSM_FORMAT_FLAG_YUV : 0,  \
> > -             },                                               \
> > +             .pixel_format = DRM_FORMAT_ ## name,             \
> >               .bpc_a = BPC ## a ## A,                          \
> > -             .bpc_r = BPC ## r,                               \
> > -             .bpc_g = BPC ## g,                               \
> > -             .bpc_b = BPC ## b,                               \
> > -             .unpack = { e0, e1, e2, e3 },                    \
> > +             .bpc_r_cr = BPC ## r,                            \
> > +             .bpc_g_y = BPC ## g,                             \
> > +             .bpc_b_cb = BPC ## b,                            \
> > +             .element = { e0, e1, e2, e3 },                   \
> > +             .fetch_type = fp,                                \
> > +             .chroma_sample = cs,                             \
> >               .alpha_enable = alpha,                           \
> >               .unpack_tight = tight,                           \
> > -             .cpp = c,                                        \
> >               .unpack_count = cnt,                             \
> > -             .fetch_type = fp,                                \
> > -             .chroma_sample = cs,                             \
>
> Minor nit:
>
> These two lines are only moving the locations of assignment so
> unnecessary change?

Sure, let's drop that. I think it was just C&P of some kind.

>
> Rest LGTM,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> For validation, are you relying mostly on the CI here OR also other
> internal farms? Even though mostly its just making code common, basic
> display coming up on one target each of MDP4/MDP5/DPU will be great to
> be safe.

It was a visual inspection, but not for each and every platform.

-- 
With best wishes
Dmitry

