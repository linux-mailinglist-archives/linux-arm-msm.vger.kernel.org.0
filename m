Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB006381165
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 22:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhENUKO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 16:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhENUKO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 16:10:14 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E43C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 May 2021 13:09:01 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id o127so314702wmo.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 May 2021 13:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=9vee9zbKeJ08k4xe/XZutEWn1yTcRHSY9UUPRdL/HXQ=;
        b=gVYhbAwKpL+ipOCZsofpwGVTpgzbCcblvU3WaxpvrC2CMYY6UdIWABp8eoZaO5iN67
         l0DjlqBBn6qBKolaKOvBLfdlxqGqv5fw5Mm8LCjUZ0yQCcMCMcnIfWheVkcKqcM43rOU
         qOIyS1MOttsktudza5OEYdEmqF7ACmhT7C0bpUVpDd+TnKLVyPyYuxoEz16MdaYlYmxL
         tkP+9hYPxfrJynYZqwFbAke1nv5zoKgTvQY5cI3uNTmnvRAfOxmOzz003HaPMT5H1vUe
         ID1mjtkj7gD74zzbyCbf8PsH/V2Lk56d+jYMZUztQMJnM8UryNFcBdz8umAF4i+fhr39
         HNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=9vee9zbKeJ08k4xe/XZutEWn1yTcRHSY9UUPRdL/HXQ=;
        b=GXZxLS/fZWNQJTCcSSo8dR3/ra0YqD0DuAoV+7ldwIr0e0NZDC7roil0K2a+6LnJ6G
         yhtbjUfnHGVrlwXfIFJFTw+7xFmmgYkkUC4YW7CWV4oLmp9VfEyjBetLGByuEq6nhG0l
         bLkbFni2HfdvvGVIcf81e56czs1kVFGM905uBa2QU0TqC5/ygOcuwiB3MfcwZ49JegJq
         gzZIopwZywMYgkHHVOC7lSsRWLvbcHblQ3H/rvPdsYtAX16qv0NDICYRYaPxS4c1d5i0
         FdV/8ChZJ0mEQZMP4SlYA5S6B7Ay3xJWUCbfeWAhjHUNJcqjRkJ+5gC+DYCHJU0CAY1r
         Nb5g==
X-Gm-Message-State: AOAM531T/hz+w09BGl1NIbGzjHWNYZosQ0GA0yo/8CkxSNDZX82pjm+V
        2xX1JqbAEjQrDbuU/XuN7/zK7yB85JiTVssYNZA=
X-Google-Smtp-Source: ABdhPJx1lkTJm9rKHYxi7GjduJl398gAg9pDy7QhR05IuHloVqkBr+xdhtf226DwAeMSoQsJqqj/3zgJ733l7f3xrLI=
X-Received: by 2002:a7b:cd8e:: with SMTP id y14mr6087258wmj.164.1621022940229;
 Fri, 14 May 2021 13:09:00 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 14 May 2021 13:12:42 -0700
Message-ID: <CAF6AEGuqLZDAEJwUFKb6m+h3kyxgjDEKa3DPA1fHA69vxbXH=g@mail.gmail.com>
Subject: [resend][pull] drm/msm: drm-msm-fixes-2021-05-09 for v5.13-rc2
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

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-05-09

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
