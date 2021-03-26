Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3916334B201
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 23:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhCZWNP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 18:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhCZWNG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 18:13:06 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C89C0613AA;
        Fri, 26 Mar 2021 15:13:06 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id b2-20020a7bc2420000b029010be1081172so3732124wmj.1;
        Fri, 26 Mar 2021 15:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ltWnH/bvsofzD2CW3kJWCR4lXIietfJIznplsGE/rhc=;
        b=gMdsd5pmChcNiQTyOcQYDwJGLPiHpHzsyIkJQREaeMyNETOlDEUF6AQme7dc2zStt9
         dEBZ5udoYo+R3KCzf1h91dA8x9wCoFmVGe0QMASadm9i7EpdOwgPv5GGgpcDtKTbSoZj
         yynZnp7esJV7nQo3rJh5P53x48eXboJ3z8OKrHXZAXfN8QUk/6JEulmKtBkR9Yfhxra7
         WiYi/etXJkK2oUzl6flIRrsIuXCAYYAbjs4TUwNoKtYISOBPfCUVzsK8ZEYbM121Mc0p
         WYsd/0gJ/JYkLh7ND4hPnMB0mt7IYS1pRDnfYN4vLKFkSK2MyOBzXVa3wCnwR9XS5ICU
         YR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ltWnH/bvsofzD2CW3kJWCR4lXIietfJIznplsGE/rhc=;
        b=sCbxFU8CvNP7WxFqLVcVwlPCfZTgVksOja5oyTfkKDncJDLJUswrqxjpsO5JRFXGNz
         yUB1WoHXLbBYDsXIeSxR6dxu+reKr7B1kt8t5zGEs2NbJEX/I6y1zg9SA8DcCKHL98BJ
         jGeeXffuUM3UgLG1GxdWDRO0Br40P0a7PGPPjQkjyNoUSdBRLaQAiAV/x552LqbW1UYu
         j94aT7M+Avzf78ba/sQpPxMCzg6sa04fJHzy/fU5smM1mrV+D1rJbPFkgzMy+N22yAX8
         qqgxkiF7kLWXyNvOaX7MnfwIbsJ/AMLy6+FFTto9sWdKRm2+C4fIYxEedbAS3MJqRUTu
         LVTw==
X-Gm-Message-State: AOAM532YpHNwxpTCYt9v42xm70ftO1v7SdhbWFmOsPK+AJRIWBW+M0jI
        jpcUNK9UJV80oKY/t52TIp8YgOk9hK+sbfwsb2fmH/gh
X-Google-Smtp-Source: ABdhPJwtSLPOwqEIE6ION2P2YC2aCDWsBR+3dtRGXvckklSzW5vVPovDGxdm2Vb4tR68Ths8uMNCS8fqTYV4lTluHbE=
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr14805476wmc.164.1616796784890;
 Fri, 26 Mar 2021 15:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
 <YFKQaXOmOwYyeqvM@google.com> <CAF6AEGtu+GBwYfkH3x=UuPs5Ouj0TxqbVjpjFEtMKKWvd1-Gbg@mail.gmail.com>
 <YF3V8d4wB6i81fLN@orome.fritz.box> <CAF6AEGvS6Pnd-m-boqPEZdDY+VCkV5M8Ob9n6UiYWs_DxrPopQ@mail.gmail.com>
 <CAF6AEGvPN90RGP8hYXtAksJpGc4Sf5tRpNwNnV6=sxKei0Ms6A@mail.gmail.com> <CAL_JsqKk+c83GMRzpc11Naj7QDYSfHdrg-8ZnxRBBM4phemQxg@mail.gmail.com>
