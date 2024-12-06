Return-Path: <linux-arm-msm+bounces-40736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F357D9E6A02
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3BDE169AE4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4469A1E131B;
	Fri,  6 Dec 2024 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CdiKmgl8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9A91DC74A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477159; cv=none; b=bSF1LYnCDqhKuam4EKLW6UroS/mU5lopES+zbQLkt0sR7rjT1EudFueBSHxOUL3G5L9O582/kYrWI/dMdwuJ9EHKcmCp2iiHJpEjUbN7HSPA2Q0Nz6fpWSNlEU7T/DGGOcHNRQEi3rvBf2VFPlUxPkzdns1g3R6ZZPhcwHx9S58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477159; c=relaxed/simple;
	bh=DnHGjRWsKYTW4FcAmnRONMUxDw+YrQbtkfuiDDTOiF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlu826f0ado99swd38FTjt/vpFII1HUBUIqotTqmpIUHL+5krx5XRBMG33BhJcSLQ6cUK2vBzVCKD9dACJijCj7QEchlmcadx6HgRL40TVLM0bosi+dblkilZfg0DhgWVmolGM9tnyAhMe/cr6ShpF3RXTNKKeMhqPKrf7StG50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CdiKmgl8; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3001d009633so16940471fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 01:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733477155; x=1734081955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OoUr7wn0ZUiIfTkQsgOoOd0m6IiBq8HA9tyXLM1N7tU=;
        b=CdiKmgl83FzB28bnoyLrX4H7xmFTwSuRNE9vj80TLCgv0Yq2i27QqoWSCevZubT8L4
         YeXhHO8/e2xe3h23AvCaB5xhKrfnHEjlmNH8/9WfA0M3NANqjH1DkDxEvQIjznAohfH9
         dZSmz6NYEXp24pcGMN0ebsvIkO+hNjbtdYYnQzpNYZrkCV18fMZEsfIe9DNuKZBuA48y
         gn2uc8Fn7YXjULG6HpLkI5aOM/cGncxfb0MymIU9n04qhjEyaNN0hX8oqYwXwAGxpn2S
         e3r+pq1uurXxOJSk+QmCbVlaFu+BSkUPT/IAV6EXgsUO7qIuhz8bHyXPaqS8RH4rJMGZ
         pI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733477155; x=1734081955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoUr7wn0ZUiIfTkQsgOoOd0m6IiBq8HA9tyXLM1N7tU=;
        b=Mfmi8CbiUWxV/eDuf3CAH/5WkZhaEWGMtFNiPMOqbV7SWgq341ctrxd8KGrReENJRi
         pO94yV3/8HIAg7/3DkoCaCJdtaJeUCM2YQLnHCQctlvWIcL9HvzAN6LkCUHqxlf8pdGe
         n6IznizwXmRZYDvkFsRs+3k8ON+Ga/wZiF5HKg7SE4NsdWmYqrr1QhyP41u9YoqjkJfn
         3RusbnmOCwO7mo1liYRiIDEF+YMEcZkrH8P0OkI7+EDkwZw5A6uWC7Jg0x/QwS7hN45r
         GQhgDlpS4Y7aOk0qfepitc9AiA6gZJBlC4p8qXLgcylWQEsiWftL+wpnA+XW3qzZ+ZnD
         Mv/w==
X-Forwarded-Encrypted: i=1; AJvYcCXKcVOe8aFNXAuDTgptYjZeH4tsmNijXP2IzFsnbrZjxwgYHXjykb3eX6SLSDrGYVLvFNQcEV2a9DYEL1om@vger.kernel.org
X-Gm-Message-State: AOJu0YyaZGrvG6eCXRmJg7zYRYA+OkS5aQ7UWItyzfHxtE7SIC2nqtdM
	ug0Praa2jPubEN3HqV7iqx01k73PbCmSZxSYtc8Oztog64o3E/FWSgkH0NuzU/w=
