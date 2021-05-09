Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E12377931
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 01:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhEIXSj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 May 2021 19:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhEIXSj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 May 2021 19:18:39 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A411DC061573
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 May 2021 16:17:35 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so7821776wmh.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 May 2021 16:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ePciVVPEBMHi9XfKMWeqEPGTV/ZtJKjK01Vqdn8reZw=;
        b=n95Ng3tuJ4jJ044BYgsu1Kuwh1GV9Sw9uo///kvGaxWKPLOEEgrkpgYOUs7738QRh0
         sHL4/U/Ker7ltuW6goKvOL5sEXhFCudy803FrEHdw8dWiKrfmalwMeRTbjcq8tSML046
         /38J8MJzXBhfs5TBgdn+yMLWonViDHia/Yls/gLrpGWowDrKjU7HqF89GvwY8t5ZVV+W
         TipBUb9X7GCf2Sv58GSQ+lKekIXuu0OyPZAXrEzqN/g7fUW0PLd/pzQa3XAG+rhogBKs
         D0HNiyBWfXI/fg++1KpCVtGuhWM63PayBgN38S6I0uU6bJ3OHC2Pj9VHAJodDAQktCUS
         KNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ePciVVPEBMHi9XfKMWeqEPGTV/ZtJKjK01Vqdn8reZw=;
        b=dcDO50D6KDor0ECQnCTBZg6QJNVtaoIql4z84JXA2TvqqcoE8xEUieRh7RIlGiHphP
         q4G68IWTJzKr2xFGAa//BQjB7ku3FtmrFfBcxAo4lap8vvvdexv/ZL4NFAmPX0TPf407
         LLkAab0Q3EjhYCovmTV7usdIrvnVsfnM4feySMWAkIFygugQI2wxpFhVcHsXqz15hhTt
         t+n7oyvsG+bWab2mh6XUDgugqpw4zWwdYXQd/sWTij6V+FQcjQytWqjSOMdRyQJyXenz
         1CtbeyShs57yUXHb7qFPZHsaWf3RJfrK82USOUN3ho4ypQpAirc0Jih4vmd6R0uNNeSv
         x41w==
X-Gm-Message-State: AOAM533huhMv2GK8PFzAxBxUnTWdA8TgNv7PAS0oxfN7yITfgazS0Epn
        6lBsPn9PJ6vDReuOvmZvbt1nx1OdDdrqWEfJXvk=
X-Google-Smtp-Source: ABdhPJyowrQIMEmEuTa2jIzG7Bl2yCWb6/cU2OuM5B+6OrRhpVCUjezV1fRPp33YH/fBciOo9zuIuZjqs5ZHWZ+iOso=
X-Received: by 2002:a05:600c:249:: with SMTP id 9mr22929827wmj.175.1620602254362;
 Sun, 09 May 2021 16:17:34 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 9 May 2021 16:21:16 -0700
Message-ID: <CAF6AEGtmr-X=Cs8V0bJZMAuONcvn8-rfJGuMNXCO9Q39JYEaFQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-05-09 for v5.13-rc2
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

Hi Dave & Daniel,

First round of fixes for v5.13

The following changes since commit a29c8c0241654d5f3165d52e9307e4feff955621:

  drm/msm/disp/dpu1: fix display underruns during modeset. (2021-04-09
12:02:35 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git

for you to fetch changes up to f2f46b878777e0d3f885c7ddad48f477b4dea247:

  drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
16:26:57 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm/dsi: dsi_phy_28nm_8960: fix uninitialized variable access
      drm/msm/dsi: fix msm_dsi_phy_get_clk_provider return code

Jonathan Marek (2):
      drm/msm: fix LLC not being enabled for mmu500 targets
      drm/msm: fix minor version to indicate MSM_PARAM_SUSPENDS support

Kuogee Hsieh (2):
      drm/msm/dp: check sink_count before update is_connected status
      drm/msm/dp: initialize audio_comp when audio starts

Rob Clark (1):
      drm/msm: Do not unpin/evict exported dma-buf's

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c           |  9 +++++----
 drivers/gpu/drm/msm/dp/dp_audio.c               |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c             | 26 ++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_display.h             |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 ++++
 drivers/gpu/drm/msm/msm_drv.c                   |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                   | 16 ++++++++++++++-
 drivers/gpu/drm/msm/msm_gem.h                   |  4 ++--
 9 files changed, 47 insertions(+), 18 deletions(-)
