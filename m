Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A88183601
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 17:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgCLQUL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 12:20:11 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33044 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbgCLQUL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 12:20:11 -0400
Received: by mail-ed1-f68.google.com with SMTP id z65so8234038ede.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2020 09:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Ri6Zo06xUqVBLdkBsBEWcTBkjmCotOOr1BUmTAsg3I=;
        b=BnsaaGEZXZQ+MIghPu9pi3JdQ7NsQ/HWjMR2ykY98+99wV3F7uFg51Pe0wEK7yJpz/
         2R6hfPm3zcBUhSTeaiYda1p9Tth8EuR53Kzi9+jyWG/UXP7aviVhd2a7Q6jsXd+JzjCO
         AJR+nDOLTxf8X/q7fYHJePc6p60btksElmRuimChlmeYMKS0OckSwuqvU4N1PDBtj38k
         TP0FMELPixK4VwxSfbQ/ab91pCmOGKFn49lX7VIBWYkUG+ukHmrQnaQP2AvsmD4txPZ4
         et1GOipZRQVjfu+f7p9vuSIrYCkf0J8/eFofNs9vZIQ6Mme/IQ79C3Nl1TWDKiCWSKL2
         Vh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Ri6Zo06xUqVBLdkBsBEWcTBkjmCotOOr1BUmTAsg3I=;
        b=UkERrhhAOv83F6xLbgOi+VLQ1PFi56pFgSV7mIWQbzD9YHLSWnmVEfun260OacCjUG
         8l1LxTXI0btjaxy25E4bfZQvgsEiNwH3HB95hAz98/mu+A9X+Y8RlrJn92N9lSOnzPnz
         XG6CrZwsoZV4SH7GeGv+PeirII4fOUVGreD41VPylNkw83ZzDwLQBoGx/y/uI702YO+Q
         5hl5Gi3jN/CDOgP9LBT9Z2pSuHcqkYRG0EGqCIwXp15S53VQhCsFAZeewlhV9U433VCT
         PCYnemjem2Y6S/p59FbomNTWPwwFYuUrUE7DGwPxcOELIMB6rXQDxZA2PTUD6ojkZVvy
         oyyg==
X-Gm-Message-State: ANhLgQ1Z0kQYG1yr1SKEpYjRNVRod5sV5oBu0/rK6PyYbsgZ17t2fuzy
        ELWfsQp0ade5U7MeCzxIQSiQtXKxCyl/T4D5DMPX73kG
X-Google-Smtp-Source: ADFU+vuqPsB7DZGHkjoMD0pTX3OqBychAWWvqgB5t0ZT5bpa1RnqPfQCbA+j1Rn0HkU6vrLllgNLtBCFlaO66DHsWj8=
X-Received: by 2002:a17:906:f1c4:: with SMTP id gx4mr5558031ejb.267.1584030009727;
 Thu, 12 Mar 2020 09:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200312035154.1621-1-imirkin@alum.mit.edu>
In-Reply-To: <20200312035154.1621-1-imirkin@alum.mit.edu>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 12 Mar 2020 09:19:58 -0700
Message-ID: <CAF6AEGt4hnMJE=DSAx1754DTV4TJG5L8YocqMjAE1NpNJZaJMg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: avoid double-attaching hdmi/edp bridges
To:     Ilia Mirkin <imirkin@alum.mit.edu>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 11, 2020 at 8:52 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> Each of hdmi and edp are already attached in msm_*_bridge_init. A second
> attachment returns -EBUSY, failing the driver load.
>
> Tested with HDMI on IFC6410 (APQ8064 / MDP4), but eDP case should be
> analogous.
>
> Fixes: 3ef2f119bd3ed (drm/msm: Use drm_attach_bridge() to attach a bridge to an encoder)
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>

Thanks

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/edp/edp.c   | 4 ----
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ----
>  2 files changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/edp/edp.c b/drivers/gpu/drm/msm/edp/edp.c
> index ad4e963ccd9b..106a67473af5 100644
> --- a/drivers/gpu/drm/msm/edp/edp.c
> +++ b/drivers/gpu/drm/msm/edp/edp.c
> @@ -178,10 +178,6 @@ int msm_edp_modeset_init(struct msm_edp *edp, struct drm_device *dev,
>                 goto fail;
>         }
>
> -       ret = drm_bridge_attach(encoder, edp->bridge, NULL);
> -       if (ret)
> -               goto fail;
> -
>         priv->bridges[priv->num_bridges++]       = edp->bridge;
>         priv->connectors[priv->num_connectors++] = edp->connector;
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 1a9b6289637d..737453b6e596 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -327,10 +327,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>                 goto fail;
>         }
>
> -       ret = drm_bridge_attach(encoder, hdmi->bridge, NULL);
> -       if (ret)
> -               goto fail;
> -
>         priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>         priv->connectors[priv->num_connectors++] = hdmi->connector;
>
> --
> 2.24.1
>
