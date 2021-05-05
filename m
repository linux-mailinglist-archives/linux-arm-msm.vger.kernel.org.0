Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1436B373844
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 12:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbhEEKDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 06:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbhEEKDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 06:03:19 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757C1C061763
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 03:01:37 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id i67so921620qkc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m5HtWmAnig6lw4RtHlzbQQmHRo3yOMqpgy7bbvUw2Fc=;
        b=JniwsF2H3MzPZR21KHPne2QKpqm3PVEUXKzmCmnkH7RlYzmTZq/6/RHJBZNbOtMn/9
         vMN47dV1ItkRww5AhS3qakC0YRKHj3jMfAeGsM3MmGU7lM/CPbHpR2qkV9OlGAS48eIq
         z+B/zbykJn3on8cqFqO54/okzAmUQgW/4UlM1FCJThqgZ303ftdEUZZPLpfs2Yfc33ua
         Kf/BVZz51zGRZU8MqvpIAc+KopwOpm8DzLi55iCBaEsCz1xAo5nv+KGkynbWMIXPmrww
         tg14uieIucJf7Rj2PNw7qgJKtR7OIDYr8cAllmA5f5H2hyvIhvPWxXhQ/CDplX2oyPnh
         SWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m5HtWmAnig6lw4RtHlzbQQmHRo3yOMqpgy7bbvUw2Fc=;
        b=P/Q4JGcx8SvIMMMYNX0LRmiZHoffTBX9LRlvD6FHsk4yXcjIz2PVdc8eb/P1vqBlTe
         4IZliRrhBmQAAB+0ICUalc8ikaYOfNMAtkQmcPundDS8vzqnbQdEvNqpDl+XT62+CPUH
         nOdkT9CvhO6zYH/pyd99Q64aY2PwsbNAJt2RiHDtVBKEjScCu0SlBnoL8VJnzyzsscd4
         lPEAATPZ2yYEB6pOkDr+3GjnYgy8Cl+CpWh/q1aBB3paS1Xd49e35gtFeC7u5o/1rYQE
         jtryHaGTUd+n+IaOdg1gZVGfQsOSQ3f+7zd1Si4nb8+0hLPynKzzOPow3x3fCI0XD07C
         zmcw==
X-Gm-Message-State: AOAM532agTxYtGlAqOj+XE/b/HW/PgoXvOqKf+qEbHV+C7aWV5rQYFVI
        AXN1tX9399E/XKefc12meMEQ2dlUOVoo8cNJIA9/eA==
X-Google-Smtp-Source: ABdhPJzvlSeiw16CrlySSngkvytIk52sMnf7quC/lBLqjW87Oju0lcBCJeZcUbsFMc/Zx3Q5B4XRt+ZghNjIBeYr9g4=
X-Received: by 2002:a37:5945:: with SMTP id n66mr29120690qkb.138.1620208896828;
 Wed, 05 May 2021 03:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
In-Reply-To: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 5 May 2021 13:01:25 +0300
Message-ID: <CAA8EJpqZXHNvBySL0Vm-CmsrAh8Z85SoQHn97TqWLYeFW-Q=UA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add support for next gen eDP driver on SnapDragon
To:     Sankeerth Billakanti <sbillaka@codeaurora.org>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        khsieh@codeaurora.org, Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, 5 May 2021 at 11:17, Sankeerth Billakanti
<sbillaka@codeaurora.org> wrote:
>
> These patches add support for the next generation eDP driver on SnapDragon
> with dpu support. The existing eDP driver cannot support the new eDP
> hardware. So, to maintain backward compatibility, the older eDP driver is
> moved to v200 folder and the new generation eDP driver is added in
> the v510 folder.

What exactly does this version correspond to?
I assume that v510 corresponds to sdmshrike/sc8180x. Is it right?
Is it really so specific, or just v2/v5 would be enough? Not to
mention that this is the MDP/ version, while other blocks tend to use
block-specific versions/ids.

