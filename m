Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDB674DE47A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Mar 2022 00:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241502AbiCRX3E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Mar 2022 19:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238224AbiCRX3D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Mar 2022 19:29:03 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C4F30A8A3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 16:27:43 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id ay7so10406753oib.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 16:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=xydEP3ntewe8jXeG5cufJLFbtu5jAp6rCmpsAdUaVj0=;
        b=iC/CyL+qoOIh4tWZSEtkOw03hbXkt3n5lKqLy/2j+oXVNPuJmAU+ThKr+9/8EtXj9j
         uB7wWt4R/AvyUnKYLTdVXVCqD+gKUeRq5CgrXCjOlcgg0kFGID8kQVoDKcb1K7OdJus8
         PGzZAFzTkN0gP0kj1oJxjroHq32UzCygNW6LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=xydEP3ntewe8jXeG5cufJLFbtu5jAp6rCmpsAdUaVj0=;
        b=NFLPN01y5uwlvauKVFBTLcJYcYh9WG8JMD6xXNqzb6xYpZ1C2yXl8reV+dxGa1Z+v2
         d7ZB/dezcv1lzk34VTSbzPhiZEMx5qBHXgaT1jej1Koz89DosG82l4DKKIX1xp7KPYJ4
         WU1016sjoVMpPq58dmhTFJpEiIyK6LtQ/JzI6uqwog0L3dfyJx3jEhyHg2g7ljeL1zOZ
         4YMQep8Dyscc6i+hIazRFkm6qAJ4YlSKn/Udn+jeTUhyHt9b5SqA/H/PjcVI5RKaA0xn
         QpQlk0oMMAWfDbp5UNc67x5SyowsEXwgpgLJ+Up2lynlwiZO8a4bk2y5sWDBdxhUh9zE
         XuRw==
X-Gm-Message-State: AOAM530IWmlPo79zZGMtOckK5swmf6Z/m5VvFIjq+l/fESg1GbZJpSuc
        z2bYy0099wvX/o6FEhQfGQT2S1cR69MfXdXDCGiMoA==
X-Google-Smtp-Source: ABdhPJy2FmGju/yeIwApCC/RpO1GPqLBlc4ulxxuSZlWK1ewLrex5B1bQEgK+qVbmjAP/OdGB0fr1pe+crloDT7HP2E=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr5051272oie.193.1647646062986; Fri, 18
 Mar 2022 16:27:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Mar 2022 16:27:42 -0700
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WaK8VFC-BvsFpnUv3mW4svGggQTw1hh+zRCEhGvbgYMQ@mail.gmail.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n520pQKM7mFSE_00ER+F9RKUPrN+y4U8fmsxi7FoFMyOrA@mail.gmail.com>
 <CAD=FV=UWF8K9JPJXFSGMRK-HmCi+2jM3aN6Uy7hyDSu1_azF+w@mail.gmail.com>
 <CAE-0n53U=bqPTGtPx2Ho5axtO6EL6WtOtmFisxSufC6OZERV1Q@mail.gmail.com> <CAD=FV=WaK8VFC-BvsFpnUv3mW4svGggQTw1hh+zRCEhGvbgYMQ@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Mar 2022 16:27:42 -0700
Message-ID: <CAE-0n52v2m4U0wK6NYf4KBwXmp+TEVhjnGpW4rQHuZSf7TYfgA@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink interaction
To:     Doug Anderson <dianders@chromium.org>
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        devicetree@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2022-03-18 14:58:55)
> Hi,
>
> On Fri, Mar 18, 2022 at 1:17 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > > > > +       ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
> > > >
> > > > Why are we making aux transactions when hpd isn't asserted? Can we only
> > > > register the aux device once we know that state is "connected"? I'm
> > > > concerned that we're going to be possibly polling the connected bit up
> > > > to some amount of time (0x0003FFFF usecs?) for each aux transfer when
> > > > that doesn't make any sense to keep checking. We should be able to check
> > > > it once, register aux, and then when disconnect happens we can
> > > > unregister aux.
> > >
> > > This is for eDP and, unless someone wants to redesign it again, is
> > > just how it works.
> > >
> > > Specifically:
> > >
> > > 1. On eDP you _always_ report "connected". This is because when an eDP
> > > panel is turned off (but still there) you actually have no way to
> > > detect it--you just have to assume it's there. And thus you _always_
> > > register the AUX bus.
> >
> > Is reporting "connected" the same as HPD being asserted in the case of
> > eDP? I can understand wanting to report "connected", because as you say,
> > the panel is always connected; there aren't dongles or cables involved.
>
> No. What I mean by connected is that when DRM asks "hey, do you have a
> panel" connected then for eDP we always say "yes" regardless of any
> hardware state.
>
> HPD is a _huge_ misnomer for eDP and IMO the name causes lots of
> confusion. It's not "hot plug detect". You don't hot plug eDP. It's
> really "panel ready / panel IRQ"
>
>
> > But the state of the HPD pin is changing at runtime, and eDP supports
> > irq_hpd pulses from what I recall, for "link management".
> >
> > I think this device requires the status bit in the hardware to say it is
> > "connected" before aux transactions are guaranteed to work. Presumably
> > the HPD pin could go be asserted at the SoC's pad and there could be
> > some time still where the hardware status bit hasn't flipped over to
> > "connected" yet and thus aux transactions are going to fail. Can qcom
> > confirm this?
> >
> > >
> > > 2. When we are asked to read the EDID that happens _before_ the normal
> > > prepare/enable steps. The way that this should work is that the
> > > request travels down to the panel. The panel turns itself on (waiting
> > > for any hardcoded delays it knows about) and then initiates an AUX
> > > transaction. The AUX transaction is in charge of waiting for HPD.
> >
> > Are we talking about generic_edp_panel_probe()? Why doesn't that poll
> > hpd gpio like panel_edp_prepare_once() does?
>
> There's no HPD GPIO in this case, right?

Right. The hardware supports HPD here, so polling the pin as a gpio is
incorrect.

>
> In the trogdor case we ended up not using the HPD that was part of the
> ti-sn65dsi86 controller because it was fairly useless (it debounced
> for far too long), so we ended up hooking it up as a GPIO and I guess
> gave up on getting the extra notifications from the panel. Maybe a
> good thing, in hindsight, that we didn't do PSR because that might
> have been a pain.
>
> In any case, originally I had the GPIO being handled by the
> ti-sn65dsi86 controller driver and that seemed like it made sense to
> me (after all, the ti-sn65dsi86 driver would have to handle HPD if
> this went to the dedicated HPD pin) but got told "no, put it in the
> panel" by both you and Laurent [1].
>
> [1] https://lore.kernel.org/r/20200415203256.GP4758@pendragon.ideasonboard.com/
>
>
> > Are there any links to
> > discussions about this I can read?
>
> I'm not sure if there's any more than the conversation I pointed at
> above where we talked about hpd-gpios. Atop that, I believe I just
> realized that this was the only way it could work without re-designing
> again.
>
> To some extent the status quo is documented in commit a64ad9c3e4a5
> ("drm/panel-edp: Fix "prepare_to_enable" if panel doesn't handle
> HPD"). I wrote that commit when I thought about how HPD would need to
> be handled if it was a dedicated pin on the controller and the panel
> didn't have knowledge about it.
>
>
> > Pushing hpd state checking into aux
> > transactions looks like the wrong direction. Also, as I said up above I
> > am concerned that even checking the GPIO won't work and we need some way
> > to ask the bridge if HPD is asserted or not and then fallback to the
> > GPIO method if the display phy/controller doesn't have support to check
> > HPD internally. Something on top of DRM_BRIDGE_OP_HPD?
>
> If we could somehow get the HPD status from the bridge in the panel
> driver it definitely would be convenient. It does feel like that's an
> improvement that could be done later, though. We've already landed a
> few instances of doing what's done here, like for parade-ps8640 and
> analogix_dp. I suspect designing a new mechanism might not be the most
> trivial.

What is done in the bridge drivers is to wait for a fixed timeout and
assume aux is ready? Or is it something else? If there's just a fixed
timeout for the eDP case it sounds OK to do that for now and we can fine
tune it later to actually check HPD status register before the panel
tries to read EDID.

>
> I haven't actually tried it, but I suspect that to get something like
> what you're talking about we'd have to get the rest of drm to know
> that for eDP ports that it should assume something is connected
> _regardless_ of what the "detect" / "HPD" options say. Then we'd have
> to extend the edp-panel code to be able to be able to query the next
> bridge in the chain if a GPIO wasn't provided.

Can the panel interrogate the bridge chain somehow? It feels like either
something in the chain should know the status of HPD (the case here
where display controller in the SoC knows) or it should be a gpio to the
panel (trogdor case). The bridge ops can implement DRM_BRIDGE_OP_HPD and
the first bridge from the encoder that supports HPD can implement some
sort of "wait for hpd asserted" function that the panel then uses once
it powers up the panel during probe. If the panel has a gpio and nothing
else in the chain can detect hpd then the panel polls the gpio, or it
waits for the amount of time delay after powering on the panel if the
panel's hpd function is called.

>
>
> > > For the DP case this should not cause any significant overhead, right?
> > > HPD should always be asserted so this is basically just one extra IO
> > > read confirming that HPD is asserted which should be almost nothing...
> > > You're just about to do a whole bunch of IO reads/writes in order to
> > > program the AUX transaction anyway.
> >
> > In the DP case the dongle/cable can be disconnected in the middle of aux
> > transactions. If that happens we could be waiting a while in this
> > transfer function to timeout looking for the status bit. The driver
> > already gets an "unplug" irq when the cable is disconnected though so it
> > would be better to figure out a way to stop the aux transactions quickly
> > when that happens without having to read the hardware and poll the bit
> > that we already know is doomed to timeout. I think apple dongles throw
> > this logic for a loop though because the HDMI cable can be disconnected
> > from the dongle and then we don't see an "unplug" irq, just the number
> > of sinks becomes 0. Maybe there's an irq_hpd event, not sure.
>
> Ah, interesting. Having a DP cable unplugged in the middle of an aux
> transaction does seem like it could be a problem. What if we just wait
> in the case our bridge.type is "DRM_MODE_CONNECTOR_eDP"? That should
> be easy, right?

Sounds like it would work. Is this supposed to fix some DP case as well
though? There were some patches to speed up aux failures when the dongle
was unplugged but I haven't checked after that. I guess this waiting is
only important for eDP because the edp-panel code is trying to read EDID
and it isn't waiting for HPD to be asserted before doing that.

>
>
> > > > > +       if (ret) {
> > > > > +               DRM_DEBUG_DP("DP sink not ready for aux transactions\n");
> > > > > +               goto exit;
> > > > > +       }
> > > > > +
> > > > >         dp_aux_update_offset_and_segment(aux, msg);
> > > > >         dp_aux_transfer_helper(aux, msg, true);
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > > > index fac815f..2c3b0f7 100644
> > > > > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > > > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > > > @@ -242,6 +242,29 @@ void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
> > > > >         phy_calibrate(phy);
> > > > >  }
> > > > >
> > > > > +int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
> > > > > +{
> > > > > +       u32 state, hpd_en, timeout;
> > > > > +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> > > > > +                               struct dp_catalog_private, dp_catalog);
> > > > > +
> > > > > +       hpd_en = dp_read_aux(catalog, REG_DP_DP_HPD_CTRL) &
> > > > > +                                       DP_DP_HPD_CTRL_HPD_EN;
> > > >
> > > > Use two lines
> > > >
> > > >         hpd_en = dp_read_aux();
> > > >         hpd_en &= DP_DP_HPD_CTRL_HPD_EN;
> > > >
> > > > > +
> > > > > +       /* no-hpd case */
> > > > > +       if (!hpd_en)
> > > > > +               return 0;
> > >
> > > I guess reading from hardware is fine, but I would have expected the
> > > driver to simply know whether HPD is used or not. Don't need to read
> > > it from hardware, do we? It's not like it's changing from minute to
> > > minute--this is something known at probe time.
> >
> > Are you saying that HPD is always asserted?
>
> I don't think this is looking for HPD assertion, is it? This is
> looking for whether the HPD interrupt is enabled, isn't it? This is to
> support the case of eDP panels where we didn't hook the HPD line up,
> right? It should be known at probe time whether we've hooked HPD up or
> not. ...or am I misreading?

