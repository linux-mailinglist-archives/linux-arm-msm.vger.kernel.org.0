Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBE7F10ED34
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 17:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfLBQdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 11:33:39 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37788 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbfLBQdj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 11:33:39 -0500
Received: by mail-ed1-f65.google.com with SMTP id cy15so25169007edb.4;
        Mon, 02 Dec 2019 08:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1KS+KvP47Q77DeKQ1RVvNxBt1950xGdbFy7LMtxP+Aw=;
        b=UO3xDAmAH1XWqiwB/udhJbvusRdvCthj0syulr7aAQ9shvoFZj+QF0S6mE/E1/c1mC
         G59/LzJorUkR5l6wVPyiFMRzzPBi4GpArlZyVMnGsHRVOjbrql5Vmd2cwtAK5waPDi8B
         wubPQEexU5NaP71SQJ/g9AuM90RStnOTBqV07e0eUr2s7R7ayupXujlXvxxJgpgv2S6S
         EA+ssZp3QrG/8heZXl3xk9I8UkqDAPLlbS76NKVDhZdeM0DGEHK9g1TTM0swFNx7HU2o
         cVxCzvM9p23MZ7/3YTkV2oByyk+gH6w4a3KvQ3TOBFnS2V3I6Y+1M0ZOUEriq10oaCYi
         gb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1KS+KvP47Q77DeKQ1RVvNxBt1950xGdbFy7LMtxP+Aw=;
        b=o7QXrHSNaoUWHD58Oni4skXkZDPN755oBL/y+vHnYTYY69f+QKD6XNR9jLyOWNzRls
         DS+2Ww6rLJb2ZM+MdXxDrQnJKccASB+SePkXulVuI4tKbCCnnZCEu51PDrFfuWuL791Y
         rAZ/ioccuan5fX+6rOvgXWQ5v70H8DO1rdbjNbMfMyZuUtuY2DhKYO+N9z/cFXfcA4HX
         bcN6LA9X6jZljdkvOQNIb6GI6zTagtn1+pjMd564t3FF4JxzEdIDbK90ZIUZthjXgqOz
         bS2oSzsvNZ8IFSvQOfiJG8cMgFyWj0AT8e8sdVMN47f1PTp6rNCCCs4KgHE04cvSRg/Q
         8znA==
X-Gm-Message-State: APjAAAW93XJFj0PPaxrGsEekGQK5DeKI26/7e9L+PJRGDuh278hPn8+D
        93qJ7qD7dXWQrFGEzcOTqsJ8QZGM2QumTSrfwPQ=
X-Google-Smtp-Source: APXvYqz7p+C0cGcHdy2+FJsusoCvcajzuDThRB0zyZgqumw6QTXSqEddCuf6o4nQaNNvlpZg5WFcGLUmV9eh/ndFx7Y=
X-Received: by 2002:aa7:da03:: with SMTP id r3mr2985746eds.163.1575304416597;
 Mon, 02 Dec 2019 08:33:36 -0800 (PST)
MIME-Version: 1.0
References: <0101016ec6ddc66f-2ff363f0-0a58-4196-ba95-8875dc837f45-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ec6ddc66f-2ff363f0-0a58-4196-ba95-8875dc837f45-000000@us-west-2.amazonses.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 2 Dec 2019 08:33:25 -0800
Message-ID: <CAF6AEGs-jB9toTp6JTNqczsTXCLqmUwi=VJcQhT9gEiH1o=48A@mail.gmail.com>
Subject: Re: [DPU PATCH v3 0/5] List of patches for DP drivers on SnapDragon
To:     Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>, nganji@codeaurora.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 2, 2019 at 5:47 AM Chandan Uddaraju <chandanu@codeaurora.org> wrote:
>
> These patches are to enable DisplayPort driver on SanpDragon.
>
> These patches have dependency on clock driver changes that
> provide DP clock support.

This looks like just a functional/runtime dependency?  Ie. it would
only be the corresponding dt nodes that have compile time dependency
on the clock driver?  (vidcc, I assume?)

