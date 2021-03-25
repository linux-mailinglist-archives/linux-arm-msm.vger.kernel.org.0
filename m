Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E3C348751
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 04:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhCYDGo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 23:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbhCYDG2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 23:06:28 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65711C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 20:06:25 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so338759wmi.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 20:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oySbYmye6jIKUciaeAkZ4sySteO4iHql6A2SWp7T94w=;
        b=UAkONL7luoby47dM236v3hYfKvsv+lqcrSXu2ByNSljJUiQWf20mb1nS+F09f3R9yo
         7e9CvJthyMGIyIcp4xi4jGBTeuDvCMQ6dy64FNKcOG3PQx8CIDdusP8mhn90xQhP6uZw
         w+IR8qx2/TOgtqgYRhSNM7Cx0G7pF6W+yLhv1KCCcxo4V1XD0+mANe7rxHTbo/zezcCP
         TGABEB4qdm8+HWWXXMT/XwGiBJ4V3ZctubOBnuudowgsfT/YVcu4b8rsfuB6tpZNZORe
         yAw6CFmq4UIfouXmidCVleScmWX2AdOxCFNcqjkSwYx+ITDYrwxTYZneAuPZDLvIdb84
         UjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oySbYmye6jIKUciaeAkZ4sySteO4iHql6A2SWp7T94w=;
        b=mQkG8bweOi1IJuStwyW/JMJE6CmPgGHRm1rmFjr84xgOxwNXDoOkN38UJHk6GjdB6P
         uGUW3FouM/Y+SOq6ZqBiTlwgHrOJ3JGJ6N2/MfytIboM95JQG5UR0UG/mBN2e5Bs9ZPK
         8OLX7HtUQfdM4LyNO6m49HWLdmUfof9qMnJ1AMI9K2E4P1eh/ToHp0X2R8nOSv76zqZh
         i9Jni877MxPjs9AcMK62JbMACKaAtDpE7xrhpHojuQO56aR2VMUy/qaTa9/uXhrqHWsa
         xJS46I1xzzEt0gCPNjxEO0KQbnM/FgMO4TO+cs6KZdkDB7g+sGhyLrRUz5NV47Vgt3T5
         M0vg==
X-Gm-Message-State: AOAM530mKKbCosz5mI17dlT3i3M9i1Iznb1y9Np/bO+oMbOqR0SxAKZD
        ciSTM4pdKyB/djpidJAIzO5j/8MANgmLBbj2m6qCmZAM
X-Google-Smtp-Source: ABdhPJy/I1DzdvdDKq4xvQMv/1VPFBRSQ2vaL7eK81MXRPVKFT+Y8irZm8XPU0+PpbT+jhp+nISu2lYmKbqJCGMJvuo=
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr5732029wma.94.1616641583948;
 Wed, 24 Mar 2021 20:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210318200544.2244007-1-dmitry.baryshkov@linaro.org> <161663694524.3012082.11889553997747135632@swboyd.mtv.corp.google.com>
In-Reply-To: <161663694524.3012082.11889553997747135632@swboyd.mtv.corp.google.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 24 Mar 2021 20:09:37 -0700
Message-ID: <CAF6AEGsRKPn-pLtP8dmG+_VSH1TbyaW10HHtaOT10Xc3D+DMTg@mail.gmail.com>
Subject: Re: [PATCH v2] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 24, 2021 at 6:49 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-03-18 13:05:44)
> > if GPU components have failed to bind, shutdown callback would fail with
> > the following backtrace. Add safeguard check to stop that oops from
> > happening and allow the board to reboot.
> [...]
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 94525ac76d4e..fd2ac54caf9f 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1311,6 +1311,10 @@ static int msm_pdev_remove(struct platform_device *pdev)
> >  static void msm_pdev_shutdown(struct platform_device *pdev)
> >  {
> >         struct drm_device *drm = platform_get_drvdata(pdev);
> > +       struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
> > +
> > +       if (!priv || !priv->kms)
> > +               return;
> >
>
> I see a problem where if I don't get a backlight probing then my
> graphics card doesn't appear but this driver is still bound. I was
> hoping this patch would fix it but it doesn't. I have slab poisoning
> enabled so sometimes the 'priv' pointer is 0x6b6b6b6b6b6b6b6b meaning it
> got all freed.
>
> I found that the 'drm' pointer here is pointing at junk. The
> msm_drm_init() function calls drm_dev_put() on the error path and that
> will destroy the drm pointer but it doesn't update this platform drivers
> drvdata. Do we need another patch that sets the drvdata to NULL on
> msm_drm_init() failing? One last note, I'm seeing this on 5.4 so maybe I
> missed something and the drvdata has been set to NULL somewhere else
> upstream. I sort of doubt it though.

the hw that I guess you are running on should work pretty well w/
upstream kernel.. but I don't think there is any important delta
between upstream and the 5.4 based kernel that you are running that
would fix this..

so *probably* you are right..

BR,
-R

>
> ---8<----
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index c842a270806d..895d74aa8834 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -577,6 +577,7 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
>         kfree(priv);
>  err_put_drm_dev:
>         drm_dev_put(ddev);
> +       platform_set_drvdata(pdev, NULL);
>         return ret;
>  }
