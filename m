Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68C821C1DD7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 21:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgEAT0y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 15:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726346AbgEAT0x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 15:26:53 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F355C08E859
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2020 12:26:53 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id pg17so8315263ejb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2020 12:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WSBsQZ2+xdpIGJHeWYCQoQ8u8zj8iW41GKBmcCq8Vf4=;
        b=DLoHcXmcvTFS/+twF+21LyXQXa4r4cYqQemg0TWHfg58oMuYNXGlh4SbNe1B1cZWqa
         pujm5ZCp6nUNtWH1bpuP7OT1zBdLGI8kmzc5Gkuw3zLLyc2k8omqAuPDaalUhwAbPtcx
         C3eBYHxenOfc1KBPb2qSB/tdUOXMWOqyoiWoqzwNtZNoLeaCYjZB8AFmnHlC1Ak1PwhO
         0Q9DHbS3rT5WcnA/M6enVwME+JEpBS9mSZZsAGVyC2CT6CuKaAgJTGLFM+EwSuHx/QjA
         0hAqt5i/jSubHG67tR13+UV9Qq9vkTRzsw09F5Mqov72qHjl+ZMBVjy+KYXUz32XgIPu
         kX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WSBsQZ2+xdpIGJHeWYCQoQ8u8zj8iW41GKBmcCq8Vf4=;
        b=ZUKaVlMPSwqr+gOocGufX+LWAPf2//N7HSOiIA+EhLLDm6cNpSwPhZJROrxjWGI/S5
         UliYKZNDA524NqY2CLoYxcFVkUpr69eT3Ha0kNp6x7iisqxFs+5KBOQZfEy0PtwdZ7BU
         IgMIJzxH3xwAH6tfGsF5F8PNqtOEQVDRwT8HwnGLjpgb7qWCZQM8zhl29xogLIqj/YFm
         erXTmym5WlFSz1FD1HQMNz68C1KpDO7Pc9LiaHQCF8biZVIjXiBMWViUz5uOd+f8vt3O
         ZjuaY9w2YYrOOE4biZ6ULioxt+Ux3yl6dbfBx2xmWntToT7M4/EeSSCiUJpKxfl69V8c
         KkOQ==
X-Gm-Message-State: AGi0PubH0AKul7cir+StDBSTG9nwbeRXJMIuThXZyvtpc6uT3Sre8PQu
        IbHW+iE9rwPWGUyWk43yOJDDHzr8kDxfAjl3i6Zj7bYI5Bk=
X-Google-Smtp-Source: APiQypLApNY61otSA22NZA39/hjaktQy51DUgGFWhUfIxiTrwN68t56bqzU5r5Zim7TgQ4ysNdZzyPE3WcKZnLt9dbU=
X-Received: by 2002:a17:907:214d:: with SMTP id rk13mr4810578ejb.220.1588361211835;
 Fri, 01 May 2020 12:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200501190320.17681-1-jcrouse@codeaurora.org>
In-Reply-To: <20200501190320.17681-1-jcrouse@codeaurora.org>
From:   Eric Anholt <eric@anholt.net>
Date:   Fri, 1 May 2020 12:26:40 -0700
Message-ID: <CADaigPXJJoEgWK6nx8yc_DVsDAv1VdzuA5NYZO63K=hHVvT2JQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Check for powered down HW in the devfreq callbacks
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 1, 2020 at 12:03 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Writing to the devfreq sysfs nodes while the GPU is powered down can
> result in a system crash (on a5xx) or a nasty GMU error (on a6xx):
>
>  $ /sys/class/devfreq/5000000.gpu# echo 500000000 > min_freq
>   [  104.841625] platform 506a000.gmu: [drm:a6xx_gmu_set_oob]
>         *ERROR* Timeout waiting for GMU OOB set GPU_DCVS: 0x0
>
> Despite the fact that we carefully try to suspend the devfreq device when
> the hardware is powered down there are lots of holes in the governors that
> don't check for the suspend state and blindly call into the devfreq
> callbacks that end up triggering hardware reads in the GPU driver.
>
> Call pm_runtime_get_if_in_use() in the gpu_busy() and gpu_set_freq()
> callbacks to skip the hardware access if it isn't active.
>
> v2: Use pm_runtime_get_if_in_use() per Eric Anholt
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 ++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++++
>  3 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 724024a2243a..4d7f269edfcc 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1404,6 +1404,10 @@ static unsigned long a5xx_gpu_busy(struct msm_gpu *gpu)
>  {
>         u64 busy_cycles, busy_time;
>
> +       /* Only read the gpu busy if the hardware is already active */
> +       if (pm_runtime_get_if_in_use(&gpu->pdev->dev) <= 0)
> +               return 0;
> +

RPM's APIs are a bit of a trap and will return a negative errno for
the get functions if runtime PM is disabled in kconfig, even though
usually that would mean that the power domain is not ever disabled by
RPM.  I think in these checks you want "if (pm_runtime_get_if_in_use()
== 0)", and that seems to be a common pattern in other drivers.  With
that,

Reviewed-by: Eric Anholt <eric@anholt.net>

(and tested, too)
