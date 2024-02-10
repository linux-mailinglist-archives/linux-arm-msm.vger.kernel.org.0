Return-Path: <linux-arm-msm+bounces-10505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD10850406
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 11:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB1C2875DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D195F328B6;
	Sat, 10 Feb 2024 10:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wpB94gnP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086AC2AF08
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707562249; cv=none; b=LyJPEGUpGfGOV8ahTXqdD9VmILAPyM+EDbZRSOf63gGIrjuHvB5IRzFrLqdTGNRxhd/dnj2mJ5rgenjVttCRBuJh+ls2BMOK85YfEsgUvDmBGuISGmKVT2Q4fX5ssRviquBtA2ES7cTSt6UIo1czhs5UwiDoVYsFW23nLW31024=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707562249; c=relaxed/simple;
	bh=myRgnM1bjCEab60AAXH/qLWfNZan37I11LdRkXjZUt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qSgOe3mXwGe19pm+zut1I6rtwwpvqBjaWWjZ4J4I4Yo6X/VbOuVTbIbaH6voPgC7JJxrny/l4UEJ1ehCu9yPN7/V1xX/4SX8mHC9Is0xieUhlZk2amcTuno7rIBNesxYLrBuUh/M6LxescpxG2F02Tt4UORWw67CsM99SYL5TEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wpB94gnP; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc742fc3b68so2021397276.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 02:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707562247; x=1708167047; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rZ4dvPokh+SvN2BddTUync+wbjk9ePK7aDvjAgf5s8k=;
        b=wpB94gnPCayfDOVJf9OtPwT+Nd/4Rke2k9N9/Nyz3oWu0b7M9xSvKi+QWRK6m0HXnS
         0mbQZu32axUDjNicq5PW2ibsdUFp/cRIRQ1Ej+GlaOQthe/v7q3AMFajVi7e4CpTAcrM
         PpAsDbbgo73pMmkoV79yVE3tAzXLZ9K1Dl2Pwr7sOwU7vv9Y5EcZO0Tuj48o7xD11wQl
         qN8f/zr1oj8el22z5B3dKu0/4AtEldMvCgUtodBmLkh08rRL2Hz5f4B3bl8nLXguPGcG
         HzauFAMgvxZ04J0CqESW6flWmD9XPrRvbHeVV4v/Xt5j6eAMNeOGL38b8ylUqCFqt8zO
         ISqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707562247; x=1708167047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZ4dvPokh+SvN2BddTUync+wbjk9ePK7aDvjAgf5s8k=;
        b=UP0OmPpUkg3YwYA+Q25DTlHOpj7Ofc2Y+NAO6Sg5/sWoMsPxCXmu2sy9xCjP7130Ay
         TgZxHLePdwpM1y3BNU4mqWJEGFFlt5/GVG8anDAODBil/Mh9H1HnPW7aNqz3m0Fq5PHu
         dWB+iIX+rDlzBSeL7heC9te+djf9a0NmRd8xHw5veXOHAOCqB7rMe5fExoH+y+f9Krk1
         /wdlGA7Fkw4635lGLU+4l9y5u5393Uvyyr7EJnKuuxfTB+lF72Dsd9WSgeYHBodC5ktp
         8lXAS6OQuVHb3ZRhHW2IGO1RfRWF1kovHph4WyCZ7mpD4tqGMXgr7/KwAFkBNbyolDzl
         4jIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAa/ZFPV7K/V7VgjDuF5KKNlWSmbvhPTpYa2551GOtNT6LqlwAWk+6Bd4/kzuBJNVSs+QuB7uGS0LDZpABn9RFc5ww1uFVUc5OfmItEQ==
X-Gm-Message-State: AOJu0YzbyN/cb1lNx0Yut1dv95BTcLGprK46KQYD4RmyVUvdOHCpzrTt
	i0gwvhytilIZgLIiG0s2TP6WVCC/Jc6Je5XXIYbhBHqJDliLEk+UjfwkDqZduMQ/L27qhti52QU
	iQ+NvQRdRV4Vrd8P2i0uc1rzU9dW6jHhd5UPVfA==
X-Google-Smtp-Source: AGHT+IHaFEz6gvn0y3KbuSz5ABIu3diqyRfTilMW9TNMEtNKJG3CNgSz1iv2t3Uk0pFFmhIR7PIzkfXoh1usMpcXhRw=
X-Received: by 2002:a25:818e:0:b0:dc2:1bc4:e06b with SMTP id
 p14-20020a25818e000000b00dc21bc4e06bmr1431004ybk.51.1707562246844; Sat, 10
 Feb 2024 02:50:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-18-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-18-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 12:50:35 +0200
Message-ID: <CAA8EJprVnNmmpcOpHYOhZvLOGdny2ohqscWyUM8JwT8AGh2tCA@mail.gmail.com>
Subject: Re: [PATCH v2 17/19] drm/msm/dpu: modify timing engine programming
 for YUV420 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Adjust the encoder timing engine setup programming in the case of video
> mode for YUV420 over DP to accommodate CDM.
>
> Changes in v2:
>         - Move timing engine programming to this patch
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 3f102b2813ca8..fb46d907312a7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -235,8 +235,9 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>  {
>         struct drm_display_mode mode;
>         struct dpu_hw_intf_timing_params timing_params = { 0 };
> +       struct dpu_hw_cdm *hw_cdm;
>         const struct dpu_format *fmt = NULL;
> -       u32 fmt_fourcc = DRM_FORMAT_RGB888;
> +       u32 fmt_fourcc;
>         unsigned long lock_flags;
>         struct dpu_hw_intf_cfg intf_cfg = { 0 };
>
> @@ -255,17 +256,21 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>         DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
>         drm_mode_debug_printmodeline(&mode);
>
> -       if (phys_enc->split_role != ENC_ROLE_SOLO) {
> +       fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
> +
> +       if (phys_enc->split_role != ENC_ROLE_SOLO || fmt_fourcc == DRM_FORMAT_YUV420) {
>                 mode.hdisplay >>= 1;
>                 mode.htotal >>= 1;
>                 mode.hsync_start >>= 1;
>                 mode.hsync_end >>= 1;
> +               mode.hskew >>= 1;

hskew change seems to warrant a separate patch with Fixes for
25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

>
>                 DPU_DEBUG_VIDENC(phys_enc,
> -                       "split_role %d, halve horizontal %d %d %d %d\n",
> +                       "split_role %d, halve horizontal %d %d %d %d %d\n",
>                         phys_enc->split_role,
>                         mode.hdisplay, mode.htotal,
> -                       mode.hsync_start, mode.hsync_end);
> +                       mode.hsync_start, mode.hsync_end,
> +                       mode.hskew);
>         }
>
>         drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
> @@ -273,6 +278,9 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>         fmt = dpu_get_dpu_format(fmt_fourcc);
>         DPU_DEBUG_VIDENC(phys_enc, "fmt_fourcc 0x%X\n", fmt_fourcc);
>
> +       hw_cdm = phys_enc->hw_cdm;
> +       if (hw_cdm)
> +               intf_cfg.cdm = hw_cdm->idx;

No need for a separate local variable.

>         intf_cfg.intf = phys_enc->hw_intf->idx;
>         intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
>         intf_cfg.stream_sel = 0; /* Don't care value for video mode */
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

