Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2EE51B6A11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 01:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgDWXlN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 19:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbgDWXlM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 19:41:12 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F4DC09B043
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 16:41:12 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id h69so3712011pgc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 16:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=LmYQHAeYBGdtlMgDMs5DNGRmrjuNIDAFt4aNvaNkdnw=;
        b=W45UZQo6fsfKv5OyxRMFClKyYQdlBpFJ+TkLNb1igk8FLNGnIxrh/fxdV2x4IT4oBI
         CXSLdzWqMuQuFYYoIhck9qpoxdeWjhUOXHZfm439QG6Zu27HBjxOYnOQYAJPEsCDmF+l
         hUVHpwkqz/8OiKrAot3w0FsxneoCD+DuOIh2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=LmYQHAeYBGdtlMgDMs5DNGRmrjuNIDAFt4aNvaNkdnw=;
        b=OxUcWehwzyWLCB5Q+hmrb89o5uruTsTaJW2VtdJVsysjTIixZ4Fieo1JkRTqphtJz6
         jkAsjyi84qDHpif0T3zxz4Og/A5jvghhhTVogwwtwzZi/Iyaf+gUVZmNk0e27wOUITrD
         rLoHsPGJehGI/4uW17o+LTGC+MMSaFf/72zIb8MU6nmyQPOZHhU+XP/TFU+iuu1/LUrL
         dKwZff5bzOacaPzvQJlKGJkxv6O+rP70CIQ7rtkldUXUSpa0KWRP15k7arpKxJ0DZWwn
         O/aoCC7Yz/N7eLqeMiPVitK8c3etMdO5dK5K6MyTRuqPbl0JflFM6advQGo4EhHCR0hA
         q6Gg==
X-Gm-Message-State: AGi0PuabcgkrYC8vNC/B6m9Obd7t8Fi7vUKDPdS4hssc1IHJP16367QJ
        XWwLnWNX7YTm3tGm9S0P/4w4tA==
