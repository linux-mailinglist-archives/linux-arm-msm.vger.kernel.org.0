Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1E6111BB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 23:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfLCWe5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 17:34:57 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42412 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbfLCWe5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 17:34:57 -0500
Received: by mail-ed1-f65.google.com with SMTP id e10so4741318edv.9;
        Tue, 03 Dec 2019 14:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ulyW2h3rie4VE9IxojxTAhNWYWCowopRoXSHKOE6/OQ=;
        b=XHmDbg3XnAAbtSzXD/RDl+VIKHYWfbmKA4Y8dB73bxVM6pEwLogY+Dn4Y1M+imggWq
         lkknihtVD7CNzhvqB3PZ259wIcPAYQJDB4qNceYhlTEkZsOhBNrFwOxKUj0UuBwuXAuB
         wMl99DqJfpBNX1GJcJYf7FVxaqmB4McPbNvmRaeN55iI47JaEWP5FPQWZq5v6KJCRknU
         eH/jOLDW+BJB9JcpV6scuztgzTtB2ysXlk5Bo0bPz+gYaLOPm+Nu6hxgqCxv/8kkKEvk
         HI5B8gOHWLWsI4XcujQe+BLE8NkHeb+VGrGrXDGFG63xGUAvvvO9F5bdLvNDxAzrfSgB
         uoOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ulyW2h3rie4VE9IxojxTAhNWYWCowopRoXSHKOE6/OQ=;
        b=JAhDUYoIAnuVSCCw0X+LJJTpSgjl9affsfNbcOv41CIneAaXpgOOdIa23jv+zDjZi7
         EKkOJYDQYrtrATohT6I5eK6sCpTOPdkovM85OqJbIzj4mBAyqwFuAz+nw5dP5pjlH6KD
         He/zzRmf3dAh/bRQbJcD3K73p1FBz4QithA8rzX4MAlZmtFR7AXe2i3FF9CYu/H+823n
         emGHAf5akI17ai4euQwuAPiOcZfnWeFz7JHtWEfaMuj5x9RMTCgjZlmoFCv10Ad4SnHE
         ft/HgGiXxeBuGMD48JVddtrV3oXYjBQqNxVI+fTL3Ntk4h6v0rGhy1gtL2H8A0gTynhr
         liUA==
X-Gm-Message-State: APjAAAUVfgE05/4owu+cIdGGR/OPZxjrJXVpx9NUDIeTEdfi+dc+DyB8
        /x9YrkjiCP8Kw3j3XAXsLCfmBombPXt326B7BBo=
X-Google-Smtp-Source: APXvYqyFjUHyBCnFC1zFWu802ktlkJvjl1vV+IvKLITIItq8MWHWmCYLyUHnT72F7s8O1nTkQqJUN0fdZJuja0ba1DQ=
X-Received: by 2002:a17:906:b797:: with SMTP id dt23mr1294244ejb.241.1575412495051;
 Tue, 03 Dec 2019 14:34:55 -0800 (PST)
MIME-Version: 1.0
References: <1575011105-28172-1-git-send-email-harigovi@codeaurora.org> <20191203222232.GG228856@google.com>
In-Reply-To: <20191203222232.GG228856@google.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 3 Dec 2019 14:34:44 -0800
Message-ID: <CAF6AEGvsrXjNX25AgN__mnguohmmT1tgMdrG39i=dXUYQ4p-mQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm: add support for 2.4.1 DSI version for sc7180 soc
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 3, 2019 at 2:22 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Hi,
>
> On Fri, Nov 29, 2019 at 12:35:05PM +0530, Harigovindan P wrote:
> > Changes in v1:
> >       -Modify commit text to indicate DSI version and SOC detail(Jeffrey Hugo).
> >       -Splitting visionox panel driver code out into a
> >        different patch(set), since panel drivers are merged into
> >        drm-next via a different tree(Rob Clark).
>
> The change log shouldn't be part of the commit message, please place it
> after the '---' separator.

jfyi, the changelog and version #'s showing up in final commit msg is
one thing that drm does differently from other parts of the kernel.
So it is ok to keep the changelog before "---".

But agreed about the need for a commit message (in addition to just
the changelog)

BR,
-R

> I think at least a one line commit message besides the subject is
> mandatory, so if you move the change log down you'll have to add
> some short summary.
>
> > Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 21 +++++++++++++++++++++
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > index b7b7c1a..7b967dd 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > @@ -133,6 +133,10 @@ static const char * const dsi_sdm845_bus_clk_names[] = {
> >       "iface", "bus",
> >  };
> >
> > +static const char * const dsi_sc7180_bus_clk_names[] = {
> > +     "iface", "bus",
> > +};
> > +
> >  static const struct msm_dsi_config sdm845_dsi_cfg = {
> >       .io_offset = DSI_6G_REG_SHIFT,
> >       .reg_cfg = {
> > @@ -147,6 +151,20 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
> >       .num_dsi = 2,
> >  };
> >
> > +static const struct msm_dsi_config sc7180_dsi_cfg = {
> > +     .io_offset = DSI_6G_REG_SHIFT,
> > +     .reg_cfg = {
> > +             .num = 1,
> > +             .regs = {
> > +                     {"vdda", 21800, 4 },    /* 1.2 V */
> > +             },
> > +     },
> > +     .bus_clk_names = dsi_sc7180_bus_clk_names,
> > +     .num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
> > +     .io_start = { 0xae94000 },
> > +     .num_dsi = 1,
> > +};
> > +
> >  const static struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
> >       .link_clk_enable = dsi_link_clk_enable_v2,
> >       .link_clk_disable = dsi_link_clk_disable_v2,
> > @@ -201,6 +219,9 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
> >               &msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >       {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
> >               &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> > +     {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
> > +             &sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> > +
> >  };
> >
> >  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> > index e2b7a7d..9919536 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> > @@ -19,6 +19,7 @@
> >  #define MSM_DSI_6G_VER_MINOR_V1_4_1  0x10040001
> >  #define MSM_DSI_6G_VER_MINOR_V2_2_0  0x20000000
> >  #define MSM_DSI_6G_VER_MINOR_V2_2_1  0x20020001
> > +#define MSM_DSI_6G_VER_MINOR_V2_4_1  0x20040001
> >
> >  #define MSM_DSI_V2_VER_MINOR_8064    0x0
> >
> > --
> > 2.7.4
> >
