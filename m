Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1810F55B47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2019 00:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfFYWei (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 18:34:38 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34292 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfFYWei (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 18:34:38 -0400
Received: by mail-ed1-f66.google.com with SMTP id s49so257389edb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 15:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=rors4ls/pK8/T+LkC9Fioc+a8EuLyPV9FpcteMQ5s6c=;
        b=Vxodg2cR19PL6F+P9sZWIDItl/86cMtIojFLYIVrmXp79QBgYZAzkKgBLMkmq1SEtd
         z7whQv03ZVdSeKUnsbjGvDFeQCxDpV3jNLhTLbnXOpiepA2fbuFIwBIxXMT7bUo+CreW
         IZq9ZrmRzv05iCygnbkHprcWJgqsagD+7q1AF+CgqBc+0ptqlb8EEaTpr0R6vG1JyQCf
         4cgIC1qYbOWNoUxQVYrQTsWmhfozf/OFNHlozSFZ9x3HtC7dcE7t5yzHcYUF/9PTRz1+
         xgXzd5Ac2UAREj7C0/+IFHB3XOJxShVw5eH94M9gq/VVXiHYeAcDbGSiyMKKIUpCboWv
         GknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=rors4ls/pK8/T+LkC9Fioc+a8EuLyPV9FpcteMQ5s6c=;
        b=FRfgjw7kX+OT3pQ3lVnVuAP+zD5DFJNQUhcX4LxtOMGgVTPYoO2ipH4635sp9X1BvN
         gLn9W4FTypgnNRWzYEyFEFFKXsqS1yOppH9EIWtCfINuyQQotNF0EdaVbgxbpx7Pwxf8
         QSXDhkschHSuS4S1fEArn0lVyqGHiLCEB5jiCw1rnzZdotKuLdGohdIwDmDFOAePYGSm
         GXJFsUfXsxmw7OU+HMaxoSMC/fMyAW/Z7T8Gfxna54qyXpIZSCudhy0N98Lv5SwRVhd/
         Sd1dCPqXxa18wfd52kOcgopBRa2WyfZQ9dJCnCHtJzlLLMiG/CT9n1abzBheIUafyLCm
         A7Cw==
X-Gm-Message-State: APjAAAWx8jJ1Bqf+UrsGGSUr0p/salMBJ1JKGJcE21UUFDcf/pw3Pzmj
        sbGxrLeehvTPCgYAqls/zHS0TaehMt9xV9mlYRs=
X-Google-Smtp-Source: APXvYqz7DFFquhGTPAAEpqRlP32QN/KA8vHwwN3PLKeMxjdUC4jmtalOJtYqkECcK0hYsQB9s2PgPufGdslIq8f7fTM=
X-Received: by 2002:a17:906:2ada:: with SMTP id m26mr790184eje.265.1561502075218;
 Tue, 25 Jun 2019 15:34:35 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 25 Jun 2019 15:34:20 -0700
Message-ID: <CAF6AEGsj3N4XzDLSDoa+4RHZ9wXObYmhcep0M3LjnRg48BeLvg@mail.gmail.com>
Subject: [pull] drm/msm: msm-next for 5.3
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

This time around:

 + usual progress on cleanups
 + dsi vs EPROBE_DEFER fixes
 + msm8998 (snapdragon 835 support)
   + a540 gpu support (mesa support already landed)
   + dsi, dsi-phy support
 + mdp5 and dpu interconnect (bus/memory scaling) support
 + initial prep work for per-context pagetables (at least the parts that
   don't have external dependencies like iommu/arm-smmu)

There is one more patch for fixing DSI cmd mode panels (part of a set of
patches to get things working on nexus5), but it would be conflicty with
1cff7440a86e04a613665803b42034 in drm-next without rebasing or back-merge,
and since it doesn't conflict with anything in msm-next, I think it best
if Sean merges that through drm-mix-fixes instead.

(In other news, I've been making some progress w/ getting efifb working
properly on sdm850 laptop without horrible hacks, and drm/msm + clk stuff
not totally falling over when bootloader enables display and things are
already running when driver probes.. but not quite ready yet, hopefully
we can post some of that for 5.4.. should help for both the sdm835 and
sdm850 laptops.)

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2019-06-25

for you to fetch changes up to 648fdc3f6475d96de287a849a31d89e79ba7669c:

  drm/msm: add dirty framebuffer helper (2019-06-25 05:29:59 -0700)

----------------------------------------------------------------
Abhinav Kumar (2):
      drm/msm/dsi: add protection against NULL dsi device
      drm/msm/dpu: add icc voting in dpu_mdss_init

Brian Masney (2):
      drm/msm: correct attempted NULL pointer dereference in put_iova
      drm/msm: add dirty framebuffer helper

Georgi Djakov (1):
      drm/msm/mdp5: Use the interconnect API

Greg Kroah-Hartman (3):
      msm: adreno: no need to check return value of debugfs_create functions
      msm: dpu1: no need to check return value of debugfs_create functions
      msm: no need to check return value of debugfs_create functions

Jayant Shekhar (3):
      drm/msm/dpu: clean up references of DPU custom bus scaling
      drm/msm/dpu: Integrate interconnect API in MDSS
      dt-bindings: msm/disp: Introduce interconnect bindings for MDSS on SDM845

Jeffrey Hugo (6):
      drm/msm/mdp5: Fix mdp5_cfg_init error return
      dt-bindings: msm/dsi: Add 10nm phy for msm8998 compatible
      drm/msm/dsi: Add support for MSM8998 10nm dsi phy
      drm/msm/dsi: Add old timings quirk for 10nm phy
      drm/msm/dsi: Add support for MSM8998 DSI controller
      drm/msm/adreno: Add A540 support

Jordan Crouse (7):
      drm/msm/adreno: Enable 64 bit mode by default on a5xx and a6xx targets
      drm/msm: Print all 64 bits of the faulting IOMMU address
      drm/msm: Pass the MMU domain index in struct msm_file_private
      drm/msm/dpu: Fix error recovery after failing to enable clocks
      drm/msm/dpu: Avoid a null de-ref while recovering from kms init fail
      drm/msm/adreno: Call pm_runtime_force_suspend() during unbind
      drm/msm/adreno: Ensure that the zap shader region is big enough

Nathan Chancellor (1):
      drm/msm/dsi: Add parentheses to quirks check in
dsi_phy_hw_v3_0_lane_settings

Nathan Huckleberry (1):
      drm/msm/dpu: Fix Wunused-const-variable

Nicholas Mc Guire (1):
      drm/msm: check for equals 0 only

Rob Clark (1):
      drm/msm/a3xx: remove TPL1 regs from snapshot

Sean Paul (23):
      drm/msm/a6xx: Avoid freeing gmu resources multiple times
      drm/msm/a6xx: Remove duplicate irq disable from remove
      drm/msm/a6xx: Check for ERR or NULL before iounmap
      drm/msm/a6xx: Remove devm calls from gmu driver
      drm/msm/a6xx: Drop the device reference in gmu
      drm/msm/a6xx: Rename a6xx_gmu_probe to a6xx_gmu_init
      drm/msm/dpu: Use provided drm_minor to initialize debugfs
      drm/msm/dpu: Remove _dpu_debugfs_init
      drm/msm/dpu: Remove bogus comment
      drm/msm/dpu: Remove call to drm_mode_set_crtcinfo
      drm/msm/dpu: Avoid calling _dpu_kms_mmu_destroy() on init failure
      drm/msm/phy/dsi_phy: Set pll to NULL in case initialization fails
      drm/msm/dsi_pll_10nm: Release clk hw on destroy and failure
      drm/msm/dsi_pll_10nm: Remove impossible check
      drm/msm: Depopulate platform on probe failure
      drm/msm/dsi: Split mode_flags out of msm_dsi_host_get_panel()
      drm/msm/dsi: Don't store dsi host mode_flags in msm_dsi
      drm/msm/dsi: Pull out panel init code into function
      drm/msm/dsi: Simplify the logic in msm_dsi_manager_panel_init()
      drm/msm/dsi: Use the new setup_encoder function in attach_dsi_device
      drm/msm/dsi: Move dsi panel init into modeset init path
      drm/msm/dsi: Move setup_encoder to modeset_init
      drm/msm: Re-order uninit function to work during probe defer

 .../devicetree/bindings/display/msm/dpu.txt        |  10 ++
 .../devicetree/bindings/display/msm/dsi.txt        |   1 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |  24 ++-
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  28 ++--
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |   8 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  40 ++++-
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |  76 ++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  70 +++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  16 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  20 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      | 176 ++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 110 -------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c        |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  46 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |  57 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  22 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |   4 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  38 +++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   3 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |   2 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   7 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  21 +++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  19 +--
 drivers/gpu/drm/msm/dsi/dsi_manager.c              | 149 +++++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   6 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   5 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |  30 +++-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c         | 106 +++++++++----
 drivers/gpu/drm/msm/msm_drv.c                      |  34 +++-
 drivers/gpu/drm/msm/msm_drv.h                      |   1 +
 drivers/gpu/drm/msm/msm_fb.c                       |   2 +
 drivers/gpu/drm/msm/msm_gem.c                      |   6 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c               |  13 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   5 +-
 drivers/gpu/drm/msm/msm_iommu.c                    |   2 +-
 drivers/gpu/drm/msm/msm_perf.c                     |  15 +-
 drivers/gpu/drm/msm/msm_rd.c                       |  16 +-
 50 files changed, 715 insertions(+), 538 deletions(-)
