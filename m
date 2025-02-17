Return-Path: <linux-arm-msm+bounces-48274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC67A38BE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 20:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0460816CB60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6EB235368;
	Mon, 17 Feb 2025 19:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Au0qDLfI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2A3235C1E
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739819132; cv=none; b=aEEv5aGNGLIZHGkoRCOjV5F6aniuz7au/G6/lAHiY2CDXiplA6ZYmsVeYvLXCPcxN9zwsrij6vgyNvCLFjCW7OUJbznIZzcWA4xIhFvXHEgg7ULR60+/F5rwLV2XAdM3BNBnfMmdayxUdOVX4ZiGdQjavxKy1AR35PaCM/QXZj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739819132; c=relaxed/simple;
	bh=uWj9xvnYhttiRunyS9x6npFqm7MB67cKebszu8LBe2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUX4ehC2IRbc0RBAMhRCmnLJkDJy2GA8+n2i0HeJN3z/851eTY0SV19MwNIttNDTWL9bO2UlXM3Ky5JLTztAkJQqdQVCqDKnMU2FH/r0R7GowO7jS44TDaofWdaX2119NKz4oOBFu4CWDvbc3sB2VANn7RUtRtA0jsJgYafzTbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Au0qDLfI; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-309311e7b39so21521821fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739819129; x=1740423929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ht4Pghdo7uLCRP78An2YAFjRBxhnNPD/6He7H1tEdog=;
        b=Au0qDLfIRBfpChgGy2zVvVeBGQs/41AVtxhkvNAJp+uFOUOBlfK6mkYQdEKXuud8Zj
         qI8eQY+q9c9TmPupSkExLWXUqpvnyOxQlYep3KmcIphVB6JU1mcKnA2j3pVkKtsCouyx
         cfWH9HxejBrnojkdWkjwdmWz1Xvq60NXrBRYrcUs8wHZjLDO42xp6tAPre1Tox7sfgHb
         2seMVeSC7rJbqosM8wGydvh8RbdHngPSLfZvv0PxffYlNzquF/3Su3t5BZSzAFb5D/0O
         F9Ta3iYgCPiqFANkdfIjg9Rc+ldYbughR3d0F8AIUVpTEI4IfrpuehXQ4TbVWBtao9D9
         A3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739819129; x=1740423929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht4Pghdo7uLCRP78An2YAFjRBxhnNPD/6He7H1tEdog=;
        b=n/uJLCgZdFZAvgCcJNXksrThDHyKAy9MJ9wwSH6AaiuLTgFHM6aVpCf3ozQP6y2NKm
         9HrnzVsW08vU60It7aFC45HVbJTW2xzHPdOV3yPt+plvPOYpfQ6wgLmG9HttKoJglacG
         psw/7KpIedwDgmc9stTynU8itCJaCl/GeBgBmO9Mx+OuvbCxipyzaLyS/LWoaX9Jhjlq
         zT+WaKXwCurJl9Lcm0uM0LHL2pCEa4MMdaYdCkfd9RP+BgAweg3tUOsjm+lkz4jNALHq
         DsJ0EVSOq9WC736z/k/MEWTy/LYSekutCXVyKcDhA/5SgbCdD7aHPWYFLU3Jb5OV2k9+
         cu+w==
X-Forwarded-Encrypted: i=1; AJvYcCVbW5NMrRh8l0uM7SB9evKhHaK1q97Q2bTK6BLnvCxMyn55LlRxS1ZFl0IMxI1grWcBCHIM+C9wPI4+z5lK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7tkeOlnuCuYkRJn8M7+3SlE3cNfP1H4mlAWXVvtf34vg5gxbX
	IO+MLpNTx/uun6ytp2qrka/UyKhBEUFeFEbp7s0gnV8vK40XvQUEAN7LPLl7YJQ=
X-Gm-Gg: ASbGncuTt6nWPCtPniA/vnBXGv8uCdeow7AEAGdDovRVXtAGwufvi/tqR24Gubex2BA
	23rSLx4CBWVMUETGoCV+f+OR+zl7cU/teLfxtJx2PFsccKGGAyTTMg7eu5y5q9oxco6a4Y6Kw0G
	5xH5RcqYPb/NlNwpAqi0GA8SsShGPFn1LKOjNJdx7QL2/RIhHEHqhm+SkmfD/6k302IUvCh1eA2
	b/Xnxb211xRrBO99s/X/S9kiuzuldkTXkK1ZAJXEn1Ouel1/HYoYr32JOlDqXaMelSNfYrvmVAL
	Ea8ewSuULpo0Sl/6V4V2xVCFWrJ+7nUGexMAjnXGC9OEy3qchNwMOQjWlEDrTEFP3KSN8V4=
X-Google-Smtp-Source: AGHT+IFEbhrM0nWi82cCaGvwSYXj6LdzEaAz+2hRFf9rrqKf6VFlvlNtTYi7/LSYD5QH5IDU/5M5yw==
X-Received: by 2002:a05:6512:108a:b0:545:5d:a5e2 with SMTP id 2adb3069b0e04-5452fe2b38amr3782879e87.10.1739819129100;
        Mon, 17 Feb 2025 11:05:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545d1b9c30fsm862532e87.15.2025.02.17.11.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:05:27 -0800 (PST)
Date: Mon, 17 Feb 2025 21:05:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 12/16] drm/msm/dsi: Add support for SM8750
Message-ID: <bvxw6btyefw67owjeke7edxk67dhq56ewu63cw57ckpupcunng@v7oq7knhaukm>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-12-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-12-d201dcdda6a4@linaro.org>

On Mon, Feb 17, 2025 at 05:41:33PM +0100, Krzysztof Kozlowski wrote:
> Add support for DSI on Qualcomm SM8750 SoC with notable difference:
> 
> DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> parents before DSI PHY is configured and the PLLs are prepared with
> initial rate is set.  Therefore assigned-clock-parents are not working
> here and driver is responsible for reparenting clocks with proper
> procedure: see dsi_clk_init_6g_v2_9().
> 
> Part of the change is exactly the same as CLK_OPS_PARENT_ENABLE, however
> CLK_OPS_PARENT_ENABLE won't work here because assigned-clock-parents are
> executed way too early - before DSI PHY is configured.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> SM8750 DSI PHY also needs Dmitry's patch:
> https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
> (or some other way of correct early setting of the DSI PHY PLL rate)
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h      |  2 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 25 ++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 80 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 108 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 87496db203d6c7582eadcb74e94eb56a219df292..93c028a122f3a59b1632da76472e0a3e781c6ae8 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -98,6 +98,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi);
>  int msm_dsi_runtime_suspend(struct device *dev);
>  int msm_dsi_runtime_resume(struct device *dev);
>  int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host);
> +int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host);
>  int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host);
>  int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
>  int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
> @@ -115,6 +116,7 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *iova);
>  int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
>  int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
>  int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
> +int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host);
>  int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>  int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>  void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 7754dcec33d06e3d6eb8a9d55e53f24af073adb9..e2a8d6fcc45b6c207a3018ea7c8744fcf34dabd2 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
>  	},
>  };
>  
> +static const struct msm_dsi_config sm8750_dsi_cfg = {

Can we use sm8650_dsi_cfg instead? What is the difference?

> +	.io_offset = DSI_6G_REG_SHIFT,
> +	.regulator_data = sm8650_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> +	.io_start = {
> +		{ 0xae94000, 0xae96000 },
> +	},
> +};
> +

The rest LGTM. I'm not very happy regarding the clock handling, but it
seems we jave to live with it.

-- 
With best wishes
Dmitry

