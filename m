Return-Path: <linux-arm-msm+bounces-34311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FDC99C76F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 12:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 236291F217E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45A81662F6;
	Mon, 14 Oct 2024 10:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X92Aws7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F97156C52
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728902852; cv=none; b=oxCkxat8/unqO2wAH1sSetelqtXpG8YBAUQz3ZItVmzQrngo1YPbex/J7b+TC1SRxxcsjkrGxqV6zKUWB0ksxqizYGlBQi7AaefL6o36v1ffTgOo/UQdyyVpkjd+QY8XVTHDWrPJ112NJa0Y4pC2FGsp87j9mhhmJaNmmfp9IkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728902852; c=relaxed/simple;
	bh=GQoN30v6xeUniaUmAdrrqgiNEguwDIR9337riEAAPUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oI8yL0/3Usu1+Anud5kSQNG838qtcgHz41CL70Bj4F3YhTeatnr78KQrI5qUmvXyG+tiaxEcfbQaYC7i+mj3DdMCub+KKQaPZMd3oCuUJg8CyY5UK1AIelY4LsF664tnHhCtmJx10/sJQ/hWviMcibiFcE/gRMeyxUqQL7MuW0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X92Aws7d; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f1292a9bso1144022e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728902848; x=1729507648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6SDoQlGqUW4/q2UyFAv11URldkrLbHnBQ1ea1jzpqWM=;
        b=X92Aws7dYfpKpPzi/uGNeGJipr+JslJezG6NagL6GXjHEEzl6146HXLUoennYD72o/
         gHiEjaC1P+hXBRRVXxywz9LcvvkVfvGv6l+e5PFsUXuJ/6+eWoPaPDzSsFOZa/rr5wuz
         No+vWD/cxmpP+LvNeoZDZHyV/c4FmSh8a4LR7DVC+guDkJ2gOGOYaAEUhA70+RMjLcEU
         XdcB5Cdr92lDu3i/qSHoidpNjc+TP03POk22KJcFpw2JEaiz+Vh4IpZWzB5E//mGm4qk
         3i0kI9LvqbUd9TMm/kf6kxOdQa1M0moKiqu/6p4u6AFP8TB86pjcMUKRzelxxMrd7e0C
         60iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728902848; x=1729507648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SDoQlGqUW4/q2UyFAv11URldkrLbHnBQ1ea1jzpqWM=;
        b=M8jvH9Xa2bnBZ4+DqniPir5vW620Z+fyCk5VijW1nKm+823XsUP1QfZWNuC644GN5A
         yT1GH8+PcIW8aWsx/dsIsRxLiPRJc1NVoA7zXItfzORsIwBEC3kCFm2l/5M5zkBzIf4b
         mDLETpkjp5M7CjU49QzudHCJhQVfQLAEmfL7tLdjzkJoRBenFAVz0cPrELA62FWTf5YV
         NkQxVr2S2OoA39m6TQ0q+bO2GtS1R/EDcL5UyrKlGU7R9lpg5sG0PrNI0D+LK8KVt4hE
         LC/1sXhyMhg0TzLG6+qtZcoqg7/FjWKcCr73m/66CKXop1B4XBZELkUPpXFMTVtcVjXn
         ezmg==
X-Forwarded-Encrypted: i=1; AJvYcCVzbU3rNpQhwOPYf/80KFWDmdcquqjCPGjF+ptrIYuVJeXsySoDxTgG3F52CgDF13gKP7TQstFjeu1ps89A@vger.kernel.org
X-Gm-Message-State: AOJu0YxpswhB4a+tNWe7GWYv21FxjK9dUEYoDcd+cvE/3x5WUtck+wf3
	nLcVkDip9c098OX76B7lc1ahbw32lEHNCQRbtQnEOmL0EGeoNq+Falq95Az+yKQ=
X-Google-Smtp-Source: AGHT+IGVt3NMmj486Ad2rxtgir0ap7PHOVer3crSxOktc0+TQH5QR7wNf2WXc1dqEszr9ukvu/VHKg==
X-Received: by 2002:a05:6512:3e21:b0:539:ebb6:7b36 with SMTP id 2adb3069b0e04-539ebb67d8cmr1935341e87.25.1728902847538;
        Mon, 14 Oct 2024 03:47:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539f49f5227sm465289e87.47.2024.10.14.03.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:47:26 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:47:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_fangez@quicinc.com
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/6] drm/msm/dpu: Add QCS615 support
Message-ID: <ezatn7e5sm74dd4xs4r4qnkcwouu3cu72vlvbbsrj42eca3dyo@xfmga7rpzspl>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-3-4efa191dbdd4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-3-4efa191dbdd4@quicinc.com>

