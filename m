Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECE105B6114
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 20:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbiILSgg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 14:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbiILSgT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 14:36:19 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF76491D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 11:32:11 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1279948d93dso25634833fac.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 11:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zpbDl2VRI0jEyf87pDBReXUMtBgWCD1C0nyYDSr/ErQ=;
        b=L0q09VYXhO9Z7vI+bvaNu/YjVjM7QHirWRa9UZYPNcq5g71v1YvRUzIYDTL+VcC0G8
         8LZ4wzg2kFU/TUuAKXmuJNFOo1fqt7hlaMJGh3MHMoO5pZOYlWmJwXDUukhhjp1MJ8iw
         tTTEqQFLx1Z6HtkOHDx0iQZf1GINQRMpDm4dZMfUF1zNwb/Hw07ZzhLePKh2Mos0ck/t
         /OsmEL7j8kClhAdICdRLh6ctjfE9I0HmNnH3EdQ7rmc20d5gE+x8EQxa2PPqeOhAoyba
         PejEPXFDSnatPmuWTfBTIy1KWAX/nj+X7S5khfptujRFqOJSZlyBOp5L08WrBf01/Caq
         CqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zpbDl2VRI0jEyf87pDBReXUMtBgWCD1C0nyYDSr/ErQ=;
        b=JhhCzyeNv3b5BNDeokFdgJ6AMBijnLGpAEYZ0TPOgZyCQmvfDeDRKl73A0+o5fByWV
         iT3NOri3lBgTsTlJKN5Ypd2Cf4hhVGM6taTvnoXA1POgjID8sAc6KSyol4DG9de/silI
         N8K2DIEq5n4ySLn0M4U9tKeuLvTTYAzNoJ0aTIPxmUZdlabEUr1GiEygFYiCQOC6ROIJ
         6ScZ9t039xCzsR5Q9ad+fSu9mEyNBfCqpy6r11sE9Dz6L840m6+WOLV/Yf8FzLHMX5Dw
         ctk9Bc4fsFqUF+2nUe/vPykzXoPQv9ffntXqDVj2xRTUmL68INsbFWiEb9ZjSL9IotM3
         Tdxw==
X-Gm-Message-State: ACgBeo0yZRm/XRFGW/MXOSOOEGbHlGj7b1l0KnUYzPfYwnHCPLzXMZGB
        t5uHRd7eNS88ifyDWtJzgXEQGPEuLLe9a9MsFux91qLN
X-Google-Smtp-Source: AA6agR6GnImjTj9JSjWMVZx/NyAr25mw2+kIGF6biUaSjd1wf5WUIxb0AWaugopgce/Jg2M4tKdZhNOZBcTvumd4ts4=
X-Received: by 2002:a05:6871:14e:b0:127:3f08:4599 with SMTP id
 z14-20020a056871014e00b001273f084599mr12351803oab.183.1663007529847; Mon, 12
 Sep 2022 11:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220901203422.217-1-quic_jesszhan@quicinc.com> <20220901203422.217-2-quic_jesszhan@quicinc.com>
In-Reply-To: <20220901203422.217-2-quic_jesszhan@quicinc.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 12 Sep 2022 11:32:00 -0700
Message-ID: <CAF6AEGu1X6aPn8d-sE98PnmhkDEm6sJ6zT=yFN+h7Vum8TspgQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: Add support for XR30 format
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
        swboyd@chromium.org, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 1, 2022 at 1:34 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Add support for XR30 color format. This supports both linear and
> compressed formats.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 1 +
>  3 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index f436a1f3419d..57971c08f57c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -524,6 +524,12 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
>                 true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
>                 DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
>
> +       INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
> +               COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +               C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> +               true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
> +               DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
> +
>         PSEUDO_YUV_FMT_TILED(NV12,
>                 0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
>                 C1_B_Cb, C2_R_Cr,
> @@ -571,6 +577,7 @@ static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
>                 {DRM_FORMAT_XBGR8888, COLOR_FMT_RGBA8888_UBWC},
>                 {DRM_FORMAT_XRGB8888, COLOR_FMT_RGBA8888_UBWC},
>                 {DRM_FORMAT_ABGR2101010, COLOR_FMT_RGBA1010102_UBWC},
> +               {DRM_FORMAT_XRGB2101010, COLOR_FMT_RGBA1010102_UBWC},
>                 {DRM_FORMAT_XBGR2101010, COLOR_FMT_RGBA1010102_UBWC},
>                 {DRM_FORMAT_BGR565, COLOR_FMT_RGB565_UBWC},
>         };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0239a811d5ec..53b6edb2f563 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -156,6 +156,7 @@ static const uint32_t plane_formats[] = {
>         DRM_FORMAT_RGBX8888,
>         DRM_FORMAT_BGRX8888,
>         DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_XRGB2101010,
>         DRM_FORMAT_RGB888,
>         DRM_FORMAT_BGR888,
>         DRM_FORMAT_RGB565,
> @@ -184,6 +185,7 @@ static const uint32_t plane_formats_yuv[] = {
>         DRM_FORMAT_RGBA8888,
>         DRM_FORMAT_BGRX8888,
>         DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_XRGB2101010,
>         DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_XBGR8888,
>         DRM_FORMAT_RGBX8888,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index a617a3d8b1bc..60ea834dc8d6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -69,6 +69,7 @@ static const uint32_t qcom_compressed_supported_formats[] = {
>         DRM_FORMAT_ARGB8888,
>         DRM_FORMAT_XBGR8888,
>         DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_XRGB2101010,
>         DRM_FORMAT_BGR565,
>
>         DRM_FORMAT_NV12,
> --
> 2.35.1
>
