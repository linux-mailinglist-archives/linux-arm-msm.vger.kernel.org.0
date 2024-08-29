Return-Path: <linux-arm-msm+bounces-29991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 535CA9642A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F12571F20F56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB1A190678;
	Thu, 29 Aug 2024 11:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jx1/cSWh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C60F189B95
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 11:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929572; cv=none; b=FE4f8kC6c4qSqaGF66QN1F61bKk3rb7qQzkLRq5INguABggCHq/pL8NN92QdgGBj8GfC7Otg8DA5j6on4yRsBbxOaMikAASFy4/xsPVMecHZyHBC59jrNsRw4t/6/SubdtBBKZROq6hgaD1UFdBmWk5VOeYQ01suNr9dZi7cUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929572; c=relaxed/simple;
	bh=J2pPoDRPRmOasyOJN+OGb9bL40+UGELwegWmDFLPkBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lwz58HFKTqJw3UivnRfz80CaVdSAT9dSA0pZxM/isFBXoH37QBqlW/6p96RnOEkC4bnGge2bgw9vGfXXn80e+XcJuO/YJ4fuidq0tB+6WLQKnzdyxA7+KD4sPkaq+BtE9L5eboNdJnGC/qglnwtDXjS9dnvvoyX6mfQozZVOHmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jx1/cSWh; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6b0c5b1adfaso4892987b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 04:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724929570; x=1725534370; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t00GbWajI0fY42GgBRY0b15sJ+hM+PSIwwNAsxYr2Mg=;
        b=jx1/cSWhOniCG/UudIRPcK/xsClHxqCXS9CI3ENoS/0bPtk32wzsHUa8v+jj9/Dhl4
         3Jy/7/Hb2RobFuWUk38XGPw4EluPa9XvvjZyCeRGj2F7IV0z0DxkU9j5RebXLPqOf3ZU
         mQ5egA3K0+P4l6YRHNwI1dqTt5k2b/fCBqSdICDFFuBLKw05e+8daGTqIs1fP+Ar9jjj
         DRjOMu+hiDl4092xGoiYTSWfQde9YK25w7w1OPkhHnMVycrWCKiTiO+kEpaAgIrF23iX
         SYgUCFHlbnBi8RpY1mhXVgAg/8pOSyKnHnIJRTRhdrRiHc6Q/nm51wrADjnYJUey6DuI
         4PqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929570; x=1725534370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t00GbWajI0fY42GgBRY0b15sJ+hM+PSIwwNAsxYr2Mg=;
        b=ZbFk2FEUEz0W39bAy35G87hTCj0eqqaxw+OjDnTN99NiTat/TcRmHekmQ+1CVmHSbX
         XJncn14flMLzp0OrO2dK4MK2mrlAxzGtNoXi+K2dJW5pMIdAjJ9Q2oZpuGd0qjOMPT+s
         G7tg8XOnrZtznTSLFkOArx4yNiEo5zRSdjqQiBrha7zvCa8pE8IzNw0zul1iqZCTz3m8
         wFUvHrLzM5/T1rYisOoqGUtOTJTzaW4Rn7b8fLeU0/BwDbK2DlHWjRHDPa5rsNNP7Av2
         nWf91soD/8dOjfB8J8Nak5b3MBZC37g7XGTuv8rrfR0AhmuWZvNM39aJ+Gd1WaPSDbTS
         FHTw==
X-Forwarded-Encrypted: i=1; AJvYcCXMjgJK4vUadFiAMflfhVKCQtSGOShaILEk/B/VVPpQgstVAlZNdGKJjGowr72farSnE2JbrZL54RFAo0fq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2QBGzq0Xervd6G+J/73qRt6LtVCHBv4QyikdyZga4C08kqhb9
	XJrfC8CNIs6WEq52u189coBtFjan3wXGD2hq7hFBaTNkSyzrd+tQ06xfFfbsDO+CFj4oH1fmO0D
	AxKxPvG8Qwb2Md3GC825/NiNa3JWGC/lXUTdlYw==
X-Google-Smtp-Source: AGHT+IFIHaboJ6IIfGbmUtGfNnqOp+c8jA6Hk5SaKD8wA7zMol9LODyzVqgOo6qMWeJVq2ejhZvuGsmKKNXu0fxcXgU=
X-Received: by 2002:a05:690c:3391:b0:6b5:71b2:13da with SMTP id
 00721157ae682-6d277777516mr24559917b3.32.1724929569807; Thu, 29 Aug 2024
 04:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-5-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-5-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:05:59 +0300
Message-ID: <CAA8EJpqJxF4fOaFT6Uu=D5A35HdEDYRhgkkT0TdZ+ckDS95Nag@mail.gmail.com>
Subject: Re: [PATCH 05/21] drm/msm/dpu: polish log for resource allocation
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
>
> Add resource allocation type info.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 15b42a6683639..e219d706610c2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -778,6 +778,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>                 ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
>  }
>
> +static char *dpu_hw_blk_type_name[] = {
> +       [DPU_HW_BLK_TOP] = "blk_top",
> +       [DPU_HW_BLK_SSPP] = "blk_sspp",
> +       [DPU_HW_BLK_LM] = "blk_lm",
> +       [DPU_HW_BLK_CTL] = "blk_ctl",
> +       [DPU_HW_BLK_PINGPONG] = "blk_pingpong",
> +       [DPU_HW_BLK_INTF] = "blk_intf",
> +       [DPU_HW_BLK_WB] = "blk_wb",
> +       [DPU_HW_BLK_DSPP] = "blk_dspp",
> +       [DPU_HW_BLK_MERGE_3D] = "blk_merge_3d",
> +       [DPU_HW_BLK_DSC] = "blk_dsc",
> +       [DPU_HW_BLK_CDM] = "blk_cdm",

Drop blk_, upcase all abbreviations.

> +       [DPU_HW_BLK_MAX] = "blk_none",
> +};
> +
>  int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>         struct dpu_global_state *global_state, uint32_t enc_id,
>         enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
> @@ -828,13 +843,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>                         continue;
>
>                 if (num_blks == blks_size) {
> -                       DPU_ERROR("More than %d resources assigned to enc %d\n",
> -                                 blks_size, enc_id);
> +                       DPU_ERROR("More than %d %s assigned to enc %d\n",
> +                                 blks_size, dpu_hw_blk_type_name[type], enc_id);
>                         break;
>                 }
>                 if (!hw_blks[i]) {
> -                       DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
> -                                 type, enc_id);
> +                       DPU_ERROR("%s unavailable to assign to enc %d\n",
> +                                 dpu_hw_blk_type_name[type], enc_id);
>                         break;
>                 }
>                 blks[num_blks++] = hw_blks[i];
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

