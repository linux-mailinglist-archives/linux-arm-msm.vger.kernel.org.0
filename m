Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DEF01F6AAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 17:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbgFKPOl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 11:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbgFKPOk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 11:14:40 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691D5C08C5C1;
        Thu, 11 Jun 2020 08:14:40 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id q19so6835876eja.7;
        Thu, 11 Jun 2020 08:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RhhbWkTa6xWV0deLfaJXoyvtvAs5iTNkvkhb8jfaq6Y=;
        b=V6b+DZohDm/hDfiEq33KTHTOYZKmKHXtH9CXlUKI9J3Rmnfq8hF9vsaZiV3GZbZkGN
         vQo1l0toScYIZhA50AZUN6pllNtCM51xVgBnmrqUjL46cPreHZNGj36MFoo9RLQxERso
         unyu1r2ieWrdTIfvdYZO6czJqKoHdr6E74rsBCHi08GzN+oE/ZMpMAHObv3HAhKkKhpP
         NHWyLSLgjxp6TJOJz4yiymx/S/ioV6GL8rV3K5magWDu9N3zM981N56CRWruTNB3DRcv
         bbTEZoirL61WiBzk51psQ6/RkDol54ZOnrpJvw5c3ollGbbxs027E5BLALrMLQjZaFBZ
         3ozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RhhbWkTa6xWV0deLfaJXoyvtvAs5iTNkvkhb8jfaq6Y=;
        b=SXvaqilEjD18MN2jqvhoZrgn9mwSVPf0mf5Dkf775fZpfdzSEbGGjbmtoZc5K0XVw1
         HwekTI5llYWrAG9IG4eOz4VpSqfMV3gzotRRf4T7//pIvv8hiluYNNvNcHyqFOc1mTxD
         Osj1tcBgIvAE3WaM6EhLs2XYn/C5NnW1mKAbhqj0OnSnkn0o4f9/Rnh7vFFa22hQAew5
         NGxxA5m8qJFIw8X5BCutHigJS0tEI0H/r5wta8rK6L+AWUn18PNyrRDSxqKMZH05z0lQ
         hPr6kXhyeEyyIGkC98fCYvuVIWVTH7Rs9GJQyDqEapQFZ/QKs6LjlOvNcAqQi795CIAp
         HFlg==
X-Gm-Message-State: AOAM532pMCeaSLs6woZTLTmxRDrKUd7Ig+S0HEeC29tT9U0PdojON5aa
        HXr7kAO72MXH63OXTYNrGpyE7n/LwX9AUDhaQzI=
X-Google-Smtp-Source: ABdhPJytx7mXiKtufAO92EdC9cVGt6I9RCacutPRVjzVuRfL1EdBtKdRZC45eZpis81SCNqGUNS/sYXxiSkjls/4Ke8=
X-Received: by 2002:a17:906:aac8:: with SMTP id kt8mr9063624ejb.460.1591888477088;
 Thu, 11 Jun 2020 08:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 11 Jun 2020 08:15:03 -0700
Message-ID: <CAF6AEGtczybJU=_MUnGK3uzfnbgh-PDgAZmp7Fod=9Fc0T=fjg@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: request for display color blocks based on hw
 catalog entry
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        nganji@codeaurora.org, Matthias Kaehlcke <mka@chromium.org>,
        John Stultz <john.stultz@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 11, 2020 at 5:55 AM Krishna Manikandan
<mkrishn@codeaurora.org> wrote:
>
> From: Kalyan Thota <kalyan_t@codeaurora.org>
>
> Request for color processing blocks only if they are
> available in the display hw catalog and they are
> sufficient in number for the selection.
>

I believe this should have:

Fixes: e47616df008b ("drm/msm/dpu: add support for color processing
blocks in dpu driver")

> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 63976dc..9f8de77 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -521,7 +521,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>                         struct dpu_kms *dpu_kms,
>                         struct drm_display_mode *mode)
>  {
> -       struct msm_display_topology topology;
> +       struct msm_display_topology topology = {0};
>         int i, intf_count = 0;
>
>         for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> @@ -537,7 +537,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
>          * 1 LM, 1 INTF
>          * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>          *
> -        * Adding color blocks only to primary interface
> +        * Adding color blocks only to primary interface if available in
> +        * sufficient number
>          */
>         if (intf_count == 2)
>                 topology.num_lm = 2;
> @@ -546,8 +547,11 @@ static struct msm_display_topology dpu_encoder_get_topology(
>         else
>                 topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>
> -       if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI)
> -               topology.num_dspp = topology.num_lm;
> +       if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> +               if (dpu_kms->catalog->dspp &&
> +                       (dpu_kms->catalog->dspp_count >= topology.num_lm))
> +                       topology.num_dspp = topology.num_lm;
> +       }
>
>         topology.num_enc = 0;
>         topology.num_intf = intf_count;
> --
> 1.9.1
>
