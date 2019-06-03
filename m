Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70569332D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 16:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbfFCO4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 10:56:46 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:37553 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbfFCO4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 10:56:45 -0400
Received: by mail-it1-f194.google.com with SMTP id s16so27032102ita.2;
        Mon, 03 Jun 2019 07:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mDJyinIzAZyFYe2sQ1nvpl8lfVCu1z1DXV2UGQiSxUc=;
        b=a1wKahOOGnjNUHH39gwKMWenzErmEXnVRogYkXZKiMyndol9pbe5Mjh/SqhbeE/KTP
         fCgpVR7pWXw2wcjjsfLS99pMCnnxY476MDc9Il2x1dX9l50B3vRkW2lFeJ1OqAmw6LQN
         S/+8dbRcWLBv5lKHe8YOb83okaxNB2S0HiDpbxspR7hQmr73oe65MqAo9h+3ZRmzAFkv
         Ha8V57jnONibXaUmNOoSxPSR6J5G1zEPYv9ynfPl6DOh4Ow+GzqKVPJ0XjQXsowSgs8u
         gz1S8r7YdoPya0Moors6iQjh0Jz+FjxN9AILw3UMxRU2vQOKhtx6URpGC79z4m71j9ML
         ZyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mDJyinIzAZyFYe2sQ1nvpl8lfVCu1z1DXV2UGQiSxUc=;
        b=nUe9iGRIGm4FNyGojHIRKbToX9hhp/W9rLgbZNrqR/+nZHSEXQuy6yuLOk2aj3rUkF
         cUt32kQeoEnWOzZccxLub1CUlyIc8/q7V1Zq/hfpUMkAgei0uVgDLMzcqjSb3O9neRaK
         Vm2ycr4ZdzYIqHLIcqmT2cQJYNnF038dQRs87n2IrT5Jpovy5yPkEPMVkqWfmXRW2M0o
         X3M1CefaJlNmWmZ5LPUX86hLDhdV/uN4l6f4mhJSaePPxyU8IvHSUR6khaydxtt+J9BV
         jRwN7NAjrtcyLrC/9odKjGbOultcJU4LbfV1RH6KVQqUSlaFhdAqjQhyg78uUYMQtQJP
         AMag==
X-Gm-Message-State: APjAAAUtohS0ORpbrLD60JuuRPV/L3vq8QmfdbiqD1coML1VrWzsV2IV
        EiQ7v6vjQnPmDd8L0MwiDfUsVk9hDlRNT+KUp38=
X-Google-Smtp-Source: APXvYqyRg0Fg1qPHiU3BgdRlHNJ1G1zap/Jd1HuXxZCcEi4n2e10eRL07pYKaaPwzlSx5gUPRgdv2Ze3bkfZQ+Kxw5I=
X-Received: by 2002:a02:7121:: with SMTP id n33mr15499842jac.19.1559573804520;
 Mon, 03 Jun 2019 07:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <1559340578-11482-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1559340578-11482-1-git-send-email-jcrouse@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 3 Jun 2019 08:56:33 -0600
Message-ID: <CAOCk7Nr9r3Spnvh9_CO2rh8vTAP3hHOXjBO=5oGS4CyS4hhNrQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: Ensure that the zap shader
 region is big enough
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        Kees Cook <keescook@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 31, 2019 at 4:09 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Before loading the zap shader we should ensure that the reserved memory
> region is big enough to hold the loaded file.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

> ---
>
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 6f7f411..3db8e49 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -67,7 +67,6 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>                 return ret;
>
>         mem_phys = r.start;
> -       mem_size = resource_size(&r);
>
>         /* Request the MDT file for the firmware */
>         fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> @@ -83,6 +82,13 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>                 goto out;
>         }
>
> +       if (mem_size > resource_size(&r)) {
> +               DRM_DEV_ERROR(dev,
> +                       "memory region is too small to load the MDT\n");
> +               ret = -E2BIG;
> +               goto out;
> +       }
> +
>         /* Allocate memory for the firmware image */
>         mem_region = memremap(mem_phys, mem_size,  MEMREMAP_WC);
>         if (!mem_region) {
> --
> 2.7.4
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
