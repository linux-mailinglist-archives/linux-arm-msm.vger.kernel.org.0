Return-Path: <linux-arm-msm+bounces-32367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14987984EBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D35D7282D7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5041865F7;
	Tue, 24 Sep 2024 23:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pqRIPJBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B492782488
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 23:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727219641; cv=none; b=IK2VQfPi3BSIbkiZGFN+iYwWNzAUWoNRpw47qLkEapN108YM5GFIPshkLz8sQKJ1dVx/EGdJJEnzTM5pP5mlb+whueBWjeuLyNvdBprfZzmoM/H5/BtxI162rfOCcmkkum7YCoigg2YBTLoY311p2+38szEKrGI6iiaOGvH04EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727219641; c=relaxed/simple;
	bh=kOJ1St69V16ar4OUSZNwdT+cEQOFnJWXLxKLHibhSmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r55j0Txe5emyagc1iEPbGVamdg6iqTwtEO4FnsjNnsJTNg7co3NfRVz2SFotNKzYVsHSP0ve1Gl+SxQNm1iVBrvEqlYnng4XZhX8dhx6BI6x0bMb9d3FPHTMUY6RrY/Jgowfq5lk2ZTdYLlRx6CvFOd5wLWgtguDZ0g1v7PloYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pqRIPJBU; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f759688444so51338981fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727219637; x=1727824437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tHM1WNclfP92QoOT8vEDVI0r+AEeBwG3aV5dAajpHLA=;
        b=pqRIPJBUd53qZyTTisdclC6+Ysqrp+/NU67ioWR2gvK18fP0liXVyg6I1CBiKwWuJo
         j8P9OJBCIGSMEW4bdc2FwQM4AZQMWFE/2/pzsEUNCDpHaz6m1sIZ1mQNhtaa3Lc7hi77
         EXgrpW0QkPiKFzrgGYYmWaOtpEMf7LpFHyvezTe4v4+ZiropFWLx3dBcxd9fTGAyOsla
         S4Wb5R/i7VK7Xo8F1J4YtET3+LRMUJ6bWgkN8tsiAmucurLPNUEzZEowIFd1MHatq9GK
         TXkuX8l2Odwa+C1V9N8Uzg8moLiy6SRNH80jzXaf/dXoV0uccgImse5hoEEWYjhDrhlM
         QkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727219637; x=1727824437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHM1WNclfP92QoOT8vEDVI0r+AEeBwG3aV5dAajpHLA=;
        b=b447TSoEqtVwK0+ahyh+MKiLLsDi7z2i5rgw7jSD9qp63JWLY0vqtblAELZzu58iLz
         MNQTWuLMg+6emuKl4t54DFjCam+eRvg2H09yT2ZwxgTrJXccywFNaB/WuljMe/PzbrUx
         hzwR0n/DHOH0nGX2JSP3eH7C8g7p/x+k2lq69p2Rd6ApRdgCIzN3YPQW01WiR7YYZUna
         0FUEc/GnoTkGyGOc2AT5w65vLl608PQEFOWdgaaT3sZRbxJ9IbeAJxe+HMhzPeRUoZe4
         rUsimdc9Gobp5Zk1h12XN1ciFgAO1TwnLxY/pA5+2nOQh4lvX9aI/geUxJajyYSnHEet
         c89g==
X-Forwarded-Encrypted: i=1; AJvYcCXYQl84woMSdCOPYsO9hq6TqimCmLxSLy/yJdcL4SjeJhV7IkWETKQGO0gKiFGswCY5sX+VxkRl4KJhgn5Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzkcNhJvhfA3hLKAyyZaqE1kzUllO4xSCTFhj6KqEpQxpP/+T0o
	PPhQ6WYrJUZH7EBJ4qI2/3OCarJL5BNYYUjvGMYbUOZ9LC1aVoJUgWAk7hWSsQg=
X-Google-Smtp-Source: AGHT+IEpjPEwakEsY3T0I8yD2AZ7yjkBOntEWLY/ypvLz7ZY0nBCAwDHHoRMk3Rati1gYbJqTsTSRw==
X-Received: by 2002:a05:651c:1548:b0:2f7:5519:710d with SMTP id 38308e7fff4ca-2f91ca429bfmr3663931fa.33.1727219636636;
        Tue, 24 Sep 2024 16:13:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d289b760sm3452701fa.104.2024.09.24.16.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:13:55 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:13:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 05/22] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <dv5iij6v76ieprfckdjo4yksrjrgqw73v2lh7u4xffpu7rdrf3@zgjcp3a2hlxo>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-5-7849f900e863@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-5-7849f900e863@quicinc.com>

On Tue, Sep 24, 2024 at 03:59:21PM GMT, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> All resource allocation is centered around the LMs. Then other blocks
> (except DSCs) are allocated basing on the LMs that was selected, and LM
> powers up the CRTC rather than the encoder.
> 
> Moreover if at some point the driver supports encoder cloning,
> allocating resources from the encoder will be incorrect, as all clones
> will have different encoder IDs, while LMs are to be shared by these
> encoders.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
>  3 files changed, 183 insertions(+), 123 deletions(-)
> 
> @@ -544,159 +542,117 @@ void dpu_encoder_helper_split_config(
>  	}
>  }
>  
> -bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
> +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
> +				 struct msm_display_topology *topology,
> +				 struct drm_atomic_state *state,
> +				 const struct drm_display_mode *adj_mode)
>  {
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	int i, intf_count = 0, num_dsc = 0;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	struct msm_display_info *disp_info;
> +	struct drm_framebuffer *fb;
> +	struct msm_drm_private *priv;
> +	int i;
>  
>  	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
>  		if (dpu_enc->phys_encs[i])
> -			intf_count++;
> +			topology->num_intf++;
>  
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
>  	if (dpu_enc->dsc)
> -		num_dsc = 2;
> +		topology->num_dsc += 2;
>  
> -	return (num_dsc > 0) && (num_dsc > intf_count);
> -}
> +	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> +	if (!connector)
> +		return;
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (!conn_state)
> +		return;
>  
> -struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> -{
> -	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	int index = dpu_enc->disp_info.h_tile_instance[0];
> +	disp_info = &dpu_enc->disp_info;
>  
> -	if (dpu_enc->disp_info.intf_type == INTF_DSI)
> -		return msm_dsi_get_dsc_config(priv->dsi[index]);
> +	priv = drm_enc->dev->dev_private;
>  
> -	return NULL;
> +	/*
> +	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> +	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> +	 * earlier.
> +	 */
> +	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
> +		fb = conn_state->writeback_job->fb;
> +
> +		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> +			topology->needs_cdm = true;
> +	} else if (disp_info->intf_type == INTF_DP) {
> +		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> +			topology->needs_cdm = true;
> +	}

Just to note, the needs_cdm is not enough once you introduce CWB
support. E.g. DP/YUV420 + WB/YUV case requires two CDM blocks (which we
don't have), but this doesn't get reflected in the topology.

>  }
>  
-- 
With best wishes
Dmitry

