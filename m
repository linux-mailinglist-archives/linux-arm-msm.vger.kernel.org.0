Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02644ABD49
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 18:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392354AbfIFQFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 12:05:44 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38860 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392208AbfIFQFn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 12:05:43 -0400
Received: by mail-ed1-f65.google.com with SMTP id a23so4524234edv.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=3vCEjzoT0b4CQZZzmkGyCOjlftc+50f5fZFjKinpnxY=;
        b=srAu5p3tLulLELKCyfei3EGd/3vZEZS5BXFSjItqQOUSSfg0D7AieNQAs/GTTwDPN3
         FelTPVxVPooI24xR90zXkAblBNAz1CFf+0Gxvpd098NhRBBB/yQ53BJp1bp5r4zBBD1S
         a/dxtJ5WjBPXPP36Hl1OGdMt69u0dDgzqAb7W1f6Kx1R5ppHBGneuXYBtS1oCD+kujRd
         GfEvsHZSIiBrE3N1F7LwqU27FMzkuHZaED866MvIq8APIWLclUzL5T8h22EmvCktMnlH
         ISwUaS10jXyrLiEGZZZNH/lVK3hD1Q23pJiAKrVS6fo4M1DHwLxpPu5eTV+mHhYxLbDn
         yPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=3vCEjzoT0b4CQZZzmkGyCOjlftc+50f5fZFjKinpnxY=;
        b=StZZ0ct9VyGRXXIRks2leqxKReAjpJCrd7NONWj/0QKnlKoB3MNOjwmmbxltdoKXat
         Yg18iWq786ddIH58W/oSjDIRIvA73PI/sUsY9BCUvuRLrgYX9LWKDRpGu5Te9OBYnCFV
         Tqnsi7GHxQoluDD3jtCfamF9lFW39RYXP5MeZ9eBdZiNQubBWrXq3uGASyyYmCAoev8l
         kHRNI7Zh0Gn7nme9iuT7zBegnE9rozmq2ZBkbuR4nJ9+SqA+9ajgLo+DexeQjVuowrCO
         Z9wRgn1ZlAfARE1/mDbrljt78aAwd34tj3krMAFZDKPtiEkeN9MH1bJDn1dl6WQUIKLU
         OPWg==
X-Gm-Message-State: APjAAAUc/CmdJV+Az52ypNAGwGxrYMST7H2E6xGPFYrFfTpE47JVXhOi
        ifjMAm3pIC5g4th7DCTI7oJqedDix/cxzD7xK/0=
X-Google-Smtp-Source: APXvYqyv8pa5auo/O641DU5NxMNixzDdeYSQ319Nf4T9M8ymAsJ+bJfh/vXVtLV8rghNyjdUQ4dx2ePon6GIFMXbJaM=
X-Received: by 2002:a05:6402:17ba:: with SMTP id j26mr10396365edy.272.1567785941509;
 Fri, 06 Sep 2019 09:05:41 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 6 Sep 2019 09:05:30 -0700
Message-ID: <CAF6AEGuKVayu9bCuVe1RhzS6N6sHTrv4SVAh=qyCrmubX24Xag@mail.gmail.com>
Subject: [pull] drm/msm: msm-next for 5.4
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

This time around:

 + move msm8998 (snapdragon 835) display support
 + dpu fixes/cleanup
 + better async commit support for cursor updates
   (for dpu for now, I'll add mdp5 and possibly
   mdp4 once the movers deliver boxes full of my
   older hardware, so for v5.5)

