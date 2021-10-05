Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF667423427
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 01:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236923AbhJEXLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 19:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236928AbhJEXLe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 19:11:34 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2577EC061760
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 16:09:43 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id w10so948049ilc.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 16:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5W1wvotXe78j/+MNqeU+rjPexSCJXY7yIXqgs9vXVKc=;
        b=PgTVE7tw0/RORhApMfwVKtkB0G4bNDw5wo4O6NK+SDVraRv3mXXLiV70OJdI130JRy
         zFumqbEN8hHI2ZaFj3YjCKuHNrvwCH5rf2xjlws8E+UPU4nzntWAHxq/fYdFs03ZJgp2
         nVAQexy+4Xaa5CrtCu5PobNb5PKW9kvO2sy70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5W1wvotXe78j/+MNqeU+rjPexSCJXY7yIXqgs9vXVKc=;
        b=yj5ZP/M9YpMocMXzhHIeyO31xuKc+ZHY+JOefL7MnRI9bbQU5m6En0Qr+dvCVVEvNo
         YQmHNEK2TR+mP2aNc7umlTVA0eTWXmBqAS3yOkttFohnUz7tE2ajkW5EHbWKOveSQNHj
         Y65ysfxGQf5fzpLmP9dx5UvwLz4CcT0JS4A++CmtT3F1h05bJX9xDuzbr9A6Oywx/D9G
         eVlx/Xm02cMEMak/YHs9hW5I29y/bnFA3sTEI4xy0rawzmW2hSKNkgVD16b7nxBKiw3P
         PhEGVc2v7TfIFLtKIGHPvfgGlCCNY/JyC8eWPGsYqwRPjZWuxsGB88mRPRo4SgJ9D8oW
         26tQ==
X-Gm-Message-State: AOAM532cDvh1MmN0yGizsdGC8FIM4l8hWvIC4qil84nBLRfTTeE4C3rE
        9pNQWL9ltm9z/RrfiI136eq8ssRDVaiPtg==
X-Google-Smtp-Source: ABdhPJyV1aSBsUaRXBDFCuoEJQefaX5NtoA6J5bMnY2LCWfgAloxnKOqZjpB3mcCGHjks6WaNJrz2Q==
X-Received: by 2002:a05:6e02:1003:: with SMTP id n3mr4685384ilj.279.1633475382237;
        Tue, 05 Oct 2021 16:09:42 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id v63sm11388933ioe.17.2021.10.05.16.09.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 16:09:41 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id 134so749067iou.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 16:09:41 -0700 (PDT)
X-Received: by 2002:a05:6638:248a:: with SMTP id x10mr4765884jat.3.1633475380781;
 Tue, 05 Oct 2021 16:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
 <YVd3YdfgFVc0Br5T@ripper> <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
 <YVumL1lHLqtb/HKS@ripper> <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
 <YVyMwsvLl6XalJxB@ripper>