BR,
-R

>
> Changes in V2:
>   Core Dp driver:
>      -- Update copyright markings on all relevant files.
>      -- Change pr_err() to DRM_ERROR()
>      -- Use APIs directly instead of function pointers.
>      -- Use drm_display_mode structure to store link parameters in the driver.
>      -- Use macros for register definitions instead of hardcoded values in dp_catalog.c file.
>      -- Replace writel_relaxed/readl_relaxed with writel/readl and remove memory barriers.
>      -- Remove unnecessary NULL checks.
>      -- Use drm helper functions for dpcd read/write.
>      -- Use DRM_DEBUG_DP for debug msgs.
>   DP PLL driver:
>      -- Update copyright markings on all relevant files.
>      -- Use DRM_DEBUG_DP for debug msgs.
>
> Changes in V3:
>   Core Dp Driver:
>     -- Removed changes in dpu_io_util.[ch]
>     -- Added locking around "is_connected" flag and removed atomic_set()
>     -- Removed the argument validation checks in all the static functions
>        except initialization functions and few API calls across msm/dp files
>     -- Removed hardcoded values for register reads/writes
>     -- Removed vreg related generic structures.
>     -- Added return values where ever necessary.
>     -- Updated dp_ctrl_on function.
>     -- Calling the ctrl specific catalog functions directly instead of
>        function pointers.
>     -- Added seperate change that adds standard value in drm_dp_helper file.
>     -- Added separate change in this list that is used to initialize
>        displayport in DPU driver.
>     -- Added change to use drm_dp_get_adjust_request_voltage() function.
>
>
> Chandan Uddaraju (4):
>   dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
>     845
>   drm: add constant N value in helper file
>   drm/msm/dp: add displayPort driver support
>   drm/msm/dp: add support for DP PLL driver
>
> Jeykumar Sankaran (1):
>   drm/msm/dpu: add display port support in DPU
>
>  .../devicetree/bindings/display/msm/dp.txt         |  249 +++
>  .../devicetree/bindings/display/msm/dpu.txt        |   16 +-
>  drivers/gpu/drm/i915/display/intel_display.c       |    2 +-
>  drivers/gpu/drm/msm/Kconfig                        |   22 +
>  drivers/gpu/drm/msm/Makefile                       |   17 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   28 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   65 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c                    |  548 +++++++
>  drivers/gpu/drm/msm/dp/dp_aux.h                    |   37 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c                |  841 +++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |   84 ++
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 1590 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   34 +
>  drivers/gpu/drm/msm/dp/dp_display.c                |  997 ++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h                |   32 +
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |  173 +++
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |   20 +
>  drivers/gpu/drm/msm/dp/dp_extcon.c                 |  216 +++
>  drivers/gpu/drm/msm/dp/dp_extcon.h                 |   84 ++
>  drivers/gpu/drm/msm/dp/dp_link.c                   | 1185 +++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h                   |  132 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |  450 ++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |   92 ++
>  drivers/gpu/drm/msm/dp/dp_parser.c                 |  496 ++++++
>  drivers/gpu/drm/msm/dp/dp_parser.h                 |  226 +++
>  drivers/gpu/drm/msm/dp/dp_power.c                  |  558 +++++++
>  drivers/gpu/drm/msm/dp/dp_power.h                  |   51 +
>  drivers/gpu/drm/msm/dp/dp_reg.h                    |  488 ++++++
>  drivers/gpu/drm/msm/dp/pll/dp_pll.c                |  135 ++
>  drivers/gpu/drm/msm/dp/pll/dp_pll.h                |   57 +
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c           |  401 +++++
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h           |   86 ++
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c      |  494 ++++++
>  drivers/gpu/drm/msm/msm_drv.c                      |    2 +
>  drivers/gpu/drm/msm/msm_drv.h                      |   42 +
>  include/drm/drm_dp_helper.h                        |    1 +
>  36 files changed, 9931 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp.txt
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_extcon.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_extcon.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.c
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
