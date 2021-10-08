Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02F24270EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 20:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhJHSsW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 14:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbhJHSsW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 14:48:22 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA68C061570
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Oct 2021 11:46:26 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id n65so23105769ybb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7cPY3v1LzlioKfdhDOw7Hm3RkTquyHY7MkNmossNAIo=;
        b=Nlof5WbhDqBjYqgMvc96/D8WqHy+mHAz4nkyQ5wCmn1lCOfLCq6DllC+M78UmTy9Gg
         nx43NobVwOd7zEmzGHpvZhu2KzQBW/yHkXpzskzWAG/T1dvfcjaSWO53aEqE2ox1a40Q
         XmzDxVx6kSdmOWqXaEmXjq2Op4AqzjgHwfr7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7cPY3v1LzlioKfdhDOw7Hm3RkTquyHY7MkNmossNAIo=;
        b=HW/w0Dk3P1yX9enZfcu4uQbU+kelu9sN0PDR0Cy2YAXp3ofxi21gGq3QHFgLNmBAF9
         GkGFrQHl+GT7xiNuHaUPFgdsfI8Wm4OPiy8I682ygbBA9fASU+ms0F+JI9DlazhVxWKD
         UXL2E5B7vQfnABI+5AXQeAvY4wwu1HHXqYRu+lSoFdvBV3Q+9iwgKEHsbdB1M3XheQf4
         u7/Oa1uyzsT3+KxqOKeanN3hFFRNlNwiqq+t5fVVvZn6hVWRgRVJdbShldflFc2COxLr
         Sy6QWARkHWvoLGygquB8WV5uNeLWdInPjV5P1mKrth75AHRjVXimAK7ORuwfOuw0CkYr
         cIYw==
X-Gm-Message-State: AOAM532BMb5MDIVylHYrycOQN4Cyq4E9jRuOSFrbQN1FmZng7jgxKlBH
        NZy4eJKsx4xLsa+AquexRtMGArUXYSKZW6Of511vrA==
X-Google-Smtp-Source: ABdhPJyZUwO5Ug3lqnQigymhQvAaymbLFwuwZq10/tTMgr15nkxW87dHUuBkdt8PbeVpF2+LXnrOXo3L7SKHl9dnIBI=
X-Received: by 2002:a25:7c07:: with SMTP id x7mr5469298ybc.217.1633718786049;
 Fri, 08 Oct 2021 11:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
 <20210929173343.v2.3.I630340a51130f4582dbe14e42f673b74e0531a2b@changeid>
 <CAE-0n53EBvKv-RdMwiiOsUkb+LOKAKwrpP7cDavx4meA2vbvcA@mail.gmail.com>
 <CAD=FV=XoOhSNP2EXurkA=G9iG2BnH9VzkvSEiNJ8W71s8N9bgg@mail.gmail.com> <CA+cxXhkM9Gzc+0EVapZVu=pJZ3WZawgucG5J2=bokYEJXFNKCQ@mail.gmail.com>
In-Reply-To: <CA+cxXhkM9Gzc+0EVapZVu=pJZ3WZawgucG5J2=bokYEJXFNKCQ@mail.gmail.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Fri, 8 Oct 2021 11:46:15 -0700
Message-ID: <CA+cxXh=1D08O6EcC4Xq6+cCEthCtXfASOfGW38z=FhkmW3ce9g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: sc7180: Support Parade ps8640 edp bridge
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

On Thu, Oct 7, 2021 at 11:15 AM Philip Chen <philipchen@chromium.org> wrote:
>
> Hi,
>
> On Thu, Sep 30, 2021 at 9:22 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Sep 29, 2021 at 9:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > > +       pp3300_brij_ps8640: pp3300-brij-ps8640 {
> > > > +               compatible = "regulator-fixed";
> > > > +               status = "okay";
> > > > +               regulator-name = "pp3300_brij_ps8640";
> > > > +
> > > > +               regulator-min-microvolt = <3300000>;
> > > > +               regulator-max-microvolt = <3300000>;
> > > > +
> > > > +               gpio = <&tlmm 32 GPIO_ACTIVE_HIGH>;
> > >
> > > Doesn't this need
> > >
> > >                 enable-active-high;
> >
> > Looks like it. Without that it looks like it assumes active low.
> Thanks for catching this.
> I'll fix it in v3.
>
> >
> >
> > > > +
> > > > +               pinctrl-names = "default";
> > > > +               pinctrl-0 = <&en_pp3300_edp_brij_ps8640>;
> > > > +
> > > > +               vin-supply = <&pp3300_a>;
> > > > +       };
> > > > +};
> > > > +
> > > > +&dsi0_out {
> > > > +       remote-endpoint = <&ps8640_in>;
> > >
> > > Should this also have data-lanes to be "complete"?
> >
> > That's still back in the main trogdor.dtsi, isn't it?
> Yes, I think so.
> Plus, ti-sn65 dts doesn't define data-lanes for input either.
Sorry, I was wrong.
ti-sn65 dts actually defines data-lanes for input.
However, since ps8640 driver doesn't parse input data-lanes for now,
it's not useful to add data-lanes here anyway.

>
> >
> >
> > > > +edp_brij_i2c: &i2c2 {
> > > > +       status = "okay";
> > > > +       clock-frequency = <400000>;
> > > > +
> > > > +       ps8640_bridge: edp-bridge@8 {
> > >
> > > Just bridge@8 to match ti bridge? Also, is the label used? If not
> > > please drop it.
> >
> > I agree with Stephen about it being "bridge@8". Personally I don't
> > mind labels like this even if they're not used since they don't hurt
> > and it creates less churn to add them now, but I won't fight hard to
> > keep them.
> I will make it "bridge@8" to match ti-sn65 dts.
> Meanwhile, can we keep "ps8640_bridge" label to match ti-sn65 dts?
>
> >
> >
> > > > +               aux_bus: aux-bus {
> > >
> > > Is this label used either?
> >
> > Yeah, I'd get rid of this one since there you didn't add it in the
> > sn65dsi86 dtsi file and it seems exceedingly unlikely we'd need it for
> > any reason.
> Sure, I will remove "aux_bus" label in v3.
>
> >
> > -Doug
