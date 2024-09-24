Return-Path: <linux-arm-msm+bounces-32374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58251984EEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1550E286271
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C18183CCD;
	Tue, 24 Sep 2024 23:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bz6YYEeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A38613CABC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 23:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727220163; cv=none; b=kFQk2AzwXL2bGt6iCfUYUaenom8L4f6SO6ydV0Pv0i4WH0v6qWHMJ2NGAYL8SviJKPPLPPBUs1w0TD+l+ISQVpnGN/2jnYQx76kc6Wj8NsR/eM2VNMpyvA64jCjYPa/dyecXD5ET1frJzIl26+72O1PtaxtMBnypF1ext7udlAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727220163; c=relaxed/simple;
	bh=Rm5zzynyu0nhUYV4z8AWzQAqaIXiaArbKI7l+OLP+Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxKtPPxxR2cOl+KIFtBwZOclNhQxcBmcamP9xC1pb5/DLDNGvIgiIuaq4cC3t831Z9BAN16/+7NNIQvBiekyxImK8KY0rztiZWEYeM7VT7d6nic7aSO0yK9FOpNeDOgKjxiCwAZgQNBKvYhCxU/Q5p0yWQ15Pmo6Q3PsZwLklqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bz6YYEeT; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f7528f4658so53513221fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727220159; x=1727824959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=itd5cTQ33/nX4ykMA3iVji0DuuZO3+1I1si5nysaoYc=;
        b=Bz6YYEeTH7jaIjrogSXv//JXQf1OUwPIGAp9AE/8uIukgUIym47icFHz/+6o7+6C8c
         Shfqnbl9E6c9Hc5MoALwbA4YSnQeZDbVCL9iHMCrYY/8gi3p+b0Ubwkt/MFhxWFupUiV
         vkkGSWRITuN1v0263D/lxKnlpPEwdv5pgWWNzJlKqBjPPDV1cMjtzWu8OtRC17pDWJ2p
         57rHvjXdw4lFXDXR4idHqKe2O7va69DoFCF5hpirg4DVhCegbfwk5va3MxCF/zahTowP
         GKWLjwYsS45pAdURUlxDPV6zjRMTEOcUjE0jjGeqprsmzi9dg54MSggANktqvNZz8rjI
         3x5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727220159; x=1727824959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itd5cTQ33/nX4ykMA3iVji0DuuZO3+1I1si5nysaoYc=;
        b=SmNpZYx0A+V/ZkjaheuaPj/B+OLxhSZlmsjv3R7lAnT++ovqhXih20osgnl2Z0+jpR
         FGrKqR+UXknsy5GggQhcVPZAlfCNu1IVuhEhRKOg7F/ooEcAT8r3CKYW12bRl1yWl6+c
         FzyPYsnOZpz0mhQz/4gHzfnr60pC0K8EkBQNvYjd7AZBVv1wNNbK3p/vqbZZNtqH3RiL
         IgYiJnwzd5kN5zhIb0p44VjGVJUEXa7Dl7rsZwtGtlMmlUv3CqDijalV58W8ASFLYa6M
         JABQpX4jc9yRhxJv9xTX7NIeJ28QkRhWIxJfwAgt4n+VhGGAMU3re80O4EFFTC1rx2h7
         t+9w==
X-Forwarded-Encrypted: i=1; AJvYcCW/D5BsioyRoDXqPyQzLOY8zSQwCZZJrifcxHWaPrlhbaajwQybLfvskmmFgu1P/SAF1VXM7zQ7DRMOHPH4@vger.kernel.org
X-Gm-Message-State: AOJu0YwVYXr1O0+fWmMt2nSV4yc0n1ARcB8f3CvTMzXQDgcMWT93v24P
	QK8qcTwbCwfMBu9kZIE9l6gZYdtrXvRZw8kxZnf6Q+UdOgR8WUAVuqHs+/PRXNY=
X-Google-Smtp-Source: AGHT+IGUwS1Z4OlJF26Y8ssPu+10vhyix5D5Y/mur0w28/I8yb/6S03A55wEXxdMPWIJIIunNvdh4g==
X-Received: by 2002:a2e:1311:0:b0:2ee:847f:9e9b with SMTP id 38308e7fff4ca-2f91ca4676amr3879631fa.28.1727220158811;
        Tue, 24 Sep 2024 16:22:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d28b4cc1sm3441271fa.129.2024.09.24.16.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:22:37 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:22:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 13/22] drm/msm/dpu: Add CWB to msm_display_topology
Message-ID: <so3sfdgwfc5zwm56w7b2zhru4nmkmwvppxtvbri5a44d2cg3fb@xdcfai3sbwwt>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-13-7849f900e863@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-13-7849f900e863@quicinc.com>

On Tue, Sep 24, 2024 at 03:59:29PM GMT, Jessica Zhang wrote:
> Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> to account for concurrent writeback
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  6 ++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
>  drivers/gpu/drm/msm/msm_drv.h            |  2 ++
>  3 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index d53e986eee54..a7850bf844db 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1176,6 +1176,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>  					    &crtc_state->adjusted_mode);
>  
> +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> +
>  	/*
>  	 * Datapath topology selection
>  	 *
> @@ -1189,9 +1191,9 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  	 * Add dspps to the reservation requirements if ctm is requested
>  	 */
>  
> -	if (topology.num_intf == 2)
> +	if (topology.num_intf == 2 && !topology.cwb_enabled)
>  		topology.num_lm = 2;
> -	else if (topology.num_dsc == 2)
> +	else if (topology.num_dsc == 2 && !topology.cwb_enabled)

Is it a temporal restriction or is it a hardware limitation? Can we use
two LMs with a single WB?

>  		topology.num_lm = 2;
>  	else if (dpu_kms->catalog->caps->has_3d_merge)
>  		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 96c80cf9f6ad..04df3056d75a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -371,8 +371,14 @@ static int _dpu_rm_reserve_ctls(
>  	int i = 0, j, num_ctls;
>  	bool needs_split_display;
>  
> -	/* each hw_intf needs its own hw_ctrl to program its control path */
> -	num_ctls = top->num_intf;
> +	/*
> +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> +	 * control path. Hardcode num_ctls to 1 if CWB is enabled
> +	 */
> +	if (top->cwb_enabled)
> +		num_ctls = 1;
> +	else
> +		num_ctls = top->num_intf;
>  
>  	needs_split_display = _dpu_rm_needs_split_display(top);
>  
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 0d3adf398bc1..8a2a3705f117 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2013 Red Hat
>   * Author: Rob Clark <robdclark@gmail.com>
> @@ -88,6 +89,7 @@ struct msm_display_topology {
>  	u32 num_dspp;
>  	u32 num_dsc;
>  	bool needs_cdm;
> +	bool cwb_enabled;
>  };
>  
>  /* Commit/Event thread specific structure */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