The following changes since commit c7eb7c12fddcba0bfb53e006baa9a7a10f26c5f0:

  Merge tag 'exynos-drm-next-for-v5.4' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next (2019-09-03 16:06:26 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2019-09-06

for you to fetch changes up to 9f614197c744002f9968e82c649fdf7fe778e1e7:

  drm/msm: Use the correct dma_sync calls harder (2019-09-04 10:05:05 -0700)

----------------------------------------------------------------
Brian Masney (1):
      drm/msm/phy/dsi_phy: silence -EPROBE_DEFER warnings

Denis Efremov (1):
      drm/msm: remove unlikely() from WARN_ON() conditions

Gustavo A. R. Silva (1):
      drm/msm: Use struct_size() helper

Jeffrey Hugo (3):
      drm/msm: Transition console to msm framebuffer
      drm/msm/mdp5: Add msm8998 support
      drm/msm/mdp5: Find correct node for creating gem address space

Jordan Crouse (2):
      drm/msm: Use generic bulk clock function
      drm/msm: Remove Kconfig default

Linus Walleij (4):
      drm/msm/mdp4: Drop unused GPIO include
      drm/msm/dsi: Drop unused GPIO includes
      drm/msm/dpu: Drop unused GPIO code
      drm/msm/hdmi: Convert to use GPIO descriptors

Rob Clark (18):
      drm/msm/dpu: remove dpu_mdss:hwversion
      drm/msm/a6xx: add missing MODULE_FIRMWARE()
      drm/msm/dpu: fix "frame done" timeouts
      drm/msm/dpu: remove stray "\n"
      drm/msm/dpu: add rotation property
      drm/msm/dpu: remove some impossible error checking
      drm/msm/dpu: remove unused arg
      drm/msm/dpu: unwind async commit handling
      drm/msm/dpu: add real wait_for_commit_done()
      drm/msm/dpu: handle_frame_done() from vblank irq
      drm/msm: add kms->wait_flush()
      drm/msm: convert kms->complete_commit() to crtc_mask
      drm/msm: add kms->flush_commit()
      drm/msm: split power control from prepare/complete_commit
      drm/msm: async commit support
      drm/msm/dpu: async commit support
      drm/msm: add atomic traces
      drm/msm: Use the correct dma_sync calls harder

Sam Ravnborg (1):
      drm/msm: drop use of drmP.h

Sean Paul (1):
      drm/msm/dsi: Fix return value check for clk_get_parent

 drivers/gpu/drm/msm/Kconfig                        |   2 +-
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  95 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  75 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  11 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   3 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  44 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   3 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c        |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h        |   9 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 112 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |  11 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   1 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c           |   1 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  51 +++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |   2 +
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |   2 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   2 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 132 +++++++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c           |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c           |   1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  60 ++++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   2 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   1 +
 drivers/gpu/drm/msm/disp/mdp_format.c              |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  18 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  12 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |   2 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h              |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  66 +++---
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   2 +
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c          |  43 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c           |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c           |   2 +
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c           |   2 +
 drivers/gpu/drm/msm/msm_atomic.c                   | 232 ++++++++++++++++++---
 drivers/gpu/drm/msm/msm_atomic_trace.h             | 110 ++++++++++
 drivers/gpu/drm/msm/msm_atomic_tracepoints.c       |   3 +
 drivers/gpu/drm/msm/msm_debugfs.c                  |   5 +
 drivers/gpu/drm/msm/msm_drv.c                      |  51 +----
 drivers/gpu/drm/msm/msm_drv.h                      |   6 +-
 drivers/gpu/drm/msm/msm_fb.c                       |   2 +
 drivers/gpu/drm/msm/msm_fbdev.c                    |   4 +
 drivers/gpu/drm/msm/msm_gem.c                      |   6 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |   6 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |   8 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h                |   2 +-
 drivers/gpu/drm/msm/msm_gpummu.c                   |   2 +
 drivers/gpu/drm/msm/msm_kms.h                      | 108 +++++++++-
 drivers/gpu/drm/msm/msm_perf.c                     |   3 +
 drivers/gpu/drm/msm/msm_rd.c                       |   7 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |   2 +
 66 files changed, 970 insertions(+), 451 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_atomic_trace.h
 create mode 100644 drivers/gpu/drm/msm/msm_atomic_tracepoints.c
