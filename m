Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2764111025B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 17:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbfLCQcg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 11:32:36 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33384 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfLCQcg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 11:32:36 -0500
Received: by mail-ed1-f68.google.com with SMTP id l63so3765458ede.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2019 08:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1NCG1ylm9tymUaVduWzgFk4t3GB5LIG1U/zxv5KoxqA=;
        b=cZaAV8Ek3GgYUC4pEYh/6MjHMyNKiAsnFgr9Dez3llVj/ujA7UdBE8ccapaaStsk1d
         xQkRO+41OkGO5T/YPBL8Mqp6PBpalHA6yIlMopw3IcIkppP+s1pEiZu3ltKlcPSV96m1
         Pv91icDx/7WVnfrYuqwc/IaWlujxEeE29gNoH9zTKsHGnIjDw1tnrLWTb/ntuUNUFQpk
         qqCl8j81PlL2L2SuQpq5C17Ibg6a/8xI8JlWLrTbhggaS1uEpuz0l/T34mtCcxFep2Go
         jb8c3hBnTnyE46wmcvoRvMIVo4frZpyI1JNevvHiv8FkxxtaqGrAPKqg+RoADOoOcleA
         2iOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1NCG1ylm9tymUaVduWzgFk4t3GB5LIG1U/zxv5KoxqA=;
        b=KdfhjrxzbR0P6N1+UK5zhDLvZ6n0wzWWybT14NEvWQTPwJrisHbR5J5jwkxzs1+j5C
         AaI0Troe18+yAHubIj4+tO5mCPp7HnQvkLnZSJNRaBDKJieVMx9CRCXynlazcZwqyvlQ
         UinwqetE2ZeIg1Tt4vjr46jTcpW2+D9vtm3bbBjvPVYaEPLLwpdjNKZMlntue+jwjfg2
         b5QDGdT+bFwZyqQr8T80XV185QgGKAQSlpVgVQe08SsgX2F1kmP0wD8ER1Gid8J2ckT9
         GuP38dVbZBTZJgUJv2ffrt+ibkr3J8cYW2oRkLM2gjuGerLbIgCrfQLYFXj0ryaqAcxN
         2qtQ==
X-Gm-Message-State: APjAAAUlgiIeRKlxW05P6rjyZVhg3yNZdw5bpG6KqOufk7CMsu5QgAMp
        ve9fk0M+g5TnKXKJk8aO7F86qiVIsG5l/YXdP3U=
X-Google-Smtp-Source: APXvYqzonmava8sCZQnELTETijv23HH0HeKfCjqyyO0AtwRA2EhwQQFAK+mwLGAWwtmY03UMuil75+0RcnhgMSMNhto=
X-Received: by 2002:aa7:c49a:: with SMTP id m26mr4314864edq.264.1575390754813;
 Tue, 03 Dec 2019 08:32:34 -0800 (PST)
MIME-Version: 1.0
References: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org> <0101016ecc5558bf-ec60fe4c-337a-44eb-8aae-08883795476e-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ecc5558bf-ec60fe4c-337a-44eb-8aae-08883795476e-000000@us-west-2.amazonses.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 3 Dec 2019 08:32:24 -0800
Message-ID: <CAF6AEGvWWN4ewfVbp=FcZFbR5sdVhzr9RhQPsLzCtBbOrcsWYQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm: msm: a6xx: fix debug bus register configuration
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel@freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 3, 2019 at 7:23 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> Fix the cx debugbus related register configuration, to collect accurate
> bus data during gpu snapshot. This helps with complete snapshot dump
> and also complete proper GPU recovery.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

fwiw, this one we already landed, but in the future for things like
this, a Fixes tag is a good idea so that patches get backported to
appropriate stable branches.  In this case,

Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 99b5a41..d6023ba 100644
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
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
