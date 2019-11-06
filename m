Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA37EF1B03
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 17:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbfKFQTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 11:19:13 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44956 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbfKFQTM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 11:19:12 -0500
Received: by mail-ed1-f65.google.com with SMTP id a67so7716966edf.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 08:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hNEMiEOnnDjsgTbazzB3mAQ9dZ4k0jiMKw0yiocJJ5c=;
        b=iUBciG0lUMovt7WWfhcwtB40mIB7G5EXKAcWjL+0PPDv5UJLTdPPmd3pxJvznaYmBK
         cZKpRR37P/xJJeukCSR2OtUHUV+teiR7QkOov1F6M6RXu+Cwn2Y9c60z9z6z0ibebOez
         u8dTAWft04aok/k5vIKQ/CfXfTEPui+eOw5xkdPMfs8QG081K+4wfscP7AdHTDob3zX+
         +Jom4JgAv3DfQEVS1BKx/DfDdjdccMz5ggh9bZNla5E+B2QMhFG+70VDvaht3d5Rcn54
         g+VKTyYOSZXm4LsW3dP/i734UMmoBhAWX4vJbKyGzclYNtV/wq+4r8NA7mPITjr2dA7J
         kpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hNEMiEOnnDjsgTbazzB3mAQ9dZ4k0jiMKw0yiocJJ5c=;
        b=Pgl0TSPco5Z7g8yLihJh4ltoFFloc9N0HteyGuXRsi+zUNaXQAwwcEN/IYRDthzWEC
         RxD7balzpayfg8zEtO7r03lGOLMjoST7ZO9Lfr3tKGRMI2jxoGtNxaXL37rQjsMGIBnz
         oN0if5ajaTgvJ1trmvhhRdffDL2rqBEBVy47XNlZU3F21KQyUMHbJuVUIVX8+1VsiMZ0
         2e4JamdMh/J0PKhQm2uSeVPgUW7cyx6Bqg3WDiY6wUsFDYuvEQ6Iv7wAu6xNFhvJ+Mwn
         jVhu9TFEozcAkl/jZecCyO59B5d/ukoSWBJ/kxt2ckZDWs2UnNufysFeWelh9wsbgEHb
         /WmQ==
X-Gm-Message-State: APjAAAX/GAiJUfNttM8W8eM+8kC7DwQofNFXaUBzOP7OEJHITP73IFQ/
        L4Tjdvqj8kXI3340YqJNf+nzw7Zt0PGPhoPz29A=
X-Google-Smtp-Source: APXvYqztQa03nrJC/zMMrJ2TpWHwIt22SrIjQj3LuPPI/2j0RoWKnnhWmMtUgB1S5l4RJ3GajcZ9QJxLIhAcTldX2lM=
X-Received: by 2002:aa7:d3da:: with SMTP id o26mr3685747edr.302.1573057150709;
 Wed, 06 Nov 2019 08:19:10 -0800 (PST)
MIME-Version: 1.0
References: <1573040963-24148-1-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1573040963-24148-1-git-send-email-smasetty@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 6 Nov 2019 08:18:59 -0800
Message-ID: <CAF6AEGtdEDAYg9bqKREv34aWiXR+uwEg+xsyJS_ySs4+-sFumg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm: msm: a6xx: fix debug bus register configuration
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 6, 2019 at 3:49 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> Fix the cx debugbus related register configuration, to collect accurate
> bus data during gpu snapshot. This helps with complete snapshot dump
> and also complete proper GPU recovery.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

(adding fixes tag for benefit of stable kernels)

Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 483e100..c5764b4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -353,26 +353,26 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
>                 cxdbg = ioremap(res->start, resource_size(res));
>
>         if (cxdbg) {
> -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_CNTLT,
> +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLT,
>                         A6XX_DBGC_CFG_DBGBUS_CNTLT_SEGT(0xf));
>
> -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_CNTLM,
> +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLM,
>                         A6XX_DBGC_CFG_DBGBUS_CNTLM_ENABLE(0xf));
>
> -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_0, 0);
> -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_1, 0);
> -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_2, 0);
> -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_3, 0);
> +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_0, 0);
> +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_1, 0);
> +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_2, 0);
> +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_3, 0);
>
> -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_0,
> +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_0,
>                         0x76543210);
> -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_1,
> +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1,
>                         0xFEDCBA98);
>
> -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_0, 0);
> -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_2, 0);
> -               cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_3, 0);
> +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_0, 0);
> +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_2, 0);
> +               cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_3, 0);
>         }
>
>         nr_debugbus_blocks = ARRAY_SIZE(a6xx_debugbus_blocks) +
> --
> 1.9.1
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
