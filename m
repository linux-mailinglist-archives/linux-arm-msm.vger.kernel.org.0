Return-Path: <linux-arm-msm+bounces-50083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2DA4CF67
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 00:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E9883AC84D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 23:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0351F55E0;
	Mon,  3 Mar 2025 23:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aU3r7LMo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FCF23A9BA
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 23:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741045397; cv=none; b=l1+ggrEys1aR/GMY3uEH7WQJUxumIAUshxHtHBifdS4OfMmAUtSdIOkSWspGwTwwWgow4+6ljRc4wSC8REjc700fmiGOy5qg50hr8Gg2305WbUHmOdzQoYHzN44ZSs1NrteU+oLaLkJWvZqRJDVrh3+KGer17zwZDzy5gxBnaLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741045397; c=relaxed/simple;
	bh=/dMbpUd2EG9fiX3jjz7cjeqoQ1s2VzMXg8hc2KArzCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pedfab9j1V5/Buc51lKAbiFpLGdb3rkD7wihQ9vij5lQQ7VsQr8gFW/z73L5aqemy5sv+iNI+7NVyJkn6d5ZiojYIUHx83sAMd39JFPezAVfXf8TxvYllVtN+cUeX4Hm9262+OeCS2QkrcQK2qq+WCNKk+liscnW8H5E8GOBUog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aU3r7LMo; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so43495501fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 15:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741045393; x=1741650193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yfy39VluGQcEyItLjFB3XiPgmFo3CCnquxjFCjbOFIA=;
        b=aU3r7LMo2WlyCKKy0GZN1JBRjYGwJeYLFB6DKsNadS7s9RHqbgHzzs3R/XaxyUzO3k
         Fk4m+afoy7TIza05nL4YQbaXRH8AlLB+WqoM+AIqs+D5KyzCNQ2Qo8ZZUMl1s8OJyAPY
         MW7JV2mHf2Oao9JO6wdjXzhHs2hxMvQc2vmL/pWr+vM2sDe5AuUvq7fjEMHAwYIBUPeC
         4szRKAUakmQ1HBo1Gdq2Nxdwaa+gm1E2ewa3jeP7J22aR5s3Q0pt3mQmO8hnxakJBN4o
         kKUVT8g5V8te4g9eI3zNMPaNBFkkyDUCH1nU7iWkazpivylXw5erYC4Jh3jRVdp+vgxw
         qD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741045393; x=1741650193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yfy39VluGQcEyItLjFB3XiPgmFo3CCnquxjFCjbOFIA=;
        b=CeK/yYscYnDjvthzDS/EhwN0t0mgnW2eh95mEcnjxhLbZS1dXFsmJBp/N+WCWuC5zd
         jH2xri7h3bROeJR1xTaLCPPWvlOB17XVS00mjAuWY687RRO5N3iorqwY2j4iX4z0WfUB
         ndf9RzyQgSixyerMXTK/j6BOFaWp2uuwd4T2YDvfqvOlYVqMMlIHWdMsr85wnHRAuU/S
         1kLCGQrFZhXCxoiZy/y0YfUn4w/GCdNuSW61D4qEaBc5d0y20M59TQTULzEilCTLXDKX
         p2HeSBYFgyceZXaBx1pmap1VN2uhbcLlefKHBV5q/2CxFr256wuExc9HBNGy8ilJH2W5
         ZFjg==
X-Forwarded-Encrypted: i=1; AJvYcCWslNExGmc2ePjywLlyKPVONencNsLFyd27UHeXoevQtNfkcNlA7iixhbjS2UbmIhzpNe8OYeeTp6arffuL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx0RPFNA9DIMT9ZSxNiSQRuZe/ffOcVfyBWJGlOQoiUpRPH9gn
	oIYEX8GLYR9ELjwD2oNjqjUWTdNlWQWyN4nlJrgmOjejHQ9e0oCU3V4lID6N2fs=
X-Gm-Gg: ASbGncuanSyek8/YmJeIY1aca5FrwudjrMmc7ZNEORypV1T0Y0lQGnF5fjvZEWw1qfK
	PMt6kq5Afjb87WU1TD4PfcdnUlcabVKKz508SKQhzk+UOF/sFwoAWwnbVsd4Fdjo20Njn5bRv6o
	jJQK9MB/rTLKFY8DUdfp2mi4xYjV5Y5Uk4NG1osF89JhPH7NBkjQPM4UcYCpL2dhT5Bb2sb9MWS
	7mzI1/f6BWBcHcI8G9IziC9y5Q6vYc3zXRYmBKlfG2dl9IcyNYX5I3NnUgYoSIyVaqQgndxbwmQ
	/FcsUUghVh1ooM1uS13Mf0AzylqjxYFApxxT2vWD/ExO0EZDEYLtQKxROV2NGNy/6ffQLUSH2e3
	0TieTfEDj/m8lPe85GoOGT5ka
