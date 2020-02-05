Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 512FE153A0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 22:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbgBEVUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 16:20:23 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46859 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbgBEVUX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 16:20:23 -0500
Received: by mail-ed1-f66.google.com with SMTP id m8so3602340edi.13;
        Wed, 05 Feb 2020 13:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e7ctqcNXKJ4J7Rbtx+8HIj89/Qd282lOdjeL/AdHVMA=;
        b=Mhx7s0fjyUSMiVNQu9nnEnqFES3z8zSim8rJaQ7k5ciMv+L7zY7Pi+c9Ob/Jd+EbWP
         bDhAlqaenLiQNmcmB0APeOgF0lDIKMTiiqW7ErsHgU0D7Sl11UANTmvfNH9CLwqlBvuB
         NC5mUkAlJSyHVCul3gQbk23DVVqsf+weFxILl2okeAuyV9bKARLA4dOYOGBKO9WVVeg4
         0en7KmrcNYTIY1R1CYKraZG/yjIcB3wP15RuQaOlAWW2fnoxc59Yr8RlFaQ5U5vQYe99
         tR5+7+8IQ+mk+yJGefymD/BrtIY6O88VB03d5PUIUWLEU7dZKXUL9521K6MJGHHPDNG8
         qTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e7ctqcNXKJ4J7Rbtx+8HIj89/Qd282lOdjeL/AdHVMA=;
        b=ckGg6ePMm+1nL67hc3EN++WRJPvsk0lG2zO8bFpgs1X74lFSO74Uf7oQUhvSM3P4FW
         3A3UD/0E5o1wVl2F64ACljA5Vp1xf7KjDrxC3EQo8uxyNUNhgH0UDghkTZCzPO+1G9hG
         l/g/AOjPTDjIQpffeSjBMJ/RNF6Jx3PXdOs0ec3BWug+UeYcAmhnz4tGLBNhAyseeRSn
         9jJwgxVsiZAjuKluJp9b//9NH78gkA9mo8gmAZMTBtFuR054FnVPaBnxeYYcOCok/wqd
         o4CXfUN/gXquz9usE4y+F72GIsv+zq+Xgr6MAkTddu1D1T9LXWpZPRv0pzEotkQXQdYg
         N5Eg==
X-Gm-Message-State: APjAAAXPsTf3Am0nUcqvdpZFdJKloHvOpSgm8HyVlvC1gqrLC2fwUF9w
        Orkg1ziPJkuy87aRKuIAXI4efbl+rO++BpGrnTE=
X-Google-Smtp-Source: APXvYqw+4BoMeXE7ATmoxBXfP94qPHEx7iBMWM46BCgH3fI3IE7J2zo9bio3AGkU8AnyryBslEZ7nwG2DoXaYG2NRjI=
X-Received: by 2002:aa7:c3c2:: with SMTP id l2mr157256edr.120.1580937621575;
 Wed, 05 Feb 2020 13:20:21 -0800 (PST)
MIME-Version: 1.0
References: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 5 Feb 2020 13:20:10 -0800
Message-ID: <CAF6AEGuAT77aW+1Vh82oAoNCxSHsNNH5L8aRqsnVFV2CrDGaow@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Remove unneeded GBIF unhalt
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 4, 2020 at 9:42 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") added a
> universal GBIF un-halt into a6xx_start(). This can cause problems for
> a630 targets which do not use GBIF and might have access protection
> enabled on the region now occupied by the GBIF registers.
>
> But it turns out that we didn't need to unhalt the GBIF in this path
> since the stop function already takes care of that after executing a flush
> but before turning off the headswitch. We should be confident that the
> GBIF is open for business when we restart the hardware.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>
Fixes: e812744c5f95 ("drm: msm: a6xx: Add support for A618")

> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index daf0780..e51c723 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -378,18 +378,6 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>         int ret;
>
> -       /*
> -        * During a previous slumber, GBIF halt is asserted to ensure
> -        * no further transaction can go through GPU before GPU
> -        * headswitch is turned off.
> -        *
> -        * This halt is deasserted once headswitch goes off but
> -        * incase headswitch doesn't goes off clear GBIF halt
> -        * here to ensure GPU wake-up doesn't fail because of
> -        * halted GPU transactions.
> -        */
> -       gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> -
>         /* Make sure the GMU keeps the GPU on while we set it up */
>         a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>
> --
> 2.7.4
