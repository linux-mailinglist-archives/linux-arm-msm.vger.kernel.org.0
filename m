Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFB03D9E25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 09:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbhG2HNL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 03:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234520AbhG2HNJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 03:13:09 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6DFC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 00:13:06 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id m12so756469wru.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XKTmp2BjlaIr87ckUfRqle/VWMn8gi8O/5KnqPiPgkg=;
        b=gnVQLWwjTIDB4n0RTLbHFDZTJ3Il72HNNte/oyI26tSHD5kF7hR01fRoVk5G76gbtB
         D9fSH9m3z6glPMu/oIFMZzHatpI+DEd7JDNPYp3IRCcegvYbdCu78detM/dxzrpt+hm8
         jCe2J0C8bYoUwkHK7/miMw9wy5sRHxyVRME08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XKTmp2BjlaIr87ckUfRqle/VWMn8gi8O/5KnqPiPgkg=;
        b=S3qdF3KV8eR/4FaK3TxVXMkbqmbvTiI19bqBuMEzDSvEmzrlI+sN6PHwjV+Cil79UZ
         ADioOU7qda5IzME2xsRdJzwMGnEy0UAoRtdCCEr1yNgZK7MVWwWYjEueXh73aLQ51XI7
         Gd2ndQDmezyr9I0qTjib1ITUE9/V/bJKEY8AReD0sTgeY8rPKt9Nj9YOQaxfoM6UJGQV
         Ams3ubQUjiddC04CKiYF4ML2Zz2L24xGe4cdEqK0rVRzCV5c8fVsgXTo8XsEoMKZ9ufS
         nPJhMU2IZhEMZZLpOKw90UYSQuUxUbDCAN4I8aLOaJUIucGwBEIEaflHHzVo3PEA3ydg
         yXRg==
X-Gm-Message-State: AOAM530zoai2OKVLtwEiUJt0b+AFcXT0mpfTy8hNMPD/d/5YWqJsO0/T
        npmv9FY1dXpwVuOtReMT/z/KHg==
X-Google-Smtp-Source: ABdhPJxVe3J1Rxvy3GVcIQAMEDxyKw+/TX7ixTj4mwp9eXwkfffl87GdtaWJWuY0nLJ6jnnCBLoDPg==
X-Received: by 2002:a05:6000:1818:: with SMTP id m24mr3138418wrh.49.1627542785405;
        Thu, 29 Jul 2021 00:13:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t23sm6760949wmi.32.2021.07.29.00.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 00:13:04 -0700 (PDT)
Date:   Thu, 29 Jul 2021 09:13:02 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [early pull] drm/msm: drm-msm-next-2021-07-28 for v5.15
Message-ID: <YQJU/vGDpLIpf+2p@phenom.ffwll.local>
References: <CAF6AEGumRk7H88bqV=H9Fb1SM0zPBo5B7NsCU3jFFKBYxf5k+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGumRk7H88bqV=H9Fb1SM0zPBo5B7NsCU3jFFKBYxf5k+Q@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 28, 2021 at 01:52:42PM -0700, Rob Clark wrote:
> Hi Dave & Daniel,
> 
> An early pull for v5.15 (there'll be more coming in a week or two),
> consisting of the drm/scheduler conversion and a couple other small
> series that one was based one.  Mostly sending this now because IIUC
> danvet wanted it in drm-next so he could rebase on it.  (Daniel, if
> you disagree then speak up, and I'll instead include this in the main
> pull request once that is ready.)

I like, but might be some time until I managed to rebase it all and adjust
msm too. Thanks for doing the early pull.
-Daniel

> 
> This also has a core patch to drop drm_gem_object_put_locked() now
> that the last use of it is removed.
> 
> The following changes since commit ff1176468d368232b684f75e82563369208bc371:
> 
>   Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-07-28
> 
> for you to fetch changes up to 4541e4f2225c30b0e9442be9eb2fb8b7086cdd1f:
> 
>   drm/msm/gem: Mark active before pinning (2021-07-28 09:19:00 -0700)
> 
> ----------------------------------------------------------------
> Rob Clark (18):
>       drm/msm: Let fences read directly from memptrs
>       drm/msm: Signal fences sooner
>       drm/msm: Split out devfreq handling
>       drm/msm: Split out get_freq() helper
>       drm/msm: Devfreq tuning
>       drm/msm: Docs and misc cleanup
>       drm/msm: Small submitqueue creation cleanup
>       drm/msm: drop drm_gem_object_put_locked()
>       drm: Drop drm_gem_object_put_locked()
>       drm/msm/submit: Simplify out-fence-fd handling
>       drm/msm: Consolidate submit bo state
>       drm/msm: Track "seqno" fences by idr
>       drm/msm: Return ERR_PTR() from submit_create()
>       drm/msm: Conversion to drm scheduler
>       drm/msm: Drop submit bo_list
>       drm/msm: Drop struct_mutex in submit path
>       drm/msm: Utilize gpu scheduler priorities
>       drm/msm/gem: Mark active before pinning
> 
>  drivers/gpu/drm/drm_gem.c                   |  22 --
>  drivers/gpu/drm/msm/Kconfig                 |   1 +
>  drivers/gpu/drm/msm/Makefile                |   1 +
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
>  drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   6 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
>  drivers/gpu/drm/msm/msm_drv.c               |  30 ++-
>  drivers/gpu/drm/msm/msm_fence.c             |  53 +----
>  drivers/gpu/drm/msm/msm_fence.h             |  44 +++-
>  drivers/gpu/drm/msm/msm_gem.c               |  94 +-------
>  drivers/gpu/drm/msm/msm_gem.h               |  47 ++--
>  drivers/gpu/drm/msm/msm_gem_submit.c        | 344 +++++++++++++++++-----------
>  drivers/gpu/drm/msm/msm_gpu.c               | 220 ++++--------------
>  drivers/gpu/drm/msm/msm_gpu.h               | 139 ++++++++++-
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 203 ++++++++++++++++
>  drivers/gpu/drm/msm/msm_rd.c                |   6 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c        |  69 +++++-
>  drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
>  drivers/gpu/drm/msm/msm_submitqueue.c       |  53 +++--
>  include/drm/drm_gem.h                       |   2 -
>  include/uapi/drm/msm_drm.h                  |  14 +-
>  26 files changed, 865 insertions(+), 536 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
