Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF1D25BB89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 09:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgICHXV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 03:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgICHXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 03:23:20 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4C1C061244;
        Thu,  3 Sep 2020 00:23:20 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id h23so565977vkn.4;
        Thu, 03 Sep 2020 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nYtPH/AGq9Arqr6Pnj4bZq+KucnVkSWBPEySgVn+z48=;
        b=kVliyIbaEUKHfO4xZWqE+52p0FTfiE73C1Dhz7+J11EpmW05Vb4VZ9f4Qt+b2O4RHN
         IR+F8tMYHxguugL1aOXsWLv8yr6I7M8o2IGDxbg8NzVxaLhqOvInhfgdoNU+CO34B04p
         6UbNDtk/pPVbYhltWMeUM5bw5lnIk5Vmyp+HBE56MA6P29Ab2sBk6o8LCbGVlCLgwa9Z
         rDEhVIkbMKT6QqWek8lH2lC6kPXb0KhWvjfEs2AQdOEbpPjmaFtbQLSq20Tag+zYGwPo
         kyNgK7uZboEjdcTmaC9mJ5aNksjusZgvbZxTYbPXPtcqmfnXemtqxdUmkToKhzphuLGf
         FyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nYtPH/AGq9Arqr6Pnj4bZq+KucnVkSWBPEySgVn+z48=;
        b=k7EA9fcKWEe5cdq1LuPjbOkBwn8FbzJz9PrK4XOzP0GEZDg7UGa8J425o3HchL+/I3
         tmjzPaNhoowwOsO5QjXH7WLStvDOHIBi4N2NG7MeU+B1VrBiC17gd7LZSHx2t/NpV3BX
         aHF8fvhe5lig2HvEPzql5EZZAPJQE2Qs8n7Brud2/DQa/gOf6cfLnMVvLdHyjwwDVe2e
         7672goqfZh+xDvP6+hNprQTK5NtevfgNeEBnh/cQxPAFgju/KQZXh26WJuUFSUZ+lRM4
         nUNhYS6fdBWkznUje3f+2Hv3jyc3W9bIO4wUh/JeYrZgV7oNP+GJMibBH7KILi25Ab/V
         7GuQ==
X-Gm-Message-State: AOAM533W9u7QZw3Q4e3FWT6i69u1IiRTSm+ikNbFkuj3LFNSFO74CagB
        1x/Nx8XGSjZ+SKsIEeMqAbwzwKfeCGqoM0iFnSVrxoGj3gs=
X-Google-Smtp-Source: ABdhPJzkeFXIQzqDgqXC99kkdDPH3UnC8CAmw5bH+NsVf2nsqOvneLOy0x2VfmXMLS2U68g+CkWma2gKwfqEGyfNlCs=
X-Received: by 2002:a1f:2a48:: with SMTP id q69mr774030vkq.69.1599117799327;
 Thu, 03 Sep 2020 00:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200901154200.2451899-1-robdclark@gmail.com> <20200901154200.2451899-3-robdclark@gmail.com>
In-Reply-To: <20200901154200.2451899-3-robdclark@gmail.com>
From:   =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date:   Thu, 3 Sep 2020 00:23:08 -0700
Message-ID: <CAOeoa-cbQv2pkpxhXMV++NY3MbouPP077UVPnp7fu3zjFxt8Uw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm: Convert shrinker msgs to tracepoints
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 1, 2020 at 8:41 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This reduces the spam in dmesg when we start hitting the shrinker, and
> replaces it with something we can put on a timeline while profiling or
> debugging system issues.

That is a good solution,

Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_shrinker.c |  5 +++--
>  drivers/gpu/drm/msm/msm_gpu_trace.h    | 26 ++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index 722d61668a97..482576d7a39a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -6,6 +6,7 @@
>
>  #include "msm_drv.h"
>  #include "msm_gem.h"
> +#include "msm_gpu_trace.h"
>
>  static bool msm_gem_shrinker_lock(struct drm_device *dev, bool *unlock)
>  {
> @@ -87,7 +88,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>                 mutex_unlock(&dev->struct_mutex);
>
>         if (freed > 0)
> -               pr_info_ratelimited("Purging %lu bytes\n", freed << PAGE_SHIFT);
> +               trace_msm_gem_purge(freed << PAGE_SHIFT);
>
>         return freed;
>  }
> @@ -123,7 +124,7 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
>         *(unsigned long *)ptr += unmapped;
>
>         if (unmapped > 0)
> -               pr_info_ratelimited("Purging %u vmaps\n", unmapped);
> +               trace_msm_gem_purge_vmaps(unmapped);
>
>         return NOTIFY_DONE;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
> index 07572ab179fa..1079fe551279 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_trace.h
> +++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
> @@ -114,6 +114,32 @@ TRACE_EVENT(msm_gmu_freq_change,
>                 TP_printk("freq=%u, perf_index=%u", __entry->freq, __entry->perf_index)
>  );
>
> +
> +TRACE_EVENT(msm_gem_purge,
> +               TP_PROTO(u32 bytes),
> +               TP_ARGS(bytes),
> +               TP_STRUCT__entry(
> +                       __field(u32, bytes)
> +                       ),
> +               TP_fast_assign(
> +                       __entry->bytes = bytes;
> +                       ),
> +               TP_printk("Purging %u bytes", __entry->bytes)
> +);
> +
> +
> +TRACE_EVENT(msm_gem_purge_vmaps,
> +               TP_PROTO(u32 unmapped),
> +               TP_ARGS(unmapped),
> +               TP_STRUCT__entry(
> +                       __field(u32, unmapped)
> +                       ),
> +               TP_fast_assign(
> +                       __entry->unmapped = unmapped;
> +                       ),
> +               TP_printk("Purging %u vmaps", __entry->unmapped)
> +);
> +
>  #endif
>
>  #undef TRACE_INCLUDE_PATH
> --
> 2.26.2
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
