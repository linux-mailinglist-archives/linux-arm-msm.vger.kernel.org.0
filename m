Return-Path: <linux-arm-msm+bounces-21347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 586528D6A0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 21:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B8CC1C22B2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 19:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88751178369;
	Fri, 31 May 2024 19:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EraagKYz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A3B15625A
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 19:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717184714; cv=none; b=fZdLtkQ3J3k3FmGY+BglXIayGFo0gc+gBT/ge0ITBubUqIOmodyTD2Y86vZV7IAJzuftUKkpTA9jed+kK1yhmXjcZW7Kmi8jOE1uiPWSdqEfmIaCLWVVGDTqon78NrsSDY6F7NW5RWtIAARLFK4wH4isWvPH1xUupHs9xDfp3R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717184714; c=relaxed/simple;
	bh=q2vdq+xrn/yBkQC/+5e6XUJEECAkvzznWce0rAQSwx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qT/FPbhUwLevLmVl0fO3ZJd8MOHSJ+62z3ug5aYaP2x2FG9+Z0yykeXcCg49gjbOBTufA6QI6AcX/Wgctg35veKqEhgNnYZqES6QBd6ZLzkaCaPzgv6CrQAkbAXSuETDeKqsSgMDR5YZrTOnm1tvtMLys3xZBapf7lxRjsWa6Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EraagKYz; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b82d57963so2025965e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 12:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717184710; x=1717789510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A11vsUli/DmN5lqzHDZQ4RXR2rDo8e190xdHexvyrmc=;
        b=EraagKYzwqJamR3uMor6o9e5gAGCBvh3/Oz4FYmqI0CKoNbnhB+1QNQDPvad/4Iogl
         VZpnHQFxIuz50llgbuzh3F55IOZxOnO1ubKJuHbNR56k9wseCAu1Kriv66FUKmyYjk9P
         GvYLPdb8j1SPZ2yGfTYrv3MaE3gb735OqMtLCrhDuJp5EGMpLQakF98BTSa6LYSYPSSf
         clRsp63aXBAr34HeN31LHV5+PMulUk1HwC8GKLDqICWIkZLl2LSehTlJbrwFxP8RO+C4
         K1ic2bXBSjdlj8tYVMiC7Ry0VnZBjS9CIkDdZk38SC8sR5rrNTjm3SNRvSTujU+90ZGW
         x6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717184710; x=1717789510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A11vsUli/DmN5lqzHDZQ4RXR2rDo8e190xdHexvyrmc=;
        b=c/loxZ6Kk0YdUOl27qThpXthvKNcVjGXjqv09Sud04WBojAkH/n0b/txXaOjWUl575
         Rm11mscD6+kH+i5cJsIfIT22jpEzuE8x9LdpKGHspyPc9nfX+0gFc9euP8BlOFymPZRV
         +r+O9grK+CCln0/LyU4KKSkTP2QS0YDP7UK0saN4WWu90Fc6iwu0TWFcfPQU34uXBfjM
         ELEdJjfM5L6RmM9UuEN7NUV6i2tZvWUUcJKyuXdDe+T9Kt8qoJc+8PJPjo5YoY8IsE4/
         tgse+Ck+GjgZXyiw4JiC/9GS+6M6Q3G00jD5fJh+mIFfT5zKlyfgtSmdow1R3iHM40Kq
         GXwg==
X-Forwarded-Encrypted: i=1; AJvYcCU1GdQx26s8+hxf00YY5+j7ZjraZUNHt1ghf43hNHXvdHuu55YkL8arZET656JR8irinXIJZ8zeiVbxBN8ISy5QlwCsJjBUcT1C6rtYAQ==
X-Gm-Message-State: AOJu0YyKUhIQcSZ9YxyyzKrtSLsBBG2pYW7D2cEsc/ZYVOoHUUyFk4KV
	9xgLxwcYGEfNoF7r9I5BzKVBGNuFTlq7ros6SwCb3XhnejmzBlc++0NxQtrWz+w=
X-Google-Smtp-Source: AGHT+IEheBo27F4lk78f4S625ji98poF0LnY6huzs/8CXZpOwabBlWL1BBh+G2Q+E6Acl3rELSR6nQ==
X-Received: by 2002:a05:6512:3b25:b0:52a:d87f:60e3 with SMTP id 2adb3069b0e04-52b896f7eebmr2327096e87.57.1717184710290;
        Fri, 31 May 2024 12:45:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d760e1sm416833e87.153.2024.05.31.12.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 12:45:09 -0700 (PDT)
Date: Fri, 31 May 2024 22:45:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 05/13] drm/msm/dpu: move scaling limitations out of
 the hw_catalog
