Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B20515597F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 22:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725290AbfFYU5m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 16:57:42 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41890 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfFYU5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 16:57:41 -0400
Received: by mail-ed1-f65.google.com with SMTP id p15so29134544eds.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bhOPKzQiwigsKS3yyariSPBw681TeNUI7d1fw51aOwM=;
        b=nth+vo+3GkZb36pwuxISMDnGOl7vh85ZQNSkTbJlE/WXtpGJaUvTZ1ERlEnnKFUT/Z
         ZlnDJfAEVBfK/caclqgDIKCzRo3VRWF6KGnTIaR1p5gxxM5eXmnpgcVK1e3jWk1YPpvp
         ZJ7h+ClYyPRfMEoyS8L1tLDjMsjezgFGybfLFJr0eqwWBCG6axltFyO8lUIT45KBUTLD
         rJiHO0C0nZhspT9SHBbXsZmpfVO1m7XDFiVvnzCCNWqNmeCOkxw+/f+/8X27RSnrrnvR
         s76d/IXzrl9Meg+MQ1mfs7DN+aqvoJ0zYtfjNelVgyz/eGMsyIzINeCzflu5cI1upBNo
         oNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bhOPKzQiwigsKS3yyariSPBw681TeNUI7d1fw51aOwM=;
        b=WzVrlq0T0NDdWrrKhYI9mCqmNQwfDP52F5emV0uAS5FETzMVDSX76NY+TrJqc7lAqn
         YztlqMQR8rmpP4S1ndKUXmbQl6I/r1BJbFxYkgubhJh/xD3TvPCdDNBUoQxaceJCZL4U
         mh3bGOImY27FGbHHLx15g60s2+KqFrD64/TsfapCIuLQO7izk/RRul5V5iYqaU466LSU
         sKnuPNXZhLR4Fwk4m0MCkHifqlgvRQRrIkUtr3QtH1zW/j0zJZakA+dlrOpVLsPTvGt7
         BweH9xgoddsHbX7fDz8rYewAt00X4L1TVQIhlDfTHs8ir7deQRUSG3iNiWBhudC+l5Y2
         Elwg==
X-Gm-Message-State: APjAAAUttC0P+K+TL/TYvg5wp+W1O2WN/Z5SuOgpmElntAmU8KDkoz0g
        nDPLvO+eAEi6Q4YVp32zhpOpU5iicUGXF8noKSs=
X-Google-Smtp-Source: APXvYqzvtF6pDHXEzwhZYfUyGWNOdrujAU0mrW0e+01WXkq4VE9ncxsTREMUXeuixpqyEepRMeUSd/5s3qKLVg78gyU=
X-Received: by 2002:a50:8bfd:: with SMTP id n58mr594308edn.272.1561496258505;
 Tue, 25 Jun 2019 13:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch> <20190625204208.5614-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20190625204208.5614-3-daniel.vetter@ffwll.ch>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 25 Jun 2019 13:57:23 -0700
Message-ID: <CAF6AEGt3HQ5m=ebO3r-Wqc42mA9oM5NK+YmZWr-hEGXOBvaa6g@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm: Use drm_gem_fb_prepare_fb
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Eric Anholt <eric@anholt.net>,
        Emil Velikov <emil.velikov@collabora.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <sean@poorly.run>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Fritz Koenig <frkoenig@google.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 25, 2019 at 1:42 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> msm has switched over to drm_fb->obj[] a while ago already, so we can
> just use the helper.
>
> v2: Make it compile ... oops.
>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Bruce Wang <bzwang@chromium.org>
> Cc: Fritz Koenig <frkoenig@google.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org

with 1/7 this is:

Reviewed-by: Rob Clark <robdclark@gmail.com>

(and 1/7 is r-b w/ commit msg fixup)

BR,
-R


> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 8 ++------
>  drivers/gpu/drm/msm/msm_atomic.c          | 8 ++------
>  2 files changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 44a72da71482..cc08f4366bdd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -11,6 +11,7 @@
>  #include <linux/dma-buf.h>
>
>  #include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>
>  #include "msm_drv.h"
>  #include "dpu_kms.h"
> @@ -763,8 +764,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
>         struct dpu_plane *pdpu = to_dpu_plane(plane);
>         struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
>         struct dpu_hw_fmt_layout layout;
> -       struct drm_gem_object *obj;
> -       struct dma_fence *fence;
>         struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>         int ret;
>
> @@ -781,10 +780,7 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
>          *       we can use msm_atomic_prepare_fb() instead of doing the
>          *       implicit fence and fb prepare by hand here.
>          */
> -       obj = msm_framebuffer_bo(new_state->fb, 0);
> -       fence = reservation_object_get_excl_rcu(obj->resv);
> -       if (fence)
> -               drm_atomic_set_fence_for_plane(new_state, fence);
> +       drm_gem_fb_prepare_fb(plane, new_state);
>
>         if (pstate->aspace) {
>                 ret = msm_framebuffer_prepare(new_state->fb,
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index dd16babdd8c0..169d5f915e68 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -5,6 +5,7 @@
>   */
>
>  #include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>
>  #include "msm_drv.h"
>  #include "msm_gem.h"
> @@ -37,16 +38,11 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
>  {
>         struct msm_drm_private *priv = plane->dev->dev_private;
>         struct msm_kms *kms = priv->kms;
> -       struct drm_gem_object *obj;
> -       struct dma_fence *fence;
>
>         if (!new_state->fb)
>                 return 0;
>
> -       obj = msm_framebuffer_bo(new_state->fb, 0);
> -       fence = reservation_object_get_excl_rcu(obj->resv);
> -
> -       drm_atomic_set_fence_for_plane(new_state, fence);
> +       drm_gem_fb_prepare_fb(plane, new_state);
>
>         return msm_framebuffer_prepare(new_state->fb, kms->aspace);
>  }
> --
> 2.20.1
>
