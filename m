Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9118435FF02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 02:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhDOAsK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 20:48:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39442 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhDOAsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 20:48:10 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F2F351E;
        Thu, 15 Apr 2021 02:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618447666;
        bh=ilnDH2Tmo+0CqI9tBtv+n6dQ1b/F3Pcfu3i0iNkboSk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jqWiywpV6pua2IaL+cpO7jXIr2e6qz+0w/zCuO/nkxh/+WQRa2RvpCjIK4eQFZoIj
         RMn1ufUmvv6VIBjfATZG9+wYUCaTLcf8thB1WmnUzpbKxyub/d24faMz7ZfJe0mt/x
         ZN51/mbqBPGybTEDxsD0MNudiF0tBDQHcsxgXyW8=
Date:   Thu, 15 Apr 2021 03:47:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH v2 11/14] drm/bridge: ti-sn65dsi86: Power things properly
 for reading the EDID
Message-ID: <YHeNMcUU3c9br2Am@pendragon.ideasonboard.com>
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025435eucas1p12b96966451ee0691f6d5d99b64ac2c8b@eucas1p1.samsung.com>
 <20210329195255.v2.11.Ied721dc895156046ac523baa55a71da241cd09c7@changeid>
 <8887ded7-d1ab-844c-e3a3-f39f6ef6264a@samsung.com>
 <CAD=FV=XJ5qtMDn5B431ObPS0JU3-P3755N7jzLZbbcc6XpqYtg@mail.gmail.com>
 <b3c08808-204c-6a3c-3e58-a2766985b5ef@samsung.com>
 <CAD=FV=WS8=hi07tA=t_5xOfPkb8TqY63A712uhJg4H8pUPCRJw@mail.gmail.com>
 <7bc4ce04-4110-8b8a-067b-824296b52480@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bc4ce04-4110-8b8a-067b-824296b52480@samsung.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Andrzej,

