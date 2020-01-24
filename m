Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2B9F1491E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2020 00:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387576AbgAXXVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 18:21:30 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42641 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387661AbgAXXV3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 18:21:29 -0500
Received: by mail-vs1-f68.google.com with SMTP id b79so2328716vsd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 15:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SRJ461+G7MgpwUQU9s+T4wtNvR/tD3NyDdbo7eqA7AI=;
        b=eZcDQrVRmmgUua8irA6uwUmZChO1NI87dboSLB2KeMzZ7JR5gsRbghI4LgN0exPQaG
         wHHGvu0c0RiHR1HnL/WKGm1NRBd7MGYwLUPDYXttvh8VvVu0+YYWqCxhGxwiU7uPt9Jy
         3VN3tqCAta+mZolHhOTXrqvhq69f6dnCWbGt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SRJ461+G7MgpwUQU9s+T4wtNvR/tD3NyDdbo7eqA7AI=;
        b=JkvYTMIEHE087mC97UBbEYf5o/6UMcRgIFFHsXY3Vt52HW3BaRQBhK8FvzdCi8GaWe
         Avniwy23uqWuoMGtp9BodHVWhWasTVfUPm18KjX2xV70uQKxpyq0xVjJEFfvQDqrYoj9
         HHQGnv3I8I+Yt3Cd9OYLmbL2WP/8FppPiivATlq30hWHdUz6mwYe1+Ur7zPsM6NMeSsf
         Cre6KZksSByG0nR4DIDSoABDefEvsqUTgOP+tpTNO9eIu85bvvCtxi0InL9iKZhpcU0V
         uaJWLsu1wegjYC0xsgPMlwiYa/5Bjhy8f+gP/GWe/hMaoLaj9Opduxe7HI20mWBjPXcN
         GQgw==
X-Gm-Message-State: APjAAAWI7I3VgfedWQMh82M/bjFbKcgOnWcZ2BFemiwpHP6OENq/4aDk
        daTM0IK+L2IUbnviEnisKrhVEnWfGT8=
X-Google-Smtp-Source: APXvYqwuhzI0+eT2ISBtSoyBixHDgJNFZM/APGy5tqoEFZ+NlHyKkFGFuGDkkJZbYCuRK9s78BbJpg==
X-Received: by 2002:a67:7d17:: with SMTP id y23mr3969264vsc.162.1579908087772;
        Fri, 24 Jan 2020 15:21:27 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id v65sm2107181vke.13.2020.01.24.15.21.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2020 15:21:26 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id g23so2330954vsr.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 15:21:26 -0800 (PST)
X-Received: by 2002:a05:6102:2d8:: with SMTP id h24mr4063725vsh.169.1579908086214;
 Fri, 24 Jan 2020 15:21:26 -0800 (PST)
MIME-Version: 1.0
References: <1579867572-17188-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1579867572-17188-1-git-send-email-harigovi@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Jan 2020 15:21:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WKVGq+x1XFvZQvBcKVPdcVxQWJJmsqpAxY3t4dorvMYg@mail.gmail.com>
Message-ID: <CAD=FV=WKVGq+x1XFvZQvBcKVPdcVxQWJJmsqpAxY3t4dorvMYg@mail.gmail.com>
Subject: Re: [v3] arm64: dts: sc7180: add display dt nodes
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jan 24, 2020 at 4:07 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Add display, DSI hardware DT nodes for sc7180.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v1:
>         -Added display DT nodes for sc7180
> Changes in v2:
>         -Renamed node names
>         -Corrected code alignments
>         -Removed extra new line
>         -Added DISP AHB clock for register access
>         under display_subsystem node for global settings
> Changes in v3:
>         -Modified node names
>         -Modified hard coded values
>         -Removed mdss reg entry
>
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  58 +++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 124 ++++++++++++++++++++++++++++++++
>  2 files changed, 182 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..c77aab7 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -7,6 +7,7 @@
>
>  /dts-v1/;
>
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sc7180.dtsi"
>  #include "pm6150.dtsi"
> @@ -232,6 +233,50 @@
>         };
>  };
>
> +&dsi_controller {
> +       status = "okay";
> +
> +       vdda-supply = <&vreg_l3c_1p2>;
> +
> +       panel@0 {
> +               compatible = "visionox,rm69299-1080p-display";

I don't think the bindings for this panel have landed anywhere, have
they?  Maybe keep the IDP patch separate from the main sc7180 patch so
that we can land the main sc7180 patch even if the idp patch isn't
quite ready?  ...and maybe ping whoever is supposed to add support for
this panel to tell them to get working on it.


> +               reg = <0>;
> +
> +               vdda-supply = <&vreg_l8c_1p8>;
> +               vdd3p3-supply = <&vreg_l18a_2p8>;
> +
> +               pinctrl-names = "default", "suspend";
> +               pinctrl-0 = <&disp_pins_default>;
> +               pinctrl-1 = <&disp_pins_default>;
> +
> +               reset-gpios = <&pm6150l_gpio 3 GPIO_ACTIVE_HIGH>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       port@0 {
> +                               reg = <0>;
> +                               panel0_in: endpoint {
> +                                       remote-endpoint = <&dsi0_out>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       ports {
> +               port@1 {
> +                       endpoint {
> +                               remote-endpoint = <&panel0_in>;
> +                               data-lanes = <0 1 2 3>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_phy {
> +       status = "okay";

The above doesn't do anything because the dsi_phy you add to
sc7180.dtsi doesn't have a
  status = "disabled";

...but probably it (and most of the other components that you're
adding) should.  The idea is that if it ever makes sense that a board
might be built with this SoC but _not_ hook up a given component that
it should start out "disabled" in the main SoC dtsi file.

> +};
> +
>  &qspi {
>         status = "okay";
>         pinctrl-names = "default";
> @@ -289,6 +334,19 @@
>
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>
> +&pm6150l_gpio {
> +       disp_pins {
> +               disp_pins_default: disp_pins_default{

As Bjorn mentioned, node name should use "-" instead of "_".  Also add
a space before your "{"


> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3bc3f64..3ebc45b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1184,6 +1184,130 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               mdss: display_subsystem@ae00000 {
> +                       compatible = "qcom,sc7180-mdss";
> +                       reg = <0 0x0ae00000 0 0x1000>;
> +                       reg-names = "mdss";
> +
> +                       power-domains = <&dispcc MDSS_GDSC>;

You definitely can't land your patch until the "dispcc" node is added,
but it's not.  You should be mentioning somewhere (after the cut?)
that you depend on the series to add dispcc.

...speaking of which, I just posted up a v2 of that.  See:

https://lore.kernel.org/r/20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid

...speaking of which, can you please change your patch to replace the
bogus <0> in the dispcc for the DSI PHY, providing the clocks for
"dsi_phy_pll_byte" and "dsi_phy_pll_pixel"?  See
<https://crrev.com/c/2017974/3>


> +
> +                       clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                                <&gcc GCC_DISP_HF_AXI_CLK>,
> +                                <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       clock-names = "iface", "gcc_bus", "ahb", "core";
> +
> +                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       assigned-clock-rates = <300000000>;
> +
> +                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +
> +                       iommus = <&apps_smmu 0x800 0x2>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       mdp: display_controller@ae01000 {

Did you test this?  As far I can tell this change between v2 and v3
broke things because the node name "mdp" is magic.  In
"drivers/gpu/drm/msm/msm_drv.c" you can find the function:

static int compare_name_mdp(struct device *dev, void *data)
{
  return (strstr(dev_name(dev), "mdp") != NULL);
}

...so unless that function changes your device tree won't work.  Maybe
Bjorn can comment since I think he's the one that suggested you change
this, but IMO change it back to "mdp@ae01000" for now and then start a
separate patch series about transitioning this if people still want
it.  See <https://crrev.com/c/2020395/1>.

-Doug
