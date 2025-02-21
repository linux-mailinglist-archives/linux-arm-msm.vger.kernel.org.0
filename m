Return-Path: <linux-arm-msm+bounces-48964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943B6A3FBE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 689048658CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4145C20CCF5;
	Fri, 21 Feb 2025 16:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ENeSBtOi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58699215050
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155782; cv=none; b=fU6ZWx7mHyrHNr2wc3jIAWPLWw95CYT31SGIYkNU23/rBxodBWJLHwo06i0msbwskf8aAJ+Ktlpfrkgfdd1asM7zm/kbs5adT7DjoT/FgDXmOS+I5yJ0+O3zTeXc04IrMvjqWIIErRSgB6LXFi02MeSBp0S82S1wmtfmXedWV6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155782; c=relaxed/simple;
	bh=PNSjA21YyMY5b4mfcA7P0wgvMvVvhz9wuyfsaZhxbP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/jOfc2h3jgWYdzxzbCtBJGNwfUhW4CPeMhftg34xjaPgVP5oXg3/RMxyLaxylhxpyd3hTppsZHssAMzinmNHAkAAaU3rTrTuazuzKyjo5SOJ5HOM1mFpFWIU0WpsTzKydd9hYcgPdjs3yxBncV7uo1+a+jYjE4+1rjbZ3AU1i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ENeSBtOi; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5461cb12e39so2163594e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740155778; x=1740760578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bPds9oAtueHibvIS0BHa1Q9Tu3GfdsskW31+FCbd/E0=;
        b=ENeSBtOiaSYf8PniUEfCWiRJvvf4oP6xLt2v/An5pbvFKJpX4joDZYUE949Aa28c7A
         IxiGAZeLdvvLRU8+YtnIpoa3t5uqTWcM1qekLP4bG7G5e1rItyKsRietG5Z5rdjfqI2b
         XDwkO7yMlGvUO5dV4gPRFQxChIXXN8aOkUk2oIFauSSrb2yAXpsMvRW9f9Voqp1faKHa
         6A+H0GRZiAZS1NtP877axIVvKlsfDHnCPO4DJz/diml4ekIAxiRVeCQIw+njMHrWmUIr
         BsGiEGGSYjTY+nUgpm8qZmhwuvKcNdessIXRUO5mIh9HoUuxdvuV0QnvSm71lm/XQbzb
         rkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155778; x=1740760578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPds9oAtueHibvIS0BHa1Q9Tu3GfdsskW31+FCbd/E0=;
        b=h0wvKRlNcfr+30aIsaMR+yR+UHh+fS0U10PsfhctDMOlV7OC7vQ5apJyDejKxxF0Kh
         GjRgmLKMQPbW/sqZD4fcmoLb6c9xzjGtwI3dFGJ2gTEO3voagXkaR7GJ5aoD7Uqnj7td
         mBXRhsRkkvGEJOvDPDHuMpMh2emnG/Yq9Rsq7+U/EsAMveftaKSwZZPUdH7Gl2PNVNs+
         oHoXEvOLvtyvMFAVjeZSLbNOpz3xGT3KF2+MmArEhVx9zRCs/wSMKPlJGRH81va3jbnm
         KiGBsMBhOMilAicF25qznhlNlnOMOMMhxIApnXz0fTjYZZvprnc4JbtdZOequpVWm689
         uuKg==
X-Forwarded-Encrypted: i=1; AJvYcCUFB4/M3TrsuB8+iCjWzLkJzvf5EwRa/D9Z9Wkl1ld++NCrePj6N3uqkrwRLFzZ4wU9avDLIMUv2CHapkM0@vger.kernel.org
X-Gm-Message-State: AOJu0YxLpcTF87uYZspmrE3actj2NpL2nM4iB19HW/lZKnre66yqdP47
	3h3qxdjHVsOe2EJp7vQQf5Y6+j89MJv4X4yi5UVtCOJVXVSRr2heUSYrudReJJs=
X-Gm-Gg: ASbGncsfjXqvORD+qPencloflWeQ1q+ZbYUOujh+DVwXj8txK8sx3z9/sG6+FZ2YP50
	NKnW8GrvvdO1NolN+TMR4R42ZTPLj8jqaeuOGEgBbeklfJLqDVVqN+0IOel3LPYSy+mB8RRYDTC
	gOLNqZyW22Jp8OAS8+kJepXugFQ+E3vNxmLhC1Ee7JpPwmKS8c3z+QQzcM4kENDj3nFIEBBlWCq
	lEmJI5m2W7lKeLw4crLDzD2vCSvbAn7ilx2tKnbYJFJqi3mKDN5xEpmmwLbDoXKf6QiFKq9xvSO
	OtJkXkySUeof5tmhJ0kfcj4vZYqRxRw4p/8If3DxnijVfrsjhyX2guXY6VPypHCMjxuU4LI1Joj
	o7YqfiQ==
X-Google-Smtp-Source: AGHT+IG5OE0xMdR23O2TUN2vTwu+eGSplv/MmFU+Pt5AentUHO2eMzUBhfbNGyJXT3btW78Y1ZdZVw==
X-Received: by 2002:a05:6512:104e:b0:545:2e5d:f3f3 with SMTP id 2adb3069b0e04-54838f5b0bcmr1640970e87.46.1740155777708;
        Fri, 21 Feb 2025 08:36:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545637f0e14sm1961903e87.86.2025.02.21.08.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:36:16 -0800 (PST)
Date: Fri, 21 Feb 2025 18:36:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <khmeegjx5jmu4c32un3gqu7sumkbtdkg6cawwwmwtmkp5gkrag@sklf5tr7qbwv>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-13-c11402574367@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-13-c11402574367@linaro.org>

On Mon, Feb 17, 2025 at 10:16:02PM +0800, Jun Nie wrote:
> Currently, SSPPs are assigned to a maximum of two pipes. However,
> quad-pipe usage scenarios require four pipes and involve configuring
> two stages. In quad-pipe case, the first two pipes share a set of
> mixer configurations and enable multi-rect mode when certain
> conditions are met. The same applies to the subsequent two pipes.
> 
> Assign SSPPs to the pipes in each stage using a unified method and
> to loop the stages accordingly.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 63 +++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 24 deletions(-)
> 
> +	for (stage_id = 0; stage_id < num_stages; stage_id++) {
> +		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
> +			pipe = &pstate->pipe[i];
> +			pipe_cfg = &pstate->pipe_cfg[i];
> +
> +			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
> +				break;
> +
> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
> +				return -ENODEV;
> +
> +			r_pipe = &pstate->pipe[i + 1];
> +			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
> +
> +			/*
> +			 * If current pipe is the first pipe in pipe pair, check
> +			 * multi-rect opportunity for the 2nd pipe in the pair.
> +			 * SSPP multi-rect mode cross mixer pairs is not supported.
> +			 */
> +			if ((i % PIPES_PER_STAGE == 0) &&

Please move r_pipe / r_pipe_cfg definition and assignment here. With
that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +			    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> +			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +							      pipe->sspp,
> +							      msm_framebuffer_format(plane_state->fb),
> +							      dpu_kms->catalog->caps->max_linewidth)) {
> +				i++;
> +			} else {
> +				/* multirect is not possible, use two SSPP blocks */
> +				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
> +						pipe->sspp->idx - SSPP_NONE, i);
> +			}
> +		}
>  	}
>  
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

