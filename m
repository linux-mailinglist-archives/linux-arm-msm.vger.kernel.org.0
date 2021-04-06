Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73D0355746
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 17:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345453AbhDFPGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 11:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238539AbhDFPGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 11:06:03 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30CFC06174A;
        Tue,  6 Apr 2021 08:05:54 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id q26so8909978wrz.9;
        Tue, 06 Apr 2021 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wFEzASxc1JqcNqRvKv47QdpZej2mZkmCYZTLblwB5X0=;
        b=p4CiawB48QRjP5DEzSyjsiOuHMtn5Sw07O65fp4IYCOi5qMaJk+pyzGhegxDB+IdLQ
         uJtt1wgZAwCHotGy4vnFV6Y6GlD8XOtggqSlPEO4y6F3lQhxf4gtydSatJXk7ZTovTMS
         HtAnO2prJKYwjTcgsWQeM7lmUgrlVvuggAPosmeGp2e8PgHjMw2xrb9Zeq7h9LOCa5PI
         3yRQqotK6ez56yc97WN3v+7b6xHxUE6XI2S4XKzQPgVk2ma0YkAta/uIS3Jd2Ka66As6
         YVgh0gJYpCgVVV9dDzys8mwHfyC+mSGr2QT3yRBfgB0l8ZlaZzEQew+VoUxDPjIyrcfh
         oL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wFEzASxc1JqcNqRvKv47QdpZej2mZkmCYZTLblwB5X0=;
        b=B9WupQfRlABaCFm7WlV0U9gVP7nqdE3lfv/Jygu/pXz40GZBW21WNLxmzcM+TayRRZ
         PtMytI+2IWfoHp9Dh4rjR+byoHn45zB1UOC627pnaQbVzqjqqbhHveNbF58fugn/a7Po
         XslFomq3p1f8/RrFd6zRmjYZz8YsWRb1nZZvA9OsduPxUH0dTuWLxx+wix9p0sKojsRE
         7cDkptQ+t+ezWWZ/Kj6+aUfUJabi3Ub7M4vZbLUS5CTzH6NbdugWBDsy5WRFmbSSduri
         KNraIHHG9F5Adxrqx4zxeK8QJtz4rrphM64DkPFH/JbG1K/FoJC5Yg2QxagkQD5PFS3A
         i9Fg==
X-Gm-Message-State: AOAM5307nyYtpUXPLiLXAEA6SynzSp1xaNyfNZojNSU0saOoEMEliUU7
        nh+C1GsMKNi4K35LU4tw+Ma4aarJ+VrgU/RGr/k=
X-Google-Smtp-Source: ABdhPJytCaId03MYNFodGWm6D+7GzSxzkxMkuGIB/nHbeWbRxRmdRjbPIFMwAvCUBuvFdXm9VUnDSqzD3jNAJautXKY=
X-Received: by 2002:a5d:58fc:: with SMTP id f28mr17335178wrd.327.1617721553409;
 Tue, 06 Apr 2021 08:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210406133939.425987-1-colin.king@canonical.com>
In-Reply-To: <20210406133939.425987-1-colin.king@canonical.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 6 Apr 2021 08:09:21 -0700
Message-ID: <CAF6AEGuRvmBdiR=g4eVtxfYzsS_-XWc3kmdBu_3012CtwsdzcQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/msm: Fix spelling mistake "Purgable" -> "Purgeable"
To:     Colin King <colin.king@canonical.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 6, 2021 at 6:39 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in debugfs gem stats. Fix it. Also
> re-align output to cater for the extra 1 character.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index f146d9c5ba9c..4e2e0a93d17d 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -979,13 +979,13 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
>                 msm_gem_describe(obj, m, &stats);
>         }
>
> -       seq_printf(m, "Total:    %4d objects, %9zu bytes\n",
> +       seq_printf(m, "Total:     %4d objects, %9zu bytes\n",
>                         stats.all.count, stats.all.size);
> -       seq_printf(m, "Active:   %4d objects, %9zu bytes\n",
> +       seq_printf(m, "Active:    %4d objects, %9zu bytes\n",
>                         stats.active.count, stats.active.size);
> -       seq_printf(m, "Purgable: %4d objects, %9zu bytes\n",
> +       seq_printf(m, "Purgeable: %4d objects, %9zu bytes\n",
>                         stats.purgable.count, stats.purgable.size);

oh, whoops.. I spel gud..

Thanks, applied.. I'll follow-up with fixing the spelling in the code

BR,
-R

> -       seq_printf(m, "Purged:   %4d objects, %9zu bytes\n",
> +       seq_printf(m, "Purged:    %4d objects, %9zu bytes\n",
>                         stats.purged.count, stats.purged.size);
>  }
>  #endif
> --
> 2.30.2
>
