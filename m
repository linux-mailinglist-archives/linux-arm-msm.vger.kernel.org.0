Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D0F352D1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 18:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235908AbhDBPVJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 11:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235435AbhDBPVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 11:21:09 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB958C0613E6;
        Fri,  2 Apr 2021 08:21:07 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id d191so2654415wmd.2;
        Fri, 02 Apr 2021 08:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WP3VoNZ5+TpRVICeSpHKbkMESNKhKPPMgvYTDtFR2No=;
        b=efsvJeDH4bfJGtQdkNbnC9ctwhORj113XksECOyNa6qnTIizlFnNbshKjAd28C9NlE
         xYKFm+dLni/z0kazJRzB3W1BZ7WwvreVw++K3NB2znXjFCTIHack9TTS3IWOrlD55WuS
         KPUXjY8jP9nKMcDlCNUenwEJitCZbY1qHUVO8VKFEXZBw6kY5W3CzArvXH36OXdqx8lB
         TPnbpIqax2bgGz9IjKpSswkfw4szZXVHzbY9ovIAxw4Evghu24HGSx/RRS+UwLPUBtyH
         348aIxdoekK6fHqAokkMLa+uY/BFgnigXlHeB+B51hmHiyhj4XYjJ4m7WdIcOcoAmXGT
         IMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WP3VoNZ5+TpRVICeSpHKbkMESNKhKPPMgvYTDtFR2No=;
        b=fmpG8KdYupIN+VAnLqV14+U+tqtMCJsleNdg6eY5KvQj/Cc4Jpl57zgmz8KN9vQPD4
         Txdz/UmTbE3wtjNoUdnMlErgUMAMyJnSZBaJkruLfQ1410M45BN/fvZRFzyIFSm17ej+
         vbavpC6j5EFSI4KO6wyDvHM+YisKKrlWnNvco6nknY0pwP7Mh6FyXFQ5B2g418Kx1Iti
         lUosIoT9wflgKSQZat+Ag5jdRNHZocOl9ScBVEdJDfFQv4i5Ky0LRl1ikkFktrI3S48T
         jlWOYTBxTinpsAukhFCgmHcpvlAHBG/uUmRyj025grnC7GedtWk8umPgawYL2c2RcpwY
         hcrg==
X-Gm-Message-State: AOAM533SoJ3BK/BW8L7rPcZYQGeUvIfonYdVYW+Gu1cgh18KrA1bFdTX
        w4YU7qglVK3syaUQZgaX2/aRDOSCY4picJXZmxM=
X-Google-Smtp-Source: ABdhPJwbbQ7KmfS8gkvdcBnX8Vt1oOMeWn3SKmQPsX2LZHyur7qUbf39fZLg5ba9thU15fnffhc2jopzrJHXrPc2T/E=
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr13582268wma.94.1617376866612;
 Fri, 02 Apr 2021 08:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <1617364493-13518-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1617364493-13518-1-git-send-email-kalyan_t@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 2 Apr 2021 08:24:31 -0700
Message-ID: <CAF6AEGskP-TNTk33R=qSi39T3g=GttR8K_j+Qk4FQTo23Y7v-g@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: program 3d_merge only if block is attached
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     y@qualcomm.com, dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 2, 2021 at 4:55 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Update the 3d merge as active in the data path only if
> the hw block is selected in the configuration.
>
> Reported-by: Stephen Boyd <swboyd@chromium.org>

Thanks, I've added:

Fixes: 73bfb790ac78 ("msm:disp:dpu1: setup display datapath for SC7180 target")

> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 8981cfa..92e6f1b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -496,7 +496,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>
>         DPU_REG_WRITE(c, CTL_TOP, mode_sel);
>         DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
> -       DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, BIT(cfg->merge_3d - MERGE_3D_0));
> +       if (cfg->merge_3d)
> +               DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
> +                             BIT(cfg->merge_3d - MERGE_3D_0));
>  }
>
>  static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> --
> 2.7.4
>
