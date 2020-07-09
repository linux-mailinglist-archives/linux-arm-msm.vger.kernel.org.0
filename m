Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9167F21A8D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 22:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgGIUVO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 16:21:14 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:37852 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGIUVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 16:21:14 -0400
Received: by mail-il1-f195.google.com with SMTP id r12so3168679ilh.4;
        Thu, 09 Jul 2020 13:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BXV0V180AwknZfYHAyynQHFPg5VSPY6NPqQkLAdi+aE=;
        b=lCCGOfaswqoizlYJiopwTXp7ru/LF+b8QP/cuIUI2jXLgVTX6U/PFGImoLLNeA1NiZ
         WYzt8wS3sOue2A17K7ToCJmoax8mBy4Uv2KVsBep1r9WZzaVSHyNRR2LZnPeTu68CHCX
         NumsI8VnWyogTAo+h7IbzZR9PLEZsRRVL5Mg/0iaKan+2LZbZu4lDeiIDOBnzu3GV2OJ
         gw61UF7XRDCQJKZMkN424TKq3EWnbxLpPRPA5H5Vw2es+fMQYADFQznrMf4jSnfBCj3m
         fedoTDwCkFxfLtwgjGmhc9wpA4xpBZW4cio5GEeo/FEAVOi49kFjQboy0y+WtUm42Soa
         ZMqw==
X-Gm-Message-State: AOAM530qMvI3s/C3qWlQ5Y5k0a1mOU4S5F3Zn3CNHj1PQaGuVHGGYwXk
        lUKzYZ4CcT8IxGq1LPnvRtXMEK0Avg==
X-Google-Smtp-Source: ABdhPJzj0SDEbPupGqiB9hIaGhSnelTDm9e5oRui4Oma4dLqO3MR6mXAz8yIYZFIyfll+QXWCzlXMA==
X-Received: by 2002:a92:9e5c:: with SMTP id q89mr49608036ili.265.1594326072689;
        Thu, 09 Jul 2020 13:21:12 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id t21sm2720449ioc.0.2020.07.09.13.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:21:12 -0700 (PDT)
Received: (nullmailer pid 823788 invoked by uid 1000);
        Thu, 09 Jul 2020 20:21:10 -0000
Date:   Thu, 9 Jul 2020 14:21:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tanmay Shah <tanmay@codeaurora.org>
Cc:     swboyd@chromium.org, sam@ravnborg.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        seanpaul@chromium.org, robdclark@gmail.com, daniel@ffwll.ch,
        airlied@linux.ie, aravindh@codeaurora.org, abhinavk@codeaurora.org,
        chandanu@codeaurora.org, varar@codeaurora.org
Subject: Re: [PATCH v8 0/6] Add support for DisplayPort driver on SnapDragon
Message-ID: <20200709202110.GA814782@bogus>
References: <20200630184507.15589-1-tanmay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630184507.15589-1-tanmay@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 30, 2020 at 11:45:01AM -0700, Tanmay Shah wrote:
> These patches add Display-Port driver on SnapDragon/msm hardware.
> This series also contains device-tree bindings for msm DP driver.
> It also contains Makefile and Kconfig changes to compile msm DP driver.
> 
> The block diagram of DP driver is shown below:
> 
> 
>                  +-------------+
>                  |DRM FRAMEWORK|
>                  +------+------+
>                         |
>                    +----v----+
>                    | DP DRM  |
>                    +----+----+
>                         |
>                    +----v----+
>      +------------+|   DP    +----------++------+
>      +        +---+| DISPLAY |+---+      |      |
>      |        +    +-+-----+-+    |      |      |
>      |        |      |     |      |      |      |
>      |        |      |     |      |      |      |
>      |        |      |     |      |      |      |
>      v        v      v     v      v      v      v
>  +------+ +------+ +---+ +----+ +----+ +---+ +-----+
>  |  DP  | |  DP  | |DP | | DP | | DP | |DP | | DP  |
>  |PARSER| | HPD  | |AUX| |LINK| |CTRL| |PHY| |POWER|
>  +--+---+ +---+--+ +---+ +----+ +--+-+ +-+-+ +-----+
>     |                              |     |
>  +--v---+                         +v-----v+
>  |DEVICE|                         |  DP   |
>  | TREE |                         |CATALOG|
>  +------+                         +---+---+
>                                       |
>                                   +---v----+
>                                   |CTRL/PHY|
>                                   |   HW   |
>                                   +--------+
> 
> Changes in v7:
> 
> - Modify cover letter description and fix title.
> - Introduce dp-controller.yaml for common bindings across SOC
> - Rename dp-sc7180.yaml to dp-controller-sc7180.yaml for SC7180 bindings
> - Rename compatible string to qcom,sc7180-dp
> - Add assigned-clocks and assigned-clock-parents properties in bindings
> - Remove redundant code from driver
> - Extend series to include HPD detection logic
> 
> Changes in v8:
> 
> - Add MDSS AHB clock in bindings 
> - Replace mode->vrefresh use with drm_mode_vrefresh API
> - Remove redundant aux config code from parser and aux module
> - Assign default max lanes if data-lanes property is not available
> - Fix use-after-free during DP driver remove
> - Unregister hardware clocks during driver cleanup
> 
> This series depends-on:
> 	https://patchwork.freedesktop.org/patch/366159/

