Return-Path: <linux-arm-msm+bounces-29990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF42964290
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B9AA285AE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867F218FC84;
	Thu, 29 Aug 2024 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QnkHVNUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B290C18CC1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929489; cv=none; b=GF9MK6/QuOG77pnCxb/hFk4tBVka/wW+y5Euyqmt/+iSsPy8NdAU9XsZ2PubBo3C/vix/LQ1Hd1TeUhuvJXp4FqPEhEX14VhBBDMJohHT9jYiztcDrI0PvmrvauZJm2ja09hYN+siS5swNLZru96h3wKOOEa783wILF+26sMzsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929489; c=relaxed/simple;
	bh=SuJnZpdAxoeFpIzEyQVPxQjoerz6lR0kP5Jy2SKVxy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iaXo3c1sMyoKjUtjX4TCP50plr+zxytxHmzxwhqhqWFXn0uFxDCr8sH1yHY8mf+7e/4oYONsfeuZnj+AzQ9d0pMoYTTqSUv/9SB2T/L/T9PsN0KpKt6bc1XRQ6q9EjtlsaEsXKA5+JsUKz0waXZhff9mudxzQvEWXV21XZE7HmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QnkHVNUC; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6b6b9867f81so4509977b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 04:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724929487; x=1725534287; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+w6aWurefHFOT/q/zcqS9miwYxvHRLqdgWPtHwfRoIA=;
        b=QnkHVNUC0wppo3xbGcb0E6F4xa+tE+4mRgQj8J+DMs/9cfW4DJu5RRLsC56j5HB9HN
         nT/KQ2Ahh7y5wmOVfr0RpF84iNkAf5BIDRVNtKGdBlyvg1EKU1XTc+OfcoIojk3dYHBO
         2BIiCRqmHj26aARSHcRvMx6Hj+Ps/yNBo2wCyyUqZHz52aa+9vcs5/pKjPsrZrI2YEjN
         qUcVyb3EEDeOVYDCeWyqAYytmzmW8qVGkcsSXd1ASw9KtW/+W25n5bpu8KD3ekglM2AY
         cVPDFZl14kMWNG8mdwWjcjwl0Sk9uaRrkK+rB9mWRNH9Ha8eM2f1Zlg0Ba2FFCKBrxpP
         vKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929487; x=1725534287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+w6aWurefHFOT/q/zcqS9miwYxvHRLqdgWPtHwfRoIA=;
        b=SQSGxFofb/6zDPSLuEv9Od280LII5kH2FNGy2qkBCqIucRJr2t6eTGAaptRZ6049PU
         FAyvAgIt42DA79AW1O994g/aHE4vh6oNgLeJjsiD+s+kez3wh5WAE2mo5aoaJmL1HnBR
         rem2KFoGp+LzIY8uwkqeyTwn0SqvN+ZUvyCkAQNnvXyjd2JfhTW+OtLsIYHCpIpQDY4i
         Bti2r0EiBpJeFo9NRumMwZtWVThBMwoJmP0XqMmooc0CYbNkrKEr1G3UXd5NpXoaiX1o
         u+SW1gaFN0CLI2lUyPgNSSZzYbLF0VTVYixZoJADK+ieZSOf4V1pCLzSeaNdDzxjSZH2
         z+pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDTdycDxEy6IHDzUF6Bwp0sHkQXv/lX4RTfHmxTOTlP3Y+AZontUqs6/vDxf+hv+fm9OQeBgBs7Y9mnhWL@vger.kernel.org
X-Gm-Message-State: AOJu0YzZjCElbturYHizkqpxgHG7zTqnwrwMXSLEMZVj0DMGTQvKhHsH
	2PUWPau31Bly2TLzoyy1DU1bk7bCni9l0JHyFbrjFAmagAKdALEDechQVS6Vjk6BqekKGO+HW/y
	4T9SWWgUdMddYPB+BycaiMPV0Mg4GcS+kMJVHTQ==
