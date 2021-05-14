Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C825D381161
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 22:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhENUHd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 16:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbhENUHd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 16:07:33 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47658C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 May 2021 13:06:20 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id s8so351293wrw.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 May 2021 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Beqb/QMDDkalUMDor+4Tgdl7fgBEI/mGqX0vOGB5t7E=;
        b=BgIXynPZPV4pNpoGoVRCf41GjGiXF4yihmiAh91GG6sHICuCsSYUd48SLcg09+kuAX
         2xmU2hsthAFcc24v57LGKBIoqQDuX/fIEF/SVWJBSczh6vabxzu2walstzWPo/3zPwAs
         sHPMuiHrT1URZjOLXIIdwiFh/sxrILnLY67ojBmoG7c6YUBYSJil1h8FBOHaj5frYHfG
         kHymDKlzas9QzznbgIw+0/fvJkdVOZ80yQK5PTEsBre9uE/6hFGl+sE8kAcguy5ffCL+
         P8u+S73rOFUTKMU9TUsSsEW6ssYHHNhkTR91tFBy1vD/loGgpFzS+ykafroLHvDMqbO7
         4ybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Beqb/QMDDkalUMDor+4Tgdl7fgBEI/mGqX0vOGB5t7E=;
        b=n49UO6KZwHhU01LxHAkfNCe9NH3TpJo1uum0+JCR1Ka0Y1mIHsk1+DVSr82HpdRumM
         WThm4UUdleilu/OVp6L/EiWqFou2HcUWP47vC606mLlBBeIsrBsEBFby/PDjwghCPIQG
         0Nkdv+p24fDpfm+D6xvHOqzQtuwXQj3GH6mTeDQiphJ/i0pPrGDIcdb6rToBUa9lxcPc
         WQE4TqXDt7poOx5iv2BvaW0A35LY2qFHvk70HoPNWEfmuZdDauilNE5xy54CRr2jRV1u
         rg2CJlBZQxW9IioCL1AHWUS6G3bINSOv1EeOldLtWwdnm+F8C+oXs1TdhU1M+EydOhyF
         kbaQ==
X-Gm-Message-State: AOAM532ihavcT6e/7ttBPkXZBSRyGy1RhjxGA2yiJtVRkiU3yOycENiF
        u/zjZp7B5dCSz6uOeWWnOXA33hFA2AG9cqAlAYNZujBQWeo=
X-Google-Smtp-Source: ABdhPJz7gXwZ7Lv8m9o7hl23wOYCrZkgOl8V3j/QCn7bsqydj23k6l5aKvHiko5A2AxVS/rj/79+LgcipabcGWLQBm8=
X-Received: by 2002:adf:e510:: with SMTP id j16mr61886319wrm.28.1621022779035;
 Fri, 14 May 2021 13:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGtmr-X=Cs8V0bJZMAuONcvn8-rfJGuMNXCO9Q39JYEaFQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtmr-X=Cs8V0bJZMAuONcvn8-rfJGuMNXCO9Q39JYEaFQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 14 May 2021 13:10:00 -0700
Message-ID: <CAF6AEGuCRpkNN7GCcGf5LC=NpyLb8gFnqhy5QE3bYioFTRoh+g@mail.gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-fixes-2021-05-09 for v5.13-rc2
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 9, 2021 at 4:21 PM Rob Clark <robdclark@gmail.com> wrote:
>
> Hi Dave & Daniel,
>
> First round of fixes for v5.13
>
> The following changes since commit a29c8c0241654d5f3165d52e9307e4feff955621:
>
>   drm/msm/disp/dpu1: fix display underruns during modeset. (2021-04-09
> 12:02:35 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/msm.git

this should have been:

   https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-05-09

BR,
-R

>
> for you to fetch changes up to f2f46b878777e0d3f885c7ddad48f477b4dea247:
>
>   drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
> 16:26:57 -0700)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (2):
>       drm/msm/dsi: dsi_phy_28nm_8960: fix uninitialized variable access
>       drm/msm/dsi: fix msm_dsi_phy_get_clk_provider return code
>
> Jonathan Marek (2):
>       drm/msm: fix LLC not being enabled for mmu500 targets
>       drm/msm: fix minor version to indicate MSM_PARAM_SUSPENDS support
>
> Kuogee Hsieh (2):
>       drm/msm/dp: check sink_count before update is_connected status
>       drm/msm/dp: initialize audio_comp when audio starts
>
> Rob Clark (1):
>       drm/msm: Do not unpin/evict exported dma-buf's
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c           |  9 +++++----
>  drivers/gpu/drm/msm/dp/dp_audio.c               |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c             | 26 ++++++++++++++++---------
>  drivers/gpu/drm/msm/dp/dp_display.h             |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 ++++
>  drivers/gpu/drm/msm/msm_drv.c                   |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c                   | 16 ++++++++++++++-
>  drivers/gpu/drm/msm/msm_gem.h                   |  4 ++--
>  9 files changed, 47 insertions(+), 18 deletions(-)
