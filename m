Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C893F34A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 17:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfKGQaM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 11:30:12 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35079 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfKGQaL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 11:30:11 -0500
Received: by mail-ed1-f67.google.com with SMTP id r16so2424552edq.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 08:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C0moOTP/dTLJl+UGwCydN3eAk50x1pnImwPvsWucqYQ=;
        b=hTGwNOVN5twQ8B5yx2itJ0Vqcm9LY+Tt8/WPbad4rGuMuel4z7OxNSAVB/XGDh5/+K
         6g4XENKOgPTY59OGdbRT0ZuldwOUV7+UfY4SJvqyLxwb4VG3AXm/KTipU8NZowYBSGkA
         9RPn9cQ5rwAw3fU00CQuEgkmeqxCMr6SQHFIbi5oQp32kO+Sjwzqgzpx//vlQmZM0Gd8
         1aY0+MXvJFh2FI+M4pA5mCbVSY9rYzyWuH/918/i3H/KqmLyOZBRuYTCZ9kxyfc52Q8s
         Dr0o1u8bvszIawW18ZpLrGC43zNqDdKkTz5/jWmCw/hgCukLAJtsGFmduf5GPiZ/mRjX
         Doqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C0moOTP/dTLJl+UGwCydN3eAk50x1pnImwPvsWucqYQ=;
        b=RsdWebEkBAgzGzCQmhA9xsbg/Ru+q1wDu8q5IuuylRQxmUx/VhZCoZbLdzDdGnEQxp
         yhLDxcpqtn1PzxXokYbi4ELxUpeWzUdhGeWGetPKw+ziqAHPcGEUxE1tWnbBowqtZdi+
         Dhx9qkdf5bsnSozqmvPKNfqqBvOTiQV+9XNasKQ5TJCYtSVpsyPgMiRqS3CrY1pFLJN9
         wPx905JT3Od6HUGBDn16t2p/Y7WZNopR0ihxqZaKsFKZT4e54tVDGZaggAFtCo2tSG1/
         0/CEgIzp43bH5fG6t8kCAKZ9wGGG268SE0hMu27jnVCLwWhtRsnug19Ezu713B5zAcLJ
         sA1g==
X-Gm-Message-State: APjAAAX5Kw8NcOcGJZS1wUuED0SF9mPlYSrzlIycnjXmsQctLcmQJP/r
        z7IDjS/x6IKZkc75Vie/D+MedTahx/xH4NHL/+s=
X-Google-Smtp-Source: APXvYqzjxayiMa9on5bajzeLOCAch20QLpYMVqHEUQovVn0+Dmb26F6FbYYJf5JUnkP1urCTFCj9evmwtATPuED+d5A=
X-Received: by 2002:a50:9fcb:: with SMTP id c69mr4508631edf.163.1573144209948;
 Thu, 07 Nov 2019 08:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20191106232553.76553-1-frkoenig@google.com>
In-Reply-To: <20191106232553.76553-1-frkoenig@google.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 7 Nov 2019 08:29:59 -0800
Message-ID: <CAF6AEGuXv+ePcGtuN2XTFazrMrtyCYMjZOvYn5CZ3bKE2UhVQg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Add UBWC support for RGB8888 formats
To:     Fritz Koenig <frkoenig@google.com>
Cc:     Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 6, 2019 at 3:26 PM Fritz Koenig <frkoenig@google.com> wrote:
>
> Hardware only natively supports BGR8888 UBWC.
> UBWC support for RGB8888 can be had by pretending
> that the buffer is BGR.

Just to expand, this aligns with how we handle RGB component order in
mesa for tiled or tiled+ubwc.  If uncompressed to linear the component
order is RGB, but in tiled or tiled+ubwc, the component order is
always the hw "native" order (BGR) regardless of what the outside
world thinks.  But that detail kinda doesn't matter, it's not like
generic code is going to understand the tiled or tiled+ubwc format in
the first place.. and code that does understand it, knows enough to
know that tiled/tiled+ubwc is always in the native component order.

> Signed-off-by: Fritz Koenig <frkoenig@google.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 18 ++++++++++++++++++
>  .../drm/msm/disp/dpu1/dpu_hw_catalog_format.h  |  2 ++
>  2 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index 24ab6249083a..528632690f1e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -489,12 +489,28 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
>                 true, 4, DPU_FORMAT_FLAG_COMPRESSED,
>                 DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
>
> +       /* ARGB8888 and ABGR8888 purposely have the same color
> +        * ordering.  The hardware only supports ABGR8888 UBWC
> +        * natively.
> +        */
> +       INTERLEAVED_RGB_FMT_TILED(ARGB8888,
> +               COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +               C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> +               true, 4, DPU_FORMAT_FLAG_COMPRESSED,
> +               DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
> +
>         INTERLEAVED_RGB_FMT_TILED(XBGR8888,
>                 COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
>                 C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
>                 false, 4, DPU_FORMAT_FLAG_COMPRESSED,
>                 DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
>
> +       INTERLEAVED_RGB_FMT_TILED(XRGB8888,
> +               COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +               C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> +               false, 4, DPU_FORMAT_FLAG_COMPRESSED,
> +               DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
> +
>         INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
>                 COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
>                 C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> @@ -550,7 +566,9 @@ static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
>  {
>         static const struct dpu_media_color_map dpu_media_ubwc_map[] = {
>                 {DRM_FORMAT_ABGR8888, COLOR_FMT_RGBA8888_UBWC},
> +               {DRM_FORMAT_ARGB8888, COLOR_FMT_RGBA8888_UBWC},
>                 {DRM_FORMAT_XBGR8888, COLOR_FMT_RGBA8888_UBWC},
> +               {DRM_FORMAT_XRGB8888, COLOR_FMT_RGBA8888_UBWC},
>                 {DRM_FORMAT_ABGR2101010, COLOR_FMT_RGBA1010102_UBWC},
>                 {DRM_FORMAT_XBGR2101010, COLOR_FMT_RGBA1010102_UBWC},
>                 {DRM_FORMAT_BGR565, COLOR_FMT_RGB565_UBWC},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
> index bb6112c949ae..fbcb3c4bbfee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
> @@ -6,7 +6,9 @@
>
>  static const uint32_t qcom_compressed_supported_formats[] = {
>         DRM_FORMAT_ABGR8888,
> +       DRM_FORMAT_ARGB8888,
>         DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_BGR565,
>  };
>
> --
> 2.24.0.432.g9d3f5f5b63-goog
>
