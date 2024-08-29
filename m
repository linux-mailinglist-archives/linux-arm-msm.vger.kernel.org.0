Return-Path: <linux-arm-msm+bounces-29993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67C9642AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AB72286B74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8915191466;
	Thu, 29 Aug 2024 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPglk4+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37751190698
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929624; cv=none; b=lLk07o5nyea62A4Mj3JZfJXNYZONDG/3c9faBGeyV/Sp72wdZ0M6Jjaw0JLh2epXMXff2PAMDKtmo7ONnMabN+ZoNfhiNttRGJ1lqt9vf+fyOpVpGo+gunrVlG2dZEBzKSrgqX1h/Y02/5rGwjejq4wDf6HXfVDrdmdlrySoka8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929624; c=relaxed/simple;
	bh=wZvxKKGYSnnrJAe54yLhMalukjNH017TM2OAmexPsu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJTR5nl9iB8enty2vrq5nc87nCqtCCy6xoi4IbGnz8fu0S33fNeDNpV5pyGZoonBT05n+sRC2lVjZRrvHhNm3Sapzx21RbbjAjbDCovOiR/jxL/BcZ6/ESmhaB2+GGy84pnNEQmNwI6nloRPqcGrDmPkITcvydVn1Qf7JYzkP7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dPglk4+w; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e179c28f990so509126276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 04:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724929622; x=1725534422; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2FuiHRYmBII7CoQqq9xCL2kOtuNSnjrajQjxmPmHnZ8=;
        b=dPglk4+wXk0lmoOdkiPQG6+Uww4hiXVz66/G+XgJZhs6M8nsVRRfNyo7IqV9lrfZy4
         Mx4/+r02Ie99VSXafSGHjQvZpmCDZR2qsY9v/71uTiwG/VmXbDufUIIXbg1ZpWVgGQcD
         9ry2E1zPdJ8XqfADxUQnEf/qsq1rGEgqbd6V52KpMCfsw7tIXer98Hy59YACpWq7Fu/t
         dZVqKyvt2TNrJEQQ9HJVqr3ZqqAMw9tjXryZZcQvcpAYinzkebSWakoHUrXrlEY89SWL
         dKXpoiNKYrrRYRdmJ96u42jUYceCzTPPAZo/m0cclnO3HY7yYoQqCJCsFaYACkRHoegX
         gs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929622; x=1725534422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FuiHRYmBII7CoQqq9xCL2kOtuNSnjrajQjxmPmHnZ8=;
        b=bKDZluCh9LQicAnT8pDn/JWDzCqbxe8uADteq2ZE3W3hPn9gqMD8hkBWApaGUlZg04
         bXtwjfTeG/wF3wQXbJu93tP8YmPPqWjeHRUKdmK+FKfJCOhSmjobpwQcVvxSnrWNtiPb
         1t70XxM5u98HnYRo+OekKLpq+2lUIfwzA6pcuSsQ3QkFljD9VlAHD+2tIH2jFAL7t6SW
         +NMDcBZxawgQY9Mh24rLX1/SHRFrUrjJCpV0S4mHb9dSjt60J/SXjaKk2C7IcMqj9gBf
         xH4/ZqZGPE4XT6eLNZuFv1h/l3okZiCe7YlN03O0G4tjN+8pryBCHzNu8wPnt5KPRFD3
         8fhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPNjFIKZoASP8PrW+e45SU1WVWq1+MQRa1mP2rdi1G5HPoRya7KLnDHVKkGzj8bH2zpVc2QmYSrZ1csq5c@vger.kernel.org
X-Gm-Message-State: AOJu0YwHYT7ERVQ7n1OrZlLCSc7OIeK188Jkifr2Da/8gQMY+aLFjw/E
	pCrqhek2Xub5tR47tCmLdcxBphUNfxq4C1ShQKgbw69iXJaXqXNVyyH2Jib/e5Zuz96c6/cBsHs
	cjcj55jmD8Av0Fwbk/ZGQpTsJ0YjhgNEt4+L9BA==
X-Google-Smtp-Source: AGHT+IG6C72qHtyISBm3HKfToRlotpCAtyStHxCL0ejzZ1LSExVqFZtCpufpvVkCjEjUXY8Iy4niYfvncKhgcjxsk1k=
X-Received: by 2002:a25:a504:0:b0:e1a:6493:21e4 with SMTP id
 3f1490d57ef6-e1a6493239bmr928134276.44.1724929621911; Thu, 29 Aug 2024
 04:07:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-6-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-6-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:06:51 +0300
Message-ID: <CAA8EJppJUB=wmaU+Hnh1=46deh-_wgd2qKtS-MJRkowUr8bhPQ@mail.gmail.com>
Subject: Re: [PATCH 06/21] drm/msm/dpu: Add utility to get mixer number
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
>
> Add utility to get mixer number via CRTC handler
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h | 5 +++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7d0fff9472441..a27e39c525d1a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1306,6 +1306,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>         return 0;
>  }
>
> +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)
> +{
> +       struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> +
> +       return cstate->num_mixers;
> +}

Merge with the user

> +
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index b26d5fe40c721..701c35803633d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -301,5 +301,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>  }
>
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> +/**
> + * dpu_crtc_get_lm_num - Get mixer number in this CRTC pipeline
> + * @crtc: Pointer to drm crtc object
> + */

Move kerneldoc before the function implementation so that W=1 can check it.

> +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state);
>
>  #endif /* _DPU_CRTC_H_ */
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

