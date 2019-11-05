Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6A25F004B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 15:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731003AbfKEOvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 09:51:36 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44231 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728942AbfKEOvg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 09:51:36 -0500
Received: by mail-qk1-f196.google.com with SMTP id m16so20998215qki.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2019 06:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uYl0KjrEv9Q2fdLs6NYOjLfGeZFa/Sr+lnmD652MtRI=;
        b=H8xdymB0cGUDXEMvbtbJMAL6qBdhLzrnZTOO1QO8jH9p/3pNXubisYMykQqflatEFB
         tlJEl6YSvQpivAdYzQv/5o18WWVAuuxKYPVgb6AaWDbtp6gXsq5+vynGMJMcCKVnI6nE
         tlFWNf9YyX1oaqyVZD3ifMAoj+JW7qrl9WrMZiXVVgi2vG7JgyihqkHZrizYkxiY/F56
         PbnDYEjHShNf2Fmmq+0q4kMpJhOBklKZKeLHih9j4OxkjVUHS5u65TBHtHlrOgpAXxnn
         iieP+YcBoFVXhYvOoM3y2j3QkVfEv8ag8r3V1IQFX8JijKsKSqEAaQ+wzm5O/PuDI4hb
         bJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uYl0KjrEv9Q2fdLs6NYOjLfGeZFa/Sr+lnmD652MtRI=;
        b=J35yPXtb0+BYoduPt+RW8yBXg+6kzcrrcBQfIUt70SY/+i9l3v39PX/nDjjKQAT9wb
         i8pAgSlzQYsIaO78dUyXJCYv5SKrDAco7C6dSacNeU+7T2lllpha2ILRT8Kki6W33PSQ
         HuEo8/BZaXRHpbbJkaLhgpeyI6Xx42EBWnF6WXUOVRGbqet25FVgmIL8nhOCtOkuDeaD
         kNaqT2cvAIs7KDBsO1Xz87mL2ZHuJLoz4drfs/v2iM7H1qkPGJgrJWAv9GdQy4TQPlFI
         +e9EtpzPPLdk+fvpHHxTCAiSF3J1rkRPA8dU/4tC2wAmTYPGsiY1CsSrd/YpUvPv7r8d
         R5RA==
X-Gm-Message-State: APjAAAUUSmiq2IZoG61nBmuCcksgGHIwBu5kSZYOOmMQXD2pbdfGCX6H
        /a+9L5HA4V1DbwWjs343T/W1ycaBIp1YzmwbTccuFg==
X-Google-Smtp-Source: APXvYqzGPmuUNzRcNl4nCWY9qbqLt3ZVffUgLt+cslxAC0qbCCChqf3XGl5+61mPiy+nnDobNSYGuCSIbzsYslFDySQ=
X-Received: by 2002:a37:b6c3:: with SMTP id g186mr5225455qkf.187.1572965493257;
 Tue, 05 Nov 2019 06:51:33 -0800 (PST)
MIME-Version: 1.0
References: <1572610108-1363-1-git-send-email-rkambl@codeaurora.org>
 <1572610108-1363-2-git-send-email-rkambl@codeaurora.org> <5dc09bbb.1c69fb81.196e5.9770@mx.google.com>
In-Reply-To: <5dc09bbb.1c69fb81.196e5.9770@mx.google.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 5 Nov 2019 20:21:22 +0530
Message-ID: <CAP245DWz7qkS3mGEjRA-EfhGieZtOAbnLsPZCHqSG9DL+NvPcg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sc7180: Add device node support for
 TSENS in SC7180
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajeshwari <rkambl@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, sanm@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajeshwari,

On Tue, Nov 5, 2019 at 3:14 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rajeshwari (2019-11-01 05:08:28)
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 07ea393..06ded1d 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -449,6 +465,508 @@
> >                 };
> >         };
> >
> > +       thermal-zones {
> > +               aoss-0-usr {
> > +                       polling-delay-passive = <0>;
> > +                       polling-delay = <0>;
>
> Can we get real polling delays instead of 0?
>
> > +                       thermal-governor = "user_space";
> > +                       thermal-sensors = <&tsens0 0>;
> > +                       wake-capable-sensor;
>
> What is this property?

Downstream property. If you need this, propose changes to the tsens bindings.

> > +                       trips {
> > +                               active-config0 {
> > +                                       temperature = <125000>;
> > +                                       hysteresis = <1000>;
> > +                                       type = "passive";
> > +                               };
> > +                               reset-mon-cfg {
> > +                                       temperature = <115000>;
> > +                                       hysteresis = <5000>;
> > +                                       type = "passive";
> > +                               };
> > +                       };
> > +               };
> > +
> > +               cpu-0-0-usr {
> > +                       polling-delay-passive = <0>;
> > +                       polling-delay = <0>;
> > +                       thermal-governor = "user_space";
>
> What is this property?

Based on a downstream property that was rejected upstream. Please get rid of it.

Regards,
Amit
