Return-Path: <linux-arm-msm+bounces-18005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 083F98AB852
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 03:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AB101F21834
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 01:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629E77FD;
	Sat, 20 Apr 2024 01:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M+EMRzu9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D7B7F9
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 01:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713576389; cv=none; b=J+d4FHKkdwHlCak16bcfQ3UsiTdAxpkr/H1LE3qC8cj6DEOrgx1oEjNp3CR0g70nIuT3R98MZPqB20gmmZlrTwAQPuC7sgAM1a8qom8goGgktpB9FDTvGD/ozL9rwEDf/PddtFZihigfNHBoKMOrx3R+cYfXd6bbIhFwhtl1qtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713576389; c=relaxed/simple;
	bh=YujLvW74K3r5ReLI3gcVkI5Hz3XkQVYVfpgHo541Ot8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rF54hrP8PfNIJKU35VniCD0DVbDjqaaFztAkKk/DBuiCcM5CyubhVl6YKAVXyJaCdMZTuq0D6gU1lEPOuwl7OWZBpuNgY8cXII8RLrbZ4MhTGoTMTaYAWvsk7mPBYGwqD3hhbxkOrxAQquC+KDBaWe7+yUL1Y44b3PeENaLuedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M+EMRzu9; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d264d0e4so3458623e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 18:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713576385; x=1714181185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=82tFBgEdIxjnsfXiodhMe/pFfwk8UfoM7JglpDttIJo=;
        b=M+EMRzu9+t42bE584X5Q7d3bjRSoBtvxJ3C1T2XzhPUQBruvaAA1z03lOgc5pDMnwl
         ztzcIBJ7ilkSoDrM0vLwpWLeROwFGBGnhCgo1bQaboWdlRNt9FFNYqZE3a8U0k0zyd6L
         jvR+BK+4RfWY0QlnP/tdljqmg9CigCKJ7OaleiWlY3L+VOeyNNHTTvuah2Eoq7XFr+0w
         XM4dsCuaFD+/51A3ZvQ80pfJSJL4Vo5j0aPKxbJFnIhT4J2gvla6r2jmAyR7lYZcwIWI
         4YaeCbcm/d/fRUgnvtFZ6zQ9vmcXWKQylamtsIdsYEx23p3NfMvukmEcXzYdnXaXsakq
         Fatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713576385; x=1714181185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82tFBgEdIxjnsfXiodhMe/pFfwk8UfoM7JglpDttIJo=;
        b=W+UI+eyX3AwYobzwCQdB5xeSaz3sGS6lVCPGqm/k6s9K0/e9GlBTVatpH2iQCwzuAF
         HkrjgCfztDNcmMhb+cZWeWrMugp4NjE9+qPa7SnKudao+9wytaLNbHDQ9ssIDyiJzDeQ
         kYLRhn5/pBwUMz4aUJjkQwwm+gg9rWLy1Bg0OmN9E17dN2cOdgjDNEnpLUqHPhnVxhOW
         K1Am36+sRbOI6F7qzty0MMnNVcgxZ9C09VLQaZs9IsrXPg021zXEgXkSMMiZ5x3k3G+w
         s0MfrRrs3nSe5aMhWCep46F+vDNKhXgPhaNxG6x05MhJOsaHDrI4XD/UYj3Pr8FraJLc
         FoYA==
X-Forwarded-Encrypted: i=1; AJvYcCVrG8vijY2tp+RaQmK7VkPAkj0DA1f6BIpQ1FwuOMd79PIfsTWCtswmotmfRpPF8MXcLUYQ5zw2hIt+QMq3IzDo60I4a8So199lpT1MRQ==
X-Gm-Message-State: AOJu0Ywp910JgP8WbEP1jCzmAMAebmBdrhH8MoYah47HWLAWgnj0R7TA
	janWzYa2NAIuGCtmMBKuYvdo2UqtLAM0O9ARYhhEGTx3mWTIEqXA6Rg1dR/Ee54=
X-Google-Smtp-Source: AGHT+IGJrr07aHC/Cs7bDT/YFGzvwRXVO7yvc2tL4V11EO+OlyAP8FyUQmvwWb7usmWdo7JZH01J7Q==
X-Received: by 2002:a05:6512:2003:b0:515:8a20:71de with SMTP id a3-20020a056512200300b005158a2071demr1847450lfb.5.1713576385258;
        Fri, 19 Apr 2024 18:26:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id o13-20020ac24e8d000000b005178f5ad215sm954850lfr.122.2024.04.19.18.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 18:26:24 -0700 (PDT)
Date: Sat, 20 Apr 2024 04:26:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/msm/dpu: drop dpu_format_check_modified_format
Message-ID: <ccgx5mjsxf2asvadithitzl7shkboj6ipcg6onfawa5pskchgd@etighi5usone>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-1-d0fe6bf81bf1@linaro.org>
 <9c2f5f63-291c-c2b5-41a1-d2004055cf7a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c2f5f63-291c-c2b5-41a1-d2004055cf7a@quicinc.com>

