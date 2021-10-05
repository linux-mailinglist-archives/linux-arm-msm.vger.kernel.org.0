Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267D9422F40
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 19:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbhJERfJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 13:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234144AbhJERfI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 13:35:08 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E8EC061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 10:33:17 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id e24so226555oig.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 10:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=71HyGq5jsXAg+sz6VrDwqjua1AYi4Yt0h0vLPVrLYyc=;
        b=VnWFO8feQ/jKEVNNYcCNDgAAFbjuPqav1DCKCE9RS6Bp1XdLPhtam4xcpTf/CpbsSc
         sinYpgamBHCflpT7bzw8WIfJEuxLdPEHmYh5wao0uqEsHHJ++9P/kORPaXtY8dmQK/El
         Ux06+7ABy1HOzZj/rOyETgeQkA65BgnrbBhzPw+CjK75rnN32pdEKiVj0rVK+VacAGq5
         ZwLEa9IZ6fhtgVRR1hdLKPrT5OkI3XfbnQnlf/LZ0OmrqkSKWUuHXFaMFdO8+4dUJGmC
         fsmaRyXKuHdNnKr/WD6JJNWQsJyyl6XjVMU+F/3Zxjkh+2i/odHMHUnjQO+x4QhJIBGy
         MliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=71HyGq5jsXAg+sz6VrDwqjua1AYi4Yt0h0vLPVrLYyc=;
        b=uM4eXJ7KzyaJi2rVZi2H1xN4HfSlHPueiRnEEWe54UqLjsLatT4+HYVJ06EkqVaOG/
         YY0uGByKu38w/yT9GTW2bM5riTw84V0p9k/m2IiIHc917IlTiTM3peXQaj6182WyQ7jo
         h/9B8M1vAtd0AQZkfMoCvdrM4Om3kEJ7tmow3ZJCh4ezZeN4RZVJeGulriEXMnT1Bv5y
         UgSxNkIMhipaYkN426VjH0eRaYFhMTlTttSJbtO2mMvP9HaaSLjxYq9cxX86L3UMfKhv
         QDjJksfyoRHdhYkoBW0dSkpIvcWYkumIcpLXr21GCAYt97PP7qHenwgXUb/mjucNTdYk
         OExw==
X-Gm-Message-State: AOAM533RzvbC2BXBj+9tKpvOwbmALO78v3PFzwzXVh+5cgyBZe57Cjl6
        FxC8VW/uo9g1d2eOn6KuID8K3Q==
X-Google-Smtp-Source: ABdhPJxzcAx07ei8MxkmvHD51By4pDDo5yRTYN4AEghG3fL3svXbWySvfo7kHw+8THu/Opnn39LMDA==
X-Received: by 2002:a05:6808:187:: with SMTP id w7mr3646625oic.140.1633455196519;
        Tue, 05 Oct 2021 10:33:16 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id d4sm3664803oth.47.2021.10.05.10.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 10:33:16 -0700 (PDT)
Date:   Tue, 5 Oct 2021 10:34:58 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Vara Reddy <varar@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <YVyMwsvLl6XalJxB@ripper>
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
 <YVd3YdfgFVc0Br5T@ripper>
 <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
 <YVumL1lHLqtb/HKS@ripper>
 <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Oct 08:39 PDT 2021, Doug Anderson wrote:

