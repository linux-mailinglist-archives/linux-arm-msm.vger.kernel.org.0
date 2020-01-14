Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 538A513B0C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 18:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgANRYg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 12:24:36 -0500
Received: from mail-ed1-f54.google.com ([209.85.208.54]:44240 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgANRYg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 12:24:36 -0500
Received: by mail-ed1-f54.google.com with SMTP id bx28so12606383edb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2020 09:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ExWR3NxwjvVwqdpV466QGOKUKw0k3X+0mcFDLohXg1g=;
        b=GMungYyV7wOTX1rYqMyxszAJKBxfaDFoowd6jBU3qd/SoXVT2gyWi88vNMzreXqEzI
         MykGKkTiCMGxkgixQvVfu0jjVG2khsgWPdCqOeQ8JoFHCI096cGsaey6fTPlGQZNDHee
         6BUjJ4P7vsBl7iRBMF2jpsZ8aUvOc7zGntT7uZIuj75ZgpXsn1bjX4vFcYiwbl/VYTMY
         KaY6q21UaeeEvhlINawtnk53OJ3M2A55tDw4S4mWZR/zXCOHPxw7+uQBIfd1bbrElOvC
         PR9KlYzDyPGfNFgcjU5ukrqZwrrl1M8S6+3ll2H5HdQe8qcjIB/ytkSwuKzOrY6lq+gW
         jDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ExWR3NxwjvVwqdpV466QGOKUKw0k3X+0mcFDLohXg1g=;
        b=lmJqRX7SkK+E1GtPt2JibyvdnGanmLaa7+TYK6BRhKEuV4JK/LouS/NiX4eppjHssa
         nrrnfoAKb1KNANMTEtDV940BYKWH/UwY6zopcA2QaXfSaPnRqBNA4kGF3bA7q1T0mImp
         tmNdNUXImquoM+jsP89ZZMn/09V9XkIO+eN8A/OLkjbYVzN7HWgmBO5z3bC/ktkVbYRv
         LGJDUFOvM4mzAhrd55rdO99saqS6Gj55hCxekBYYTBbl/o86bzmQflv3Fm14OQE1YB3w
         r54bPNW5sVNRkmLiCvBBFt2rEWvZdqhIQoLDcCkX5gpQPvXQx+qMne0TXAN4syu91e8A
         HnVg==
X-Gm-Message-State: APjAAAX9TdlxbH8r6IWGevG4EH3Iq+sIMJV0YkC0WAqebR7UDuZ2NpjW
        ijGHyRxC6RLHlGRQMgDd9NMkikFiaKfnVq5YWk0RgwdQgUo=
X-Google-Smtp-Source: APXvYqzWO7+ibk8CIEBmxcVycKOPJOCItIZZ64QfuIQW7YFq6IxmUN7OAtlmZ5SyRx0MBNOpfEQcSQLGHwm58dG9EdE=
X-Received: by 2002:a50:ce56:: with SMTP id k22mr25259991edj.34.1579022673862;
 Tue, 14 Jan 2020 09:24:33 -0800 (PST)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 14 Jan 2020 09:24:22 -0800
Message-ID: <CAF6AEGvv03ifuP0tp7-dmqZtr1iS=s8Vc=az8BNGtEoSMD-dkw@mail.gmail.com>
Subject: [pull] drm/msm: msm-next for 5.6
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

+ sc7180 display + DSI support
+ a618 (sc7180) support
+ more UBWC (bandwidth compression) support
+ various cleanups to handle devices that use vs don't
  use zap fw, etc
+ usual random cleanups and fixes


The following changes since commit fd6988496e79a6a4bdb514a4655d2920209eb85d:

  Linux 5.5-rc4 (2019-12-29 15:29:16 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2020-01-14

for you to fetch changes up to 5f9935f514d66ddba868e587d9e976a567232547:

  drm/msm: Fix error about comments within a comment block (2020-01-13
16:06:00 -0800)

----------------------------------------------------------------
Brian Masney (4):
      dt-bindings: drm/msm/gpu: document second interconnect
      drm/msm/gpu: add support for ocmem interconnect path
      drm/msm/a3xx: set interconnect bandwidth vote
      drm/msm/a4xx: set interconnect bandwidth vote

Douglas Anderson (1):
      drm/msm: Fix error about comments within a comment block

Drew Davenport (6):
      drm/msm/dpu: Remove unnecessary NULL checks
      drm/msm/dpu: Remove unnecessary NULL checks
      drm/msm/dpu: Remove unnecessary NULL checks
      drm/msm/dpu: Remove unnecessary NULL check
      drm/msm/dpu: Remove unreachable code
      drm/msm/dpu: Remove unnecessary NULL checks

Fabio Estevam (1):
      drm/msm/adreno: Do not print error on "qcom, gpu-pwrlevels" absence

Fritz Koenig (2):
      drm/msm/dpu: Add UBWC support for RGB8888 formats
      drm/msm/dpu: Allow UBWC on NV12

Harigovindan P (2):
      drm/msm: add DSI support for sc7180
      drm/msm: update LANE_CTRL register value from default value

John Stultz (1):
      drm: msm: Quiet down plane errors in atomic_check

Kalyan Thota (4):
      dt-bindings: msm:disp: add sc7180 DPU variant
      msm:disp:dpu1: add support for display for SC7180 target
      msm:disp:dpu1: setup display datapath for SC7180 target
      msm:disp:dpu1: add mixer selection for display topology

Nathan Chancellor (1):
      drm: msm: mdp4: Adjust indentation in mdp4_dsi_encoder_enable

Rob Clark (7):
      drm/msm/dpu: ignore NULL clocks
      drm/msm/a6xx: restore previous freq on resume
      drm/msm/adreno: fix zap vs no-zap handling
      drm/msm/dsi: split clk rate setting and enable
      drm/msm: support firmware-name for zap fw (v2)
      drm/msm: allow zapfw to not be specified in gpulist
      dt-bindings: drm/msm/gpu: Document firmware-name

Sharat Masetty (3):
      drm: msm: Add 618 gpu to the adreno gpu list
      drm: msm: a6xx: Add support for A618
      drm: msm: a6xx: Dump GBIF registers, debugbus in gpu state

Shubhashree Dhar (3):
      msm: disp: dpu1: add support to access hw irqs regs depending on revision
      msm:disp:dpu1: add scaler support on SC7180 display
      msm:disp:dpu1: Fix core clk rate in display driver

Stephan Gerhold (1):
      drm/msm/dsi: Delay drm_panel_enable() until dsi_mgr_bridge_enable()

Stephen Boyd (1):
      drm/msm/dpu: Mark various data tables as const

Wambui Karuga (1):
      drm/msm: use BUG_ON macro for debugging.

zhengbin (4):
      drm/msm/hdmi: Remove unneeded semicolon
      drm/msm/mdp5: Remove unneeded semicolon
      drm/msm/dpu: Remove unneeded semicolon in dpu_plane.c
      drm/msm/dpu: Remove unneeded semicolon in dpu_encoder.c

 .../devicetree/bindings/display/msm/dpu.txt        |   4 +-
 .../devicetree/bindings/display/msm/gpu.txt        |   9 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   8 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   8 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  11 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |  52 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  32 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  81 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   9 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  52 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  16 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  11 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  66 ++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 186 +++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  73 ++-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  73 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  18 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 241 ++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  38 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h  |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  92 +++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  26 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  36 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c        |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  34 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c   |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |   2 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  24 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  46 ++--
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  62 ++++--
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c          |   2 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   4 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   7 +
 50 files changed, 1049 insertions(+), 428 deletions(-)
