Return-Path: <linux-arm-msm+bounces-42897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B429F8BB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CE5E16AFC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 05:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2D913B298;
	Fri, 20 Dec 2024 05:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pnMsMTHH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95185139D19
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 05:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734670993; cv=none; b=kZ6vxKPaz9VAa3wgN6QWPTfe1mntsZsHcmAcbLF9YSl7uIOMzF4cXCcmkqeih87ERZExyEoW1sREbBBjn9TCCghX9y0UKvwNfeYuk4n8mJG5wRuFCCoJg5Zz9UY7w8jU57MX3eKZHOdL5DlSU6gcfXL6Sy1xiGkDktD9yA7oWCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734670993; c=relaxed/simple;
	bh=Cw9AaN2J5lteSxQP1UxXUeutx56WtHVglOuMme/ltHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atpHvat+TyNL0klJb42qucSK78Ptm5r3N6rzWE9eXMbc/PUBy+4XUIQS+owD2cpS+/1GlMjd00Ey3JSr50rTGjlLHnYDpBff2DqD3GwMPHfqtTpPmSHNiRCSf5meLvpLZY+HsGUiFYC6x0xWV89tkQdiPWNrhJeXgQEMT/1GkWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pnMsMTHH; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so18230291fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734670990; x=1735275790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m702/HGl5sKTUjvEqn+7bLtl2eVmqJKkLeGGTpjyQLw=;
        b=pnMsMTHHw7BszmWGy6N2b2iTEwWMzcMIq6Ry+EzWtIBjo64C1pnlmllsa4p/F/JW1g
         RnO1nEvVOf7AeWVdRJgg8SMoi1Q3hEvINBU1XMEj+W1LaDD73x2RB/CDx1g1EsixoIMR
         s+9619Yeme4YaIrrTG5ubhhFsRT3Oe2vjZjWYd6D9tZxaEeHwcFbj9h7OjKVPhLTJra0
         NT+G6vG0WGc/+JV3C2Ux+O9OcinavHqLaFlBoG/yTX9vVOwkGBQVm6YnitI8BauPziaG
         sJaubAGJv8Luc1WfYDtceYHkOalX1sOiiFbVBbzleoeQpWTjLwlRUEtmBhKpwTHwf27y
         bOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734670990; x=1735275790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m702/HGl5sKTUjvEqn+7bLtl2eVmqJKkLeGGTpjyQLw=;
        b=smQEI6QQ08CwvbLN0eymBlV2GWR3kkYkkJJI4lZ/laLQgwszdgUj4X+jEZEoJIrLmS
         g29FYVnKSXq549+nRV8S4PyibPkhqom1CEohUFBtrjRXANMH42fJH5QBZJLE8UXBmGmF
         oJ3QSgsKpLqxHMQkSXk7FjZex12gT2Imzir/jgBzOC1r02HM5JVyNEorTS2TwQNjMPts
         bTlkNAC2ujdu0nuJn0xdJQdD9LB/FOXM2E2Q/Hgi/Jh6VRqT0icYsQXKMkapPmDDy9XJ
         ImAaNTkQLSjbzPFyH7zu4rqYrpzcCh6Sz1dZtS35ZmAeSc4fGf6HoXaa+jBCLDkJO8Z5
         pfmA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ1XVYkm6gM+wHJLFg1EwhEHCwfrG8y2wBfZlzi1PMfvUxIezkc87ma7eVct2MEu/GSjTMx6ZbnPYVmsPH@vger.kernel.org
X-Gm-Message-State: AOJu0YxlP0cHPDQqFY1+nYPn4pzqqbhDeembpSkHVpHIIiA2VIlIVILw
	PR9jrfKS9jAxq8v9pNTHzAMmgRL2U6n6DGdDrY5SUZXkJJ+v+KxnDKkiq0Z2Tks=
