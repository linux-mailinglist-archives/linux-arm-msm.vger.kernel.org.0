Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 575A8B9990
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 00:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729981AbfITWPO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 18:15:14 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:43549 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730702AbfITWPK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 18:15:10 -0400
Received: by mail-vk1-f193.google.com with SMTP id p189so1909626vkf.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2019 15:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ePRG1El64b4xalI0ZgtQ8x7l7yrY5i1tboqLUmCo3Tw=;
        b=hUVtM6LD+m1itXw7Sd1jqt12kpEU4iVZeuDH5QRLp6g5OKbH7Lw+DKSzFKMQjz+KNQ
         W00B3zibGQ6IsWV7H7e1n8wmOzxKDGNoeIvqmLmy8pOI4HZ9ec2Zj46vVd2A7+2pEtcL
         R2svA8dcQQ6aMlf6Hconq/o1T+5lB02l4LEnufJ4j6sAbxKnPvFlx7SMH2Zv9xNrsIuV
         4PFHPcDhnDBo92iKrYOPYQH8PUXW4ETH8fBbuQnRjJWlbMaf3HHIoJGA6elUGipoG1y3
         hHyb1pixu3+Wbk/OJf2gDkWpGzwGr7RrapVBXSX8SYk7pxcItx74+WOBCrUh+fobrf/1
         7yJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ePRG1El64b4xalI0ZgtQ8x7l7yrY5i1tboqLUmCo3Tw=;
        b=VMkAHkRQtYvAgZFV2sOjJlUdSXWjDrJvpiDHylIJ+zJtsRyBmKIdLqWsyRiijBdle+
         zhMWn1aoDe+AQwCpvr//NrKfIDYovWgTLDUHdBfheA4/cOvPeGDJ2COKVxyRqIjSbAmj
         DMwiFpzsEeeIHimPeiuyu1WNqFhrt9E21G4H6vKW8wJy5lfHy1m2bBVR3i9T8y4zp71s
         iSVYb8FCTmxW0el5Ha73xGwP46xeoLTDyG3QIpgJ2addkp8vDnTfDKnMgwlbi17OQ/Fi
         6KAVz58eU/YoFF1BgeShWkXoJnYMrAooPey0nhoXB4Ug3meay2/SilfhxcH/8sXWgGTi
         NSLA==
X-Gm-Message-State: APjAAAU2JAuqTbLZ0WH+tIKq+VwRoqxJjuxaAdn/NRl2KEWfwGouVAJy
        +1pbNXtu7yTjPrgzcwBTvzjlRym/rHEncInWudHFng==
X-Google-Smtp-Source: APXvYqyIngI+pktkawLYxW1nvEE9qgMZBR0bhtOiWvtWNSAFO+PaYiFcOwAe2Rz3/tOEXu1lHKOMmgeU0sNeNrlqTes=
X-Received: by 2002:a1f:bd94:: with SMTP id n142mr9846336vkf.86.1569017708851;
 Fri, 20 Sep 2019 15:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569015835.git.amit.kucheria@linaro.org>
 <f627e66c455f52b5662bef6526d7c72869808401.1569015835.git.amit.kucheria@linaro.org>
 <5d854c82.1c69fb81.66e1f.96ab@mx.google.com> <CAHLCerPqEK2sSGGtDj85DH+qCzgtWi4ainuQv8BgQ3-Dgi93BQ@mail.gmail.com>
 <5d854e1d.1c69fb81.4f771.9391@mx.google.com>
In-Reply-To: <5d854e1d.1c69fb81.4f771.9391@mx.google.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Fri, 20 Sep 2019 15:14:58 -0700
Message-ID: <CAHLCerNqsf1j4vsOPjdav8+UtXtGP55k6_==jjg1QeZ1qCX1RA@mail.gmail.com>
Subject: Re: [PATCH v4 09/15] arm64: dts: msm8996: thermal: Add interrupt support
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 20, 2019 at 3:09 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-09-20 15:07:25)
> > On Fri, Sep 20, 2019 at 3:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Amit Kucheria (2019-09-20 14:52:24)
> > > > Register upper-lower interrupts for each of the two tsens controllers.
> > > >
> > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 60 ++++++++++++++-------------
> > > >  1 file changed, 32 insertions(+), 28 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > > > index 96c0a481f454..bb763b362c16 100644
> > > > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > > > @@ -175,8 +175,8 @@
> > > >
> > > >         thermal-zones {
> > > >                 cpu0-thermal {
> > > > -                       polling-delay-passive = <250>;
> > > > -                       polling-delay = <1000>;
> > > > +                       polling-delay-passive = <0>;
> > > > +                       polling-delay = <0>;
> > >
> > > I thought the plan was to make this unnecessary to change?
> >
> > IMO that change should be part of a different series to the thermal
> > core. I've not actually started working on it yet (traveling for the
> > next 10 days or so) but plan to do it.
> >
>
> Ok so the plan is to change DT and then change it back? That sounds
> quite bad so please fix the thermal core to not care about this before
> applying these changes so that we don't churn DT.

Hi Stephen,

Our emails crossed paths. I think we could just make the property
optional so that we can remove the property completely for drivers
that support interrupts. Comments?

That is a bigger change to the bindings and I don't want to hold the
tsens interrupt support hostage to agreement on this.

Regards,
Amit
