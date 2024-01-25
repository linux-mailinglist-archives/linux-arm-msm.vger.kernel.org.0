Return-Path: <linux-arm-msm+bounces-8323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A4C83CE48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 692C01C238BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5763F1350E8;
	Thu, 25 Jan 2024 21:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R+IIBYFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CB81386B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706217258; cv=none; b=pcpXxuOnmDI2US1JA6iCe5+vp3IjWNKBQI9hqFME2msw1Bh9d5QhHXb+Lf+nW2GTS4DI6UB3BXFeSI5KyiVd+z59N/5AuGoAJW+bdHwPs7Q5XlDJbtbJp/ybSmcpOj2WOkhdTI8FVOArOEkkRrcHUIGDQUKliozNzYzHbn+3pec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706217258; c=relaxed/simple;
	bh=J1o6KsK/bVgNSBSp4Jg+1Hvi12bZXiPJhfX+pNnTifc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCN+h+NrQD5lwH9BUPRn7QlPebf9wj35iaC8exf5M0uJUnh8tcrjMmlOA+LWdSFO6GUr/PrnSDHr+aDU4fJzgxGAGAMuB8T4uoR+2oyo0aTEYu8y11Ujq9DHu4HkC+Dj3LhQwadlqKs2CX0uZC/tiX57GI/sQl8lGK1MjJt3OM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R+IIBYFx; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cf45305403so1354051fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706217254; x=1706822054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xyDnPMOWxwzgswtw0IMgKlEsX3lHL6hISWqA0RropHw=;
        b=R+IIBYFxOJxcbsqARPyTeOLBad4GVtS7N/B4LULjFMftVYVkHZ/drO+mck1kn2BpKx
         g4y+HjA80EfSLKCzoge1Xv2E2FsF2BCzTxQkuIskofd2vfZjWwr/I0PT5IaP/Wm83drD
         pPZ/t4sDR6ViWECPfo9bv/qtENJHqSeWd/plQRS0WaBEvsGXUM15J1KUQdMuGxyTlixK
         lPrVmf6E1ps850bIm11DGZ2pvvI+4Aznbmiu7aBhplKS4QdUhXtdEAjFNyCvRIQGxGhc
         1GKpJZVwwHYEe0LIecBjHTRA+9nUia+ZByksYNe5vSMxiwYjuC/Bvs8u0mJcowN6T6lK
         PJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706217254; x=1706822054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xyDnPMOWxwzgswtw0IMgKlEsX3lHL6hISWqA0RropHw=;
        b=FK9jakUFtIfwV+bAsTAN0tTDfEx6I+TCcqZZsoqX5X+8j8HVWBl+aLlZX7WJVcxXs3
         TyfAeZwXd01lQik49l2TH+3wxejgdWuv4JKSprqnob3QA7IpEAiwU+eabBiDzu8b26uw
         WcrQ6AO3THsPuLGlsorWx1sZ7clsH58X+UQ2ndqvtwBQCH+Ekjvg6vvg53+wjZmzr9sR
         YYnu8ss/PLJTuLx/L2ebwJFlaTBbpUk1Ikt5snpuSfibGF659v5uzeiWy2ifAMXmeZhv
         Eu2FJYxaG/nPaWyzz+IwIk3jIdz39kwpV0fo4ouAtytdjChZ1FZE5vICyzIj35tLGb2D
         RN5Q==
X-Gm-Message-State: AOJu0YyMfb00tyY8FaL8FCzB2pD70sNGtKShGmsBvPB+gfXe8EiE8CXU
	qTFDYln3UK9BFf30VDjxj9ONcoxnXbAxSppf1xo82vwIxOrQswOV1uU4tixGkRg=
X-Google-Smtp-Source: AGHT+IE2HyxddBJniXLkFHulFfzdu16urepUJYrm6JJvIKaAFhUjdIcp5G5LqZUmlwTbTkcpwvYv7w==
X-Received: by 2002:a2e:b60f:0:b0:2cf:13c1:6a4 with SMTP id r15-20020a2eb60f000000b002cf13c106a4mr90822ljn.75.1706217253929;
        Thu, 25 Jan 2024 13:14:13 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x17-20020a2e9c91000000b002ce070a5141sm382497lji.11.2024.01.25.13.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:14:13 -0800 (PST)
