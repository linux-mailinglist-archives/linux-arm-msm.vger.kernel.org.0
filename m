Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0D727B88F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 01:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgI1X7K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 19:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbgI1X7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 19:59:10 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6814C0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 16:59:09 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id q13so12299026ejo.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 16:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9haHQ+9J/upCQ7uz6Ci9TYgCnmxgT+DGnIzlkBDvhfU=;
        b=Et87xip7uXgGxELz2s4chKp1O2DOq2Oq5HmqHztbnqclPenjnBojkPKLleX/fnoyMR
         CQOZS4mYoxbe2D+SK8Q8Q6CUN5OK7gEJLPWnhcVz4/Gw57KzpTDiRiOBuODbEphQKs68
         REnJ2SBHr1+s0OwF8pq6LqJRGaS0RA1NJ65gFSL0+NYywz4hJvB9XA1eMq4U7qRnZkMJ
         6JlhlxWAnHHNyalPMVjRGJUVUpN3mr/5Btie6mosQCkHLT72tvfAAqbA2XEnZXRhUyMl
         1PTuB+T4cSkVG3YWkySbND2ytcfdxn2bom7lnINoSJyEfCZAcGZOJkSeeAviaT3ZlJ26
         Rx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9haHQ+9J/upCQ7uz6Ci9TYgCnmxgT+DGnIzlkBDvhfU=;
        b=INveerd6Cpg/SWIFx8Xyp5Rmh7e48hIi/QNTIaKIPesr5RpuYiw4gGxfDvWziHmjGP
         rUX9vnzH0MtIoe7F2n6w6Ip/vahokXHEeXQLSrg6hxTSXecVwOTVJ07ZOaCFnxgiMyOn
         JHT0rgnClr0WPNPnwhFOHON2bd14aJskX8ZkAqoZBtjX7C3BBMMh2TeJaRdKqkuX+C2P
         wZUq5VElmX2fSzYUwdefgOy8TTm3KBJzr9NMQUqUNwg6nrnOESpNAD4/Yf8q7kO7dU9o
         d4FJ/Ebp50bXQqP2j2b7wlf2Wy6qPSlkA/6rmHtolJzzMc7YjJLpDo90Dmg6ZLT7rOh2
         Pq2g==
X-Gm-Message-State: AOAM532q6nJlmdNopNEzU2GAJYYo1EMeN1RBMsMsJafXL12f5l926olG
        5dfX0A3wCN9ZTj1Fw0FiFDmu87twAW+TdWoepzQ=
X-Google-Smtp-Source: ABdhPJw8jNUPXk20NxlVajJyDy7OtX2df7KDCeqQP0Vd/BAKQ4xONwUQQcwSSqWEE/rmRFqlabuzel9l8tKHeb25oBE=
X-Received: by 2002:a17:906:f92:: with SMTP id q18mr1153690ejj.237.1601337547843;
 Mon, 28 Sep 2020 16:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGvqjuzH=Po_9EzzFsp2Xq3tqJUTKfsA2g09XY7_+6Ypfw@mail.gmail.com>
In-Reply-To: <CAF6AEGvqjuzH=Po_9EzzFsp2Xq3tqJUTKfsA2g09XY7_+6Ypfw@mail.gmail.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Tue, 29 Sep 2020 09:58:55 +1000
Message-ID: <CAPM=9txR=wpG4xSmYPCXSWBsAX4nyJkom4xmMJMNAF0CxTqQOw@mail.gmail.com>
Subject: Re: [pull] drm/msm: msm-next for 5.10
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Assuming I merged it right,

32-bit builds adds warning
In file included from
/home/airlied/devel/kernel/dim/src/include/linux/bitops.h:5,
                 from
/home/airlied/devel/kernel/dim/src/include/linux/kernel.h:12,
                 from
/home/airlied/devel/kernel/dim/src/include/linux/ascii85.h:11,
                 from
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/msm/adreno/adreno_gpu.c:=
9:
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/msm/adreno/adreno_gpu.c:
In function =E2=80=98adreno_iommu_create_address_space=E2=80=99:
/home/airlied/devel/kernel/dim/src/include/linux/bits.h:36:11:
warning: right shift count is negative [-Wshift-count-negative]
   (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
           ^~
/home/airlied/devel/kernel/dim/src/include/linux/bits.h:38:31: note:
in expansion of macro =E2=80=98__GENMASK=E2=80=99
  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                               ^~~~~~~~~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/msm/adreno/adreno_gpu.c:=
212:11:
note: in expansion of macro =E2=80=98GENMASK=E2=80=99
   start & GENMASK(48, 0), size);
           ^~~~~~~

  CC [M]  drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.o
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.=
c:
In function =E2=80=98msm_dsi_pll_7nm_init=E2=80=99:
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.=
c:882:19:
warning: conversion from =E2=80=98long long unsigned int=E2=80=99 to =E2=80=
=98long unsigned
int=E2=80=99 changes value from =E2=80=985000000000=E2=80=99 to =E2=80=9870=
5032704=E2=80=99 [-Woverflow]
   pll->max_rate =3D 5000000000UL;
                   ^~~~~~~~~~~~
  LD [M]  drivers/gpu/drm/msm/msm.o