On Mon, Oct 14, 2024 at 05:47:29PM +0800, fangez via B4 Relay wrote:
> From: lliu6 <quic_lliu6@quicinc.com>
> 
> Add support for the display hardware used on the Qualcomm QCS615 platform.

Not all hardware is described here, comment regarding the DP, etc.

> 
> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 268 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +

>  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  17 ++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +

These changes are not related to the DPU, which you listed as a prefix
in the commit message

>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++

These changes are not related to the DPU

>  drivers/gpu/drm/msm/msm_mdss.c                     |   7 +

These changes are not related to the DPU

For the whole patch: s/qcs615/sm6150/g

>  10 files changed, 320 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..ff7e390db2af9cded05e75b00a5778fdba2cf9ae
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h
> @@ -0,0 +1,268 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _DPU_5_3_QCS615_H
> +#define _DPU_5_3_QCS615_H
> +
> +static const struct dpu_caps qcs615_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x9,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = 2160,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> +	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +};
> +
> +static const struct dpu_mdp_cfg qcs615_mdp = {
> +	.name = "top_0",
> +	.base = 0x0, .len = 0x45c,
> +	.features = 0,
> +	.clk_ctrls = {
> +		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> +		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg qcs615_ctl[] = {
> +	{
> +		.name = "ctl_0", .id = CTL_0,
> +		.base = 0x1000, .len = 0x1e0,
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	}, {
> +		.name = "ctl_1", .id = CTL_1,
> +		.base = 0x1200, .len = 0x1e0,
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	}, {
> +		.name = "ctl_2", .id = CTL_2,
> +		.base = 0x1400, .len = 0x1e0,
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	}, {
> +		.name = "ctl_3", .id = CTL_3,
> +		.base = 0x1600, .len = 0x1e0,
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	}, {
> +		.name = "ctl_4", .id = CTL_4,
> +		.base = 0x1800, .len = 0x1e0,
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	}, {
> +		.name = "ctl_5", .id = CTL_5,
> +		.base = 0x1a00, .len = 0x1e0,
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg qcs615_sspp[] = {
> +	{
> +		.name = "sspp_0", .id = SSPP_VIG0,
> +		.base = 0x4000, .len = 0x1f0,
> +		.features = VIG_SDM845_MASK,//here

here what?

> +		.sblk = &dpu_vig_sblk_qseed3_2_4,
> +		.xin_id = 0,
> +		.type = SSPP_TYPE_VIG,
> +		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> +	}, {
> +		.name = "sspp_8", .id = SSPP_DMA0,
> +		.base = 0x24000, .len = 0x1f0,
> +		.features = DMA_SDM845_MASK,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 1,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA0,
> +	}, {
> +		.name = "sspp_9", .id = SSPP_DMA1,
> +		.base = 0x26000, .len = 0x1f0,
> +		.features = DMA_SDM845_MASK,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 5,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA1,
> +	}, {
> +		.name = "sspp_10", .id = SSPP_DMA2,
> +		.base = 0x28000, .len = 0x1f0,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 9,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA2,
> +	}, {
> +		.name = "sspp_11", .id = SSPP_DMA3,
> +		.base = 0x2a000, .len = 0x1f0,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 13,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA3,
> +	},
> +};
> +
> +static const struct dpu_lm_cfg qcs615_lm[] = {
> +	{
> +		.name = "lm_0", .id = LM_0,
> +		.base = 0x44000, .len = 0x320,
> +		.features = MIXER_QCM2290_MASK,
> +		.sblk = &sdm845_lm_sblk,
> +		.pingpong = PINGPONG_0,
> +		.dspp = DSPP_0,
> +		.lm_pair = LM_1,
> +	}, {
> +		.name = "lm_1", .id = LM_1,
> +		.base = 0x45000, .len = 0x320,
> +		.features = MIXER_QCM2290_MASK,
> +		.sblk = &sdm845_lm_sblk,
> +		.pingpong = PINGPONG_1,
> +		.dspp = 0,

No need to set absent blocks to 0.

> +		.lm_pair = LM_0,
> +	}, {
> +		.name = "lm_2", .id = LM_2,
> +		.base = 0x46000, .len = 0x320,
> +		.features = MIXER_QCM2290_MASK,
> +		.sblk = &sdm845_lm_sblk,
> +		.pingpong = PINGPONG_2,
> +		.dspp = 0,
> +	},
> +};
> +
> +static const struct dpu_dspp_cfg qcs615_dspp[] = {
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sdm845_dspp_sblk,
> +	},
> +};
> +
> +static const struct dpu_pingpong_cfg qcs615_pp[] = {
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x70000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.merge_3d = 0,

No merge_3d support at all? Then just don't say anything.

> +		.sblk = &sdm845_pp_sblk,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x70800, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.merge_3d = 0,
> +		.sblk = &sdm845_pp_sblk,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x71000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.merge_3d = 0,
> +		.sblk = &sdm845_pp_sblk,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +	},
> +};
> +
> +static const struct dpu_intf_cfg qcs615_intf[] = {
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x6a000, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x6a800, .len = 0x2c0,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x6b000, .len = 0x2c0,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_NONE,
> +		.controller_id = 0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x6b800, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +	},
> +};
> +
> +static const struct dpu_perf_cfg qcs615_perf_data = {//here
> +	.max_bw_low = 4800000,
> +	.max_bw_high = 4800000,
> +	.min_core_ib = 2400000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 800000,
> +	.min_prefill_lines = 24,
> +	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
> +		.entries = sm8150_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> +		.entries = sc7180_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +		.entries = sc7180_qos_nrt
> +		},
> +		/* TODO: macrotile-qseed is different from macrotile */
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
> +static const struct dpu_mdss_version qcs615_mdss_ver = {
> +	.core_major_ver = 5,
> +	.core_minor_ver = 3,
> +};
> +
> +const struct dpu_mdss_cfg dpu_qcs615_cfg = {
> +	.mdss_ver = &qcs615_mdss_ver,
> +	.caps = &qcs615_dpu_caps,
> +	.mdp = &qcs615_mdp,
> +	.ctl_count = ARRAY_SIZE(qcs615_ctl),
> +	.ctl = qcs615_ctl,
> +	.sspp_count = ARRAY_SIZE(qcs615_sspp),
> +	.sspp = qcs615_sspp,
> +	.mixer_count = ARRAY_SIZE(qcs615_lm),
> +	.mixer = qcs615_lm,
> +	.dspp_count = ARRAY_SIZE(qcs615_dspp),
> +	.dspp = qcs615_dspp,
> +	.pingpong_count = ARRAY_SIZE(qcs615_pp),
> +	.pingpong = qcs615_pp,
> +	.intf_count = ARRAY_SIZE(qcs615_intf),
> +	.intf = qcs615_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.perf = &qcs615_perf_data,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index dcb4fd85e73b9cc05e669043602d69229881c0b4..4b07de941e5855ea9fb1f330130d0bebc760a865 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -685,6 +685,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>  #include "catalog/dpu_5_0_sm8150.h"
>  #include "catalog/dpu_5_1_sc8180x.h"
>  #include "catalog/dpu_5_2_sm7150.h"
> +#include "catalog/dpu_5_3_qcs615.h"
>  #include "catalog/dpu_5_4_sm6125.h"
>  
>  #include "catalog/dpu_6_0_sm8250.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 37e18e820a20a4c4ab9a97da78df19a2ff7cfa00..8e3406ca7cb92dd4a42a7d69d4f57393a0be044a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -843,6 +843,7 @@ extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
>  extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm6125_cfg;
> +extern const struct dpu_mdss_cfg dpu_qcs615_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>  extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm6375_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 9bcae53c4f458cd8e400f0e851b791c0f4165085..afa9c04fa9c87b3805ea03fc5f478fcb02cba077 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1457,6 +1457,7 @@ static const struct of_device_id dpu_dt_match[] = {
>  	{ .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>  	{ .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
>  	{ .compatible = "qcom,sm6125-dpu", .data = &dpu_sm6125_cfg, },
> +	{ .compatible = "qcom,qcs615-dpu", .data = &dpu_qcs615_cfg, },
>  	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
>  	{ .compatible = "qcom,sm6375-dpu", .data = &dpu_sm6375_cfg, },
>  	{ .compatible = "qcom,sm7150-dpu", .data = &dpu_sm7150_cfg, },
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..38bcd999b97350d7b5b2a54f1c4f6534dc17ec36 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -221,6 +221,21 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>  	},
>  };
>  
> +static const struct regulator_bulk_data qcs615_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 21800 },
> +};

NAK, this is not a correct description. You missed one of the supplies.

> +
> +static const struct msm_dsi_config qcs615_dsi_cfg = {
> +	.io_offset = DSI_6G_REG_SHIFT,
> +	.regulator_data = qcs615_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(qcs615_dsi_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> +	.io_start = {
> +		{ 0xae94000 },
> +	},
> +};
> +
>  static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
>  	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
>  	.link_clk_enable = dsi_link_clk_enable_v2,
> @@ -298,6 +313,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>  		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
>  		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_1,
> +		&qcs615_dsi_cfg, &msm_dsi_6g_v2_host_ops},

The lsit is sorted.

>  };
>  
>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 4c9b4b37681b066dbbc34876c38d99deee24fc82..120cb65164c1ba1deb9acb513e5f073bd560c496 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -23,6 +23,7 @@
>  #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
>  #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
>  #define MSM_DSI_6G_VER_MINOR_V2_3_0	0x20030000
> +#define MSM_DSI_6G_VER_MINOR_V2_3_1	0x20030001
>  #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
>  #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
>  #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index dd58bc0a49eb5ca96370f7832d9251609ac0c552..9ada01d9d43828473501dbb2e7d2272b9dd88e08 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -567,6 +567,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  	  .data = &dsi_phy_14nm_8953_cfgs },
>  	{ .compatible = "qcom,sm6125-dsi-phy-14nm",
>  	  .data = &dsi_phy_14nm_2290_cfgs },
> +	{ .compatible = "qcom,qcs615-dsi-phy-14nm",
> +	  .data = &dsi_phy_14nm_615_cfgs },

