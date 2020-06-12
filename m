Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE0E1F7B8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 18:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgFLQWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 12:22:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:39318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgFLQWh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 12:22:37 -0400
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 772AE20836;
        Fri, 12 Jun 2020 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591978955;
        bh=Q8xnuSQvFkUDr8zmvrG1XuxDC3lkFjCFlAB3OwOthW4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BVQsixGONhmhI/hbz9XIDAHAukYVbQ8gZeQ98icrFxKeCJFbL4dsGpULSCHemI7ws
         H1oOKVYzkPwdEbybBZUImY0uFFy7+6lm5RhyjtVJHOsbiALRIIxGe+8S0jMnyNrufo
         IjH3yMvarjQ+TolrbESM6I46+soCSCMoAsOI3phM=
Received: by mail-oi1-f180.google.com with SMTP id a3so9208909oid.4;
        Fri, 12 Jun 2020 09:22:35 -0700 (PDT)
X-Gm-Message-State: AOAM532ANovLS4rjZ67EmgrElHFsZv+eie9dNDi4rxNb9a2AZY4eAbvg
        KkU+5ojB05YQeBMJYG4dQJG48QSPlUKPJIZKYA==
X-Google-Smtp-Source: ABdhPJwPoRIwsHGp/Q6SDOjjjB5xHEQEwUclkLWle+xl2si3N6oLoxWnuEys74ZMjvgMU2tZ1ygwIobN1Wc1Q5gaWWQ=
X-Received: by 2002:aca:6004:: with SMTP id u4mr2905435oib.106.1591978954766;
 Fri, 12 Jun 2020 09:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200612015030.16072-1-tanmay@codeaurora.org> <20200612015030.16072-2-tanmay@codeaurora.org>
In-Reply-To: <20200612015030.16072-2-tanmay@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 12 Jun 2020 10:21:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKO=UZqJYS49gmVkbRocqnOLqH=wCKKZM5a3UvXnWrTeA@mail.gmail.com>
Message-ID: <CAL_JsqKO=UZqJYS49gmVkbRocqnOLqH=wCKKZM5a3UvXnWrTeA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
To:     Tanmay Shah <tanmay@codeaurora.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, aravindh@codeaurora.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 11, 2020 at 7:51 PM Tanmay Shah <tanmay@codeaurora.org> wrote:
>
> From: Chandan Uddaraju <chandanu@codeaurora.org>
>
> Add bindings for Snapdragon DisplayPort controller driver.
>
> Changes in V2:
> Provide details about sel-gpio
>
> Changes in V4:
> Provide details about max dp lanes
> Change the commit text
>
> Changes in V5:
> moved dp.txt to yaml file
>
> Changes in v6:
> - Squash all AUX LUT properties into one pattern Property
> - Make aux-cfg[0-9]-settings properties optional
> - Remove PLL/PHY bindings from DP controller dts
> - Add DP clocks description
> - Remove _clk suffix from clock names
> - Rename pixel clock to stream_pixel
> - Remove redundant bindings (GPIO, PHY, HDCP clock, etc..)
> - Fix indentation
> - Add Display Port as interface of DPU in DPU bindings
>   and add port mapping accordingly.
>
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---
>  .../bindings/display/msm/dp-sc7180.yaml       | 142 ++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt   |   8 +
>  2 files changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml

Is it too much to ask for Qualcomm to coordinate your work? I'm not
going to do that for you. This conflicts with "[v4] dt-bindings: msm:
disp: add yaml schemas for DPU and DSI bindings".

> diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> new file mode 100644
> index 000000000000..5fdb9153df00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0-only  OR BSD-2-Clause)

Extra space.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dp-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Port Controller.
> +
> +maintainers:
> +  - Chandan Uddaraju <chandanu@codeaurora.org>
> +  - Vara Reddy <varar@codeaurora.org>
> +  - Tanmay Shah <tanmay@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for MSM Display Port which supports DP host controllers
> +  that are compatible with VESA Display Port interface specification.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,dp-display

That's what the h/w reference manual calls this? It should be SoC specific.

