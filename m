Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C04E35179B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 19:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235257AbhDARm1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234433AbhDARhd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:37:33 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A69C0F26D0
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 07:57:47 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id f12so1655269qtq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nCK+9gyhJ+QTOf23dV8336ka6cbFD0kpJr3qSmWMf/A=;
        b=a12ULmvhqA5tQeB47VPUgbZnQyq/OtOTne66EZZHLr6NeodGaZ1M9FdCCRPYJi67YL
         D9rtL73mcziJjG8xq7Knwil1/c5HvTK5XiEhLltYFWA0e7Rl2k8taKVFkKwuAX5oq5Ui
         Zk6m74paHw+LzBRqvEVUgjxIFclMSvtMVwuHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nCK+9gyhJ+QTOf23dV8336ka6cbFD0kpJr3qSmWMf/A=;
        b=ibZAaE8oGiJB5lCYIIavMnI9PW9P9ptjYyGsnTi0Gb9CsVlmNXTE5R/e+HaQrdXLY/
         NKxF10lH5rn4ON2EssYaraIDSKFd6rxiPMMzflUsL1iztf217O7AgPoU7uWkvs3psudS
         x8oILP80FjvpgPu9HakOL+Si9Y/yDa0UO6vpEs+n7duytVSMby9pKhEzGUvZfV0xM37D
         eAD868oiRkRoFIb2BDuVCEHieRuN4SwSUUMD7LQZrhUcFVeeR5BwZHRRyfr9RlRCS2VU
         5iJXJsJj0nmJuOHTuKNUSHq6Zi1dEnUcbwShp64/+eQ8BGFMKomGDwbamXJq/xKTNr/6
         FlYg==
X-Gm-Message-State: AOAM532Y4/Nu9nfN43I3PJTTC66NgPPu8ps9HUAQPRZttLnqAnQMqPCT
        uBcoMJW25CukPFIUaW9nM6lXbb9C92175A==
X-Google-Smtp-Source: ABdhPJwYbAu6Ql/PpxSTYrjL+d9nOoNoge9/v719ehzmmM+qu/o51i6twqJ6ZM6+5AHY/8VtnqgZJQ==
X-Received: by 2002:aed:32c6:: with SMTP id z64mr7495736qtd.77.1617289066826;
        Thu, 01 Apr 2021 07:57:46 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id g186sm4352453qke.0.2021.04.01.07.57.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 07:57:45 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id i144so2099381ybg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 07:57:45 -0700 (PDT)
X-Received: by 2002:a25:8712:: with SMTP id a18mr6421390ybl.79.1617289064490;
 Thu, 01 Apr 2021 07:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025435eucas1p12b96966451ee0691f6d5d99b64ac2c8b@eucas1p1.samsung.com>
 <20210329195255.v2.11.Ied721dc895156046ac523baa55a71da241cd09c7@changeid>
 <8887ded7-d1ab-844c-e3a3-f39f6ef6264a@samsung.com> <CAD=FV=XJ5qtMDn5B431ObPS0JU3-P3755N7jzLZbbcc6XpqYtg@mail.gmail.com>
 <b3c08808-204c-6a3c-3e58-a2766985b5ef@samsung.com>
In-Reply-To: <b3c08808-204c-6a3c-3e58-a2766985b5ef@samsung.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 1 Apr 2021 07:57:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WS8=hi07tA=t_5xOfPkb8TqY63A712uhJg4H8pUPCRJw@mail.gmail.com>
Message-ID: <CAD=FV=WS8=hi07tA=t_5xOfPkb8TqY63A712uhJg4H8pUPCRJw@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] drm/bridge: ti-sn65dsi86: Power things properly
 for reading the EDID
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Robert Foss <robert.foss@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 1, 2021 at 4:12 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> W dniu 31.03.2021 o 16:48, Doug Anderson pisze:
> > Hi,
> >
> > On Wed, Mar 31, 2021 at 4:08 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >>
> >> W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> >>> eDP panels won't provide their EDID unless they're powered on. Let's
> >>> chain a power-on before we read the EDID. This roughly matches what
> >>> was done in 'parade-ps8640.c'.
> >>>
> >>> NOTE: The old code attempted to call pm_runtime_get_sync() before
> >>> reading the EDID. While that was enough to power the bridge chip on,
> >>> it wasn't enough to talk to the panel for two reasons:
> >>> 1. Since we never ran the bridge chip's pre-enable then we never set
> >>>      the bit to ignore HPD. This meant the bridge chip didn't even _try_
> >>>      to go out on the bus and communicate with the panel.
> >>> 2. Even if we fixed things to ignore HPD, the EDID still wouldn't read
> >>>      if the panel wasn't on.
> >>>
> >>> One thing that's a bit odd here is taking advantage of the EDID that
> >>> the core might have cached for us. See the patch ("drm/edid: Use the
> >>> cached EDID in drm_get_edid() if eDP"). We manage to get at the cache
> >>> by:
> >>> - Instantly failing aux transfers if we're not powered.
> >>> - If the first read of the EDID fails we try again after powering.
> >>>
> >>> Fixes: 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC")
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>> Depending on what people think of the other patches in this series,
> >>> some of this could change.
> >>> - If everyone loves the "runtime PM" in the panel driver then we
> >>>     could, in theory, put the pre-enable chaining straight in the "aux
> >>>     transfer" function.
> >>> - If everyone hates the EDID cache moving to the core then we can
> >>>     avoid some of the awkward flow of things and keep the EDID cache in
> >>>     the sn65dsi86 driver.
> >>
> >> I wonder if this shouldn't be solved in the core - ie caller of
> >> get_modes callback should be responsible for powering up the pipeline,
> >> otherwise we need to repeat this stuff in every bridge/panel driver.
> >>
> >> Any thoughts?
> > Yeah, I did look at this a little bit. Presumably it would only make
> > sense to do it for eDP connections since:
> >
> > a) The concept of reading an EDID doesn't make sense for things like MIPI.
>
> I guess you mean MIPI DSI

