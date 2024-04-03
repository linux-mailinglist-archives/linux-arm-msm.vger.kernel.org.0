Return-Path: <linux-arm-msm+bounces-16258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EB0896D2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 12:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAE411C2660B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 10:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3CC13666D;
	Wed,  3 Apr 2024 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q4SWlo4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42580259C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141478; cv=none; b=rgbjbv7KklYImO6GiqAMRLgZQM6cKWpzMOjgzrhfcnHpfm2Syt+5k8zex43ixaOMyf8/7TEz1JMytdjUqJdP5gTpsywDyhLsbRBnB2HJPLce87PC57XYbmJUATKf7MUe98UmTTeD7QbypT07a4Xj4C/SaxezuN31BKhJEKaOf0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141478; c=relaxed/simple;
	bh=JEF5Tfyng5ds06IeAh7i1GVKXOkoGcvDpFoJ+GtSRZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIgzHkpev7TyC8febhleZCMYBTMCfBxFolE8v/kNJjpyXxvt1gfxRtqfFa+g4EJh0X6Ur4hi3IjREu0K0Lx5pr3Lnl9YarrV3M3QswYfPwjp6QllQPqgjyx98PJwIwvYZtDtRByGe3YeHNQc3gUYS8bw2GXqYjTgJkdyWT4G+go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q4SWlo4K; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso5709252276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712141475; x=1712746275; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9wQYgll8+YgZcGCKnnvI2FxMVky7cnKkeUfk2C0HI4g=;
        b=q4SWlo4KNE6hxjRJ44pWS/kdEmQX3ArnVjkmpzRl3DxJFlPf0aT4MNwRnKDnWxhTp6
         c9RV+rWBLt0yASPV9vgQEYUjOdKuTwzQgIbWmPiGvs4BMJM9+FXCVT3YmkEswlPT5hfn
         B2Y3yO1Csx8oC3f7l2x7hvW+lOEe2clcKmYClfbojfkoFdiUwMCka3HL7k+2DOPk4FzV
         6N+cnN8xP8kDMd1poWeLPbj+hox61axX+mJclHnIz+rZZWKHictGXP+NhmYuBHD8e9GD
         pSZT8odQislEMb4g5ASfO9WUNBL0S8/st6ckU2JmvEm0+nyD9jmzp9TyvTLCewdB5Sw0
         JXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712141475; x=1712746275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wQYgll8+YgZcGCKnnvI2FxMVky7cnKkeUfk2C0HI4g=;
        b=gg4LQ42MnucpQRgNMHR4fA6AH2N6eZE1JPxL/haZQon9YOVYbtmkpMBsxeDVP4A+y6
         R+3BDVrgsLtRGRbCaD1YcSf+o+jZ+TLy6Ge/oBh+bkJ7RPviLaVGsotad+HJK/Kb89f+
         f2RLae/Ectxsw2H+7qIuVGX2KReuyN7psay8SziIUcx+ML1HyIM61aeN+kqHbHLCmv9N
         NISQKlpCIrnbBpqUD5wKKjvdfqNJQkHVbzTVWC5Y7XZyD2Ufu+6LSB7f5HXjM1DTqQ30
         Cx7ZwKMNS0rP8KXgSOz4T0UoG+mtajMb/qHi69o1Pf8U7/b7MChGB9xVU1eHQPMgXJV+
         MWVA==
X-Forwarded-Encrypted: i=1; AJvYcCWEyPwDBbEefPiJzZMuaK899PUdJE6vcpnGCGnz7ILRfdKfuiFa8Hh+4WOhLUFJhnVjKGAQtievSRI2/Ovu7dK1ip6AYcx7+t1C51hRCQ==
X-Gm-Message-State: AOJu0YxR5/UFizchirE3EigM+fvdASMML+mHb8U2VEEJoQ0c21S2woK4
	UYa8y8HVpeRPZPMPYvofJgMpvuPuy4RptbuMYPDAMB+Tk0J3MmJpANfaPty44XMY1P20McY/ein
	EosigaXrqXSpyX2VsVZDbGqfbJ/O0PIkldMbuOw==