On Tue, Apr 06, 2021 at 06:52:07PM +0200, Andrzej Hajda wrote:
> Hello again after easter,
> 
> I have looked little bit more at sn65* driver and its application to 
> have better background.
> 
> I miss only info what panel do you have, how it is enabled/power controlled.
> 
> W dniu 01.04.2021 o 16:57, Doug Anderson pisze:
> > On Thu, Apr 1, 2021 at 4:12 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >> W dniu 31.03.2021 o 16:48, Doug Anderson pisze:
> >>> On Wed, Mar 31, 2021 at 4:08 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >>>> W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> >>>>> eDP panels won't provide their EDID unless they're powered on. Let's
> >>>>> chain a power-on before we read the EDID. This roughly matches what
> >>>>> was done in 'parade-ps8640.c'.
> >>>>>
> >>>>> NOTE: The old code attempted to call pm_runtime_get_sync() before
> >>>>> reading the EDID. While that was enough to power the bridge chip on,
> >>>>> it wasn't enough to talk to the panel for two reasons:
> >>>>> 1. Since we never ran the bridge chip's pre-enable then we never set
> >>>>>       the bit to ignore HPD. This meant the bridge chip didn't even _try_
> >>>>>       to go out on the bus and communicate with the panel.
> >>>>> 2. Even if we fixed things to ignore HPD, the EDID still wouldn't read
> >>>>>       if the panel wasn't on.
> >>>>>
> >>>>> One thing that's a bit odd here is taking advantage of the EDID that
> >>>>> the core might have cached for us. See the patch ("drm/edid: Use the
> >>>>> cached EDID in drm_get_edid() if eDP"). We manage to get at the cache
> >>>>> by:
> >>>>> - Instantly failing aux transfers if we're not powered.
> >>>>> - If the first read of the EDID fails we try again after powering.
> >>>>>
> >>>>> Fixes: 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC")
> >>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>>> ---
> >>>>> Depending on what people think of the other patches in this series,
> >>>>> some of this could change.
> >>>>> - If everyone loves the "runtime PM" in the panel driver then we
> >>>>>      could, in theory, put the pre-enable chaining straight in the "aux
> >>>>>      transfer" function.
> >>>>> - If everyone hates the EDID cache moving to the core then we can
> >>>>>      avoid some of the awkward flow of things and keep the EDID cache in
> >>>>>      the sn65dsi86 driver.
> >>>>
> >>>> I wonder if this shouldn't be solved in the core - ie caller of
> >>>> get_modes callback should be responsible for powering up the pipeline,
> >>>> otherwise we need to repeat this stuff in every bridge/panel driver.
> >>>>
> >>>> Any thoughts?
> >>>
> >>> Yeah, I did look at this a little bit. Presumably it would only make
> >>> sense to do it for eDP connections since:
> >>>
> >>> a) The concept of reading an EDID doesn't make sense for things like MIPI.
> >>
> >> I guess you mean MIPI DSI
> >
> > Yes, sorry! I'll try to be more clear.
> >
> >> and yes I agree, more generally it usually(!)
> >> doesn't make sense for any setup with fixed display panel.
> >>
> >> On the other hand there are DSI/HDMI or DSI/DP adapters which usually
> >> have EDID reading logic.
> >>
> >> And the concept makes sense for most connectors accepting external
> >> displays: HDMI, DP, MHL, VGA...
> >
> > So, actually, IMO the concept doesn't make sense for anything with an
> > external connector. Here's the logic for a handful of connectors:
> >
> > 1. MIPI DSI: there is no EDID so this doesn't make sense.
> >
> > 2. An external connector (HDMI, DP, etc): the display that's plugged
> > in is externally powered so doesn't need us to power it up to read the
> > EDID. By definition, when the HPD signal is asserted then it's OK to
> > read the EDID and we don't even know if a display is plugged in until
> > HPD is asserted. Thus no special power sequencing is needed to read
> > the EDID.  (Yes, we need to make sure that the eDP controller itself
> > is powered, but that doesn't seem like it's the core's business).
> 
> Not true IMO, even if external device is powered on, you must enable 
> EDID-reader logic.

Sure, but I think Doug was referring to powering up the device connected
to the SN65DSI86 output. When that device (from a DT and DRM bridge
point of view) is an external connector, it means that the hardware
device is an external HDMI/DP sink, and we have no way to control its
power. The SN65DSI86 itself of course needs to be powered.

> I guess it is not uncommon to have different power states for EDID 
> reading and bridge/panel pre-enablement (especially in embedded world). 
> In fact there are setups where EDID-reader is totally different device 
> than the bridge itself, and these devices should be 
> powered/enabled/operational only for time of EDID reading.
> 
> > 3. eDP: this is where it matters. This is because:
> >
> > 3a) eDP displays aren't powered all the time. If you just boot up or
> > you blank your screen, likely the display has no power at all.
> >
> > 3b) Because the display has no power, the "HPD" signal doesn't assert.
> > In fact, for eDP the "HPD" signal really should mean "display ready"
> > or "display finished powering up".
> >
> > 3c) Even though we never get a HPD signal, we still simply assume that
> > a display is present because this is an "embedded" device.
> >
> > So eDP is unique (as far as I know) in that it's a type of display
> > that has an EDID but that we will report "a display is here" before
> > we've powered up the display and before we can read the EDID.
> >
> >>> b) For something with an external connector (DP and HDMI) you don't
> >>> even know they're inserted unless the EDID is ready to read (these
> >>> devices are, essentially, always powered).
> >>
> >> Usually there are two elements which are not the same:
> >>
> >> 1. HotPlug signal/wire.
> >>
> >> 2. EDID reading logic.
> >>
> >> The logic responsible for reading EDID needs to be enabled only for time
> >> required for EDID reading :) So it's power state often must be
> >> controlled explicitly by the bridge driver. So even if in many cases
> >> pre_enable powers on the logic for EDID reading it does not make it the
> >> rule, so I must step back from my claim that it is up to caller :)
> >
> > OK, I'll plan to keep it in the bridge chip driver now.
> >
> >>> So I started off trying to do this in the core for eDP, but then it
> >>> wasn't completely clear how to write this code in a way that was super
> >>> generic. Specifically:
> >>>
> >>> 1. I don't think it's a 100% guarantee that everything is powered on
> >>> in pre-enable and powered off in post-disable. In this bridge chip
> >>> it's true, but maybe not every eDP driver? Would you want me to just
> >>> assume this, or add a flag?
> >>
> >> Ok, pre_enable should power on the chip, but for performing
> >> initialization of video transport layer. Assumption it will power on
> >> EDID logic is incorrect, so my claim seems wrong, but also this patch
> >> looks incorrect :)
> >>
> >> In general only device containing EDID logic knows how to power it up.
> >
> > I still believe my patch is correct. Specifically I don't need to make
> > any assumptions about display elements upstream of me (sources of the
> > bridge chip). I only need to make assumptions about the pre-enable of
> > the bridge driver itself and anything downstream of it.
> >
> > At the moment downstream of this particular bridge chip is always a
> > panel device. Even further, all known downstream devices are
> > "simple-panel". That is known to power up the panel enough to read the
> > EDID in the "prepare" stage.
> >
> > Sure, someone _could_ add another bridge downstream in some design,
> > but it would be up to that person to either fix that downstream driver
> > to power itself in pre-enable or to add some type of quirk disabling
> > the EDID reading.
> >
> >> Since I do not know your particular case I can propose few possible ways
> >> to investigate:
> >>
> >> - call bridge.next->get_modes - you leave responsibility for powering up
> >> to the downstream device.
> >
> > The "next" bridge is the panel, so I don't think this works.
> 
> Then drm_panel_get_modes will work then.

