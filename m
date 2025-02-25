Return-Path: <linux-arm-msm+bounces-49343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBB9A4480E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 332D88800CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FE819924E;
	Tue, 25 Feb 2025 17:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K4dd+xUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6F2166F29
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503899; cv=none; b=h9N4iLv0z7YqPe+SToCXSeIX1kkURNWFQOO82eVtnviLJPq4b21EHxVgsAs1N8TB7aoGPMQsLHQG/vXkPnoCEcIu64AT4EcgD1VdJF+sJDQX3NdfLDf9RAiiLRhr9U9OsWzK3nWhwKqt5NJWDJsUOO8jlKFaeqaMa9uXode1K74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503899; c=relaxed/simple;
	bh=fegxD61N6B8hGlbYe8Jr/TcJ0cHmgZSa0wxqbTbnR+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDZYe0P2Uuz7ndv/vbj0DsQCjYkMdNCms5v+fTtXoqVAa6JQST9ue8oyOIuAwb8A6YHAeEs4kEofLsDHZSTvpL2MGDsDZ2LpmusW4IJBH1+zNHU4uqKCB8jS1YZ/gHIOJ0t+gpxk6HFNvKKLEdlswxH2Nj5skLEqSRQxYMTVrSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K4dd+xUz; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54843052bcdso3074284e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740503894; x=1741108694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UBMGUOCl55gdKoV7vW8XIwXzlyBYkDGukZo5cGFH5CU=;
        b=K4dd+xUzSiv2YuKc/yP1Gy16kZHMbr3DX7nqRtdAEnJJlDuf1s1JPwGsgO2LBSJI99
         HJL8EcX0TUWr8yIHFwTcNzMK3R7a5hrHNvmPILGSDw13aoVoypRCGnPviLNV15thfpd9
         v/UnDXIuwhspX5k+r+gNKKU4VfNM5j0CibKBYqxx5Xq4ysIDblW39upKRrQDRpk5yKnm
         4VWD97w6kZEyjledbQnm2vHjak/nzweN8qlaCkwm2Xb9p+mfgBd/vFq7f8gP0aXj7OAu
         R+VK5ids4diMRIlPvBWdvrw6ZZPyQbQosLNFXiYIQpyJF5vLj7gdfmmZLfgMEcZUd4by
         ab8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503894; x=1741108694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBMGUOCl55gdKoV7vW8XIwXzlyBYkDGukZo5cGFH5CU=;
        b=AmzAlSkEu1Bpq9c6yYx872yqy7oWZNVJRdFIJ3H346tyVipF9g7DTelzs8J+l2BhKl
         M/g/twmOPflLkPLh/lhXvqNnTTcdZO9+p05KzRaVVMweX5TiJ5FU790w8zJ5gT0ubPVc
         tBQMJPzAgF3rpDPTQ5gTT6ZODSdf4pIJDU2yuYAR1EkW6O0LgiT24EqayoS3z/Kf4MK5
         ejQ27YxArbM+7gFMbVIJtT6srUVDqTNcnKKEWtLnRUAw4bNE2fSoj6dz43eiCpSpKZOw
         /9kStkOF7ISlMVinD5ju0fEB2sMpcAV2Kav8AOwaXRw4LBhIgGLJng3DgThhMAZx125D
         dECw==
X-Gm-Message-State: AOJu0YxOhVT9P8oEBeFt686qDScA+xBcOiKFLy/cInv7hNSmqTQJaopm
	Zaqj3OaVu/IpSrWJzprAlYRyQuuxOi7ns/bUewf8nWr8MLQvq/l/HTrslrho6K4=
X-Gm-Gg: ASbGncvRWW3iqLx7dT7cIlV2ynGngq6lpAl5DyJOmxytToqh+onwpeI6KETA2bJ3kfV
	h9Y+QLJ0rg2yAOLkKafjrB/b0sovVJZOxiZzKj2iYRya0KqCY5vHRrPZdlrj60ppi8lddcMJ1SO
	Ojk39L/jkutBivB3jTVcLCJu4Z6bjmQH3jSkdrhZD96D3TasYPwMgG1G8kMoH1lievKVd+oC6E/
	uW6s22hAXhHblitmzbCxJ6THYGREBL2OwBlMKexFG9C8M37T9l1OIDcxVaQH2vmomc0ZQ8pSDsQ
	yCpTyZX2hHbyEEhci4ds7b2ysGJ+azsW6PEuH0ULutDp6+/UdSzDGatrytplXKfbrWCP3LzUIwP
	EOEXNkg==
X-Google-Smtp-Source: AGHT+IHP/HVI8920DHkWUudbL09CGIMVh2mmFw18ADlkjqgydR5LKcjUPGttxXMqHgdd2UEVYmuwRQ==
X-Received: by 2002:a05:6512:3f28:b0:545:b49:f96d with SMTP id 2adb3069b0e04-548510712admr2315191e87.0.1740503893983;
        Tue, 25 Feb 2025 09:18:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm229975e87.24.2025.02.25.09.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:18:13 -0800 (PST)
Date: Tue, 25 Feb 2025 19:18:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
	andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
	quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 05/11] drm/msm/dsi: add DSI support for SA8775P
Message-ID: <hl352hhpv6imtilpw554njkpod4nycjlls4gg75barlugc2e42@okw2snj2bqm3>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-6-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-6-quic_amakhija@quicinc.com>

On Tue, Feb 25, 2025 at 05:48:18PM +0530, Ayushi Makhija wrote:
> Add DSI Controller v2.5.1 support for SA8775P SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 7754dcec33d0..71881d9370af 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -221,6 +221,22 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>  	},
>  };
>  
> +static const struct regulator_bulk_data sa8775p_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 30100 },    /* 1.2 V */
> +	{ .supply = "refgen" },
> +};

sc7280 has 8350 uA here. I'd say, having those two next to each other is
suspicious. Could you please doublecheck it?

LGTM otherwise

> +
> +static const struct msm_dsi_config sa8775p_dsi_cfg = {
> +	.io_offset = DSI_6G_REG_SHIFT,
> +	.regulator_data = sa8775p_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(sa8775p_dsi_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> +	.io_start = {
> +		{ 0xae94000, 0xae96000 },
> +	},
> +};
> +
>  static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
>  	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
>  	.link_clk_enable = dsi_link_clk_enable_v2,
> @@ -294,6 +310,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>  		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
>  		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_1,
> +		&sa8775p_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
>  		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_7_0,
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 120cb65164c1..65b0705fac0e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -27,6 +27,7 @@
>  #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
>  #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
>  #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
> +#define MSM_DSI_6G_VER_MINOR_V2_5_1	0x20050001
>  #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
>  #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
>  #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

