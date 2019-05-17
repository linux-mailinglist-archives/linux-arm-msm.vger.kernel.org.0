Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F66F215F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 11:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728682AbfEQJHX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 05:07:23 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:44384 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbfEQJHX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 05:07:23 -0400
Received: by mail-qk1-f195.google.com with SMTP id w25so3971992qkj.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2019 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RDY/8T5oG1sd9/9Tn8BhGcNJt4PUJySH+sHZQHkeoSg=;
        b=bctqSvnX24/0EmDwsbx0gT/9HlxYX9WU+CRUkaRId6ptX9ok5BbWG5IZ+BKEgllupu
         CNyterzYzW3/Sa/HI5k/yIxg/VDu+llzIfExQ64TLSP3MoXf2OhEyXGhJ3ywrDgtRDpX
         toxYSmSXSoKL8LRVSFG982d6WLVgHnEsJLishd/vdhwNUV1A850J+hpnu4OD93Q/00D0
         KhozlZV5vlPYZByhuQ7L3ZzwcQQzJNfehiYznPcZB1c9AFhPzL+tHk3nnk1DEw8m3/8I
         HLwzHqjMA6PgpMYJLDOtTCpmbfdKot1QK3ogNer24z5nMu/++CdznbhRO2lUmPWwLakQ
         VXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RDY/8T5oG1sd9/9Tn8BhGcNJt4PUJySH+sHZQHkeoSg=;
        b=MbBJ4oVy9FNQqApnu5YyRMlppdvy4pwgbHfPmJ+++LuYSRICZIZiw6S/bXXXBX8cKa
         QquQBZnpQWYQ11C+dfvvDvhRw3P+y1PovPyNsbT1jm6ndZD+jr5MJ1nRTu5pNetNjSLP
         xR3DbOXIHes00pzLO9C5SUlJfu3oWqd5+Lh169A8E1NT98GERQmwx9woCg3Sh/ptG2H8
         1X3/l8KzzwtWbZdGj+/O2DAlALtNcqMMssGQl0befUn4kOxGaf679E+ZYOzR6l3ohkYL
         F2AxGyV+rm065FTvmU5m3nz7SydejOEnqmMpRal9J1qiZS57CMnvpwOh6JKAKvNhq8KU
         4bIg==
X-Gm-Message-State: APjAAAXhkYbqg04MY6pZZsFmeZsqVPH4UNZX6wWnnmQbjQj+cZHdeC4U
        Ze16XowOMnDXh03LYQGxhff2DC1d9gBWWL6MBzSEfw==
X-Google-Smtp-Source: APXvYqxGfInFILzcA+biwsWsB0fCBvEwoMu9dgk2tcaHarP8YIKdLxb3d7Ayd5f7ngTpms3Y0huUXEzcFMSWjRsBgcs=
X-Received: by 2002:a37:8703:: with SMTP id j3mr42619017qkd.188.1558084041650;
 Fri, 17 May 2019 02:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <8648ba97d49a9f731001e4b36611be9650e37f37.1557486950.git.amit.kucheria@linaro.org>
 <CAHYWTt1ZiX4mC01PRwVHU7417NC2tHY-_Cd+fwn1EyY+shKW-g@mail.gmail.com>
