Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87B1119667D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 14:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgC1N6R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Mar 2020 09:58:17 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44771 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgC1N6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Mar 2020 09:58:16 -0400
Received: by mail-oi1-f193.google.com with SMTP id v134so11417581oie.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2020 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F5GIL++8zBGXWhLwu1qEZ/i3Tc92UygFdLynu+fcJhw=;
        b=PIw+m41obT9oqq6q1NjItJYlWp0+tHIm7+iyLWITknOKn6g66S9thBXbTqCLiaXjso
         BF++h5obXs/XQgB21qv+LCBI2EgfdIauinp3H8i5RMBqrOHFa1a4cMDIIdATqLD3sfvE
         MVul/ful3CYrFQKths9zRaXHiBJK5J5k9dBe8tD+IP4r4Ake/NyazNyA9fhboKVJA5KL
         YY17BBVZ7WTyKER3Hx7QHNEiknHs5sBfbrBKNxzV5lk5LI13j/kGANtH30sKeHJv3D8K
         WE4EJnejrqjYl0X3aoVKz61mgEYPUKNm/RVOml4mlCCktGXe5Ut4N9BkMrtMM/JY5H1R
         O91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F5GIL++8zBGXWhLwu1qEZ/i3Tc92UygFdLynu+fcJhw=;
        b=R8JFk7K8sYIOg6oj0dmWM17qI2wkfMDs/1CXP0nW0r+pG+vxjv2GIgYYezcqH7uyt0
         xUUgvUv3CDklloSXBOi15EBpNX4P0oo/Z5uKBwF2aC65thoEd1VyH2gYuyV3kxd0Haqp
         dbSFE/xW380vHOQxB0uVHZ8bQY0rMTmVF+5kNrIAgeIv3lL5Oii4pt+1uJ9pY+g/D4og
         EkGSYlNZDifRKeXbqIOF1O3QMgpezP0xLhBrz4Hn//+JKKe81MxqFcRzN7/fJzX/zmdp
         h2K5G+5Rs6zpJLLo2/O98vodP6kdIqzN88V4+OBrDHa1D/Sh/mXTvRPQR4u2OuSw3iYc
         0isA==
X-Gm-Message-State: ANhLgQ20IgW+Aw/I8CC9+066pwOiQQ9b8s2248lvOglJQDRzk68pCCgJ
        OvgPdwWm99+1+8dKsFuPoZEOoJL/JEIZTExuHpk6OQ==
X-Google-Smtp-Source: ADFU+vvCksTZRYC/m4EzMfyXk3wIjF8B/8bsESLpay/HTep2sDD1QQrgrVFBWIwBt7ofPpVvkQTCui/ESGlyqv8Gk1k=
X-Received: by 2002:aca:c488:: with SMTP id u130mr2472140oif.154.1585403895752;
 Sat, 28 Mar 2020 06:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200127212319.1544222-1-robert.marko@sartura.hr>
 <20200127212319.1544222-3-robert.marko@sartura.hr> <20200327221213.GD5063@builder>
