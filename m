Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FE74247E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 22:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhJFU2k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 16:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhJFU2j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 16:28:39 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4199CC061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 13:26:47 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id z40so2485416qko.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 13:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lu8a1oMfv1PlvGzAjuTv4umEJnKxweShTUwEP9yiz5o=;
        b=UeaQ7vgGNpndM0NnFF1jOdfY/UqOmn3K6v40Jg07RiSmQM2J9ZK4tPwa6OSZN+EMMa
         MBUkU89eGCRfDrqD9JH8bxRz1yk03PtOucaGTnCGicXDNiDPpf9Y2pDcUnqshMb/Q7Df
         +p0yQ92TrUzT3Mv8Ox9KnRVU8Wu5A0nKBo4XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lu8a1oMfv1PlvGzAjuTv4umEJnKxweShTUwEP9yiz5o=;
        b=3U5c+NCEYeOrX/42XJyP4a1+4tDyyHe203xCRE5qLCw5eZjswkWV7g7Th3Xwxmehvr
         YtBwhoEgcxGXTTuZxJqySJNbTbMGCuUggM6AfCvJ/l+dXrmGtnZ6NspaFrTp9ADo75k8
         W0MYeHn6eB2Wn85dBx6kv6KYNUPVX7nN2CfSYpXrJEOXQ8hWbwgFVSdXU6rmRjDSmiLR
         xDT5Fo3p0I3EPGick4gbRtpIKUmls0NCTe5U8TpjHERHIVC/7mRTO/DrPAkNJogQ8yl2
         ACNOzpmhw3tad9lJGwzSDP+Yj2yLFbW6phRifjs5i8SH9SrTK5YoLdothiJENt7jUQSj
         UZxQ==
X-Gm-Message-State: AOAM532ZEsckIAzCGbK63FKqUo2bNAlS6bByv1WZuqXqDx6eEH8NIqoM
        4uN3Ql/2WXdiRyhqaI+WrGrFTl07vCIsVFffwbkOVw==
X-Google-Smtp-Source: ABdhPJwFmUlqc3JmgK/IC/BH5HLPfaPqWf/mbTEN6xy7fjKf/1rAebatDK7kbwhLuBCIzIYePaT2m7ibCI2pnw0WvVE=
X-Received: by 2002:a37:a50c:: with SMTP id o12mr153721qke.181.1633552006340;
 Wed, 06 Oct 2021 13:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
 <YVd3YdfgFVc0Br5T@ripper> <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
 <YVumL1lHLqtb/HKS@ripper> <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
 <YVyMwsvLl6XalJxB@ripper> <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
 <YV0KBWxVtKgOp2Cj@ripper> <CAD=FV=X5JFE3u9BtxxocaUrYNSpYXJN90UJ8HOvXZE6oYiVsDQ@mail.gmail.com>
In-Reply-To: <CAD=FV=X5JFE3u9BtxxocaUrYNSpYXJN90UJ8HOvXZE6oYiVsDQ@mail.gmail.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 6 Oct 2021 13:26:35 -0700
Message-ID: <CACeCKac4b_ej87cQD692TNwpsoFsmBwDcSeLy5fp+pvLX1si7g@mail.gmail.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Vara Reddy <varar@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

(CC+ Heikki)

Hi,

