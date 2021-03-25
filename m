Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B77934930D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 14:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhCYN2E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 09:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbhCYN1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 09:27:42 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A906DC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 06:27:41 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id m12so2495531lfq.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 06:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vx71Pf2RGEZVhstJSAeTWdK5bcLJgeVlinNlnroC8TE=;
        b=nXlVu44uKZWMceKFiCkqS5VfnPdYHa53i/C1pvuX+3UWb+Ek5E8vEYR/+weRy5JbBY
         dbR9ZLlJPmG9iQmYcmHwLDwDBAefwAYLpxCkaIDGpv0onr6ha0IDS0/SL+6yGu8plt7Y
         CFUlgV0EQGVkmxrMZe8nN+QLuLIjjmyQWlGKUtKGHfr32A8yPL2u14uGDdcCwJZ7ErB/
         hlm6h50mYw0M8b/1zzAGq/iZVu5LMzgrmtX4mrVAAetq9EAl/k49UevYmf5S59JHLMMO
         Bqtcr1Wb/cNHJjzdvBQxHbI5upAv9Dj8VfoxRIHnob5nWJg6WsPP8YO7pp+Ivcz9Xl1r
         vrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vx71Pf2RGEZVhstJSAeTWdK5bcLJgeVlinNlnroC8TE=;
        b=oh9BhhnhgeEUkGieFjmOqNgYRIQi0Mt+atP/+btaFIL7u9MWHRc8YUA/59YRKZsrjq
         w8EjX1e61DtquQ8ER9OtzU19Mqq6rSw+ARtnypslPnY1jn8NkJ5XeCVwKPKlZk4iZve3
         VN7KlpwTVsaLgguyX/POvQCzrDyBQuy4ZngyA8eO9NJrgeB0Uiw612gvLT3kDdL1cpLI
         YVCJLFB0xv5T5l4M4+ml8bdknQdDYKv0VEvd05KILHflT8q/jg6KntBWxkbLrSv0U4Wv
         vhg+CmKg/ASxejOrJGKaE5rvd+njTHul4flL3SaEer9/2mmqiXIQ8RwFQjRzBXMi7FNE
         5W+A==
X-Gm-Message-State: AOAM531uD8JQnKBKQn+Tilfq8z4fesDTKuDOhJTPaI9vgA/cZKeuB2dO
        dUBugX05Aac+IT3O+WglfbgYmGYNovfLwg==
X-Google-Smtp-Source: ABdhPJwiu+9PsLSzOG+EE4gKbeyVgagYqiVxfUKIbdJq3HT6lj1XzJzE1GCP/YxAynUjwzqj4zsZ2g==
X-Received: by 2002:a05:6512:3a83:: with SMTP id q3mr5086618lfu.460.1616678859934;
        Thu, 25 Mar 2021 06:27:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f26sm553459lfe.118.2021.03.25.06.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 06:27:39 -0700 (PDT)
Subject: Re: [PATCH v14 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 bindings
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Cc:     kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
References: <1616673661-20038-1-git-send-email-mkrishn@codeaurora.org>
 <1616673661-20038-2-git-send-email-mkrishn@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7729c93d-5b9d-8a5f-870a-2b2414c26a72@linaro.org>
Date:   Thu, 25 Mar 2021 16:27:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1616673661-20038-2-git-send-email-mkrishn@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/03/2021 15:00, Krishna Manikandan wrote:
> Add YAML schema for the device tree bindings for DSI

Just a notice, that this removes assigned-clocks/assigned-clock-parents 
properties that are currently defined (and used e.g. by my patchset). 
However I do not think this should stop this patch series from being 
accepted unless there are other changes requested. I can readd necessary 
properties later.

> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v1:
>      - Separate dsi controller bindings to a separate patch (Stephen Boyd)
>      - Merge dsi-common-controller.yaml and dsi-controller-main.yaml to
>        a single file (Stephen Boyd)
>      - Drop supply entries and definitions from properties (Stephen Boyd)
>      - Modify phy-names property for dsi controller (Stephen Boyd)
>      - Remove boolean from description (Stephen Boyd)
>      - Drop pinctrl properties as they are standard entries (Stephen Boyd)
>      - Modify the description for ports property and keep the reference
>        to the generic binding where this is defined (Stephen Boyd)
>      - Add description to clock names (Stephen Boyd)
>      - Correct the indendation (Stephen Boyd)
>      - Drop the label for display dt nodes and correct the node
>        name (Stephen Boyd)
> 
> Changes in v2:
>      - Drop maxItems for clock (Stephen Boyd)
>      - Drop qcom,mdss-mdp-transfer-time-us as it is not used in upstream
>        dt file (Stephen Boyd)
>      - Keep child node directly under soc node (Stephen Boyd)
>      - Drop qcom,sync-dual-dsi as it is not used in upstream dt
> 
> Changes in v3:
>      - Add description for register property (Stephen Boyd)
> 
> Changes in v4:
>      - Add maxItems for phys property (Stephen Boyd)
>      - Add maxItems for reg property (Stephen Boyd)
>      - Add reference for data-lanes property (Stephen Boyd)
>      - Remove soc from example (Stephen Boyd)
> 
> Changes in v5:
>      - Modify title and description (Stephen Boyd)
>      - Add required properties for ports node (Stephen Boyd)
>      - Add data-lanes in the example (Stephen Boyd)
>      - Drop qcom,master-dsi property (Stephen Boyd)
> ---
>   .../bindings/display/msm/dsi-controller-main.yaml  | 188 ++++++++++++++++
>   .../devicetree/bindings/display/msm/dsi.txt        | 249 ---------------------
>   2 files changed, 188 insertions(+), 249 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>   delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> new file mode 100644
> index 0000000..ee5e3b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -0,0 +1,188 @@
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
> +  ports:
> +    $ref: "/schemas/graph.yaml#/properties/port"
> +    type: object
> +    description: |
> +      Contains DSI controller input and output ports as children, each
> +      containing one endpoint subnode.
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          Input endpoints of the controller.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +            properties:
> +              remote-endpoint:
> +                description: |
> +                  For port@0, set to phandle of the connected panel/bridge's
> +                  input endpoint. For port@1, set to the MDP interface output.
> +
> +              data-lanes:
> +                $ref: "/schemas/media/video-interfaces.yaml#"
> +                description: |
> +                  This describes how the physical DSI data lanes are mapped
> +                  to the logical lanes on the given platform. The value contained in
> +                  index n describes what physical lane is mapped to the logical lane n
> +                  (DATAn, where n lies between 0 and 3). The clock lane position is fixed
> +                  and can't be changed. Hence, they aren't a part of the DT bindings.
> +
> +                items:
> +                  - const: 0
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +      port@1:
> +        type: object
> +        description: |
> +          Output endpoints of the controller.
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +            properties:
> +              remote-endpoint: true
> +              data-lanes:
> +                items:
> +                  - const: 0
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +
> +    required:
> +      - port@0
> +      - port@1
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
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +
> +     dsi@ae94000 {
> +           compatible = "qcom,mdss-dsi-ctrl";
> +           reg = <0x0ae94000 0x400>;
> +           reg-names = "dsi_ctrl";
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
> 


-- 
With best wishes
Dmitry