In-Reply-To: <YVyMwsvLl6XalJxB@ripper>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 5 Oct 2021 16:09:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
Message-ID: <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Vara Reddy <varar@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Oct 5, 2021 at 10:33 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 05 Oct 08:39 PDT 2021, Doug Anderson wrote:
>
> > Hi,
> >
> > On Mon, Oct 4, 2021 at 6:09 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Mon 04 Oct 17:36 PDT 2021, Doug Anderson wrote:
> > >
> > > > Hi,
> > > >
> > > > On Fri, Oct 1, 2021 at 2:00 PM Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > > >
> > > > > On Fri 27 Aug 13:52 PDT 2021, Doug Anderson wrote:
> > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
> > > > > > <bjorn.andersson@linaro.org> wrote:
> > > > > > >
> > > > > > > +static int dp_parser_find_panel(struct dp_parser *parser)
> > > > > > > +{
> > > > > > > +       struct device_node *np = parser->pdev->dev.of_node;
> > > > > > > +       int rc;
> > > > > > > +
> > > > > > > +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> > > > > >
> > > > > > Why port 2? Shouldn't this just be port 1 always? The yaml says that
> > > > > > port 1 is "Output endpoint of the controller". We should just use port
> > > > > > 1 here, right?
> > > > > >
> > > > >
> > > > > Finally got back to this, changed it to 1 and figured out why I left it
> > > > > at 2.
> > > > >
> > > > > drm_of_find_panel_or_bridge() on a DP controller will find the of_graph
> > > > > reference to the USB-C controller, scan through the registered panels
> > > > > and conclude that the of_node of the USB-C controller isn't a registered
> > > > > panel and return -EPROBE_DEFER.
> > > >
> > > > I'm confused, but maybe it would help if I could see something
> > > > concrete. Is there a specific board this was happening on?
> > > >
> > >
> > > Right, let's make this more concrete with a snippet from the actual
> > > SC8180x DT.
> > >
> > > > Under the DP node in the device tree I expect:
> > > >
> > > > ports {
> > > >   port@1 {
> > > >     reg = <1>;
> > > >     edp_out: endpoint {
> > > >       remote-endpoint = <&edp_panel_in>;
> > > >     };
> > > >   };
> > > > };
> > > >
> > >
> > > /* We got a panel */
> > > panel {
> > >     ...
> > >     ports {
> > >         port {
> > >             auo_b133han05_in: endpoint {
> > >                 remote-endpoint = <&mdss_edp_out>;
> > >             };
> > >         };
> > >     };
> > > };
> > >
> > > /* And a 2-port USB-C controller */
> > > type-c-controller {
> > >     ...
> > >     connector@0 {
> > >         ports {
> > >             port@0 {
> > >                 reg = <0>;
> > >                 ucsi_port_0_dp: endpoint {
> > >                     remote-endpoint = <&dp0_mode>;
> > >                 };
> > >             };
> > >
> > >             port@1 {
> > >                 reg = <1>;
> > >                 ucsi_port_0_switch: endpoint {
> > >                     remote-endpoint = <&primary_qmp_phy>;
> > >                 };
> > >             };
> > >         };
> > >     };
> > >
> > >         connector@1 {
> > >         ports {
> > >             port@0 {
> > >                 reg = <0>;
> > >                 ucsi_port_1_dp: endpoint {
> > >                     remote-endpoint = <&dp1_mode>;
> > >                 };
> > >             };
> > >
> > >             port@1 {
> > >                 reg = <1>;
> > >                 ucsi_port_1_switch: endpoint {
> > >                     remote-endpoint = <&second_qmp_phy>;
> > >                 };
> > >             };
> > >         };
> > >         };
> > > };
> > >
> > > /* And then our 2 DP and single eDP controllers */
> > > &mdss_dp0 {
> > >     ports {
> > >         port@1 {
> > >             reg = <1>;
> > >             dp0_mode: endpoint {
> > >                 remote-endpoint = <&ucsi_port_0_dp>;
> > >             };
> > >         };
> > >     };
> > > };
> > >
> > > &mdss_dp1 {
> > >     ports {
> > >         port@1 {
> > >             reg = <1>;
> > >             dp1_mode: endpoint {
> > >                 remote-endpoint = <&ucsi_port_1_dp>;
> > >             };
> > >         };
> > >     };
> > > };
> > >
> > > &mdss_edp {
> > >     ports {
> > >         port@1 {
> > >             reg = <1>;
> > >             mdss_edp_out: endpoint {
> > >                 remote-endpoint = <&auo_b133han05_in>;
> > >             };
> > >         };
> > >     };
> > > };
> > >
> > > > If you have "port@1" pointing to a USB-C controller but this instance
> > > > of the DP controller is actually hooked up straight to a panel then
> > > > you should simply delete the "port@1" that points to the typeC and
> > > > replace it with one that points to a panel, right?
> > > >
> > >
> > > As you can see, port 1 on &mdss_dp0 and &mdss_dp1 points to the two UCSI
> > > connectors and the eDP points to the panel, exactly like we agreed.
> > >
> > > So now I call:
> > >     drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> > >
> > > which for the two DP nodes will pass respective UCSI connector to
> > > drm_find_panel() and get EPROBE_DEFER back - because they are not on
> > > panel_list.
> > >
> > > There's nothing indicating in the of_graph that the USB connectors
> > > aren't panels (or bridges), so I don't see a way to distinguish the two
> > > types remotes.

To summarize where I think our out-of-band discussion went, I think
you're OK w/ keeping this at "port@1" for both the DP and eDP case and
we'll figure out _some_ way to make it work.


> > As far as I can tell the way this would be solved would be to actually
> > pass &bridge in and then make sure that a bridge would be in place for
> > the DP connector. In the full DP case you'll get an -EPROBE_DEFER if
> > the connector hasn't been probed but once it's probed then it should
> > register as a bridge and thus give you the info you need (AKA that
> > this isn't a panel).
> >
> > I haven't done the digging to see how all this works, but according to
> > Laurent [1]: "Physical connectors are already handled as bridges, see
> > drivers/gpu/drm/bridge/display-connector.c"
> >
>
> All this seems to make sense for both eDP and "native" DP.
>
> > So basically I think this is solvable in code and there's no reason to
> > mess with the devicetree bindings to solve this problem. Does that
> > sound right?
> >
>
> But I don't have a DisplayPort connector.
>
> I have a USB-C connector, that upon determining that it's time to play
> DisplayPort will use the typec_mux abstraction to tell someone on the
> other side of the of_graph about DisplayPort events (HPD).
>
> So where would I put this drm_bridge in the USB-C case?
>
> I don't see that it fits in the Type-C side of things and putting it on
> the DP side would leave us with exactly the problem we have here. So we
> would have to put a fake "DP connector" inbetween the DP node and the
> Type-C controller?
>
>
> For reference, this is how I thought one is supposed to tie the Type-C
> controller to the display driver:
> https://lore.kernel.org/all/20211005022451.2037405-1-bjorn.andersson@linaro.org/

OK, so I looked at that a bit. Fair warning that I've never looked at
the type C code before today so anything I say could be totally wrong!
:-)

...but I _think_ you're abusing the "mux" API for this. I think a type
C port can have exactly 1 mux, right? Right now you are claiming to be
_the_ mux in the DP driver, but what about for other alt modes? If
those wanted to be notified about similar things it would be
impossible because you're already _the_ mux, right?

I _think_ a mux is supposed to be something more like
`drivers/phy/rockchip/phy-rockchip-typec.c` (though that code predates
the type C framework we're looking at here). There the phy can do all
the work of remuxing things / flipping orientation / etc. I don't
think it's a requirement that every SoC be able to do this remuxing
itself but (if memory serves) rk3399 implemented it so we didn't have
to do it on the TCPC and could use a cheaper solution there.

In any case, my point is that I think there is supposed to be a
_single_ mux per port that handles reassigning pins and that's what
this API is for.

...so I will still assert that the right thing to do is to have a
drm_bridge for the type c connector and _that's_ what should be
sending HPD.


> I'm afraid I must be missing something in Laurent and yours proposal
> (although I think Laurent is talking about the native DP case?).
>
> Regards,
> Bjorn
>
> > [1] https://lore.kernel.org/r/YUvMv+Y8tFcWPEHd@pendragon.ideasonboard.com/
