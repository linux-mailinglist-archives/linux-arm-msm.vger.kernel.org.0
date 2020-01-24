Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66FC0148B70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 16:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389240AbgAXPqX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 10:46:23 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41015 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389064AbgAXPqX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 10:46:23 -0500
Received: by mail-ed1-f67.google.com with SMTP id c26so2746842eds.8;
        Fri, 24 Jan 2020 07:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NE3aiQszngEl/i5B8XOMfRsuYNGxae+vatiEahI26NA=;
        b=lIrmGPVnZYQWikeBK2Um2t6CV95XnstHmc5/hdWTSBbcqQ5CgqFjEZepUwga1V8uRE
         /yIPlBlghAA0djsFM9c/79B9/OelTnjo4mPQFTiPVic680JSOYl0MfWimcYzxZb+fvSS
         pWMl3Vpoz9TJubn9J3NhtNc1Dap4gYAHQ6QKkcmaXMadMPdwnzOvZkPr+hx+x+DGsBg/
         tt7Oosf1IH49+t9BdjO/G7jTkIxdZjHAPoaEEV2TUbni/W9/8YAyaryMhyP90vq9GaJG
         JydbbXuvS/h++l/QYitW4TBCw2bfKOkgdP4WXwAuEpRXwjZAZ6r0ZjG+xf23U4SGGRM2
         UqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NE3aiQszngEl/i5B8XOMfRsuYNGxae+vatiEahI26NA=;
        b=Zl1dd1aYWr+3271/v4ahjB9S7an+gqFp/BOm7eN1umgasuxgBfKkLnPWDfRL4HUj6E
         O9CDDZ/la2zC4O8n/t6zVznBIovLXrVRpubnpcYy/mjYc0XrQTqaV3fn0QKeZpLuOl8Z
         gwNC8uzuHdanE4gVxfp3Tkc6tgWClqxYpSWnWq6O+0qEkrn7vtakRfPahVJr4WSLFsMO
         Cd3qVQMKQbh0QXaayxQd299ncf9/9PuP85OsS4CTXqvJnTChqM0JdrwiUGbFNLmjbF71
         J3w7t9WCexCakAjnflWRxRCkOPt934s4dbZ/5vAHkk6lCujYQovtsxjIF59CqEs29R5E
         e0Dg==
X-Gm-Message-State: APjAAAURW/VYSZbjaZnj2iRIriXX/38YacbeADJ4wKErVjtABcYIl8Kn
        0sDaIxYmOfRetneNqDEStF0V1abTPMBZVSfaRVk/Oy9X
X-Google-Smtp-Source: APXvYqzr/miwHthTdWEaxos07mltjrS+dD/PMEyGO+b11mE7lhcZWdZO16H3hMQzHIhR1oyFyPiQgLEeiW1joLnTaMA=
X-Received: by 2002:a17:906:a44d:: with SMTP id cb13mr3333605ejb.258.1579880780744;
 Fri, 24 Jan 2020 07:46:20 -0800 (PST)
MIME-Version: 1.0
References: <1579868411-20837-1-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1579868411-20837-1-git-send-email-akhilpo@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 24 Jan 2020 07:46:09 -0800
Message-ID: <CAF6AEGtgbNSMnX3Bd6HKoEhViwKj64YkDPkATiqHAY87_gpT2w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: Correct the highestbank configuration
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        dri-devel@freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 24, 2020 at 5:50 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> Highest bank bit configuration is different for a618 gpu. Update
> it with the correct configuration which is the reset value incidentally.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

Thanks, this fixes the UBWC issues on a618

Fixes: e812744c5f95 ("drm: msm: a6xx: Add support for A618")
Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index daf0780..536d196 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -470,10 +470,12 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         /* Select CP0 to always count cycles */
>         gpu_write(gpu, REG_A6XX_CP_PERFCTR_CP_SEL_0, PERF_CP_ALWAYS_COUNT);
>
> -       gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
> -       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
> -       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
> -       gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
> +       if (adreno_is_a630(adreno_gpu)) {
> +               gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
> +               gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
> +               gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
> +               gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
> +       }
>
>         /* Enable fault detection */
>         gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL,
> --
> 2.7.4
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
