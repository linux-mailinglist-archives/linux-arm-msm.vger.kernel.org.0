Return-Path: <linux-arm-msm+bounces-40910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7926B9E84C6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 12:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6439D163FF7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 11:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDC2142903;
	Sun,  8 Dec 2024 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gebixZ90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE68145346
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733658502; cv=none; b=o/dXOjenoFMpyPDtUljknNrM276/fJ3WZHPJN3oAaCzq7PyIA58CNjwXZYxTFmy7JbU3uqtlMv4l3SGbv2+GSoacQXj/gXFBBk8b/PoUl2yD7MnMRbPK6FYf6sExSPn4gn+60sq89JrnU1hKPKZT0ubD1Pp0DfWPLFMMLBf3ZNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733658502; c=relaxed/simple;
	bh=DJ9Y60X2fACb6uHRTsT1wh3vA777r/qgURmBYX68IrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ae372BDc/QbAQLxUU33uQcIoggIVcRa2CtlQZNodeFy6FlpMyUdnG+DmSoM4ufHj5Kn4wvmtTHpTfN7tGDY8C66jOrTGSlWbJfMQQlsEvZojB6EjL9wXy4u86vnm6vMQJDs8bNYIGXUEBh3FFwivBkLUWCY0M+qXE+xSUYrC18w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gebixZ90; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30219437e63so4915891fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 03:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733658498; x=1734263298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z4tIIPwwjLUIIZDfXiBmmk0gEmVWRuTZ+xmFiDPryO4=;
        b=gebixZ90bdX9W3edYzcTZIIvrxzGY5UedfjV2wa5cxHK6n6OwoT0ZzeYfC3darsRQ6
         rC+PfMtKDMh/or/yMtVLPKhpV1jPnF68wnTSBobOE7h58SN3EOo0gcqViWClKkAbpIl7
         Z6QEzxg4EZYcyEeLhTo910ae97i3jnlvCUCV/e5vf7YbDNQydwWsQrOhYohWVEYn6KI8
         uZLbKo2S9MDfTLDASHUob7y8gd1Fv0S2ybyPgy5HiC23NIhxpP6zRYNEjpdd/wf4xM8O
         AEEMe89kExG0uywfzjiISDt1KfFxICnfw8Dl+NlB/0x8ivvBjxT2VtI2Vx2WX+2YlLRK
         39KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733658498; x=1734263298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4tIIPwwjLUIIZDfXiBmmk0gEmVWRuTZ+xmFiDPryO4=;
        b=T54fqqMfJ5dlb+dqpm5OLUS/CckqZP3hwLVk9xXMCwFYA1siovcYIIwq/W2660Krmk
         4RdvzY2uHQDGpO5s3htnQakSsNE9gygVErFPONUrXbGofLppC6uWiKC+h4GgSF1DafKw
         ZqNonCVBTngNJHWrpT28MJszyIyC58TCw6TUIqF6+4w08LhfogMNUo14CdVv3gN8mbEr
         cNuHQZsvbQ6Wu5YrEaAvYdxgE4IHUUiImxHg5OJ/olyZDeqZIkBjcJPuP8OESl0okzqD
         7FCl1PphBKSZqGhBkf3bwp9wAMODYz3/5KC3nyXLgbnqFOTiF3fabxVz6xxmH+Hm8Vp7
         R81w==
X-Forwarded-Encrypted: i=1; AJvYcCU9+66mSq7i/s6rqaL+LZzTyGlV0vuk7juiRxSjDoN2fvjPTXTu5veNEnC8q7TaGoX2Nl9US6VsoEuq+0su@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd1g22Apq+M36f5Q2wQtnUWvIOZfoxgVTc9+S++4Ym3bjukmbQ
	1RYRg8mu9AkuJNwsDjDJfmIK5g2y5BQfVhA/SKAagP+kGeDgUPtjyr8Y3EWgbwk=
X-Gm-Gg: ASbGncskBFtoTvECQTvOJimZT1r+AgtF9SjCY+unmtLU933RQDtMIZ2L/kWkwIlk5N5
	Pgv6L9Kox7Uaff5y0tw0hdd+4LJ4LKuX+kWqqaXZq+JVSYaWcpMgPLZDmtygMQgtgNZmedCJfjw
	w+bQUppb3jKSWpCqRmZVI2NLno3Rwwpn/u/72CsKyWF53vxz5r/eseIn/Eu9KfT/hdvFhNtZMoz
	8YTvWK/oAPlDUJwkVnA3aOqYsNgAGWytWGyOu76ypgBktiyC7h+T65JLf1PkOR005DKpRddIf9L
	cR5rEsijEwdYOP87NzznE2ATdp/Wqw==