Not if the panel exposes modes through EDID, in that case it's the
responsibility of the device connected to the DDC/AUX port to read the
EDID and provide modes. The panel driver won't be able to handle it on
its own.

> >> - ddc driver on i2c request should power up the panel - seems also correct,
> >
> > Right, so I could put the
> > "drm_bridge_chain_pre_enable(&pdata->bridge)" into the
> > ti_sn_aux_transfer() function. I talked about that a little bit "after
> > the cut" in my post where I said:
> >
> >> - If everyone loves the "runtime PM" in the panel driver then we
> >>   could, in theory, put the pre-enable chaining straight in the "aux
> >>   transfer" function.
> >
> > The reason for the dependence on "runtime PM" in the panel driver is
> > that we are doing DDC over AUX and it breaks the EDID reading into
> > lots of chunks so if we did the powering up and powering down there it
> > would be crazy slow without the delayed poweroff.
> 
> OK, it resembles to me DSI-controlled panel - to query/configure panel 
> panel driver asks DSI-host to transfer some bytes to the panel and/or 
> back via DSI-bus.
> 
> In case of eDP panels we could do similar thing to read edid - we call 
> drm_panel_get_modes - it calls drm_panel_funcs.get_modes callback and it 
> decides (based on DT) if it should fill modes according to hardcoded 
> info into the driver or to ask the physical panel via DP-controller - 
> this way all the players (the panel, AUX/DDC device) will know what to 
> power-up.
> 
> I guess there is missing pieces - there is no DP bus :), I am not sure 
> if there is straight way to access panel's aux/ddc from the panel 
> driver, maybe somehow via drm_connector ???

If the SN65DSI86 has to call drm_panel_get_modes(), which will then call
back into the SN65DSI86 driver to perform the EDID read, it seems to me
that the panel driver shouldn't be involved at all.

DRM bridges have "recently" gained new operations to retrieve EDID, and
there's a helper (drm_bridge_connector) that creates a connector for a
chain of bridges, delegating connector operations to the appropriate
bridge in the chain. This seems a better way forward to me (but I'm
biased, as I've authored that code :-)).

> Of course this only my idea - to be discussed with others.

-- 
Regards,

Laurent Pinchart
