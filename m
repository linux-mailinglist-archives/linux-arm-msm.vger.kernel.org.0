Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77D65D2D9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 17:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfJJPWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 11:22:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42571 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJPWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 11:22:43 -0400
Received: by mail-ot1-f68.google.com with SMTP id c10so5199701otd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PenGaXGBrENWr4HRhl2ZMGFHyym9ywCGyc7wJWTP8Es=;
        b=Ihehkphoadi3HQFuRPEVdSQBReqPm7/Gh+3uPF13qJdc3RayvK0KsK2yAOWJXFJVtO
         5F3UVbMUgp0wahT+XDbIUClseAVeciWIPjDOxH8ybNvyGlNXnNQxDT8b9di8kLxPcUtt
         Fgk4ORb/+HSQpRwQyRPIsQ+U+a3Bzr/vzonqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PenGaXGBrENWr4HRhl2ZMGFHyym9ywCGyc7wJWTP8Es=;
        b=OWZ+nO1dSCXv4SwnhPj0ZQXWW4CQPnuLu15T7didyevZxYKSuqEupOzN9trUoCs1W2
         Vq8Ibvrfs7ud9i2yV4pBjZTiR+N0I6vDO8jWCFgWy1qzgeNuKMSfiBTZZTBFiQsYvcv3
         haSTbGwY1dn1I+iReLieKaujCbvEy0cVwACwJorEHZWYM/Jy0UWF5LRIL06nnieV1jK8
         acuJmZ/CZvHHQaOJgGbTS+gMoP7xpSuSPycgpL1xO97ygNpydvKw2NlwL04VKM9kBh1i
         Mz9fh4jzZhqKNu2NHKHMPZJT7mnPtMBUZJrU6MsGcoKN8VUxHuRlDUPw0G+GC1znuZA0
         We6w==
X-Gm-Message-State: APjAAAWXY+xk8PzDtRzHsGLeAc6QG6Ar0RQQ3cm0Sum3Og9jJxEl+En1
        JCq3ERhyDCB34wHlNCEBMAU2KdrEqNe1tOyBtuqzZA==
X-Google-Smtp-Source: APXvYqxwi0Gygs5kPGzDnCCyiTgHjRRdKCaJiHfsGaRjDAslpSjYSTlDyMH2eIjfnkx+3+OX6wcHgbuj9WokzULHAWI=
X-Received: by 2002:a9d:6b0a:: with SMTP id g10mr8284705otp.303.1570720960988;
 Thu, 10 Oct 2019 08:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191010151351.126735-1-sean@poorly.run>
In-Reply-To: <20191010151351.126735-1-sean@poorly.run>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 10 Oct 2019 17:22:29 +0200
Message-ID: <CAKMK7uF2HsM5WrC5j_WNXWDjkXTyK5tP2DuoRt78FeaL5791QA@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/msm: dpu: Add modeset lock checks where applicable"
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 10, 2019 at 5:13 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> This reverts commit 1dfdb0e107dbe6ebff3f6bbbe4aad0b5aa87bba4.
>
> As Daniel mentions in his email [1], non-blocking commits don't hold the
> modeset locks, so we can safely access state as long as these functions
> are in the commit path. I'm not entirely sure if these have always been
> isolated to the commit path, but they seem to be now.
>
> [1]- https://lists.freedesktop.org/archives/dri-devel/2019-October/239441.html
>
> Fixes: 1dfdb0e107db ("drm/msm: dpu: Add modeset lock checks where applicable")
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 1 -
>  2 files changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index db6c9ccf3be26..c645dd201368b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -282,8 +282,6 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
>                 return INTF_MODE_NONE;
>         }
>
> -       WARN_ON(!drm_modeset_is_locked(&crtc->mutex));

This one is worse ... it's used in two places:
- debugfs, where you actually want to make sure you're holding this lock
- atomic_check, where this is broken since you're supposed to look at
the free-standing states only, except if you really know what you're
doing. Given that there's no comment here, I suspect that's not the
case. Note that for atomic_check you're guaranteed to hold the modeset
lock.

I'd put a FIXME here, but leave the WARN_ON until this is fixed properly.
> -
>         /* TODO: Returns the first INTF_MODE, could there be multiple values? */
>         drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
>                 return dpu_encoder_get_intf_mode(encoder);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e393a423d7d7a..0e68e20d19c87 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -305,7 +305,6 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder)
>         if (funcs && funcs->commit)
>                 funcs->commit(encoder);
>
> -       WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

but only for this hunk here.
-Daniel

>         drm_for_each_crtc(crtc, dev) {
>                 if (!(crtc->state->encoder_mask & drm_encoder_mask(encoder)))
>                         continue;
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
