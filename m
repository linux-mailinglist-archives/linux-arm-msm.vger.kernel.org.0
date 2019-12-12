Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 794E311D2FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 18:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729980AbfLLRAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 12:00:10 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:43273 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729260AbfLLRAJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 12:00:09 -0500
Received: by mail-il1-f193.google.com with SMTP id u16so2604219ilg.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 09:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VFbGuOmt8927R+vYeTAQfCaDgF/GDKY3t3T6KS+4jUA=;
        b=PEe8To71VSS0ZUGmCNvztFYyKJaky6xNL19ZnUI4w8FyeyUpZeT18qnwk/v43/LI9H
         4OMWHz3NG2O5QKX4qcDah8HVgYA3ZVKIvn8anspz21uipN5+K+4FXdIKgIhy2Fle8eEx
         /p/Jl28uAvIyZZ+ZkYBoy8Tg0jFkYiLByPpCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VFbGuOmt8927R+vYeTAQfCaDgF/GDKY3t3T6KS+4jUA=;
        b=ilmUkV646GfW8lyA9LbyfWa/57rv8xvqujgvRFcTzu3h7zYVJNbe36+JhHFdIRxb6c
         LwzXrY5RUYwmkucNkD2PV1U2XbssGhcejTVk5dYxSBzpI0IDcmhYDf+gzQWMFmpcvu7L
         r7A9pf5PLD7pvWU3VLZF41mjSJb7E4cBlbHUylsNJMPAGGT1+QF4sTREy1MpFcyLuseK
         kLf6/xmJ3ewP8jpGzF/jIX4AXZHTYPDzeEAqI5KMFfdu8TgWgwVskeL+Lc/+3aUzOFAs
         jJ/2xKIBuwB1XbLcu2yVPGFeExxgKDGyOjckDzSIJOGi8L/YVcmstWWgR0SLzU320iiJ
         wRMw==
X-Gm-Message-State: APjAAAXN4AcnBwEtLkbYmSH6W0t+28ijpsXo80Symvksu90rJYCMz3aI
        FJjdODaVsWL8ht7uYhmka8uZQHifTCQ=
X-Google-Smtp-Source: APXvYqyO4hmiHZgEFUZpjBhEPYrbEtD9TlhKSPZ8CHYUjnh5iRWYEX1MGpeVHgEMRXHYolbCiaHx2Q==
X-Received: by 2002:a92:83c4:: with SMTP id p65mr8767215ilk.95.1576170008796;
        Thu, 12 Dec 2019 09:00:08 -0800 (PST)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id e85sm1866596ilk.78.2019.12.12.09.00.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 09:00:08 -0800 (PST)
Received: by mail-il1-f177.google.com with SMTP id b15so2623714ila.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 09:00:08 -0800 (PST)
X-Received: by 2002:a92:1547:: with SMTP id v68mr8798475ilk.58.1576170007669;
 Thu, 12 Dec 2019 09:00:07 -0800 (PST)
MIME-Version: 1.0
References: <1574934847-30372-1-git-send-email-rkambl@codeaurora.org>
 <1574934847-30372-2-git-send-email-rkambl@codeaurora.org> <CAHLCerOVH1xLjMmDNFVx=YYYTA3MipaOhHZ-AYtxEnDFgRbSJg@mail.gmail.com>
 <CAD=FV=UDGcnLLkBiTBr5GgrzNH20qf9pDQW8wdoqsbO4832M4Q@mail.gmail.com> <CAHLCerPKC2dK0Baom9MguvUfD0L--EeuLYnLnQENis92uzKbgg@mail.gmail.com>
In-Reply-To: <CAHLCerPKC2dK0Baom9MguvUfD0L--EeuLYnLnQENis92uzKbgg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 Dec 2019 08:59:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VfyrNk+VJZ+p8RLgQGab5XQBkALfH3FeRooeu+FY7BXw@mail.gmail.com>
Message-ID: <CAD=FV=VfyrNk+VJZ+p8RLgQGab5XQBkALfH3FeRooeu+FY7BXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: sc7180: Add device node support
 for TSENS in SC7180