X-Google-Smtp-Source: AGHT+IEN46zayJ+gfUNumRfAuI8PnT+wBoYszJhOUMz+jyYB4C2u+1pyFpm0Oxy50d1tBQR1hCi/vg==
X-Received: by 2002:a05:6512:4012:b0:540:1c67:fc2f with SMTP id 2adb3069b0e04-5401c67fc5dmr432013e87.14.1733658497742;
        Sun, 08 Dec 2024 03:48:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53fb80d6feesm365296e87.156.2024.12.08.03.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 03:48:16 -0800 (PST)
Date: Sun, 8 Dec 2024 13:48:14 +0200
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
Subject: Re: [PATCH 25/45] drm/msm/dp: move link related operations to
 dp_display_unprepare()
Message-ID: <s7aprnu3zrxm6ocisakeiresxnuf34qw5kqtip233gzx72h27p@wmveskystjl4>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-25-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-25-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:56PM -0800, Abhinav Kumar wrote:
> Move the link related operations to dp_display_unprepare() and keep
> only stream related operations in dp_display_disable().

Why, no what

> 
> Make dp_display_unprepare() available to other clients such as DP MST.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 31 ++++++++++++++++---------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  2 files changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e169cd22db960c0c30707ddbe6a79999dc2a273d..d5b8fd1d4d736ffa7929b9798601dcef0dea5211 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -936,20 +936,8 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>  
>  	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl, msm_dp_panel);
>  
> -	/* dongle is still connected but sinks are disconnected */
> -	if (dp->link->sink_count == 0)
> -		msm_dp_ctrl_psm_config(dp->ctrl);
> -
>  	msm_dp_ctrl_stream_clk_off(dp->ctrl, msm_dp_panel);
>  
> -	msm_dp_ctrl_off_link(dp->ctrl);
> -
> -	/* re-init the PHY so that we can listen to Dongle disconnect */
> -	if (dp->link->sink_count == 0)
> -		msm_dp_ctrl_reinit_phy(dp->ctrl);
> -	else
> -		msm_dp_display_host_phy_exit(dp);
> -

This changes the meaning of msm_dp_display->power_on. I'll have to
review corresponding code carefully. Please note it in the commit
message.

>  	msm_dp_display->power_on = false;
>  
>  	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
> @@ -1678,15 +1666,28 @@ void msm_dp_display_atomic_disable(struct msm_dp *msm_dp)
>  	msm_dp_display_disable_helper(msm_dp, msm_dp_display->panel);
>  }
>  
> -static void msm_dp_display_unprepare(struct msm_dp_display_private *msm_dp_display_priv)
> +void msm_dp_display_unprepare(struct msm_dp *msm_dp)
>  {
> -	struct msm_dp *msm_dp = &msm_dp_display_priv->msm_dp_display;
> +	struct msm_dp_display_private *msm_dp_display;
>  
> +	msm_dp_display = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);

Set it it at the assignment time, please. Or at least add an empty line
afterwards.

>  	if (!msm_dp->prepared) {
>  		drm_dbg_dp(msm_dp->drm_dev, "Link already setup, return\n");
>  		return;
>  	}
>  
> +	/* dongle is still connected but sinks are disconnected */
> +	if (msm_dp_display->link->sink_count == 0)
> +		msm_dp_ctrl_psm_config(msm_dp_display->ctrl);
> +
> +	msm_dp_ctrl_off_link(msm_dp_display->ctrl);
> +
> +	/* re-init the PHY so that we can listen to Dongle disconnect */
> +	if (msm_dp_display->link->sink_count == 0)
> +		msm_dp_ctrl_reinit_phy(msm_dp_display->ctrl);
> +	else
> +		msm_dp_display_host_phy_exit(msm_dp_display);
> +
>  	pm_runtime_put_sync(&msm_dp->pdev->dev);
>  
>  	msm_dp->prepared = false;
> @@ -1732,7 +1733,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp)
>  
>  	msm_dp_display_atomic_post_disable_helper(msm_dp, msm_dp_display->panel);
>  
> -	msm_dp_display_unprepare(msm_dp_display);
> +	msm_dp_display_unprepare(msm_dp);
>  }
>  
>  void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 2b23f2bf7535d3fd513d40a8411a1903fcd560b0..82eb1c6ed1467b21742bda8eaae9c51d3207e997 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -65,4 +65,6 @@ void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
>  void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp,
>  					       struct msm_dp_panel *msm_dp_panel);
>  
> +void msm_dp_display_unprepare(struct msm_dp *dp);
> +
>  #endif /* _DP_DISPLAY_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