On Wed, Oct 6, 2021 at 8:19 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Oct 5, 2021 at 7:27 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > > > For reference, this is how I thought one is supposed to tie the Type-C
> > > > controller to the display driver:
> > > > https://lore.kernel.org/all/20211005022451.2037405-1-bjorn.andersson@linaro.org/
> > >
> > > OK, so I looked at that a bit. Fair warning that I've never looked at
> > > the type C code before today so anything I say could be totally wrong!
> > > :-)
> > >
> > > ...but I _think_ you're abusing the "mux" API for this. I think a type
> > > C port can have exactly 1 mux, right? Right now you are claiming to be
> > > _the_ mux in the DP driver, but what about for other alt modes? If
> > > those wanted to be notified about similar things it would be
> > > impossible because you're already _the_ mux, right?
> > >
> >
> > I actually don't think so, because I acquire the typec_mux handle by the
> > means of:
> >
> > mux_desc.svid = USB_TYPEC_DP_SID;
> > mux_desc.mode = USB_TYPEC_DP_MODE;
> > alt_port->mux = fwnode_typec_mux_get(fwnode, &mux_desc);
>
> Hrm, I guess I need to go find that code. Ah, I see it in your WIP
> tree, but not posted anywhere. :-P The only code I can see calling
> fwnode_typec_mux_get() is `drivers/platform/chrome/cros_ec_typec.c`.
> In that code it passes NULL for the mux_desc and I'm nearly certain
> that it just handles one "mux" per connector despite the fact that it
> handles lots of different types of alternate modes. That doesn't mean
> that the cros_ec implementation is correct / finalized, but it's a
> reference point.
>
>
> > And in the DisplayPort node I provide svid = /bits/ 16 <0xff01>;
> >
> > So I will be able to reference multiple different altmode
> > implementors using this scheme.
>
> OK, so I'm trying to grok this more. Let's see.
>
> I'm looking at ucsi_glink_probe() and looking at the matching dts in
> your WIP tree [1] in "sc8180x-lenovo-flex-5g.dts" OK, so:
>
> 1. It's looping once per _connector_ by looping with
> `device_for_each_child_node(dev, fwnode)`.
>
> 2. For each connector, it has exactly one `alt_port` structure.
>
> 3. For each `alt_port` structure it has exactly one `mux`.
>
> ...so currently with your WIP tree there is one "mux" per type C connector.
>
>
> Perhaps what you're saying, though, is that the UCSI code in your WIP
> tree can/should be changed to support more than one mux per port. Then
> I guess it would have logic figuring out what muxes to notify about
> which things? ...and I guess that would mean that it's currently a bug
> that the ucsi_altmode_enable_usb() notifies "the DP type C mux" about
> USB changes?
>
>
> > > I _think_ a mux is supposed to be something more like
> > > `drivers/phy/rockchip/phy-rockchip-typec.c` (though that code predates
> > > the type C framework we're looking at here). There the phy can do all
> > > the work of remuxing things / flipping orientation / etc. I don't
> > > think it's a requirement that every SoC be able to do this remuxing
> > > itself but (if memory serves) rk3399 implemented it so we didn't have
> > > to do it on the TCPC and could use a cheaper solution there.
> > >
> >
> > I'm afraid I don't see how this interacts with a display controller.
>
> This was actually kinda my point. ;-) Specifically I think
> `phy-rockchip-typec.c` is the thing that's supposed to be a "mux". I
> think your display controller isn't a mux. Yeah, it's handy that muxes
> get told about DP HPD status, but that doesn't mean it's the right
> abstraction for you to implement. In my mental model, it's the same as
> implementing your "i2c" controller with a "pinctrl" driver. :-P
>
>
> > It
> > seems more like it's the phy side of things, what we have split between
> > the Type-C controller and the QMP phy to set the pins in the right
> > state.
> >
> > > In any case, my point is that I think there is supposed to be a
> > > _single_ mux per port that handles reassigning pins and that's what
> > > this API is for.
> > >
> >
> > If that's the case things such as typec_mux_match() is just completely
> > backwards.
>
> Yeah, I have no explanation for typec_mux_match(). Let me see if I can
> lure some type C folks into this discussion.

This aligns with the model I have in my mind (not that that is
necessarily the right one).
I took that matching code to be meant to handle cases where the
firmware doesn't explicitly
define a "mode-switch" for the port (and so we look at the SVIDs
listed in the Mux fwnode descriptor).

The matcher code does suggest there could be a mux for each alternate
mode. But then, how does the
bus code know which mux to set [2] ? In that code, the struct altmode
has a pointer to the struct typec_mux, but I
don't see where that pointer is assigned. I assumed that it was set to
whatever the mux node of the
Type C port was whenever the port driver registered its altmodes for
each port, but I can't substantiate
that assumption in code.

Heikki, do you have any guidance regarding what the expected usage is
here? One typec_mux struct per type C port? Or
1 typec_mux per altmode per port?

>
>
> > > ...so I will still assert that the right thing to do is to have a
> > > drm_bridge for the type c connector and _that's_ what should be
> > > sending HPD.
> > >
> >
> > That still implies that all the current typec_mux code got it all wrong
> > and should be thrown out. If you instead consider that you have a Type-C
> > controller that upon switching DisplayPort on/off calls typec_mux_set()
> > to inform the functions that things has changed then all the current
> > code makes sense.
> >
> > It also maps nicely to how the TypeC controller would call
> > typec_switch_set() to inform, in our case the QMP phy that the
> > orientation has switched.
> >
> >
> > It seems reasonable to have some common helper code that registers the
> > typec_mux and turn its notifications into HPD notifications to the
> > display code, but I still think that should live in the DRM framework,
> > separate from the USB code.
>
> I think I'm going to step back and hope that the experts can chime in.
>
>
> [1] https://github.com/andersson/kernel/commits/wip/sc8180x-next-20210819
[2]: https://elixir.bootlin.com/linux/v5.15-rc4/source/drivers/usb/typec/bus.c#L27

>
> -Doug
