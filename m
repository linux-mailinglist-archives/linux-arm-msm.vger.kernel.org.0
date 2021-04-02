Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2E9352DAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 18:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbhDBQZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 12:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbhDBQZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 12:25:23 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC9DC0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 09:25:18 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 12so2729368wmf.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=A6UBEPWH4Pqrp2yST70F67kTWsb725VGtDiuWhpkKMw=;
        b=keH4UX76ym1k1mU0mAqLHL5lniAYVj7KiwGNCrIZvZTpexqtCX9yTpiJ6Vsq++zCSK
         P4iWzfEpHvAMSGJZ83ONXLCDrd8kiFJ6YNM3YmtQBWtRn7ZYQ0u8Ia+fx9iZSnKNplfM
         Q0RNbk75OHcRoLn+fIOjymjP3BA/f53A5FMdNSdjDuLShBf4bXG4RFY0qMHhWmU+G9Kl
         U46Lolp3xKVPFMG00ylJ4Dkah8fq3DNdRZRCOfD93ywCsolGi/YOcggdEsTb7luG9aqT
         uaPDMnlUU5y7dXps7XTlHkYkdkNVQ6PdMGs4D7ASP8dU2Pnl/M32sCDZGmmblne37z4j
         eoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=A6UBEPWH4Pqrp2yST70F67kTWsb725VGtDiuWhpkKMw=;
        b=ci4SxxtOXdbU2qk46Uyh8o6FCwbddY4qq9BKhGCan7MJXUv0z+AaUZTVirQ/6YzJBw
         tr+r5/OYnGvFdx7j0mPbp89r06TB4n9wf0xbW2kPiulxG6PSunGRG10dv7NPpj/hJDTY
         v9AgBOYUm6coBkLsLu9NyvzIOZwnpAVO1mjeWh33Vtpx3p60DKkpIJ0KXBCOwE822eEG
         Q7TS3fL+A63z+kOVB2b/OMVR3wsoRa0VjnXx9eoHKlXZKWUMqGHNUlsauRfwKxnyuc9T
         QmWo3ZaDpN8ITSIJtkLiER0t3YFxZKSHwLbShYMUxvD6N/pA0sMrfqiGIYJHvOwdtxL7
         XIAQ==
X-Gm-Message-State: AOAM532hmVMmualFznhJq5CiFJh+TzZrJLmEC+EJ2s9oLlPRUmgyzc3a
        KQyxNdlEBMRBXkCdPzrTXdPUbF9ngGZ/jnfYR4Q=
X-Google-Smtp-Source: ABdhPJykiFcugV/Elu5oRMaSCU6UPriPtZJa6ZQZm88VODiQYXJOAjvy5GOxJP1dAfIM/3htKwFDSc43vb3sCN2fRxc=
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr13590583wmc.164.1617380715718;
 Fri, 02 Apr 2021 09:25:15 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 2 Apr 2021 09:28:42 -0700
Message-ID: <CAF6AEGsMj7Nv3vVaVWMxPy8Y=Z_SnZmVKhKgKDxDYTr9rGN_+w@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-04-02 for v5.12-rc6
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

A couple more small fixes for v5.12

The following changes since commit 627dc55c273dab308303a5217bd3e767d7083ddb:

  drm/msm/disp/dpu1: icc path needs to be set before dpu runtime
resume (2021-03-22 18:52:34 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-04-02

for you to fetch changes up to 12aca1ce9ee33af3751aec5e55a5900747cbdd4b:

  drm/msm/disp/dpu1: program 3d_merge only if block is attached
(2021-04-02 08:23:41 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      drm/msm: a6xx: fix version check for the A650 SQE microcode

John Stultz (1):
      drm/msm: Fix removal of valid error case when checking speed_bin

Kalyan Thota (1):
      drm/msm/disp/dpu1: program 3d_merge only if block is attached

Rob Clark (1):
      drm/msm: Fix a5xx/a6xx timestamps

Stephen Boyd (1):
      drm/msm: Set drvdata to NULL when msm_drm_init() fails

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 18 ++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c |  4 +++-
 drivers/gpu/drm/msm/msm_drv.c              |  1 +
 4 files changed, 18 insertions(+), 9 deletions(-)
