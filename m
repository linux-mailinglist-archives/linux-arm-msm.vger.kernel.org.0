Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8E734AD05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 18:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhCZRAt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 13:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhCZRAT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 13:00:19 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61CC3C0613AA
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 10:00:19 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so5815646otb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CCaRlm60DD1kgv4TpSY/S1ZCm/90uPl6VPbIULsGo/Q=;
        b=Ph9WGOI6IFMt46qfPACyUI6rVzEWOqAiJsBIx6lTvH15NePGAC5IJDbGR557qcapfD
         peacnYb/4uE88Zb6RCQylrHnQSlqI4RkIxP+EDEnzICST8hjm8LOQ7z4n9akr8O8JjlL
         I+uHsD30PMZXRPkNqOeU9atnxuKLJj63w1mNvEoKLeXrTrEMn+201JCJr0NkU2y39j+3
         Vo9MvE2vdYtsNXOMg+R3fE7CMU8IzU5kNqoQI3fHEhrCKXjTTh/wzBMpWW46Kfqb0aTQ
         fIC7qlFVeQPhHsr+8x7C6h5yfMwfI534oLQD1GvgtnGqiY8GUzpBX+KgmYS+wPp9nXON
         FOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CCaRlm60DD1kgv4TpSY/S1ZCm/90uPl6VPbIULsGo/Q=;
        b=htWI+3eZmqhCIjJtY2r/Rk3yYcItAbru3qm5sLkr/gPAA6F/K54mOTYPQgJgtErdTS
         3hParNitMbdHgkygKtEXJP4IZX6ilBemuB+llNFxCuSO8ZEx16tn7VLYhopr2nzmQ+ek
         gS4OWUboCaykjL2roaP+LvCq4p/6ZYE1/1dWY6tysYOMr9/jotR1QNQhAbD6UtrBAulj
         hBvfHk6HVrjzPPTE53hfJldbOS+DWd1//2HA8HuUg3BWNLVQxUBQEjZ4WulLC8djnrMF
         ym93hmF9uyAWHmqz5ayL1xFXmJz89D7owIvgQx4+TSOr5dKAN3I+Iw9p4zvxQhD46IhC
         jFBw==
X-Gm-Message-State: AOAM531+AjhzNa5/aTkcpLfgNjkLm3nHeOufzS/hgBDuZa0Bp+huSeOE
        DgN/+gLobnBc7IxEervp23liJA==
X-Google-Smtp-Source: ABdhPJyd52yvBnKopMqwJXudg77BvNjPS7YnMNISPevFhSu6C7Esh7bNl/4ZziDgxSIyCj73omNQzw==
X-Received: by 2002:a9d:7d13:: with SMTP id v19mr12989397otn.370.1616778018671;
        Fri, 26 Mar 2021 10:00:18 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u1sm2173541otj.43.2021.03.26.10.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:00:18 -0700 (PDT)
Date:   Fri, 26 Mar 2021 12:00:16 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
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
        Rob Herring <robh+dt@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on
 sc7180-trogdor-pompom
Message-ID: <20210326170016.GB904837@yoga>
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
 <YFKQaXOmOwYyeqvM@google.com>
 <CAF6AEGtu+GBwYfkH3x=UuPs5Ouj0TxqbVjpjFEtMKKWvd1-Gbg@mail.gmail.com>
 <YF3V8d4wB6i81fLN@orome.fritz.box>
 <CAF6AEGvS6Pnd-m-boqPEZdDY+VCkV5M8Ob9n6UiYWs_DxrPopQ@mail.gmail.com>
 <CAF6AEGvPN90RGP8hYXtAksJpGc4Sf5tRpNwNnV6=sxKei0Ms6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvPN90RGP8hYXtAksJpGc4Sf5tRpNwNnV6=sxKei0Ms6A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 26 Mar 10:24 CDT 2021, Rob Clark wrote:

