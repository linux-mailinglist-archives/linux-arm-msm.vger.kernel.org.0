Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9494233A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 00:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236858AbhJEWn1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 18:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236869AbhJEWnZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 18:43:25 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01486C061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 15:41:34 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r10so2489881wra.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=innzCsihXomZmrhVK7jQXZcENUr7+ebtMDPo3Mzcujk=;
        b=F1Ahjb4KIfhWT/zPbY7Ny2zkSNa9mWESCa0UGJgHOkiEX/0LCFpCHxDYP1s+pPcOD3
         o8mJnKvFb7hBB4LQ1wfrfpFVA7mhepHTOCCdEWfppXAZq/VAF63pMl0VwnKmCClHqvdY
         y6nLitZOSwLgZVwXHH81jXntq8peAXkctdf2j+zmStkeIyg4ErGOtBAg1F8BFQEw5/TN
         dzRmYdsdb+MXSqHEgHGvVfGsk5L9tGuMTpxhKGGiD2Tzc8wzxSkhne99EWCvv3hx6nlt
         WinMtWY35qIZrERKR+RqgkThuxHZp135mzM2wpFo097yCWGj1NnSyPjy0eHmFk2fWboK
         CfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=innzCsihXomZmrhVK7jQXZcENUr7+ebtMDPo3Mzcujk=;
        b=q3KJzNj8S5TmzMdxvPU1izFetNcr6JSGHbtue5L3PoKsj5jNMyCcTBQuNgM7E+fWhU
         RJ0noxbjbzwhBOKAZ6gM2Qsef0uBjRJsmOqhNQRJl/q3PYIOJRpqNBDYUC989I4rz0nz
         hT6R0p4IU8cuSOE3X1hJof3/mDAEoiBCQ4CrdBOHt1UEBFcwCM3K3yIVRgNhJRsMp/M7
         MtP1Pgdkr5/Pp/sQThG8PgVtRB1fuwaLMvPjqmQJF7sjw36ay6kZCdBNtRfohPTic+AE
         QD78smnlt0Pj7gjohCauCuYrryz4IN9IElinMgRgzAgk57/6oH8iQ/XVz1carE30BHGN
         P8xQ==
X-Gm-Message-State: AOAM532JjsZcqeeix3YF7PPqVuvJushCliOm3rsT+zMxBMGAaAQSdy2c
        0iLVapsI8vrv1FRzXLTkZEra5Tl+RVspohFwkmD3oi7g
X-Google-Smtp-Source: ABdhPJyXyel7wd9XYQw7fOOTZFhFN7VZZTsgdvrlgxiXZZDrBBUd8nw8dfi1lXSx+UUe5JcmP8VTe1KQ5j60Dt1zwnk=
X-Received: by 2002:adf:bbd1:: with SMTP id z17mr24750497wrg.61.1633473692538;
 Tue, 05 Oct 2021 15:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGtD4u7yyiy+BQLmibUCbn=AdDRu7FrmdViHVx0QrcGf8g@mail.gmail.com>
In-Reply-To: <CAF6AEGtD4u7yyiy+BQLmibUCbn=AdDRu7FrmdViHVx0QrcGf8g@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 5 Oct 2021 15:46:07 -0700
Message-ID: <CAF6AEGu0E8TQyW4Zykve5Y_ZG9kGWS_MCa2y1iVu+N6gR5XGtw@mail.gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-fixes-2021-10-05 for v5.15-rc5
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ dri-devel, sorry hit 'send' too quickly

On Tue, Oct 5, 2021 at 3:45 PM Rob Clark <robdclark@gmail.com> wrote:
>
> Hi Dave & Daniel,
>
> A few fixes for v5.15:
>
> * Fix a new crash on dev file close if the dev file was opened when
>   GPU is not loaded (such as missing fw in initrd)
> * Switch to single drm_sched_entity per priority level per drm_file
>   to unbreak multi-context userspace
> * Serialize GMU access to fix GMU OOB errors
> * Various error path fixes
> * A couple integer overflow fixes
> * Fix mdp5 cursor plane WARNs
>
> The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:
>
>   Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-10-05
>
> for you to fetch changes up to c6921fbc88e120b2279c55686a071ca312d058e9:
>
>   drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling
> (2021-10-04 08:08:07 -0700)
>
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       drm/msm/submit: fix overflow check on 64-bit architectures
>
> Colin Ian King (1):
>       drm/msm: Fix null pointer dereference on pointer edp
>
> Dan Carpenter (4):
>       drm/msm/a4xx: fix error handling in a4xx_gpu_init()
>       drm/msm/a3xx: fix error handling in a3xx_gpu_init()
>       drm/msm/dsi: Fix an error code in msm_dsi_modeset_init()
>       drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling
>
> Dmitry Baryshkov (2):
>       drm/msm/mdp5: fix cursor-related warnings
>       drm/msm/dsi/phy: fix clock names in 28nm_8960 phy
>
> Fabio Estevam (1):
>       drm/msm: Do not run snapshot on non-DPU devices
>
> Kuogee Hsieh (1):
>       drm/msm/dp: only signal audio when disconnected detected at dp_pm_resume
>
> Marek Vasut (1):
>       drm/msm: Avoid potential overflow in timeout_to_jiffies()
>
> Marijn Suijten (1):
>       drm/msm/dsi: dsi_phy_14nm: Take ready-bit into account in poll_for_ready
>
> Rob Clark (5):
>       drm/msm: Fix crash on dev file close
>       drm/msm/a6xx: Serialize GMU communication
>       drm/msm/a6xx: Track current ctx by seqno
>       drm/msm: A bit more docs + cleanup
>       drm/msm: One sched entity per process per priority
>
> Robert Foss (1):
>       drm/msm/dpu: Fix address of SM8150 PINGPONG5 IRQ register
>
> Stephan Gerhold (1):
>       drm/msm: Fix devfreq NULL pointer dereference on a3xx
>
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c           |  9 ++--
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c           |  9 ++--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c           |  6 +++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h           |  3 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c           | 46 ++++++++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h           | 11 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c  |  2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c       | 16 ++++++
>  drivers/gpu/drm/msm/dp/dp_display.c             | 10 ++--
>  drivers/gpu/drm/msm/dsi/dsi.c                   |  4 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c              |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 30 +++++------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 +-
>  drivers/gpu/drm/msm/edp/edp_ctrl.c              |  3 +-
>  drivers/gpu/drm/msm/msm_drv.c                   | 15 ++++--
>  drivers/gpu/drm/msm/msm_drv.h                   | 47 +---------------
>  drivers/gpu/drm/msm/msm_gem_submit.c            |  7 +--
>  drivers/gpu/drm/msm/msm_gpu.h                   | 66 ++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c           |  6 +++
>  drivers/gpu/drm/msm/msm_submitqueue.c           | 72 ++++++++++++++++++++-----
>  20 files changed, 256 insertions(+), 112 deletions(-)
