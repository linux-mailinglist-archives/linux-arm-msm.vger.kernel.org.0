Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73C4351ADA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237131AbhDASDX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 14:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236799AbhDAR6m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:58:42 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2D8C0225AC
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 08:34:56 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id cx5so1167370qvb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aqivty0kItBvYGGyEFQ/9HO+WPoP9jtfr5ycsGY+FF8=;
        b=ZvyGgtwhp/yzmDXIwQF7Mt/dKYhpq9jqpN/Cnmkg9DRciJnRa2ALWpEAjRCLwe8lAV
         qWl8byzgnWQYAr1MqjqlLVnhlKVj0c5hXxssMCPFLTRoDUoUJsH0XGI8aV4bagRB5Z7H
         WEBfBzo8GfeHg/lOq0EeaNJssHGA3k8vD/1Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aqivty0kItBvYGGyEFQ/9HO+WPoP9jtfr5ycsGY+FF8=;
        b=eWKOcuuqK3gJW8ekDcX9OpHnh1QzIiVx38bs9BRb+NypP+O5OtoiQINLUkKuwezQe1
         F5up5SEi6LymzFr0ZlwundlL9Gbzdzd8jbJKd/q9KZki3W0ZxJtzCMs5piJRQDCm7QOI
         swviUa2YCtAsPeLxWFEQge84WME11sAv22QoOFoRDjlv1CbbqhVX08XdNrJYAj4qfEse
         XQvrB6PJ+qqlSKmMNtAOpXpVhTshXDt2DieCOLBIoNw9J76pwsmjuxHoMTah2aadeyxQ
         xvFKDba3gS/EfN8VoFFLMgnjtPQuL8ZRkUgloy5CoLm/kFpeeDCexa0GQK++Ywilto3h
         K1qw==
X-Gm-Message-State: AOAM532pv0let/VYZ59MteRYfUfKsXmKccqJxlGSK3bm4Rkmsb8JL7Ad
        1uzaMFrzEelncUTAEmCr2xn2jtzZO1fC1w==
X-Google-Smtp-Source: ABdhPJzdv1y3umB/Jp1R/O2mg0aFVT2EA8vUGRmwQeq8K2/WglpUDn1HImZ9SdsWVokdgFpom7c66Q==
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr8698048qvo.20.1617291295793;
        Thu, 01 Apr 2021 08:34:55 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id s28sm4198885qkj.73.2021.04.01.08.34.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 08:34:55 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 8so2173242ybc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 08:34:55 -0700 (PDT)
X-Received: by 2002:a25:69c1:: with SMTP id e184mr12540453ybc.345.1617291294869;
 Thu, 01 Apr 2021 08:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com> <20210401012722.527712-1-robdclark@gmail.com>
 <20210401012722.527712-3-robdclark@gmail.com>
In-Reply-To: <20210401012722.527712-3-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 1 Apr 2021 08:34:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XexfG9oQa8JndOgQ9JSNRmO4-xjmQdiA_9Rn9dJWxsow@mail.gmail.com>
Message-ID: <CAD=FV=XexfG9oQa8JndOgQ9JSNRmO4-xjmQdiA_9Rn9dJWxsow@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/msm: Avoid mutex in shrinker_count()
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 31, 2021 at 6:24 PM Rob Clark <robdclark@gmail.com> wrote:
>
> @@ -45,6 +30,9 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>         list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
>                 if (freed >= sc->nr_to_scan)
>                         break;
> +               /* Use trylock, because we cannot block on a obj that
> +                * might be trying to acquire mm_lock
> +                */

nit: I thought the above multi-line commenting style was only for
"net" subsystem?

>                 if (!msm_gem_trylock(&msm_obj->base))
>                         continue;
>                 if (is_purgeable(msm_obj)) {
> @@ -56,8 +44,11 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>
>         mutex_unlock(&priv->mm_lock);
>
> -       if (freed > 0)
> +       if (freed > 0) {
>                 trace_msm_gem_purge(freed << PAGE_SHIFT);
> +       } else {
> +               return SHRINK_STOP;
> +       }

It probably doesn't matter, but I wonder if we should still be
returning SHRINK_STOP if we got any trylock failures. It could
possibly be worth returning 0 in that case?


> @@ -75,6 +66,9 @@ vmap_shrink(struct list_head *mm_list)
>         unsigned unmapped = 0;
>
>         list_for_each_entry(msm_obj, mm_list, mm_list) {
> +               /* Use trylock, because we cannot block on a obj that
> +                * might be trying to acquire mm_lock
> +                */

If you end up changing the commenting style above, should also be here.

At this point this seems fine to land to me. Though I'm not an expert
on every interaction in this code, I've spent enough time starting at
it that I'm comfortable with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