Message-ID: <fvvqa2ltfv5gnkvsfsionfphzlki43ayzahegwsudq7v7isfx6@iuok6zbwptxj>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-6-dmitry.baryshkov@linaro.org>
 <6a335026-77c1-a112-69af-a8d9d86d5528@quicinc.com>
 <CAA8EJpqKkTOkhrgJexw-D5TbgGYjBoUup3FHC80boR_cAUb2dA@mail.gmail.com>
 <9e0e22b0-965b-00b2-c837-904dd342e87f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e0e22b0-965b-00b2-c837-904dd342e87f@quicinc.com>

On Fri, May 31, 2024 at 12:20:24PM -0700, Abhinav Kumar wrote:
> 
> 
> On 5/31/2024 1:16 AM, Dmitry Baryshkov wrote:
> > On Fri, 31 May 2024 at 04:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> > > > Max upscale / downscale factors are constant between platforms. In
> > > > preparation to adding support for virtual planes and allocating SSPP
> > > > blocks on demand move max scaling factors out of the HW catalog and
> > > > handle them in the dpu_plane directly. If any of the scaling blocks gets
> > > > different limitations, this will have to be handled separately, after
> > > > the plane refactoring.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
> > > >    3 files changed, 13 insertions(+), 19 deletions(-)
> > > > 
> > > 
> > > <Snip>
> > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > index 70d6a8989e1a..6360052523b5 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -785,12 +785,15 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> > > >        return 0;
> > > >    }
> > > > 
> > > > +#define MAX_UPSCALE_RATIO    20
> > > > +#define MAX_DOWNSCALE_RATIO  4
> > > > +
> > > >    static int dpu_plane_atomic_check(struct drm_plane *plane,
> > > >                                  struct drm_atomic_state *state)
> > > >    {
> > > >        struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> > > >                                                                                 plane);
> > > > -     int ret = 0, min_scale;
> > > > +     int ret = 0, min_scale, max_scale;
> > > >        struct dpu_plane *pdpu = to_dpu_plane(plane);
> > > >        struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> > > >        u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
> > > > @@ -822,10 +825,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> > > >        pipe_hw_caps = pipe->sspp->cap;
> > > >        sblk = pipe->sspp->cap->sblk;
> > > > 
> > > > -     min_scale = FRAC_16_16(1, sblk->maxupscale);
> > > > +     if (sblk->scaler_blk.len) {
> > > > +             min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > > > +             max_scale = MAX_DOWNSCALE_RATIO << 16;
> > > > +     } else {
> > > > +             min_scale = 1 << 16;
> > > > +             max_scale = 1 << 16;
> > > 
> > > You can use DRM_PLANE_NO_SCALING instead.
> > 
> > Ack
> > 
> > > 
> > > > +     }
> > > > +
> > > >        ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> > > >                                                  min_scale,
> > > > -                                               sblk->maxdwnscale << 16,
> > > > +                                               max_scale,
> > > >                                                  true, true);
> > > 
> > > I am missing something here.
> > > 
> > > As per the documentation of this API, min and max are the scaling limits
> > > of both directions and not max_upscale and max_downscale.
> > > 
> > > **
> > > 837  * drm_atomic_helper_check_plane_state() - Check plane state for
> > > validity
> > > 838  * @plane_state: plane state to check
> > > 839  * @crtc_state: CRTC state to check
> > > 840  * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> > > 841  * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> > > 842  * @can_position: is it legal to position the plane such that it
> > > 
> > > 
> > > But this change is passing max_upscale and max_downscale as the min and
> > > max resp. Isnt that wrong?
> > 
> > First of all, please notice that I'm not changing the values that are
> > passed to the function. What was being passed beforehand gets passed
> > after this commit. I just moved it out of the catalog.
> > 
> 
> Ack.
> 
> > Second, if we take a look at drm_calc_scale(), we can see that it
> > calculates src / dst and checks that it is within the min_scale and
> > max_scale boundaries, just like documented.
> > In our case, the boundaries are (I'm omitting 16.16 math):
> > - upscale 20 times. dst = 20 * src, scale = src/dst = 1/20
> > - downscale 4 times. dst = 1/4 * src, scale = src/dst = 4
> > 
> > So, from the point of view of drm_calc_scale(), the min_scale is
> > 1/MAX_UPSCALE, max_scale = MAX_DOWNSCALE and the values the code is
> > passing are correct.
> > 
> 
> That part is fine. Agreed.
> 
> But I do think, that API is not correct if the scaling limits are different
> in the Horizontal Vs Vertical direction as today it assumes the limits are
> same in both.

Agree. But if we ever need to support different scaling limits, it would
be easy to extend the API.

> Anyway, thats outside the scope of this patch. So I am good
> for now.
> 
> > > 
> > > 
> > > >        if (ret) {
> > > >                DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
> > 
> > 
> > 

-- 
With best wishes
Dmitry