If a single patch is a dependency, please coordinate your work and send 
as 1 series.

To put it another way, I'm just going to ignore this series until the 
dependency is sorted out.
 
> 	https://patchwork.freedesktop.org/patch/369859/

Probably the same goes for this too, but I care less as it's not the 
binding...

> 
> Chandan Uddaraju (4):
>   dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
>   drm: add constant N value in helper file
>   drm/msm/dp: add displayPort driver support
>   drm/msm/dp: add support for DP PLL driver
> 
> Jeykumar Sankaran (1):
>   drm/msm/dpu: add display port support in DPU
> 
> Tanmay Shah (1):
>   drm/msm/dp: Add Display Port HPD feature
> 
>  .../display/msm/dp-controller-sc7180.yaml     |  144 ++
>  .../bindings/display/msm/dp-controller.yaml   |   61 +
>  .../bindings/display/msm/dpu-sc7180.yaml      |   11 +
>  drivers/gpu/drm/i915/display/intel_display.c  |    2 +-
>  drivers/gpu/drm/msm/Kconfig                   |   16 +
>  drivers/gpu/drm/msm/Makefile                  |   14 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   29 +-
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |    8 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   83 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c               |  510 +++++
>  drivers/gpu/drm/msm/dp/dp_aux.h               |   29 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c           | 1060 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h           |  104 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c              | 1707 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h              |   35 +
>  drivers/gpu/drm/msm/dp/dp_display.c           | 1017 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h           |   31 +
>  drivers/gpu/drm/msm/dp/dp_drm.c               |  168 ++
>  drivers/gpu/drm/msm/dp/dp_drm.h               |   18 +
>  drivers/gpu/drm/msm/dp/dp_hpd.c               |   69 +
>  drivers/gpu/drm/msm/dp/dp_hpd.h               |   79 +
>  drivers/gpu/drm/msm/dp/dp_link.c              | 1216 ++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h              |  132 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c             |  490 +++++
>  drivers/gpu/drm/msm/dp/dp_panel.h             |   95 +
>  drivers/gpu/drm/msm/dp/dp_parser.c            |  267 +++
>  drivers/gpu/drm/msm/dp/dp_parser.h            |  138 ++
>  drivers/gpu/drm/msm/dp/dp_pll.c               |   99 +
>  drivers/gpu/drm/msm/dp/dp_pll.h               |   61 +
>  drivers/gpu/drm/msm/dp/dp_pll_10nm.c          |  917 +++++++++
>  drivers/gpu/drm/msm/dp/dp_pll_private.h       |  111 ++
>  drivers/gpu/drm/msm/dp/dp_power.c             |  392 ++++
>  drivers/gpu/drm/msm/dp/dp_power.h             |  103 +
>  drivers/gpu/drm/msm/dp/dp_reg.h               |  517 +++++
>  drivers/gpu/drm/msm/msm_drv.c                 |    2 +
>  drivers/gpu/drm/msm/msm_drv.h                 |   59 +-
>  include/drm/drm_dp_helper.h                   |    1 +
>  37 files changed, 9776 insertions(+), 19 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp-controller-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp-controller.yaml
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
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_pll.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_pll.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_pll_10nm.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_pll_private.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h
> 
> 
> base-commit: 0a19b068acc47d05212f03e494381926dc0381e2
> prerequisite-patch-id: 8058026a54241aa728a91dd1685419afb249959e
> prerequisite-patch-id: ed730eb83f84501579332a0f0ab98f7ef649e868
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