Message-ID: <31e4a033-1779-450c-980e-63c8567837ed@linaro.org>
Date: Thu, 25 Jan 2024 23:14:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] drm/msm/dpu: allow
 dpu_encoder_helper_phys_setup_cdm to work for DP
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-2-quic_parellan@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-2-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> Generalize dpu_encoder_helper_phys_setup_cdm to be compatible with DP.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 31 ++++++++++---------
>   2 files changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 993f263433314..37ac385727c3b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -153,6 +153,7 @@ enum dpu_intr_idx {
>    * @hw_intf:		Hardware interface to the intf registers
>    * @hw_wb:		Hardware interface to the wb registers
>    * @hw_cdm:		Hardware interface to the CDM registers
> + * @cdm_cfg:	CDM block config needed to store WB/DP block's CDM configuration

Please realign the description.

>    * @dpu_kms:		Pointer to the dpu_kms top level
>    * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
>    * @vblank_ctl_lock:	Vblank ctl mutex lock to protect vblank_refcount
> @@ -183,6 +184,7 @@ struct dpu_encoder_phys {
>   	struct dpu_hw_intf *hw_intf;
>   	struct dpu_hw_wb *hw_wb;
>   	struct dpu_hw_cdm *hw_cdm;
> +	struct dpu_hw_cdm_cfg cdm_cfg;

It might be slightly better to move it after all the pointers, so after 
the dpu_kms.

>   	struct dpu_kms *dpu_kms;
>   	struct drm_display_mode cached_mode;
>   	struct mutex vblank_ctl_lock;
> @@ -213,7 +215,6 @@ static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
>    * @wbirq_refcount:     Reference count of writeback interrupt
>    * @wb_done_timeout_cnt: number of wb done irq timeout errors
>    * @wb_cfg:  writeback block config to store fb related details
> - * @cdm_cfg: cdm block config needed to store writeback block's CDM configuration
>    * @wb_conn: backpointer to writeback connector
>    * @wb_job: backpointer to current writeback job
>    * @dest:   dpu buffer layout for current writeback output buffer
> @@ -223,7 +224,6 @@ struct dpu_encoder_phys_wb {
>   	atomic_t wbirq_refcount;
>   	int wb_done_timeout_cnt;
>   	struct dpu_hw_wb_cfg wb_cfg;
> -	struct dpu_hw_cdm_cfg cdm_cfg;
>   	struct drm_writeback_connector *wb_conn;
>   	struct drm_writeback_job *wb_job;
>   	struct dpu_hw_fmt_layout dest;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 4cd2d9e3131a4..072fc6950e496 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -269,28 +269,21 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>    *                                     This API does not handle DPU_CHROMA_H1V2.
>    * @phys_enc:Pointer to physical encoder
>    */
> -static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
> +static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
> +					      const struct dpu_format *dpu_fmt,
> +					      u32 output_type)
>   {
>   	struct dpu_hw_cdm *hw_cdm;
>   	struct dpu_hw_cdm_cfg *cdm_cfg;
>   	struct dpu_hw_pingpong *hw_pp;
> -	struct dpu_encoder_phys_wb *wb_enc;
> -	const struct msm_format *format;
> -	const struct dpu_format *dpu_fmt;
> -	struct drm_writeback_job *wb_job;
>   	int ret;
>   
>   	if (!phys_enc)
>   		return;
>   
> -	wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> -	cdm_cfg = &wb_enc->cdm_cfg;
> +	cdm_cfg = &phys_enc->cdm_cfg;
>   	hw_pp = phys_enc->hw_pp;
>   	hw_cdm = phys_enc->hw_cdm;
> -	wb_job = wb_enc->wb_job;
> -
> -	format = msm_framebuffer_format(wb_enc->wb_job->fb);
> -	dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
>   
>   	if (!hw_cdm)
>   		return;
> @@ -306,10 +299,10 @@ static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
>   
>   	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
>   
> -	cdm_cfg->output_width = wb_job->fb->width;
> -	cdm_cfg->output_height = wb_job->fb->height;
> +	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
> +	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;

This is a semantic change. Instead of passing the FB size, this passes 
the mode dimensions. They are not guaranteed to be the same, especially 
for the WB case.

>   	cdm_cfg->output_fmt = dpu_fmt;
> -	cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
> +	cdm_cfg->output_type = output_type;
>   	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
>   			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
>   	cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
> @@ -462,6 +455,14 @@ static void dpu_encoder_phys_wb_setup(
>   	struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
>   	struct drm_display_mode mode = phys_enc->cached_mode;
>   	struct drm_framebuffer *fb = NULL;
> +	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> +	struct drm_writeback_job *wb_job;
> +	const struct msm_format *format;
> +	const struct dpu_format *dpu_fmt;
> +
> +	wb_job = wb_enc->wb_job;
> +	format = msm_framebuffer_format(wb_enc->wb_job->fb);
> +	dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
>   
>   	DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
>   			hw_wb->idx - WB_0, mode.name,
> @@ -475,7 +476,7 @@ static void dpu_encoder_phys_wb_setup(
>   
>   	dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
>   
> -	dpu_encoder_helper_phys_setup_cdm(phys_enc);
> +	dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
>   
>   	dpu_encoder_phys_wb_setup_ctl(phys_enc);
>   }

-- 
With best wishes
Dmitry


