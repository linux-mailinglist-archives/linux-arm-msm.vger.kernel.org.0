Return-Path: <linux-arm-msm+bounces-32686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98E988878
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 17:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CF111C20D63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 15:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2959E18A959;
	Fri, 27 Sep 2024 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nwW0wHMi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526821E4AE;
	Fri, 27 Sep 2024 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727451889; cv=none; b=G82zfE53nPBeXzhUUeCOM5d5p2KYctHH6JgF2kMAKoyODdjP5N4IlacQNB4LjXTthX+dvXLwD+Y650+Ic1MmqvApxmSzkvZGKVg+vFFcD8kC1V9Bu9QymXXnkawIcDaqvABBR3cc3KF/3627eucCzQPvvBq6rZyfv+DfECunXOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727451889; c=relaxed/simple;
	bh=Amu4yPiQMJu0QXcGSZ13FakxwosI1cwc0GxYiGLXj2s=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=RoAsF2jolLz35hltkgDQdejPZeYqdewsVjTedPMIwzKoaynyJs7OgQMx033CtNWvz+EydbPK+adEr/rFELNWvQw63bHG7BpDXM0R2zdgW5qV3LQpm/OdNVgyZjrFZECKcFSImIMxrN8VGqf3HQbTM2riQGn+UYf/sEIxuPMYQ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nwW0wHMi; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id 92558E450F;
	Fri, 27 Sep 2024 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1727451883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u6aIqGvdozOC+CFXvI/Vj/wiEIvoDtL6WVLpPR7n4XI=;
	b=nwW0wHMiOwiVUY0fp8u007e1bb5ytgMkYek+DmUY8IKT4sZl57fGpCRzR15bDuS2rzJFS9
	4ifYaXqgXkgN9jh/spQr0F7GmNFXp5PEuAg3GhwxDeXiqiLCrZya+WWGkR61NpHyQGYG+s
	YamC7AYa1aRnP9VGCOTz/TboZsvcy2LTuzBXUOipojp9ZPp1QfNblepCdTGdP3qhqaZ0kR
	t+6YN45ibEEjL/P9y19aj8oJ3kxqT5KnemC23rUQ4EWo2xnGFdj9ceUbNkQiWVPH+Ga4cS
	SfsHwsZDiHZItEueB4sSrarKMVDXx2lqTxLLtsAaWBapEI49PLzWVXShpnC6CQ==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 17:44:43 +0200
From: barnabas.czeman@mainlining.org
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Konrad Dybcio
 <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] drm/msm/dpu: Add MSM8996 support
In-Reply-To: <540ce2add6b1975502e898cc332275a6248aa1bc.camel@icenowy.me>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <20240628-dpu-msm8953-msm8996-v1-1-a31c77248db7@mainlining.org>
 <540ce2add6b1975502e898cc332275a6248aa1bc.camel@icenowy.me>
