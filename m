Return-Path: <linux-arm-msm+bounces-46423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A05A214F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18F541674AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1791DE8BF;
	Tue, 28 Jan 2025 23:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tbpMCJc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8081419E82A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 23:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738106459; cv=none; b=H3d2U7a4Up7w9jxtCuaOzn20zun/T28fJQoj/LJLYSO+1OeEu6jTBjmwoMNYWIGyWzc9U4IVPpWeQycJFwRpdOFyIgiHG+8z//SVUAUQvXS1XfBW+FJ+KYmk4GnyDGGmAU64rYUcamseTD8zxRGc3KDrgGXIJ8zSTbqAcSz3imI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738106459; c=relaxed/simple;
	bh=V345nqDJ1ZN9lgcQm7Ls6ssPXfR2l7YeTZlagHat9EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8m0J88/7hX8aJEM95Clm+eutP63ROpgmSpA8dB9tNyIQjxZsTe0E5aRM5pEX+rRHi20PAIWOOuxdFvb0wsVVfY81q3MdcbZWA4a0Fpm33PPVmKJZJItyasbZw8kG/0ZDaqYTzJZwcvYgqnoHVY+AL6TKNQAO1cxzGJgRk3faBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tbpMCJc2; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401b7f7141so5558455e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 15:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738106455; x=1738711255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8nYDe6L0+19gf1NVMQt86eufjnNQxpIjp2WrtO88qBo=;
        b=tbpMCJc2L7ck81SCDDQ5Kz95EkCyyTmi6WrqaaD102fmUCKEKrUR/ULJgfAiCwWHgh
         WvPyka5Q2j/bdXuaSvwxZNwCMZ5m7z+zvTNMgDsIkVCiXTVTZj/8fPzjvb5LblqxHQ4j
         VUYyw0FBI+QZXWQ7VyBRfwrlJ1S9I2DgUsILc1n3ajrQPNv0+Za10UYtreE3PxWTDPYT
         SG397hH2evZ5XmD/SorHWNJb6r6B0v5/+fhDlpwsOBzIRjjvOAn5ikTfv095yW3LV0S8
         XHvBSdHRCQscej9931YDsBOvpDmrM2Rd8EwCmZ/saZPc+ywofcOIO2ZfH6lxClxuKS4k
         V+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738106455; x=1738711255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nYDe6L0+19gf1NVMQt86eufjnNQxpIjp2WrtO88qBo=;
        b=nNmbvYJSeJkj1y+XHtnYgIlvnmk3HUs553LFadRqLHhmPXbkZhfDgF2lymbGnhEvBP
         7fo3gDFVDYM4kf697MCIcJbpkB69d8HQhv44c/hkyjzR3N9fdLAMsv8CPnnbK4GAiVAw
         sU0aARPxSrvjvc/ePHhH5JQ9qJ3HotSCi6vqtLqSJQzMGpeRaL211oNr+C/kfxD0rTCq
         O10E2/2+3gTAJGFRBqxn/3DP98lrVySwgxTvT01XAJkSSdIGOaBhXeVha3Z6HX2DKyXY
         2+Jr4Xicveg9fS0XHJo27SC0ifhabkehni5lmlZICQKkewa1C65tngHlRw92YJXU4xWL
         z/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWoFi/7O67PwBxmvJid2ybR66VJFKivqOdY6Z1hbu82XUvcm4IEn6LR4vvj+eOzr++UQRoMReLov3hoh/Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzcWuCNm/izj7jOLshYc6jED8IToN82xOOIDDvjfAKEHmj62Bmz
	A0H+75psrKD1Jjk4E2K0CQnIZe3dNHzz5SElGXOX1ZkbxRqjGCqMd2MXbb/bcHE=
