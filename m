Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2714375610
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 16:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbhEFPAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 11:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234998AbhEFPAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 11:00:01 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D16C061763;
        Thu,  6 May 2021 07:59:01 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id t18so5959883wry.1;
        Thu, 06 May 2021 07:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wSaLk+32rg3CosnVXZ3OFxSENaLJTNngSz/pQjentm0=;
        b=TDr/SK3adts8KqCRdXrOAuWhBFL2R0DRjqvyA1UXn2afPwkKFKbIoOjE9wllfdJtKG
         NE9qIFoX/VmsIh4QfVXO1MjaaEdSUPjxI4lqpbFnOVMqI6+1JU12rn/HS4ZyeNLWc1xD
         8NoM4r42X0rc9PuDo119m9NzVTe06CH+LvAhOpKYtiNoF5GNuqR7AosrsWBdSBqFaHp1
         yTE9hO8Ph2lVMYV9Wzu7MajexgTWz1/uQO3nb2EnK/u75Ng+VmYtT5aUDnvaTIvCoXi1
         ycrr2DMY+vyS7LwopS8itYc+kMwDeKNDkXXiIdda1Ku3QwjCnpNmxHHzzGpua/GIHaZN
         yOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wSaLk+32rg3CosnVXZ3OFxSENaLJTNngSz/pQjentm0=;
        b=DMcu9CXs5627E7gEBgXgpfmhRZKYJtBg9q8WT56owL4oFsxbnyMlO73QsPMKxbE5wh
         4O2IjeqHgpnzBitotlh3RaBK0euX7Qh0zT4sfJ2lCTUmLcXy63RKzia4gCZlifVXR2xt
         7EJDu47eTm/cFr9v3cuPh/aE3sxuoYkwROrAD+VwfhTkbuKHdd3dqk6hDIt4IBoyxUpC
         4/qniR2CQp6C9ehI0wQijfJSGz4vFpPnNib9KZYiNFX3S87m25FUtEDjWFWuBZEl0YK5
         dLJvxaeg1629NCrjTLQjW7L4P4xmVUCtvzxJ8zrm1wOFjAyV/LxmOARUXBjYa+jaXOcL
         M5dQ==
X-Gm-Message-State: AOAM533emG54BL14a8s7faYD5IlWiD2r11v6Bj0TQ0x7GXl7KAYDViLK
        KzHu8xZt2bhYkg8zOPeb09WGXo3yGUhf1V4b0yI=
X-Google-Smtp-Source: ABdhPJwQrt+vT+wa/yTsTjUhpz9zeklgME/58JJrvDTVgBW4lARE/MStRnDfNwwlO1tLx3fEFuiv8qZqLUW1xIY42pk=
X-Received: by 2002:adf:f74d:: with SMTP id z13mr5762382wrp.147.1620313140138;
 Thu, 06 May 2021 07:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
 <CAA8EJpqZXHNvBySL0Vm-CmsrAh8Z85SoQHn97TqWLYeFW-Q=UA@mail.gmail.com> <3398f9a1f985ccd6bb6a44646f7bea24@codeaurora.org>
In-Reply-To: <3398f9a1f985ccd6bb6a44646f7bea24@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 6 May 2021 08:02:40 -0700
Message-ID: <CAF6AEGuPpihBj9GQbuPKXuZvY=+Bid-pSB9XPP2ZXNQvHEm-Ag@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add support for next gen eDP driver on SnapDragon
To:     sbillaka@codeaurora.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 5, 2021 at 11:47 PM <sbillaka@codeaurora.org> wrote:
>
> On 2021-05-05 15:31, Dmitry Baryshkov wrote:
> > Hi,
> >
> > On Wed, 5 May 2021 at 11:17, Sankeerth Billakanti
> > <sbillaka@codeaurora.org> wrote:
> >>
> >> These patches add support for the next generation eDP driver on
> >> SnapDragon
> >> with dpu support. The existing eDP driver cannot support the new eDP
> >> hardware. So, to maintain backward compatibility, the older eDP driver
> >> is
> >> moved to v200 folder and the new generation eDP driver is added in
> >> the v510 folder.
> >
> > What exactly does this version correspond to?
> > I assume that v510 corresponds to sdmshrike/sc8180x. Is it right?
> [Sankeerth] This is for sc7280.
>
> > Is it really so specific, or just v2/v5 would be enough? Not to
> > mention that this is the MDP/ version, while other blocks tend to use
> > block-specific versions/ids.
> [Sankeerth] I can rename it as edp-v1 and edp-v2. Edp v1 is very old
> chip and there is considerable HW delta between v1 and v2. So, we want
> to separate the driver. We followed similar model for DPU driver where,
> MDP4, MDP5 and DPU have separate folders. EDP v1 belongs to MDP4
> generation.

Bjorn brought up the idea of just dropping the existing drm/msm/edp..
since the efforts to upstream the platform it worked on (8084?)
fizzled out, I don't think there is any device which uses it.

But it does sound like edp is a subset of the the newer dp driver, so
seems sort of like the better approach would be to add edp support to
dp.  I believe Bjorn has something based on this approach which is
working for sc8280 (although not sure if it is in shape to post
patches yet)