To:     Amit Kucheria <amit.kucheria@verdurent.com>
Cc:     Rajeshwari <rkambl@codeaurora.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, sanm@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 12, 2019 at 8:56 AM Amit Kucheria
<amit.kucheria@verdurent.com> wrote:
>
> On Thu, Dec 12, 2019 at 9:39 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Dec 12, 2019 at 3:00 AM Amit Kucheria
> > <amit.kucheria@verdurent.com> wrote:
> > >
> > > Hi Rajeshwari,
> > >
> > > On Thu, Nov 28, 2019 at 3:25 PM Rajeshwari <rkambl@codeaurora.org> wrote:
> > > >
> > > > Add TSENS node and user thermal zone for TSENS sensors in SC7180.
> > > >
> > > > Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 527 +++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 527 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > index 666e9b9..6656ffc 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > @@ -911,6 +911,26 @@
> > > >                         status = "disabled";
> > > >                 };
> > > >
> > > > +               tsens0: thermal-sensor@c263000 {
> > > > +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
> > > > +                       reg = <0 0x0c263000 0 0x1ff>, /* TM */
> > > > +                               <0 0x0c222000 0 0x1ff>; /* SROT */
> > > > +                       #qcom,sensors = <15>;
> > > > +                       interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
> > > > +                       interrupt-names = "uplow";
> > > > +                       #thermal-sensor-cells = <1>;
> > > > +               };
> > > > +
> > > > +               tsens1: thermal-sensor@c265000 {
> > > > +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
> > > > +                       reg = <0 0x0c265000 0 0x1ff>, /* TM */
> > > > +                               <0 0x0c223000 0 0x1ff>; /* SROT */
> > > > +                       #qcom,sensors = <10>;
> > > > +                       interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
> > > > +                       interrupt-names = "uplow";
> > > > +                       #thermal-sensor-cells = <1>;
> > > > +               };
> > > > +
> > > >                 spmi_bus: spmi@c440000 {
> > > >                         compatible = "qcom,spmi-pmic-arb";
> > > >                         reg = <0 0x0c440000 0 0x1100>,
> > > > @@ -1121,6 +1141,513 @@
> > > >                 };
> > > >         };
> > > >
> > > > +       thermal-zones {
> > > > +               cpu0-thermal {
> > > > +                       polling-delay-passive = <250>;
> > > > +                       polling-delay = <1000>;
> > > > +
> > > > +                       thermal-sensors = <&tsens0 1>;
> > > > +
> > > > +                       trips {
> > > > +                               cpu0_alert0: trip-point0 {
> > > > +                                       temperature = <90000>;
> > > > +                                       hysteresis = <2000>;
> > > > +                                       type = "passive";
> > > > +                               };
> > > > +
> > > > +                               cpu0_alert1: trip-point1 {
> > > > +                                       temperature = <95000>;
> > > > +                                       hysteresis = <2000>;
> > > > +                                       type = "passive";
> > > > +                               };
> > > > +
> > > > +                               cpu0_crit: cpu_crit {
> > > > +                                       temperature = <110000>;
> > > > +                                       hysteresis = <1000>;
> > > > +                                       type = "critical";
> > > > +                               };
> > >
> > > Where are the cooling maps for all the cpu thermal zones? A passive
> > > trip point w/o a cooling map is not of much use. If you are waiting
> > > for cpufreq support to land before adding them, then remove the
> > > passive trip points for now and add them along with the cooling maps
> > > when you have cooling devices.
> >
> > I will note that cpufreq support has landed in the qcom tree::
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=86899d8235ea0d3d7c293404fb43a6fabff866e6
> >
> > ...so I guess the right thing is to send a patch adding the cooling
> > maps for the cpu thermal zones?
>
> Great, then the cooling maps should be added to this patch itself.

Well, except that this patch itself has also landed:

https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=82bdc93972bf293c3407cb7fdac163aadfbb2c12

...so I think my advice is still correct: the right thing is to send a
patch adding the cooling maps for the cpu thermal zones

-Doug
