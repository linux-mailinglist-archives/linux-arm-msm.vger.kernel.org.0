Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4FF571A08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbiGLMcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233140AbiGLMcn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:32:43 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDDAADD66
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:32:33 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id y14-20020a17090a644e00b001ef775f7118so11244120pjm.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j9fXFYaNQGjPNAdSqU+JqLaWphZlD2jMWmDigPpHlo4=;
        b=pmneYWxKG+l0k7o2Ru2dxkX4IkbK/Fxm0bXrMyEHqXMLA14sQqZ7MsSenGcQrG/1Go
         +kuFzTediLQI/bFPYptiyOAwdPg31hRKe/C7evmecYM+KTK6gPriSw+z57xC2d8vdMD9
         7Ezlp8qZv/WSEssoPCNgBm5WvsEv8p5Gidw/jporcs7peuUPV/GKeGClGBhrgyRy/7Ol
         a3RQZ9qAcFLjlpYcjVnC5+0+CY5gixedZd9H6FLY1D3kzwvRWxbW8NFgz8b8X4VzboRK
         EUZZHltR7NxoXworKxq64sMu3O30AsvWfSmJBTOPtLWhv6mVfUmOdY9jJHtYYU/wBrhT
         1lwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j9fXFYaNQGjPNAdSqU+JqLaWphZlD2jMWmDigPpHlo4=;
        b=64YRyHt4ezvbRno7Fbvokb/jbt2TNDitHoFt8EQKLlOBtrjdrbo2cp3BOiAQQbIHDF
         9CElsVvzok5IFMFZXuVToO+y2ZJQ5BHnEEA7uBSzGjtfYnNG4b4R0hNgqW6mEKNcWQRJ
         R2fCuOmmb5OgRlQGPaSQstNsFdoPNwXgO4viRR0rpUAKaVCbl9Z/LhfdctkbMm4h6+06
         +QcvmbdRTB11OdYBZbfzh4go1aa+Pyu2VVk3qK/ml0gWbJ1vUhOe3oIQ81/9dquFH79I
         KNaqExzv++LiP6cQBwgW2YgaP7h4N/Rhsku4+HkHmOJ5T5TJpJ+kzE6b5QB+uLB34u6D
         HHWw==
X-Gm-Message-State: AJIora/QVk3/gsan8CZMke0rApfhzyVgIsT0G5Jsz8gD1Wx25j3o6Hy3
        wI5VWgnQGFkXJY2hX7F7wFKHhccQRWmV53aK0mLpSA==
X-Google-Smtp-Source: AGRyM1usKHhbiNuirIEtFbgkVYmXSAQgGJk1Z0lyvxaBgA862fn4bUlQFqtHHnNCwtZHDInbXjYzA94jWde7qdQc2d8=
X-Received: by 2002:a17:90b:2096:b0:1f0:1c73:f62d with SMTP id
 hb22-20020a17090b209600b001f01c73f62dmr4065323pjb.120.1657629153338; Tue, 12
 Jul 2022 05:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220711083038.1518529-1-sumit.garg@linaro.org> <20220711154632.w5qtmroc22qc7yqq@maple.lan>
In-Reply-To: <20220711154632.w5qtmroc22qc7yqq@maple.lan>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Tue, 12 Jul 2022 18:02:22 +0530
Message-ID: <CAFA6WYPUX8aLGScx7er=3-iqEU9Vp+TsQAck_BnLz1RNMbr9cQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs assignment
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        nicolas.dechesne@linaro.org, mworsfold@impinj.com,
        andrey.konovalov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Jul 2022 at 21:16, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Jul 11, 2022 at 02:00:38PM +0530, Sumit Garg wrote:
> > Currently the DT for QCS404 SoC has setup for 2 USB2 PHYs with one each
> > assigned to USB3 controller and USB2 controller. This assignment is
> > incorrect which only works by luck: as when each USB HCI comes up it
> > configures the *other* controllers PHY which is enough to make them
> > happy. If, for any reason, we were to disable one of the controllers th=
en
> > both would stop working.
> >
> > This was a difficult inconsistency to be caught which was found while
> > trying to enable USB support in u-boot. So with all the required driver=
s
> > ported to u-boot, I couldn't get the same USB storage device enumerated
> > in u-boot which was being enumerated fine by the kernel.
> >
> > The root cause of the problem came out to be that I wasn't enabling USB=
2
> > PHY: "usb2_phy_prim" in u-boot. Then I realised that via simply disabli=
ng
> > the same USB2 PHY currently assigned to USB2 host controller in the
> > kernel disabled enumeration for USB3 host controller as well.
> >
> > So fix this inconsistency by correctly assigning USB2 PHYs.
> >
> > Fixes: 9375e7d719b3 ("arm64: dts: qcom: qcs404: Add USB devices and PHY=
s")
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> I've not got one of these board (nor any documentation for them) but the
> description and change look OK. Thus FWIW:
>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>

Thanks Daniel for the review.

BTW, I did confirmed that this fix is correct with respect to
documentation (SA2150P LINUX USB TECHNICAL OVERVIEW) as well:

2.1 USB memory addresses
=E2=96=A0 USB3.0 core address starts with 0x7580000. USB3.0 is connected to=
:
 =E2=96=A1 SS PHY with start address as 0x78000
 =E2=96=A1 HS PHY with start address as 0x7a000.
=E2=96=A0 USB2.0 core address starts with 0x78c0000; it is connected only t=
o
HS PHY with the start address as 0x7c000.

-Sumit

>
> Daniel.
>
>
> > ---
> >
> > Changes in v2:
> > - Update commit message description.
> >
> >  arch/arm64/boot/dts/qcom/qcs404.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts=
/qcom/qcs404.dtsi
> > index 513bf7343b2c..50edc11a5bb5 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > @@ -557,7 +557,7 @@ usb3_dwc3: usb@7580000 {
> >                               compatible =3D "snps,dwc3";
> >                               reg =3D <0x07580000 0xcd00>;
> >                               interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL=
_HIGH>;
> > -                             phys =3D <&usb2_phy_sec>, <&usb3_phy>;
> > +                             phys =3D <&usb2_phy_prim>, <&usb3_phy>;
> >                               phy-names =3D "usb2-phy", "usb3-phy";
> >                               snps,has-lpm-erratum;
> >                               snps,hird-threshold =3D /bits/ 8 <0x10>;
> > @@ -586,7 +586,7 @@ usb@78c0000 {
> >                               compatible =3D "snps,dwc3";
> >                               reg =3D <0x078c0000 0xcc00>;
> >                               interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL=
_HIGH>;
> > -                             phys =3D <&usb2_phy_prim>;
> > +                             phys =3D <&usb2_phy_sec>;
> >                               phy-names =3D "usb2-phy";
> >                               snps,has-lpm-erratum;
> >                               snps,hird-threshold =3D /bits/ 8 <0x10>;
> > --
> > 2.25.1
> >
