Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 600173A2FF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 17:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhFJQAY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 12:00:24 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:42501 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhFJQAY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 12:00:24 -0400
Received: by mail-wr1-f54.google.com with SMTP id c5so2894847wrq.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 08:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=0XQj9iBk0d0enFecyQCfBbt7C3fYu8DOKP1wgHfow9A=;
        b=Kbhknve1t+m6hcTJfurnuq0cJBOeysTUuX2xuUlY0dk/mlIu9FA68r3mBcLcVasNCr
         A4Z6vIzkzq98Ghaj1VIiFTrBku8l6msw92HdG2e4giYKr0+bAgcDa9yySvRg3rupy5qW
         Ns5wwFcmIgnSCa22P4to062Y2Wy+cChHeIZ6SafetcwzJChlhSKF48/iubE3kYPcY/8N
         UWougPG7uzwvF7bmOyMQ6Sc8T1NbY5VLqfpsiGLG81YPCU5F35RPwLjN71u4bYyT3Twa
         6E7yr57ErTishfB0NRGZTotoZ6IQOcEZN66Uj+PmYEyOeJesCNIdo+fjcdGFIkzf8vmP
         lfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=0XQj9iBk0d0enFecyQCfBbt7C3fYu8DOKP1wgHfow9A=;
        b=fLO+zxHAgOgo5bhXZOqFgu7syGifYqHD78AYqsT3YN3SkQWOi2YKjrtx3wDuE23DFG
         aQZJCtboNKhHc91+wvLAYQ1dsey4XZJUjtyhPg5hrnr9oO18YOg0RZVIktJmco0q23MP
         vA2RuyS4fpEpgAtmT0Y6aeHNt1NVSCGsyBc7DEPsBUo7clcl1hobVEeHWuK6ZtFIv2u8
         WFfMZ5zzjxlldn9+W+nEmtf8gltpF0rlkAK086N2rPIDKKPfKYdFTu/x8x4U079jzAk2
         +2xJs+NCoCyvzU0zcbA8F2uCIM7ek8DYFaPccbXubk0hD2Auc2JPwadofPHSYl6YiUP4
         j5fQ==
X-Gm-Message-State: AOAM5330Qd4PxJHdrGkwYsJZQxf43NUIDwyjk1LwGJtWzzJBqxwhUpw0
        iS2WgaCROmwYCohQBEQX8txRBRIHK+OvcsxfWBU=
X-Google-Smtp-Source: ABdhPJxlnpakzn0rO/KvwhuyfvuvJzb6Mq+7HJi6kkLlkKplfRNpwa2l6lIRLvC7ciiJv2Vy+S+FqQk4pY45FyjVERo=
X-Received: by 2002:adf:f552:: with SMTP id j18mr6569688wrp.28.1623340636636;
 Thu, 10 Jun 2021 08:57:16 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 10 Jun 2021 09:01:11 -0700
Message-ID: <CAF6AEGvbcz0=QxGYnX9u7cD1SCvFSx20dzrZuOccjtRRBTJd5Q@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-06-10 for v5.13-rc6
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

Hi Dave & Daniel,

A few late fixes for v5.13.  This supersedes the previous fixes pull
and adds a fix for a DSI issue which was preventing display from
coming up on coachz.

The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:

  drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
16:26:57 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-06-10

for you to fetch changes up to 170b763597d3a0a79f135e4d83a38462c3964fdf:

  drm/msm/dsi: Stash away calculated vco frequency on recalc
(2021-06-10 07:57:48 -0700)

----------------------------------------------------------------
Alexey Minnekhanov (1):
      drm/msm: Init mm_list before accessing it for use_vram path

Jonathan Marek (3):
      drm/msm/a6xx: update/fix CP_PROTECT initialization
      drm/msm/a6xx: fix incorrectly set uavflagprd_inv field for A650
      drm/msm/a6xx: avoid shadow NULL reference in failure path

Stephen Boyd (1):
      drm/msm/dsi: Stash away calculated vco frequency on recalc

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 155 +++++++++++++++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  |   1 +
 drivers/gpu/drm/msm/msm_gem.c              |   7 ++
 5 files changed, 124 insertions(+), 42 deletions(-)
