Return-Path: <linux-arm-msm+bounces-16684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 040FA89B2A4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 17:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA496281A90
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 15:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C9239AEC;
	Sun,  7 Apr 2024 15:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bKF1Qz+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3C28485
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Apr 2024 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712502711; cv=none; b=j6Zl8r9uieENsRxnKuItvzdK5eGXWOOC+3mQ580bnkbkXZmHnRYUwbvTUI03bz6lZvG7KYfHh8gmH6Ifw+Z9QsbOmA+pBCjldIOn+6vNjtF2/xJUs62XpXKs/o4zuUL/ZvwQyq3xFhQ4xCrWdzFbaPmDr8wZyuJQaR1sNUmzzNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712502711; c=relaxed/simple;
	bh=5uIImuGQ4ZEW/qy0KdAjTxqyOTexb/Nu/WZSM8f+Npc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMyFLVZ2dPkONLV85p2D1RUVm26WKBmujqXbjY2yV34bzrT7DYxfphUpUKyTUEFy2FrXtCEbTaY0DWOA0AIrOSXiTSnEEWGFsr4H+QZAgGn5qZ4mZTWScgzjfsKMWZ9StEuVWjzbr6mF/hSjpIRVlr344m93NFLCLrgu91UfOG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bKF1Qz+z; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e480e770fso1010948a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 08:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712502708; x=1713107508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1L6tj3Ykhqe3bT0DzwbvYek6Lx7l4bP1RVMn9TnkTIM=;
        b=bKF1Qz+zgp2MxWr1+JizRxJPENojA1N5ezIfmhDDxuXsBFr2M5LPWYKWWsvTI53D2g
         Xgzm+V9Z5LebbNFiGtUH0Y7TS4nUCy+22NdHO5YsQVJnhJQNskL6Djp31UruH1hDffez
         WWgzDRP6qJxRul/39bqBx/8kj8WKyfOevgw6Bt4L6PdQbjAZqsiryCpzeQ43WPj6Kmd4
         Sydzr5OpACIr7UaEdX0FIyhfzD9DqszkNJ3YAXOHDOm6Pzi5zCN9VQw86lMvqq+dGh97
         NzfHDtt7voVoneNKL4fp6Ct9XLB2F0ajfRWVvDi5rwrbqgPVRKZw3MePB8SDJMTDM6iV
         0Q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712502708; x=1713107508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1L6tj3Ykhqe3bT0DzwbvYek6Lx7l4bP1RVMn9TnkTIM=;
        b=xTRvogTDC222fvPwmgqUHgqhBNkGt/kFHqDPZ3dZboCzxaRshrSoTxgE8QpItQz2kT
         DKsUk6JtwUewfcnMQzKteSCI14HiatZNKleTZ6GEJx8AzZh2fTSzXca3t6nuiC/5tilL
         wH8NmeZopZrpa3vVEfQ3WdO5YzP7LuLuqUd5ZRVvEh2O1gP7D7xGSAWWo8XDIVDshrNu
         nA1jgWxSPCScRat2c2/bPSP8fi/0KZmtSYrBll/IcH0VLzrUdvC1J+kP30FcBAoVbXeP
         OE5Tu9VrywGgPYyLLKIs/yw+Og4QaO0ARrv8yNwUy+XaZstCTMGdwYYn0qZsxn1GfGiB
         OMSg==
X-Forwarded-Encrypted: i=1; AJvYcCXaNjfY+jmFkEA29WybJF+aWFcUcIekreGc3tuSt5scLgxraadYxZ/UsbwXO8gklW0Bgq4mOqJTRLmczayUWnQKxUvtJAWV1c81kek/fg==
X-Gm-Message-State: AOJu0YycV9K2O2K8LaxuMQdzrMzoz81ECfAnx3jD8E83klN+cD0lItte
	kznf+Nh2ehqF9YWiZnQbFG3Pga6yJY+9UyQ92sIgBxQa//MBKRhDskLRmTbNsgs=
X-Google-Smtp-Source: AGHT+IHElRvRYkTsvef4HJyWIpPMDFwQYWdafxiP3Xm2EkrU6lPRRRXxKLZTeoMyg+mwIL/wZIUWOQ==
X-Received: by 2002:a17:907:3daa:b0:a51:d4fa:cf92 with SMTP id he42-20020a1709073daa00b00a51d4facf92mr306861ejc.14.1712502707981;
        Sun, 07 Apr 2024 08:11:47 -0700 (PDT)
Received: from linaro.org ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id dr2-20020a170907720200b00a4ea1fbb323sm3239743ejc.98.2024.04.07.08.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 08:11:47 -0700 (PDT)
Date: Sun, 7 Apr 2024 18:11:46 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: Remove now unused connector_type from desc
Message-ID: <ZhK3sijUdGBSCMVz@linaro.org>
References: <20240405-dp-connector-type-cleanup-v2-1-0f47d5462ab9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405-dp-connector-type-cleanup-v2-1-0f47d5462ab9@quicinc.com>

On 24-04-05 20:14:11, Bjorn Andersson wrote:
> Now that the connector_type is dynamically determined, the
> connector_type of the struct msm_dp_desc is unused. Clean it up.
> 
> Remaining duplicate entries are squashed.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> This cleans up after, and hence depends on,
> https://lore.kernel.org/all/20240324-x1e80100-display-refactor-connector-v4-1-e0ebaea66a78@linaro.org/
> ---
> Changes in v2:
> - Squashed now duplicate entries
> - Link to v1: https://lore.kernel.org/r/20240328-dp-connector-type-cleanup-v1-1-9bf84c5a6082@quicinc.com
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++------------------------
>  1 file changed, 17 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 521cba76d2a0..12c01625c551 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -119,55 +119,41 @@ struct dp_display_private {
>  struct msm_dp_desc {
>  	phys_addr_t io_start;
>  	unsigned int id;
> -	unsigned int connector_type;
>  	bool wide_bus_supported;
>  };
>  
>  static const struct msm_dp_desc sc7180_dp_descs[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
>  	{}
>  };
>  
>  static const struct msm_dp_desc sc7280_dp_descs[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>  	{}
>  };
>  
>  static const struct msm_dp_desc sc8180x_dp_descs[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
> +	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1 },
> +	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2 },
>  	{}
>  };
>  
>  static const struct msm_dp_desc sc8280xp_dp_descs[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{}
> -};
> -
> -static const struct msm_dp_desc sc8280xp_edp_descs[] = {
> -	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -	{}
> -};
> -
> -static const struct msm_dp_desc sm8350_dp_descs[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> +	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
>  };
>  
>  static const struct msm_dp_desc sm8650_dp_descs[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0 },
>  	{}
>  };
>  
> @@ -186,9 +172,9 @@ static const struct of_device_id dp_dt_match[] = {
>  	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
>  	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
>  	{ .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
> -	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_edp_descs },
> +	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_dp_descs },
>  	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
> -	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
> +	{ .compatible = "qcom,sm8350-dp", .data = &sc7180_dp_descs },
>  	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },
>  	{ .compatible = "qcom,x1e80100-dp", .data = &x1e80100_dp_descs },
>  	{}
> 
> ---
> base-commit: a874b50929e2596deeeeaf21d09f1561a7c59537
> change-id: 20240328-dp-connector-type-cleanup-af6501e374b3
> 
> Best regards,
> -- 
> Bjorn Andersson <quic_bjorande@quicinc.com>
> 

