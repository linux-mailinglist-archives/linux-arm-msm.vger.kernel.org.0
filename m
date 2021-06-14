Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE5C3A5E2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 10:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbhFNIQp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 04:16:45 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:33703 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbhFNIQo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 04:16:44 -0400
Received: by mail-ot1-f50.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so10089794otl.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 01:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9fAPXLcMnuwc5kCpl7ATb/uElPSg8emw9lkYjZEn50s=;
        b=CMMB9c9SNYcug0m4F1ZbPVi7DUsIGlDUumyOHeO/i8F+E69SBXH2sjS+kqYHIRRbeG
         Vxe/qqAlajLJuI6RUT0vWrZXQ3yy35DtDIFjP9Lcbjy3DHrXMRRCDb//DIIRPXGAb7Wh
         XZgRATsp+E5wcEk+EfXi4aX9H5TcaKUiTv7o5gHlTMJxa3QaL8KU1Ozi+8m+7MDgNYmP
         TvQA8FW+tptGFbQ8nONVbrrtyu6BPjDIyyDrAgiXUvVyQPvi+bLssV3s+ivDEDe6AjZK
         5v1YM0Lgt7qYrquhTy7cqd36QDNDQ8LrWvd30MxzNCy30zzAZNn48X8TR+sgYBf1a6Nv
         Q1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9fAPXLcMnuwc5kCpl7ATb/uElPSg8emw9lkYjZEn50s=;
        b=p/StQ3zANwxE+rw1fwPrOq20p0C+yKX7CKnN7yCO65FTBK8yQwQzpAyJeT2Q3/4sXP
         omPCg6KL/7Xejhbd5VCgHN26+Z5OR0A1B/s13OKHQkbxudffrwsewlEtsjAhEFhvOlax
         zRMgjovYTVyUYWWCMuufcSe3QBWFw/g55c4/XW4Dg6PMh2TKnla7t6mQ4waJ+fa23Zx6
         sPFFq0eOvLWF6ZLBLecZP1WsGbIalDK7nm7avn6ZutHLxvHbpXZqvYmn4kMsqJTH03JL
         YVgo2cxPhevIrSYYhm8hy+FhjoaE57Gf2A94oqRwb5Y2cPAr+/PGmDRB6TUK7LYsbKKc
         rQGQ==
X-Gm-Message-State: AOAM531wGdBrCvoamFIn71rpZIEUaWkQnveuzU7iIGHNMPr/6B9TIcjc
        +h9iMM4Fy4QXxrVnMPLXxaJvd2pQ2hLgK/qbfMFcFA==
X-Google-Smtp-Source: ABdhPJz8DM8QT5+LPi3vLgQJFg8bNtXU1+jZbaUqleKAU+eGBqG9HteIVw8UKD4NGymqASQjqrSmND1AaABbeZkdko8=
X-Received: by 2002:a9d:1726:: with SMTP id i38mr11894739ota.51.1623658422212;
 Mon, 14 Jun 2021 01:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-3-bhupesh.sharma@linaro.org> <YMLPvrVVdx0MZJlO@builder.lan>
In-Reply-To: <YMLPvrVVdx0MZJlO@builder.lan>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 14 Jun 2021 13:43:31 +0530
Message-ID: <CAH=2Nty=VB2G6_eEAna8ZAysSCt9mMydR0cXLyTa=jrZ7nQO5A@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible
 for SA8155p-adp
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Fri, 11 Jun 2021 at 08:21, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:
>
> > Add pmic-gpio compatible strings for pmm8155au_1 and pmm8155au_2 pmics
> > found on SA8155p-adp board.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-gpio@vger.kernel.org
> > Cc: bhupesh.linux@gmail.com
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > index f6a9760558a6..ee4721f1c477 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > @@ -27,6 +27,8 @@ PMIC's from Qualcomm.
> >                   "qcom,pm660l-gpio"
> >                   "qcom,pm8150-gpio"
> >                   "qcom,pm8150b-gpio"
> > +                 "qcom,pmm8155au-1-gpio"
> > +                 "qcom,pmm8155au-2-gpio"
>
> As with the regulator this seems to be a single component.
>
> >                   "qcom,pm8350-gpio"
> >                   "qcom,pm8350b-gpio"
> >                   "qcom,pm8350c-gpio"
> > @@ -116,6 +118,9 @@ to specify in a pin configuration subnode:
> >                                            and gpio8)
> >                   gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
> >                   gpio1-gpio12 for pm8150l (hole on gpio7)
> > +                 gpio1-gpio10 for pmm8155au-1 (holes on gpio2, gpio5, gpio7
> > +                                               and gpio8)
> > +                 gpio1-gpio10 for pmm8155au-2 (holes on gpio2, gpio5, gpio7)
>
> In the schematics all 10 pins are wired on both of these PMICs, so I
> don't think there are holes. Please omit the comment.

But if we look at the downstream dts (see [1]), we clearly have holes
on gpio 2, 5 and 7 on PMM8155AU_2 whereas if we see [2], we can see
PMM8155AU_1 has holes on gpio 2, 5, 7 and 8.

As I understand, the schematics mention some optional configurations
as well which might not be available depending on the default board
configuration.

[1]. https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/arch/arm64/boot/dts/qcom/sa8155-pmic-overlay.dtsi?h=LV.AU.0.1.0.r1-15900-gen3meta.0#n92
[2]. https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/arch/arm64/boot/dts/qcom/sa8155-pmic-overlay.dtsi?h=LV.AU.0.1.0.r1-15900-gen3meta.0#n36

Regards,
Bhupesh

>
> >                   gpio1-gpio10 for pm8350
> >                   gpio1-gpio8 for pm8350b
> >                   gpio1-gpio9 for pm8350c
> > --
> > 2.31.1
> >
