Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30B0051CA32
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 22:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiEEUNr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 16:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384245AbiEEUNq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 16:13:46 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C745F8F2
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 13:10:04 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id h10so9509837ybc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 13:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hOBKsucs0VoUPv/ALOPSMFwlNoeZVWvVSpsNHH3v3zU=;
        b=AA4C9n9/uPzc3x67Qqo7tjqnHMmEZimQVSDWh4HJZXGp7PnLD/AF78D6a6NbXnMsAT
         T4B0XxP2sNU9lct8SNzj++iDDnvMVCr/ERNSJuuDGVmFG7qSCu/kgLE5KSGiJeyJ9Hkm
         ks8Dnxeu+Gg5dJQEw9UkTbwD6BfpNHVTvEVa5IXPpnDlJyMBwyPLPKpmhDZ9a5+ISxMw
         x9KbYot9lU6PUU0JvPXf+LnL0t55esNfWMgLg1C2spBnj/0BuTNUAhHATjXWZDuXZVYy
         rtZDivqTbrX9lbY5KPQbgE1g70cdpZs6Xz36VyROHSF5JDUItQATRGBigfY3/MTP4zgL
         Hv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hOBKsucs0VoUPv/ALOPSMFwlNoeZVWvVSpsNHH3v3zU=;
        b=LrnfgXluMQopEL6wrSe0bZcHrl8zGZxe+uSQQ1eXdKGPJaawVbWa5ndjBLKgd4irgx
         tMS9lGhUDr5+1X+UxE3R/Xze3YHlmdnLD+glhP9ojfZQFdkTy0YOjod6P6QX3xgHorix
         /KOX7uW3MqltH/IZjno9V1DwrIu65O7jnxIZWkBSGVbMzG/HMNi9A2JHwap8xemIkKBn
         JX1Lqu4kECZr3aj5E8Nry3k6g8TtW8hqCAdOdg5tSeEqBXoOg6x7BlXVJ3laA3xx84Vf
         QhhMO7RuUKQ2N2h/NOgnhnBM5otY9mmDlOPeLLwFxz8rzThhvZ1VgTUUWDTXUq5NpHpV
         aRWA==
X-Gm-Message-State: AOAM530oPk9HLDuTOeCTBcpE9GWbPit8d4gdP7P0Ei3wR45nQbLNLk7+
        PVJTpEHI8DaFIqE/TM3EZcA4trAjHVtwJhiP0Gk8mw==
X-Google-Smtp-Source: ABdhPJwyvj9Iu2S8yS4YkWxx3iqyEMXrgK0r+Ye2GfjGKei4OPTpV0P5QARLOdRc6osLtJqC6ZZM/RCL4bH33VYoBQQ=
X-Received: by 2002:a25:c0d7:0:b0:64a:250:996c with SMTP id
 c206-20020a25c0d7000000b0064a0250996cmr9154563ybf.512.1651781403278; Thu, 05
 May 2022 13:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
 <YnJv3B/85hTz54SC@intel.com> <CAD=FV=WndmKuEB0=OVQP9YuJaSmD0uxkNs5LE0wWsFj7gBvhBA@mail.gmail.com>
 <1c6c9fde6e85f09cc89ea8dc6e8716fef58f3ee1.camel@redhat.com>
 <YnPjO4kbjezQl5Da@intel.com> <CAD=FV=XbZEagm5qR207mcVm1Ry=bGeuRAqTYx3SBoZfyo6fSkg@mail.gmail.com>
 <YnPoYsnx7IeBfJ5D@intel.com> <CAD=FV=WxxEGM4cLBHGMeRBFDAXGJJF105kLZ588JSFJRg8PM8A@mail.gmail.com>
In-Reply-To: <CAD=FV=WxxEGM4cLBHGMeRBFDAXGJJF105kLZ588JSFJRg8PM8A@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 5 May 2022 23:09:48 +0300
Message-ID: <CAA8EJppSof0wZ9nph8v_2pgRZj2BJiZ1hTBfLgQ+CFsT+h_dyQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Document that power requirements for DP AUX transfers
To:     Doug Anderson <dianders@chromium.org>
Cc:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Lyude Paul <lyude@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Maxime Ripard <maxime@cerno.tech>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 5 May 2022 at 18:53, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, May 5, 2022 at 8:29 AM Ville Syrj=C3=A4l=C3=A4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Thu, May 05, 2022 at 08:00:20AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Thu, May 5, 2022 at 7:46 AM Ville Syrj=C3=A4l=C3=A4
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Wed, May 04, 2022 at 02:10:08PM -0400, Lyude Paul wrote:
> > > > > On Wed, 2022-05-04 at 09:04 -0700, Doug Anderson wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On Wed, May 4, 2022 at 5:21 AM Ville Syrj=C3=A4l=C3=A4
> > > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > > > >
> > > > > > > On Tue, May 03, 2022 at 04:21:08PM -0700, Douglas Anderson wr=
ote:
> > > > > > > > When doing DP AUX transfers there are two actors that need =
to be
> > > > > > > > powered in order for the DP AUX transfer to work: the DP so=
urce and
> > > > > > > > the DP sync. Commit bacbab58f09d ("drm: Mention the power s=
tate
> > > > > > > > requirement on side-channel operations") added some documen=
tation
> > > > > > > > saying that the DP source is required to power itself up (i=
f needed)
> > > > > > > > to do AUX transfers. However, that commit doesn't talk anyt=
hing about
> > > > > > > > the DP sink.
> > > > > > > >
> > > > > > > > For full fledged DP the sink isn't really a problem. It's e=
xpected
> > > > > > > > that if an external DP monitor isn't plugged in that attemp=
ting to do
> > > > > > > > AUX transfers won't work. It's also expected that if a DP m=
onitor is
> > > > > > > > plugged in (and thus asserting HPD) that it AUX transfers w=
ill work.
> > > > > > > >
> > > > > > > > When we're looking at eDP, however, things are less obvious=
. Let's add
> > > > > > > > some documentation about expectations. Here's what we'll sa=
y:
> > > > > > > >
> > > > > > > > 1. We don't expect the DP AUX transfer function to power on=
 an eDP
> > > > > > > > panel. If an eDP panel is physically connected but powered =
off then it
> > > > > > > > makes sense for the transfer to fail.
> > > > > > >
> > > > > > > I don't agree with this. I think the panel should just get po=
wred up
> > > > > > > for AUX transfers.
> > > > > >
> > > > > > That's definitely a fair thing to think about and I have at tim=
es
> > > > > > thought about trying to make it work that way. It always ends u=
p
> > > > > > hitting a roadblock.
> > > >
> > > > How do you even probe the panel initially if you can't power it on
> > > > without doing some kind of full modeset/etc.?
> > >
> > > It's not that we can't power it on without a full modeset. It' that a=
t
> > > panel probe time all the DRM components haven't been hooked together
> > > yet, so the bridge chain isn't available yet. The panel can power
> > > itself on, though. This is why the documentation I added says: "if a
> > > panel driver is initiating a DP AUX transfer it may power itself up
> > > however it wants"
> > >
> > >
> > > > > > The biggest roadblock that I recall is that to make this work t=
hen
> > > > > > you'd have to somehow ensure that the bridge chain's pre_enable=
() call
> > > > > > was made as part of the AUX transfer, right? Since the transfer
> > > > > > function can be called in any context at all, we have to coordi=
nate
> > > > > > this with DRM. If, for instance, DRM is mid way through powerin=
g the
> > > > > > panel down then we need to wait for DRM to fully finish powerin=
g down,
> > > > > > then we need to power the panel back up. I don't believe that w=
e can
> > > > > > just force the panel to stay on if DRM is turning it off becaus=
e of
> > > > > > panel power sequencing requirements. At least I know it would h=
ave the
> > > > > > potential to break "samsung-atna33xc20.c" which absolutely need=
s to
> > > > > > see the panel power off after it's been disabled.
> > > > > >
> > > > > > We also, I believe, need to handle the fact that the bridge cha=
in may
> > > > > > not have even been created yet. We do AUX transfers to read the=
 EDID
> > > > > > and also to setup the backlight in the probe function of panel-=
edp. At
> > > > > > that point the panel hasn't been linked into the chain. We had =
_long_
> > > > > > discussions [1] about moving these out of probe and decided tha=
t we
> > > > > > could move the EDID read to be later but that it was going to r=
eally
> > > > > > ugly to move the AUX backlight later. The backlight would end u=
p
> > > > > > popping up at some point in time later (the first call to panel
> > > > > > prepare() or maybe get_modes()) and that seemed weird.
> > > > > >
> > > > > > [1]
> > > > > > https://lore.kernel.org/lkml/CAD=3DFV=3DU5-sTDLYdkeJWLAOG-0wgxR=
49VxtwUyUO7z2PuibLGsg@mail.gmail.com/
> > > > > >
> > > > > >
> > > > > > > Otherwise you can't trust that eg. the /dev/aux
> > > > > > > stuff is actually usable.
> > > > > >
> > > > > > Yeah, it's been on my mind to talk more about /dev/aux. I think
> > > > > > /dev/aux has some problems, at least with eDP. Specifically:
> > > > > >
> > > > > > 1. Even if we somehow figure out how to power the panel on as p=
art of
> > > > > > the aux transfer, we actually _still_ not guaranteed to be able=
 to
> > > > > > talk to it as far as I understand. My colleague reported to me =
that on
> > > > > > a system he was working with that had PSR (panel self refresh) =
that
> > > > > > when the panel was powered on but in PSR mode that it wouldn't =
talk
> > > > > > over AUX. Assuming that this is correct then I guess we'd also =
have to
> > > > > > do even more coordination with DRM to exit PSR and block future
> > > > > > transitions of PSR. (NOTE: it's always possible that my colleag=
ue ran
> > > > > > into some other bug and that panels are _supposed_ to be able t=
o talk
> > > > > > in PSR. If you think this is the case, I can always try to dig =
more).
> > > > >
> > > > > TBH - the coordination with drm I don't think would be the diffic=
ult part, as
> > > > > we'd just need to add some sort of property (ideally invisible to=
 userspace)