In-Reply-To: <CAL_JsqKk+c83GMRzpc11Naj7QDYSfHdrg-8ZnxRBBM4phemQxg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 26 Mar 2021 15:16:18 -0700
Message-ID: <CAF6AEGt3MuQPROfOn6-M1ysD_QKwShb_t3mjUJ4QDBBT_3cwRg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on sc7180-trogdor-pompom
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 26, 2021 at 12:48 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Mar 26, 2021 at 9:20 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, Mar 26, 2021 at 8:18 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Fri, Mar 26, 2021 at 5:38 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > > >
> > > > On Wed, Mar 17, 2021 at 06:53:04PM -0700, Rob Clark wrote:
> > > > > On Wed, Mar 17, 2021 at 4:27 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > > >
> > > > > > On Tue, Mar 16, 2021 at 02:08:19PM -0700, Douglas Anderson wrote:
> > > > > > > The sc7180-trogdor-pompom board might be attached to any number of a
> > > > > > > pile of eDP panels. At the moment I'm told that the list might include:
> > > > > > > - KD KD116N21-30NV-A010
> > > > > > > - KD KD116N09-30NH-A016
> > > > > > > - Starry 2081116HHD028001-51D
> > > > > > > - Sharp LQ116M1JW10
> > > > > > >
> > > > > > > It should be noted that while the EDID programmed in the first 3
> > > > > > > panels indicates that they should run with exactly the same timing (to
> > > > > > > keep things simple), the 4th panel not only needs different timing but
> > > > > > > has a different resolution.
> > > > > > >
> > > > > > > As is true in general with eDP panels, we can figure out which panel
> > > > > > > we have and all the info needed to drive its pixel clock by reading
> > > > > > > the EDID. However, we can do this only after we've powered the panel
> > > > > > > on. Powering on the panels requires following the timing diagram in
> > > > > > > each panel's datasheet which specifies delays between certain
> > > > > > > actions. This means that, while we can be quite dynamic about handling
> > > > > > > things we can't just totally skip out on describing the panel like we
> > > > > > > could do if it was connected to an external-facing DP port.
> > > > > > >
> > > > > > > While the different panels have slightly different delays, it's
> > > > > > > possible to come up with a set of unified delays that will work on all
> > > > > > > the panels. From reading the datasheets:
> > > > > > > * KD KD116N21-30NV-A010 and KD KD116N09-30NH-A016
> > > > > > >   - HPD absent delay: 200 ms
> > > > > > >   - Unprepare delay: 150 ms (datasheet is confusing, might be 500 ms)
> > > > > > > * Starry 2081116HHD028001-51D
> > > > > > >   - HPD absent delay: 100 ms
> > > > > > >   - Enable delay: (link training done till enable BL): 200 ms
> > > > > > >   - Unprepare delay: 500 ms
> > > > > > > * Sharp LQ116M1JW10
> > > > > > >   - HPD absent delay: 200 ms
> > > > > > >   - Unprepare delay: 500 ms
> > > > > > >   - Prepare to enable delay (power on till backlight): 100 ms
> > > > > > >
> > > > > > > Unified:
> > > > > > > - HPD absent delay: 200 ms
> > > > > > > - Unprepare delay: 500 ms
> > > > > > > - Enable delay: 200 ms
> > > > > > >
> > > > > > > NOTE: in theory the only thing that we _really_ need unity on is the
> > > > > > > "HPD absent delay" since once the panel asserts HPD we can read the
> > > > > > > EDID and could make per-panel decisions if we wanted.
> > > > > > >
> > > > > > > Let's create a definition of "a panel that can be attached to pompom"
> > > > > > > as a panel that provides a valid EDID and can work with the standard
> > > > > > > pompom power sequencing. If more panels are later attached to pompom
> > > > > > > then it's fine as long as they work in a compatible way.
> > > > > > >
> > > > > > > One might ask why we can't just use a generic string here and provide
> > > > > > > the timings directly in the device tree file. As I understand it,
> > > > > > > trying to describe generic power sequencing in the device tree is
> > > > > > > frowned upon and the one instance (SD/MMC) is regarded as a mistake
> > > > > > > that shouldn't be repeated. Specifying a power sequence per board (or
> > > > > > > per board class) feels like a reasonable compromise. We're not trying
> > > > > > > to define fully generic power sequence bindings but we can also take
> > > > > > > advantage of the semi-probable properties of the attached device.
> > > > > > >
> > > > > > > NOTE: I believe that past instances of supporting this type of thing
> > > > > > > have used the "white lie" approach. One representative panel was
> > > > > > > listed in the device tree. The power sequencings of this
> > > > > > > representative panel were OK to use across all panels that might be
> > > > > > > attached and other differences were handled by EDID. This patch
> > > > > > > attempts to set a new precedent and avoid the need for the white lie.
> > > > > > >
> > > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > > ---
> > > > > >
> > > > > > Sounds reasonable to me if DT maintainers can live with this abstract
> > > > > > hardware definition. It's clearer than the 'white lie' approach.
> > > > >
> > > > > Yeah, it is a weird grey area between "discoverable" and "not
> > > > > discoverable".. but I favor DT reflecting reality as much as
> > > > > possible/feasible, so I think this is definity cleaner than "white
> > > > > lies"
> > > >
> > > > This is practically no different than the "white lie". I suppose you
> > > > could perhaps call it "more honest", if you want.
> > > >
> > > > The point remains that unless we describe exactly which panel we're
> > > > dealing with, we ultimately have no way of properly quirking anything if
> > > > we ever have to. Also, once we allow this kind of wildcard we can
> > > > suddenly get into a situation where people might want to reuse this on
> > > > something that's not at all a google-pompom board because the same
> > > > particular power sequence happens to work on on some other board.
> > > >
> > > > Similarly I can imagine a situation where we could now have the same
> > > > panel supported by multiple different wildcard compatible strings. How
> > > > is that supposed to be any cleaner than what we have now?
> > > >
> > > > And I still keep wondering why bootloaders can't be taught about these
> > > > kinds of things. We have in the past discussed various solutions where
> > > > the bootloader could detect the type of panel connected and set the
> > > > proper compatible string.
> > >
> > > The bootloader cannot detect the panel without powering up the panel,
> > > which it normally does not do if you are not in dev-mode (it would add
> > > a significant amount of time to bootup, which is why we can't do this)
> >
> > what if we had a sort of multi-choice panel node:
> >
> >    panel: panel {
> >      compatible = "panel,one-of";
> >      compatible-one-of = "vendor1,panel-a", "vendor2,panel-b",
> > "vendor3,panel-c";
> >   };
> >
> > The kernel could construct power sequence timings that are the
> > superset of all the possible panels.  That seems about as explicit as
> > we could get in this sort of case.
>
> If we were to go this route, I'm inclined to say just shove all the
> possible panel compatibles into 'compatible'. That kind of breaks the
> notion of most specific to least specific. OTOH, it is saying the set
> of panels are somehow 'compatible' with each other.
>
> If there's not some level of compatibility between the panels, then
> it's still the bootloader's problem.
>

I'm not sure about this.. since there could be slight differences in
various delay params between the possible panels.  I'd prefer that in
panel-simple.c, we listed exact delay params "vendorFoo,panelBar", but
it could mean that for a device that had three possible panels the
worst case (max of all possible delays) could be higher than any
individual choice.. and I don't think we should encourage the "white
lie" approach (which will be the obvious outcome of not handling this
directly in dt IME, based on prior art).  OTOH pushing it to the
bootloader, when the bootloader actually has to power up the panel
(and abide by the necessary delays) to figure out what choice we have
isn't a viable option either.

It is better to be explicit about what we know and at the same time
about what we don't know.

BR,
-R