In-Reply-To: <20200327221213.GD5063@builder>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Sat, 28 Mar 2020 14:58:04 +0100
Message-ID: <CA+HBbNF5Uh1xsu=nkMHjU32nhep4KAA4AkhOKfcNeYiu5VYVoQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     John Crispin <john@phrozen.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 27, 2020 at 11:12 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 27 Jan 13:23 PST 2020, Robert Marko wrote:
>
> > From: John Crispin <john@phrozen.org>
> >
> > Since we now have driver for the USB PHY, lets add the necessary nodes to DTSI.
> >
> > Signed-off-by: John Crispin <john@phrozen.org>
> > Tested-by: Robert Marko <robert.marko@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
>
> Robert, I'm missing your Signed-off-by here (and I would like Kishon to
> take the PHY before merging this).
Solved in v4.
Thanks
>
> Regards,
> Bjorn
>
> > ---
> >  arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 20 +++++
> >  arch/arm/boot/dts/qcom-ipq4019.dtsi           | 74 +++++++++++++++++++
> >  2 files changed, 94 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> > index 418f9a022336..2ee5f05d5a43 100644
> > --- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> > +++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> > @@ -109,5 +109,25 @@
> >               wifi@a800000 {
> >                       status = "ok";
> >               };
> > +
> > +             usb3_ss_phy: ssphy@9a000 {
> > +                     status = "ok";
> > +             };
> > +
> > +             usb3_hs_phy: hsphy@a6000 {
> > +                     status = "ok";
> > +             };
> > +
> > +             usb3: usb3@8af8800 {
> > +                     status = "ok";
> > +             };
> > +
> > +             usb2_hs_phy: hsphy@a8000 {
> > +                     status = "ok";
> > +             };
> > +
> > +             usb2: usb2@60f8800 {
> > +                     status = "ok";
> > +             };
> >       };
> >  };
> > diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> > index b6e5203a210b..18e9c639514c 100644
> > --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> > +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> > @@ -564,5 +564,79 @@
> >                                         "legacy";
> >                       status = "disabled";
> >               };
> > +
> > +             usb3_ss_phy: ssphy@9a000 {
> > +                     compatible = "qcom,usb-ss-ipq4019-phy";
> > +                     #phy-cells = <0>;
> > +                     reg = <0x9a000 0x800>;
> > +                     reg-names = "phy_base";
> > +                     resets = <&gcc USB3_UNIPHY_PHY_ARES>;
> > +                     reset-names = "por_rst";
> > +                     status = "disabled";
> > +             };
> > +
> > +             usb3_hs_phy: hsphy@a6000 {
> > +                     compatible = "qcom,usb-hs-ipq4019-phy";
> > +                     #phy-cells = <0>;
> > +                     reg = <0xa6000 0x40>;
> > +                     reg-names = "phy_base";
> > +                     resets = <&gcc USB3_HSPHY_POR_ARES>, <&gcc USB3_HSPHY_S_ARES>;
> > +                     reset-names = "por_rst", "srif_rst";
> > +                     status = "disabled";
> > +             };
> > +
> > +             usb3@8af8800 {
> > +                     compatible = "qcom,dwc3";
> > +                     reg = <0x8af8800 0x100>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <1>;
> > +                     clocks = <&gcc GCC_USB3_MASTER_CLK>,
> > +                              <&gcc GCC_USB3_SLEEP_CLK>,
> > +                              <&gcc GCC_USB3_MOCK_UTMI_CLK>;
> > +                     clock-names = "master", "sleep", "mock_utmi";
> > +                     ranges;
> > +                     status = "disabled";
> > +
> > +                     dwc3@8a00000 {
> > +                             compatible = "snps,dwc3";
> > +                             reg = <0x8a00000 0xf8000>;
> > +                             interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
> > +                             phys = <&usb3_hs_phy>, <&usb3_ss_phy>;
> > +                             phy-names = "usb2-phy", "usb3-phy";
> > +                             dr_mode = "host";
> > +                     };
> > +             };
> > +
> > +             usb2_hs_phy: hsphy@a8000 {
> > +                     compatible = "qcom,usb-hs-ipq4019-phy";
> > +                     #phy-cells = <0>;
> > +                     reg = <0xa8000 0x40>;
> > +                     reg-names = "phy_base";
> > +                     resets = <&gcc USB2_HSPHY_POR_ARES>, <&gcc USB2_HSPHY_S_ARES>;
> > +                     reset-names = "por_rst", "srif_rst";
> > +                     status = "disabled";
> > +             };
> > +
> > +             usb2@60f8800 {
> > +                     compatible = "qcom,dwc3";
> > +                     reg = <0x60f8800 0x100>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <1>;
> > +                     clocks = <&gcc GCC_USB2_MASTER_CLK>,
> > +                              <&gcc GCC_USB2_SLEEP_CLK>,
> > +                              <&gcc GCC_USB2_MOCK_UTMI_CLK>;
> > +                     clock-names = "master", "sleep", "mock_utmi";
> > +                     ranges;
> > +                     status = "disabled";
> > +
> > +                     dwc3@6000000 {
> > +                             compatible = "snps,dwc3";
> > +                             reg = <0x6000000 0xf8000>;
> > +                             interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> > +                             phys = <&usb2_hs_phy>;
> > +                             phy-names = "usb2-phy";
> > +                             dr_mode = "host";
> > +                     };
> > +             };
> >       };
> >  };
> > --
> > 2.24.1
> >
