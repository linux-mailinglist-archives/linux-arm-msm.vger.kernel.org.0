Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C368C267BBE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Sep 2020 20:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgILSZB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 14:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgILSZA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 14:25:00 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15679C061573;
        Sat, 12 Sep 2020 11:25:00 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a17so14526313wrn.6;
        Sat, 12 Sep 2020 11:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tGJ7MqBZLv0eAFVjI5IdEGfiU4O8rQsPVnooROi6laU=;
        b=YvrlhxZRmzgDhT6xrPgh7jVcpAHPv91I8p1bnd/Ybyjw2xx04UgOiVehjFNGf/zdTZ
         gQ0jfYsMN1aXiFy8ncXY7biHgcFJxBNKTva0qEOsfvL8Wferx6Qwexf2brdyU7OrgxxH
         SiZLYXvlXgmh+qUr+YWjq534h/vUUMwKEHCEUHPq/9hTK1JhyxmgYaHANgJTCLbXPfpL
         gSmlSA70QICucG4alPltitONxnLqXhXtk9Ajv/rr3h7FQ9XCLRPnOUi9WnHE+hUqJ9ga
         E9TSVq4k18EzfRW0xnSjlX2NRWcAABlN7ZoNDh2QRMCS4aHx8sUBJ6NGm5VTSqb7bMrP
         ldvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tGJ7MqBZLv0eAFVjI5IdEGfiU4O8rQsPVnooROi6laU=;
        b=SQVjbebn+pxnGpimVW0XEs9qkV5VwsDFsRTB3y3XAj3pXAF012VgUtFWrRfIrMvnVV
         MqfYlw7em3tPj4m3k3ccRWf/4yypKGjktebHBl7fux9/HTKEyHTrLvvCNz24xW3VWI8G
         jL7ecgy4tR8wqMm0+1/sgYBeU94us+G5KrSNDN44MH+VScUAjCJ72idncKIXT9rIJQfN
         Wm6eszd9GYbW84yD5Eln9J3QvaeaboC1qr9JEWZtN4dsLwv5o08J/sFkYTVcQl50AQN5
         t+Oyzojr7wWm6euD01HnAo0Qmw4gi+P0kUgbpIa77FfXNZAKpub9/vurmSmC2h27IGOo
         jp1A==
X-Gm-Message-State: AOAM531AcE452+Iu7JeIEpfROjPVvzKyeCuQfM0tbEKUcOr+3qeyPUG6
        +Y2UganqX7tlmkBUXfEOddFxHTN/IAbsgljDFJc=
X-Google-Smtp-Source: ABdhPJxnDbMbdSz2hPUfBzuQYfyUTosQbk+FaVCIPdDlwDrvWHXaJSinnkB//3oqC3oIBn+8QNJvFjyBHY+WTCVuogU=
X-Received: by 2002:a5d:4a0c:: with SMTP id m12mr7873322wrq.83.1599935096172;
 Sat, 12 Sep 2020 11:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200827211658.27479-1-tanmay@codeaurora.org>
In-Reply-To: <20200827211658.27479-1-tanmay@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 12 Sep 2020 11:25:52 -0700
Message-ID: <CAF6AEGttutrtxntAeRDtb3Hf_0i4z+9+rWMuShTrPVwTUHKTdg@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Add support for DisplayPort driver on SnapDragon
To:     Tanmay Shah <tanmay@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, aravindh@codeaurora.org,
        Abhinav Kumar <abhinavk@codeaurora.org>, khsieh@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fyi, I've pushed this series and the dp-compliance bits to msm-next-dp[1]

I didn't include the dp audio series yet, which seems to need some
minor rebasing.  (And a small request, when resending, cc
freedreno@lists.freedesktop.org, so it shows up in the patchwork
instance[2] I use)

You might want to double check that I got the correct versions of the
series, etc.  And that nothing else (other than audio) is missing.

BR,
-R

[1] https://gitlab.freedesktop.org/drm/msm/-/commits/msm-next-dp
[2] https://patchwork.freedesktop.org/project/freedreno

On Thu, Aug 27, 2020 at 2:17 PM Tanmay Shah <tanmay@codeaurora.org> wrote:
>
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
> Changes in v12:
>
> -- Add support of pm ops in display port driver
> -- Clear bpp depth bits before writing to MISC register
> -- Fix edid read
>
> Previous change log:
> https://lkml.kernel.org/lkml/20200818051137.21478-1-tanmay@codeaurora.org/
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
>  drivers/gpu/drm/i915/display/intel_display.c  |    2 +-
>  drivers/gpu/drm/msm/Kconfig                   |    9 +
>  drivers/gpu/drm/msm/Makefile                  |   14 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   27 +-
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |    8 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   83 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c               |  535 ++++++
>  drivers/gpu/drm/msm/dp/dp_aux.h               |   30 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c           | 1045 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h           |  105 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c              | 1693 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h              |   35 +
>  drivers/gpu/drm/msm/dp/dp_display.c           | 1046 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h           |   31 +
>  drivers/gpu/drm/msm/dp/dp_drm.c               |  168 ++
>  drivers/gpu/drm/msm/dp/dp_drm.h               |   18 +
>  drivers/gpu/drm/msm/dp/dp_hpd.c               |   69 +
>  drivers/gpu/drm/msm/dp/dp_hpd.h               |   79 +
>  drivers/gpu/drm/msm/dp/dp_link.c              | 1214 ++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h              |  132 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c             |  486 +++++
>  drivers/gpu/drm/msm/dp/dp_panel.h             |   95 +
>  drivers/gpu/drm/msm/dp/dp_parser.c            |  267 +++
>  drivers/gpu/drm/msm/dp/dp_parser.h            |  138 ++
>  drivers/gpu/drm/msm/dp/dp_pll.c               |   99 +
>  drivers/gpu/drm/msm/dp/dp_pll.h               |   61 +
>  drivers/gpu/drm/msm/dp/dp_pll_10nm.c          |  930 +++++++++
>  drivers/gpu/drm/msm/dp/dp_pll_private.h       |   89 +
>  drivers/gpu/drm/msm/dp/dp_power.c             |  373 ++++
>  drivers/gpu/drm/msm/dp/dp_power.h             |  103 +
>  drivers/gpu/drm/msm/dp/dp_reg.h               |  518 +++++
>  drivers/gpu/drm/msm/msm_drv.c                 |    2 +
>  drivers/gpu/drm/msm/msm_drv.h                 |   59 +-
>  include/drm/drm_dp_helper.h                   |    1 +
>  34 files changed, 9545 insertions(+), 19 deletions(-)
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
> base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
