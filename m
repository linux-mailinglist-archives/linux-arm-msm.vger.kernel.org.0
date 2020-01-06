Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 836F6131BFD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 00:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgAFXBp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 18:01:45 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35199 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbgAFXBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 18:01:45 -0500
Received: by mail-oi1-f193.google.com with SMTP id k4so17060090oik.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 15:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L/UWf+M41qEWyhZEUwNrSpluVFcLWOF99dLaPVLmmyQ=;
        b=mHBdAgvi53lR/6D5+BxQVcjbZqaA8bIz/bRkGZbHfVQ0EnbrG0JvupRk6J6VY5hfFi
         OV6WkLpamxIUYCmMn+0XFMNQN38U2o171ZK4Ic9Sei4P16I3H/dy5YhCF8zTitOfrGpc
         SZtWHi1WPjAWMUolVEgcTDa9GgD3nACAU6TOweX3QxMlvJxfn4SXZan2DwS+yJU1naVk
         bNa5NbU+dEsYTL8+iFzBlQIVwULXFazRjWANNHQ55T/2gupVRSR7cIjG+UznTgKF7nXZ
         pS5SEIrmpJvjCnjrYxnPHoJSaviwE4QnY1/b95vlvGrKJCntgQ/tGLDrO4Bjq/gRVe0x
         OZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L/UWf+M41qEWyhZEUwNrSpluVFcLWOF99dLaPVLmmyQ=;
        b=Lp24MmXogu83MdTnwcRDmMKC16/a7Hr5dIjzOah71J6+xfmlLO/4gD2NnN8tDW307J
         2CcQVEU/js80hM6T9SMWeYPqLtg1eNZexLCDh5Cy71dwVr86NEmbqb68Hzh7BXaB7pV2
         oG04JnSjCtyvj/fSsMSDikJi+bs5Ddd6nMHRnLd1r3qr7pM202mJ76OzMvYQgsNQOpP/
         slm/AlaI6WAkr7i5HwPdp6Myd0LFa4S55sXnbXowiSh2fBIHBdbRiwrxWL2ZkPrG+NVt
         sQq8aL6WY4i6jIOnwsmLzcrOxm7DZssyMzMVpER32DmdgbcvhxkQhIdbXlXMm3M2IvfM
         nnKg==
X-Gm-Message-State: APjAAAWkRa+kqTN6c3EtYlFH/V9MwobjdFT4u2doL/vE/BiOjQcqg0mA
        LaABu2k3o7FR0+AaWFY1d4sXWpcWe2YcSmdgw8PpVQ==
X-Google-Smtp-Source: APXvYqyYT0X87tAjCZ4vyAc7F2bZqCK1KXaNjsfRXyktkjo3Zstu9tFbHKwsLUsnD54dkRk5wM4YImCFISXuQ7mFMSE=
X-Received: by 2002:aca:1c0d:: with SMTP id c13mr6054036oic.44.1578351703943;
 Mon, 06 Jan 2020 15:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20200106143633.1268701-1-robert.marko@sartura.hr> <20200106192248.GX3755841@builder>
In-Reply-To: <20200106192248.GX3755841@builder>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 7 Jan 2020 00:01:32 +0100
Message-ID: <CA+HBbNEutgjfQYzCH0s6OkebgDi=iDAqCgnBDSFajs+4F1bGhA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: add gpio-ranges property
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>,
        Sven Eckelmann <sven.eckelmann@openmesh.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 6, 2020 at 8:22 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 06 Jan 06:36 PST 2020, Robert Marko wrote:
>
> > From: Christian Lamparter <chunkeey@gmail.com>
> >
> > This patch adds the gpio-ranges property to almost all of
> > the Qualcomm ARM platforms that utilize the pinctrl-msm
> > framework.
> >
> > The gpio-ranges property is part of the gpiolib subsystem.
> > As a result, the binding text is available in section
> > "2.1 gpio- and pin-controller interaction" of
> > Documentation/devicetree/bindings/gpio/gpio.txt
> >
> > For more information please see the patch titled:
> > "pinctrl: msm: fix gpio-hog related boot issues" from
> > this series.
> >
> > Reported-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> > Tested-by: Sven Eckelmann <sven.eckelmann@openmesh.com> [ipq4019]
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> > Tested-by: Robert Marko <robert.marko@sartura.hr> [ipq4019]
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
>
> Thanks for follow up on this Robert!
>
> We carry dts patches for arm and arm64 in different branches on their
> way towards Torvalds, can you please split the patch in two? (Double
> check that the two parts adds up to an equivalent change and you can
> carry the reviewed-by and tested-by on the two patches).

Sure, can do.
>
> Also I need your Signed-off-by at the end of the tags-list as you
> forward Christian's patch.

