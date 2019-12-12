Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9DF911D32D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 18:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730073AbfLLRIA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 12:08:00 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37946 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729927AbfLLRH5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 12:07:57 -0500
Received: by mail-vs1-f66.google.com with SMTP id y195so2092461vsy.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 09:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gtV1kMMZOt9BBy7gC33kLI2d+FIAWgyItD6+NoqJfrk=;
        b=dTe1qHDgLCR3hFu1EHejH8zrr86ot3OrTdrb4hX3GDCDalgvGAI0D0IdxMebsmoh4i
         ybVXyOHUfPN5oscxefXKWtPPpITIZy2Mxgwm8jJygqwur2QCeIE0ueL9g2M2QpxOW/r4
         uG5ZStInuYc7aa4Z6E/UvUu4VHBpyz5Oau0YBWQ4RnrLWrqtLVLB2Vl/7OCq4+v+6pjF
         7T2kSPkjFQsnSLk4BMIvf91+LclznDss+7GprVZK/xaBpsz2klJac3LXn0eMXBwlDf4z
         DuDr4WsbXrXD9vSHjR2u4U8OY5BQkmclsGTb8ZC78Dyruc6uJG9tzm5OySn/VpgBT3oE
         rKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gtV1kMMZOt9BBy7gC33kLI2d+FIAWgyItD6+NoqJfrk=;
        b=uK+a9Abba29TXbahyr8Phvhg6P+m98d0UMjN9IQN0BrLu+S92UMsQrJwwchkjuwwgY
         aVwIgjE980+OngyxqfY5mLgYefQlrcAwEI78PGrVEb98oZgsiBGv0hhN2D8Om23UoxQk
         wvYExIcvfsOkKj/HwSKq2ImEF5wKgt7GUhupe5bmwSUgqrK9hB5POczpnY7L0yvotAjy
         DH1Gbshzca67KGv++/YtvYNofY10eh36hXfVS8xQHWTR/TQn8E75vmIKBcmiSVyh8S58
         ePhrbEnOSOg6/oJTQPxibShsyr1QwsQTSNX0+KVUI2273gepWfDeTCZScW8anw0DTQd6
         aguQ==
X-Gm-Message-State: APjAAAXLzqGN1OCW1r3ejzQyLYgPagiG2R7Ig21MqgbhetEkL7Vz+me3
        xYTzSjiLWeR6D/ynVEoRJhdvlaZ8V1Z4scsvnLr12w==
X-Google-Smtp-Source: APXvYqwcbvXMW91N7sisLXp52MPAggGkSfD8QX6sR8H9ZfwkTvmzxGdhuufqUOqHdVa8LXG+dBgNOJCTo9rbikuMa2w=
X-Received: by 2002:a67:fb41:: with SMTP id e1mr7474596vsr.159.1576170476104;
 Thu, 12 Dec 2019 09:07:56 -0800 (PST)
MIME-Version: 1.0
References: <1574934847-30372-1-git-send-email-rkambl@codeaurora.org>
 <1574934847-30372-2-git-send-email-rkambl@codeaurora.org> <CAHLCerOVH1xLjMmDNFVx=YYYTA3MipaOhHZ-AYtxEnDFgRbSJg@mail.gmail.com>
 <CAD=FV=UDGcnLLkBiTBr5GgrzNH20qf9pDQW8wdoqsbO4832M4Q@mail.gmail.com>
 <CAHLCerPKC2dK0Baom9MguvUfD0L--EeuLYnLnQENis92uzKbgg@mail.gmail.com> <CAD=FV=VfyrNk+VJZ+p8RLgQGab5XQBkALfH3FeRooeu+FY7BXw@mail.gmail.com>
In-Reply-To: <CAD=FV=VfyrNk+VJZ+p8RLgQGab5XQBkALfH3FeRooeu+FY7BXw@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Thu, 12 Dec 2019 22:37:45 +0530
Message-ID: <CAHLCerNAsmd5PyeL5ztedfhRdXVT-tpkR=OzJQaKeAPzpOjOtA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: sc7180: Add device node support
 for TSENS in SC7180
To:     Doug Anderson <dianders@chromium.org>
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

