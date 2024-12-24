Return-Path: <linux-arm-msm+bounces-43271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0629FC059
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 17:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCF3A188432B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 16:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BD420B204;
	Tue, 24 Dec 2024 16:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oy/lIGQk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA9C20B218
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735057905; cv=none; b=m7+6VRVHrlwTskiGIZb9wvw8FjitrPHiNMCazmgwivb3QR9ZPSZC2BvxZX9Is4oavWw52HVjga0Vmicexd8CkFVnghrYB4GYY2L1DsYTl4Xbt2p7xg+HC8lwykUEF5Hxr8vRThSqVCqxhvV7RhRQGyD48BTVAwHjEn/2l2POtWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735057905; c=relaxed/simple;
	bh=q+pW0aNGM8ZhLYKmmh9FPOzc686+6gQF1IS4ARYbUTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EP8o1OfAaBnJydx+5ErQj+BIdY8MCRwHbJcMamE+ZkxKs8veCk4zmZ88gTwsbJb2ocMmjxyl90N7S9zp6zmIXs+Uom/3Tt4it9QJRXIvlPWGSU1I75fB+hjarnRQHqIHXWxrvMPuSpUNjuQLuqjtlrGUZUMVA/Eg3m5jxMl+eO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oy/lIGQk; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54021daa6cbso5468345e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 08:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735057901; x=1735662701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x3MFOlRalG3Ekb8Hf1Tn9ELeWDSVPYov3HTEuP7yeXk=;
        b=oy/lIGQkuwqMlXrifw7eWQ1oCllBZYRiSXmruQ/diSuHZGI1l28am1d/uBlGX7x7WR
         eAQZ6S4v0P3HJlES+t8wAldW1Fc1jUadhoGpqmUwPxEBHyMFwyjx4bzVz7/XXTBQ0h6j
         ad5XBBsi1QGtd108ffjD/FT1EywTZuz1Q0tDFUKj1/6Jt9R7Ew3P5Ag/61iODVTvDUGC
         lB1UV5JLMgV5x+ANvjR4gf7hRHQg24ktGsmXRxmX94sLWEOwJSLwX8SGl4nCsiZ9lqsv
         w8CuVCPITT0rM0vsGJ/LI7vcBx8C23qvW5gV9yVH0i9G6svJuPGxti90ibypJCsn7MCU
         y85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735057901; x=1735662701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3MFOlRalG3Ekb8Hf1Tn9ELeWDSVPYov3HTEuP7yeXk=;
        b=uA6YbjAnPMoXwoEsWAfEYvN1CTEYUQvGV+aUC7+0K66bmYIW9QlBPg+iqzbR9gKQOd
         tRo3XAqRgohdr2DpWM/4T9aDsvc2RvyTVhQ5t6DHT7527aZTx2ZClQm5GAzpzNXsbgby
         SPzWei60fzzPuXViPlPMey95Ple4IDxeYXJlshP0fXjM0JnaCK39KnBMQ+8MqePuUUrU
         T8xnOhsAflPrclxglINPoq7fZbPQk533XjzEF3B+Ou4OTeKOgHiarnCGy/N+9j005CPf
         NkigzTw3DFb3g2BGdpVp6I6iyAC53v4nhOexKzFWfOE2Gh6Jm+nQiHorTJUDuewLzwZw
         JgeA==
X-Forwarded-Encrypted: i=1; AJvYcCW1c6SRJ3HrT870G4uAOl7efljzEex9XBtyIZS9CvmDOgllxbcjog6L4Q2QHozt4/k+SMFkfKAB4dKJjT7i@vger.kernel.org
X-Gm-Message-State: AOJu0YwnIA2O742KGAoQJf4x0+j225rt4Say+tSSTX26w2NnK3mQ3bcF
	S4ajM1T5EFNi2FSLkvD5GrsOStwUw+OI7VpbH8/ymnSF6uE+qjQETYRGOSubI68=
