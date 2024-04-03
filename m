Return-Path: <linux-arm-msm+bounces-16241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B98B896B34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 11:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF1471F28946
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 09:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3B41350DA;
	Wed,  3 Apr 2024 09:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XSKY4F7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E081350D6
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712138278; cv=none; b=CCihofqAtJo1QiV/h7X2Ang//QJKdGETsK1Odd1kBI+Go+rEVAIjoGchcnUlJvvBTowrvqkzYzq8ai3ECv94+w0XfBRqAN+SSaLw02WjFpTyyHGz140rSob6/UrDl0KrnIcMKRXVAb0yapJxD5HnfaNAJ2/gkOyqLugcRvD/HOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712138278; c=relaxed/simple;
	bh=clUrUlr/bYZzcE/3wpdl5j0DuEea4953kfmh+QZqT4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lw5/D4beEfwNGnhAxdbDlD1vTFC3jlZ3B0epAWj7zsrrtozXOo0HDXoF2XhP5hjLDKexPTphIbspY8jnY/GF+Q/YP7uNatLEd48F9erbQzi9W1iFcgwQ6cXJ+9FsHtlt/tt9rr9OfL+026leoHgCoBZXeZCE94eFw8x+DcIw7z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XSKY4F7v; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dd14d8e7026so5127483276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 02:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712138275; x=1712743075; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8a49vn1g2GfhymP3UDOjKfMABn27AFlfMB3+8PtG0hY=;
        b=XSKY4F7vw+mebWwZ+kQcLA4SNbqV6d9xt43WK7UghmpojJsqSXScw0ne6vCzf9zcOb
         dT4frnNuzOzX4jvcO7GcyIxNqZ4WD63uJvO2H9Yzu8hELeiqzzwKzdLuapvlxr0ZIcLu
         0cNCrbI2g3VR/WCZJFAOTpGLn/1QWVKE5smna6/FGGQXsJ4LUWwZQYL8tgS3OCVvx1Ni
         V4h4QGTWJ7CxF6bq900f0f2R0YDCu6kbGCyKqLg0g2u3KahC45FRR61oURm5g7cMsNfw
         Zx4WnGgjy2lhM+/12LxdsjPCppM4XxWX9Z3H8CAzFrcl8bxBKTx7UN77zSuchTxL0/zh
         sq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712138275; x=1712743075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8a49vn1g2GfhymP3UDOjKfMABn27AFlfMB3+8PtG0hY=;
        b=fNxRdKXdMwdKRhDiip6+iBuUWqBIPp2m4NOrzt2kYT2P5xxGQ9GJdqtRERMcmlX1EB
         SQ8VfFsDFlkHm9G5IokXnPIjo2DAuJ75NJ+tUkIevC/ATWLdfMTJ9wjmncrx9xRp20f3
         /2iPHA33+t8ofgRHiYRuXghsP13McBIpvqmYUioBrilf95L5S8DB/SPOxfVvn0X/eVLz
         lidjBSrhx+Cn05OcMnXO+qxNachMGSI0uuanH05YXqpqMTYXV04c/CXAOZ3jkEdROb8d
         Z9Ncm3+r6NijyODA+WE65VAlNVxeKpYyOq2uVsbc6SOeUAPmIqeH99qg+SDUNK34nraD
         pbSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk+8I5DOhM3I02tgBS0wE0+yHe34u2mVInm2yf99DPU7NpjuzbdlqqRNhL2k4U7Vs2BbfN3ZeTBvHBfOV8GjvudeyyikMMor7QB7X1JA==
X-Gm-Message-State: AOJu0Yy+NMvTAtorH3y97GEnIuLT54FEZVheqLMSYI9+KwEPjdeNxYn5
	v7ki/mLJF4plRcMbppA+BnwDQF8Miks17SqaFFj/OEf+NdKG/BRDL58l2fLQL498JERs7gDRgT0
	A86W8MYVIwNqi+6j3egbPCAhIQ9XXJZEk1cYcfQ==
X-Google-Smtp-Source: AGHT+IG8nlvk6XbQkC/Ui1tRnBB3XNXB6LgbVsTQjpZEjnESvNEsU3CRk8wWXBQbvmEg7ARzBiH2C1TQfqjjaNgmJqs=
X-Received: by 2002:a5b:f07:0:b0:dc7:4c92:16a3 with SMTP id
 x7-20020a5b0f07000000b00dc74c9216a3mr11791901ybr.27.1712138275452; Wed, 03
 Apr 2024 02:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-1-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-1-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 12:57:44 +0300
Message-ID: <CAA8EJpqF4rVsWG=A1fNYWWi7rjHDmu_ftZttXH1v41v8wBgAiQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/msm/dpu: fix video mode DSC for DSI
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> From: Jonathan Marek <jonathan@marek.ca>
>
> Add necessary DPU timing and control changes for DSC to work with DSI
> video mode.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 ++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index d9e7dbf0499c..c7b009a60b63 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -115,6 +115,15 @@ static void drm_mode_to_intf_timing_params(
>                 timing->h_front_porch = timing->h_front_porch >> 1;
>                 timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
>         }
> +
> +       /*
> +        * for DSI, if compression is enabled, then divide the horizonal active
> +        * timing parameters by compression ratio.
> +        */
> +       if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
> +               timing->width = timing->width / 3; /* XXX: don't assume 3:1 compression ratio */
> +               timing->xres = timing->width;
> +       }
>  }
>
>  static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 965692ef7892..079efb48db05 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -167,6 +167,14 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>                 intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>
>         data_width = p->width;
> +       if (p->wide_bus_en && !dp_intf)
> +               data_width = p->width >> 1;

How is wide_bus relevant to the DSC case?
Is there a need for the Fixes tag?

> +
> +       if (p->compression_en)
> +               intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> +
> +       if (p->compression_en && dp_intf)
> +               DPU_ERROR("missing adjustments for DSC+DP\n");
>
>         hsync_data_start_x = hsync_start_x;
>         hsync_data_end_x =  hsync_start_x + data_width - 1;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