X-Google-Smtp-Source: AGHT+IHS43FrPoYrbI5lM/r4eVcPkidPny7B+4+NzFlSF1VJA+JMi5IVAexs7xXUBzw/FSOsOiL98Q==
X-Received: by 2002:a05:6512:1085:b0:545:1d96:d702 with SMTP id 2adb3069b0e04-5494c38c05dmr6560457e87.48.1741045393007;
        Mon, 03 Mar 2025 15:43:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495f4c36d1sm667879e87.52.2025.03.03.15.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 15:43:12 -0800 (PST)
Date: Tue, 4 Mar 2025 01:43:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v6 03/14] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Message-ID: <da6e2hygdv6ewdr5hqeks2ocsxwvfvozby4b53unk5ckyqvu7t@wh3y4jnucapl>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
 <20250214-concurrent-wb-v6-3-a44c293cf422@quicinc.com>
 <se4b4kzp3vej4b6albecdc2t65ueiuba4kidutwvrv2rcfyjwr@e62fn225jwcr>
 <8c727bd6-94f1-4ee3-9bf3-793899038895@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c727bd6-94f1-4ee3-9bf3-793899038895@quicinc.com>

On Mon, Mar 03, 2025 at 10:45:19AM -0800, Jessica Zhang wrote:
> 
> 
> On 2/27/2025 7:07 AM, Dmitry Baryshkov wrote:
> > On Fri, Feb 14, 2025 at 04:14:26PM -0800, Jessica Zhang wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > Up to now the driver has been using encoder to allocate hardware
> > > resources. Switch it to use CRTC id in preparation for the next step.
> > > 
> > > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > > Changes in v6:
> > > - Drop duplicate cstate initialization code and unnecessary memset
> > > Changes in v5:
> > > - Reordered to prevent breaking CI and upon partial application
> > > 
> > > Changes in v4 (due to rebase):
> > > - moved *_get_assigned_resources() changes for DSPP and LM from
> > >    encoder *_virt_atomic_mode_set() to *_assign_crtc_resources()
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  18 +--
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  10 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  12 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 189 ++++++++++++++--------------
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   7 +-
> > >   5 files changed, 110 insertions(+), 126 deletions(-)
> > 
> > This commit breaks several tests in CI:
> > - sc7180-trogdor-kingoftown:
> >    - kms_cursor_crc@cursor-dpms
> >    - kms_pipe_crc_basic@disable-crc-after-crtc
> > - sc7180-trogdor-lazor-limozeen
> >    - kms_cursor_crc@cursor-dpms
> >    - kms_pipe_crc_basic@disable-crc-after-crtc
> 
> Hey Dmitry,
> 
> Thanks for catching this. Looks like this was exposed due to a recent IGT
> uprev that included  dc2d7fb4f978 ("lib/igt_kms: move setting
> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback").
> 
> The issue itself is that when DPMS is toggled, it is possible for RM to
> reserve new HW resources but skip the atomic_enable() due to the checks here
> [1]. This means that the change in HW block reservation won't be propagated
> to encoder if DPMS is set to off.

Could you possibly clarify this. What is the state change that causes
the issue (describe CRTC / connectors / encoders and active / enabled
state). Why does the issue manifest only after switching to the CRTC id
for resource allocation (the tests run successfully before this patch,
i.e. with the resource allocation being moved to CRTC, but using the
encoder ID for allocation).

Note, the CRTC won't re-allocate resources if
drm_atomic_crtc_needs_modeset() is not true. So I'm not sure how can we
end up in a situation when the resources are reallocated _and_ we need
to raise the mode_changed flag.

> I've posted a fix for this here [2].
> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/gpu/drm/drm_atomic_helper.c#L1502
> [2] https://patchwork.freedesktop.org/series/145735/
> 
> > 
> > Corresponding pipeline is available at [1]
> > 
> > As I had to rebase your changes on top of msm-next, corresponding tree
> > is available at [2]. It might be possible that the regression is
> > introduced by my rebase.
> > 
> > [1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1374165
> > 
> > [2] https://gitlab.freedesktop.org/lumag/msm/-/commits/msm-next-lumag-cwb
> > 
> > -- 
> > With best wishes
> > Dmitry
> 

-- 
With best wishes
Dmitry

