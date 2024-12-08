Return-Path: <linux-arm-msm+bounces-40915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0709E84E2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 13:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39453281640
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 12:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0E41422C7;
	Sun,  8 Dec 2024 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cD/dmayR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C984E1CA
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733659242; cv=none; b=AIeSTSVhsrqcQl1JekBFV41CjRBn1b4R75fPkvoyo48ansSozEtkKfGAbgnctXZQ6rpfODOYTVpIxWVdiMJhP8w6uQ9AM8uBXXW/z3hAGo2nyUcRj9aK6f4mqKRtVPP41kwgOs1btAXTLdsNZfpvLkEyNASiDeZ8xbH4LRfD+fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733659242; c=relaxed/simple;
	bh=jWEVwdC7IM3E6ZVjKzgSy1gMvLr3I9xboOzdFIxUATw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2VdXgBAyyiL9L6DOZzJ8bV7s+k/+wqw+Cdbs1/q4VmVP6G+Cji1FEj6jRkcaErW/oUfpF7w8994LbulDxp3G0U27MElfpXuLSgTyHa7SttKzGfnkg/HORXLRcjTbyJOB4wb/ibrgtIAuGQiiEAMGwpIwWsmLtpY3rB+w2fwskE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cD/dmayR; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3003e203acaso11461491fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 04:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733659238; x=1734264038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IZQDqZh24CIlU2q7DysLNqODQ6Kiip1cX4ZxRIqPVaA=;
        b=cD/dmayR7SOWiTH+jd5UhZ1gL/EMDQsOyqsrh3rTUvfOB8IdD4Stk2/5zey0Eh3eVJ
         0tJOoH0berIZiYx8l9g1TqGr0mAiACvPpmDD5S5LlqnhxzvhKH8b54gjlB4Yt8xrmHs6
         t5TX8FkiJ7NPKAZVtUFzxLcgsZYMniTkBmsKiyKnKQEevkMJCk9N57ce/pg+hoscWOEC
         qDFcqIlgV6gjSB2Z6uT27FkKVU5ApfmYuKs+Qjc4FbRCLiPOWKUtH8f4iyJTVHYD94cJ
         adIR1pRiFHYZT2bgJiCho7nmlrcW/J8q9MQ1Iw7qWoQmwsT2QGUPT6b3GgAU2Hn+75KX
         /NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733659238; x=1734264038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZQDqZh24CIlU2q7DysLNqODQ6Kiip1cX4ZxRIqPVaA=;
        b=q6Qq3XD2UErcHHS47LDlezxxZ1wlsPv4AJ7WNaGov4nfm2uGatCxQ0mLnqFZafXz0+
         KQEqszsSozLFjJSUcl8vL596tUanKEDFcysNt8cksMRcH55DPTetM6M2CTN056paOoll
         QfOUu4S2+URN4VtQTpQfvXpWfX03HwJNd3A5h2GlvIXywkjuWE1vsBS84Hj3V5T/zE4M
         TwAv2h/rlg+gEJMVEctnRkwcXFEIeJa0z6nqZaR7iBUVeZOYMoTQIik5dzPfBPE6HZwy
         QlylaWXDXDTTAB6QgPXWp10cjLAoICw+cU2FJa65csKryRcs5qSf1t1RAeEQimWNCAP9
         No7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNxX7E79Dt+s41fp08FFZ0FQpuHoqX0sWJGkndu2bFqtgqF7mCu39YOeNyJTwNZBgAenpJe1mrqyyJeAar@vger.kernel.org
X-Gm-Message-State: AOJu0YwDxOlUavv0EVIOVBkQ7nr3G5td5EPZOdELTbVhoZeGa9Y+znaT
	bWzWj+fgTa1qdGi7aNfVk90rf4mZ7/DdIRkM0a3u0cc8m6cOcjCsEiwc01XbuAA=
