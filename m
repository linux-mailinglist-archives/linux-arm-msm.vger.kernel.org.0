Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67C4E11D1E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 17:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729605AbfLLQJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 11:09:27 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:34296 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729731AbfLLQJY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 11:09:24 -0500
Received: by mail-io1-f67.google.com with SMTP id z193so3385755iof.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 08:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZSuulaHZP7wrCDMhvr1mBj+rW2++SNmugkVI+athuy0=;
        b=fWA8oi4BNyT1AqiAexpCYnMadFV+cK60+9u4U1OnYTHAl/RMEBEZ1qUyJVXYWlq3AK
         1leJZGQkxQSsY3/UJ2F5h18b+SaKi1Ry6fQ3COI85Vg+fxU9oDxBY1qGfUS0JTTufQJq
         47xWja5YZkpXtzKA6w1TMeZbU4DNqk5ccNV54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZSuulaHZP7wrCDMhvr1mBj+rW2++SNmugkVI+athuy0=;
        b=Xu3oCt1XMmD3I9ajV2q2b6FkH9PFF7kohfx5rAWbLJzvjmHQFl7oimqGxKe7SseaM9
         ARa2X9LG7j+TT37K6CYgyxj6XQ2ACLR1Xj3tSZTdHB129cAUE46DaKnet0LatsTbtWfv
         A/jI3dfA+tZ17/sJyqw0r2P3D/wc+KxVTlQBuENnxNSyYn1jmW0UrvF3dHZsOqdAWNld
         1mrhXxcpSXBMdkDmIP2ZGTj4pP5HyyYmcdDzh9SNr67n0MXkFQaaFcpsieZgqz9WK5Fy
         Q721A3Lbd0ftDUuU1/Z7RL/PqKn01CgDuuzpER5y0bxjpFtHCgiNH4xhKs3421Z/vZ8V
         6pTg==
X-Gm-Message-State: APjAAAWEKi5LmzGpGQ9/8cGMCdyh7toE095nbJck+P4RWcw7920E/lPm
        YLeNdbDTnXMgHK+lx3kXRp6f33e70LU=
X-Google-Smtp-Source: APXvYqz98/CT6jO6Pkr/UAjx+14/RFlhan/O7ig8H4frz7U5QmGONJTYtC6lsC4zLQrT/vMTpDeq6g==
X-Received: by 2002:a02:9203:: with SMTP id x3mr8460552jag.62.1576166963277;
        Thu, 12 Dec 2019 08:09:23 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id f76sm1830594ild.82.2019.12.12.08.09.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 08:09:21 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id x1so3352636iop.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 08:09:21 -0800 (PST)
X-Received: by 2002:a02:2385:: with SMTP id u127mr8799499jau.127.1576166960582;
 Thu, 12 Dec 2019 08:09:20 -0800 (PST)
MIME-Version: 1.0
References: <1574934847-30372-1-git-send-email-rkambl@codeaurora.org>
 <1574934847-30372-2-git-send-email-rkambl@codeaurora.org> <CAHLCerOVH1xLjMmDNFVx=YYYTA3MipaOhHZ-AYtxEnDFgRbSJg@mail.gmail.com>
In-Reply-To: <CAHLCerOVH1xLjMmDNFVx=YYYTA3MipaOhHZ-AYtxEnDFgRbSJg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 Dec 2019 08:09:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UDGcnLLkBiTBr5GgrzNH20qf9pDQW8wdoqsbO4832M4Q@mail.gmail.com>
Message-ID: <CAD=FV=UDGcnLLkBiTBr5GgrzNH20qf9pDQW8wdoqsbO4832M4Q@mail.gmail.com>
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

On Thu, Dec 12, 2019 at 3:00 AM Amit Kucheria
<amit.kucheria@verdurent.com> wrote:
>
> Hi Rajeshwari,
>
> On Thu, Nov 28, 2019 at 3:25 PM Rajeshwari <rkambl@codeaurora.org> wrote:
> >
> > Add TSENS node and user thermal zone for TSENS sensors in SC7180.
> >
> > Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 527 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 527 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 666e9b9..6656ffc 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -911,6 +911,26 @@
> >                         status = "disabled";
> >                 };
> >
> > +               tsens0: thermal-sensor@c263000 {
> > +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
> > +                       reg = <0 0x0c263000 0 0x1ff>, /* TM */
> > +                               <0 0x0c222000 0 0x1ff>; /* SROT */
> > +                       #qcom,sensors = <15>;
> > +                       interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names = "uplow";
> > +                       #thermal-sensor-cells = <1>;
> > +               };
> > +
> > +               tsens1: thermal-sensor@c265000 {
> > +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
> > +                       reg = <0 0x0c265000 0 0x1ff>, /* TM */
> > +                               <0 0x0c223000 0 0x1ff>; /* SROT */
> > +                       #qcom,sensors = <10>;
> > +                       interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names = "uplow";
> > +                       #thermal-sensor-cells = <1>;
> > +               };
> > +
> >                 spmi_bus: spmi@c440000 {
> >                         compatible = "qcom,spmi-pmic-arb";
> >                         reg = <0 0x0c440000 0 0x1100>,
> > @@ -1121,6 +1141,513 @@
> >                 };
> >         };
> >
> > +       thermal-zones {
> > +               cpu0-thermal {
> > +                       polling-delay-passive = <250>;
> > +                       polling-delay = <1000>;
> > +
> > +                       thermal-sensors = <&tsens0 1>;
> > +
> > +                       trips {
> > +                               cpu0_alert0: trip-point0 {
> > +                                       temperature = <90000>;
> > +                                       hysteresis = <2000>;
> > +                                       type = "passive";
> > +                               };
> > +
> > +                               cpu0_alert1: trip-point1 {
> > +                                       temperature = <95000>;
> > +                                       hysteresis = <2000>;
> > +                                       type = "passive";
> > +                               };
> > +
> > +                               cpu0_crit: cpu_crit {
> > +                                       temperature = <110000>;
> > +                                       hysteresis = <1000>;
> > +                                       type = "critical";
> > +                               };
>
> Where are the cooling maps for all the cpu thermal zones? A passive
> trip point w/o a cooling map is not of much use. If you are waiting
> for cpufreq support to land before adding them, then remove the
> passive trip points for now and add them along with the cooling maps
> when you have cooling devices.

I will note that cpufreq support has landed in the qcom tree::

https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=86899d8235ea0d3d7c293404fb43a6fabff866e6

...so I guess the right thing is to send a patch adding the cooling
maps for the cpu thermal zones?

-Doug
