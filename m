Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD30272A9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 17:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgIUPqs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 11:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbgIUPqs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 11:46:48 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF60C061755;
        Mon, 21 Sep 2020 08:46:48 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t10so13317418wrv.1;
        Mon, 21 Sep 2020 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U7rH3MXQ3KBOROK+/p1uMLnsBPfVkv2CUGNF+40H8CQ=;
        b=sn3DqawA1RNbqkHW0tvnFkd2GiYiCjELepybm+aam7/yvyjHFmOo9q7pPBiH33v8Op
         2wL+UI+jhlMdMmJMPgt0vQClTuOd1Tn+woUaaLaU1nbbru77Gq92Sv7WlYXdGc/1fh7j
         tPV7BURHK0mzqBcwiijiVvCOoDFHnuWolY9QHzurOv312IH7j3Au86bQTsXS+BGDCWAL
         jomGlM4U5R6hyuHfCfItut5XwMsFyZwiPL5Diiy6tprIy7rS95mlHbaOL4RBW7MOVc26
         GQMu0iwRcdWjryua/c2h1CCJFbhrvAubhd/57B9O5ZxZEZ7ElkfYSLSj/MG45nycuB4P
         EftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U7rH3MXQ3KBOROK+/p1uMLnsBPfVkv2CUGNF+40H8CQ=;
        b=Z5gvVz2p1kZTjcsw0N+yECJ4loCcd+fkZPVKWCxhIxBIBk/X0t1Z8zI3SdlZBtaSwi
         IubUOV+Y/N4oxJztJ2AsVmeQY/xeUc63WuxuaZaDD3I+2SywJTK/7tVgN0aBtAy4Z+sX
         r7F3Zhb1xmtbl24F/9J+SxzBGrcNIX1fsqVKom+uc8qARU6tGVnQQJqR0obPGJNOsCgx
         wXfqr1sfKaUyTa4mwRQi+FhKSIzp0TWwGfwZ0uNGiM1C9s8NNq2y2VpE9BJwaZC5/bp7
         tP5ATQgcxchfUfC9Haca1ZxrN3ZrvNB6lNgjfCCTIM1Icv5eUFKwqUTJxuQxK510kzOS
         1pjg==
X-Gm-Message-State: AOAM5306ZpIFEIKa5I5gZdrDvlu0kfKm3IDxWTMl/HVhnd16AAEvHls7
        uh2JXrNPXroFqkR9x3THNMlSNnTwhWsGvzz4HWo=
X-Google-Smtp-Source: ABdhPJxtVHCQUzYNlQuLpcrdAi/k+3N/BQu6j76lleZS5WeYQKN4wzqF/1ou0P5HlZiijbSJuuB5KdJ7UqhNNjRI4mg=
X-Received: by 2002:adf:f382:: with SMTP id m2mr345644wro.327.1600703207013;
 Mon, 21 Sep 2020 08:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <1600702038-10893-1-git-send-email-akhilpo@codeaurora.org> <1600702038-10893-2-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1600702038-10893-2-git-send-email-akhilpo@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 21 Sep 2020 08:47:48 -0700
Message-ID: <CAF6AEGsRMB_XvAKuaV8uf3yT61j-845GLB7sKPQoJrOQwd5-QQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm: Leave inuse count intact on map failure
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 8:27 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> Leave the inuse count intact on map failure to keep the accounting
> accurate.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 80a8a26..8367a1c 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -88,8 +88,10 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>                 ret = aspace->mmu->funcs->map(aspace->mmu, vma->iova, sgt,
>                                 size, prot);
>
> -       if (ret)
> +       if (ret) {
>                 vma->mapped = false;
> +               vma->inuse++;

vma->inuse-- ?

BR,
-R

> +       }
>
>         return ret;
>  }
> --
> 2.7.4
>