X-Gm-Gg: ASbGncs7qkyyFIoV0G1u84GQpDNMZ5XulveqegjFCp8fcmfq/uScoSb8q/rJpdAzOs4
	uxaWbr1buuS/VWZAnTKCs2jc8AYsAHlpct671GlDw07zP+kmJlp6rsNzKh4Bewdbft5LQkAl8ep
	TniThNGj58VbQk+XVCG0R+sCpwsmilzwMJ6QcKZ/7MF79uhaPUrIjmGJ2uOYMw/TUl/94tvxXR9
	xJm2M2TyqAx+pYiwiO1NwGwTPCAAoPiqfHJPQzGbd8w7gIhRg7TW3Hs7mCmoVY7A8bky5iEXb15
	S1aCOH9u/Qc3xoMrBz8sNwaPxVCzCA==
X-Google-Smtp-Source: AGHT+IHEPjXcBrm7XkLeyj1S9Myc1Ilx1u8zaCsZKn1lMH6hzLdh64MAK0T3iqxzwepLT5rGpHD/Mw==
X-Received: by 2002:a05:651c:553:b0:2ff:d7e8:b712 with SMTP id 38308e7fff4ca-3002f8c88b6mr7541101fa.13.1733477155305;
        Fri, 06 Dec 2024 01:25:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020d85356sm4231801fa.15.2024.12.06.01.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:25:54 -0800 (PST)
Date: Fri, 6 Dec 2024 11:25:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 41/45] drm/msm/dpu: use msm_dp_get_mst_intf_id() to get
 the intf id
Message-ID: <tqxoqjrpi3smnjuipnog5idh4kjhld7jem7s637pdjhcoc4paf@75kcofgrxwdv>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-41-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-41-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:32:12PM -0800, Abhinav Kumar wrote:
> Use msm_dp_get_mst_intf_id() to get the intf id for the DP MST
> controller as the intf_id is unique for each MST stream of each
> DP controller.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..ce2f0fa8ebb1efd1a229a99543593965dbccd752 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2512,17 +2512,23 @@ static int dpu_encoder_virt_add_phys_encs(
>  
>  static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  				 struct dpu_kms *dpu_kms,
> -				 struct msm_display_info *disp_info)
> +				 struct msm_display_info *disp_info,
> +				 int drm_enc_mode)

No need to, use dpu_enc->base.encoder_type

>  {
>  	int ret = 0;
>  	int i = 0;
>  	struct dpu_enc_phys_init_params phys_params;
> +	unsigned int intf_id;
> +	struct msm_drm_private *priv;
> +	struct drm_encoder *drm_enc;
>  
>  	if (!dpu_enc) {
>  		DPU_ERROR("invalid arg(s), enc %d\n", dpu_enc != NULL);
>  		return -EINVAL;
>  	}
>  
> +	drm_enc = &dpu_enc->base;
> +	priv = drm_enc->dev->dev_private;
>  	dpu_enc->cur_master = NULL;
>  
>  	memset(&phys_params, 0, sizeof(phys_params));
> @@ -2559,9 +2565,18 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>  				i, controller_id, phys_params.split_role);
>  
> -		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
> -							   disp_info->intf_type,
> -							   controller_id);
> +		if (drm_enc_mode == DRM_MODE_ENCODER_DPMST) {
> +			intf_id = msm_dp_get_mst_intf_id(priv->dp[controller_id],
> +							 disp_info->stream_id);
> +			DPU_DEBUG("intf_id %d for disp_info->stream_id = %d\n", intf_id,
> +				  disp_info->stream_id);
> +			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_id);
> +
> +		} else {
> +			phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
> +								   disp_info->intf_type,
> +								   controller_id);
> +		}
>  
>  		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>  			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
> @@ -2662,7 +2677,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>  	mutex_init(&dpu_enc->enc_lock);
>  	mutex_init(&dpu_enc->rc_lock);
>  
> -	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
> +	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info, drm_enc_mode);
>  	if (ret) {
>  		DPU_ERROR("failed to setup encoder\n");
>  		return ERR_PTR(-ENOMEM);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

