Return-Path: <linux-arm-msm+bounces-38817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A38EF9D5CF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 11:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22B141F22E0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25231DE3AD;
	Fri, 22 Nov 2024 10:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pj7MZCM8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2F81DE2C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 10:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270040; cv=none; b=mIYo4spBF7yIS0wSK9k5jV7BYeaDvSUyAd+sWXhIqfWrdEU2PyhxavBsujAI0cfCnUR9imhztTjh0BAv2BMa5bvFV6EfRV0BxtZXxoGM6LJwZZbWN6EVupjwEZyDKTtBBEONtjjo1KEJRvEoXIlLnT3vDP4E87O/tHTuyHmg/E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270040; c=relaxed/simple;
	bh=ePTtXXdtrb2V6GMKMuYSIWDcQsD3/Vz0olaoJ86XrP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7+Exs4eZVdEHznBqRZ4wZfhiNlfI2MmQ6bMUrxRY7wc7tasWdEhXz01L5/ij/7ZFx/wdacCVqPcq6GHOOOLnG8a3pRBvj1HAmnmmeeb/nkhnmoW+VFWCeAxnEvdW1LXBBPS1BwJoVzfc7cd5tESQHeLu3/JQMQqgysxhEqPPqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pj7MZCM8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53da2140769so2203065e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 02:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732270037; x=1732874837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GO7fVK+g5VXFiw6jUirAsxcaeR1tJ6lVtHXzxXnqFYQ=;
        b=Pj7MZCM8EzxpsSkKNsn1jIHFFXFm43FL9O8R1ieBoutADEeOuzfSQ/kUkscAv8mlSi
         1Zk9NsnQ6wADpEYJXn28bPEQNxDQR/0OCk2rjXSuBa9Tt+O1DGZ2XF4rfxUvrKhLpvek
         cSwrbs7rYEaI2bpNjOss22e7o6j1MW1it0468nO9Wdg/fBHEZ6uJVmPrEJkoopEwSY88
         vKUiS+XjT2zRGh+WyE854TE0/R6VwCRawOl15PXKNnwwNr5jzGcK0MKo/iGbOJmkZN2t
         xheCMqW9BU6KKeKA3YTrzPrRLJBWqFY9LcEh0Nofwla6L3HSfEEbJNRlVVCZTKdQldK8
         d4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270037; x=1732874837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GO7fVK+g5VXFiw6jUirAsxcaeR1tJ6lVtHXzxXnqFYQ=;
        b=AuhoCIXGbYIUqh8upqZ7ceEfla2WyT3Bo98Encf04Lk70pFNvHJSwK6yAKSfOpwwQ6
         CEltAZ1iI7+jiok/FEAc6qubFxMP9zLeraxF4atSc9lbrXjEttejK7K+RjjOLC0hfojg
         nZUIjgBwD3nsg61709UwhAEVyVM4lkiqvnv/JRQ58/TQR3G/N1WQ6Y2CBedISR5O59Zu
         xZteAUuqvor4fyLyxbrn30KKWUUnBieoNQIUb4hKo54Ep0Sw0GMN9bX3RacETeteeTZD
         gKf4Ed6FnCxRTWdkCr3EW521IxVFOo+XaTZD1pLNAX4gQo4UHuqKr/WOdlur2tCy6EF9
         IS5A==
X-Forwarded-Encrypted: i=1; AJvYcCWQnxZ5Ly1PzHkYPis92gnK5W+t4Wci7rX5OBp0ZNvkA1Bd0SrDi1EN8v7WMjXmiP2CnVuNYTaGRR1cFHqm@vger.kernel.org
X-Gm-Message-State: AOJu0YzFOSoVm8UY277ju0N2QsVdE10RDB5gL+Xflv1n6f957NMkZGwl
	UciXiPw1KpKJrzhKTWC3fXGFZZzHVTxpA4jZUaShTZWmo99re9daeozAJYawNqQ=
X-Gm-Gg: ASbGncuT2gTHIRVuywDIRAcRueyfxcPvOPxeiMpcFSNy7I3xwneKL704AUyFgTab7Xk
	BoJWu9E087FZ4Eci9WbkT6YW5DabQ8GPstHPcv7lJcO6fRgAu4NjXtDGKfpvRDPRYxw0Midh1+E
	8ue+z6qjNHswk8JOhdablrFNvKnmweKTypnDwHgdraTti5KclCOnU8YqWRLSugl5kM16v21qiBy
	COoNVwN1GtMlrfVrcpU3REr+XgU4m79ts8xtJyc85x/DKPqyW1pPjgeUsBh0VW0dqR6URJxpE/n
	Jo62zDL7AK6ACcWG+K67t1z/9ObFcQ==
X-Google-Smtp-Source: AGHT+IEAFmL7UZg1uTfDDRPoy0BBuksKzzgZGM3TutSiUK4Zl501M3PKPyCwG30hNRGeBsF6mBGDwg==
X-Received: by 2002:a05:6512:1110:b0:536:a695:942c with SMTP id 2adb3069b0e04-53dd35a4f17mr1072878e87.7.1732270036793;
        Fri, 22 Nov 2024 02:07:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2445712sm314765e87.40.2024.11.22.02.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:07:16 -0800 (PST)
Date: Fri, 22 Nov 2024 12:07:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/9] drm/msm/dpu: Add SM6150 support
Message-ID: <bhylewwvztm7gsmkjwo6asceuph2jlqgvy2lhocdvg6r7y4i6w@duvbnsko3xg2>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-5-35252e3a51fe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-5-35252e3a51fe@quicinc.com>

On Fri, Nov 22, 2024 at 05:56:48PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add definitions for the display hardware used on the Qualcomm SM6150
> platform.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 263 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 266 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e8b7f694b885d69a9bbfaa85b0faf0c7af677a75
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -0,0 +1,263 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _DPU_5_3_SM6150_H
> +#define _DPU_5_3_SM6150_H
> +
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x6b000, .len = 0x2c0,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_NONE,
> +		.controller_id = 0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),

Please drop. No need to declare missing blocks.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


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

-- 
With best wishes
Dmitry

