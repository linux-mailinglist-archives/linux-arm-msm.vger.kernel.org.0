Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9643D970B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 22:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbhG1Ush (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 16:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbhG1Usg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 16:48:36 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D73AC061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 13:48:33 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id k4so2267940wms.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 13:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=551JLf4qkCIkFNPA0Ob7V07KiCMSizDSmiG+dlVt4JM=;
        b=kfQE7nB8u8dzYzo+hiTJbRyWXFI/3gCqNjtJSQ10P4RMrxzqUeOlyYi7/ni7LLFaAu
         a4BGADbORUT7BIR0lnkbwosqRYGVv8kmQziHKuGxk7lRL6Zwcd0OggZXbJwKVI+8G4ai
         +Pu8lqF3Wdnw9FiJcN+4DKAM5R5jOzwydeRj7yY9az8gqus9GTZEARLlT9Cid3Qy1rO8
         eD/qdzFYnaIDgCazhCb7oy4xnjpmZPCzlm5ufSanRZEhp2FV/SEV5PiN74a3CsqZXZGa
         E2TkokZrDGDruLrx6Mrcgfdl0SzhqUwyQTbeAQTBVUtlFC7Aw1OOz4cMkDRx8s8EyYKK
         j4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=551JLf4qkCIkFNPA0Ob7V07KiCMSizDSmiG+dlVt4JM=;
        b=bCyfTKCdFRUNQZy7jae/6nBBmYDb7dz2IMo8wTG5AhbqteYxAAahdYMpa6JveW1WS+
         A2MbQ3XhSo8QSSr6xwbdEMaJkV2Yzx3peHO5kMdLI2k7/6G6TFw7KHx0HqzY9n8VvNdE
         uJkAd9IIHJPpnyJe8wCXI2n7/AtxJBzCP0aW1FpLp16Ko9ao/9CfvjEHNdQrbq1urpit
         gHVlUyKOjVkvctPUabrG7or0+KPb5jAtXogq6qBxnMfPnSsXyPbdQZacXMynftGQ0fls
         FckZi/5Dd6Pdxo92+ND2jH9IYQhZ5zoGJw3h858zXwWRiiBc+CgT0Oz/mHkfHhUo8w8n
         ceMA==
X-Gm-Message-State: AOAM532UbNTOTnL48kpGIs2vEn2BKT/avCegHN/PYoUL8ZOHHq5vg/Uz
        vJjn5DO+8Jw+2RxK+RNM2rYtthD7C3/o6JKikCM=
X-Google-Smtp-Source: ABdhPJwouLvhME8/x0uZtoF54DhLPEB9DXJ10yPUymnb4k09k+KAbp5Zsrws2GUQ7HnHVAkgkgXWRnBFA//zK0futiE=
X-Received: by 2002:a05:600c:19cb:: with SMTP id u11mr1356981wmq.175.1627505312189;
 Wed, 28 Jul 2021 13:48:32 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 28 Jul 2021 13:52:42 -0700
Message-ID: <CAF6AEGumRk7H88bqV=H9Fb1SM0zPBo5B7NsCU3jFFKBYxf5k+Q@mail.gmail.com>
Subject: [early pull] drm/msm: drm-msm-next-2021-07-28 for v5.15
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

An early pull for v5.15 (there'll be more coming in a week or two),
consisting of the drm/scheduler conversion and a couple other small
series that one was based one.  Mostly sending this now because IIUC
danvet wanted it in drm-next so he could rebase on it.  (Daniel, if
you disagree then speak up, and I'll instead include this in the main
pull request once that is ready.)

This also has a core patch to drop drm_gem_object_put_locked() now
that the last use of it is removed.

The following changes since commit ff1176468d368232b684f75e82563369208bc371:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-07-28

for you to fetch changes up to 4541e4f2225c30b0e9442be9eb2fb8b7086cdd1f:

  drm/msm/gem: Mark active before pinning (2021-07-28 09:19:00 -0700)

----------------------------------------------------------------
Rob Clark (18):
      drm/msm: Let fences read directly from memptrs
      drm/msm: Signal fences sooner
      drm/msm: Split out devfreq handling
      drm/msm: Split out get_freq() helper
      drm/msm: Devfreq tuning
      drm/msm: Docs and misc cleanup
      drm/msm: Small submitqueue creation cleanup
      drm/msm: drop drm_gem_object_put_locked()
      drm: Drop drm_gem_object_put_locked()
      drm/msm/submit: Simplify out-fence-fd handling
      drm/msm: Consolidate submit bo state
      drm/msm: Track "seqno" fences by idr
      drm/msm: Return ERR_PTR() from submit_create()
      drm/msm: Conversion to drm scheduler
      drm/msm: Drop submit bo_list
      drm/msm: Drop struct_mutex in submit path
      drm/msm: Utilize gpu scheduler priorities
      drm/msm/gem: Mark active before pinning

 drivers/gpu/drm/drm_gem.c                   |  22 --
 drivers/gpu/drm/msm/Kconfig                 |   1 +
 drivers/gpu/drm/msm/Makefile                |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
 drivers/gpu/drm/msm/msm_drv.c               |  30 ++-
 drivers/gpu/drm/msm/msm_fence.c             |  53 +----
 drivers/gpu/drm/msm/msm_fence.h             |  44 +++-
 drivers/gpu/drm/msm/msm_gem.c               |  94 +-------
 drivers/gpu/drm/msm/msm_gem.h               |  47 ++--
 drivers/gpu/drm/msm/msm_gem_submit.c        | 344 +++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_gpu.c               | 220 ++++--------------
 drivers/gpu/drm/msm/msm_gpu.h               | 139 ++++++++++-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 203 ++++++++++++++++
 drivers/gpu/drm/msm/msm_rd.c                |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c        |  69 +++++-
 drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
 drivers/gpu/drm/msm/msm_submitqueue.c       |  53 +++--
 include/drm/drm_gem.h                       |   2 -
 include/uapi/drm/msm_drm.h                  |  14 +-
 26 files changed, 865 insertions(+), 536 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c
