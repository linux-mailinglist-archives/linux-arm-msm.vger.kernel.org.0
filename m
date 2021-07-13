Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70EBF3C754E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 18:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbhGMQx6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 12:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhGMQx6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 12:53:58 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD696C0613DD
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jul 2021 09:51:07 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t5so17534434wrw.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jul 2021 09:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wFFHLp9waseJ2G/puEpfRVsnB7l3dk1EhVjDPNKxo0w=;
        b=oRYEosIl/+VXXp8xPnkDtbDs6XxcvWe9cSe3IdKQ0xuwtARZBPMqav6ImsdGRAiaIH
         oDrAnnzxRjt1df8F216Cf6hBDj25WwmBu5m9dDIEBS3IAbX/oInQhQ3mxZgkst1YUqmU
         WICQ5MgaZnp2FKMK59mPBLB0PkANyHR9mZXwmgYI2TtDtcl4zLEYljN0/k3nq6Fowi5P
         zsdL8pZc6ZYHyOhoBKTVEqSiKDC1oYIob/wyvfYlUeCWQFbs+FI8Obh3zfDoXyt9/8wD
         V3nJYlz/q1+xd3QpIFZJjxPvek2gaO0B4yTJHhfz/iWSdSZK1Yee2R4/gUJD0o8jWmA5
         qtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wFFHLp9waseJ2G/puEpfRVsnB7l3dk1EhVjDPNKxo0w=;
        b=o3YAYs/fhCSFlOuTClrwWQxJdePI09tmNkBTOA09O5+8k+YnAVQQD9QPiFabpt2PYZ
         xvi9HX5Tb/+jIl8brnzCTXpwBzI8Qa87IkONpieD0H101OaWzgFJEmYzjMqJO01zUnrd
         ozPrmNQynF8khAgnBdokvk5fFUz6/m05CNyDLd0IzTkThOVDEom0B5a75et9piW1Ic8j
         e/zW624zyIixDq8iQKithFhklSsEz1g0wYlZYsNkMmBpgSH6g4Wg7fqsC5WvOGCA+4+R
         EOOEWnXhPoid8u4AdOKaSG+9YcH9vyg0fYsyGaLou0kYjD8n/jtuL1R9b2y16UK749vw
         f0cA==
X-Gm-Message-State: AOAM533u379cLkRZUOnfuW4H+fvC990FtptCUbp34SB14urYtU+Qsm/C
        aXzWUawpKyKIrkVEz06AwMjBBkfm3Q0ZpUbKwXc=
X-Google-Smtp-Source: ABdhPJx/ogTTn6NfhMkXQ92VLMz/HOLhtw2qz/mwA6c9pkrSIwOCJG2zfNP7afdC9MvRMTC4ad7jGc+5QoQoIWGkNpE=
X-Received: by 2002:adf:f346:: with SMTP id e6mr7295133wrp.28.1626195066164;
 Tue, 13 Jul 2021 09:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch> <20210712175352.802687-15-daniel.vetter@ffwll.ch>
In-Reply-To: <20210712175352.802687-15-daniel.vetter@ffwll.ch>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 13 Jul 2021 09:55:11 -0700
Message-ID: <CAF6AEGtC0BxABJtSaOmhEt_WKiuptWCHP7g4D5wEaJ4NaEuz4w@mail.gmail.com>
Subject: Re: [PATCH v4 14/18] drm/msm: Don't break exclusive fence ordering
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 12, 2021 at 1:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> There's only one exclusive slot, and we must not break the ordering.
>
> Adding a new exclusive fence drops all previous fences from the
> dma_resv. To avoid violating the signalling order we err on the side of
> over-synchronizing by waiting for the existing fences, even if
> userspace asked us to ignore them.
>
> A better fix would be to us a dma_fence_chain or _array like e.g.
> amdgpu now uses, but
> - msm has a synchronous dma_fence_wait for anything from another
>   context, so doesn't seem to care much,
> - and it probably makes sense to lift this into dma-resv.c code as a
>   proper concept, so that drivers don't have to hack up their own
>   solution each on their own.
>
> v2: Improve commit message per Lucas' suggestion.
>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index b71da71a3dd8..edd0051d849f 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
>                                 return ret;
>                 }
>
> -               if (no_implicit)
> +               /* exclusive fences must be ordered */
> +               if (no_implicit && !write)
>                         continue;

In practice, modern userspace (the kind that is more likely to set the
no-implicit flag on every submit) also sets MSM_SUBMIT_BO_WRITE on
every bo, to shave some cpu overhead so I suppose this would not
really hurt anything

Do you know if this is covered in any piglit/etc test?

BR,
-R

>
>                 ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> --
> 2.32.0
>