On Thu, Dec 12, 2019 at 10:30 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Dec 12, 2019 at 8:56 AM Amit Kucheria
> <amit.kucheria@verdurent.com> wrote:
> >
> > On Thu, Dec 12, 2019 at 9:39 PM Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Dec 12, 2019 at 3:00 AM Amit Kucheria
> > > <amit.kucheria@verdurent.com> wrote:
> > > >
> > > > Hi Rajeshwari,
> > > >
> > > > On Thu, Nov 28, 2019 at 3:25 PM Rajeshwari <rkambl@codeaurora.org> wrote:
> > > > >
> > > > > Add TSENS node and user thermal zone for TSENS sensors in SC7180.
> > > > >
> > > > > Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 527 +++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 527 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > > index 666e9b9..6656ffc 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > > @@ -911,6 +911,26 @@
> > > > >                         status = "disabled";
> > > > >                 };
> > > > >
> > > > > +               tsens0: thermal-sensor@c263000 {
> > > > > +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
> > > > > +                       reg = <0 0x0c263000 0 0x1ff>, /* TM */
> > > > > +                               <0 0x0c222000 0 0x1ff>; /* SROT */
> > > > > +                       #qcom,sensors = <15>;
> > > > > +                       interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +                       interrupt-names = "uplow";
> > > > > +                       #thermal-sensor-cells = <1>;
> > > > > +               };
> > > > > +
> > > > > +               tsens1: thermal-sensor@c265000 {
> > > > > +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
> > > > > +                       reg = <0 0x0c265000 0 0x1ff>, /* TM */
> > > > > +                               <0 0x0c223000 0 0x1ff>; /* SROT */
> > > > > +                       #qcom,sensors = <10>;
> > > > > +                       interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +                       interrupt-names = "uplow";
> > > > > +                       #thermal-sensor-cells = <1>;
> > > > > +               };
> > > > > +
> > > > >                 spmi_bus: spmi@c440000 {
> > > > >                         compatible = "qcom,spmi-pmic-arb";
> > > > >                         reg = <0 0x0c440000 0 0x1100>,
> > > > > @@ -1121,6 +1141,513 @@
> > > > >                 };
> > > > >         };
> > > > >
> > > > > +       thermal-zones {
> > > > > +               cpu0-thermal {
> > > > > +                       polling-delay-passive = <250>;
> > > > > +                       polling-delay = <1000>;
> > > > > +
> > > > > +                       thermal-sensors = <&tsens0 1>;
> > > > > +
> > > > > +                       trips {
> > > > > +                               cpu0_alert0: trip-point0 {
> > > > > +                                       temperature = <90000>;
> > > > > +                                       hysteresis = <2000>;
> > > > > +                                       type = "passive";
> > > > > +                               };
> > > > > +
> > > > > +                               cpu0_alert1: trip-point1 {
> > > > > +                                       temperature = <95000>;
> > > > > +                                       hysteresis = <2000>;
> > > > > +                                       type = "passive";
> > > > > +                               };
> > > > > +
> > > > > +                               cpu0_crit: cpu_crit {
> > > > > +                                       temperature = <110000>;
> > > > > +                                       hysteresis = <1000>;
> > > > > +                                       type = "critical";
> > > > > +                               };
> > > >
> > > > Where are the cooling maps for all the cpu thermal zones? A passive
> > > > trip point w/o a cooling map is not of much use. If you are waiting
> > > > for cpufreq support to land before adding them, then remove the
> > > > passive trip points for now and add them along with the cooling maps
> > > > when you have cooling devices.
> > >
> > > I will note that cpufreq support has landed in the qcom tree::
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=86899d8235ea0d3d7c293404fb43a6fabff866e6
> > >
> > > ...so I guess the right thing is to send a patch adding the cooling
> > > maps for the cpu thermal zones?
> >
> > Great, then the cooling maps should be added to this patch itself.
>
> Well, except that this patch itself has also landed:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=82bdc93972bf293c3407cb7fdac163aadfbb2c12
>
> ...so I think my advice is still correct: the right thing is to send a
> patch adding the cooling maps for the cpu thermal zones

In that case, yes.
