Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4F13898C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 23:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhESVrt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 17:47:49 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:33390 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhESVrt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 17:47:49 -0400
Received: by mail-ot1-f45.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so13134490oto.0;
        Wed, 19 May 2021 14:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yOGPs0V6FkNejdUdVjlvBiW0dEeEZEXepILqZyt8co8=;
        b=XU+QFmpE9a/+BjMwUnKm/Fs0387YNa7dXZ6ZxLA135pWx4qzx6ahrkuiM/rg3JPZXo
         eyyhesnko79qVXvIKZLk//xnTTH9lawCLmoyES013pwF3Zo4F3qtp5oh6m97jthdvmJm
         2WcnGRmTO2c8JLoZBCCT9vOktXG98sKIll5oUhCwxCF9hCvnMrg3l0o1IC8LHJIKBXNm
         DTEuyCW8+hdmnQAGEzeqfPFwsGbC+EZYwWSuGFui+Lx+OajEuXRFDkZI+hjgi6VS3BMl
         /xpMMCZwn9DAqwmrUq8lutRfI6/fhj9zuoq/EpJFmWX/s+3sX2xn3NNHFTo/RyH3Og8O
         YfCQ==
X-Gm-Message-State: AOAM530kF1E9r5hBjMy+YwrAb9cjPO4Erkn8JaOQJVeSNaXblHPqJ/mW
        M561AVxw3mVjVBSaiAuMpA==
X-Google-Smtp-Source: ABdhPJwRqQJK3vnCAqVW6aOusQi9dumKLf/hwwSSpufREOP2Y4ovY1yFsoxPQrHVlwY8/1R070Vciw==
X-Received: by 2002:a9d:7a99:: with SMTP id l25mr1307179otn.97.1621460788421;
        Wed, 19 May 2021 14:46:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j16sm206481otn.55.2021.05.19.14.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 14:46:26 -0700 (PDT)
Received: (nullmailer pid 3713590 invoked by uid 1000);
        Wed, 19 May 2021 21:46:23 -0000
