Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F31CF103164
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 03:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfKTCHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 21:07:55 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37031 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbfKTCHy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 21:07:54 -0500
Received: by mail-ed1-f65.google.com with SMTP id k14so18931819eds.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 18:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=leI8OhqohePWOlkdPTemzLi1NRpfftWG+eO8CdevCXU=;
        b=iRelNh8nJPkzm+EFeaNAC0Zs13dmWzMIzrf0e+4z07JxywsoFeUJGMAvCBSscs+mx7
         FFawXT13NEgmen5Mni6eax8MQZviYHspdwYspDP4kaKtU8DDnoBaQTpWk5W4QDViggYA
         87+AOTElFXW7VeQ0jN08Lde6acPDOqtLPf2dRb38OKB5UCbjSky0Y8sSRXAtANS130pT
         /5F1P3coS8/pDjrJF5lBWvCfHB0BHO8vbVSfFhmylY5hHN1ASfMbvN6fIhQUEnfQCh4F
         c9EV4RaVx7WDshlIpdOkusXOOkrqfpcUpvcEzbz2r36ZXHEoWMMrURfT0S8L0rFGhnn9
         E+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=leI8OhqohePWOlkdPTemzLi1NRpfftWG+eO8CdevCXU=;
        b=pFEeuhZCaNeTDZsB8SDU6T7fFHyIbQBPAfzfRYsUATYMw1NzSPaoGYJYJosLS5XQl+
         EQoP9lHO9f5BY9mgctyyVT17fjaDkJdDyvfZlPgmm73KiRNEakwGyKTeTQjRBq/ZEcY0
         FP3SpYOr94Rtb62WJmTYr9Mi3gfwPTlvL4hOzXe7hnGMC6MxZ3TknvpwWKsPTyFVlYJI
         XlSOqur3LMChhyqnHzWsfPH5rK6vb/F+7jSvmSEefhFS1GcBD+hbSWCS8v8AwyV2+5EH
         Z/usuCWpVDwQHBukGclbUXkoj9b9LNT97BQrgfFKZHEQGaaHydbvlnJsGOG3cBWlT9z7
         uY9g==
X-Gm-Message-State: APjAAAWbSnLrgtRPCWDP/J+Z87bxRMPDmimp4A9f/YOnEid/pF6XXWQt
        yt3DBNvB6WfI66zXrUm/1vcrbf8xQJJICj1FHDzWcPKE
X-Google-Smtp-Source: APXvYqy1ZQ/g6M9ktZ6IXOPfOHzygUaFoQ0fkF+w8lDXn4TNU75klS4SyXPIPjl4H3FVXXP7nfumycR4Hr2GGK3yfls=
X-Received: by 2002:a17:906:b7c6:: with SMTP id fy6mr1542397ejb.90.1574215672969;
 Tue, 19 Nov 2019 18:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch> <20191119210844.16947-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20191119210844.16947-4-daniel.vetter@ffwll.ch>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 19 Nov 2019 18:07:41 -0800
Message-ID: <CAF6AEGuPtwFjM12MRBf_X7GUqJBHt+Xb8vKrT+dddic093Ki6g@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Don't init ww_mutec acquire ctx before needed
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 19, 2019 at 1:08 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> For locking semantics it really doesn't matter when we grab the
> ticket. But for lockdep validation it does: the acquire ctx is a fake
> lockdep. Since other drivers might want to do a full multi-lock dance
> in their fault-handler, not just lock a single dma_resv. Therefore we
> must init the acquire_ctx only after we've done all the copy_*_user or
> anything else that might trigger a pagefault. For msm this means we
> need to move it past submit_lookup_objects.

seems reasonable.. but maybe a comment would be useful to prevent
future-me from "cleaning-this-up" back to the way it was

with that, r-b

>
> Aside: Why is msm still using struct_mutex, it seems to be using
> dma_resv_lock for general buffer state protection?

only because I (or anyone else) hasn't had time to revisit the
struct_mutex usage since we moved to per-object-locks.. the downside,
I suppose, of kernel generally working ok and this not being a big
enough fire to bubble up to the top of my todo list

BR,
-R

>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index fb1fdd7fa3ef..126b2f62bfe7 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -54,7 +54,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>
>         INIT_LIST_HEAD(&submit->node);
>         INIT_LIST_HEAD(&submit->bo_list);
> -       ww_acquire_init(&submit->ticket, &reservation_ww_class);
>
>         return submit;
>  }
> @@ -489,6 +488,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         if (ret)
>                 goto out;
>
> +       ww_acquire_init(&submit->ticket, &reservation_ww_class);
>         ret = submit_lock_objects(submit);
>         if (ret)
>                 goto out;
> --
> 2.24.0
>