X-Gm-Gg: ASbGncswbCYOb3yefokLIFtT9ccjb0Q8NjFME89zrqW8+rc4p19CLtQJFUWjRkAw2z9
	ijU0/AE8Ujhkenji9TX4FuPLNGV5qA4Ll8tXeuox7DJLWKTdQ2QQKtuhZMEfgutK97SlmPK3Y4O
	O0/Hl19wgXnX/sAVQkhTc8mvBBl/3KfM9hnA9N3qLZRLtnchLK+4U7ET3I78QYklKBgjBfOuix+
	3jokTDg1SKHZ2mvoX/pzZFUUo9D7hnaG7vLoaef9kAIUPBFPGDCkK7WJozcnOHoXyxOn4PDNCBb
	Il8vrqBiz2aArKT2TVRqovJkK5W1tQ==
X-Google-Smtp-Source: AGHT+IFtuMd2CLZMp/J0k4uDOw6R2C77JANZoosZcIAaqEzW6+8T96FmwIKt4fcpD8nXNf+JBXuB1Q==
X-Received: by 2002:a2e:bccb:0:b0:2ff:cfbb:c893 with SMTP id 38308e7fff4ca-3002f688d90mr36234661fa.6.1733659238447;
        Sun, 08 Dec 2024 04:00:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3022397e845sm144661fa.66.2024.12.08.04.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 04:00:37 -0800 (PST)
Date: Sun, 8 Dec 2024 14:00:34 +0200
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
Subject: Re: [PATCH 43/45] drm/msm/dp: populate the max_streams for sa8775
 mst controller
Message-ID: <5hmhxnqp3ix636jdsxqgmdkrzvsduax4ft5uec35qduuwif2rz@pwbm6hchctrw>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-43-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-43-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:32:14PM -0800, Abhinav Kumar wrote:
> Populate the max_streams for DP controllers to indicate MST support.
> 
> If the pixel clock handle for the second stream fails, treat it as
> SST case rather than a complete failure.

Could you possibly clarify:
- Are there MSM DP controllers which do not support MST?
- Are there MSM DP controller which support more than 2 streams?

It might be easier to to set max_streams statically rather than setting
it via the descs.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 ++
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++++++---
>  3 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index d4915a962f97b3d2a347456e197265a5dc043eb0..0e5ebcdab00936cf0ce6e35514f2932158530cc0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2438,6 +2438,15 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>  	return 0;
>  }
>  
> +int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	return ctrl->num_pixel_clks;
> +}
> +
>  struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
>  			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
>  			struct msm_dp_catalog *catalog,
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 9ad7022d6217572395d69294c3cc4d4dbaddf0ac..f72a499809ec01a9cc5bb79762bc2604820426a1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -54,4 +54,6 @@ void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
>  				      u32 start_slot, u32 tot_slots);
>  void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>  
> +int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
> +
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 528cda1453a85f5f8dd37bb0d2366548016c88e4..db563af19461089dbcaccce0d03fd03d5aa567aa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -126,6 +126,7 @@ struct msm_dp_desc {
>  	unsigned int id;
>  	bool wide_bus_supported;
>  	const unsigned int *intf_map;
> +	unsigned int max_streams;
>  };
>  
>  /* to be kept in sync with enum dpu_intf of dpu_hw_mdss.h */
> @@ -149,10 +150,10 @@ static const unsigned int stream_intf_map_sa_8775p[][DP_STREAM_MAX] = {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true, .max_streams = 2,
>  	  .intf_map = stream_intf_map_sa_8775p[MSM_DP_CONTROLLER_0],
>  	},
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true, .max_streams = 2,
>  	  .intf_map = stream_intf_map_sa_8775p[MSM_DP_CONTROLLER_1],
>  	},
>  	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> @@ -1481,7 +1482,10 @@ int msm_dp_get_mst_max_stream(const struct msm_dp *dp_display)
>  
>  	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	return dp_priv->max_stream;
> +	if (dp_priv->max_stream == msm_dp_ctrl_get_stream_cnt(dp_priv->ctrl))
> +		return dp_priv->max_stream;
> +	else
> +		return DEFAULT_STREAM_COUNT;
>  }
>  
>  int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> @@ -1517,6 +1521,9 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>  
>  	dp->max_stream = DEFAULT_STREAM_COUNT;
>  
> +	if (desc->max_streams > DEFAULT_STREAM_COUNT)
> +		dp->max_stream = desc->max_streams;
> +
>  	dp->intf_map = desc->intf_map;
>  
>  	rc = msm_dp_init_sub_modules(dp);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