Dave.

On Mon, 28 Sep 2020 at 03:14, Rob Clark <robdclark@gmail.com> wrote:
>
> Hi Dave,
>
> A bit bigger this time around, with the addition of DP support
> which has been baking for a while now.  Overall:
>
> * DSI support for sm8150/sm8250
> * Support for per-process GPU pagetables (finally!) for a6xx.
>   There are still some iommu/arm-smmu changes required to
>   enable, without which it will fallback to the current single
>   pgtable state.  The first part (ie. what doesn't depend on
>   drm side patches) is queued up for v5.10[1].
> * DisplayPort support.  Userspace DP compliance tool support
>   is already merged in IGT[2]
> * The usual assortment of smaller fixes/cleanups
>
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=
=3Dfor-joerg/arm-smmu/updates
> [2] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/222051026b9=
78ebbc0dc58db62d7a1f29728f95f
>
> The following changes since commit f6828e0c4045f03f9cf2df6c2a768102641183=
f4:
>
>   drm/msm: Disable the RPTR shadow (2020-09-04 12:14:15 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2020-09-27
>
> for you to fetch changes up to d1ea914925856d397b0b3241428f20b945e31434:
>
>   drm/msm/dp: fix incorrect function prototype of dp_debug_get()
> (2020-09-25 20:31:06 -0700)
>
> ----------------------------------------------------------------
> Abhinav Kumar (10):
>       drm/msm/dp: store dp_display in the driver data
>       drm/msm/dp: add audio support for Display Port on MSM
>       drm/msm/dp: add hook_plugged_cb hdmi-codec op for MSM DP driver
>       drm/msm/dp: signal the hotplug disconnect in the event handler
>       drm/msm/dp: wait for audio notification before disabling clocks
>       drm/msm/dp: add debugfs support to DP driver
>       drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/
>       drm/msm/dp: add debugfs nodes for video pattern tests
>       drm/msm/dp: remove mode hard-coding in case of DP CTS
>       drm/msm/dp: fix incorrect function prototype of dp_debug_get()
>
> Akhil P Oommen (2):
>       drm/msm: Fix premature purging of BO
>       drm/msm: Leave inuse count intact on map failure
>
> Bernard Zhao (1):
>       drm/msm/adreno: remove return value of function XX_print
>
> Chandan Uddaraju (3):
>       drm: add constant N value in helper file
>       drm/msm/dp: add displayPort driver support
>       drm/msm/dp: add support for DP PLL driver
>
> Georgi Djakov (1):
>       drm/msm: Remove depends on interconnect
>
> Jeykumar Sankaran (1):
>       drm/msm/dpu: add display port support in DPU
>
> Jonathan Marek (3):
>       drm/msm/dsi: remove unused clk_pre/clk_post in msm_dsi_dphy_timing
>       drm/msm/dsi: add DSI config for sm8150 and sm8250
>       drm/msm/dsi: add support for 7nm DSI PHY/PLL
>
> Jordan Crouse (10):
>       drm/msm: Add a context pointer to the submitqueue
>       drm/msm: Drop context arg to gpu->submit()
>       drm/msm: Set the global virtual address range from the IOMMU domain
>       drm/msm: Add support to create a local pagetable
>       drm/msm: Add support for private address space instances
>       drm/msm/a6xx: Add support for per-instance pagetables
>       drm/msm: Allow a5xx to mark the RPTR shadow as privileged
>       drm/msm: a6xx: Use WHERE_AM_I for eligible targets
>       drm/msm: Get rid of the REG_ADRENO offsets
>       drm/msm: Fix the a650 hw_apriv check
>
> Kalyan Thota (1):
>       drm/msm/dpu: add support for clk and bw scaling for display
>
> Kuogee Hsieh (1):
>       drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets
>
> Luca Weiss (1):
>       drm/msm/adreno: fix probe without iommu
>
> Luo Jiaxing (1):
>       drm/msm/dpu: remove unused variables new_cnt and old_cnt in
> dpu_encoder_phys_vid_vblank_irq()
>
> Qinglang Miao (1):
>       drm/msm/dpu: Convert to DEFINE_SHOW_ATTRIBUTE
>
> Rob Clark (12):
>       drm/msm: drop cache sync hack
>       drm/msm/dpu: move vblank events to complete_commit()
>       drm/msm/dpu: clean up some impossibilities
>       drm/msm/gpu: Add GPU freq_change traces
>       drm/msm: Convert shrinker msgs to tracepoints
>       drm/msm/gpu: Add suspend/resume tracepoints
>       drm/msm: Remove dangling submitqueue references
>       drm/msm: Add private interface for adreno-smmu
>       drm/msm/gpu: Add dev_to_gpu() helper
>       drm/msm: Set adreno_smmu as gpu's drvdata
>       drm/msm: Show process names in gem_describe
>       drm/msm/dp: Fix crash if no DP device
>
> Robin Murphy (1):
>       drm/msm: Drop local dma_parms
>
> Sai Prakash Ranjan (2):
>       drm/msm/mdp4: Remove unused downstream bus scaling apis
>       drm/msm/mdp5: Remove unused downstream bus scaling apis
>
> Stephen Boyd (4):
>       drm/msm: Avoid div-by-zero in dpu_crtc_atomic_check()
>       drm/msm: Drop debug print in _dpu_crtc_setup_lm_bounds()
>       drm/msm/dp: Use qmp phy for DP PLL and PHY
>       drm/msm/dp: Sleep properly in dp_hpd_handler kthread
>
> Tanmay Shah (1):
>       drm/msm/dp: Add Display Port HPD feature
>
> Zhenzhong Duan (1):
>       drm/msm/a6xx: fix a potential overflow issue
>
>  .../devicetree/bindings/display/msm/dsi.txt        |    6 +-
>  drivers/gpu/drm/i915/display/intel_display.c       |    2 +-
>  drivers/gpu/drm/msm/Kconfig                        |   19 +-
>  drivers/gpu/drm/msm/Makefile                       |   18 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   65 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   77 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   82 +-
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |   21 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  120 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |   12 +
>  drivers/gpu/drm/msm/adreno/a5xx_power.c            |    2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |    5 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |    3 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  182 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   10 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    2 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c         |   12 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  105 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   82 +-
>  drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |    1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       |   15 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  109 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  132 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   55 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    5 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    4 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  145 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    4 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |    9 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   84 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |    4 +
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c   |   51 -
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   13 -
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |   47 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c   |   24 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c       |   68 -
>  drivers/gpu/drm/msm/dp/dp_audio.c                  |  638 +++++++
>  drivers/gpu/drm/msm/dp/dp_audio.h                  |   72 +
>  drivers/gpu/drm/msm/dp/dp_aux.c                    |  535 ++++++
>  drivers/gpu/drm/msm/dp/dp_aux.h                    |   30 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c                | 1019 +++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |  131 ++
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 1869 ++++++++++++++=
++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   36 +
>  drivers/gpu/drm/msm/dp/dp_debug.c                  |  485 +++++
>  drivers/gpu/drm/msm/dp/dp_debug.h                  |   74 +
>  drivers/gpu/drm/msm/dp/dp_display.c                | 1463 ++++++++++++++=
+
>  drivers/gpu/drm/msm/dp/dp_display.h                |   39 +
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |  164 ++
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |   18 +
>  drivers/gpu/drm/msm/dp/dp_hpd.c                    |   69 +
>  drivers/gpu/drm/msm/dp/dp_hpd.h                    |   80 +
>  drivers/gpu/drm/msm/dp/dp_link.c                   | 1210 +++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h                   |  155 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |  463 +++++
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |  100 ++
>  drivers/gpu/drm/msm/dp/dp_parser.c                 |  293 +++
>  drivers/gpu/drm/msm/dp/dp_parser.h                 |  136 ++
>  drivers/gpu/drm/msm/dp/dp_power.c                  |  372 ++++
>  drivers/gpu/drm/msm/dp/dp_power.h                  |  107 ++
>  drivers/gpu/drm/msm/dp/dp_reg.h                    |  306 ++++
>  drivers/gpu/drm/msm/dsi/dsi.h                      |    2 +
>  drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  423 +++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |    5 +-
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  102 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    6 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  255 +++
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll.c              |    4 +
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll.h              |   10 +
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c          |  904 ++++++++++
>  drivers/gpu/drm/msm/msm_drv.c                      |   28 +-
>  drivers/gpu/drm/msm/msm_drv.h                      |   97 +-
>  drivers/gpu/drm/msm/msm_gem.c                      |   75 +-
>  drivers/gpu/drm/msm/msm_gem.h                      |   10 +-
>  drivers/gpu/drm/msm/msm_gem_shrinker.c             |    5 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c               |    8 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c                  |   14 +-
>  drivers/gpu/drm/msm/msm_gpu.c                      |   56 +-
>  drivers/gpu/drm/msm/msm_gpu.h                      |   22 +-
>  drivers/gpu/drm/msm/msm_gpu_trace.h                |   83 +
>  drivers/gpu/drm/msm/msm_gpummu.c                   |    2 +-
>  drivers/gpu/drm/msm/msm_iommu.c                    |  206 ++-
>  drivers/gpu/drm/msm/msm_mmu.h                      |   16 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.h               |    1 +
>  drivers/gpu/drm/msm/msm_submitqueue.c              |    7 +-
>  include/drm/drm_dp_helper.h                        |    1 +
>  include/linux/adreno-smmu-priv.h                   |   36 +
>  89 files changed, 13076 insertions(+), 777 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h
>  create mode 100644 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>  create mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
>  create mode 100644 include/linux/adreno-smmu-priv.h
