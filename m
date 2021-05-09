Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF0D237778C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 May 2021 18:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhEIQ0A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 May 2021 12:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhEIQZ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 May 2021 12:25:59 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F569C061573;
        Sun,  9 May 2021 09:24:55 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id p14-20020a05600c358eb029015c01f207d7so1782408wmq.5;
        Sun, 09 May 2021 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eDSzWlroomnQ5h3Y6dUDqkb1FsjYS2fbu1DIxKf7c3A=;
        b=cQozjKYypAyMo0LvueEtTElyTE89pbNeSyAoFIrXqpB1CpGFAdKfj7MVmVliTQj8q9
         wbN9Nxi/zHWx8eZu4r9G59UNIuDM6+PtVjJiN1YBECdhW71T2vjY0vnnH5KpALtLXFek
         Xums8DkBafio8UuYgRN6YGcnQQRUZ7H6hxO6genyBZWTKwj++V9YdtZ3QHDHqaaghcw0
         LrUxJkyi8UDEjjDd62HYANDeBdcI1/zO6AyKgtL7RqSbdhV6FOcfX+TDgbk/PyD7lON2
         dFL9H5Ud8wOUsk18ENiOcnGSzTpQdTOdnKUTTVRdfeoCeApLMmQXb+hoG1ZkZIynMuzG
         IsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eDSzWlroomnQ5h3Y6dUDqkb1FsjYS2fbu1DIxKf7c3A=;
        b=ipGKHVR38A3t+8ElbNtGS+CpQ2DmpUaLyJowlL5SRLc/IEquv5EAkHTW6KwnssRm/c
         uUZymeXKq50B9aOb7urbgSAyde4u5SOUsl6KQEEoNPZAyoJO1YBF5lZtMN1bo50A4D7Y
         zO2ds6Zd7bcjIgXPEqo5NVjapeFAVSzTs72TX0/Uhy3xWr4FDrZU/Cj2o3n7aF7Z5YaF
         f1pUiixPOx+3i0Teh1Cz0HRNYx3rdZjV4iEQ1eQmnwz6KYbuYDDouSlIWwZ8Mu3t1Za+
         rQQpeAkuWEbMBNgHtwR876tDeYUl1aynLsuUVLCTNf5TjHlrvf2yFd5ElsYvZbgXql0P
         6Gcg==
X-Gm-Message-State: AOAM531A0P3QnlfimQLDofjCsXNQLK0StfNdJq9daVEuEaQMqo4CXwc5
        2Fro1IhUvJJt0ni1ylQ4au7RJZGEgu7MrGG7ZQI=
X-Google-Smtp-Source: ABdhPJxCTH5X6v8qARUz2sTxBc7o5z4ShukPhUKB3YkniYCZ9F1AhWzx8i6yLXakzqyxm36pS5Poti9A3Xxakw2v9vQ=
X-Received: by 2002:a7b:c101:: with SMTP id w1mr33251557wmi.164.1620577493717;
 Sun, 09 May 2021 09:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210508195641.397198-1-robdclark@gmail.com> <20210508195641.397198-3-robdclark@gmail.com>
In-Reply-To: <20210508195641.397198-3-robdclark@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 9 May 2021 09:28:35 -0700
Message-ID: <CAF6AEGvWJuOQqf7QqoVHB3CSM_uhgRLh3JZVFa=4m+FiD-hu3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: Wire up needs_dirtyfb
To:     dri-devel <dri-devel@lists.freedesktop.org>
Cc:     Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Hongbo Yao <yaohongbo@huawei.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        Ryan Houdek <Houdek.Ryan@fex-emu.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, May 8, 2021 at 12:53 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

From Ryan (sending this for him because mailing list workflow is lame):

I have tested this on my end and it resolves the 120hz problem.

Tested-By: Ryan Houdek <Houdek.Ryan@fex-emu.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 5a74f93e29da..868ee6136438 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -143,6 +143,19 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>         return true;
>  }
>
> +static bool dpu_crtc_needs_dirtyfb(struct drm_crtc *crtc)
> +{
> +       struct drm_encoder *encoder;
> +
> +       drm_for_each_encoder_mask (encoder, crtc->dev, crtc->state->encoder_mask) {
> +               if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_CMD) {
> +                       return true;
> +               }
> +       }
> +
> +       return false;
> +}
> +
>  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>                 struct dpu_plane_state *pstate, struct dpu_format *format)
>  {
> @@ -1343,6 +1356,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>         .atomic_begin = dpu_crtc_atomic_begin,
>         .atomic_flush = dpu_crtc_atomic_flush,
>         .get_scanout_position = dpu_crtc_get_scanout_position,
> +       .needs_dirtyfb = dpu_crtc_needs_dirtyfb,
>  };
>
>  /* initialize crtc */
> --
> 2.30.2
>