> > > > > that can be used in an atomic commit to disable PSR - similar to =
how we enable
> > > > > CRC readback from sysfs in the majority of DRM drivers. That bein=
g said
> > > > > though, I think we can just leave the work of solving this proble=
m up to
> > > > > whoever ends up needing this to work.
> > > >
> > > > The driver should just disable/prevent PSR when doing AUX if the ha=
rdware
> > > > can't guarantee the PSR and AUX won't interfere with each other.
> > >
> > > OK, fair enough. If we can solve the PSR problem that would be great.
> > >
> > >
> > > > For i915 we have no problems with powering the panel on for AUX, bu=
t
> > > > there is still a race with PSR vs. AUX because both use the same ha=
rdware
> > > > internally. I've been nagging at people to fix this for i915 but I =
don't
> > > > think it still got done :( Originally we were supposed to get a har=
dware
> > > > mutex for this but that plan got scrapped for some reason.
> > >
> > > I haven't looked at the i915 DRM code much, but my understanding is
> > > that it's more of an "all in one" approach. The one driver pretty muc=
h
> > > handles everything itself. That means that powering the panel up isn'=
t
> > > too hard. Is that right?
> >
> > Yeah, we don't have too many "helpful" abstractions in the way ;)
> >
> > > > > > for userspace to be mucking with /dev/aux. For DP's case I gues=
s
> > > > > > /dev/aux is essentially enabling userspace drivers to do things=
 like
> > > > > > update firmware on DP monitors or play with the backlight. I gu=
ess we
> > > > > > decided that we didn't want to add drivers in the kernel to han=
dle
> > > > > > this type of stuff so we left it for userspace? For eDP, though=
, there
> > > > >
> > > > > The main reason DP AUX got exposed to userspace in the first plac=
e was for
> > > > > usecases like fwupd,
> > > >
> > > > My memory says the original reason was debugging. Or at least I had
> > > > no idea fwupd had started to use this until I saw some weird lookin=
g
> > > > DPCD addresses in some debug log.
> > > >
> > > > But I suppose it's possible there were already plans for firmware
> > > > updates and whatnot and it just wasn't being discussed when this wa=
s
> > > > being developed.
> > >
> > > If it's just for debugging, I'd argue that leaving it as-is should be
> > > fine. Someone poking around with their system can find a way to make
> > > sure that the panel stays on.
> >
> > That could require altering the state of the system quite a bit, which
> > may defeat the purpose.
>
> It does? In my experience you just need to make sure that the panel is
> turned on. ...or are you saying that you'd use this for debugging a
> case where the system isn't probing properly?
>
> If things are truly in bad shape, at least on boards using device tree
> it's easy to tweak the device tree to force a regulator to stay on. I
> suppose we could also add a "debugfs" entry for the panel that also
> forces it to be powered on.
>
>
> >  At least I would not be willing to accept such
> > a limitation.
>
> Hmm, so where does that leave us? Are you against landing this patch?
> I've done a lot of cleanups recently and I just don't think I have the
> time to rework all the AUX transfer functions and figure out how to
> power the panel. It also seems like a lot of added complexity for a
> debug path.

If my 2c counts, I support landing this patch. It clearly documents
current behaviour and expectations.

If that helps,
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As for the /dev/aux, question, I think we can make the following plan work:
- Document that eDP panel power up can be handled by using the
pm_runtime API (which is the case for both panel-edp and atna33xc20)).
I think this is a sensible requirement anyway. And both panels show
how to handle different poweron/poweroff timings.
- Make drm_dp_aux_dev_get_by_minor() pm_runtime_get() the attached panel.

> > > This is similar to how if you're poking
> > > around with /dev/i2c it's up to you to make sure that the i2c device
> > > you're poking at stays powered.


--=20
With best wishes
Dmitry