Ah right. This is basically a proxy for "is no-hpd present in DT?" per
the last patch in this series.

>
>
> > That doesn't sound right.
> > My understanding is that HPD will be asserted after the panel is powered
> > up. Before that HPD is deasserted. Similarly, when we power down the
> > panel, HPD will be deasserted. I guess DRM wants to assume that an eDP
> > panel is always connected? That sounds like it might be OK as long as
> > userspace doesn't use "connected" to know that it's OK to do things like
> > read/write aux or push pixels to the panel when HPD is deasserted.
>
> IMO having userspace reading / writing aux directly and expecting it
> to work is a terrible idea anyway. It's _maybe_ sorta OK in the DP
> case, but it's really not good in the eDP case. To me it's sorta like
> expecting things to be amazing and foolproof when you go behind the
> kernel's back and write to an i2c device using `i2cset -f`. Sure, it
> might work, but it can also confuse the heck out of things. It also
> turns out to be a huge problem when you get to PSR because userspace
> will get errors if it tries to write to the AUX channel and the panel
> is in PSR mode. This came up in the context of Brian's analogix dp
> patches [1]. The right answer, in my mind, is to treat userspace
> accessing the AUX channel directly as more of a debug feature, at
> least for eDP panels.

If it's a debug feature then it should be removed from the system. The
flow of data is passing through the kernel so if the kernel is getting
confused about backdoor access over aux it should snoop the transactions
and block things it doesn't like. I don't know the backstory on aux
being exposed to userspace, but leaving it in a broken state isn't good.

>
> In terms of userspace pushing pixels to the panel, I don't think
> that's quite the same, is it? Generally userspace is in charge of
> whether the eDP panel is powered on or powered off, isn't it?

I'm not sure what it's the same as, but I meant drawing on the screen
when the display is powering on but not visible yet is concerning.
drm_helper_hpd_irq_event() is used to tell userspace that it can "start
drawing now" because it calls drm_kms_helper_hotplug_event() when the
connector status changes. This is my understanding of how the DP path
works in this driver. I don't know how it works for eDP bridge drivers.

>
> So generally I think that for eDP a panel is always "connected" in all
> senses of the word. It might not be "powered" at some given point of
> time, but it's always connected.
>
> [1] https://lore.kernel.org/r/CAD=FV=VYe1rLKANQ8eom7g8x1v6_s_OYnX819Ax4m7O3UwDHmg@mail.gmail.com/
>
