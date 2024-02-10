Return-Path: <linux-arm-msm+bounces-10493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F36328503AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 947231F24273
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 09:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72042B9CF;
	Sat, 10 Feb 2024 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/zhEM16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F56224214
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707557848; cv=none; b=qPR2vDZTYfqWczznP7+43eiKZ/2jvOAk84YXVJf+9PKcuaIYD4leyG4F5FKJVBuEtAEm29YQcDpt35ZIITQn2+5JahGv79y//nzWjhi9y0vt6xx0vuk/WJtXgOrh9ztKvvxVQlnuLRfi+obpOEKPAyy4BXYp+27cRNpA4IbKUWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707557848; c=relaxed/simple;
	bh=u15nvREh5HwjCNGzeJakP0p0YvwF/7LS/cw9TweYQ4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKcFhAeeWJtl6mujrU+A+TGbdu7hv9eeamvP5O9g88MU5AFfbE5cGrvUQugiA1+2Tg6x2OBBMQIMAzRaB6FNl3cVBParxOxvHYD1kV4gt5aEfdKxGR783AYQGamHfDIEk589gvFPujZIcbRjGCYJZ+713PZh4imZFgwk3WmlFaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/zhEM16; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc745927098so1519805276.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 01:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707557846; x=1708162646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=traMzP3X3ap8UfhwxLc+Vo63DS4xV+/qhFdckzPcq8g=;
        b=F/zhEM16t8JyFMHvIv23ZTpXz+vJ87VjNkZspgxNqclHi570Oba6nbcczMymamotlu
         nR0p9oDkcgyJYxFRvAw4zw8b7BITKlTPsDYLseqCmJTJmxC5gx0H7MHW2G4pDs+u0hDh
         haCanH30sYHy5H1+/1AL2jBsdnseMmrhMOXcMVwzj60XAqEGsT7uDJ6aRReO1/7N/ZwU
         NeYRV3khKKjB/pX8hB11z/DuuGMimYxd48zMV4pFJ4gkkUdPl+AKIm5dZWxbxjye4pgr
         bOFd8Es4bt0+9v80WrGTGBtdYMa/bZgjsSKeGb+H9IxKvZtoEIedCWNtzxSp0xtg+3Mq
         8U/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707557846; x=1708162646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=traMzP3X3ap8UfhwxLc+Vo63DS4xV+/qhFdckzPcq8g=;
        b=Q2mFYT1K1E0NXEAEIK3QrtgmgbUcYh3/UTycAAHIzNGFcHkP+KM88PgjamnOAZu0pN
         z+hjZXT8eRGWEDCyvCNjaMHuBazU0S6V1e9hlPmsZ6xbyhAVN+iVXMMktHGhE9eWHc73
         t/h3XYppbZxyw4Krbi85/z5DlQdBIRC4qN43/RAYkGV5mRMuW1c5rE9+8h3vTaxg8HbR
         yn+H5wUmWgnrDnXR8J0/9j0P75GN2c1kYpLT2AgYEu7B/D3M4G4Rb10VFpTipvddfHDp
         TgTvTsicry5s7k6LrZ5Fi0kTWdiOEw9LIE1JiavIRhaA9cp3/V0dKoumMlH/YYQ7QYvB
         mLjw==
X-Forwarded-Encrypted: i=1; AJvYcCXkoGWmiQldFqzEzRbLBSQaqj8w9wzuz4XWM0z4qMmCf8xFsIhSM4e9QEiMFvc7O/YxABOUPRMGwqFL4sbJGPb4a7UHC4Q0a+LqKZfn0w==
X-Gm-Message-State: AOJu0Yw5DnmWnAKg/t+HmJSSywTi7iBr5jIktzjs+NroFyzGcWM47a/F
	aispJ3igqUp1u/c2ntdgovTuOnY0U2G/8UBkxpL0jRsTGg3ktE/E2eJRd3eRu/cSot4pTS7Iqtz
	UFZ9S7gr6/WcFjxf+gUScNdVZKRuEbkOZDTg9bA==
X-Google-Smtp-Source: AGHT+IF6CfRLisdVWfw44qvUlYpfj1ay0gD+tPXDhRLqsK2QrMb/MELbcxS5tQsxDr0PefjjkG/NJ46XbAkjEJ5+HGM=
X-Received: by 2002:a25:d348:0:b0:dc7:43bb:51f6 with SMTP id
 e69-20020a25d348000000b00dc743bb51f6mr1365579ybf.7.1707557845977; Sat, 10 Feb
 2024 01:37:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-3-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-3-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:37:15 +0200
Message-ID: <CAA8EJponSr=EgVe6m-KBWxvjz1bL-0Tczj=fGKZZrevJ3DZzbQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] drm/msm/dp: add an API to indicate if sink
 supports VSC SDP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> YUV420 format is supported only in the VSC SDP packet and not through
> MSA. Hence add an API which indicates the sink support which can be used
> by the rest of the DP programming.
>
> Changes in v2:
>         - Move VSC SDP support check API from dp_panel.c to
>           drm_dp_helper.c
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 21 +++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index d72b6f9a352c1..c6ee0f9ab5f8f 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2917,6 +2917,27 @@ void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
>  }
>  EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>
> +/**
> + * drm_dp_vsc_sdp_supported() - check if vsc sdp is supported
> + * @aux: DisplayPort AUX channel
> + * @dpcd: DisplayPort configuration data
> + *
> + * Returns true if vsc sdp is supported, else returns false
> + */
> +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +{
> +       u8 rx_feature;
> +
> +       if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature) != 1) {
> +               drm_dbg_dp(aux->drm_dev, "failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
> +               return false;
> +       }
> +
> +       return (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_13) &&
> +               !!(rx_feature & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);

Nit: we don't even need  the `!!` here. I'll probably drop it while applying.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +}
> +EXPORT_SYMBOL(drm_dp_vsc_sdp_supported);
> +
>  /**
>   * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
>   * @dpcd: DisplayPort configuration data
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 863b2e7add29e..948381b2b0b1b 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -100,6 +100,7 @@ struct drm_dp_vsc_sdp {
>
>  void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
>                         const struct drm_dp_vsc_sdp *vsc);
> +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>
>  int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

