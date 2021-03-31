Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13481350A98
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 01:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbhCaXNf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 19:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232491AbhCaXN3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 19:13:29 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF38DC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 16:13:28 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id q12so164653qvc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 16:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LElCdf0KbUkyEvJs0p0IvZKV+wdmQvAnSKb7zsKMRmg=;
        b=ZrUj57P4j3iT2bZyUGZXH+q99R315qVADdUvYGP3bBtluIJt4nmKdMib/Uqs/mIyGs
         vZDSs0+bbbq2wo3FJQ8uyfnIkLcwgxvpwkQgtCNjfAAMxoOUi68ENAouCZBy5SHnDzyL
         JX1T6hiVCC1hFUQS8z6gbPipWXEfvF5sBFekM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LElCdf0KbUkyEvJs0p0IvZKV+wdmQvAnSKb7zsKMRmg=;
        b=WJS3o2FS4e6CQQooqodT+6vGdfPtfMeuGOQj8GCGh+CuzOQRhFc3P8MfKdMak6SI/j
         sbhR2uXLCzOk2rLWt2lVjejsscGXr1JaKM7KDVuma63B6cFRZfATa6xtK8VZiSrc2ig6
         lFesQG6hVvLKjXLyFHrCTQdcAjWWfqrjXOabl6utLfOZyE1oTFwT+acwJuKWawWZoIxn
         X2rcSgLRUAunQfszkx90D9rF92xNJSSQ4bRTX8DLOWT3tYkaqI6CZTep74crmw3a+4Fu
         ryuVF1TEcJGnVaZ3ZfBJW2Y3vErkWhvoL6vtuqAp7FsSUeKRmIG1/H8Vfi/EXoPbmASJ
         oHUA==
X-Gm-Message-State: AOAM532sLPQ11oZ+3BaP02lpoD0fYSCXyEKNZgu4vVsQ8MBSARsZnR0k
        H0Gr6C7KeHmc4ycGflZf26/w/8CYh1jqeA==
X-Google-Smtp-Source: ABdhPJyvLFBQqqsAv9E8D0huIgguFB8MFcvykVAL+3DrJWFwnAZ6IZW8yu0fhlicB9tM05Pded9vfQ==
X-Received: by 2002:a05:6214:b27:: with SMTP id w7mr5530276qvj.34.1617232406916;
        Wed, 31 Mar 2021 16:13:26 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id f136sm2688335qke.24.2021.03.31.16.13.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 16:13:26 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id c195so100305ybf.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 16:13:25 -0700 (PDT)
X-Received: by 2002:a25:e085:: with SMTP id x127mr1884118ybg.343.1617232405435;
 Wed, 31 Mar 2021 16:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com> <20210331221630.488498-4-robdclark@gmail.com>
In-Reply-To: <20210331221630.488498-4-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 31 Mar 2021 16:13:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UECYxLXQa_L572eLSVHq7pbxuA0zLvHzYHhCKy8K=9TA@mail.gmail.com>
Message-ID: <CAD=FV=UECYxLXQa_L572eLSVHq7pbxuA0zLvHzYHhCKy8K=9TA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm: Fix debugfs deadlock
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
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
> @@ -111,23 +111,15 @@ static const struct file_operations msm_gpu_fops = {
>  static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
>  {
>         struct msm_drm_private *priv = dev->dev_private;
> -       struct msm_gpu *gpu = priv->gpu;
>         int ret;
>
> -       ret = mutex_lock_interruptible(&priv->mm_lock);
> +       ret = mutex_lock_interruptible(&priv->obj_lock);
>         if (ret)
>                 return ret;
>
> -       if (gpu) {
> -               seq_printf(m, "Active Objects (%s):\n", gpu->name);
> -               msm_gem_describe_objects(&gpu->active_list, m);
> -       }
> -
> -       seq_printf(m, "Inactive Objects:\n");
> -       msm_gem_describe_objects(&priv->inactive_dontneed, m);
> -       msm_gem_describe_objects(&priv->inactive_willneed, m);
> +       msm_gem_describe_objects(&priv->objects, m);

I guess we no longer sort the by Active and Inactive but that doesn't
really matter?


> @@ -174,7 +174,13 @@ struct msm_drm_private {
>         struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
>         struct msm_perf_state *perf;
>
> -       /*
> +       /**
> +        * List of all GEM objects (mainly for debugfs, protected by obj_lock

It wouldn't hurt to talk about lock ordering here? Like: "If we need
the "obj_lock" and a "gem_lock" at the same time we always grab the
"obj_lock" first.

> @@ -60,13 +60,20 @@ struct msm_gem_object {
>          */
>         uint8_t vmap_count;
>
> -       /* And object is either:
> -        *  inactive - on priv->inactive_list
> +       /**
> +        * Node in list of all objects (mainly for debugfs, protected by
> +        * struct_mutex

Not "struct_mutex" in comment, right? Maybe "obj_lock" I think?

-Doug
