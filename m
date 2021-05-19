Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2326138985E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 23:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhESVHj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 17:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhESVHj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 17:07:39 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F08C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 14:06:19 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id f8so11247547qth.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 14:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rrV0j7YUVvQ9ro0u0QUGjNvrEZGZrHvU5ryrt5YfeRs=;
        b=U1IFwZKjSALWLmQnkWT+FZ6THaCzRnuvs9LNdLOH1gdUwrJcSljJp2mdbv0j0f67Hp
         GGdvJkHB5QAc8gaH+BnQ61h+VgY4bkBdafPs/9u0BfMU7hzI8Ot6rMCdrAdfNeTZVI21
         wip7kua1Tq13mnLBds/XBerje9kPZExpHBe5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rrV0j7YUVvQ9ro0u0QUGjNvrEZGZrHvU5ryrt5YfeRs=;
        b=WV7FqLR8IL5jzPPdcRtWbe1l4YNai/nsgck8z8umGMrgDaPmvVkPX0E+wYwXsaIodt
         qlME/Ol3kp1iMcyXoHGwO4MraY8DeFq36VOiy4qcetgiklkZR1HlVQSbOuD7Ns9JlRpH
         uPPIXSSifD9R/nx8ZQnCF1+OEkAaK8LDwSM8gJoro4m7rjgkUhwgROQUWj3J1e8nHP4S
         0TQ1S+ewVrGPIgaP01Vlya5Yr/rdooh9W+ucxKiMinUZEhhjIkBnKTSnMVBKSg5wReNB
         58OoGRyDKNz5lIXBy3m8PkiG/oJUkRd04d01/M4gjA0Sezliv1afadYP6tcWLK/cIQeW
         Oaww==
X-Gm-Message-State: AOAM5310CXuWDvMqjehPizvdASdcczBcq6oQ1zBrlQRMKG5M8p1jJjv1
        lRKQ8lz+6nPNUz0Ku6lcVo7+OwRYK1D/PA==
X-Google-Smtp-Source: ABdhPJxZJMhF4DRUuHy/zV/xNH6+0KxKWHIEO1AbmxUrDEGNC56mlDX1xMbu7oOQhyDuEKkGHV6irg==
X-Received: by 2002:ac8:58cc:: with SMTP id u12mr1628479qta.302.1621458378224;
        Wed, 19 May 2021 14:06:18 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id h5sm726434qkg.122.2021.05.19.14.06.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 14:06:17 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id y36so3340684ybi.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 14:06:17 -0700 (PDT)
X-Received: by 2002:a25:734e:: with SMTP id o75mr2168098ybc.405.1621458376733;
 Wed, 19 May 2021 14:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid> <20210519200156.GA3535665@robh.at.kernel.org>
In-Reply-To: <20210519200156.GA3535665@robh.at.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 19 May 2021 14:06:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XNaB8fVvwwHPgo8wPmG3EmJ68u_3o8qpPXn4YobNokAA@mail.gmail.com>
Message-ID: <CAD=FV=XNaB8fVvwwHPgo8wPmG3EmJ68u_3o8qpPXn4YobNokAA@mail.gmail.com>
Subject: Re: [PATCH v7 03/10] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
To:     Rob Herring <robh@kernel.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linus W <linus.walleij@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 19, 2021 at 1:02 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, May 17, 2021 at 01:09:00PM -0700, Douglas Anderson wrote:
> > We want to be able to list an eDP panel as a child of a ti-sn65dsi86
> > node to represent the fact that the panel is connected to the bridge's
> > DP AUX bus. Though the panel and the bridge chip are connected in
> > several ways, the DP AUX bus is the primary control interface between
> > the two and thus makes the most sense to model in device tree
> > hierarchy.
> >
> > Listing a panel in this way makes it possible for the panel driver to
> > easily get access to the DP AUX bus that it resides on, which can be
> > useful to help in auto-detecting the panel and for turning on various
> > bits.
> >
> > NOTE: it's still possible to continue using the bridge chip and point
> > to a panel that _isn't_ listed as a child of the bridge chip (since
> > it's worked that way previously), but that should be deprecated since
> > there is no downside to listing the panel under the bridge chip.
> >
> > The idea for this bus's design was hashed out over IRC [1].
> >
> > [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Possibly we might want something fancier that could be included by
> > other eDP controller bindings. If we want to do this, I'd love to be
> > pointed at a good example to follow.
> >
> > Changes in v7:
> > - ti-sn65dsi86: Add aux-bus child patch new for v7.
> >
> >  .../bindings/display/bridge/ti,sn65dsi86.yaml | 22 ++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > index 26932d2e86ab..51f5a29e216c 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > @@ -70,6 +70,11 @@ properties:
> >      const: 1
> >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> >
> > +  aux-bus:
>
> As this is a node:
>
> type: object
>
> > +    description:
> > +      It is recommended that you place your panel under the aux-bus node
> > +      here to represent the control hierarchy.
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> > @@ -201,11 +206,26 @@ examples:
> >
> >            port@1 {
> >              reg = <1>;
> > -            endpoint {
> > +            sn65dsi86_out: endpoint {
> >                remote-endpoint = <&panel_in_edp>;
> >              };
> >            };
> >          };
> > +
> > +        aux-bus {
> > +          panel {
>
> We should perhaps have a separate aux-bus schema.

Yeah. Before spending lots of time digging into how to do this I
wanted to see if anyone was going to give me a big-old NAK on the
whole approach. ;-)

I guess I'd make a file called "dp-aux-bus.yaml" (maybe right under
bindings/display?) and then I'd include it like this:

aux-bus:
  $ref: "../dp-aux-bus.yaml#"


> Something should
> define the child node is 'panel' and nothing else.

At the moment the code also requires that the node name is 'aux-bus'.
Any objections to that?


> Though perhaps
> connectors are valid too?

They might be. We could always add it later?
