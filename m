Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDDA243DEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 19:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgHMRDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 13:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgHMRDV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 13:03:21 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5636C061757;
        Thu, 13 Aug 2020 10:03:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f7so5972193wrw.1;
        Thu, 13 Aug 2020 10:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f2OcjbUQiolvvjtdbVSQNs7Tp8xSogd0JfYY2T8Mi5A=;
        b=ZK6Xnm68XM2Weqtgt+oy3WcBDmBJh4lWuF7ScdBCNMZtV8MrK+cZ+1LJEGHPT2ytSK
         tp/+w+gZYNpoViq7ImvjHNu8E7fY6uYz3Akw85Q3r0hc/J+QsRASf9v/kyU8jzmG5j2B
         9nsKgs+z0spe3DYv+WKNqKQ7PfS15szCOW+9fYB5VdGm7W0WitS+HSAyudQvZVOOWFm+
         /SWJGA27fdofLe5npVil/Q17mLoctp20Yq6pwOyU8qH91l8DLctei8TLNk3yrkPtfGvt
         qq7SlDif8CyQDYsl5hNTWGFbzQDt3HFxHqMv6/x0PB6fuxphRpvHlnk9LPaAYLEfD9oY
         Q1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f2OcjbUQiolvvjtdbVSQNs7Tp8xSogd0JfYY2T8Mi5A=;
        b=LuYRdyBgC0o8bAytK8rn7ffrOJly8LTlelBJ/1mwnMQprfC0MyrUTBoYHkn6X9zxQX
         782EkX5vzax6LR6CMTbg1vkOegNm1iIqFlKFNoJr1u+qykQOgxQ5xPbeM/5p5r7mb0yi
         0MapPalBR+k+EuGYuUyLiKZMuKOmJShxDsnN7pgITC3wBeuMOMUn8FkvRk3Ace8Apj8n
         gTUN98cI9M8ApbTNjAFX2JkDnDz7wyc/cBoGHY4EvOBQFBvLb+t9KrZ2P3LCUKRvSiwq
         GuwmVD+QGMvdlpK2j5OdCMZvreFQBtfYRE86D18kjDSzg4IfTl1qhg/CgZYmg/QM0ST0
         CpVg==
X-Gm-Message-State: AOAM532IWHXrB3NjZc6/dwrzRR2QAWXyn9fejg8l2GnNO84s9kgBgXx5
        fXO7OpE3jfmWyVYvegbu24mOFScSAVpvST4guoB1j0iG
X-Google-Smtp-Source: ABdhPJwPNi4Dk4hbn8MvomzE5XprOKkd1JdsgDq0RR0BsrBUKWcJC//EUB0I4UQXhY2gfAX3taxczNZaZKNnP7WG/N8=
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr5227777wrs.132.1597338199356;
 Thu, 13 Aug 2020 10:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org> <20200810222657.1841322-8-jcrouse@codeaurora.org>
In-Reply-To: <20200810222657.1841322-8-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 13 Aug 2020 10:04:05 -0700
Message-ID: <CAF6AEGv+X88Jrha7zhQ+78RbGqK78Ghi49a_V6zE-fmRDvcGFw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v12 07/13] drm/msm: Add a context pointer to
 the submitqueue
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Will Deacon <will@kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sam Ravnborg <sam@ravnborg.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sean Paul <sean@poorly.run>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawn.guo@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 10, 2020 at 3:27 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Each submitqueue is attached to a context. Add a pointer to the
> context to the submitqueue at create time and refcount it so
> that it stays around through the life of the queue.
>
> GPU submissions can access the active context via the submitqueue
> instead of requiring it to be passed around from function to
> function.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 12 +++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +--
>  drivers/gpu/drm/msm/msm_drv.c           |  3 ++-
>  drivers/gpu/drm/msm/msm_drv.h           |  8 ++++++++
>  drivers/gpu/drm/msm/msm_gem.h           |  1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  8 ++++----
>  drivers/gpu/drm/msm/msm_gpu.c           |  9 ++++-----
>  drivers/gpu/drm/msm/msm_gpu.h           |  7 +++----
>  drivers/gpu/drm/msm/msm_submitqueue.c   |  8 +++++++-
>  11 files changed, 39 insertions(+), 30 deletions(-)
>

[snip]

> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index a1d94be7883a..10f557225a3e 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
>          * No lock needed in close and there won't
>          * be any more user ioctls coming our way
>          */
> -       list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
> +       list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
> +               kref_put(&ctx->ref, msm_file_private_destroy);
>                 msm_submitqueue_put(entry);
> +       }

oh, this is the problem I mentioned in the last email.. we are
dropping the queue's reference to the ctx, when the device file is
closed, not on the last unref of the queue.  So the queue stays live
until all associated submits are retired, but the ctx ref (and
therefore the aspace) get destroyed earlier

BR,
-R

>  }
>
>  int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