X-Google-Smtp-Source: APiQypKyRXIYqktS3Q+e6NIjvrENrzuajOa9/6VUQIjvxIzzLLBKgL/C+Z803VtTINQM4icOROXwXw==
X-Received: by 2002:a63:fc45:: with SMTP id r5mr6142794pgk.440.1587685272078;
        Thu, 23 Apr 2020 16:41:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y8sm3908136pfg.216.2020.04.23.16.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 16:41:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585701031-28871-2-git-send-email-tanmay@codeaurora.org>
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org> <1585701031-28871-2-git-send-email-tanmay@codeaurora.org>
Subject: Re: [DPU PATCH v5 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Chandan Uddaraju <chandanu@codeaurora.org>, robdclark@gmail.com,
        abhinavk@codeaurora.org, nganji@codeaurora.org,
        jsanka@codeaurora.org, aravindh@codeaurora.org,
        hoegsberg@google.com, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Vara Reddy <varar@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org
Date:   Thu, 23 Apr 2020 16:41:10 -0700
Message-ID: <158768527020.135303.4794713080581005908@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Tanmay Shah (2020-03-31 17:30:27)
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml=
 b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> new file mode 100644
> index 0000000..761a01d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> @@ -0,0 +1,325 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dp-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display Port dt properties.

This title should be something like

"Qualcomm Display Port Controller"

> +
> +maintainers:
> +  - Chandan Uddaraju <chandanu@codeaurora.org>
> +  - Vara Reddy <varar@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for MSM Display Port which supports DP host contr=
ollers
> +  that are compatible with VESA Display Port interface specification.
> +
> +properties:
> +  "msm_dp":
> +    type: object
> +    description: |
> +      Node containing Display port register address bases, clocks, power=
 supplies.
> +
> +    properties:
> +     compatible:
> +       items:
> +         - const: qcom,dp-display
> +
> +     cell-index:
> +       description: Specifies the controller instance.
> +
> +     reg:
> +       description: Physical base address and length of controller's reg=
isters.
> +
> +     reg-names:
> +       description: |
> +         Names for different register regions defined above. The require=
d region
> +         is mentioned below.
> +       items:
> +         - const: dp_ahb
> +         - const: dp_aux
> +         - const: dp_link
> +         - const: dp_p0
> +         - const: dp_phy
> +         - const: dp_ln_tx0
> +         - const: dp_ln_tx1
> +         - const: afprom_physical
> +         - const: dp_pll
> +         - const: usb3_dp_com
> +         - const: hdcp_physical
> +
> +     interrupts:
> +       description: The interrupt signal from the DP block.
> +
> +     clocks:
> +       description: List of clock specifiers for clocks needed by the de=
vice.
> +
> +     clock-names:
> +       description: |
> +         Device clock names in the same order as mentioned in clocks pro=
perty.
> +         The required clocks are mentioned below.
> +       items:
> +         - const: core_aux_clk
> +         - const: core_ref_clk_src
> +         - const: core_usb_ref_clk
> +         - const: core_usb_cfg_ahb_clk
> +         - const: core_usb_pipe_clk
> +         - const: ctrl_link_clk
> +         - const: ctrl_link_iface_clk
> +         - const: ctrl_pixel_clk
> +         - const: crypto_clk
> +         - const: pixel_clk_rcg
> +
> +     pll-node:
> +       description: phandle to DP PLL node.
> +
> +     vdda-1p2-supply:
> +       description: phandle to vdda 1.2V regulator node.
> +
> +     vdda-0p9-supply:
> +       description: phandle to vdda 0.9V regulator node.
> +
> +     aux-cfg0-settings:
> +       description: |
> +         Specifies the DP AUX configuration 0 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg1-settings:
> +       description: |
> +         Specifies the DP AUX configuration 1 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg2-settings:
> +       description: |
> +         Specifies the DP AUX configuration 2 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg3-settings:
> +       description: |
> +         Specifies the DP AUX configuration 3 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg4-settings:
> +       description: |
> +         Specifies the DP AUX configuration 4 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg5-settings:
> +       description: |
> +         Specifies the DP AUX configuration 5 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg6-settings:
> +       description: |
> +         Specifies the DP AUX configuration 6 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg7-settings:
> +       description: |
> +         Specifies the DP AUX configuration 7 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg8-settings:
> +       description: |
> +         Specifies the DP AUX configuration 8 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg9-settings:
> +       description: |
> +         Specifies the DP AUX configuration 9 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     max-pclk-frequency-khz:
> +       description: Maximum displayport pixel clock supported for the ch=
ipset.
> +
> +     data-lanes:
> +       description: Maximum number of lanes that can be used for Display=
 port.

This should be an array of cells, not a single cell indicating the
number of lanes.

> +
> +     usbplug-cc-gpio:
> +       maxItems: 1
> +       description: Specifies the usbplug orientation gpio.
> +
> +     aux-en-gpio:
> +       maxItems: 1
> +       description: Specifies the aux-channel enable gpio.
> +
> +     aux-sel-gpio:
> +       maxItems: 1
> +       description: Specifies the sux-channel select gpio.
> +
> +     ports:
> +       description: |
> +         Contains display port controller endpoint subnode.
> +         remote-endpoint: |
> +           For port@0, set to phandle of the connected panel/bridge's
> +           input endpoint. For port@1, set to the DPU interface output.
> +           Documentation/devicetree/bindings/graph.txt and
> +           Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +  "dp_pll":
> +     type: object
> +     description: Node contains properties of Display port pll and phy d=
river.
> +
> +     properties:
> +       compatible:
> +         items:
> +           - const: qcom,dp-pll-10nm
> +
> +       cell-index:
> +         description: Specifies the controller instance.
> +
> +       reg:
> +         description: Physical base address and length of DP phy and pll=
 registers.
> +
> +       reg-names:
> +         description: |
> +           Names for different register regions defined above. The requi=
red region
> +           is mentioned below.
> +         items:
> +           - const: pll_base
> +           - const: phy_base
> +           - const: ln_tx0_base
> +           - const: ln_tx1_base
> +           - const: gdsc_base
> +
> +       clocks:
> +         description: List of clock specifiers for clocks needed by the =
device.
> +
> +       clock-names:
> +         description: |
> +           Device clock names in the same order as mentioned in clocks p=
roperty.
> +           The required clocks are mentioned below.
> +         items:
> +           - const: iface
> +           - const: ref
> +           - const: cfg_ahb
> +           - const: pipe
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    msm_dp: displayport-controller@ae90000{
> +                cell-index =3D <0>;
> +        compatible =3D "qcom,dp-display";
> +        reg =3D   <0 0xae90000 0 0x200>,
> +                <0 0xae90200 0 0x200>,
> +                <0 0xae90400 0 0xc00>,
> +                <0 0xae91000 0 0x400>,
> +                <0 0x88eaa00 0 0x200>,
> +                <0 0x88ea200 0 0x200>,
> +                <0 0x88ea600 0 0x200>,
> +                <0 0x780000 0 0x6228>,
> +                <0 0x088ea000 0 0x40>,
> +                <0 0x88e8000 0 0x20>,
> +                <0 0x0aee1000 0 0x034>;

This needs to be split up into at least two nodes. Any address above
that starts in 88e needs to be put into a new node underneath the qmp
phy. That is the "DP PHY" that lives in the power domain of the USB+DP
combo phy. The qfprom_physical reg property should be removed from here
and this binding should use the nvmem binding to reach into the qfprom
to read out things (I guess there's some sort of HDCP key in the
qfprom?).

After that I don't know why there are so many different reg properties
for the DP controller here and why it needs to be split up.  It looks
like we should just map the register space from 0xae90000 up to
0xae91400 as one big register region and have the driver figure out how
to operate on top of that. If it changes between SoC versions then we
should have a more specific compatible that tells us what registers are
in what place.

> +        reg-names =3D "dp_ahb", "dp_aux", "dp_link",
> +            "dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
> +            "qfprom_physical", "dp_pll",
> +            "usb3_dp_com", "hdcp_physical";
> +
> +        interrupt-parent =3D <&display_subsystem>;
> +        interrupts =3D <12 0>;
> +
> +        clocks =3D <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +            <&rpmhcc RPMH_CXO_CLK>,
> +            <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +            <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +            <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
> +            <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +            <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +            <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +            <&dispcc DISP_CC_MDSS_DP_CRYPTO_CLK>,
> +            <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +        clock-names =3D "core_aux_clk", "core_ref_clk_src",
> +            "core_usb_ref_clk", "core_usb_cfg_ahb_clk",
> +            "core_usb_pipe_clk", "ctrl_link_clk",
> +            "ctrl_link_iface_clk", "ctrl_pixel_clk",
> +            "crypto_clk", "pixel_clk_rcg";
> +
> +        pll-node =3D <&dp_pll>;

If the DP PLL and DP controller need to be controlled from two software
entities, it may make sense to just combine that DP PLL into the
controller node and have this node be a clk provider. The pll-node
property is pretty ugly and should be removed.

> +        vdda-1p2-supply =3D <&vreg_l3c_1p2>;
> +        vdda-0p9-supply =3D <&vreg_l4a_0p8>;
> +
> +        aux-cfg0-settings =3D [20 00];
> +        aux-cfg1-settings =3D [24 13 23 1d];
> +        aux-cfg2-settings =3D [28 24];
> +        aux-cfg3-settings =3D [2c 00];
> +        aux-cfg4-settings =3D [30 0a];
> +        aux-cfg5-settings =3D [34 26];
> +        aux-cfg6-settings =3D [38 0a];
> +        aux-cfg7-settings =3D [3c 03];
> +        aux-cfg8-settings =3D [40 bb];
> +        aux-cfg9-settings =3D [44 03];

This pile of properties is board specific configuration tuning or
something? Can this go into the driver? Or can it be made more human
readable? I seem to recall that the USB phy had similar properties and
we made them into human readable properties when board integrators
needed to change them. The easiest approach there is to put everything
in the driver for now and then when something has to change for a board
it gets punted out to the DT and that overrides the "default" settings
that are used in the driver.

> +
> +        max-pclk-frequency-khz =3D <67500>;

What is this? Why isn't this in the driver?

> +        data-lanes =3D <2>;
> +
> +        aux-en-gpio =3D <&msmgpio 55 1>;
> +        aux-sel-gpio =3D <&msmgpio 110 1>;
> +        usbplug-cc-gpio =3D <&msmgpio 90 1>;
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                dp_in: endpoint {
> +                    remote-endpoint =3D <&dpu_intf0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +                dp_out: endpoint {
> +                };
> +            };
> +        };
> +    };
> +
> +    dp_pll: dp-pll@088ea000 {
> +        compatible =3D "qcom,dp-pll-10nm";
> +        label =3D "DP PLL";
> +        cell-index =3D <0>;
> +        #clock-cells =3D <1>;
> +
> +        reg =3D <0 0x088ea000 0 0x200>,
> +              <0 0x088eaa00 0 0x200>,
> +              <0 0x088ea200 0 0x200>,
> +              <0 0x088ea600 0 0x200>,
> +              <0 0x08803000 0 0x8>;
> +        reg-names =3D "pll_base", "phy_base", "ln_tx0_base",
> +            "ln_tx1_base", "gdsc_base";

I guess the DP_PLL lives inside the qmp combo phy? That would match how
the USB phy binding has been done there. This whole node should be
combined with the DP phy node that will be placed as a child of the qmp
phy wrapper (i.e. qcom,sc7180-qmp-usb3-phy compatible node). Might as
well change that compatible from qcom,sc7180-qmp-usb3-phy to be
qcom,sc7180-qmp-usb3-dp-phy too so that it can create the DP phy bits
too.

> +
> +        clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +             <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +             <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +             <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +        clock-names =3D "iface_clk", "ref_clk",
> +            "cfg_ahb_clk", "pipe_clk";
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Docu=
mentation/devicetree/bindings/display/msm/dpu.txt
> index 551ae26..7e99e45 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -63,8 +63,9 @@ Required properties:
>         Documentation/devicetree/bindings/graph.txt
>         Documentation/devicetree/bindings/media/video-interfaces.txt
> =20
> -       Port 0 -> DPU_INTF1 (DSI1)
> -       Port 1 -> DPU_INTF2 (DSI2)
> +       Port 0 -> DPU_INTF0 (DP)
> +       Port 1 -> DPU_INTF1 (DSI1)
> +       Port 2 -> DPU_INTF2 (DSI2)

DP should come last so that the port mapping doesn't have to change.

> =20
>  Optional properties:
>  - assigned-clocks: list of clock specifiers for clocks needing rate assi=
gnment
