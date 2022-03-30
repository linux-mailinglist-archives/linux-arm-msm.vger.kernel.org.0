Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 114A94EBFD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Mar 2022 13:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343663AbiC3Leb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 07:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343659AbiC3Le2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 07:34:28 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73ABF1C2324
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 04:32:43 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id c4so17740533qtx.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 04:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yLUVH17Uign6BvR+nDTbfXhu0XLyilVb6NY5dVncXfw=;
        b=bNxRNv7F13x/jJOsff+xDk0gPlGPDOyrSemkFfl4L44wg4lqMIDbt2LieOwGnTZq/i
         UDByN8P0ETFO3gZBAgCUWJQEe743l1wBK2B6IwbXcrlE/PZnNFW1NUxWghXeH74sIsTT
         uWhRffTGlIS1hA1Avx8XQXHwFUz871acsJFssUQZsHgCNQ0wF6PQ6QbmKTpEDebb6qXQ
         7x3X7In0H4akcpSzxJJ7KM91JBUCTz11squZ+uGVpPIbFB2cLruMZk1ugWxVhl1mEgUJ
         /gKGIpR/4d2A5/+0xHiWMjElo8vns3shGA8xBxVvD6gpkWSTCnQt2/o/02p2Y9gmzIGb
         902A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yLUVH17Uign6BvR+nDTbfXhu0XLyilVb6NY5dVncXfw=;
        b=rSMtS75mjp7iMcV8Yro+9lcyJdceAMZsCClJ7N4AxGH4VxD5gvHWPywucRBeyPdDi2
         QN7p/5lPcDtSSS1Y6TWXZhRLu0CXXhB+ds+K5H18VjSDVshM61ZNyyjpDKRv23ZX7CXb
         A9H+1/7RyQ320PHKjp745YAY9JTyFjIJf2sn0x4L8j5744GdPsEh+Np2nw2+z9gfY6bN
         JJvPU4CGas2qMGYUwjgzJD4QWtjtYrZ06qrSILmhbwU+JDtTKZmg0tama1RpwbH+K1MJ
         HihJY9b7qfhXBHjV1sn5PF39bKClxYMGtmUfuqc/O5xe7+i4DtHUpHFS6rUg5wvkzc36
         CpuQ==
X-Gm-Message-State: AOAM532uVPohC7BEXPPC21jtXFUfQjFlUjdc+Ksq3dLwMpg1gshembur
        wwXcA9eMvFBh0URgiHKFsT2vNvncn19Zv7PwZNrorg==
X-Google-Smtp-Source: ABdhPJwx+6eprB6Q5XPxYzgTUiqSDOQdVYYmG242HODu6johshrHsDsGJYL1m7iaKoPFFzKcIyGksMtG0596HZPmvb4=
X-Received: by 2002:ac8:5a46:0:b0:2e2:2edd:374 with SMTP id
 o6-20020ac85a46000000b002e22edd0374mr32044988qta.295.1648639962608; Wed, 30
 Mar 2022 04:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220329230105.601666-1-robdclark@gmail.com> <20220329230105.601666-4-robdclark@gmail.com>
In-Reply-To: <20220329230105.601666-4-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Mar 2022 14:32:31 +0300
Message-ID: <CAA8EJpqAaW0Q-QeQObonUqAhdWaw8mPPvChmboH88ttTx+2XGg@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm/msm/gem: Split out inuse helper
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 30 Mar 2022 at 02:00, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Prep for a following patch.  While we are at it, convert a few remaining
> WARN_ON()s to GEM_WARN_ON().

Well... GEM_WARN_ON doesn't really look like a 'while we are at it'.
It might be better to split it into a separate commit.

>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c     |  2 +-
>  drivers/gpu/drm/msm/msm_gem.h     |  1 +
>  drivers/gpu/drm/msm/msm_gem_vma.c | 15 ++++++++++-----
>  3 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index a4f61972667b..f96d1dc72021 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -938,7 +938,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
>                                 name, comm ? ":" : "", comm ? comm : "",
>                                 vma->aspace, vma->iova,
>                                 vma->mapped ? "mapped" : "unmapped",
> -                               vma->inuse);
> +                               msm_gem_vma_inuse(vma));
>                         kfree(comm);
>                 }
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 947ff7d9b471..1b7f0f0b88bf 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -61,6 +61,7 @@ struct msm_gem_vma {
>  int msm_gem_init_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma, int npages,
>                 u64 range_start, u64 range_end);
> +bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
>  void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma);
>  void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index f914ddbaea89..dc2ae097805e 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -37,6 +37,11 @@ msm_gem_address_space_get(struct msm_gem_address_space *aspace)
>         return aspace;
>  }
>
> +bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
> +{
> +       return !!vma->inuse;
> +}

It almost  asks to be a static inline. The patch 04 makes it complex,
so it's probably not that important.

> +
>  /* Actually unmap memory for the vma */
>  void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma)
> @@ -44,7 +49,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>         unsigned size = vma->node.size << PAGE_SHIFT;
>
>         /* Print a message if we try to purge a vma in use */
> -       if (WARN_ON(vma->inuse > 0))
> +       if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
>                 return;
>
>         /* Don't do anything if the memory isn't mapped */
> @@ -61,7 +66,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>  void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma)
>  {
> -       if (!WARN_ON(!vma->iova))
> +       if (!GEM_WARN_ON(!vma->iova))
>                 vma->inuse--;
>  }
>
> @@ -73,7 +78,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>         unsigned size = npages << PAGE_SHIFT;
>         int ret = 0;
>
> -       if (WARN_ON(!vma->iova))
> +       if (GEM_WARN_ON(!vma->iova))
>                 return -EINVAL;
>
>         /* Increase the usage counter */
> @@ -100,7 +105,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>  void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma)
>  {
> -       if (WARN_ON(vma->inuse > 0 || vma->mapped))
> +       if (GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped))
>                 return;
>
>         spin_lock(&aspace->lock);
> @@ -120,7 +125,7 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
>  {
>         int ret;
>
> -       if (WARN_ON(vma->iova))
> +       if (GEM_WARN_ON(vma->iova))
>                 return -EBUSY;
>
>         spin_lock(&aspace->lock);
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
