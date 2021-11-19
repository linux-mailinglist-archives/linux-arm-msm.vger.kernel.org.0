Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773F6457918
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 23:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233493AbhKSWxt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 17:53:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhKSWxs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 17:53:48 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5091CC061574;
        Fri, 19 Nov 2021 14:50:46 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so11641166wme.0;
        Fri, 19 Nov 2021 14:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ncGZ8xwc7OhnxGmL+ovKtcewVUckULPPfk9VsqmiXik=;
        b=RGsI07w67PD/LL56RAdYR5Ool99iRceODaj/DSvhFWl0iKYxxLeL97QWWlRI6TwA1Q
         FkdIGCtPc+2ilvmuJl0COjmYBuFXMK8i7X0AqmhiDsjJDfmPbpEufevy/G8XAcpqU/Iw
         mujJRnyNU2l1zi17orQyeh31V4KXIaTZqPhdMTOdhwEcbfWHy9PcJcLNK+8qgoUwBLZR
         b/bnC+5yQkW5khCjsdDX4Lc1vdGdBJ5SLFJwttBTRlw3dE3TyAov+iUFP+pYVUQq1Td8
         CD8uoHtEwlc/OfgetQljTejBuJpHTcOTIihO5JlONhEYhf18uavNWFJUAy/ZMDqeh3/M
         9/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ncGZ8xwc7OhnxGmL+ovKtcewVUckULPPfk9VsqmiXik=;
        b=cZIedrGuDkpZsSi6aj+xdSDMwdQvZwYEboZmSoe5PKMfCcn9QUCI53WcWAn+BYLJka
         QTeOZU0u68B5HIzbamjDVaqHU9YBd2X+pz+C2kZ0uw1aiIiW8gOTexSDsY4WBf7V4UtH
         wyba0JGHl/XWbkT9RCujvfPSct4bgOax9VV519HZquQTcTXuJXk2LtmOqko2klth53At
         xzX1aFXBRsP47ehAH1Cv++t5pzrU0y+jVMfcpQQKFEFdI25FKh/gA5pt8dDfEfxItnmH
         wMwlddMyW0XfuMKcdFJuS5wQTNZJFMKQAnpdvxoxHHuv9l1ffq/uTo9SxDggncx+cec/
         Sdkw==
X-Gm-Message-State: AOAM5325BbHr3ZW+Ha31XbD0FOVFcBpwIeWIcs5NQWgxeYo4t8cdlM62
        Lo5wQPp8UJeO187EeNtVkx/Pbd6d9jW/D4+NHKs=
X-Google-Smtp-Source: ABdhPJz+xkFmybNRxJUJ0e4J55Cz/pZZLhfAEwMy6aDAom4HChI8NvpLK8bGQoWZzLwzlJABw8r74vHB218/msW/JRg=
X-Received: by 2002:a05:600c:4f87:: with SMTP id n7mr4099763wmq.168.1637362244862;
 Fri, 19 Nov 2021 14:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20211119225157.984706-1-robdclark@gmail.com>
In-Reply-To: <20211119225157.984706-1-robdclark@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 19 Nov 2021 14:55:49 -0800
Message-ID: <CAF6AEGufo9pJRrT003gcMD3d1VP8SqCjN3uSFmgQKDPojfU4QQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/gpu: Fix idle_work time
To:     dri-devel <dri-devel@lists.freedesktop.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 19, 2021 at 2:46 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This was supposed to be a relative timer, not absolute.
>

Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 43468919df61..7285041c737e 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -228,5 +228,5 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>         struct msm_gpu_devfreq *df = &gpu->devfreq;
>
>         msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
> -                              HRTIMER_MODE_ABS);
> +                              HRTIMER_MODE_REL);
>  }
> --
> 2.33.1
>