X-Gm-Gg: ASbGnctt+LPkKjQbhgQsale6J6zbBo3Q/S4EtxT8/Uy2RHc15jXA7pWYk3D15glWIcJ
	v6YRAXk6YgoZKK0N4JRJgtjqqNPH/yQKQ3ZsowXtDZNJb958WcaUqr441edtIBoQFAgc7II6h8V
	CmZL+N/9PQcdSq6AOG3NOp7R1DHrFDF+wyfw7ZyEY7QiOJutlu9gEzXz/5VuPrTCaFJC6gNb3jp
	GHc3JOYTEEIsO/eivAe0omZHsCvV43OvhcQ1GotCVG22mi/uK7PxQc163nPM7m8reD8HM9Jm3WI
	j+lATETlVqwZGU/Q5RMbrBJWqKPuTtQisxIA
X-Google-Smtp-Source: AGHT+IE7AMACdhYOmI1DWAlHJNG3mIkrNXzU71mUgxUjugwDV+QiqhXSa9rYSZx7k0oSHhKzOfItNw==
X-Received: by 2002:a05:651c:549:b0:300:1f2d:97a with SMTP id 38308e7fff4ca-30468556d69mr4794531fa.16.1734670989582;
        Thu, 19 Dec 2024 21:03:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adac5bbsm4333921fa.53.2024.12.19.21.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 21:03:08 -0800 (PST)
Date: Fri, 20 Dec 2024 07:03:06 +0200
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
Subject: Re: [PATCH v4 15/25] drm/msm/dpu: Add CWB to msm_display_topology
Message-ID: <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>

On Mon, Dec 16, 2024 at 04:43:26PM -0800, Jessica Zhang wrote:
> Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> to account for concurrent writeback

Why?

> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
>  3 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b4bfded3d53025853cee112ca598533ece290318..b063c8fe4c0594772d84401fa56c9c21afc0ad18 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1198,6 +1198,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>  					    &crtc_state->adjusted_mode);
>  
> +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> +
>  	/*
>  	 * Datapath topology selection
>  	 *
> @@ -1209,9 +1211,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>  	 *
>  	 * Add dspps to the reservation requirements if ctm is requested
> +	 *
> +	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
> +	 * enabled. This is because in cases where CWB is enabled, num_intf will
> +	 * count both the WB and real-time phys encoders.
> +	 *
> +	 * For non-DSC CWB usecases, have the num_lm be decided by the
> +	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
>  	 */
>  
> -	if (topology.num_intf == 2)
> +	if (topology.num_intf == 2 && !topology.cwb_enabled)
>  		topology.num_lm = 2;
>  	else if (topology.num_dsc == 2)
>  		topology.num_lm = 2;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8..85adaf256b2c705d2d7df378b6ffc0e578f52bc3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -382,8 +382,14 @@ static int _dpu_rm_reserve_ctls(
>  	int i = 0, j, num_ctls;
>  	bool needs_split_display;
>  
> -	/* each hw_intf needs its own hw_ctrl to program its control path */
> -	num_ctls = top->num_intf;
> +	/*
> +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> +	 * control path. Hardcode num_ctls to 1 if CWB is enabled
> +	 */

Why?

> +	if (top->cwb_enabled)
> +		num_ctls = 1;
> +	else
> +		num_ctls = top->num_intf;
>  
>  	needs_split_display = _dpu_rm_needs_split_display(top);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index b061dfdab52e04ab7d777e912a30173273cb3db7..12db21a2403ec6930894c36a58e898c5d94c2568 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -46,6 +46,7 @@ struct dpu_rm {
>   * @num_dspp:     number of dspp blocks used
>   * @num_dsc:      number of Display Stream Compression (DSC) blocks used
>   * @needs_cdm:    indicates whether cdm block is needed for this display topology
> + * @cwb_enabled:  indicates whether CWB is enabled for this display topology
>   */
>  struct msm_display_topology {
>  	u32 num_lm;
> @@ -53,6 +54,7 @@ struct msm_display_topology {
>  	u32 num_dspp;
>  	u32 num_dsc;
>  	bool needs_cdm;
> +	bool cwb_enabled;
>  };
>  
>  int dpu_rm_init(struct drm_device *dev,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

