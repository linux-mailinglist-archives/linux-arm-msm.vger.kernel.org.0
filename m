Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53ECE75637
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 19:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfGYRvF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 13:51:05 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37791 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfGYRvF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 13:51:05 -0400
Received: by mail-ed1-f65.google.com with SMTP id w13so51035148eds.4;
        Thu, 25 Jul 2019 10:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rLx1WxxS2eiFupzGOfH7X3JpoyBVgunYKBsWNt5yLUw=;
        b=bCgV0Y0KK+hZmQcR1Ije8gmw+VFkvFkFIk7n6PTSK4+JTJutIG+r8glT/WEdzuFC10
         O3KQ4Siab33aiSEyEsyVYzHGz/nsrTIerU+zKakzfKJf4AMYChTdkwaNgn70ISdnNF3c
         TLSUlrxjEMfU+AYpWgjfD92PU+aG7Wdh4ZlNR0UEV+INBwHfjkgCfyqB3c9aQxux/GIF
         /JNsbzuvL4tYp+0BsS2aeaToEyI8t1OuTNiG9EtNGBpV3IviSxEx6Jkv2tedyJlpVIMf
         bJc+oDf9i99jxX1rArWlfw4m4NL/MpETs01X74VX5XoLRBZE/jAVi7B0aYpWfHywarah
         jvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rLx1WxxS2eiFupzGOfH7X3JpoyBVgunYKBsWNt5yLUw=;
        b=Ajq3ff3yw9QYdg5esNuProiKm/rPY+x9J0QPOndKs5gIt7kJHm2hI00F+oY9s/XD+t
         99CSm2m6XU2hz6gGCu6LDlQL441Bg9/0hgtQujTN41HvgVx5oOczwI2IJTyRufpZBJ8f
         Ht7AgcvKmSH5qR654tnI/dY0oCnkOxAuPVIhCiEruNcxE1AkNBX1I6pKzuVV9pTvwKHr
         M7Js/KJ158V4CS7dfmuLrhXEBootoFRzbjmysjVE1gr5J5l7epc9GgSahTkJHexf82Pe
         uiCOzeMnSNZWSG9m9hTRyeDKwacZ7kQF11HpivrkYEdMK9NUXWlHCgFhu/mK3LYR7Gkx
         QXxA==
X-Gm-Message-State: APjAAAVGjSKR3u8gDjkKHhZw8R/5nZDnsWaXWfuvgKetITDApQrpr73X
        o0uzVbte2m7UiZvH6zBacB2mdPYMeGZfryphBGE=
X-Google-Smtp-Source: APXvYqx0hq85a8gR6SvZiwDeUgHmw4HBnllzoppGUeegEPb0sAcSwB9g+0T/RlSOGs1+9qmJErJLRLdvNOJgJ7TKSlg=
X-Received: by 2002:a17:906:f85:: with SMTP id q5mr70131087ejj.192.1564077063087;
 Thu, 25 Jul 2019 10:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <1564073588-27386-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1564073588-27386-1-git-send-email-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 25 Jul 2019 10:50:51 -0700
Message-ID: <CAF6AEGus9DtNou8KHaVK=_-mgc5JYH=cVoiTABsm=jBkXo2v2w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Annotate intentional switch statement fall throughs
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        Kees Cook <keescook@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 25, 2019 at 9:53 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Explicitly mark intentional fall throughs in switch statements to keep
> -Wimplicit-fallthrough from complaining.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 2 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 1 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 1 +
>  3 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 1671db4..e9c55d1 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -59,6 +59,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>                 case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
>                         if (priv->lastctx == ctx)
>                                 break;
> +                       /* fall-thru */
>                 case MSM_SUBMIT_CMD_BUF:
>                         /* copy commands into RB: */
>                         obj = submit->bos[submit->cmd[i].idx].obj;
> @@ -149,6 +150,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>                 case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
>                         if (priv->lastctx == ctx)
>                                 break;
> +                       /* fall-thru */
>                 case MSM_SUBMIT_CMD_BUF:
>                         OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
>                         OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index be39cf0..dc8ec2c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -115,6 +115,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>                 case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
>                         if (priv->lastctx == ctx)
>                                 break;
> +                       /* fall-thru */
>                 case MSM_SUBMIT_CMD_BUF:
>                         OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
>                         OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 9acbbc0..048c8be 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -428,6 +428,7 @@ void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>                         /* ignore if there has not been a ctx switch: */
>                         if (priv->lastctx == ctx)
>                                 break;
> +                       /* fall-thru */
>                 case MSM_SUBMIT_CMD_BUF:
>                         OUT_PKT3(ring, adreno_is_a430(adreno_gpu) ?
>                                 CP_INDIRECT_BUFFER_PFE : CP_INDIRECT_BUFFER_PFD, 2);
> --
> 2.7.4
>