BR,
-R

> >
> > Also, how much does it differ from the current DP core supported via
> > drivers/gpu/drm/msm/dp ?
> [Sankeerth] eDP is a native controller like DP but does not have audio,
> content protection and interoperability requirement. Upstream already
> supports eDP as a new interface driver found here:
> drivers/gpu/drm/msm/edp.
> I wanted to add the new controller driver as part of that folder.
>
> >
> > First two patches did not make it to the linux-msm, so I can not
> > comment on each of the lines.
> [Sankeerth] I am also not sure why they did not make it to patchwork. I
> will repost them.
>
> > However just my few cents (other reviewers might disagree though):
> >
> > - I see little benefit in renaming the folders just for the sake of
> > renaming. You can put your code in drivers/gpu/drm/msm/edp-v510, if
> > you really insist on that. Note that for all other (even incompatible)
> > hardware types we still use single level of folders.
> >
> > - Also I see that significant parts of code (e.g. AUX, bridge,
> > connector, maybe more) are just c&p of old edp code pieces. Please
> > share the code instead of duplicating it.
> [Sankeerth] It is a baseline driver. As we add more features, it will
> considerably deviate a lot. The effort seems to be very high to maintain
> the common portion of code as I expect a lot of deviation.
> >
> > - Please consider updating register definitions in xml form and then
> > providing both changed xml files (to mesa project (?)) and generated
> > headers into the kernel.
> [Sankeerth] I followed what was done in the DP driver at
> /drivers/gpu/drm/msm/dp. I need to explore the xml approach to generate
> the register definitions.
> >
> > - Please consider using clk_bulk_* functions instead of using
> > dss_module_power. I'm going to send a patchset reworking current users
> > to use the generic clk_bulk_* function family.
> [Sankeerth] I will explore and rebase after your patch is available.
> >
> > - In generic, this eDP clock handling seems to match closely DP clocks
> > handling (with all the name comparison, etc). Consider moving this to
> > a generic piece of code
> >
> > - PHY seems to be a version of QMP PHY. Please use it, like it was
> > done for the DP itself. There is support for combined USB+DP PHYs
> > (both v3 and v4), so it should be possible to extend that for eDP.
> [Sankeerth] The DP phy is a combophy which supports both usb and dp phy
> concurrently, unlike eDP phy which is specific to only the eDP
> controller in sc7280. So, I implemented the edp phy sequences in the
> same folder.
> >
> >
> >> These are baseline changes with which we can enable display. The new
> >> eDP
> >> controller can also support additional features such as backlight
> >> control,
> >> PSR etc. which will be enabled in subsequent patch series.
> >>
> >> Summary of changes:
> >> DPU driver interface to the new eDP v510 display driver.
> >> New generation eDP controller and phy driver implementation.
> >> A common interface to choose enable the required eDP driver.
> >>
> >> Sankeerth Billakanti (3):
> >>   drm/msm/edp: support multiple generations of edp hardware
> >>   drm/msm/edp: add support for next gen edp
> >>   drm/msm/disp/dpu1: add support for edp encoder
> >>
> >>  drivers/gpu/drm/msm/Makefile                      |   19 +-
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |    7 +-
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |   33 +
> >>  drivers/gpu/drm/msm/edp/edp.c                     |  198 ---
> >>  drivers/gpu/drm/msm/edp/edp.h                     |   78 -
> >>  drivers/gpu/drm/msm/edp/edp.xml.h                 |  380 -----
> >>  drivers/gpu/drm/msm/edp/edp_aux.c                 |  264 ----
> >>  drivers/gpu/drm/msm/edp/edp_bridge.c              |  111 --
> >>  drivers/gpu/drm/msm/edp/edp_common.c              |   38 +
> >>  drivers/gpu/drm/msm/edp/edp_common.h              |   47 +
> >>  drivers/gpu/drm/msm/edp/edp_connector.c           |  132 --
> >>  drivers/gpu/drm/msm/edp/edp_ctrl.c                | 1375
> >> ------------------
> >>  drivers/gpu/drm/msm/edp/edp_phy.c                 |   98 --
> >>  drivers/gpu/drm/msm/edp/v200/edp.xml.h            |  380 +++++
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200.c           |  210 +++
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200.h           |   70 +
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c       |  264 ++++
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c    |  111 ++
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c |  132 ++
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c      | 1375
> >> ++++++++++++++++++
> >>  drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c       |   98 ++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510.c           |  220 +++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510.h           |  151 ++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c       |  268 ++++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c    |  111 ++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c |  117 ++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c      | 1583
> >> +++++++++++++++++++++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c       |  641 +++++++++
> >>  drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h       |  339 +++++
> >>  29 files changed, 6207 insertions(+), 2643 deletions(-)
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.c
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.xml.h
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_aux.c
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_bridge.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/edp_common.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/edp_common.h
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_connector.c
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
> >>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_phy.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp.xml.h
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.h
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.h
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c
> >>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h
> >>
> >> --
> >> The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora
> >> Forum, a Linux Foundation Collaborative Project
> >>
> >
> >
> > --
> > With best wishes
> > Dmitry
