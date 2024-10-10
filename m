Return-Path: <linux-arm-msm+bounces-33859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B96C9986EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E88EA1F21655
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7FD1BD01A;
	Thu, 10 Oct 2024 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LFUqWwjo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195161BD008
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728565180; cv=none; b=GKX/mttClXSneLwft5Mix4YcakQumWQDufrUu83H/jIattEX4Py83Qj6Hpp8TMed91yi7SI1sHRGf+mZi5J+Vz5sJNl0VwKlBjcLO59TAMCfpiQJ9QGLE+HP7qTZ+9TYwKyGvqS1BbQ7DB4K7pv4DyJolkT7ih+A68UVG8uMs+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728565180; c=relaxed/simple;
	bh=asqQgaU/vZI87Aqh579laCnMIY18UekRX/yn+FO0GWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8RjsY3mh7dNgmyUrsqPe51qKCXGKo5+l1RDeuzlMAIjCElDQqpNU0o1jhkeXyzk3XhvwmsO8b8FSdl9BGlGS4CAbDvPoJM9jcB1Zw7KgzmCwjXJDD6++yHIzyEEko6ybyPpCnRPIYx4eA20AbvxKLxqZyFxemypbSZ7hOg3GJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LFUqWwjo; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fadb636abaso8015371fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 05:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728565177; x=1729169977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=36NOSeErwXpLnSIxfSSqwMj8Lcluu1V/I96m1cnaxMk=;
        b=LFUqWwjoS6Dh+fwV2RRzKI+Nzth040n56wbm1+IPeE8Pvgtpu5llvLiMdGQXQDKJds
         NXN/kuF99S2ni3NJYkn1cBYTa9Sql781sdOFkODLxU53jq4XVDfvYv7nKPQkfz4btfls
         nms86cWlnKakkCqUpzuYGUFfAf7SPTri/zdGFakM2gWXUuaNgJYsXmV558HE7fEiNKMS
         432Uy9I/z24UChPSGGIG9G/HxAIxM1OjgASgpQbeKd7nk4FW3ZzeLZ4hotpwRkYJNi2F
         eeV0eWFuOEylA1g+3f3zU9hHSAlayWJzR5lsb066Pq7zN4yJAj1dCVyHLQAiVlwo3VOw
         dQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565177; x=1729169977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36NOSeErwXpLnSIxfSSqwMj8Lcluu1V/I96m1cnaxMk=;
        b=vdmiUn7NWhkPBWO0kLAjzlj9LgQmymzJRnnKEbGhK/F7YYnMMnJoFsEyd+ov07V5yl
         Gjcodatz7QIOD4iQG/8S2oeFzuAoItZ4XzohchaUGRryGpVfynSmyod++U0IqRUygtxK
         SeeM953MJoo7zqdPfuXkc6teNtSlZWBvQkAN1cFgzE/eKUGWv6Ls4JJCDojHx9t6xZEm
         IsapWzsj/x0bd7eiyEq0EZzS2xK7MAced7CpW7fCyG+J27MM/Ku1d37W0JXlQL4NcsIw
         NHvqrh5NyVHS6+LVbeJmRhTPbxSX8pesOelyqw1JqXIAX6bzXf7nNiGSW5C9aWzQo6r+
         Njxw==
X-Forwarded-Encrypted: i=1; AJvYcCXfKJD+XWHM49g0q61+gd4NT7GWmGJLO4B7tLYtcBP6yoN47O5qJcc5cMESQpNAbz+3sitDE2ARpe+43MK4@vger.kernel.org
X-Gm-Message-State: AOJu0YyikxeByzU5WvTWKJjBNdlKELShFE81SbPpCvzeOgMffvfqyob3
	t0L1yq3WAf/ODTowCfVtINGe4EYxGASxOkDYHZmo5lrOzXbioA1/Uv5KM6BLFZyqaIvR/Q56Pja
	CmY8=
X-Google-Smtp-Source: AGHT+IFY7BZoKpY4gXXDowPZQJ9kCDf3g7HVgd9T5+NX2HqZudxIwPOU8AAV3qqHVLmN94N+juBEmw==
X-Received: by 2002:a2e:a989:0:b0:2fa:cf5b:1ea7 with SMTP id 38308e7fff4ca-2fb1872993amr43592271fa.6.1728565177250;
        Thu, 10 Oct 2024 05:59:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2457972esm1978601fa.20.2024.10.10.05.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 05:59:35 -0700 (PDT)
Date: Thu, 10 Oct 2024 15:59:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/14] drm/msm/dpu: Support quad pipe with dual-DSI
Message-ID: <twqjthrjzagqhvednxk2plwynxjbxwusvx7a3745mjv5foelh2@fhzyipmelvnv>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>

On Wed, Oct 09, 2024 at 04:50:13PM GMT, Jun Nie wrote:
> 
> ---
> 2 or more SSPPs and dual-DSI interface are need for super wide DSI panel.
> And 4 DSC are prefered for power optimal in this case. This patch set
> extend number of pipes to 4 and revise related mixer blending logic
> to support quad pipe.  All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
> 
> The first pipe pair co-work with the first mixer pair to cover the left
> half of screen and 2nd pair of pipes and mixers are for the right half
> of screen. If a plane is only for the right half of screen, only one
> or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> assinged for invalid pipe.
> 
> For those panel that does not require quad-pipe, only 1 or 2 pipes in
> the 1st pipe pair will be used. There is no concept of right half of
> screen.
> 
> For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> the single SSPP and its multi-rect mode.
> 
> This patch set depends on virtual plane patch set v5 and flexible
> number of DSC patch set:
> https://patchwork.freedesktop.org/series/135456/
> 
> Changes in v2:
> - Revise the patch sequence with changing to 2 pipes topology first. Then
>   prepare for quad-pipe setup, then enable quad-pipe at last.

Is this the only change? Doesn't seem so. Please don't make it harder
than it should be.

> - Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> 
> ---
> Jun Nie (14):
>       drm/msm/dpu: polish log for resource allocation
>       drm/msm/dpu: decide right side per last bit
>       drm/msm/dpu: fix mixer number counter on allocation
>       drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
>       drm/msm/dpu: handle pipes as array
>       drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
>       drm/msm/dpu: bind correct pingpong for quad pipe
>       drm/msm/dpu: update mixer number info earlier
>       drm/msm/dpu: blend pipes per mixer pairs config
>       drm/msm/dpu: Support quad-pipe in SSPP checking
>       drm/msm/dpu: Share SSPP info for multi-rect case
>       drm/msm/dpu: support plane splitting in quad-pipe case
>       drm/msm/dpu: support SSPP assignment for quad-pipe case
>       drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  74 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  69 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c       |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h       |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 408 +++++++++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 210 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  19 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
>  15 files changed, 478 insertions(+), 364 deletions(-)
> ---
> base-commit: eac5b436019c2eeb005f7bdf3ca29d5e8f443d67
> change-id: 20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-1142507692ba
> 
> Best regards,
> -- 
> Jun Nie <jun.nie@linaro.org>
> 

-- 
With best wishes
Dmitry