X-Google-Smtp-Source: AGHT+IHgFWrfqg6VxD076bV1Ahvq7Va1k0veH8KaE24wYRXR1wihBNHx2f8OBxAR3Yx4Q/qCQP65lTON7r6fXvuKmkg=
X-Received: by 2002:a05:690c:6e10:b0:6b4:b45:2f1 with SMTP id
 00721157ae682-6d277a7a8b4mr30321547b3.34.1724929486478; Thu, 29 Aug 2024
 04:04:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-4-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-4-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:04:34 +0300
Message-ID: <CAA8EJprKnd269S_KMVUDk7UfT-c4ighPq4VkX-nEkwGg8ys1cQ@mail.gmail.com>
Subject: Re: [PATCH 04/21] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
>
> From: Jonathan Marek <jonathan@marek.ca>
>
> MSM display controller support multiple slice to be sent in a single DSC
> packet.

This is not MSM-specific. It is allowed per the standard.

> Add a dsc_slice_per_pkt field to mipi_dsi_device struct and
> support this field in msm mdss driver.

This doesn't describe why this is necessary at all. Is it a fix or a feature?

>
> Note that the removed "pkt_per_line = slice_per_intf * slice_per_pkt"
> comment is incorrect.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>  include/drm/drm_mipi_dsi.h         |  2 ++
>  2 files changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 5abade8f26b88..36f0470cdf588 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -157,6 +157,7 @@ struct msm_dsi_host {
>
>         struct drm_display_mode *mode;
>         struct drm_dsc_config *dsc;
> +       unsigned int dsc_slice_per_pkt;
>
>         /* connected device info */
>         unsigned int channel;
> @@ -861,17 +862,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>
>         total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> -       bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
> +       bytes_per_pkt = dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
>
>         eol_byte_num = total_bytes_per_intf % 3;
> -
> -       /*
> -        * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
> -        *
> -        * Since the current driver only supports slice_per_pkt = 1,
> -        * pkt_per_line will be equal to slice per intf for now.
> -        */
> -       pkt_per_line = slice_per_intf;
> +       pkt_per_line = slice_per_intf / msm_host->dsc_slice_per_pkt;
>
>         if (is_cmd_mode) /* packet data type */
>                 reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
> @@ -1019,12 +1013,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                 else
>                         /*
>                          * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
> -                        * Currently, the driver only supports default value of slice_per_pkt = 1
> -                        *
> -                        * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
> -                        *       and adjust DSC math to account for slice_per_pkt.
>                          */
> -                       wc = msm_host->dsc->slice_chunk_size + 1;
> +                       wc = msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt + 1;
>
>                 dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>                         DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> @@ -1629,8 +1619,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>         msm_host->lanes = dsi->lanes;
>         msm_host->format = dsi->format;
>         msm_host->mode_flags = dsi->mode_flags;
> -       if (dsi->dsc)
> +       if (dsi->dsc) {
>                 msm_host->dsc = dsi->dsc;
> +               msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt;
> +               /* for backwards compatibility, assume 1 if not set */
> +               if (!msm_host->dsc_slice_per_pkt)
> +                       msm_host->dsc_slice_per_pkt = 1;
> +       }
>
>         ret = dsi_dev_attach(msm_host->pdev);
>         if (ret)
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 0f520eeeaa8e3..1c1b56077d44a 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -182,6 +182,7 @@ struct mipi_dsi_device_info {
>   * be set to the real limits of the hardware, zero is only accepted for
>   * legacy drivers
>   * @dsc: panel/bridge DSC pps payload to be sent
> + * @dsc_slice_per_pkt: number of DSC slices to be sent as in a single packet
>   */
>  struct mipi_dsi_device {
>         struct mipi_dsi_host *host;
> @@ -196,6 +197,7 @@ struct mipi_dsi_device {
>         unsigned long hs_rate;
>         unsigned long lp_rate;
>         struct drm_dsc_config *dsc;
> +       unsigned int dsc_slice_per_pkt;
>  };
>
>  /**
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