On Fri, Apr 19, 2024 at 04:43:20PM -0700, Abhinav Kumar wrote:
> 
> 
> On 3/19/2024 6:21 AM, Dmitry Baryshkov wrote:
> > The msm_kms_funcs::check_modified_format() callback is not used by the
> > driver. Drop it completely.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 45 -----------------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 15 ----------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
> >   drivers/gpu/drm/msm/msm_kms.h               |  5 ----
> >   4 files changed, 66 deletions(-)
> > 
> 
> I think in this case, I am leaning towards completing the implementation
> rather than dropping it as usual.
> 
> It seems its easier to just add the support to call this like the attached
> patch?

Please don't attach patches to the email. It makes it impossible to
respond to them.

Anyway, what are we missing with the current codebase? Why wasn't the
callback / function used in the first place?

> 
> WDYT?
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > index e366ab134249..ff0df478c958 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > @@ -960,51 +960,6 @@ int dpu_format_populate_layout(
> >   	return ret;
> >   }
> > -int dpu_format_check_modified_format(
> > -		const struct msm_kms *kms,
> > -		const struct msm_format *msm_fmt,
> > -		const struct drm_mode_fb_cmd2 *cmd,
> > -		struct drm_gem_object **bos)
> > -{
> > -	const struct drm_format_info *info;
> > -	const struct dpu_format *fmt;
> > -	struct dpu_hw_fmt_layout layout;
> > -	uint32_t bos_total_size = 0;
> > -	int ret, i;
> > -
> > -	if (!msm_fmt || !cmd || !bos) {
> > -		DRM_ERROR("invalid arguments\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	fmt = to_dpu_format(msm_fmt);
> > -	info = drm_format_info(fmt->base.pixel_format);
> > -	if (!info)
> > -		return -EINVAL;
> > -
> > -	ret = dpu_format_get_plane_sizes(fmt, cmd->width, cmd->height,
> > -			&layout, cmd->pitches);
> > -	if (ret)
> > -		return ret;
> > -
> > -	for (i = 0; i < info->num_planes; i++) {
> > -		if (!bos[i]) {
> > -			DRM_ERROR("invalid handle for plane %d\n", i);
> > -			return -EINVAL;
> > -		}
> > -		if ((i == 0) || (bos[i] != bos[0]))
> > -			bos_total_size += bos[i]->size;
> > -	}
> > -
> > -	if (bos_total_size < layout.total_size) {
> > -		DRM_ERROR("buffers total size too small %u expected %u\n",
> > -				bos_total_size, layout.total_size);
> > -		return -EINVAL;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >   const struct dpu_format *dpu_get_dpu_format_ext(
> >   		const uint32_t format,
> >   		const uint64_t modifier)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> > index 84b8b3289f18..9442445f1a86 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> > @@ -54,21 +54,6 @@ const struct msm_format *dpu_get_msm_format(
> >   		const uint32_t format,
> >   		const uint64_t modifiers);
> > -/**
> > - * dpu_format_check_modified_format - validate format and buffers for
> > - *                   dpu non-standard, i.e. modified format
> > - * @kms:             kms driver
> > - * @msm_fmt:         pointer to the msm_fmt base pointer of an dpu_format
> > - * @cmd:             fb_cmd2 structure user request
> > - * @bos:             gem buffer object list
> > - *
> > - * Return: error code on failure, 0 on success
> > - */
> > -int dpu_format_check_modified_format(
> > -		const struct msm_kms *kms,
> > -		const struct msm_format *msm_fmt,
> > -		const struct drm_mode_fb_cmd2 *cmd,
> > -		struct drm_gem_object **bos);
> >   /**
> >    * dpu_format_populate_layout - populate the given format layout based on
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index a1f5d7c4ab91..7257ac4020d8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -969,7 +969,6 @@ static const struct msm_kms_funcs kms_funcs = {
> >   	.complete_commit = dpu_kms_complete_commit,
> >   	.enable_vblank   = dpu_kms_enable_vblank,
> >   	.disable_vblank  = dpu_kms_disable_vblank,
> > -	.check_modified_format = dpu_format_check_modified_format,
> >   	.get_format      = dpu_get_msm_format,
> >   	.destroy         = dpu_kms_destroy,
> >   	.snapshot        = dpu_kms_mdp_snapshot,
> > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> > index 0641f6111b93..b794ed918b56 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.h
> > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > @@ -96,11 +96,6 @@ struct msm_kms_funcs {
> >   	const struct msm_format *(*get_format)(struct msm_kms *kms,
> >   					const uint32_t format,
> >   					const uint64_t modifiers);
> > -	/* do format checking on format modified through fb_cmd2 modifiers */
> > -	int (*check_modified_format)(const struct msm_kms *kms,
> > -			const struct msm_format *msm_fmt,
> > -			const struct drm_mode_fb_cmd2 *cmd,
> > -			struct drm_gem_object **bos);
> >   	/* misc: */
> >   	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
> > 

-- 
With best wishes
Dmitry