X-Gm-Gg: ASbGncs2uMsOp2i9KDWQL8FQpf3eiD+dbk3yXIC3DEnLxWwd1+2iRbtN1xQG3I7qcoJ
	FXS7XVlU8RTM70jG5VcUJmxMoSWBfi1HK2iJi10QJXaj3K390vXmla/LU0xm9Obs9awbusXjwRQ
	Jj4ABOe2j3rVGmu3ZAh21ZG5oC77gdcFsko+NbwbJbLW5ppL2Y1aN6gVNM0tUnwlxUg+XjXE3vF
	Yoz8/hUAzpiVObLaRwfX9AygqJ79scxwt4zF1vwvHukF6gJxzwp5wnocRsTls3G9OY7oGAVzv2G
	TEt9TIdVIzDTKoUCUZo+8nh7JlvAcwULVlF+idBW990o1xvZBQ1SjNEJWnU6VGzwd3QNH1I=
X-Google-Smtp-Source: AGHT+IH7ZMuRhx0kEJGVK8oPBDelzjeBZIDBRWzL0TWy2sbaG8ukqZNLJIeLzF9dCSPPjiUWD2Tu8w==
X-Received: by 2002:a05:6512:3405:b0:53e:314e:6119 with SMTP id 2adb3069b0e04-543e4bf9da5mr225169e87.29.1738106455454;
        Tue, 28 Jan 2025 15:20:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c838166esm1798379e87.235.2025.01.28.15.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 15:20:53 -0800 (PST)
Date: Wed, 29 Jan 2025 01:20:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Stephen Boyd <swboyd@chromium.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: account for widebus and yuv420 during mode
 validation
Message-ID: <eksyfuzjekxkcm5fjxyjjbyu6nkreqdlkuy2eiijrcbeu2fd2f@74viz5tylch5>
References: <20250128-dp-widebus-fix-v1-1-b66d2265596b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-dp-widebus-fix-v1-1-b66d2265596b@quicinc.com>

On Tue, Jan 28, 2025 at 03:10:27PM -0800, Abhinav Kumar wrote:
> Widebus allows the DP controller to operate in 2 pixel per clock mode.
> The mode validation logic validates the mode->clock against the max
> DP pixel clock. However the max DP pixel clock limit assumes widebus
> is already enabled. Adjust the mode validation logic to only compare
> the adjusted pixel clock which accounts for widebus against the max DP
> pixel clock. Also fix the mode validation logic for YUV420 modes as in
> that case as well, only half the pixel clock is needed.
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Fixes: 6db6e5606576 ("drm/msm/dp: change clock related programming for YUV420 over DP")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  5 ++++-
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 24dd37f1682bf5016bb0efbeb44489061deff060..a4b420a2d9eb7f084194f443e84a4013c9b4ef0f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -930,16 +930,16 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
> -		return MODE_CLOCK_HIGH;
> -
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  	link_info = &msm_dp_display->panel->link_info;
>  
> -	if (drm_mode_is_420_only(&dp->connector->display_info, mode) &&
> -	    msm_dp_display->panel->vsc_sdp_supported)
> +	if ((drm_mode_is_420_only(&dp->connector->display_info, mode) &&
> +	     msm_dp_display->panel->vsc_sdp_supported) || msm_dp_wide_bus_available(dp))

I'd ask to move msm_dp_wide_bus_available to the next line, it makes it
easier to read.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>  		mode_pclk_khz /= 2;
>  
> +	if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
> +		return MODE_CLOCK_HIGH;
> +
>  	mode_bpp = dp->connector->display_info.bpc * num_components;
>  	if (!mode_bpp)
>  		mode_bpp = default_bpp;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index d3e241ea6941615b8e274dd17426c2f8557f09b5..16b7913d1eefa8c2deb44df201a1977db23f4531 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -257,7 +257,10 @@ static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
> +	if (msm_dp_wide_bus_available(dp))
> +		mode_pclk_khz /= 2;
> +
> +	if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
>  		return MODE_CLOCK_HIGH;
>  
>  	/*
> 
> ---
> base-commit: 2bd7708f11777d4fd436fcba62b57cff6a92e389
> change-id: 20250127-dp-widebus-fix-fba78bbe242d
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry

