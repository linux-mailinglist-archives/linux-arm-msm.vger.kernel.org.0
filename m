Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AB92819B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 19:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388484AbgJBRjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 13:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388483AbgJBRj0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 13:39:26 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B108FC0613E3
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2020 10:39:26 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id 26so1994333ois.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 10:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ule5Qp5lbMfHaY0RAIOheId/VOYyQUNSqQkCu9QXrwc=;
        b=RsWduYJjPDsmhfA0N6SiS3A8cjjci69TyMJnXNuoBlVAYGeLjfUovB54bB8YifmQZS
         dd8DlhE+poY1vwJakTA+OYdTXlBT7KkeYppgqBfB9Mpxwlbht2gFq1dCD7Th4zSOhGLk
         bskGAhBZAhXgouEyLgnFwoHjpDD2mhOq1mS/riwWL9HBBH0v0R4ED+hcVJWit24fk0Ud
         FQELFzw90RXsZudKVJZOvesHZ04cp7heu6AXnUv8aM8qeehi3+uuqERVdFe14FwVgR15
         /iz6qtcA+qEx4a4XTzQiEX0tp11FHj0qwre/TuyLqUDSIJnE2prIy+EKutzY+ONdk5Cr
         zLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ule5Qp5lbMfHaY0RAIOheId/VOYyQUNSqQkCu9QXrwc=;
        b=WDTqjs7QVvJsd2sMJ+f8JHK6bK83ygq0t7oDXAEcTR/uHTSIw4fDfdZ3Ry8F0XhniX
         gvGutjqTvAHnYH+0c333BoMrinq52S3O8hkjWs3GBbAdjkOAOyexVucAnb5jA8jOgDNQ
         jiTTEHwFGXhwRcO9M2Rmkcn1uEJ1N4blHMyBrMYalV5tBdV9zDDZrqtJ4sMTgUvBmi0f
         TcPyi7SkXN/RyDxn66EJrUtwEeIf01pTb9Rdf+vkZdNTbS7o0IG1AKA9FTTCRZsBPsbU
         kH2vNRk7R1UrsCQK3mOAFfXm2DagO2sM/JaT436zp1WSTU6iDFzLxMZqjSDEPylAMnVU
         kxGQ==
X-Gm-Message-State: AOAM530ETux48V9nvt2wmTp/+10lo6smS9W3Nztg8D06lHdI94/1csPU
        Iq5lFTJB84zJKdxM7RH8FYxl9k1LDrCiUp4CLIQZcQ==
X-Google-Smtp-Source: ABdhPJwg690Zdw18KeyjOlJrSIrZ5ZOPOR0vqBIuTeFXQjz9ruDkmCVvKFVkZ0TfN7KQGYrUwpI2zAYPrT/nycSfelc=
X-Received: by 2002:aca:4ac2:: with SMTP id x185mr1866012oia.96.1601660366046;
 Fri, 02 Oct 2020 10:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200909163831.1894142-1-robert.marko@sartura.hr>
In-Reply-To: <20200909163831.1894142-1-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 2 Oct 2020 19:39:15 +0200
Message-ID: <CA+HBbNGZmeejTPszL1jf_01wZP6xZqRyZUa15XpO+y6JCw3ajg@mail.gmail.com>
Subject: Re: [PATCH v8] ARM: dts: qcom: ipq4019: add USB devicetree nodes
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 9, 2020 at 6:38 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> From: John Crispin <john@phrozen.org>
>
> Since we now have driver for the USB PHY, and USB controller is already supported by the DWC3 driver lets add the necessary nodes to DTSI.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes from v7 to v8:
> * Add labels for usb2 and usb3 nodes
> Changes from v6 to v7:
> * Remove changes to qcom-ipq4019-ap.dk01.1.dtsi
> It has slipped in unwanted, we only want to add
> nodes to the DTSI.
>
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 74 +++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index 74d8e2c8e4b3..4a973253024a 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -605,5 +605,79 @@ ethphy4: ethernet-phy@4 {
>                                 reg = <4>;
>                         };
>                 };
> +
> +               usb3_ss_phy: ssphy@9a000 {
> +                       compatible = "qcom,usb-ss-ipq4019-phy";
> +                       #phy-cells = <0>;
> +                       reg = <0x9a000 0x800>;
> +                       reg-names = "phy_base";
> +                       resets = <&gcc USB3_UNIPHY_PHY_ARES>;
> +                       reset-names = "por_rst";
> +                       status = "disabled";
> +               };
> +
> +               usb3_hs_phy: hsphy@a6000 {
> +                       compatible = "qcom,usb-hs-ipq4019-phy";
> +                       #phy-cells = <0>;
> +                       reg = <0xa6000 0x40>;
> +                       reg-names = "phy_base";
> +                       resets = <&gcc USB3_HSPHY_POR_ARES>, <&gcc USB3_HSPHY_S_ARES>;
> +                       reset-names = "por_rst", "srif_rst";
> +                       status = "disabled";
> +               };
> +
> +               usb3: usb3@8af8800 {
> +                       compatible = "qcom,dwc3";
> +                       reg = <0x8af8800 0x100>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       clocks = <&gcc GCC_USB3_MASTER_CLK>,
> +                                <&gcc GCC_USB3_SLEEP_CLK>,
> +                                <&gcc GCC_USB3_MOCK_UTMI_CLK>;
> +                       clock-names = "master", "sleep", "mock_utmi";
> +                       ranges;
> +                       status = "disabled";
> +
> +                       dwc3@8a00000 {
> +                               compatible = "snps,dwc3";
> +                               reg = <0x8a00000 0xf8000>;
> +                               interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
> +                               phys = <&usb3_hs_phy>, <&usb3_ss_phy>;
> +                               phy-names = "usb2-phy", "usb3-phy";
> +                               dr_mode = "host";
> +                       };
> +               };
> +
> +               usb2_hs_phy: hsphy@a8000 {
> +                       compatible = "qcom,usb-hs-ipq4019-phy";
> +                       #phy-cells = <0>;
> +                       reg = <0xa8000 0x40>;
> +                       reg-names = "phy_base";
> +                       resets = <&gcc USB2_HSPHY_POR_ARES>, <&gcc USB2_HSPHY_S_ARES>;
> +                       reset-names = "por_rst", "srif_rst";
> +                       status = "disabled";
> +               };
> +
> +               usb2: usb2@60f8800 {
> +                       compatible = "qcom,dwc3";
> +                       reg = <0x60f8800 0x100>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       clocks = <&gcc GCC_USB2_MASTER_CLK>,
> +                                <&gcc GCC_USB2_SLEEP_CLK>,
> +                                <&gcc GCC_USB2_MOCK_UTMI_CLK>;
> +                       clock-names = "master", "sleep", "mock_utmi";
> +                       ranges;
> +                       status = "disabled";
> +
> +                       dwc3@6000000 {
> +                               compatible = "snps,dwc3";
> +                               reg = <0x6000000 0xf8000>;
> +                               interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +                               phys = <&usb2_hs_phy>;
> +                               phy-names = "usb2-phy";
> +                               dr_mode = "host";
> +                       };
> +               };
>         };
>  };
> --
> 2.26.2
>

Hi,
Is there an issue with the patch preventing the review?

Regards,
Robert
