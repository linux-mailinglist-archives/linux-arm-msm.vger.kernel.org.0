Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76734350A69
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 00:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbhCaWoq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 18:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhCaWoi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 18:44:38 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F56C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 15:44:38 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id 1so232399qtb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 15:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SAjs9EXx6Yc80YSTGK/3hcA/MZAHT8V3jPabf02H2g4=;
        b=M8JTOyCV+omhztb3AOc76Z2AYBAfNhaBfcELYiMbILrjm988hUt/iB9zi/7/Ye5al2
         Sn6VCj2mDj3ceKf+3fr2qzzD47B2KNRVS4F1UIOg7YbXoq/bC/lk9IHsrh1eehX7uBNX
         VjmHcTe+Qf5Bi5FQJsrSXKg4tBnotQmwxT59Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SAjs9EXx6Yc80YSTGK/3hcA/MZAHT8V3jPabf02H2g4=;
        b=IoyFXfwaL/0pcmH0UAhxNYnvNz4dwo/eyGOR7ZJ03FkEeqGab5sFrojJY1No2KHoEN
         dC9IqJB8diOoqb6APq5l4Oo2lDitn6U07LnJ8mzq1+q029r6W3JGBflYYzFER2Jy2oYO
         v2CCg7ebmj+jS4C9KbmpYKjmHHxMC7f1OP8rElxq8bnOYWKVCP0a1co9vCDt9Kx1P+ue
         d1Ty4gN47kkEXjX/TIxRIEW31r8wwk0T9IQhut9H7LnlM3cGRgxr3cIdeIRNqWRlOgCr
         uGpE3iW4JvWAKzFqPjObCC9fSMMYmBtCw+v1RCl2U+pUgDUwjn7oFHCN6bpqYLRrIYAg
         crQQ==
X-Gm-Message-State: AOAM530w8W6BflLl1mg2QPxii9MhwKdrYOgLaAy7iul390iSRBiUK8ZI
        0pIEZEgXqPAwpwRQD5zo1tGdt4gczfQyPg==
X-Google-Smtp-Source: ABdhPJz0ou2DSmzniO6iCMIJgIDRT9CYYio5du2rOphhuRc1QQEHV48QUQLsUzGQ8yPh+XaPVRpqBg==
X-Received: by 2002:aed:306c:: with SMTP id 99mr4454107qte.352.1617230677543;
        Wed, 31 Mar 2021 15:44:37 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id d2sm2183586qte.84.2021.03.31.15.44.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 15:44:36 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id w8so22907989ybt.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 15:44:36 -0700 (PDT)
X-Received: by 2002:a25:74ca:: with SMTP id p193mr7640863ybc.405.1617230676164;
 Wed, 31 Mar 2021 15:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com> <20210331221630.488498-3-robdclark@gmail.com>
In-Reply-To: <20210331221630.488498-3-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 31 Mar 2021 15:44:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=USXBm-ZLafNWbUK=Ny7_vwtyG164mQFs87SkXqim-Vpw@mail.gmail.com>
Message-ID: <CAD=FV=USXBm-ZLafNWbUK=Ny7_vwtyG164mQFs87SkXqim-Vpw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm: Avoid mutex in shrinker_count()
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 31, 2021 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
>
> @@ -818,11 +820,19 @@ static void update_inactive(struct msm_gem_object *msm_obj)
>         mutex_lock(&priv->mm_lock);
>         WARN_ON(msm_obj->active_count != 0);
>
> +       if (msm_obj->dontneed)
> +               mark_unpurgable(msm_obj);
> +
>         list_del_init(&msm_obj->mm_list);
> -       if (msm_obj->madv == MSM_MADV_WILLNEED)
> +       if (msm_obj->madv == MSM_MADV_WILLNEED) {
>                 list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
> -       else
> +       } else if (msm_obj->madv == MSM_MADV_DONTNEED) {
>                 list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
> +               mark_purgable(msm_obj);
> +       } else {
> +               WARN_ON(msm_obj->madv != __MSM_MADV_PURGED);
> +               list_add_tail(&msm_obj->mm_list, &priv->inactive_purged);

I'm probably being dense, but what's the point of adding it to the
"inactive_purged" list here? You never look at that list, right? You
already did a list_del_init() on this object's list pointer
("mm_list"). I don't see how adding it to a bogus list helps with
anything.


> @@ -198,6 +203,33 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
>         return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
>  }
>
> +static inline void mark_purgable(struct msm_gem_object *msm_obj)
> +{
> +       struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
> +
> +       WARN_ON(!mutex_is_locked(&priv->mm_lock));
> +
> +       if (WARN_ON(msm_obj->dontneed))
> +               return;

The is_purgeable() function also checks other things besides just
"MSM_MADV_DONTNEED". Do we need to check those too? Specifically:

 msm_obj->sgt && !msm_obj->base.dma_buf && !msm_obj->base.import_attach

...or is it just being paranoid?

I guess I'm just worried that if any of those might be important then
we'll consistently report back that we have a count of things that can
be purged but then scan() won't find anything to do. That wouldn't be
great.


> +       priv->shrinkable_count += msm_obj->base.size >> PAGE_SHIFT;
> +       msm_obj->dontneed = true;
> +}
> +
> +static inline void mark_unpurgable(struct msm_gem_object *msm_obj)
> +{
> +       struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
> +
> +       WARN_ON(!mutex_is_locked(&priv->mm_lock));
> +
> +       if (WARN_ON(!msm_obj->dontneed))
> +               return;
> +
> +       priv->shrinkable_count -= msm_obj->base.size >> PAGE_SHIFT;
> +       WARN_ON(priv->shrinkable_count < 0);

If you changed the order maybe you could make shrinkable_count
"unsigned long" to match the shrinker API?

 new_shrinkable = msm_obj->base.size >> PAGE_SHIFT;
 WARN_ON(new_shrinkable > priv->shrinkable_count);
 priv->shrinkable_count -= new_shrinkable


-Doug