> On Fri, Mar 26, 2021 at 8:18 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, Mar 26, 2021 at 5:38 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > On Wed, Mar 17, 2021 at 06:53:04PM -0700, Rob Clark wrote:
> > > > On Wed, Mar 17, 2021 at 4:27 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > >
> > > > > On Tue, Mar 16, 2021 at 02:08:19PM -0700, Douglas Anderson wrote:
> > > > > > The sc7180-trogdor-pompom board might be attached to any number of a
> > > > > > pile of eDP panels. At the moment I'm told that the list might include:
> > > > > > - KD KD116N21-30NV-A010
> > > > > > - KD KD116N09-30NH-A016
> > > > > > - Starry 2081116HHD028001-51D
> > > > > > - Sharp LQ116M1JW10
> > > > > >
> > > > > > It should be noted that while the EDID programmed in the first 3
> > > > > > panels indicates that they should run with exactly the same timing (to
> > > > > > keep things simple), the 4th panel not only needs different timing but
> > > > > > has a different resolution.
> > > > > >
> > > > > > As is true in general with eDP panels, we can figure out which panel
> > > > > > we have and all the info needed to drive its pixel clock by reading
> > > > > > the EDID. However, we can do this only after we've powered the panel
> > > > > > on. Powering on the panels requires following the timing diagram in
> > > > > > each panel's datasheet which specifies delays between certain
> > > > > > actions. This means that, while we can be quite dynamic about handling
> > > > > > things we can't just totally skip out on describing the panel like we
> > > > > > could do if it was connected to an external-facing DP port.
> > > > > >
> > > > > > While the different panels have slightly different delays, it's
> > > > > > possible to come up with a set of unified delays that will work on all
> > > > > > the panels. From reading the datasheets:
> > > > > > * KD KD116N21-30NV-A010 and KD KD116N09-30NH-A016
> > > > > >   - HPD absent delay: 200 ms
> > > > > >   - Unprepare delay: 150 ms (datasheet is confusing, might be 500 ms)
> > > > > > * Starry 2081116HHD028001-51D
> > > > > >   - HPD absent delay: 100 ms
> > > > > >   - Enable delay: (link training done till enable BL): 200 ms
> > > > > >   - Unprepare delay: 500 ms
> > > > > > * Sharp LQ116M1JW10
> > > > > >   - HPD absent delay: 200 ms
> > > > > >   - Unprepare delay: 500 ms
> > > > > >   - Prepare to enable delay (power on till backlight): 100 ms
> > > > > >
> > > > > > Unified:
> > > > > > - HPD absent delay: 200 ms
> > > > > > - Unprepare delay: 500 ms
> > > > > > - Enable delay: 200 ms
> > > > > >
> > > > > > NOTE: in theory the only thing that we _really_ need unity on is the
> > > > > > "HPD absent delay" since once the panel asserts HPD we can read the
> > > > > > EDID and could make per-panel decisions if we wanted.
> > > > > >
> > > > > > Let's create a definition of "a panel that can be attached to pompom"
> > > > > > as a panel that provides a valid EDID and can work with the standard
> > > > > > pompom power sequencing. If more panels are later attached to pompom
> > > > > > then it's fine as long as they work in a compatible way.
> > > > > >
> > > > > > One might ask why we can't just use a generic string here and provide
> > > > > > the timings directly in the device tree file. As I understand it,
> > > > > > trying to describe generic power sequencing in the device tree is
> > > > > > frowned upon and the one instance (SD/MMC) is regarded as a mistake
> > > > > > that shouldn't be repeated. Specifying a power sequence per board (or
> > > > > > per board class) feels like a reasonable compromise. We're not trying
> > > > > > to define fully generic power sequence bindings but we can also take
> > > > > > advantage of the semi-probable properties of the attached device.
> > > > > >
> > > > > > NOTE: I believe that past instances of supporting this type of thing
> > > > > > have used the "white lie" approach. One representative panel was
> > > > > > listed in the device tree. The power sequencings of this
> > > > > > representative panel were OK to use across all panels that might be
> > > > > > attached and other differences were handled by EDID. This patch
> > > > > > attempts to set a new precedent and avoid the need for the white lie.
> > > > > >
> > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > ---
> > > > >
> > > > > Sounds reasonable to me if DT maintainers can live with this abstract
> > > > > hardware definition. It's clearer than the 'white lie' approach.
> > > >
> > > > Yeah, it is a weird grey area between "discoverable" and "not
> > > > discoverable".. but I favor DT reflecting reality as much as
> > > > possible/feasible, so I think this is definity cleaner than "white
> > > > lies"
> > >
> > > This is practically no different than the "white lie". I suppose you
> > > could perhaps call it "more honest", if you want.
> > >
> > > The point remains that unless we describe exactly which panel we're
> > > dealing with, we ultimately have no way of properly quirking anything if
> > > we ever have to. Also, once we allow this kind of wildcard we can
> > > suddenly get into a situation where people might want to reuse this on
> > > something that's not at all a google-pompom board because the same
> > > particular power sequence happens to work on on some other board.
> > >
> > > Similarly I can imagine a situation where we could now have the same
> > > panel supported by multiple different wildcard compatible strings. How
> > > is that supposed to be any cleaner than what we have now?
> > >
> > > And I still keep wondering why bootloaders can't be taught about these
> > > kinds of things. We have in the past discussed various solutions where
> > > the bootloader could detect the type of panel connected and set the
> > > proper compatible string.
> >
> > The bootloader cannot detect the panel without powering up the panel,
> > which it normally does not do if you are not in dev-mode (it would add
> > a significant amount of time to bootup, which is why we can't do this)
> 
> what if we had a sort of multi-choice panel node:
> 
>    panel: panel {
>      compatible = "panel,one-of";
>      compatible-one-of = "vendor1,panel-a", "vendor2,panel-b",
> "vendor3,panel-c";
>   };
> 
> The kernel could construct power sequence timings that are the
> superset of all the possible panels.  That seems about as explicit as
> we could get in this sort of case.
> 

Being able to express a "panel selector" like this would certainly be
helpful in a number of phones, where a set of gpios or adc values are
read to determine which panel is actually mounted.

This is easier to do in the bootloader than your case, but the
bootloaders I've seen doing this have a tendency to come with a
dependency on the DT structure - which wouldn't match the upstream
approved DT bindings...

Regards,
Bjorn
