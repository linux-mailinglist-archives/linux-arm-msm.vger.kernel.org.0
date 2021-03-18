Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED3D33FCE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 02:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhCRBxw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 21:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhCRBxR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 21:53:17 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB58C06174A;
        Wed, 17 Mar 2021 18:53:17 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id 61so3766508wrm.12;
        Wed, 17 Mar 2021 18:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v1i0KsQ3h/jMhWbwFpzMC40inc+yYjGhis5/F6IuRMg=;
        b=ghXDIHNTetOEFrxwksmP6rkHT/cT6FkMc6GeMKOmmng1mTpWSNSM8idAOizGUMojRL
         loy+GhV/jAIPCFByU00CR1sg1Dj2go35NWVxYJRpc1kBxdxlgn7BI/t1WJ3YlOr06ORu
         DJenjLuf0NTv9UheLiyK9ii/nOOFRBEcBJqZq/r5WcKnQymCdx5aetPOv2KLOOQSyoxV
         R324HpbD472f5qAI74A/frwF84q6MIxjkP6wi/9xcjVU9SQe+YTn/IElPcb3qqdmBZcB
         lWEqBjukB/q7C7hYH65ryR2D413L9VEj4PIH1Jn3xtRkzJqbleF1GU+Mtc0g/H+LtB+F
         o1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v1i0KsQ3h/jMhWbwFpzMC40inc+yYjGhis5/F6IuRMg=;
        b=qYZv9eHhTmHwWzHhePAtwcscE8UDRNDVw++8SJriRU+5rztCG0hfefgQlZlxJ40EwS
         E71B7Q0YZgJfC8dWcJmLfc16k5qfnX+S72MUfMdGzGJbbTgBHQmdoiJC90Cx5y371eIv
         /FZJDh6qJg3T2/p9qNb8iyhYx3tJ57B9rZtgu1ZKmIcE53k1zOg/X3Kw2jwHrJ4p1697
         mqSZJ2phnoPzUvxjBUvOX/PLTfAjfuSsoJikj4KZ5DQhSMLLU0/ndyCpnXsbK+ZISmT/
         uJWIfO8lBOH8S8obY3xzj98ORapwjz+cuDtRN0L47qfrnigyhjcHUGsFFlXvNzNchxhJ
         a8Mg==
X-Gm-Message-State: AOAM530EuE14IxM01Gr2apvbDlcrYqIyX6QjDd7YlGgHRF+wkmflX63S
        QYmN2ymVin9tdljWJfWORGU2ktuEvfQplsUY8nI=
X-Google-Smtp-Source: ABdhPJzp1l2ljBrXjRJyXLSIUcbc7uR3HCZrC/smDRvMByEEPcM6+4fdLIhY0qI8M8J0QaQ7PYdClv8p8v+qQDtKNK0=
X-Received: by 2002:adf:f587:: with SMTP id f7mr7047833wro.147.1616032396097;
 Wed, 17 Mar 2021 18:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
 <YFKQaXOmOwYyeqvM@google.com>
In-Reply-To: <YFKQaXOmOwYyeqvM@google.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 17 Mar 2021 18:53:04 -0700
Message-ID: <CAF6AEGtu+GBwYfkH3x=UuPs5Ouj0TxqbVjpjFEtMKKWvd1-Gbg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on sc7180-trogdor-pompom
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
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
        Thierry Reding <thierry.reding@gmail.com>,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 17, 2021 at 4:27 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Tue, Mar 16, 2021 at 02:08:19PM -0700, Douglas Anderson wrote:
> > The sc7180-trogdor-pompom board might be attached to any number of a
> > pile of eDP panels. At the moment I'm told that the list might include:
> > - KD KD116N21-30NV-A010
> > - KD KD116N09-30NH-A016
> > - Starry 2081116HHD028001-51D
> > - Sharp LQ116M1JW10
> >
> > It should be noted that while the EDID programmed in the first 3
> > panels indicates that they should run with exactly the same timing (to
> > keep things simple), the 4th panel not only needs different timing but
> > has a different resolution.
> >
> > As is true in general with eDP panels, we can figure out which panel
> > we have and all the info needed to drive its pixel clock by reading
> > the EDID. However, we can do this only after we've powered the panel
> > on. Powering on the panels requires following the timing diagram in
> > each panel's datasheet which specifies delays between certain
> > actions. This means that, while we can be quite dynamic about handling
> > things we can't just totally skip out on describing the panel like we
> > could do if it was connected to an external-facing DP port.
> >
> > While the different panels have slightly different delays, it's
> > possible to come up with a set of unified delays that will work on all
> > the panels. From reading the datasheets:
> > * KD KD116N21-30NV-A010 and KD KD116N09-30NH-A016
> >   - HPD absent delay: 200 ms
> >   - Unprepare delay: 150 ms (datasheet is confusing, might be 500 ms)
> > * Starry 2081116HHD028001-51D
> >   - HPD absent delay: 100 ms
> >   - Enable delay: (link training done till enable BL): 200 ms
> >   - Unprepare delay: 500 ms
> > * Sharp LQ116M1JW10
> >   - HPD absent delay: 200 ms
> >   - Unprepare delay: 500 ms
> >   - Prepare to enable delay (power on till backlight): 100 ms
> >
> > Unified:
> > - HPD absent delay: 200 ms
> > - Unprepare delay: 500 ms
> > - Enable delay: 200 ms
> >
> > NOTE: in theory the only thing that we _really_ need unity on is the
> > "HPD absent delay" since once the panel asserts HPD we can read the
> > EDID and could make per-panel decisions if we wanted.
> >
> > Let's create a definition of "a panel that can be attached to pompom"
> > as a panel that provides a valid EDID and can work with the standard
> > pompom power sequencing. If more panels are later attached to pompom
> > then it's fine as long as they work in a compatible way.
> >
> > One might ask why we can't just use a generic string here and provide
> > the timings directly in the device tree file. As I understand it,
> > trying to describe generic power sequencing in the device tree is
> > frowned upon and the one instance (SD/MMC) is regarded as a mistake
> > that shouldn't be repeated. Specifying a power sequence per board (or
> > per board class) feels like a reasonable compromise. We're not trying
> > to define fully generic power sequence bindings but we can also take
> > advantage of the semi-probable properties of the attached device.
> >
> > NOTE: I believe that past instances of supporting this type of thing
> > have used the "white lie" approach. One representative panel was
> > listed in the device tree. The power sequencings of this
> > representative panel were OK to use across all panels that might be
> > attached and other differences were handled by EDID. This patch
> > attempts to set a new precedent and avoid the need for the white lie.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Sounds reasonable to me if DT maintainers can live with this abstract
> hardware definition. It's clearer than the 'white lie' approach.

Yeah, it is a weird grey area between "discoverable" and "not
discoverable".. but I favor DT reflecting reality as much as
possible/feasible, so I think this is definity cleaner than "white
lies"

Reviewed-by: Rob Clark <robdclark@gmail.com>

> It's then up to the vendor/manufacturer to ensure to only ship devices
> with panels that have compatible timings.
>
> >  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index 62b0d54d87b7..9807dbc1cceb 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > @@ -140,6 +140,10 @@ properties:
> >        - giantplus,gpg48273qs5
> >          # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
> >        - giantplus,gpm940b0
> > +        # A panel connected to a google,pompom board. Panel is guaranteed to
> > +        # confirm to google,pompom-panel power sequencing requirements and then
>
> s/confirm/conform/ ?
>
> > +        # the specific panel will be probed via EDID.
> > +      - google,pompom-panel
> >          # HannStar Display Corp. HSD070PWW1 7.0" WXGA TFT LCD panel
> >        - hannstar,hsd070pww1
> >          # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
>
> FWIW:
>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