Date:   Wed, 19 May 2021 16:46:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        dianders@chromium.org, khsieh@codeaurora.org, sean@poorly.run
Subject: Re: [PATCH v16 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 bindings
Message-ID: <20210519214623.GA3698211@robh.at.kernel.org>
References: <1621332225-31918-1-git-send-email-mkrishn@codeaurora.org>
 <1621332225-31918-2-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621332225-31918-2-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 18, 2021 at 03:33:43PM +0530, Krishna Manikandan wrote:
> Add YAML schema for the device tree bindings for DSI
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v1:
>     - Separate dsi controller bindings to a separate patch (Stephen Boyd)
>     - Merge dsi-common-controller.yaml and dsi-controller-main.yaml to
>       a single file (Stephen Boyd)
>     - Drop supply entries and definitions from properties (Stephen Boyd)
>     - Modify phy-names property for dsi controller (Stephen Boyd)
>     - Remove boolean from description (Stephen Boyd)
>     - Drop pinctrl properties as they are standard entries (Stephen Boyd)
>     - Modify the description for ports property and keep the reference
>       to the generic binding where this is defined (Stephen Boyd)
>     - Add description to clock names (Stephen Boyd)
>     - Correct the indendation (Stephen Boyd)
>     - Drop the label for display dt nodes and correct the node
>       name (Stephen Boyd)
> 
> Changes in v2:
>     - Drop maxItems for clock (Stephen Boyd)
>     - Drop qcom,mdss-mdp-transfer-time-us as it is not used in upstream
>       dt file (Stephen Boyd)
>     - Keep child node directly under soc node (Stephen Boyd)
>     - Drop qcom,sync-dual-dsi as it is not used in upstream dt
> 
> Changes in v3:
>     - Add description for register property (Stephen Boyd)
> 
> Changes in v4:
>     - Add maxItems for phys property (Stephen Boyd)
>     - Add maxItems for reg property (Stephen Boyd)
>     - Add reference for data-lanes property (Stephen Boyd)
>     - Remove soc from example (Stephen Boyd)
> 
> Changes in v5:
>     - Modify title and description (Stephen Boyd)
>     - Add required properties for ports node (Stephen Boyd)
>     - Add data-lanes in the example (Stephen Boyd)
>     - Drop qcom,master-dsi property (Stephen Boyd)
> 
> Changes in v6:
>     - Add required properties for port@0, port@1 and corresponding
>       endpoints (Stephen Boyd)
>     - Add address-cells and size-cells for ports (Stephen Boyd)
>     - Use additionalProperties instead of unevaluatedProperties (Stephen Boyd)
> 
> Changes in v7:
>     - Add reference for ports and data-lanes (Rob Herring)
>     - Add maxItems and minItems for data-lanes (Rob Herring)
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  | 209 +++++++++++++++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 249 ---------------------
>  2 files changed, 209 insertions(+), 249 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> new file mode 100644
> index 0000000..80f5218
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -0,0 +1,209 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI controller
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +allOf:
> +  - $ref: "../dsi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,mdss-dsi-ctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: dsi_ctrl
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Display byte clock
> +      - description: Display byte interface clock
> +      - description: Display pixel clock
> +      - description: Display escape clock
> +      - description: Display AHB clock
> +      - description: Display AXI clock
> +
> +  clock-names:
> +    items:
> +      - const: byte
> +      - const: byte_intf
> +      - const: pixel
> +      - const: core
> +      - const: iface
> +      - const: bus
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: dsi
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +  syscon-sfpb:
> +    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +  qcom,dual-dsi-mode:
> +    type: boolean
> +    description: |
> +      Indicates if the DSI controller is driving a panel which needs
> +      2 DSI links.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  ports:
> +    $ref: "/schemas/graph.yaml#/properties/ports"
> +    description: |
> +      Contains DSI controller input and output ports as children, each
> +      containing one endpoint subnode.
> +
> +    properties:
> +      port@0:
> +        $ref: "/schemas/graph.yaml#/properties/port"
> +        description: |
> +          Input endpoints of the controller.
> +
> +        properties:
> +          reg:
> +            const: 0

You can drop 'reg'.

> +
> +          endpoint:
> +            type: object
> +            properties:
> +              remote-endpoint: true

Don't need this.

> +              data-lanes:
> +                $ref: "../../media/video-interfaces.yaml"

This is not where the $ref goes. Please look at other users.

> +                description: |
> +                  This describes how the physical DSI data lanes are mapped
> +                  to the logical lanes on the given platform. The value contained in
> +                  index n describes what physical lane is mapped to the logical lane n
> +                  (DATAn, where n lies between 0 and 3). The clock lane position is fixed
> +                  and can't be changed. Hence, they aren't a part of the DT bindings.

Don't redescribe common properties. If you have something special about 
this device, then say it.

> +                maxItems: 4
> +                minItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]
> +
> +        required:
> +          - reg
> +          - endpoint

Drop. Already covered by the common schema.

> +
> +      port@1:
> +        $ref: "/schemas/graph.yaml#/properties/port"
> +        description: |
> +          Output endpoints of the controller.
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object

Needs a $ref to video-interfaces.yaml.

> +            properties:
> +              remote-endpoint: true
> +              data-lanes:
> +                maxItems: 4
> +                minItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]
> +

> +        required:
> +          - reg
> +          - endpoint

Drop

> +
> +    required:
> +      - port@0
> +      - port@1

> +      - "#address-cells"
> +      - "#size-cells"

