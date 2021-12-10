Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE6E470662
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Dec 2021 17:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244212AbhLJQzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 11:55:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244202AbhLJQzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 11:55:06 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FAADC061746
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 08:51:31 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso9486634wml.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 08:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XO4naqgF40z4z+JfF3Z2T0v5VNgT9C1cEkNwaZlEZCU=;
        b=fvkqf3wq2VdkDmhuLACIEhH/QTDiKENcmiJqJ8Wq8ziMKvr/YFRED3KHPkBtX8mOcA
         qatBaNXjXZIeQziN9aUEmYpVTjONwLoQCidttSJZypPJkLdqguTxcpheNrbr8bWnXnL9
         GM1o6lpjnK5fapvq9KuUo+9veypvJHPEOKYnaEeKigpm1wdoFz/+ulehsmP7JleUBo22
         4WZThFjm2cTlS9DPzsFOe1kKN95rlp6wrx8upC0p3DQPaFPg1m6Cxui5v6gYPuvEWqqC
         GaRObxUuT63BLESeYYfjOBXco/ih9BbBMYnDv4tmDZF99LfrmnzhxvLDKaQALcXS6hPC
         Wocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XO4naqgF40z4z+JfF3Z2T0v5VNgT9C1cEkNwaZlEZCU=;
        b=7DIqTH23OnJjsTGB9I0iLj21cB66ZComLgn23MFpKsbuqT0gH05YB1DBDoBSCBMdqy
         3sTAl11JmN5V7aUYq24OtvjG+8qSPBI7MhePvyz7aVe3+NHaksmkuqRwbDQ5HazA/nA0
         ekCgPPaqJ5sQWoIkQ/aPGmS1CyNyUhjs+fysldr4BpV2ZgwcKCWAcOpxx7cYVlN0y7SL
         kjmgMkVB0c4qbbOzWWnANUYcmUli+eBAdVgL1A/P+oWanlUDa2FCa+CFrzAXuayWnHOw
         hxyOE9cbPYSKnHdW46d+trhKyGoq4pyHN/avCLCYWPz9Ei+l91NXqWpyWNwNuuQW+fYZ
         rpYA==
X-Gm-Message-State: AOAM531GXmd6oieuCcbZhsgL1h8b+xaueJU28pbW6R51FjtOrgfyeHSR
        ghPXT1x0BJhypwlGCgXfeuV4FirCSxwOeS6zrHR50eo5U1E=
X-Google-Smtp-Source: ABdhPJyrXoH/6+v7SNglDo4tUc51/eObL3cqRXB1mTm4OV73lGIBHjed6+tJmIFWvgq4KUVwIaQzqiLhda9BKcFaUQQ=
X-Received: by 2002:a05:600c:4f4b:: with SMTP id m11mr17598573wmq.151.1639155089644;
 Fri, 10 Dec 2021 08:51:29 -0800 (PST)
MIME-Version: 1.0
References: <20211210134446.GA16069@kili>
In-Reply-To: <20211210134446.GA16069@kili>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 10 Dec 2021 08:56:47 -0800
Message-ID: <CAF6AEGsVo8-ORpZ3To0vWJNuHDF9DSYpCFvxY7Dau1FxPyOiJA@mail.gmail.com>
Subject: Re: [bug report] drm/msm: basic KMS driver for snapdragon
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 10, 2021 at 5:45 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> [ This bug is obviously 8 and a half years old now.  It's weird that
>   no one has reported it.  But the bug seems very clear although the
>   fix is probably difficult. -dan ]
>
> Hello Rob Clark,
>
> The patch c8afe684c95c: "drm/msm: basic KMS driver for snapdragon"
> from Jun 26, 2013, leads to the following Smatch static checker
> warning:
>
>         drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c:372 update_cursor()
>         warn: sleeping in atomic context
>
> drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
>     355 static void update_cursor(struct drm_crtc *crtc)
>     356 {
>     357         struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
>     358         struct mdp4_kms *mdp4_kms = get_kms(crtc);
>     359         struct msm_kms *kms = &mdp4_kms->base.base;
>     360         enum mdp4_dma dma = mdp4_crtc->dma;
>     361         unsigned long flags;
>     362
>     363         spin_lock_irqsave(&mdp4_crtc->cursor.lock, flags);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Takes a spin lock.
>
>     364         if (mdp4_crtc->cursor.stale) {
>     365                 struct drm_gem_object *next_bo = mdp4_crtc->cursor.next_bo;
>     366                 struct drm_gem_object *prev_bo = mdp4_crtc->cursor.scanout_bo;
>     367                 uint64_t iova = mdp4_crtc->cursor.next_iova;
>     368
>     369                 if (next_bo) {
>     370                         /* take a obj ref + iova ref when we start scanning out: */
>     371                         drm_gem_object_get(next_bo);
> --> 372                         msm_gem_get_and_pin_iova(next_bo, kms->aspace, &iova);
>                                 ^^^^^^^^^^^^^^^^^^^^^^^^^
> The msm_gem_get_and_pin_iova() function takes a mutex so it will sleep.

Hmm, it's even worse.. this is called from an irq handler..

It looks like initially this called msm_gem_get_iova_locked() but that
changed in 0e08270a1f01 ("drm/msm: Separate locking of buffer
resources from struct_mutex")

mdp4_crtc_cursor_set() already pins the iova, so all we _really_ need
to do is take an extra reference until until scanout completes.. but
we maybe don't even need that as drm_flip_work should defer
unref/unpin until after vblank.  So might not be too hard to fix.. the
harder thing, for me at least, might be resurrecting some hw to test
the fix on.  The last thing I know of that used mdp4 was the SoC in
the nexus 4.

BR,
-R

>     373
>     374                         /* enable cursor: */
>     375                         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_SIZE(dma),
>     376                                         MDP4_DMA_CURSOR_SIZE_WIDTH(mdp4_crtc->cursor.width) |
>     377                                         MDP4_DMA_CURSOR_SIZE_HEIGHT(mdp4_crtc->cursor.height));
>     378                         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_BASE(dma), iova);
>     379                         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_BLEND_CONFIG(dma),
>     380                                         MDP4_DMA_CURSOR_BLEND_CONFIG_FORMAT(CURSOR_ARGB) |
>     381                                         MDP4_DMA_CURSOR_BLEND_CONFIG_CURSOR_EN);
>     382                 } else {
>     383                         /* disable cursor: */
>     384                         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_BASE(dma),
>     385                                         mdp4_kms->blank_cursor_iova);
>     386                 }
>     387
>     388                 /* and drop the iova ref + obj rev when done scanning out: */
>     389                 if (prev_bo)
>     390                         drm_flip_work_queue(&mdp4_crtc->unref_cursor_work, prev_bo);
>     391
>     392                 mdp4_crtc->cursor.scanout_bo = next_bo;
>     393                 mdp4_crtc->cursor.stale = false;
>     394         }
>     395
>     396         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_POS(dma),
>     397                         MDP4_DMA_CURSOR_POS_X(mdp4_crtc->cursor.x) |
>     398                         MDP4_DMA_CURSOR_POS_Y(mdp4_crtc->cursor.y));
>     399
>     400         spin_unlock_irqrestore(&mdp4_crtc->cursor.lock, flags);
>     401 }
>
> regards,
> dan carpenter
