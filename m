Return-Path: <linux-arm-msm+bounces-48966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D9A3FBD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 734FA1888D09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66555215162;
	Fri, 21 Feb 2025 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E6Q3n6QC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A2215068
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740156025; cv=none; b=U6CnZlYLXCD6xAtkZmtIdfRKqEjwVX2OxbWk3ywCeZyt3d5nqGyMZgej+Iad5Dbm/BM7q5E4FrEV6CJoRbu5ByNLNBul9qXVV92Y3H4TAc1J9OdcYwnVO/KvQTAiaoy4MBpKy32Og0qSltOiYldvnVGd9yUsuteWicd7ZktmzwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740156025; c=relaxed/simple;
	bh=17uKUo9FOPy07r+XAiIBseIm0cdymLN5f3xEcVtffWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiZT9/4EpKzctitF0mWAYhJtMI2A4VAzYkBRathJMKRhv3XbpEhKNT7yPL6Pv0wcT1jd4z4yMZpSmMcDdbIDB6T1lCH2HxeRknuEqa9rUFAvGOd3OLclmkfg02jz0mfLndnCGftQuiN+UxR3ZOzYO+97UnMlPwhr4jbqm0N2ntY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E6Q3n6QC; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5452e6f2999so2397282e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740156021; x=1740760821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XeJTx/vmHBx5GNuwonywXW9ioDFWEnQJoc6Kq60Yt8U=;
        b=E6Q3n6QCPyYl/qtLwU94xCNQSql6zjpvWVCqvzHGb6UqQ4GTFRZoLr7ICjxNqSlcE2
         qsl0jhY3Ba9owghfbvkztyjirHiAbiYHdaawZCk5ncuHIg6DVKXliQWxhwQ2nbbp+9q1
         oNi0HM03UnlWfwjn24mGvDTbpnvBjQtHAGGnidVxswCT2FF8+JWNQLfaSQpZDBpsOacD
         +ID5ubx4lamDsB5MoKMxZ9kI/GhoD3RJAsHk5Ce5shPcCGO2gJIjMEWTWxs7ibOmIkJz
         QYRWeOSgRj46oQ0YQDkkSGPs/1NdZ6a+FXWNNP96NXRLr1/kXb3h9YWM1nPom4Cp9yZN
         nNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740156021; x=1740760821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeJTx/vmHBx5GNuwonywXW9ioDFWEnQJoc6Kq60Yt8U=;
        b=N2lTMEkqZeaP/tENzu7TmZZBwOjVvbm5k4RAwvHejq3Ajhtf4bgOjIolsxsJ4K3CMZ
         pvX2BgdeQ7j6dCUEyWMnSJtZKVTPhPIA7RVwcmFQfXq1hHXDUUjO0BC/zJM+VUVDnUMe
         VgYLgbLTV1KcN4Ktgrvc/kPU3NN+VwpZFdlO8/avZ+oAXh1pvXBYSukuwxRk3euYtdSY
         NJnw+ndS277UC2UXU57neWV9HkUirLoKnEim5i1B66tBfvJUz5cjcu7Lo1kJ+gfCWo0M
         VgebdxPPzMkxloIL82LEeJCMFTqOSSfVWpOw6sVBmR1+Ht3F/XZWaykcC4r+3h/rDGUB
         2CbA==
X-Forwarded-Encrypted: i=1; AJvYcCXTw2D3+PIYcnXuJsS5NQ/S8LADrInvesfklkkD2mu6j6qx2jem+usyRG3UrBPYOZ8raEudrQSC2HLkXRSC@vger.kernel.org
X-Gm-Message-State: AOJu0YycOIXGF6BUa61JJzs9jivoMRnLRlokMBP8JEqM6Zc2TwL2+LPI
	Dakb+yNcI0lVviag3l0qm+MHuUgwSdIif2nGLFXYLSvUEWNQFSgP3w8WALO5g+U=
X-Gm-Gg: ASbGnctj7r7el5nNdXeaEwOBCf/Ia9TqH1LT6gE0JI85/h20t3pHYORfpcEk+PQPpXx
	C4Oy2mvQjpNNrvkniGWNBwM4KgjJPowjaCgYSdNrYR9hOruNYbocJC/y+/Hktvpg2OBfplsqgkm
	Y70nV5CgF8qg0XVA4CT6+KuPhTzZh+EHKbbl1M2x/iN3iM9oQEZc3FQnO17J27j2J02X48x4NuI
	nwy5nDGWsly3TjIfxGniFqwvNGE8j88oiNIVx1kvdXruiRzLmb5Rrm7lPYIbvms/tH2ppHJ6J7g
	OzzPMjLSvkqAJdi15Iw8iui1XL80bYAkKJis5VgnQdiNgxhZloyFq1AZeIU6zY6wMCKcwwRSdeG
	rTvumYQ==
X-Google-Smtp-Source: AGHT+IG3sGSgu3fmfjjVa5dP0zopYhRJHZeGFgM+rQzAw/dbKCd7icrIJbdMAouX19sYLz/WmVSHOA==
X-Received: by 2002:a05:6512:e97:b0:544:11cf:10c1 with SMTP id 2adb3069b0e04-54838ef8ae9mr1535911e87.30.1740156021503;
        Fri, 21 Feb 2025 08:40:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54531815e02sm1992234e87.228.2025.02.21.08.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:40:20 -0800 (PST)
Date: Fri, 21 Feb 2025 18:40:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <kouoar4xfsyuxmxjg3pc5jkbddpc7kbyvdpqkwnzecuroilnra@4aa4cpdkr7gc>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-15-c11402574367@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-15-c11402574367@linaro.org>

On Mon, Feb 17, 2025 at 10:16:04PM +0800, Jun Nie wrote:
> To support high-resolution cases that exceed the width limitation of
> a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
> additional pipes are necessary to enable parallel data processing
> within the SSPP width constraints and MDP clock rate.
> 
> Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
> and dual interfaces are enabled. More use cases can be incorporated
> later if quad-pipe capabilities are required.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 28 insertions(+), 14 deletions(-)
> 

>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 64e220987be5682f26d02074505c5474a547a814..804858e69e7da1c8c67c725aa462c1a558d1b402 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -35,8 +35,8 @@
>  #endif
>  
>  #define STAGES_PER_PLANE		2
> -#define PIPES_PER_PLANE			2
>  #define PIPES_PER_STAGE			2
> +#define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)

This should be changes when STAGES_PER_PLANE is introduced. With that
fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>  #ifndef DPU_MAX_DE_CURVES
>  #define DPU_MAX_DE_CURVES		3
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