In-Reply-To: <CAHYWTt1ZiX4mC01PRwVHU7417NC2tHY-_Cd+fwn1EyY+shKW-g@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Fri, 17 May 2019 14:37:10 +0530
Message-ID: <CAP245DViCCMuDVF3M4GUuVm-8O4s=xFYio6Q5B4zqMxYRm875A@mail.gmail.com>
Subject: Re: [PATCHv1 6/8] arm64: dts: qcom: msm8996: Add PSCI cpuidle low
 power states
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 14, 2019 at 9:42 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> On Fri, May 10, 2019 at 04:59:44PM +0530, Amit Kucheria wrote:
> > Add device bindings for cpuidle states for cpu devices.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 28 +++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index c761269caf80..b615bcb9e351 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -95,6 +95,7 @@
> >                       compatible = "qcom,kryo";
> >                       reg = <0x0 0x0>;
> >                       enable-method = "psci";
> > +                     cpu-idle-states = <&LITTLE_CPU_PD>;
> >                       next-level-cache = <&L2_0>;
> >                       L2_0: l2-cache {
> >                             compatible = "cache";
> > @@ -107,6 +108,7 @@
> >                       compatible = "qcom,kryo";
> >                       reg = <0x0 0x1>;
> >                       enable-method = "psci";
> > +                     cpu-idle-states = <&LITTLE_CPU_PD>;
> >                       next-level-cache = <&L2_0>;
> >               };
> >
> > @@ -115,6 +117,7 @@
> >                       compatible = "qcom,kryo";
> >                       reg = <0x0 0x100>;
> >                       enable-method = "psci";
> > +                     cpu-idle-states = <&BIG_CPU_PD>;
> >                       next-level-cache = <&L2_1>;
> >                       L2_1: l2-cache {
> >                             compatible = "cache";
> > @@ -127,6 +130,7 @@
> >                       compatible = "qcom,kryo";
> >                       reg = <0x0 0x101>;
> >                       enable-method = "psci";
> > +                     cpu-idle-states = <&BIG_CPU_PD>;
> >                       next-level-cache = <&L2_1>;
> >               };
> >
> > @@ -151,6 +155,30 @@
> >                               };
> >                       };
> >               };
> > +
> > +             idle-states {
> > +                     entry-method="psci";
>
> Please add a space before and after "=".
>
> > +
> > +                     LITTLE_CPU_PD: little-power-down {
>
> In Documentation/devicetree/bindings/arm/idle-states.txt
> they seem to use labels such as CPU_SLEEP_0_0 for the first
> cluster and CPU_SLEEP_1_0 for the second cluster.

Will change this to LITTLE_CPU_SLEEP_0. I feel there is value in
keeping BIG and LITTLE in the name explicitly to improve readability
when correlating the idle state parameters to each CPU.

>
> Please also consider my comment in patch 4/8.
>
> > +                             compatible = "arm,idle-state";
> > +                             idle-state-name = "standalone-power-collapse";
> > +                             arm,psci-suspend-param = <0x00000004>;
> > +                             entry-latency-us = <40>;
> > +                             exit-latency-us = <40>;
>
> Where did you get the latency values from?
> Downstream seems to use qcom,latency-us = <80> for "fpc".
>

Will fix.

> (Sure downstream also defines "fpc-def", but that seems to require
> additional psci code/calls that doesn't exist upstream.)
>
> > +                             min-residency-us = <300>;
> > +                             local-timer-stop;
>
> Are you sure that the local timer is stopped?
> the equivalent DT property to "local-timer-stop" in downstream is
> "qcom,use-broadcast-timer", and this property seems to be missing
> from this node:
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8996-pm.dtsi?h=msm-4.4#n158
>
> You could try to remove "local-timer-stop", if it is really needed,
> then the system should hang without this property.

Will review and test again.

>
> > +                     };
> > +
> > +                     BIG_CPU_PD: big-power-down {
> > +                             compatible = "arm,idle-state";
> > +                             idle-state-name = "standalone-power-collapse";
> > +                             arm,psci-suspend-param = <0x00000004>;
> > +                             entry-latency-us = <40>;
> > +                             exit-latency-us = <40>;
>
> Where did you get the latency values from?
> Downstream seems to use qcom,latency-us = <80> for "fpc".
>
> (Sure downstream also defines "fpc-def", but that seems to require
> additional psci code/calls that doesn't exist upstream.)
>
> > +                             min-residency-us = <300>;
> > +                             local-timer-stop;
>
> Are you sure that the local timer is stopped?
> the equivalent DT property to "local-timer-stop" in downstream is
> "qcom,use-broadcast-timer", and this property seems to be missing
> from this node:
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8996-pm.dtsi?h=msm-4.4#n247
>
> You could try to remove "local-timer-stop", if it is really needed,
> then the system should hang without this property.
>
>
> > +                     };
> > +             };
> >       };
> >
> >       thermal-zones {
> > --
> > 2.17.1
> >