Yes, sorry! I'll try to be more clear.


> and yes I agree, more generally it usually(!)
> doesn't make sense for any setup with fixed display panel.
>
> On the other hand there are DSI/HDMI or DSI/DP adapters which usually
> have EDID reading logic.
>
> And the concept makes sense for most connectors accepting external
> displays: HDMI, DP, MHL, VGA...

So, actually, IMO the concept doesn't make sense for anything with an
external connector. Here's the logic for a handful of connectors:

1. MIPI DSI: there is no EDID so this doesn't make sense.

2. An external connector (HDMI, DP, etc): the display that's plugged
in is externally powered so doesn't need us to power it up to read the
EDID. By definition, when the HPD signal is asserted then it's OK to
read the EDID and we don't even know if a display is plugged in until
HPD is asserted. Thus no special power sequencing is needed to read
the EDID.  (Yes, we need to make sure that the eDP controller itself
is powered, but that doesn't seem like it's the core's business).

3. eDP: this is where it matters. This is because:

3a) eDP displays aren't powered all the time. If you just boot up or
you blank your screen, likely the display has no power at all.

3b) Because the display has no power, the "HPD" signal doesn't assert.
In fact, for eDP the "HPD" signal really should mean "display ready"
or "display finished powering up".

3c) Even though we never get a HPD signal, we still simply assume that
a display is present because this is an "embedded" device.

So eDP is unique (as far as I know) in that it's a type of display
that has an EDID but that we will report "a display is here" before
we've powered up the display and before we can read the EDID.


> > b) For something with an external connector (DP and HDMI) you don't
> > even know they're inserted unless the EDID is ready to read (these
> > devices are, essentially, always powered).
>
> Usually there are two elements which are not the same:
>
> 1. HotPlug signal/wire.
>
> 2. EDID reading logic.
>
> The logic responsible for reading EDID needs to be enabled only for time
> required for EDID reading :) So it's power state often must be
> controlled explicitly by the bridge driver. So even if in many cases
> pre_enable powers on the logic for EDID reading it does not make it the
> rule, so I must step back from my claim that it is up to caller :)

OK, I'll plan to keep it in the bridge chip driver now.


> > So I started off trying to do this in the core for eDP, but then it
> > wasn't completely clear how to write this code in a way that was super
> > generic. Specifically:
> >
> > 1. I don't think it's a 100% guarantee that everything is powered on
> > in pre-enable and powered off in post-disable. In this bridge chip
> > it's true, but maybe not every eDP driver? Would you want me to just
> > assume this, or add a flag?
>
> Ok, pre_enable should power on the chip, but for performing
> initialization of video transport layer. Assumption it will power on
> EDID logic is incorrect, so my claim seems wrong, but also this patch
> looks incorrect :)
>
> In general only device containing EDID logic knows how to power it up.

I still believe my patch is correct. Specifically I don't need to make
any assumptions about display elements upstream of me (sources of the
bridge chip). I only need to make assumptions about the pre-enable of
the bridge driver itself and anything downstream of it.

At the moment downstream of this particular bridge chip is always a
panel device. Even further, all known downstream devices are
"simple-panel". That is known to power up the panel enough to read the
EDID in the "prepare" stage.

Sure, someone _could_ add another bridge downstream in some design,
but it would be up to that person to either fix that downstream driver
to power itself in pre-enable or to add some type of quirk disabling
the EDID reading.


> Since I do not know your particular case I can propose few possible ways
> to investigate:
>
> - call bridge.next->get_modes - you leave responsibility for powering up
> to the downstream device.

The "next" bridge is the panel, so I don't think this works.


> - ddc driver on i2c request should power up the panel - seems also correct,

Right, so I could put the
"drm_bridge_chain_pre_enable(&pdata->bridge)" into the
ti_sn_aux_transfer() function. I talked about that a little bit "after
the cut" in my post where I said:

> - If everyone loves the "runtime PM" in the panel driver then we
>   could, in theory, put the pre-enable chaining straight in the "aux
>   transfer" function.

The reason for the dependence on "runtime PM" in the panel driver is
that we are doing DDC over AUX and it breaks the EDID reading into
lots of chunks so if we did the powering up and powering down there it
would be crazy slow without the delayed poweroff.

-Doug