Message-ID: <dd94e7fb72cf85800fbd46758010ea64@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-08-18 09:16, Icenowy Zheng wrote:
> 在 2024-06-28星期五的 16:39 +0200，Barnabás Czémán写道：
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>> 
>> Add support for MSM8996, which - fun fact - was the SoC that this
>> driver
>> (or rather SDE, its downstream origin) was meant for and first tested
>> on.
>> 
>> It has some hardware that differs from the modern SoCs, so not a lot
>> of
>> current structs could have been reused. It's also seemingly the only
>> SoC
>> supported by DPU that uses RGB pipes.
>> 
>> Note, by default this platform is still handled by the MDP5 driver
>> unless the `msm.prefer_mdp5=false' parameter is provided.
> 
> For curiosity, will this driver makes DSC possible on MSM8996?
As far as i know yes, but if i know correctly there are some DSC
support also in MDP5.
> 
> I think the Google Pixel device uses a panel that needs DSC, which
> makes mainlining it currently impossible.
> 
>> 
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> [DB: rebased on top of sblk changes, add dpu_rgb_sblk]
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> [Removed intr_start from CTLs config]
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 348
>> +++++++++++++++++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  94 ++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>  drivers/gpu/drm/msm/msm_drv.c                      |   1 +
>>  5 files changed, 445 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
>> new file mode 100644
>> index 000000000000..29d0cfacf7a9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
>> @@ -0,0 +1,348 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2023, Linaro Limited
>> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights
>> reserved.
>> + */
>> +
>> +#ifndef _DPU_1_7_MSM8996_H
>> +#define _DPU_1_7_MSM8996_H
>> +
>> +static const struct dpu_caps msm8996_dpu_caps = {
>> +       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +       .max_mixer_blendstages = 0x7,
>> +       .has_src_split = true,
>> +       .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>> +       .max_hdeci_exp = MAX_HORZ_DECIMATION,
>> +       .max_vdeci_exp = MAX_VERT_DECIMATION,
>> +};
>> +
>> +static const struct dpu_mdp_cfg msm8996_mdp[] = {
>> +       {
>> +               .name = "top_0",
>> +               .base = 0x0, .len = 0x454,
>> +               .features = BIT(DPU_MDP_VSYNC_SEL),
>> +               .clk_ctrls = {
>> +                       [DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac,
>> .bit_off = 0 },
>> +                       [DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4,
>> .bit_off = 0 },
>> +                       [DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc,
>> .bit_off = 0 },
>> +                       [DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4,
>> .bit_off = 0 },
>> +                       [DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac,
>> .bit_off = 4 },
>> +                       [DPU_CLK_CTRL_RGB1] = { .reg_off = 0x2b4,
>> .bit_off = 4 },
>> +                       [DPU_CLK_CTRL_RGB2] = { .reg_off = 0x2bc,
>> .bit_off = 4 },
>> +                       [DPU_CLK_CTRL_RGB3] = { .reg_off = 0x2c4,
>> .bit_off = 4 },
>> +                       [DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac,
>> .bit_off = 8 },
>> +                       [DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4,
>> .bit_off = 8 },
>> +                       [DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8,
>> .bit_off = 16 },
>> +                       [DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x3b0,
>> .bit_off = 16 },
>> +               },
>> +       },
>> +};
>> +
>> +static const struct dpu_ctl_cfg msm8996_ctl[] = {
>> +       {
>> +               .name = "ctl_0", .id = CTL_0,
>> +               .base = 0x1000, .len = 0x64,
>> +       }, {
>> +               .name = "ctl_1", .id = CTL_1,
>> +               .base = 0x1200, .len = 0x64,
>> +       }, {
>> +               .name = "ctl_2", .id = CTL_2,
>> +               .base = 0x1400, .len = 0x64,
>> +       }, {
>> +               .name = "ctl_3", .id = CTL_3,
>> +               .base = 0x1600, .len = 0x64,
>> +       }, {
>> +               .name = "ctl_4", .id = CTL_4,
>> +               .base = 0x1800, .len = 0x64,
>> +       },
>> +};
>> +
>> +static const struct dpu_sspp_cfg msm8996_sspp[] = {
>> +       {
>> +               .name = "sspp_0", .id = SSPP_VIG0,
>> +               .base = 0x4000, .len = 0x150,
>> +               .features = VIG_MSM8996_MASK,
>> +               .sblk = &dpu_vig_sblk_qseed2,
>> +               .xin_id = 0,
>> +               .type = SSPP_TYPE_VIG,
>> +               .clk_ctrl = DPU_CLK_CTRL_VIG0,
>> +       }, {
>> +               .name = "sspp_1", .id = SSPP_VIG1,
>> +               .base = 0x6000, .len = 0x150,
>> +               .features = VIG_MSM8996_MASK,
>> +               .sblk = &dpu_vig_sblk_qseed2,
>> +               .xin_id = 4,
>> +               .type = SSPP_TYPE_VIG,
>> +               .clk_ctrl = DPU_CLK_CTRL_VIG1,
>> +       }, {
>> +               .name = "sspp_2", .id = SSPP_VIG2,
>> +               .base = 0x8000, .len = 0x150,
>> +               .features = VIG_MSM8996_MASK,
>> +               .sblk = &dpu_vig_sblk_qseed2,
>> +               .xin_id = 8,
>> +               .type = SSPP_TYPE_VIG,
>> +               .clk_ctrl = DPU_CLK_CTRL_VIG2,
>> +       }, {
>> +               .name = "sspp_3", .id = SSPP_VIG3,
>> +               .base = 0xa000, .len = 0x150,
>> +               .features = VIG_MSM8996_MASK,
>> +               .sblk = &dpu_vig_sblk_qseed2,
>> +               .xin_id = 12,
>> +               .type = SSPP_TYPE_VIG,
>> +               .clk_ctrl = DPU_CLK_CTRL_VIG3,
>> +       }, {
>> +               .name = "sspp_4", .id = SSPP_RGB0,
>> +               .base = 0x14000, .len = 0x150,
>> +               .features = RGB_MSM8996_MASK,
>> +               .sblk = &dpu_rgb_sblk,
>> +               .xin_id = 1,
>> +               .type = SSPP_TYPE_RGB,
>> +               .clk_ctrl = DPU_CLK_CTRL_RGB0,
>> +       }, {
>> +               .name = "sspp_5", .id = SSPP_RGB1,
>> +               .base = 0x16000, .len = 0x150,
>> +               .features = RGB_MSM8996_MASK,
>> +               .sblk = &dpu_rgb_sblk,
>> +               .xin_id = 5,
>> +               .type = SSPP_TYPE_RGB,
>> +               .clk_ctrl = DPU_CLK_CTRL_RGB1,
>> +       }, {
>> +               .name = "sspp_6", .id = SSPP_RGB2,
>> +               .base = 0x18000, .len = 0x150,
>> +               .features = RGB_MSM8996_MASK,
>> +               .sblk = &dpu_rgb_sblk,
>> +               .xin_id = 9,
>> +               .type = SSPP_TYPE_RGB,
>> +               .clk_ctrl = DPU_CLK_CTRL_RGB2,
>> +       }, {
>> +               .name = "sspp_7", .id = SSPP_RGB3,
>> +               .base = 0x1a000, .len = 0x150,
>> +               .features = RGB_MSM8996_MASK,
>> +               .sblk = &dpu_rgb_sblk,
>> +               .xin_id = 13,
>> +               .type = SSPP_TYPE_RGB,
>> +               .clk_ctrl = DPU_CLK_CTRL_RGB3,
>> +       }, {
>> +               .name = "sspp_8", .id = SSPP_DMA0,
>> +               .base = 0x24000, .len = 0x150,
>> +               .features = DMA_MSM8996_MASK,
>> +               .sblk = &dpu_dma_sblk,
>> +               .xin_id = 2,
>> +               .type = SSPP_TYPE_DMA,
>> +               .clk_ctrl = DPU_CLK_CTRL_DMA0,
>> +       }, {
>> +               .name = "sspp_9", .id = SSPP_DMA1,
>> +               .base = 0x26000, .len = 0x150,
>> +               .features = DMA_MSM8996_MASK,
>> +               .sblk = &dpu_dma_sblk,
>> +               .xin_id = 10,
>> +               .type = SSPP_TYPE_DMA,
>> +               .clk_ctrl = DPU_CLK_CTRL_DMA1,
>> +       },
>> +};
>> +
>> +static const struct dpu_lm_cfg msm8996_lm[] = {
>> +       {
>> +               .name = "lm_0", .id = LM_0,
>> +               .base = 0x44000, .len = 0x320,
>> +               .features = MIXER_MSM8998_MASK,
>> +               .sblk = &msm8998_lm_sblk,
>> +               .lm_pair = LM_1,
>> +               .pingpong = PINGPONG_0,
>> +               .dspp = DSPP_0,
>> +       }, {
>> +               .name = "lm_1", .id = LM_1,
>> +               .base = 0x45000, .len = 0x320,
>> +               .features = MIXER_MSM8998_MASK,
>> +               .sblk = &msm8998_lm_sblk,
>> +               .lm_pair = LM_0,
>> +               .pingpong = PINGPONG_1,
>> +               .dspp = DSPP_1,
>> +       }, {
>> +               .name = "lm_2", .id = LM_2,
>> +               .base = 0x46000, .len = 0x320,
>> +               .features = MIXER_MSM8998_MASK,
>> +               .sblk = &msm8998_lm_sblk,
>> +               .lm_pair = LM_5,
>> +               .pingpong = PINGPONG_2,
>> +       }, {
>> +               .name = "lm_3", .id = LM_3,
>> +               .base = 0x47000, .len = 0x320,
>> +               .features = MIXER_MSM8998_MASK,
>> +               .sblk = &msm8998_lm_sblk,
>> +       }, {
>> +               .name = "lm_4", .id = LM_4,
>> +               .base = 0x48000, .len = 0x320,
>> +               .features = MIXER_MSM8998_MASK,
>> +               .sblk = &msm8998_lm_sblk,
>> +       }, {
>> +               .name = "lm_5", .id = LM_5,
>> +               .base = 0x49000, .len = 0x320,
>> +               .features = MIXER_MSM8998_MASK,
>> +               .sblk = &msm8998_lm_sblk,
>> +               .lm_pair = LM_2,
>> +               .pingpong = PINGPONG_3,
>> +       },
>> +};
>> +
>> +static const struct dpu_pingpong_cfg msm8996_pp[] = {
>> +       {
>> +               .name = "pingpong_0", .id = PINGPONG_0,
>> +               .base = 0x70000, .len = 0xd4,
>> +               .features = PINGPONG_MSM8996_TE2_MASK,
>> +               .sblk = &msm8996_pp_sblk_te,
>> +               .intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>> +               .intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
>> +       }, {
>> +               .name = "pingpong_1", .id = PINGPONG_1,
>> +               .base = 0x70800, .len = 0xd4,
>> +               .features = PINGPONG_MSM8996_TE2_MASK,
>> +               .sblk = &msm8996_pp_sblk_te,
>> +               .intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>> +               .intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
>> +       }, {
>> +               .name = "pingpong_2", .id = PINGPONG_2,
>> +               .base = 0x71000, .len = 0xd4,
>> +               .features = PINGPONG_MSM8996_MASK,
>> +               .sblk = &msm8996_pp_sblk,
>> +               .intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>> +               .intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
>> +       }, {
>> +               .name = "pingpong_3", .id = PINGPONG_3,
>> +               .base = 0x71800, .len = 0xd4,
>> +               .features = PINGPONG_MSM8996_MASK,
>> +               .sblk = &msm8996_pp_sblk,
>> +               .intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>> +               .intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
>> +       },
>> +};
>> +
>> +static const struct dpu_dsc_cfg msm8996_dsc[] = {
>> +       {
>> +               .name = "dsc_0", .id = DSC_0,
>> +               .base = 0x80000, .len = 0x140,
>> +       }, {
>> +               .name = "dsc_1", .id = DSC_1,
>> +               .base = 0x80400, .len = 0x140,
>> +       },
>> +};
>> +
>> +static const struct dpu_dspp_cfg msm8996_dspp[] = {
>> +       {
>> +               .name = "dspp_0", .id = DSPP_0,
>> +               .base = 0x54000, .len = 0x1800,
>> +               .features = DSPP_SC7180_MASK,
>> +               .sblk = &msm8998_dspp_sblk,
>> +       }, {
>> +               .name = "dspp_1", .id = DSPP_1,
>> +               .base = 0x56000, .len = 0x1800,
>> +               .features = DSPP_SC7180_MASK,
>> +               .sblk = &msm8998_dspp_sblk,
>> +       },
>> +};
>> +
>> +static const struct dpu_intf_cfg msm8996_intf[] = {
>> +       {
>> +               .name = "intf_0", .id = INTF_0,
>> +               .base = 0x6a000, .len = 0x268,
>> +               .type = INTF_NONE,
>> +               .prog_fetch_lines_worst_case = 25,
>> +               .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>> +               .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
>> +               .intr_tear_rd_ptr = -1,
>> +       }, {
>> +               .name = "intf_1", .id = INTF_1,
>> +               .base = 0x6a800, .len = 0x268,
>> +               .type = INTF_DSI,
>> +               .controller_id = MSM_DSI_CONTROLLER_0,
>> +               .prog_fetch_lines_worst_case = 25,
>> +               .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> +               .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +               .intr_tear_rd_ptr = -1,
>> +       }, {
>> +               .name = "intf_2", .id = INTF_2,
>> +               .base = 0x6b000, .len = 0x268,
>> +               .type = INTF_DSI,
>> +               .controller_id = MSM_DSI_CONTROLLER_1,
>> +               .prog_fetch_lines_worst_case = 25,
>> +               .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>> +               .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
>> +               .intr_tear_rd_ptr = -1,
>> +       }, {
>> +               .name = "intf_3", .id = INTF_3,
>> +               .base = 0x6b800, .len = 0x268,
>> +               .type = INTF_HDMI,
>> +               .prog_fetch_lines_worst_case = 25,
>> +               .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>> +               .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
>> +               .intr_tear_rd_ptr = -1,
>> +       },
>> +};
>> +
>> +static const struct dpu_perf_cfg msm8996_perf_data = {
>> +       .max_bw_low = 9600000,
>> +       .max_bw_high = 9600000,
>> +       .min_core_ib = 2400000,
>> +       .min_llcc_ib = 0, /* No LLCC on this SoC */
>> +       .min_dram_ib = 800000,
>> +       .undersized_prefill_lines = 2,
>> +       .xtra_prefill_lines = 2,
>> +       .dest_scale_prefill_lines = 3,
>> +       .macrotile_prefill_lines = 4,
>> +       .yuv_nv12_prefill_lines = 8,
>> +       .linear_prefill_lines = 1,
>> +       .downscaling_prefill_lines = 1,
>> +       .amortizable_threshold = 25,
>> +       .min_prefill_lines = 21,
>> +       .danger_lut_tbl = {0xf, 0xffff, 0x0},
>> +       .safe_lut_tbl = {0xfffc, 0xff00, 0xffff},
>> +       .qos_lut_tbl = {
>> +               {.nentry = ARRAY_SIZE(msm8998_qos_linear),
>> +               .entries = msm8998_qos_linear
>> +               },
>> +               {.nentry = ARRAY_SIZE(msm8998_qos_macrotile),
>> +               .entries = msm8998_qos_macrotile
>> +               },
>> +               {.nentry = ARRAY_SIZE(msm8998_qos_nrt),
>> +               .entries = msm8998_qos_nrt
>> +               },
>> +       },
>> +       .cdp_cfg = {
>> +               {.rd_enable = 1, .wr_enable = 1},
>> +               {.rd_enable = 1, .wr_enable = 0}
>> +       },
>> +       .clk_inefficiency_factor = 105,
>> +       .bw_inefficiency_factor = 120,
>> +};
>> +
>> +static const struct dpu_mdss_version msm8996_mdss_ver = {
>> +       .core_major_ver = 1,
>> +       .core_minor_ver = 7,
>> +};
>> +
>> +const struct dpu_mdss_cfg dpu_msm8996_cfg = {
>> +       .mdss_ver = &msm8996_mdss_ver,
>> +       .caps = &msm8996_dpu_caps,
>> +       .mdp = msm8996_mdp,
>> +       .ctl_count = ARRAY_SIZE(msm8996_ctl),
>> +       .ctl = msm8996_ctl,
>> +       .sspp_count = ARRAY_SIZE(msm8996_sspp),
>> +       .sspp = msm8996_sspp,
>> +       .mixer_count = ARRAY_SIZE(msm8996_lm),
>> +       .mixer = msm8996_lm,
>> +       .dspp_count = ARRAY_SIZE(msm8996_dspp),
>> +       .dspp = msm8996_dspp,
>> +       .pingpong_count = ARRAY_SIZE(msm8996_pp),
>> +       .pingpong = msm8996_pp,
>> +       .dsc_count = ARRAY_SIZE(msm8996_dsc),
>> +       .dsc = msm8996_dsc,
>> +       .intf_count = ARRAY_SIZE(msm8996_intf),
>> +       .intf = msm8996_intf,
>> +       .vbif_count = ARRAY_SIZE(msm8996_vbif),
>> +       .vbif = msm8996_vbif,
>> +       .perf = &msm8996_perf_data,
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index fc178ec73907..da7b75e09251 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -21,6 +21,11 @@
>>         (VIG_BASE_MASK | \
>>         BIT(DPU_SSPP_CSC_10BIT))
>>  
>> +#define VIG_MSM8996_MASK \
>> +       (BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_CDP) |\
>> +        BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_SCALER_QSEED2) |\
>> +        BIT(DPU_SSPP_CSC))
>> +
>>  #define VIG_MSM8998_MASK \
>>         (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
>>  
>> @@ -32,6 +37,9 @@
>>  
>>  #define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
>>  
>> +#define DMA_MSM8996_MASK \
>> +       (BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_TS_PREFILL) |
>> BIT(DPU_SSPP_CDP))
>> +
>>  #define DMA_MSM8998_MASK \
>>         (BIT(DPU_SSPP_QOS) |\
>>         BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>> @@ -57,9 +65,16 @@
>>  #define DMA_CURSOR_SDM845_MASK_SDMA \
>>         (DMA_CURSOR_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
>>  
>> +#define DMA_CURSOR_MSM8996_MASK \
>> +       (DMA_MSM8996_MASK | BIT(DPU_SSPP_CURSOR))
>> +
>>  #define DMA_CURSOR_MSM8998_MASK \
>>         (DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
>>  
>> +#define RGB_MSM8996_MASK \
>> +       (BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_CDP) |\
>> +        BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_SCALER_RGB))
>> +
>>  #define MIXER_MSM8998_MASK \
>>         (BIT(DPU_MIXER_SOURCESPLIT))
>>  
>> @@ -69,6 +84,12 @@
>>  #define MIXER_QCM2290_MASK \
>>         (BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>>  
>> +#define PINGPONG_MSM8996_MASK \
>> +       (BIT(DPU_PINGPONG_DSC))
>> +
>> +#define PINGPONG_MSM8996_TE2_MASK \
>> +       (PINGPONG_MSM8996_MASK | BIT(DPU_PINGPONG_TE2))
>> +
>>  #define PINGPONG_SDM845_MASK \
>>         (BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>>  
>> @@ -314,6 +335,35 @@ static const u32 wb2_formats_rgb_yuv[] = {
>>         .virt_num_formats = ARRAY_SIZE(plane_formats), \
>>         }
>>  
>> +/* qseed2 is not supported, so disabled scaling */
>> +#define _VIG_SBLK_QSEED2() \
>> +       { \
>> +       .maxdwnscale = SSPP_UNITY_SCALE, \
>> +       .maxupscale = SSPP_UNITY_SCALE, \
>> +       .scaler_blk = {.name = "scaler", \
>> +               /* no version for qseed2 */ \
>> +               .base = 0x200, .len = 0xa0,}, \
>> +       .csc_blk = {.name = "csc", \
>> +               .base = 0x320, .len = 0x100,}, \
>> +       .format_list = plane_formats_yuv, \
>> +       .num_formats = ARRAY_SIZE(plane_formats_yuv), \
>> +       .virt_format_list = plane_formats, \
>> +       .virt_num_formats = ARRAY_SIZE(plane_formats), \
>> +       .rotation_cfg = NULL, \
>> +       }
>> +
>> +#define _RGB_SBLK() \
>> +       { \
>> +       .maxdwnscale = SSPP_UNITY_SCALE, \
>> +       .maxupscale = SSPP_UNITY_SCALE, \
>> +       .scaler_blk = {.name = "scaler", \
>> +               .base = 0x200, .len = 0x28,}, \
>> +       .format_list = plane_formats, \
>> +       .num_formats = ARRAY_SIZE(plane_formats), \
>> +       .virt_format_list = plane_formats, \
>> +       .virt_num_formats = ARRAY_SIZE(plane_formats), \
>> +       }
>> +
>>  #define _DMA_SBLK() \
>>         { \
>>         .maxdwnscale = SSPP_UNITY_SCALE, \
>> @@ -330,6 +380,9 @@ static const struct dpu_rotation_cfg
>> dpu_rot_sc7280_cfg_v2 = {
>>         .rot_format_list = rotation_v2_formats,
>>  };
>>  
>> +static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed2 =
>> +                               _VIG_SBLK_QSEED2();
>> +
>>  static const struct dpu_sspp_sub_blks dpu_vig_sblk_noscale =
>>                                 _VIG_SBLK_NOSCALE();
>>  
>> @@ -361,6 +414,8 @@ static const struct dpu_sspp_sub_blks
>> dpu_vig_sblk_qseed3_3_2 =
>>  static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_3 =
>>                                 _VIG_SBLK(SSPP_SCALER_VER(3, 3));
>>  
>> +static const struct dpu_sspp_sub_blks dpu_rgb_sblk = _RGB_SBLK();
>> +
>>  static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
>>  
>>  /*************************************************************
>> @@ -425,6 +480,15 @@ static const struct dpu_dspp_sub_blks
>> sdm845_dspp_sblk = {
>>  /*************************************************************
>>   * PINGPONG sub blocks config
>>   *************************************************************/
>> +static const struct dpu_pingpong_sub_blks msm8996_pp_sblk_te = {
>> +       .te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
>> +               .version = 0x1},
>> +};
>> +
>> +static const struct dpu_pingpong_sub_blks msm8996_pp_sblk = {
>> +       /* No dither block */
>> +};
>> +
>>  static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
>>         .te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
>>                 .version = 0x1},
>> @@ -490,6 +554,34 @@ static const struct dpu_vbif_dynamic_ot_cfg
>> msm8998_ot_rdwr_cfg[] = {
>>         },
>>  };
>>  
>> +static const struct dpu_vbif_cfg msm8996_vbif[] = {
>> +       {
>> +       .name = "vbif_rt", .id = VBIF_RT,
>> +       .base = 0, .len = 0x1040,
>> +       .default_ot_rd_limit = 32,
>> +       .default_ot_wr_limit = 16,
>> +       .features = BIT(DPU_VBIF_QOS_REMAP) |
>> BIT(DPU_VBIF_QOS_OTLIM),
>> +       .xin_halt_timeout = 0x4000,
>> +       .qos_rp_remap_size = 0x20,
>> +       .dynamic_ot_rd_tbl = {
>> +               .count = ARRAY_SIZE(msm8998_ot_rdwr_cfg),
>> +               .cfg = msm8998_ot_rdwr_cfg,
>> +               },
>> +       .dynamic_ot_wr_tbl = {
>> +               .count = ARRAY_SIZE(msm8998_ot_rdwr_cfg),
>> +               .cfg = msm8998_ot_rdwr_cfg,
>> +               },
>> +       .qos_rt_tbl = {
>> +               .npriority_lvl = ARRAY_SIZE(msm8998_rt_pri_lvl),
>> +               .priority_lvl = msm8998_rt_pri_lvl,
>> +               },
>> +       .qos_nrt_tbl = {
>> +               .npriority_lvl = ARRAY_SIZE(msm8998_nrt_pri_lvl),
>> +               .priority_lvl = msm8998_nrt_pri_lvl,
>> +               },
>> +       },
>> +};
>> +
>>  static const struct dpu_vbif_cfg msm8998_vbif[] = {
>>         {
>>         .name = "vbif_rt", .id = VBIF_RT,
>> @@ -673,6 +765,8 @@ static const struct dpu_qos_lut_entry
>> sc7180_qos_nrt[] = {
>>   * Hardware catalog
>>   *************************************************************/
>>  
>> +#include "catalog/dpu_1_7_msm8996.h"
>> +
>>  #include "catalog/dpu_3_0_msm8998.h"
>>  #include "catalog/dpu_3_2_sdm660.h"
>>  #include "catalog/dpu_3_3_sdm630.h"
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 37e18e820a20..69f089431901 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -831,6 +831,7 @@ struct dpu_mdss_cfg {
>>         const struct dpu_format_extended *vig_formats;
>>  };
>>  
>> +extern const struct dpu_mdss_cfg dpu_msm8996_cfg;
>>  extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sdm630_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sdm660_cfg;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index d1e2143110f2..58933d66bace 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1435,6 +1435,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
>>  };
>>  
>>  static const struct of_device_id dpu_dt_match[] = {
>> +       { .compatible = "qcom,msm8996-mdp5", .data =
>> &dpu_msm8996_cfg, },
>>         { .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg,
>> },
>>         { .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg,
>> },
>>         { .compatible = "qcom,sdm630-mdp5", .data = &dpu_sdm630_cfg,
>> },
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 9c33f4e3f822..df1ad00541f5 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -984,6 +984,7 @@ module_param(prefer_mdp5, bool, 0444);
>>  
>>  /* list all platforms supported by both mdp5 and dpu drivers */
>>  static const char *const msm_mdp5_dpu_migration[] = {
>> +       "qcom,msm8996-mdp5",
>>         "qcom,sdm630-mdp5",
>>         "qcom,sdm660-mdp5",
>>         NULL,
>> 

