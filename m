Return-Path: <linux-arm-msm+bounces-48773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B82A3E8A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 00:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8923A17D64A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 23:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2E32676EE;
	Thu, 20 Feb 2025 23:37:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124CD2676CA;
	Thu, 20 Feb 2025 23:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740094667; cv=none; b=PtGI3UMdxHV/ehIp2YLsJgdsiR0l9O24XGpcOWsDtOy9baK0lD3q66m3aYc9Nc8Mds1xl8eVTgkvfIQaz+XWMJRaPZjaJyJZuwANEWg3DNt63eBYVQTu7sAO/rXpNzkAo4bL4OWZDASfyY9Ec68QbqinJ99XBFr3AT2VS0NcrdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740094667; c=relaxed/simple;
	bh=TgaIkXf7hfN2T0N/mAqyrN4TIxHOV9mkadMuc3wJ5F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9FKoNNfSPRxm9H5g634i4rZn2UK3oLoCQVoxX1GUH+dy4SqrOQdQwluE3KImdG8qekUHrOYRYfN0iJUfesHMcK/Aq8XjaZb93I/SdDnn5CjwHEphOmrzNhRq2bukQlQaeHUdntfOnD7LUonTw6dua76diLMnB8uiy3cDcbNNXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E10301F8D8;
	Fri, 21 Feb 2025 00:37:41 +0100 (CET)
Date: Fri, 21 Feb 2025 00:37:40 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL
 blocks on DPU >= 5.0
Message-ID: <45evxcbkcenkoiufh6vqpq5ngfz3mz62evvjxehmqgp5sd4lo3@a5swxugzf4fm>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
 <20250220-dpu-active-ctl-v1-7-71ca67a564f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-dpu-active-ctl-v1-7-71ca67a564f8@linaro.org>

On 2025-02-20 12:26:24, Dmitry Baryshkov wrote:
> Since DPU 5.0 CTL blocks do not require DPU_CTL_SPLIT_DISPLAY, as single
> CTL is used for both interfaces. As both RM and encoder now handle
> active CTLs, drop that feature bit.

I was wondering if this bit only existed to ensure the right "pair" of CTLs
exist: not on DPU 4.0, but on DPU 3.0 we see that CTL_0 and CTL_2 have this bit
but not CTL_1.  Meaning that split display can only work when that specific pair
of CTL_0 and CTL_2 is used in conjunction?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 5 ++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 5 ++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 5 ++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 5 ++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 ++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 5 ++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 5 ++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 5 ++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 5 ++---
>  11 files changed, 22 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index bcb39807fe61e231d6e318d8729ed86f213fb06a..a705e3e761d9a578777cd03011e90df8002127a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -27,17 +27,16 @@ static const struct dpu_mdp_cfg sm8650_mdp = {
>  	},
>  };
>  
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sm8650_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x15000, .len = 0x1000,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x16000, .len = 0x1000,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 421afacb7248039abd9fb66bcb73b756ae0d640a..bf4ff275bba4320e70acf516cb784b1bdd0cf966 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -37,17 +37,16 @@ static const struct dpu_mdp_cfg sm8150_mdp = {
>  	},
>  };
>  
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sm8150_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 641023b102bf59352546f0782d9264986367de78..7ec4fd702fd2f37e2e6a5758154d14967ba11504 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -41,12 +41,12 @@ static const struct dpu_ctl_cfg sc8180x_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> index 2fe674d1e05988f39f66a01fedee96113437ea65..0d102888741a0c61ac547ec568e44c1e91350835 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> @@ -38,12 +38,12 @@ static const struct dpu_ctl_cfg sm7150_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index e8916ae826a6daf30eb08de53521dae89c07636c..3da26970426f9672c34f213064cdb8eff8c18da5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -35,17 +35,16 @@ static const struct dpu_mdp_cfg sm8250_mdp = {
>  	},
>  };
>  
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sm8250_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index f7c08e89c882038aa658955ca1202bda3d928e80..16fbfea01e3272229c817db480b86c1a715d5c4a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -35,17 +35,16 @@ static const struct dpu_mdp_cfg sm8350_mdp = {
>  	},
>  };
>  
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sm8350_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x15000, .len = 0x1e8,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x16000, .len = 0x1e8,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 0d143e390eca964b1c81f835d0904a2079b0b941..e6f2a8665ea2598ca5a813158ba1cdd9f491a41f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -35,17 +35,16 @@ static const struct dpu_mdp_cfg sc8280xp_mdp = {
>  	},
>  };
>  
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x15000, .len = 0x204,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x16000, .len = 0x204,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 08742472f9cc812fbaf8f842ff7bd78f597e2b8d..bac75783063fd5588bc1cc19cb79f11cb0431bb8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -36,17 +36,16 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
>  	},
>  };
>  
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sm8450_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x15000, .len = 0x204,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x16000, .len = 0x204,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index 76ec72a323781363d37b62fec752ea1232bbd75b..2b36c438bc8a22e2650f1d546d0259f8c6e747b4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -35,17 +35,16 @@ static const struct dpu_mdp_cfg sa8775p_mdp = {
>  	},
>  };
>  
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sa8775p_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x15000, .len = 0x204,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x16000, .len = 0x204,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 4d3787fceb72fb3641057a7ea04ae6503b671042..5e0d2e8aabbaa406e332024676c5eb8205fec177 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -27,17 +27,16 @@ static const struct dpu_mdp_cfg sm8550_mdp = {
>  	},
>  };
>  
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sm8550_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index 6b112e3d17da6a4423851525262b66aa6c8622e3..a500a38ce07b84c2c9ad51aaf5847ee0bbcc72a5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -26,17 +26,16 @@ static const struct dpu_mdp_cfg x1e80100_mdp = {
>  	},
>  };
>  
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg x1e80100_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> 
> -- 
> 2.39.5
> 