Also, how much does it differ from the current DP core supported via
drivers/gpu/drm/msm/dp ?

First two patches did not make it to the linux-msm, so I can not
comment on each of the lines.
However just my few cents (other reviewers might disagree though):

- I see little benefit in renaming the folders just for the sake of
renaming. You can put your code in drivers/gpu/drm/msm/edp-v510, if
you really insist on that. Note that for all other (even incompatible)
hardware types we still use single level of folders.

- Also I see that significant parts of code (e.g. AUX, bridge,
connector, maybe more) are just c&p of old edp code pieces. Please
share the code instead of duplicating it.

- Please consider updating register definitions in xml form and then
providing both changed xml files (to mesa project (?)) and generated
headers into the kernel.

- Please consider using clk_bulk_* functions instead of using
dss_module_power. I'm going to send a patchset reworking current users
to use the generic clk_bulk_* function family.

- In generic, this eDP clock handling seems to match closely DP clocks
handling (with all the name comparison, etc). Consider moving this to
a generic piece of code

- PHY seems to be a version of QMP PHY. Please use it, like it was
done for the DP itself. There is support for combined USB+DP PHYs
(both v3 and v4), so it should be possible to extend that for eDP.


> These are baseline changes with which we can enable display. The new eDP
> controller can also support additional features such as backlight control,
> PSR etc. which will be enabled in subsequent patch series.
>
> Summary of changes:
> DPU driver interface to the new eDP v510 display driver.
> New generation eDP controller and phy driver implementation.
> A common interface to choose enable the required eDP driver.
>
> Sankeerth Billakanti (3):
>   drm/msm/edp: support multiple generations of edp hardware
>   drm/msm/edp: add support for next gen edp
>   drm/msm/disp/dpu1: add support for edp encoder
>
>  drivers/gpu/drm/msm/Makefile                      |   19 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |    7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |   33 +
>  drivers/gpu/drm/msm/edp/edp.c                     |  198 ---
>  drivers/gpu/drm/msm/edp/edp.h                     |   78 -
>  drivers/gpu/drm/msm/edp/edp.xml.h                 |  380 -----
>  drivers/gpu/drm/msm/edp/edp_aux.c                 |  264 ----
>  drivers/gpu/drm/msm/edp/edp_bridge.c              |  111 --
>  drivers/gpu/drm/msm/edp/edp_common.c              |   38 +
>  drivers/gpu/drm/msm/edp/edp_common.h              |   47 +
>  drivers/gpu/drm/msm/edp/edp_connector.c           |  132 --
>  drivers/gpu/drm/msm/edp/edp_ctrl.c                | 1375 ------------------
>  drivers/gpu/drm/msm/edp/edp_phy.c                 |   98 --
>  drivers/gpu/drm/msm/edp/v200/edp.xml.h            |  380 +++++
>  drivers/gpu/drm/msm/edp/v200/edp_v200.c           |  210 +++
>  drivers/gpu/drm/msm/edp/v200/edp_v200.h           |   70 +
>  drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c       |  264 ++++
>  drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c    |  111 ++
>  drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c |  132 ++
>  drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c      | 1375 ++++++++++++++++++
>  drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c       |   98 ++
>  drivers/gpu/drm/msm/edp/v510/edp_v510.c           |  220 +++
>  drivers/gpu/drm/msm/edp/v510/edp_v510.h           |  151 ++
>  drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c       |  268 ++++
>  drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c    |  111 ++
>  drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c |  117 ++
>  drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c      | 1583 +++++++++++++++++++++
>  drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c       |  641 +++++++++
>  drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h       |  339 +++++
>  29 files changed, 6207 insertions(+), 2643 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_aux.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_bridge.c
>  create mode 100644 drivers/gpu/drm/msm/edp/edp_common.c
>  create mode 100644 drivers/gpu/drm/msm/edp/edp_common.h
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_connector.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_phy.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp.xml.h
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.h
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.h
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c
>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h
>
> --
> The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
>


--
With best wishes
Dmitry