Sorted list

>  #endif
>  #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
>  	{ .compatible = "qcom,dsi-phy-10nm",
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 4953459edd636363614ecad85654614fc95cfa1d..7f2e82a36a93cdd8e80aca293d94ae1566d8aebd 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -49,6 +49,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_14nm_615_cfgs;

Keep it sorted, also it's not 615. It is qcs615, ergo sm6150.

>  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 1723f0e4faa4e4fd612d66f9976e80e045eafcc8..42a1c76a25f54be4c8fa799994901e7fd7cfb9d9 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1032,6 +1032,10 @@ static const struct regulator_bulk_data dsi_phy_14nm_73p4mA_regulators[] = {
>  	{ .supply = "vcca", .init_load_uA = 73400 },
>  };
>  
> +static const struct regulator_bulk_data dsi_phy_14nm_36mA_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 36000 },
> +};
> +
>  const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
>  	.has_phy_lane = true,
>  	.regulator_data = dsi_phy_14nm_17mA_regulators,
> @@ -1097,3 +1101,20 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs = {
>  	.io_start = { 0x5e94400 },
>  	.num_dsi_phy = 1,
>  };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_14nm_615_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_14nm_36mA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_14nm_36mA_regulators),
> +	.ops = {
> +		.enable = dsi_14nm_phy_enable,
> +		.disable = dsi_14nm_phy_disable,
> +		.pll_init = dsi_pll_14nm_init,
> +		.save_pll_state = dsi_14nm_pll_save_state,
> +		.restore_pll_state = dsi_14nm_pll_restore_state,
> +	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
> +	.io_start = { 0xae94400 },
> +	.num_dsi_phy = 1,
> +};
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index faa88fd6eb4d6aec383a242b66a2b5125c91b3bc..d50459090920b85b12d8961985313a172ffcd875 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -662,6 +662,12 @@ static const struct msm_mdss_data sm6125_data = {
>  	.highest_bank_bit = 1,
>  };
>  
> +static const struct msm_mdss_data qcs615_data = {
> +	.ubwc_enc_version = UBWC_2_0,
> +	.ubwc_dec_version = UBWC_2_0,
> +	.highest_bank_bit = 1,

missing reg_bus_bw

> +};
> +
>  static const struct msm_mdss_data sm8250_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> @@ -718,6 +724,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
>  	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
>  	{ .compatible = "qcom,sm6125-mdss", .data = &sm6125_data },
> +	{ .compatible = "qcom,qcs615-mdss", .data = &qcs615_data },
>  	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
>  	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
>  	{ .compatible = "qcom,sm7150-mdss", .data = &sm7150_data },
> 
> -- 
> 2.25.1
> 
> 

-- 
With best wishes
Dmitry