X-Gm-Gg: ASbGnctGspi/6WVi9IW2zSFe8cYFoDmm8I3QeX4GQ6Kv8FLwvm9/AAc5n/JNay/x6Ai
	K8xEcimrsFedLw8CwFXhfXnyHyJQJGD+m16HjwUq/P95Q69goZGRhROYjLRF4jthfUMlfHcVgMI
	UEGoAdX43uCFof9T1nbhI5ji46Ohuzy3mlWMcKigchUnjc3rzkZR5QdbExgEvJQAmKmG/1QdEat
	s42CngSzZWe4E+/vzd+9D8FgySKmm/us4P/oZBRpWNPx1GgMPoffdzqVRjsFCD+56AMcmgs+4BZ
	iKPvo0M1OMz18zZ/Pb+WR5LM+gZpwhXP6NHX
X-Google-Smtp-Source: AGHT+IGXPwN2YrDgsQJ+IKq9Y23nso1YpIDMPGGmx60GJFPNz/bv/hGvqa9qI2WNe9cKJTy53cOZZQ==
X-Received: by 2002:a05:6512:2342:b0:540:1b7e:c900 with SMTP id 2adb3069b0e04-54229532aecmr5319653e87.14.1735057901531;
        Tue, 24 Dec 2024 08:31:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6295sm1621702e87.22.2024.12.24.08.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 08:31:39 -0800 (PST)
Date: Tue, 24 Dec 2024 18:31:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 10/23] drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB
 block
Message-ID: <pclx6u6vbdjgzarqxva2ivwlpmicrsbghdo644kp6mg5uvjnox@y5g4wssadqwy>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
 <20241016-concurrent-wb-v3-10-a33cf9b93835@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-concurrent-wb-v3-10-a33cf9b93835@quicinc.com>

On Wed, Oct 16, 2024 at 06:21:16PM -0700, Jessica Zhang wrote:
> The CWB mux has its own registers and set of operations. Add dpu_hw_cwb
> abstraction to allow driver to configure the CWB mux.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile                |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c  | 73 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h  | 70 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 +-
>  4 files changed, 148 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index de7cf60d206241ac03d7e744e048cbfd845f6cc9..26bacd93a148288849d5076c73ef4f294ff2c188 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -78,6 +78,7 @@ msm-display-$(CONFIG_DRM_MSM_DPU) += \
>  	disp/dpu1/dpu_hw_catalog.o \
>  	disp/dpu1/dpu_hw_cdm.o \
>  	disp/dpu1/dpu_hw_ctl.o \
> +	disp/dpu1/dpu_hw_cwb.o \
>  	disp/dpu1/dpu_hw_dsc.o \
>  	disp/dpu1/dpu_hw_dsc_1_2.o \
>  	disp/dpu1/dpu_hw_interrupts.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..5fbf52906ea94847a8eb3fcaa372e582dce2357c
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#include <drm/drm_managed.h>
> +#include "dpu_hw_cwb.h"
> +
> +#define CWB_MUX              0x000
> +#define CWB_MODE             0x004
> +
> +/* CWB mux block bit definitions */
> +#define CWB_MUX_MASK         GENMASK(3, 0)
> +#define CWB_MODE_MASK        GENMASK(2, 0)
> +
> +static void dpu_hw_cwb_config(struct dpu_hw_cwb *ctx,
> +			      struct dpu_hw_cwb_setup_cfg *cwb_cfg)
> +{
> +	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	int cwb_mux_cfg = 0xF;
> +	enum dpu_pingpong pp;
> +	enum cwb_mode_input input;
> +
> +	if (!cwb_cfg)
> +		return;
> +
> +	input = cwb_cfg->input;
> +	pp = cwb_cfg->pp_idx;
> +
> +	if (input >= INPUT_MODE_MAX)
> +		return;
> +
> +	/*
> +	 * The CWB_MUX register takes the pingpong index for the real-time
> +	 * display
> +	 */
> +	if ((pp != PINGPONG_NONE) && (pp < PINGPONG_MAX))
> +		cwb_mux_cfg = FIELD_PREP(CWB_MUX_MASK, pp - PINGPONG_0);
> +
> +	input = FIELD_PREP(CWB_MODE_MASK, input);

Without #include <linux/bitfield.h> this triggers an error on some
platforms as reported by LKP. I'll fix that in place.

> +
> +	DPU_REG_WRITE(c, CWB_MUX, cwb_mux_cfg);
> +	DPU_REG_WRITE(c, CWB_MODE, input);
> +}
> +

-- 
With best wishes
Dmitry

