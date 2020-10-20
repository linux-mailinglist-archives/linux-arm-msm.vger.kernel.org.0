Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C2E2936BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 10:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388378AbgJTIYK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 04:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728071AbgJTIYJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 04:24:09 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB8EC0613CE
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 01:24:09 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z22so661576wmi.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 01:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=mrQqSJa8Aar4GS8/7wrxTSVqOxQkrKDNi4m7hMd2uFo=;
        b=Z9VvQfZmtC1Y4vzNAz3kvptekU4P/Ibhm6rYs81RSLlGOtQRbGoNhF0miHgrwdYHCI
         2IunewN5tv/iZ/vuMS8V4yUUY3j7Ziz+yrTEMkuuQLiksU6evAPMUERo7dIsOOUxRMim
         lknGTbVq94VjGXF2b1HajbHMEz3cs7KGOT4xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=mrQqSJa8Aar4GS8/7wrxTSVqOxQkrKDNi4m7hMd2uFo=;
        b=QzzeHdNN5/oaZTXP11yKdpiGYXZnUvVoH8TltGX5QFs1KsMN8z20ddVqv8yzpbww4n
         d5idcdZQbCRHgmONUuyVYPCOJ6qLHfndZU5+xuiL/55DBBQ1QC5IAoNGVIb03O3OK8/o
         moIgUjivGH/mPShxeXYNo2mcRYWvwmecW7a5WbE6+gSnhZX8sn0xoiziSZYikUPHlift
         cauYyvr2Z96MWq6Hnzt969ijH66JVB/Uj1+1TsruMqeSi6aKL7JLWGoGSgkP4Hd4EiKd
         WxNtXO++laZzuU/alSD3FEVksRD2cjTA4VB3dlZjKv1+XWyFeR1taP+Su4rkgln9SDJ2
         Ihbg==
X-Gm-Message-State: AOAM531gv4UDK2QNyADceyEeFGRjlOZSjjIczVgaOe9XpsuPACfGLUW4
        YcCuNigXwQV73U1fapExuKqxmw==
X-Google-Smtp-Source: ABdhPJwtLShOv1ZYV3eB9CMVZJLNc4lIYGe5fxTpbduot0zqOSM7NvO9zRraNoE7IJWH4luZXHdLcQ==
X-Received: by 2002:a1c:68d5:: with SMTP id d204mr1659695wmc.100.1603182247741;
        Tue, 20 Oct 2020 01:24:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p67sm1561934wmp.11.2020.10.20.01.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 01:24:06 -0700 (PDT)
Date:   Tue, 20 Oct 2020 10:24:04 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Rob Clark <robdclark@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Roy Spliet <nouveau@spliet.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        tongtiangen <tongtiangen@huawei.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Drew Davenport <ddavenport@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH 0/3] drm/msm: kthread_worker conversion
Message-ID: <20201020082404.GJ401619@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Rob Clark <robdclark@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Roy Spliet <nouveau@spliet.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        tongtiangen <tongtiangen@huawei.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Drew Davenport <ddavenport@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
References: <20201019211101.143327-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019211101.143327-1-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 19, 2020 at 02:10:50PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In particular, converting the async atomic commit (for cursor updates,
> etc) to SCHED_FIFO kthread_worker helps with some cases where we
> wouldn't manage to flush the updates within the 1ms-before-vblank
> deadline resulting in fps drops when there is cursor movement.
> 
> Rob Clark (3):
>   drm/msm/gpu: Convert retire/recover work to kthread_worker
>   drm/msm/kms: Update msm_kms_init/destroy
>   drm/msm/atomic: Convert to per-CRTC kthread_work

So i915 has it's own commit worker already for $reasons, but I don't think
that's a good path to go down with more drivers. And the problem seems
entirely generic in nature ...
-Daniel

> 
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +--
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  6 ++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  4 +--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  8 +++++-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  8 +++++-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 11 ++++++---
>  drivers/gpu/drm/msm/disp/mdp_kms.h        |  9 +++++--
>  drivers/gpu/drm/msm/msm_atomic.c          | 25 +++++++++++++++----
>  drivers/gpu/drm/msm/msm_drv.h             |  3 ++-
>  drivers/gpu/drm/msm/msm_gpu.c             | 30 +++++++++++++++--------
>  drivers/gpu/drm/msm/msm_gpu.h             | 13 +++++++---
>  drivers/gpu/drm/msm/msm_kms.h             | 23 ++++++++++++++---
>  13 files changed, 104 insertions(+), 43 deletions(-)
> 
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