> Hi,
> 
> On Mon, Oct 4, 2021 at 6:09 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 04 Oct 17:36 PDT 2021, Doug Anderson wrote:
> >
> > > Hi,
> > >
> > > On Fri, Oct 1, 2021 at 2:00 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > On Fri 27 Aug 13:52 PDT 2021, Doug Anderson wrote:
> > > >
> > > > > Hi,
> > > > >
> > > > > On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
> > > > > <bjorn.andersson@linaro.org> wrote:
> > > > > >
> > > > > > +static int dp_parser_find_panel(struct dp_parser *parser)
> > > > > > +{
> > > > > > +       struct device_node *np = parser->pdev->dev.of_node;
> > > > > > +       int rc;
> > > > > > +
> > > > > > +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> > > > >
> > > > > Why port 2? Shouldn't this just be port 1 always? The yaml says that
> > > > > port 1 is "Output endpoint of the controller". We should just use port
> > > > > 1 here, right?
> > > > >
> > > >
> > > > Finally got back to this, changed it to 1 and figured out why I left it
> > > > at 2.
> > > >
> > > > drm_of_find_panel_or_bridge() on a DP controller will find the of_graph
> > > > reference to the USB-C controller, scan through the registered panels
> > > > and conclude that the of_node of the USB-C controller isn't a registered
> > > > panel and return -EPROBE_DEFER.
> > >
> > > I'm confused, but maybe it would help if I could see something
> > > concrete. Is there a specific board this was happening on?
> > >
> >
> > Right, let's make this more concrete with a snippet from the actual
> > SC8180x DT.
> >
> > > Under the DP node in the device tree I expect:
> > >
> > > ports {
> > >   port@1 {
> > >     reg = <1>;
> > >     edp_out: endpoint {
> > >       remote-endpoint = <&edp_panel_in>;
> > >     };
> > >   };
> > > };
> > >
> >
> > /* We got a panel */
> > panel {
> >     ...
> >     ports {
> >         port {
> >             auo_b133han05_in: endpoint {
> >                 remote-endpoint = <&mdss_edp_out>;
> >             };
> >         };
> >     };
> > };
> >
> > /* And a 2-port USB-C controller */
> > type-c-controller {
> >     ...
> >     connector@0 {
> >         ports {
> >             port@0 {
> >                 reg = <0>;
> >                 ucsi_port_0_dp: endpoint {
> >                     remote-endpoint = <&dp0_mode>;
> >                 };
> >             };
> >
> >             port@1 {
> >                 reg = <1>;
> >                 ucsi_port_0_switch: endpoint {
> >                     remote-endpoint = <&primary_qmp_phy>;
> >                 };
> >             };
> >         };
> >     };
> >
> >         connector@1 {
> >         ports {
> >             port@0 {
> >                 reg = <0>;
> >                 ucsi_port_1_dp: endpoint {
> >                     remote-endpoint = <&dp1_mode>;
> >                 };
> >             };
> >
> >             port@1 {
> >                 reg = <1>;
> >                 ucsi_port_1_switch: endpoint {
> >                     remote-endpoint = <&second_qmp_phy>;
> >                 };
> >             };
> >         };
> >         };
> > };
> >
> > /* And then our 2 DP and single eDP controllers */
> > &mdss_dp0 {
> >     ports {
> >         port@1 {
> >             reg = <1>;
> >             dp0_mode: endpoint {
> >                 remote-endpoint = <&ucsi_port_0_dp>;
> >             };
> >         };
> >     };
> > };
> >
> > &mdss_dp1 {
> >     ports {
> >         port@1 {
> >             reg = <1>;
> >             dp1_mode: endpoint {
> >                 remote-endpoint = <&ucsi_port_1_dp>;
> >             };
> >         };
> >     };
> > };
> >
> > &mdss_edp {
> >     ports {
> >         port@1 {
> >             reg = <1>;
> >             mdss_edp_out: endpoint {
> >                 remote-endpoint = <&auo_b133han05_in>;
> >             };
> >         };
> >     };
> > };
> >
> > > If you have "port@1" pointing to a USB-C controller but this instance
> > > of the DP controller is actually hooked up straight to a panel then
> > > you should simply delete the "port@1" that points to the typeC and
> > > replace it with one that points to a panel, right?
> > >
> >
> > As you can see, port 1 on &mdss_dp0 and &mdss_dp1 points to the two UCSI
> > connectors and the eDP points to the panel, exactly like we agreed.
> >
> > So now I call:
> >     drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> >
> > which for the two DP nodes will pass respective UCSI connector to
> > drm_find_panel() and get EPROBE_DEFER back - because they are not on
> > panel_list.
> >
> > There's nothing indicating in the of_graph that the USB connectors
> > aren't panels (or bridges), so I don't see a way to distinguish the two
> > types remotes.
> 
> As far as I can tell the way this would be solved would be to actually
> pass &bridge in and then make sure that a bridge would be in place for
> the DP connector. In the full DP case you'll get an -EPROBE_DEFER if
> the connector hasn't been probed but once it's probed then it should
> register as a bridge and thus give you the info you need (AKA that
> this isn't a panel).
> 
> I haven't done the digging to see how all this works, but according to
> Laurent [1]: "Physical connectors are already handled as bridges, see
> drivers/gpu/drm/bridge/display-connector.c"
> 

All this seems to make sense for both eDP and "native" DP.

> So basically I think this is solvable in code and there's no reason to
> mess with the devicetree bindings to solve this problem. Does that
> sound right?
> 

But I don't have a DisplayPort connector.

I have a USB-C connector, that upon determining that it's time to play
DisplayPort will use the typec_mux abstraction to tell someone on the
other side of the of_graph about DisplayPort events (HPD).

So where would I put this drm_bridge in the USB-C case?

I don't see that it fits in the Type-C side of things and putting it on
the DP side would leave us with exactly the problem we have here. So we
would have to put a fake "DP connector" inbetween the DP node and the
Type-C controller?


For reference, this is how I thought one is supposed to tie the Type-C
controller to the display driver:
https://lore.kernel.org/all/20211005022451.2037405-1-bjorn.andersson@linaro.org/


I'm afraid I must be missing something in Laurent and yours proposal
(although I think Laurent is talking about the native DP case?).

Regards,
Bjorn

> [1] https://lore.kernel.org/r/YUvMv+Y8tFcWPEHd@pendragon.ideasonboard.com/