Last 2 are covered by the common schema.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - power-domains
> +  - operating-points-v2
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +     #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +     dsi@ae94000 {
> +           compatible = "qcom,mdss-dsi-ctrl";
> +           reg = <0x0ae94000 0x400>;
> +           reg-names = "dsi_ctrl";
> +
> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +
> +           interrupt-parent = <&mdss>;
> +           interrupts = <4>;
> +
> +           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AXI_CLK>;
> +           clock-names = "byte",
> +                         "byte_intf",
> +                         "pixel",
> +                         "core",
> +                         "iface",
> +                         "bus";
> +
> +           phys = <&dsi0_phy>;
> +           phy-names = "dsi";
> +
> +           power-domains = <&rpmhpd SC7180_CX>;
> +           operating-points-v2 = <&dsi_opp_table>;
> +
> +           ports {
> +                  #address-cells = <1>;
> +                  #size-cells = <0>;
> +
> +                  port@0 {
> +                          reg = <0>;
> +                          dsi0_in: endpoint {
> +                                   remote-endpoint = <&dpu_intf1_out>;
> +                          };
> +                  };
> +
> +                  port@1 {
> +                          reg = <1>;
> +                          dsi0_out: endpoint {
> +                                   remote-endpoint = <&sn65dsi86_in>;
> +                                   data-lanes = <0 1 2 3>;
> +                          };
> +                  };
> +           };
> +     };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> deleted file mode 100644
> index b9a64d3..0000000
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ /dev/null
> @@ -1,249 +0,0 @@
> -Qualcomm Technologies Inc. adreno/snapdragon DSI output
> -
> -DSI Controller:
> -Required properties:
> -- compatible:
> -  * "qcom,mdss-dsi-ctrl"
> -- reg: Physical base address and length of the registers of controller
> -- reg-names: The names of register regions. The following regions are required:
> -  * "dsi_ctrl"
> -- interrupts: The interrupt signal from the DSI block.
> -- power-domains: Should be <&mmcc MDSS_GDSC>.
> -- clocks: Phandles to device clocks.
> -- clock-names: the following clocks are required:
> -  * "mdp_core"
> -  * "iface"
> -  * "bus"
> -  * "core_mmss"
> -  * "byte"
> -  * "pixel"
> -  * "core"
> -  For DSIv2, we need an additional clock:
> -   * "src"
> -  For DSI6G v2.0 onwards, we need also need the clock:
> -   * "byte_intf"
> -- assigned-clocks: Parents of "byte" and "pixel" for the given platform.
> -- assigned-clock-parents: The Byte clock and Pixel clock PLL outputs provided
> -  by a DSI PHY block. See [1] for details on clock bindings.
> -- vdd-supply: phandle to vdd regulator device node
> -- vddio-supply: phandle to vdd-io regulator device node
> -- vdda-supply: phandle to vdda regulator device node
> -- phys: phandle to DSI PHY device node
> -- phy-names: the name of the corresponding PHY device
> -- syscon-sfpb: A phandle to mmss_sfpb syscon node (only for DSIv2)
> -- ports: Contains 2 DSI controller ports as child nodes. Each port contains
> -  an endpoint subnode as defined in [2] and [3].
> -
> -Optional properties:
> -- panel@0: Node of panel connected to this DSI controller.
> -  See files in [4] for each supported panel.
> -- qcom,dual-dsi-mode: Boolean value indicating if the DSI controller is
> -  driving a panel which needs 2 DSI links.
> -- qcom,master-dsi: Boolean value indicating if the DSI controller is driving
> -  the master link of the 2-DSI panel.
> -- qcom,sync-dual-dsi: Boolean value indicating if the DSI controller is
> -  driving a 2-DSI panel whose 2 links need receive command simultaneously.
> -- pinctrl-names: the pin control state names; should contain "default"
> -- pinctrl-0: the default pinctrl state (active)
> -- pinctrl-n: the "sleep" pinctrl state
> -- ports: contains DSI controller input and output ports as children, each
> -  containing one endpoint subnode.
> -
> -  DSI Endpoint properties:
> -  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
> -    input endpoint. For port@1, set to the MDP interface output. See [2] for
> -    device graph info.
> -
> -  - data-lanes: this describes how the physical DSI data lanes are mapped
> -    to the logical lanes on the given platform. The value contained in
> -    index n describes what physical lane is mapped to the logical lane n
> -    (DATAn, where n lies between 0 and 3). The clock lane position is fixed
> -    and can't be changed. Hence, they aren't a part of the DT bindings. See
> -    [3] for more info on the data-lanes property.
> -
> -    For example:
> -
> -    data-lanes = <3 0 1 2>;
> -
> -    The above mapping describes that the logical data lane DATA0 is mapped to
> -    the physical data lane DATA3, logical DATA1 to physical DATA0, logic DATA2
> -    to phys DATA1 and logic DATA3 to phys DATA2.
> -
> -    There are only a limited number of physical to logical mappings possible:
> -    <0 1 2 3>
> -    <1 2 3 0>
> -    <2 3 0 1>
> -    <3 0 1 2>
> -    <0 3 2 1>
> -    <1 0 3 2>
> -    <2 1 0 3>
> -    <3 2 1 0>
> -
> -DSI PHY:
> -Required properties:
> -- compatible: Could be the following
> -  * "qcom,dsi-phy-28nm-hpm"
> -  * "qcom,dsi-phy-28nm-lp"
> -  * "qcom,dsi-phy-20nm"
> -  * "qcom,dsi-phy-28nm-8960"
> -  * "qcom,dsi-phy-14nm"
> -  * "qcom,dsi-phy-14nm-660"
> -  * "qcom,dsi-phy-10nm"
> -  * "qcom,dsi-phy-10nm-8998"
> -  * "qcom,dsi-phy-7nm"
> -  * "qcom,dsi-phy-7nm-8150"
> -- reg: Physical base address and length of the registers of PLL, PHY. Some
> -  revisions require the PHY regulator base address, whereas others require the
> -  PHY lane base address. See below for each PHY revision.
> -- reg-names: The names of register regions. The following regions are required:
> -  For DSI 28nm HPM/LP/8960 PHYs and 20nm PHY:
> -  * "dsi_pll"
> -  * "dsi_phy"
> -  * "dsi_phy_regulator"
> -  For DSI 14nm, 10nm and 7nm PHYs:
> -  * "dsi_pll"
> -  * "dsi_phy"
> -  * "dsi_phy_lane"
> -- clock-cells: Must be 1. The DSI PHY block acts as a clock provider, creating
> -  2 clocks: A byte clock (index 0), and a pixel clock (index 1).
> -- power-domains: Should be <&mmcc MDSS_GDSC>.
> -- clocks: Phandles to device clocks. See [1] for details on clock bindings.
> -- clock-names: the following clocks are required:
> -  * "iface"
> -  * "ref" (only required for new DTS files/entries)
> -  For 28nm HPM/LP, 28nm 8960 PHYs:
> -- vddio-supply: phandle to vdd-io regulator device node
> -  For 20nm PHY:
> -- vddio-supply: phandle to vdd-io regulator device node
> -- vcca-supply: phandle to vcca regulator device node
> -  For 14nm PHY:
> -- vcca-supply: phandle to vcca regulator device node
> -  For 10nm and 7nm PHY:
> -- vdds-supply: phandle to vdds regulator device node
> -
> -Optional properties:
> -- qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
> -  regulator is wanted.
> -- qcom,mdss-mdp-transfer-time-us:	Specifies the dsi transfer time for command mode
> -					panels in microseconds. Driver uses this number to adjust
> -					the clock rate according to the expected transfer time.
> -					Increasing this value would slow down the mdp processing
> -					and can result in slower performance.
> -					Decreasing this value can speed up the mdp processing,
> -					but this can also impact power consumption.
> -					As a rule this time should not be higher than the time
> -					that would be expected with the processing at the
> -					dsi link rate since anyways this would be the maximum
> -					transfer time that could be achieved.
> -					If ping pong split is enabled, this time should not be higher
> -					than two times the dsi link rate time.
> -					If the property is not specified, then the default value is 14000 us.
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -[2] Documentation/devicetree/bindings/graph.txt
> -[3] Documentation/devicetree/bindings/media/video-interfaces.txt
> -[4] Documentation/devicetree/bindings/display/panel/
> -
> -Example:
> -	dsi0: dsi@fd922800 {
> -		compatible = "qcom,mdss-dsi-ctrl";
> -		qcom,dsi-host-index = <0>;
> -		interrupt-parent = <&mdp>;
> -		interrupts = <4 0>;
> -		reg-names = "dsi_ctrl";
> -		reg = <0xfd922800 0x200>;
> -		power-domains = <&mmcc MDSS_GDSC>;
> -		clock-names =
> -			"bus",
> -			"byte",
> -			"core",
> -			"core_mmss",
> -			"iface",
> -			"mdp_core",
> -			"pixel";
> -		clocks =
> -			<&mmcc MDSS_AXI_CLK>,
> -			<&mmcc MDSS_BYTE0_CLK>,
> -			<&mmcc MDSS_ESC0_CLK>,
> -			<&mmcc MMSS_MISC_AHB_CLK>,
> -			<&mmcc MDSS_AHB_CLK>,
> -			<&mmcc MDSS_MDP_CLK>,
> -			<&mmcc MDSS_PCLK0_CLK>;
> -
> -		assigned-clocks =
> -				 <&mmcc BYTE0_CLK_SRC>,
> -				 <&mmcc PCLK0_CLK_SRC>;
> -		assigned-clock-parents =
> -				 <&dsi_phy0 0>,
> -				 <&dsi_phy0 1>;
> -
> -		vdda-supply = <&pma8084_l2>;
> -		vdd-supply = <&pma8084_l22>;
> -		vddio-supply = <&pma8084_l12>;
> -
> -		phys = <&dsi_phy0>;
> -		phy-names ="dsi-phy";
> -
> -		qcom,dual-dsi-mode;
> -		qcom,master-dsi;
> -		qcom,sync-dual-dsi;
> -
> -		qcom,mdss-mdp-transfer-time-us = <12000>;
> -
> -		pinctrl-names = "default", "sleep";
> -		pinctrl-0 = <&dsi_active>;
> -		pinctrl-1 = <&dsi_suspend>;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				reg = <0>;
> -				dsi0_in: endpoint {
> -					remote-endpoint = <&mdp_intf1_out>;
> -				};
> -			};
> -
> -			port@1 {
> -				reg = <1>;
> -				dsi0_out: endpoint {
> -					remote-endpoint = <&panel_in>;
> -					data-lanes = <0 1 2 3>;
> -				};
> -			};
> -		};
> -
> -		panel: panel@0 {
> -			compatible = "sharp,lq101r1sx01";
> -			reg = <0>;
> -			link2 = <&secondary>;
> -
> -			power-supply = <...>;
> -			backlight = <...>;
> -
> -			port {
> -				panel_in: endpoint {
> -					remote-endpoint = <&dsi0_out>;
> -				};
> -			};
> -		};
> -	};
> -
> -	dsi_phy0: dsi-phy@fd922a00 {
> -		compatible = "qcom,dsi-phy-28nm-hpm";
> -		qcom,dsi-phy-index = <0>;
> -		reg-names =
> -			"dsi_pll",
> -			"dsi_phy",
> -			"dsi_phy_regulator";
> -		reg =   <0xfd922a00 0xd4>,
> -			<0xfd922b00 0x2b0>,
> -			<0xfd922d80 0x7b>;
> -		clock-names = "iface";
> -		clocks = <&mmcc MDSS_AHB_CLK>;
> -		#clock-cells = <1>;
> -		vddio-supply = <&pma8084_l12>;
> -
> -		qcom,dsi-phy-regulator-ldo-mode;
> -	};
> -- 
> 2.7.4
> 
