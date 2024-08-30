Return-Path: <linux-arm-msm+bounces-30285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 281C19667E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D8AA1C232CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019131BA860;
	Fri, 30 Aug 2024 17:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U78Kf8DG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BE215C153
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 17:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725038583; cv=none; b=jcb7CzFmnu/TQEu9m3LgmAfRsnJrB1EjIW7hCJnEgbvNJ4yWfwoaHxaxCGMh4nKeJ3kszNv72xwKcnfmAw4nFVe6bVXLiPWCwXSASOm2urQmjgLI3uThFjTGIShQHpKuJ2qaok37JB46N6T1H2MwVYGc0wMxOWZ5b0VfXXK0bOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725038583; c=relaxed/simple;
	bh=h986NzrbMWhvvW4WSnBqgPTrcVQXHbhYX3UqTnuE7Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgvCJ5rR36nHQDgorSfhg7WZIZCVNIkeyQUh+P/s2ccSde6RO6aXaoDEbnpC+wsADCnWWrmNdrXwqdRJpjQBQExMEOYVLcZbwDaX+4NBH5O//JeT3pQjIcNfhTijCWtPHKHU88CNtmeeG+IzWDUtqNaK8tXEYB4Y0f5j1+fIyrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U78Kf8DG; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f50966c478so20825141fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 10:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725038580; x=1725643380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JonTUQCBs5ivMCokNBrIZmOlyFwwTNBGJMICc1ZLhJA=;
        b=U78Kf8DG++aRrsq6Gf+Cuvu/6PRKbuMfw1NudnidJNs1/Q9cEkmiNSSoGGZacK3YSi
         Ed4b/zvj/V7O4QZE68/HC4b8kTXBRp1V92ityCN9JZFUFcylcppLFPPWmf1NpVgvobNF
         d7IZH9aJz0P941c3NEMRQcmnoeqcoqgDmN1zsvvO9k16Q9FLUtWi3l/QApjyhiJQIo/Q
         fD04eaVxa+RxK8RZZZ1Tq35HhpEEergOF2yKUwviox820dX2SRzo/LlWuqo18LyIpTI2
         Pyl9KiGGKaT9yNshwsnOMQjG9EKfneSYfL1ByhSZGYmWLSwUa+2+qGjFsuAhqyBMXLO2
         1Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725038580; x=1725643380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JonTUQCBs5ivMCokNBrIZmOlyFwwTNBGJMICc1ZLhJA=;
        b=JjwAl9l16KhTCnizpuO6Y8oESvjRgmSpZaCQZVamlvajTrVt7qqU28mP4dIfFjlFZx
         MBraoulRMZyQzaUethqI9RDyOPBUoIVxYCWHg8iHighzo4aD8/+pVgZoXwooWl4NTs5z
         OXaMkkwZ4lKvDSx9CDjTA0mjEg1b7iDKcXJnfB8gz4r7FNl6VAri+yGmYQaVijN7+cPA
         e0QMDKICQB3wYV9qN7yWJjhIhr4gSKRYTrsxfZgk70/NNAFmHFYesDMrO0Gxc3oEIBlo
         p47Rb8cbnMWjxLycrW8ITH9z13onq3FP5QxBl0haLSXYENIt8PcJ40XbPkq3y0rDxQdl
         lTUg==
X-Forwarded-Encrypted: i=1; AJvYcCW/A4WOrc61j7IJmmb7r7exU8peOg3bO0k8KxPClgSzP5m1C+TATrdS5hYRIjQDRcPhPhuGC7j/+vv8U4bq@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIAKarGgtUSnC9Q+gdhQFPIZRHXSeXv96QP9P7pBZxhYhDg2L
	bJUaabTEgo1pohK15FO8lX1BlYO9SvWYOiCIRKT8GJe5azmbwZ9CKxGCJ4jeOoc=
X-Google-Smtp-Source: AGHT+IECxz/qb6Vkma2IUS75Cre/bsH2ReQknO4hqXXTWChfooNaf/Zhku94vdEvgJjNzUn4a2iYPw==
X-Received: by 2002:a2e:b8d1:0:b0:2f6:1d9e:adfa with SMTP id 38308e7fff4ca-2f61e056430mr21468051fa.19.1725038579557;
        Fri, 30 Aug 2024 10:22:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614f379b0sm7692581fa.55.2024.08.30.10.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 10:22:59 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:22:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 13/21] drm/msm/dpu: Require modeset if clone mode status
 changes
Message-ID: <at6ejhvsqu5r3zdmsd22vtwagyogdb33cazutkkz5xayxsyebn@zravwdqovgaf>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-13-502b16ae2ebb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-13-502b16ae2ebb@quicinc.com>

On Thu, Aug 29, 2024 at 01:48:34PM GMT, Jessica Zhang wrote:
> If the clone mode enabled status is changing, a modeset needs to happen
> so that the resources can be reassigned
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 1b0cc899e8c1..99eaaca405a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1306,6 +1306,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  	int rc = 0;
>  
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> +	bool clone_mode_requested = drm_crtc_in_clone_mode(crtc->state);

No, use old CRTC state from drm_atomic_state.

> +	bool clone_mode_enabled = drm_crtc_in_clone_mode(crtc_state);
>  
>  	/* there might be cases where encoder needs a modeset too */
>  	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> @@ -1313,6 +1315,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			crtc_state->mode_changed = true;
>  	}
>  
> +	if ((clone_mode_requested && !clone_mode_enabled) ||
> +			(!clone_mode_requested && clone_mode_enabled))

PLease align to opening bracket. Drop extra brackets.

> +		crtc_state->mode_changed = true;
> +
>  	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		rc = dpu_crtc_assign_resources(crtc, crtc_state);
>  		if (rc < 0)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