X-Google-Smtp-Source: AGHT+IFViT90qoDfNv/+HMMVSkIOCuMMMRX1j2q+fmbWxlh4TJnkk6Ect2I8Rn3bLy8gy7ZkC9SPpdBwFMOLjbGbeMI=
X-Received: by 2002:a25:c141:0:b0:dc7:5c37:5420 with SMTP id
 r62-20020a25c141000000b00dc75c375420mr13394794ybf.60.1712141475267; Wed, 03
 Apr 2024 03:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-6-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-6-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 13:51:04 +0300
Message-ID: <CAA8EJprvAiOYnzJNduhr9MZe6asfE5ygtupTNbp4dcXD-U8jsA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
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
> Support slice_per_pkt in msm driver.
>
> Note that the removed "pkt_per_line = slice_per_intf * slice_per_pkt"
> comment is incorrect.
>
> Also trim the code to simplify the dsc reference.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 35 ++++++++++++++---------------------
>  1 file changed, 14 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index b0507a42ee6a..0c6f40dbd25c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -866,17 +866,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>
>         total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> -       bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
> -
> +       bytes_per_pkt = dsc->slice_chunk_size * dsc->slice_per_pkt;

Please don't mix cleanup and functional changes.

>         eol_byte_num = total_bytes_per_intf % 3;
>
> -       /*
> -        * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
> -        *
> -        * Since the current driver only supports slice_per_pkt = 1,
> -        * pkt_per_line will be equal to slice per intf for now.
> -        */
> -       pkt_per_line = slice_per_intf;
> +       pkt_per_line = slice_per_intf / dsc->slice_per_pkt;
>
>         if (is_cmd_mode) /* packet data type */
>                 reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
> @@ -916,6 +909,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  {
>         struct drm_display_mode *mode = msm_host->mode;
> +       struct drm_dsc_config *dsc = msm_host->dsc;

And here too. Please pull msm_host->dsc change to a separate patch.

>         u32 hs_start = 0, vs_start = 0; /* take sync start as 0 */
>         u32 h_total = mode->htotal;
>         u32 v_total = mode->vtotal;
> @@ -947,8 +941,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                 hdisplay /= 2;
>         }
>
> -       if (msm_host->dsc) {
> -               struct drm_dsc_config *dsc = msm_host->dsc;
> +       if (dsc) {
>                 u32 bytes_per_pclk;
>
>                 /* update dsc params with timing params */
> @@ -988,14 +981,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                 else
>                         bytes_per_pclk = 3;
>
> -               hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
> +               hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(dsc), bytes_per_pclk);
>
>                 h_total += hdisplay;
>                 ha_end = ha_start + hdisplay;
>         }
>
>         if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> -               if (msm_host->dsc)
> +               if (dsc)
>                         dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
>
>                 dsi_write(msm_host, REG_DSI_ACTIVE_H,
> @@ -1016,21 +1009,17 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                         DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>                         DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>         } else {                /* command mode */
> -               if (msm_host->dsc)
> +               if (dsc)
>                         dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
>
>                 /* image data and 1 byte write_memory_start cmd */
> -               if (!msm_host->dsc)
> +               if (!dsc)
>                         wc = hdisplay * mipi_dsi_pixel_format_to_bpp(msm_host->format) / 8 + 1;
>                 else
>                         /*
>                          * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
> -                        * Currently, the driver only supports default value of slice_per_pkt = 1
> -                        *
> -                        * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
> -                        *       and adjust DSC math to account for slice_per_pkt.
>                          */
> -                       wc = msm_host->dsc->slice_chunk_size + 1;
> +                       wc = dsc->slice_chunk_size * dsc->slice_per_pkt + 1;
>
>                 dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>                         DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> @@ -1657,8 +1646,12 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>         msm_host->lanes = dsi->lanes;
>         msm_host->format = dsi->format;
>         msm_host->mode_flags = dsi->mode_flags;
> -       if (dsi->dsc)
> +       if (dsi->dsc) {
>                 msm_host->dsc = dsi->dsc;
> +               /* for backwards compatibility, assume 1 if not set */
> +               if (!dsi->dsc->slice_per_pkt)
> +                       dsi->dsc->slice_per_pkt = 1;
> +       }
>
>         /* Some gpios defined in panel DT need to be controlled by host */
>         ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

