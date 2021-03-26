Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A8D34AB5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 16:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhCZPVF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 11:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhCZPUz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 11:20:55 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E62AC0613AA;
        Fri, 26 Mar 2021 08:20:54 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id o16so6067770wrn.0;
        Fri, 26 Mar 2021 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lPRySIrAZUbnSwJVJcGIGf5ssDCjqjYfTegZRn13vGA=;
        b=QZb9bL1/JAnIZfavqh3ro13f5v09S69FF0dN7zHGY/P15Sjx3o3jJOK0oOzYql/Tom
         1AiYxCLXS1e24iE4+9PAUjo6ZIV5XCKXh8cNhMp0NF8p1+ehp9NQtlTJE93+Zolhfhn8
         /NS1OaENF1kwu+UDu8QwCeJyknflrkH82sWRLyeBKLlQtUqG2RrJOx4SBUxzUxVIULS8
         U8WS3jZlWoaaYp23dUhtzETnyQCP8S72sfyzD/LeKAzOECUijSarZ8kZ7csmHLV88tZc
         JrbbCds/jkWCz9pKvz+Yr+pVG+CUMmAS7mseQUm/FGaHIWLjcBENGLHMB8eK5/TG9GFG
         WWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lPRySIrAZUbnSwJVJcGIGf5ssDCjqjYfTegZRn13vGA=;
        b=JetIGXS/E3xr8ZyvwI8NZIO4PPf+eVp3M0pIL8i5C6dYi62TJuXm6R1/R/ODttg4EN
         UogtnQy6PRcBHQhw1oWDSBG9Y0U+tIQGwQI/FyoyVJiVcoBsCgZ78NLuckMdCHQOcFtY
         a64j+Fs8XF6+3A/uo6BY65lYDN92OmMQaZ/4IL1S0KGxk2RYXsCwlVxfVnb5nPRGsg/f
         TmCPA9GUgyyLiPnoSdD+oX1qDuMTZeMv5iz/uT1/QndmgyVxlHmT7br3Lnk52j0H4wKW
         fEhzHxeM/2UKb9qPy9Z7s3gg2jSU/8BJcFVhza50+BKzCVxV7QvPHPwcKVp9Cbe/6UU9
         bBQg==
X-Gm-Message-State: AOAM530UC+opS914T0KDIKeifWNLb21/BB4uESZXQKtEWPqcll1vg+oy
        AudHlrdI5PYzzm4eTv4f5GURFVOYet71VQukHOU=
X-Google-Smtp-Source: ABdhPJyzVitUNA25Rd3vUY8wbTimAgjGqRGnR5fLMBhxSjrhKHgbTnoTFfE4g7iQeDCwSRgKUvVCHAxPKkgUpmtYY/U=
X-Received: by 2002:a5d:640b:: with SMTP id z11mr14756594wru.327.1616772052944;
 Fri, 26 Mar 2021 08:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
 <YFKQaXOmOwYyeqvM@google.com> <CAF6AEGtu+GBwYfkH3x=UuPs5Ouj0TxqbVjpjFEtMKKWvd1-Gbg@mail.gmail.com>
 <YF3V8d4wB6i81fLN@orome.fritz.box> <CAF6AEGvS6Pnd-m-boqPEZdDY+VCkV5M8Ob9n6UiYWs_DxrPopQ@mail.gmail.com>
In-Reply-To: <CAF6AEGvS6Pnd-m-boqPEZdDY+VCkV5M8Ob9n6UiYWs_DxrPopQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 26 Mar 2021 08:24:06 -0700
Message-ID: <CAF6AEGvPN90RGP8hYXtAksJpGc4Sf5tRpNwNnV6=sxKei0Ms6A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on sc7180-trogdor-pompom
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
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
        Rob Herring <robh+dt@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 26, 2021 at 8:18 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Mar 26, 2021 at 5:38 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > On Wed, Mar 17, 2021 at 06:53:04PM -0700, Rob Clark wrote:
> > > On Wed, Mar 17, 2021 at 4:27 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > >
> > > > On Tue, Mar 16, 2021 at 02:08:19PM -0700, Douglas Anderson wrote:
> > > > > The sc7180-trogdor-pompom board might be attached to any number of a
> > > > > pile of eDP panels. At the moment I'm told that the list might include:
> > > > > - KD KD116N21-30NV-A010
> > > > > - KD KD116N09-30NH-A016
> > > > > - Starry 2081116HHD028001-51D
> > > > > - Sharp LQ116M1JW10
> > > > >
> > > > > It should be noted that while the EDID programmed in the first 3
> > > > > panels indicates that they should run with exactly the same timing (to
> > > > > keep things simple), the 4th panel not only needs different timing but
> > > > > has a different resolution.
> > > > >
> > > > > As is true in general with eDP panels, we can figure out which panel
> > > > > we have and all the info needed to drive its pixel clock by reading
> > > > > the EDID. However, we can do this only after we've powered the panel
> > > > > on. Powering on the panels requires following the timing diagram in
> > > > > each panel's datasheet which specifies delays between certain
> > > > > actions. This means that, while we can be quite dynamic about handling
> > > > > things we can't just totally skip out on describing the panel like we
> > > > > could do if it was connected to an external-facing DP port.
> > > > >
> > > > > While the different panels have slightly different delays, it's
> > > > > possible to come up with a set of unified delays that will work on all
> > > > > the panels. From reading the datasheets:
> > > > > * KD KD116N21-30NV-A010 and KD KD116N09-30NH-A016
> > > > >   - HPD absent delay: 200 ms
> > > > >   - Unprepare delay: 150 ms (datasheet is confusing, might be 500 ms)
> > > > > * Starry 2081116HHD028001-51D
> > > > >   - HPD absent delay: 100 ms
> > > > >   - Enable delay: (link training done till enable BL): 200 ms
> > > > >   - Unprepare delay: 500 ms
> > > > > * Sharp LQ116M1JW10
> > > > >   - HPD absent delay: 200 ms
> > > > >   - Unprepare delay: 500 ms
> > > > >   - Prepare to enable delay (power on till backlight): 100 ms
> > > > >
> > > > > Unified:
> > > > > - HPD absent delay: 200 ms
> > > > > - Unprepare delay: 500 ms
> > > > > - Enable delay: 200 ms
> > > > >
> > > > > NOTE: in theory the only thing that we _really_ need unity on is the
> > > > > "HPD absent delay" since once the panel asserts HPD we can read the
> > > > > EDID and could make per-panel decisions if we wanted.
> > > > >
> > > > > Let's create a definition of "a panel that can be attached to pompom"
> > > > > as a panel that provides a valid EDID and can work with the standard
> > > > > pompom power sequencing. If more panels are later attached to pompom
> > > > > then it's fine as long as they work in a compatible way.
> > > > >
> > > > > One might ask why we can't just use a generic string here and provide
> > > > > the timings directly in the device tree file. As I understand it,
> > > > > trying to describe generic power sequencing in the device tree is
> > > > > frowned upon and the one instance (SD/MMC) is regarded as a mistake
> > > > > that shouldn't be repeated. Specifying a power sequence per board (or
> > > > > per board class) feels like a reasonable compromise. We're not trying
> > > > > to define fully generic power sequence bindings but we can also take
> > > > > advantage of the semi-probable properties of the attached device.
> > > > >
> > > > > NOTE: I believe that past instances of supporting this type of thing
> > > > > have used the "white lie" approach. One representative panel was
> > > > > listed in the device tree. The power sequencings of this
> > > > > representative panel were OK to use across all panels that might be
> > > > > attached and other differences were handled by EDID. This patch
> > > > > attempts to set a new precedent and avoid the need for the white lie.
> > > > >
> > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > ---
> > > >
> > > > Sounds reasonable to me if DT maintainers can live with this abstract
> > > > hardware definition. It's clearer than the 'white lie' approach.
> > >
> > > Yeah, it is a weird grey area between "discoverable" and "not
> > > discoverable".. but I favor DT reflecting reality as much as
> > > possible/feasible, so I think this is definity cleaner than "white
> > > lies"
> >
> > This is practically no different than the "white lie". I suppose you
> > could perhaps call it "more honest", if you want.
> >
> > The point remains that unless we describe exactly which panel we're
> > dealing with, we ultimately have no way of properly quirking anything if
> > we ever have to. Also, once we allow this kind of wildcard we can
> > suddenly get into a situation where people might want to reuse this on
> > something that's not at all a google-pompom board because the same
> > particular power sequence happens to work on on some other board.
> >
> > Similarly I can imagine a situation where we could now have the same
> > panel supported by multiple different wildcard compatible strings. How
> > is that supposed to be any cleaner than what we have now?
> >
> > And I still keep wondering why bootloaders can't be taught about these
> > kinds of things. We have in the past discussed various solutions where
> > the bootloader could detect the type of panel connected and set the
> > proper compatible string.
>
> The bootloader cannot detect the panel without powering up the panel,
> which it normally does not do if you are not in dev-mode (it would add
> a significant amount of time to bootup, which is why we can't do this)

what if we had a sort of multi-choice panel node:

   panel: panel {
     compatible = "panel,one-of";
     compatible-one-of = "vendor1,panel-a", "vendor2,panel-b",
"vendor3,panel-c";
  };

The kernel could construct power sequence timings that are the
superset of all the possible panels.  That seems about as explicit as
we could get in this sort of case.

BR,
-R


> BR,
> -R
>
> > If that's too complicated and these really are standardized interfaces
> > that work across a wide range of devices with perhaps a couple of
> > standard parameter, then introducing a standard connector type like
> > Rob Herring is suggesting makes more sense because that more properly
> > describes where exactly the standardization is going on (i.e. at the
> > interface level rather than the panel level).
> >
> > Thierry