Will add it,
Cheers
>
> Regards,
> Bjorn
>
> > ---
> >  arch/arm/boot/dts/qcom-apq8064.dtsi   | 1 +
> >  arch/arm/boot/dts/qcom-apq8084.dtsi   | 1 +
> >  arch/arm/boot/dts/qcom-ipq4019.dtsi   | 1 +
> >  arch/arm/boot/dts/qcom-ipq8064.dtsi   | 1 +
> >  arch/arm/boot/dts/qcom-mdm9615.dtsi   | 1 +
> >  arch/arm/boot/dts/qcom-msm8660.dtsi   | 1 +
> >  arch/arm/boot/dts/qcom-msm8960.dtsi   | 1 +
> >  arch/arm/boot/dts/qcom-msm8974.dtsi   | 1 +
> >  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 1 +
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
> >  arch/arm64/boot/dts/qcom/msm8992.dtsi | 1 +
> >  arch/arm64/boot/dts/qcom/msm8994.dtsi | 1 +
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 +
> >  13 files changed, 13 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> > index 8b79b4112ee1..2687c4e890ba 100644
> > --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> > @@ -350,6 +350,7 @@
> >                       reg = <0x800000 0x4000>;
> >
> >                       gpio-controller;
> > +                     gpio-ranges = <&tlmm_pinmux 0 0 90>;
> >                       #gpio-cells = <2>;
> >                       interrupt-controller;
> >                       #interrupt-cells = <2>;
> > diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> > index 0a0fb147ebb9..4cc2d33f3d3b 100644
> > --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> > +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> > @@ -401,6 +401,7 @@
> >                       compatible = "qcom,apq8084-pinctrl";
> >                       reg = <0xfd510000 0x4000>;
> >                       gpio-controller;
> > +                     gpio-ranges = <&tlmm 0 0 147>;
> >                       #gpio-cells = <2>;
> >                       interrupt-controller;
> >                       #interrupt-cells = <2>;
> > diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> > index 72d4e290b543..b6e5203a210b 100644
> > --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> > +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> > @@ -201,6 +201,7 @@
> >                       compatible = "qcom,ipq4019-pinctrl";
> >                       reg = <0x01000000 0x300000>;
> >                       gpio-controller;
> > +                     gpio-ranges = <&tlmm 0 0 100>;
> >                       #gpio-cells = <2>;
> >                       interrupt-controller;
> >                       #interrupt-cells = <2>;
> > diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> > index 16c0da97932c..4021f661cd11 100644
> > --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> > @@ -119,6 +119,7 @@
> >                       reg = <0x800000 0x4000>;
> >
> >                       gpio-controller;
> > +                     gpio-ranges = <&qcom_pinmux 0 0 69>;
> >                       #gpio-cells = <2>;
> >                       interrupt-controller;
> >                       #interrupt-cells = <2>;
> > diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> > index 356e9535f7a6..347b4f7d7889 100644
> > --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> > +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> > @@ -128,6 +128,7 @@
> >               msmgpio: pinctrl@800000 {
> >                       compatible = "qcom,mdm9615-pinctrl";
> >                       gpio-controller;
> > +                     gpio-ranges = <&msmgpio 0 0 88>;
> >                       #gpio-cells = <2>;
> >                       interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> >                       interrupt-controller;
> > diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
> > index ec5cbc468bd3..480fc08cbe8e 100644
> > --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
> > +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
> > @@ -115,6 +115,7 @@
> >                       reg = <0x800000 0x4000>;
> >
> >                       gpio-controller;
> > +                     gpio-ranges = <&tlmm 0 0 173>;
> >                       #gpio-cells = <2>;
> >                       interrupts = <0 16 0x4>;
> >                       interrupt-controller;
> > diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
> > index f2aeaccdc1ad..172ea3c70eac 100644
> > --- a/arch/arm/boot/dts/qcom-msm8960.dtsi
> > +++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
> > @@ -107,6 +107,7 @@
> >               msmgpio: pinctrl@800000 {
> >                       compatible = "qcom,msm8960-pinctrl";
> >                       gpio-controller;
> > +                     gpio-ranges = <&msmgpio 0 0 152>;
> >                       #gpio-cells = <2>;
> >                       interrupts = <0 16 0x4>;
> >                       interrupt-controller;
> > diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > index 369e58f64145..1689cf925b03 100644
> > --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> > +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > @@ -707,6 +707,7 @@
> >                       compatible = "qcom,msm8974-pinctrl";
> >                       reg = <0xfd510000 0x4000>;
> >                       gpio-controller;
> > +                     gpio-ranges = <&msmgpio 0 0 146>;
> >                       #gpio-cells = <2>;
> >                       interrupt-controller;
> >                       #interrupt-cells = <2>;
> > diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > index 67ee5f560104..2b31823d3ccd 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > @@ -21,6 +21,7 @@
> >                       reg = <0x1000000 0x300000>;
> >                       interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> >                       gpio-controller;
> > +                     gpio-ranges = <&tlmm 0 0 70>;
> >                       #gpio-cells = <0x2>;
> >                       interrupt-controller;
> >                       #interrupt-cells = <0x2>;
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index 5ea9fb8f2f87..2d1cbe762b3a 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -374,6 +374,7 @@
> >                       reg = <0x1000000 0x300000>;
> >                       interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> >                       gpio-controller;
> > +                     gpio-ranges = <&msmgpio 0 0 122>;
> >                       #gpio-cells = <2>;
> >                       interrupt-controller;
> >                       #interrupt-cells = <2>;
> > diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> > index 8be60c08a9ab..2021795c99ad 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> > @@ -171,6 +171,7 @@
> >                       reg = <0xfd510000 0x4000>;
> >                       interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> >                       gpio-controller;
> > +                     gpio-ranges = <&msmgpio 0 0 146>;
> >                       #gpio-cells = <2>;
> >                       interrupt-controller;
> >                       #interrupt-cells = <2>;
> > diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> > index 3932757f78b7..b1c2d7d6a0f2 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> > @@ -133,6 +133,7 @@
> >                       reg = <0xfd510000 0x4000>;
> >                       interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> >                       gpio-controller;
> > +                     gpio-ranges = <&msmgpio 0 0 146>;
> >                       #gpio-cells = <2>;
> >                       interrupt-controller;
> >                       #interrupt-cells = <2>;
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 87f4d9c1b0d4..81576aeb2408 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -1234,6 +1234,7 @@
> >                       reg = <0x01010000 0x300000>;
> >                       interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> >                       gpio-controller;
> > +                     gpio-ranges = <&msmgpio 0 0 150>;
> >                       #gpio-cells = <2>;
> >                       interrupt-controller;
> >                       #interrupt-cells = <2>;
> > --
> > 2.24.1
> >
