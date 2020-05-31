Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A341E98B2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 18:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgEaQBu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 12:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgEaQBt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 12:01:49 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6605DC061A0E
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2020 09:01:49 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id l27so6919334ejc.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2020 09:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C6Pcc0KCAqq6UnYDDdgdeBt1kbXH4HvttEs94ToLTKU=;
        b=uH91HHXPEQsuatgZeJhtxIV9ISRL6OUnl1+5+9aeUjbBFVxjp1Qy85TtGShtR0rZ69
         rQpFZ5wBUCv25a3eoy76VkpKA7c7VFBBO2hNLZST/wBBhxVDkIpo61XYHtC7PAByihCE
         fhsuM/n2S1qMDnVXwl07QOuqdAW0MAgdkHto4zbnakiO+k4UvF1+FcbXz2Ul7yTEuuuw
         KjhtsbdNml4E2A9YllFiqJRkHOiKWduSCidFivH1vrjza8tm9rHD0RKL9FeINh5nF/lQ
         zLRSpe8S355qiC+7ObRyeBdeJprehnd2nTLjydUKb5QPt4VylKmJD5K7x/hkkTz/jcll
         q1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C6Pcc0KCAqq6UnYDDdgdeBt1kbXH4HvttEs94ToLTKU=;
        b=JA2RQAhUznuL8zeM/7JJjJk9oz3IpSTiUC+02fXRCvSHmGpG9F9cBLOVoOopCZL+iO
         kH6yjBLOtCZU3ZncBzPWr4gv+3C1QYj5hwEWcPsXppB18LpoBW+F+Ch7/cyiGWJ8iCDP
         A2pMaC+1l+CYx8HlWsDFSqmPBxQWfXD+6EqRp2r5CyRiaEe2lz2L7NksC9lcbscsajdl
         1Tf3eD16uK02xJck3zj6fkCwmTTSS/rN3jErnCIP6m5pJKacbEbbVLbuReQBgS042HSB
         gxMgZRWzHjk2dDkpwGR9Cr7qHqclP3WlZ9Pkae6eIXIPhCN6iGT2ixDDv+TlzWQuVJtg
         6ftw==
X-Gm-Message-State: AOAM530eGMJzyZImsSTkKDvSs7rYGeK8chobMzt2zxNaNm50Zh/YKv8Y
        QQQYrAB0HuldRVhGXU3zC4n6BVWIzhnYvnuUfZqXZwVv
X-Google-Smtp-Source: ABdhPJygcqGQpE4P+85CCBiCBLzq7mgmdy1ks9XHcNICHXdFdGYVlHXB/cFQV9l/NQncP++0NxMItcE6Qgp8da76C4Q=
X-Received: by 2002:a17:906:44f:: with SMTP id e15mr15309655eja.161.1590940907872;
 Sun, 31 May 2020 09:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200511093554.211493-2-daniel.vetter@ffwll.ch> <20200514201117.465146-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200514201117.465146-1-daniel.vetter@ffwll.ch>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 31 May 2020 09:02:11 -0700
Message-ID: <CAF6AEGskgFyDxX+MWF84Z53ATmVd3972py88Og=aLQFV0d7UPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Don't call dma_buf_vunmap without _vmap
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 1:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> I honestly don't exactly understand what's going on here, but the
> current code is wrong for sure: It calls dma_buf_vunmap without ever
> calling dma_buf_vmap.
>
> What I'm not sure about is whether the WARN_ON is correct:
> - msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
>   a pretty neat layering violation of how you shouldn't peek behind
>   the curtain of the dma-buf exporter, but par for course. Note that
>   all the nice new helpers don't (and we should probably have a bit a
>   warning about this in the kerneldoc).
>
> - but then in the get_vaddr() in msm_gem.c, we seems to happily wrap a
>   vmap() around any object with ->pages set (so including imported
>   dma-buf).
>
> - I'm not seeing any guarantees that userspace can't use an imported
>   dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
>   guarantees that an imported dma-buf won't end up with a ->vaddr set.
>
> But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
> calling dma_buf_vunmap is the wrong thing to do.
>
> v2: Rob said in review that we do indeed have a gap in get_vaddr() that
> needs to be plugged. But the users I've found aren't legit users on
> imported dma-buf, so we can just reject that.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_gem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 5a6a79fbc9d6..e70abd1cde43 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -554,6 +554,9 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
>         int ret = 0;
>
> +       if (obj->import_attach)
> +               return ERR_PTR(-ENODEV);
> +
>         mutex_lock(&msm_obj->lock);
>
>         if (WARN_ON(msm_obj->madv > madv)) {
> @@ -907,8 +910,7 @@ static void free_object(struct msm_gem_object *msm_obj)
>         put_iova(obj);
>
>         if (obj->import_attach) {
> -               if (msm_obj->vaddr)
> -                       dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
> +               WARN_ON(msm_obj->vaddr);
>
>                 /* Don't drop the pages for imported dmabuf, as they are not
>                  * ours, just free the array we allocated:
> --
> 2.26.2
>
