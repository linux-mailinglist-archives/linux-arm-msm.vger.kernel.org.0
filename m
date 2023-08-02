Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69F0376D6CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 20:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbjHBSW5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 14:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234314AbjHBSWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 14:22:49 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDAD31BD5
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 11:22:44 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5860c7fc2fcso323447b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691000564; x=1691605364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae5epmyMSgwEaKPoiZdDHz+XlPWQsao3AH8Jqs9WmdU=;
        b=UuqXKQfOGoWGMgGrhbzQ7Wa0/vXE/PUmfIVrIYA9KkQvmIFU/S5Eo9JvSfi0pm11uu
         VyHZup/WLbdqVsF0nfd5Ho2XcMC+1tlM9ssgHC0FQstbia3K70xkAzuV0SNyAs/DzKQt
         kmlPg8Sb+MSfYIwSBqS3H8dPFn3WYFmE0eDMVeA/EnYkoHXGoRFnz+uEx1Gy3qGQbnoV
         9l3MOYYUM9CXOZ9KjIy57KCeno+2RambOPlV02yrJSN29vjf62d/1peDAzGVb+FaLOh9
         ZKdDM8oRS70Ri/LQHtPVXCmXMm/a4NihlVaTAPODCRZYzceXEGpapsv7QZnsHaK1PhM8
         IudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691000564; x=1691605364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae5epmyMSgwEaKPoiZdDHz+XlPWQsao3AH8Jqs9WmdU=;
        b=QkMR0MNUCdDLlGjpgTSgcuM2uwdAV7Grkb3LUP61cZK8TyO/txU6PkQRG2gpKsuY4u
         HOW0zoMFp6I7hCvXkl6n8pBkrpuDLXwd/yEvU9QR2ZBe8mDx4V3figP9cOxfbfJJxDYc
         OTVyCL/tPTD5ro/BQToSmdbAKhF+Z9/rID7C7U070x6jqpsdKfu8YvAtYEpf8dAnuCXq
         mVdc543B2zLN2nWFQmBZQr8OGJS1lPmkhxqKoBGjCvQVvFtmLts060+p0TYhsRExsqFp
         Sn0qhuWkmuZRfF7u4Zjmln0UuxmvjCcsSlDkG/Ma7wEiHTkL/sxX/btJhngUpqcImQ3G
         DSsA==
X-Gm-Message-State: ABy/qLZIsgar0/uaICfmYrMlkd5ow7jEursf1jF0nkE7VKDNr6Znx7sD
        Ltx0gQLOqqIKzzUFHdtfUVGdYgFmIRR8qDU8sPgBTw==
X-Google-Smtp-Source: APBJJlGZ6j6qKs+9G6d2w79KwHIPTThBY36/+BubF52WqifMDyo3N6LxG7I0oOMtg4goYv9jDrIm2vRKw2e81Yj1nck=
X-Received: by 2002:a25:5542:0:b0:c12:29ac:1d3b with SMTP id
 j63-20020a255542000000b00c1229ac1d3bmr13193825ybb.11.1691000563690; Wed, 02
 Aug 2023 11:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com> <20230802-add-widebus-support-v3-1-2661706be001@quicinc.com>
In-Reply-To: <20230802-add-widebus-support-v3-1-2661706be001@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 2 Aug 2023 21:22:32 +0300
Message-ID: <CAA8EJpogs_AsU5CG22m+azdGvDdyDuJE+89n67EoBxmoFtTsWQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/msm/dpu: Move DPU encoder wide_bus_en setting
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, quic_abhinavk@quicinc.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2 Aug 2023 at 21:09, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Move the setting of dpu_enc.wide_bus_en to
> dpu_encoder_virt_atomic_enable() so that it mirrors the setting of
> dpu_enc.dsc.

because ... ?

>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Other than the commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index d34e684a4178..3dcd37c48aac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1194,11 +1194,18 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>         struct dpu_encoder_virt *dpu_enc = NULL;
>         int ret = 0;
>         struct drm_display_mode *cur_mode = NULL;
> +       struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +       struct msm_display_info *disp_info;
>
>         dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       disp_info = &dpu_enc->disp_info;
>
>         dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
>
> +       if (disp_info->intf_type == INTF_DP)
> +               dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
> +                               priv->dp[disp_info->h_tile_instance[0]]);
> +
>         mutex_lock(&dpu_enc->enc_lock);
>         cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
>
> @@ -2383,10 +2390,6 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>         timer_setup(&dpu_enc->frame_done_timer,
>                         dpu_encoder_frame_done_timeout, 0);
>
> -       if (disp_info->intf_type == INTF_DP)
> -               dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
> -                               priv->dp[disp_info->h_tile_instance[0]]);
> -
>         INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>                         dpu_encoder_off_work);
>         dpu_enc->idle_timeout = IDLE_TIMEOUT;
>
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
