Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196CC2508A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Aug 2020 21:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgHXTCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 15:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbgHXTCV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 15:02:21 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3246C061573
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2020 12:02:20 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id y3so10026230wrl.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2020 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ixdaZBEf/bJWyqGfEyqLlCaukcoJXcmOC8zF6EigEiQ=;
        b=b92lgvNrxkMBO2nUp2LnX+1F0/5KZF+ViqMB5ECk2oj13w3XqbcypIfcJLLyp2jLg+
         Z60RfOmE77SnLGRAxUrRkUrcjJsJNn0wykgrju4NGWzPEv4kLAW6RNGoG0cE5y4kAGns
         L7zo/JD9/Cb2a/khaqB4L4Xmr4BmthPv+iUnX/J+y4Z1BQxwb+XxcYzwqxKO+n1WXoJO
         s9COolYeh7elE8E8MqVZmTe6taea2VMf/+Wy2lQ52VaOAOfj3Icp27Y4O/z4PNN2HS18
         CcSGo0A4zofnVyjWDxdHkdEHlYZBs0skLGE4DshyegNFGPdvHPTud/ucRJNrfO+LLkQB
         LGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ixdaZBEf/bJWyqGfEyqLlCaukcoJXcmOC8zF6EigEiQ=;
        b=b0Pii+QDh34N1BAlwAq2GN+KlfMXpN6ieUPoPW2uCFfjrx/OQ/mSGek4zeHs1uwXh2
         4rYFJ2wd6Yk8pXoorqvWzee+zUc+yrJehkPQt3DMn3iDD4uj5xy4WkjRP37s6YZ/JJ1l
         jqMVrFYtcYaBzNGjQWOyrELFeVRGsqs8vqJRHloPz2ThwmM3uUAeWrv08wqDlE9aLkJ7
         3Gx8FiBn2p0y+ytSpS1abu34gz+JztAzj9Fu1W+DRtI49tjwG7SJzUavJr3l9UcIsA1t
         RfzABI65PcMWNvnGzizFxZUjyyQHGtHQMVcVIavGhcgxq99PH5N6XBEs+Zh7XSnD/Bb2
         JJKg==
X-Gm-Message-State: AOAM531sOygatINYDf98Bu9sMlT9xWb+vo32oFzda3fExYQvg1kZvrkm
        n8dwMwsl70M4I6j0jF1jn07V9gLGpAdKvDfLoD4=
X-Google-Smtp-Source: ABdhPJxb7xgiv95iPUd8pl9/NHIiGN0yDxgN7uSKxdrP5bbjwtzZNBdQ02evVOM9lrbm73E/Ij0tP8RgxGTTGXfwZSA=
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr6668363wrq.327.1598295738854;
 Mon, 24 Aug 2020 12:02:18 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 24 Aug 2020 12:03:06 -0700
Message-ID: <CAF6AEGt45A4ObyhEdC5Ga4f4cAf-NBSVRECu7df3Gh6-X4G3tQ@mail.gmail.com>
Subject: [pull] drm/msm: msm-fixes-v5.9
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

Some fixes for v5.9 plus the one opp/bandwidth scaling patch ("drm:
msm: a6xx: use dev_pm_opp_set_bw to scale DDR") which was not included
in the initial pull due to dependency on patch landing thru OPP tree


The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2020-08-24

for you to fetch changes up to 5e0c22d4a9ddae4e784a3e171b9d3d452b37aeb2:

  drm/msm/a6xx: fix frequency not always being restored on GMU resume
(2020-08-22 10:56:45 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      drm/msm/a6xx: fix gmu start on newer firmware

Jonathan Marek (1):
      drm/msm/a6xx: fix frequency not always being restored on GMU resume

Kalyan Thota (2):
      drm/msm/dpu: Fix reservation failures in modeset
      drm/msm/dpu: Fix scale params in plane validation

Krishna Manikandan (1):
      drm/msm: add shutdown support for display platform_driver

Rob Clark (6):
      drm/msm/dpu: fix unitialized variable error
      drm/msm/adreno: fix updating ring fence
      drm/msm/gpu: make ringbuffer readonly
      drm/msm: enable vblank during atomic commits
      drm/msm/a6xx: fix crashdec section name typo
      drm/msm/a6xx: add module param to enable debugbus snapshot

Sharat Masetty (1):
      drm: msm: a6xx: use dev_pm_opp_set_bw to scale DDR

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 38 ++++++++++++++++++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  3 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |  4 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +--
 drivers/gpu/drm/msm/msm_atomic.c            | 36 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c               |  8 ++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c        |  3 ++-
 12 files changed, 99 insertions(+), 25 deletions(-)
