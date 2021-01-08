Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1142EEEE1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 09:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbhAHIzY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 03:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727816AbhAHIzQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 03:55:16 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C478DC0612F5
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 00:54:35 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id r3so8221851wrt.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 00:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QuR+JC6c/wr5a0vkmt1t5u+qCj+GkMz9/HxZNyt+DCY=;
        b=KEf3i2omZZwrv0pr+7ro9gc/I89DER1jlACD56wRz+nifPEPj/IDE1iVZjK6PfEWRp
         T2Yp7xx77cl1Rkn9p9GNx3ycylyqogHS2bd3s7GAyh3B47HzMJgsYbdhoQ3oO83UK6oy
         t0Dh4CL5Im4j98rEF4M9bSpgiysANPmfWfh6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QuR+JC6c/wr5a0vkmt1t5u+qCj+GkMz9/HxZNyt+DCY=;
        b=ZQfkKOd3zuwPBhmoimh2QaxHAv6IR04JUeNx2Jzc3VChm2yG0ae2LQHUgnqTXfJ0TS
         sV08fJ4IxMnhRO3Ranjt+m6NPxe85lpORQtb0Ee5WJf6v+5xgTvv6D65RR/aMEDxarWM
         wl1Zr1Sn/8ZA1GfVHkvHYDphTHgYz2HseMXh+zwD7rRgXFKGqoTe4/wnLFXamfFXkPPD
         EWKDUO7XxyivYlZV3C/SXKhjls/H4pH3jJ08PRVAMi6jRZ78/M1peHAXAyvf41d4YuDV
         yxcbUSImoijE0auBeSfnVpsADpggk446S90oohjV40YAJST8xlfjyawGfDsRBgLaZ45c
         tTfQ==
X-Gm-Message-State: AOAM5319kIFAGrtH6HVsx41HtEq3Ok8uXeyiRPpe8XyNOfVihrvyRFjy
        4XDvIIF04tdmL6BMc219iW7q4w==
X-Google-Smtp-Source: ABdhPJyNbFAVIbTd+XR5DzXliuhYX2RzBzptCc19XAuMuO9iVGMPScn3uS27BR0GrpdpehHcfqNU7Q==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr2697031wro.338.1610096074512;
        Fri, 08 Jan 2021 00:54:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l11sm12317188wrt.23.2021.01.08.00.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 00:54:33 -0800 (PST)
Date:   Fri, 8 Jan 2021 09:54:31 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Dave Airlie <airlied@gmail.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [pull] drm/msm: drm-msm-fixes-2021-01-07
Message-ID: <X/gdxzT+o8BcsoY9@phenom.ffwll.local>
References: <CAF6AEGtWMhzyD6kejmViZeZ+zfJxRvfq-R2t_zA+DcDiTxsYRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtWMhzyD6kejmViZeZ+zfJxRvfq-R2t_zA+DcDiTxsYRQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 07, 2021 at 01:54:59PM -0800, Rob Clark wrote:
> Hi Dave,
> 
> A few misc fixes
> 
> The following changes since commit e319a1b956f785f618611857cd946dca2bb68542:
> 
>   drm/msm: add IOMMU_SUPPORT dependency (2020-12-05 08:25:52 -0800)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-01-07

Applied, thanks.
-Daniel

> 
> for you to fetch changes up to 00fd44a1a4700718d5d962432b55c09820f7e709:
> 
>   drm/msm: Only enable A6xx LLCC code on A6xx (2021-01-07 09:23:05 -0800)
> 
> ----------------------------------------------------------------
> Craig Tatlor (1):
>       drm/msm: Call msm_init_vram before binding the gpu
> 
> Iskren Chernev (3):
>       drm/msm: Fix null dereference in _msm_gem_new
>       drm/msm: Ensure get_pages is called when locked
>       drm/msm: Add modparam to allow vram carveout
> 
> Konrad Dybcio (1):
>       drm/msm: Only enable A6xx LLCC code on A6xx
> 
> Kuogee Hsieh (1):
>       drm/msm/dp: postpone irq_hpd event during connection pending state
> 
> Rob Clark (1):
>       drm/msm: Fix WARN_ON() splat in _free_object()
> 
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  6 ++++--
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  6 ++++--
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  6 ++++--
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  4 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 21 ++++++++++++---------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
>  drivers/gpu/drm/msm/dp/dp_display.c        |  7 +++++++
>  drivers/gpu/drm/msm/dp/dp_panel.c          | 12 +++++++++---
>  drivers/gpu/drm/msm/msm_drv.c              |  8 ++++----
>  drivers/gpu/drm/msm/msm_gem.c              | 13 +++++++++----
>  10 files changed, 63 insertions(+), 26 deletions(-)
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
