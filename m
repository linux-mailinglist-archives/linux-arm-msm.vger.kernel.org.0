Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F7C1AB475
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 01:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390426AbgDOXzp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 19:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389935AbgDOXzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 19:55:43 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61570C061A0C
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 16:55:41 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id i3so760079pgk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 16:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g+3cVFHINQK8034Q5fMosJmLqjR0x/8UAQMOjZSVJrM=;
        b=hymJOGYOl8wyGrt54ea9ETuKrBuw+wFtIDoosE9VbbTh3G2do1iFapNRgpRzht7cF+
         1h4tsTDnwoUY7vgAf0B6t9n+FyslLxRcQhLeXANSqSnY1BwHGWOO/CGr+ch7TrC7Y1be
         poo1PAE0JVXRF1RDYuyH/o1HSC4r+3OiFuCMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g+3cVFHINQK8034Q5fMosJmLqjR0x/8UAQMOjZSVJrM=;
        b=ruTy1oDgwNGetKayfR69sy6wfKhhHsbSq7VE8gu6MijpD0iTxhO7IZ3/vkfzbPocXA
         Lb5xAh5oFd6qmdlAmcJnAbsc7vklmq8nwebK9xBl2OigRg7L2L1GtCcim+miRnaOM4PC
         1Ug6+VC67Zcwaba8s+b1gThw3FuuwgyNiBaVenqKfgY9HPcw3cDpP3hs5PZQ20aDlzpW
         oinh9ptcvX8f3I6R8ZUDNXmosgP2NCCuB8a+uduaNKy0zPsT/0BDc4xBme0KXG//fJH7
         pr+YJiXPLLVzB/w2xp02zl724D1yco1Eeqt+hvTBS1RKtLGEjm8dIoiCNNceIrtoGfAY
         bf2w==
X-Gm-Message-State: AGi0PuZMpmnlpzq9yARwAA5u8wS2Z08B//yWXFJzxOsMrUY09zx7nJGL
        sxQTRFt3BY60oImO4fY87KaMzNNg3lk=
X-Google-Smtp-Source: APiQypIillu6rHXhbY9wMSb6CaMEDy0ogY/cn8Cu/Gg4+inzbK98sjoGeggoGEJn9VbgdbI2xrvtKg==
X-Received: by 2002:a62:2b06:: with SMTP id r6mr29328796pfr.249.1586994940351;
        Wed, 15 Apr 2020 16:55:40 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id o187sm14866155pfb.12.2020.04.15.16.55.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 16:55:40 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id z6so645858plk.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 16:55:40 -0700 (PDT)
X-Received: by 2002:a67:1e46:: with SMTP id e67mr7126201vse.106.1586994551498;
 Wed, 15 Apr 2020 16:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
 <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
 <158698038289.105027.2860892334897893887@swboyd.mtv.corp.google.com> <20200415203256.GP4758@pendragon.ideasonboard.com>
In-Reply-To: <20200415203256.GP4758@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 15 Apr 2020 16:49:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1U7y_U4+zySzA9e_uYE0ECdM1Bd-ew0OxG3ciqjRVSA@mail.gmail.com>
Message-ID: <CAD=FV=U1U7y_U4+zySzA9e_uYE0ECdM1Bd-ew0OxG3ciqjRVSA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios
 to the bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 15, 2020 at 1:33 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 15, 2020 at 12:53:02PM -0700, Stephen Boyd wrote:
> > Quoting Douglas Anderson (2020-04-15 08:48:40)
> > > Allow people to specify to use a GPIO for hot-plug-detect.  Add an
> > > example.
> > >
> > > NOTE: The current patch adding support for hpd-gpios to the Linux
> > > driver for hpd-gpios only adds enough support to the driver so that
> > > the bridge can use one of its own GPIOs.  The bindings, however, are
> > > written generically.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  .../bindings/display/bridge/ti,sn65dsi86.yaml          | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > index 8cacc6db33a9..554bfd003000 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > @@ -60,6 +60,10 @@ properties:
> > >      const: 1
> > >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> > >
> > > +  hpd-gpios:
> > > +    maxItems: 1
> > > +    description: If present use the given GPIO for hot-plug-detect.
> >
> > Shouldn't this go in the panel node? And the panel driver should get the
> > gpio and poll it after powering up the panel? Presumably that's why we
> > have the no-hpd property in the simple panel binding vs. putting it here
> > in the bridge.
>
> Same question really, I think this belongs to the panel (or connector)
> node indeed.

Hrm.

To me "no-hpd" feels OK in the panel because the lack of a connection
is somewhat symmetric.  Thus it's OK to say either "HPD isn't hooked
up to the panel in this system" or "HPD isn't hooked up to the bridge
in this system" and both express the same thing (AKA that there is no
HPD connection between the bridge and the panel).  In the case of
"no-hpd" it's more convenient to express it on the panel side because
the panel driver is the one whose behavior has to change if HPD isn't
hooked up.  The panel datasheet is the one that says how long of a
delay we need if HPD isn't hooked up.

...but when you're talking about where the bridge driver should look
to find the HPD signal that it needs, that really feels like it should
be described as part of the bridge.  Specifically imagine we were
using our bridge for DP, not for eDP.  In that case simple-panel
wouldn't be involved because we could get any type of display plugged
in.  Thus it couldn't go in the panel node.  Here it feels clearer
that hpd-gpio needs to be a property of the bridge driver.

Looking at other usages of "hpd-gpio" in the kernel, it seems like the
usage I'm proposing is also common.  Grepping for "hpd-gpios" shows
numerous examples of "hpd-gpios" being defined at the display
controller level and (effectively) I believe the bridge is at the
equivalent level.


-Doug