> +
> +  cell-index:
> +    description: Specifies the controller instance.

Pretty sure I already said no to this.

> +
> +  reg:
> +    items:
> +      - description: DP controller registers

Just: 'maxItems: 1'

> +
> +  interrupts:
> +    description: The interrupt signal from the DP block.

How many?

The description is useless. That's every 'interrupts'.

> +
> +  clocks:
> +    description: List of clock specifiers for clocks needed by the device.

That's every 'clocks' property. Drop.

> +    items:
> +      - description: Display Port AUX clock
> +      - description: Display Port Link clock
> +      - description: Link interface clock between DP and PHY
> +      - description: Display Port Pixel clock
> +      - description: Root clock generator for pixel clock
> +
> +  clock-names:
> +    description: |
> +      Device clock names in the same order as mentioned in clocks property.
> +      The required clocks are mentioned below.

Drop.

> +    items:
> +      - const: core_aux
> +      - const: ctrl_link
> +      - const: ctrl_link_iface
> +      - const: stream_pixel
> +      - const: pixel_rcg

blank line

> +  "#clock-cells":
> +    const: 1
> +
> +  vdda-1p2-supply:
> +    description: phandle to vdda 1.2V regulator node.
> +
> +  vdda-0p9-supply:
> +    description: phandle to vdda 0.9V regulator node.
> +
> +  data-lanes = <0 1>:

Err, what?!

> +    type: object

This is a DT node?

> +    description: Maximum number of lanes that can be used for Display port.
> +
> +  ports:
> +    description: |
> +       Contains display port controller endpoint subnode.
> +       remote-endpoint: |
> +         For port@0, set to phandle of the connected panel/bridge's
> +         input endpoint. For port@1, set to the DPU interface output.

Look at other schemas and see how they are done.

> +         Documentation/devicetree/bindings/graph.txt and
> +         Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +patternProperties:
> +  "^aux-cfg([0-9])-settings$":
> +    type: object

This is a DT node?

> +    description: |
> +      Specifies the DP AUX configuration [0-9] settings.
> +      The first entry in this array corresponds to the register offset
> +      within DP AUX, while the remaining entries indicate the
> +      programmable values.
> +
> +required:
> +  - compatible
> +  - cell-index
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - vdda-1p2-supply
> +  - vdda-0p9-supply
> +  - data-lanes
> +  - ports

Add:
additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    msm_dp: displayport-controller@ae90000{
> +        compatible = "qcom,dp-display";
> +        cell-index = <0>;
> +        reg = <0 0xae90000 0 0x1400>;
> +        reg-names = "dp_controller";
> +
> +        interrupt-parent = <&display_subsystem>;
> +        interrupts = <12 0>;
> +
> +        clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +        clock-names = "core_aux",
> +                      "ctrl_link",
> +                      "ctrl_link_iface", "stream_pixel",
> +                      "pixel_rcg";
> +        #clock-cells = <1>;
> +
> +        vdda-1p2-supply = <&vreg_l3c_1p2>;
> +        vdda-0p9-supply = <&vreg_l4a_0p8>;
> +
> +        data-lanes = <0 1>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dp_in: endpoint {
> +                    remote-endpoint = <&dpu_intf0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dp_out: endpoint {
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index 551ae26f60da..30c8ab479b02 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -65,6 +65,7 @@ Required properties:
>
>         Port 0 -> DPU_INTF1 (DSI1)
>         Port 1 -> DPU_INTF2 (DSI2)
> +       Port 2 -> DPU_INTF0 (DP)
>
>  Optional properties:
>  - assigned-clocks: list of clock specifiers for clocks needing rate assignment
> @@ -136,6 +137,13 @@ Example:
>                                                 remote-endpoint = <&dsi1_in>;
>                                         };
>                                 };
> +
> +                               port@2 {
> +                                       reg = <2>;
> +                                       dpu_intf0_out: endpoint {
> +                                               remote-endpoint = <&dp_in>;
> +                                       };
> +                               };
>                         };
>                 };
>         };
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
