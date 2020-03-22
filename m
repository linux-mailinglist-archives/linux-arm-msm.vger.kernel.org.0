Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5F2418ED45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 00:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgCVX3Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Mar 2020 19:29:24 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:33963 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgCVX3X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Mar 2020 19:29:23 -0400
Received: by mail-ed1-f47.google.com with SMTP id i24so14343688eds.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2020 16:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=qtuq6N55/cW3iPYtxBvjA3AV9DJr5vFxSYYSJdykhog=;
        b=R+FpMqx6TClSexIsQhyh1Mlzdrv6hzYHm3cHEpbK1Wc+PjexHu/uHgQB1dVwGsbMaS
         180Xp/KIvwqTGtIWsRsn7QH4mRJrk3HrjHXrmupbzjSYsA74EF1bCYf91L3qUnRLxCVI
         1sB3H7oulW15Cyv1GMpZXZICQeCRFne69dFPScPmbiMBjjltY/4R1NCP+pcT0Rq3k/B1
         XL156ow/owmNPb8iJkZ6GtmZiAwClK2/AJDj/g8/6HrpUhWapWFtTWVKZWFeWihYpj87
         W3KXWslYm2Yv66bb1RtoGRbBjPGCsn3+sWhAnKi36WEW7aegPubIibrvqUl+YNitXwov
         8Uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=qtuq6N55/cW3iPYtxBvjA3AV9DJr5vFxSYYSJdykhog=;
        b=tibAGVplentIKk8szFWaCFS0RwmQrPmlSqizs57YzUUOdQcV71iWSnG5lBSHQJu113
         s9KMjAw4hNB6VSmqrExzdZtv2SWWnuMWXZWbRsXsouZFCJhLnZpmzD/qC7/nMes4cVpv
         rVfueFD8clq4LyQ3Iyhd2xsFxiE+HOv38390x3oX4udaBYC0TOBuF5XOFCtoyY2xQ1wW
         I58FPCF91yqmQRzknvSjvqppouY4Zs69E4qx+DewIbgiHPJ5u1xk0xbHvQB3jZTICb3h
         hwT9olP3dFEe0H1wNriAiWjRFrTkvwm+X2UNHaNunIa8LeeoLmwNuz52jxcQXlAXC+b0
         Oj5w==
X-Gm-Message-State: ANhLgQ1xYEFh+lixF69ggVcYBdV65Z/tKcYcGH8MiclF7PeXlQ4EBH14
        3NIoBBd7ZHVCLzuCMLvoj80wTXYwSinE1iV0jaw=
X-Google-Smtp-Source: ADFU+vvDNl9KF6aWmG1Nag+zo6K4mMMz/lowU/jb6RrY9/cFR5io+N8rAzuOKYPoirYOxdi09+q/IW2mxNQvpY6/SZY=
X-Received: by 2002:a50:a0c7:: with SMTP id 65mr19127482edo.7.1584919761847;
 Sun, 22 Mar 2020 16:29:21 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 22 Mar 2020 16:29:12 -0700
Message-ID: <CAF6AEGuf1R4Xz-t9Z7_cwx9jD=b4wUvvwfqA5cHR8fCSXSd5XQ@mail.gmail.com>
Subject: [pull] drm/msm: msm-next for 5.7
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

A bit smaller this time around.. there are still a couple uabi
additions for vulkan waiting in the wings, but I punted on them this
cycle due to running low on time.  (They should be easy enough to
rebase, and if it is a problem for anyone I can push a next+uabi
branch so that tu work can proceed.)

The bigger change is refactoring dpu resource manager and moving dpu
to use atomic global state.  Other than that, it is mostly cleanups
and fixes.

The following changes since commit fb33c6510d5595144d585aa194d377cf74d31911:

  Linux 5.6-rc6 (2020-03-15 15:01:23 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2020-03-22

for you to fetch changes up to a5fb8b918920c6f7706a8b5b8ea535a7f077a7f6:

  drm/msm/a6xx: Use the DMA API for GMU memory objects (2020-03-20
07:13:05 -0700)

----------------------------------------------------------------
Brian Masney (1):
      dt-bindings: display: msm: gmu: move sram property to gpu bindings

Drew Davenport (4):
      drm/msm/dpu: Remove unused function arguments
      drm/msm/dpu: Refactor rm iterator
      drm/msm/dpu: Refactor resource manager
      drm/msm/dpu: Track resources in global state

Gustavo A. R. Silva (1):
      drm/msm/msm_gem.h: Replace zero-length array with flexible-array member

Ilia Mirkin (1):
      drm/msm: avoid double-attaching hdmi/edp bridges

Jordan Crouse (3):
      drm/msm/a5xx: Always set an OPP supported hardware value
      dt-bindings: display: msm: Convert GMU bindings to YAML
      drm/msm/a6xx: Use the DMA API for GMU memory objects

Pavel Machek (1):
      drm/msm: fix leaks if initialization fails

Rob Clark (2):
      drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers
      drm/msm/a6xx: Fix CP_MEMPOOL state name

Takashi Iwai (1):
      drm/msm: Use scnprintf() for avoiding potential buffer overflow

Zheng Bin (4):
      drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder_phys_cmd.c
      drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder_phys_vid.c
      drm/msm/dpu: fix comparing pointer to 0 in dpu_vbif.c
      drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder.c

tongtiangen (1):
      drm/msm/dpu: Remove some set but not used variables

 .../devicetree/bindings/display/msm/gmu.txt        | 116 ----
 .../devicetree/bindings/display/msm/gmu.yaml       | 123 ++++
 .../devicetree/bindings/display/msm/gpu.txt        |  55 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  27 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 115 +---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 118 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  98 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  26 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 620 +++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  71 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |   6 +-
 drivers/gpu/drm/msm/edp/edp.c                      |   4 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |   4 -
 drivers/gpu/drm/msm/msm_drv.c                      |   6 +-
 drivers/gpu/drm/msm/msm_gem.h                      |  12 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  28 +-
 drivers/gpu/drm/msm/msm_rd.c                       |   8 +-
 24 files changed, 724 insertions(+), 751 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.yaml
