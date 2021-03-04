Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3C032D353
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 13:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236858AbhCDMhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 07:37:05 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:38050 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239832AbhCDMgn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 07:36:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614861378; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8V2vPmziaHYoF94dOTCdd4RSKHyJ9W8b3WU91YxKaKw=;
 b=OKQXcU4y5ueY93aV/ShKaSpe04HXvXx98yn9xJQlVYVimdYiHSHdKypdP9JiuShK6QxoRDhc
 3dF8YJQEPQRe9JEkPYecNPN0XTjAdS70FOXS2SX35PMi7/u7CZVBAE4lwz2HGNYDZG4Ge2AJ
 0oqxgI4k+gxtOEuHOMTdwU0anlk=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6040d43760050cf4d0cdb4b0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Mar 2021 12:36:07
 GMT
Sender: mkrishn=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9CCB1C43462; Thu,  4 Mar 2021 12:36:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mkrishn)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73A75C433C6;
        Thu,  4 Mar 2021 12:36:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 04 Mar 2021 18:06:05 +0530
From:   mkrishn@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        vinod.koul@linaro.org, rnayak@codeaurora.org,
        dianders@chromium.org, sibis@codeaurora.org, khsieh@codeaurora.org
Subject: Re: [PATCH v12 1/4] dt-bindings: msm: disp: add yaml schemas for DPU
 bindings
In-Reply-To: <161436872955.1254594.2765257503019122275@swboyd.mtv.corp.google.com>
References: <1613127000-3015-1-git-send-email-mkrishn@codeaurora.org>
 <161436872955.1254594.2765257503019122275@swboyd.mtv.corp.google.com>
Message-ID: <5a94b8c4ccb73afdf99bf901ce86acde@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-27 01:15, Stephen Boyd wrote:
> Quoting Krishna Manikandan (2021-02-12 02:49:57)
>> MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
>> like DPU display controller, DSI etc. Add YAML schema
>> for DPU device tree bindings.
>> 
>> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>> 
>> Changes in v2:
>>     - Changed dpu to DPU (Sam Ravnborg)
>>     - Fixed indentation issues (Sam Ravnborg)
>>     - Added empty line between different properties (Sam Ravnborg)
>>     - Replaced reference txt files with  their corresponding
>>       yaml files (Sam Ravnborg)
>>     - Modified the file to use "|" only when it is
>>       necessary (Sam Ravnborg)
>> 
>> Changes in v3:
>>     - Corrected the license used (Rob Herring)
>>     - Added maxItems for properties (Rob Herring)
>>     - Dropped generic descriptions (Rob Herring)
>>     - Added ranges property (Rob Herring)
>>     - Corrected the indendation (Rob Herring)
>>     - Added additionalProperties (Rob Herring)
>>     - Split dsi file into two, one for dsi controller
>>       and another one for dsi phy per target (Rob Herring)
>>     - Corrected description for pinctrl-names (Rob Herring)
>>     - Corrected the examples used in yaml file (Rob Herring)
>>     - Delete dsi.txt and dpu.txt (Rob Herring)
>> 
>> Changes in v4:
>>     - Move schema up by one level (Rob Herring)
>>     - Add patternProperties for mdp node (Rob Herring)
>>     - Corrected description of some properties (Rob Herring)
>> 
>> Changes in v5:
>>     - Correct the indentation (Rob Herring)
>>     - Remove unnecessary description from properties (Rob Herring)
>>     - Correct the number of interconnect entries (Rob Herring)
>>     - Add interconnect names for sc7180 (Rob Herring)
>>     - Add description for ports (Rob Herring)
>>     - Remove common properties (Rob Herring)
>>     - Add unevalutatedProperties (Rob Herring)
>>     - Reference existing dsi controller yaml in the common
>>       dsi controller file (Rob Herring)
>>     - Correct the description of clock names to include only the
>>       clocks that are required (Rob Herring)
>>     - Remove properties which are already covered under the common
>>       binding (Rob Herring)
>>     - Add dsi phy supply nodes which are required for sc7180 and
>>       sdm845 targets (Rob Herring)
>>     - Add type ref for syscon-sfpb (Rob Herring)
>> 
>> Changes in v6:
>>     - Fixed errors during dt_binding_check (Rob Herring)
>>     - Add maxItems for phys and phys-names (Rob Herring)
>>     - Use unevaluatedProperties wherever required (Rob Herring)
>>     - Removed interrupt controller from required properties for
>>       dsi controller (Rob Herring)
>>     - Add constraints for dsi-phy reg-names based on the compatible
>>       phy version (Rob Herring)
>>     - Add constraints for dsi-phy supply nodes based on the
>>       compatible phy version (Rob Herring)
>> 
>> Changes in v7:
>>     - Add default value for qcom,mdss-mdp-transfer-time-us (Rob 
>> Herring)
>>     - Modify the schema for data-lanes (Rob Herring)
>>     - Split the phy schema into separate schemas based on
>>       the phy version (Rob Herring)
>> 
>> Changes in v8:
>>     - Resolve merge conflicts with latest dsi.txt file
>>     - Include dp yaml change also in the same series
>> 
>> Changes in v9:
>>     - Combine target specific dsi controller yaml files
>>       to a single yaml file (Rob Herring)
>>     - Combine target specific dsi phy yaml files into a
>>       single yaml file (Rob Herring)
>>     - Use unevaluatedProperties and additionalProperties
>>       wherever required
>>     - Remove duplicate properties from common yaml files
>> 
>> Changes in v10:
>>     - Split the patch into separate patches for DPU, DSI and
>>       PHY (Stephen Boyd)
>>     - Drop unnecessary fullstop (Stephen Boyd)
>>     - Add newline whereever required (Stephen Boyd)
>>     - Add description for clock used (Stephen Boyd)
>>     - Modify the description for interconnect entries  (Stephen Boyd)
>>     - Drop assigned clock entries as it a generic property (Stephen 
>> Boyd)
>>     - Correct the definition for interrupts (Stephen Boyd)
>>     - Drop clock names from required properties (Stephen Boyd)
>>     - Drop labels for display nodes from example (Stephen Boyd)
>>     - Drop flags from interrupts entries (Stephen Boyd)
>> 
>> Changes in v11:
>>     - Drop maxItems for clocks (Stephen Boyd)
>> 
>> Changes in v12:
>>     - Add description for register property (Stephen Boyd)
>>     - Add maxItems for interrupts (Stephen Boyd)
>>     - Add description for iommus property (Stephen Boyd)
>>     - Add description for interconnects (Stephen Boyd)
>>     - Change display node name to display_controller (Stephen Boyd)
>> ---
> 
> Looks mostly good to me. Some minor comments but otherwise seems OK.
> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> new file mode 100644
>> index 0000000..df88146
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> @@ -0,0 +1,212 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DPU dt properties
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +description: |
>> +  Device tree bindings for MSM Mobile Display Subsytem(MDSS) that 
>> encapsulates
>> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. 
>> Device tree
>> +  bindings of MDSS and DPU are mentioned for SC7180 target.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,sc7180-mdss
>> +
>> +  reg:
>> +    items:
>> +      - description: Address offset and size for mdss register set
> 
> I think the "rule" is if there's only one reg property then it is
> maxItems: 1, sorry about that confusion.
> 
>> +
>> +  reg-names:
>> +    const: mdss
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display AHB clock from gcc
>> +      - description: Display AHB clock from dispcc
>> +      - description: Display core clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: ahb
>> +      - const: core
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  "#interrupt-cells":
>> +    const: 1
>> +
>> +  iommus:
>> +    items:
>> +      - description: Phandle to apps_smmu node with sid mask for hf0
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  ranges: true
> 
> Why isn't this part of the example?
> 
>> +
>> +  interconnects:
>> +    items:
>> +      - description: Interconnect path specifying the port ids for 
>> data bus
>> +
>> +  interconnect-names:
>> +    const: mdp0-mem
>> +
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    description: Node containing the properties of DPU.
>> +
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,sc7180-dpu
>> +
>> +      reg:
>> +        items:
>> +          - description: Address offset and size for mdp register set
>> +          - description: Address offset and size for vbif register 
>> set
>> +
>> +      reg-names:
>> +        items:
>> +          - const: mdp
>> +          - const: vbif
>> +
>> +      clocks:
>> +        items:
>> +          - description: Display hf axi clock
>> +          - description: Display ahb clock
>> +          - description: Display rotator clock
>> +          - description: Display lut clock
>> +          - description: Display core clock
>> +          - description: Display vsync clock
>> +
>> +      clock-names:
>> +        items:
>> +          - const: bus
>> +          - const: iface
>> +          - const: rot
>> +          - const: lut
>> +          - const: core
>> +          - const: vsync
>> +
>> +      interrupts:
>> +        maxItems: 1
>> +
>> +      ports:
>> +        type: object
>> +        description: |
>> +          Contains the list of output ports from DPU device. These 
>> ports
>> +          connect to interfaces that are external to the DPU 
>> hardware,
>> +          such as DSI, DP etc. Each output port contains an endpoint 
>> that
>> +          describes how it is connected to an external interface. 
>> These
>> +          are described by the standard properties documented in 
>> files
>> +          mentioned below.
>> +
>> +          Documentation/devicetree/bindings/graph.txt
>> +          
>> Documentation/devicetree/bindings/media/video-interfaces.txt
>> +
>> +        properties:
>> +          port@0:
>> +            type: object
>> +            description: DPU_INTF1 (DSI1)
>> +
>> +          port@1:
>> +            type: object
>> +            description: DPU_INTF2 (DSI2)
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - power-domains
>> +  - clocks
>> +  - interrupts
>> +  - interrupt-controller
>> +  - iommus
> 
> Shouldn't ranges be required?
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
>> +
>> +    soc {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      mdss@ae00000 {
>> +         compatible = "qcom,sc7180-mdss";
>> +         #address-cells = <2>;
>> +         #size-cells = <2>;
>> +         reg = <0 0xae00000 0 0x1000>;
>> +         reg-names = "mdss";
>> +         power-domains = <&dispcc MDSS_GDSC>;
>> +
>> +         clocks = <&gcc GCC_DISP_AHB_CLK>,
>> +                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +         clock-names = "iface", "ahb", "core";
>> +
>> +         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +         interrupt-controller;
>> +         #interrupt-cells = <1>;
>> +
>> +         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
>> +         interconnect-names = "mdp0-mem";
>> +
>> +         iommus = <&apps_smmu 0x800 0x2>;
>> +
>> +         display-controller@ae01000 {
>> +                   compatible = "qcom,sc7180-dpu";
>> +                   reg = <0 0x0ae01000 0 0x8f000>,
>> +                         <0 0x0aeb0000 0 0x2008>;
>> +
>> +                   reg-names = "mdp", "vbif";
>> +
>> +                   clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>> +                            <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                            <&dispcc DISP_CC_MDSS_ROT_CLK>,
>> +                            <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>> +                            <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +                            <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +                   clock-names = "bus", "iface", "rot", "lut", 
>> "core",
>> +                                 "vsync";
>> +
>> +                   interrupt-parent = <&mdss>;
>> +                   interrupts = <0>;
>> +
>> +                   ports {
>> +                           #address-cells = <1>;
>> +                           #size-cells = <0>;
>> +
>> +                           port@0 {
>> +                                   reg = <0>;
>> +                                   dpu_intf1_out: endpoint {
>> +                                                  remote-endpoint = 
>> <&dsi0_in>;
>> +                                   };
>> +                           };
>> +                   };
>> +         };
>> +      };
>> +    };
>> +...
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>> new file mode 100644
>> index 0000000..71f8658
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>> @@ -0,0 +1,202 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DPU dt properties
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +description: |
>> +  Device tree bindings for MSM Mobile Display Subsytem(MDSS) that 
>> encapsulates
>> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. 
>> Device tree
>> +  bindings of MDSS and DPU are mentioned for SDM845 target.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,sdm845-mdss
>> +
>> +  reg:
>> +    items:
>> +      - description: Address offset and size for mdss register set
>> +
>> +  reg-names:
>> +    const: mdss
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display AHB clock from gcc
>> +      - description: Display AXI clock
>> +      - description: Display core clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: bus
>> +      - const: core
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  "#interrupt-cells":
>> +    const: 1
>> +
>> +  iommus:
>> +    items:
>> +      - description: Phandle to apps_smmu node with sid mask for hf0
>> +      - description: Phandle to apps_smmu node with sid mask for hf1
> 
> What does 'hf' mean here? Can you spell it out? And capitalize SID for
> Stream ID?
> 
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    description: Node containing the properties of DPU.
>> +
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,sdm845-dpu
>> +
>> +      reg:
>> +        items:
>> +          - description: Address offset and size for mdp register set
>> +          - description: Address offset and size for vbif register 
>> set
>> +
>> +      reg-names:
>> +        items:
>> +          - const: mdp
>> +          - const: vbif
>> +
>> +      clocks:
>> +        items:
>> +          - description: Display ahb clock
>> +          - description: Display axi clock
>> +          - description: Display core clock
>> +          - description: Display vsync clock
>> +
>> +      clock-names:
>> +        items:
>> +          - const: iface
>> +          - const: bus
>> +          - const: core
>> +          - const: vsync
>> +
>> +      interrupts:
>> +        maxItems: 1
>> +
>> +      ports:
>> +        type: object
>> +        description: |
>> +          Contains the list of output ports from DPU device. These 
>> ports
>> +          connect to interfaces that are external to the DPU 
>> hardware,
>> +          such as DSI, DP etc. Each output port contains an endpoint 
>> that
>> +          describes how it is connected to an external interface. 
>> These
>> +          are described by the standard properties documented in 
>> files
>> +          mentioned below.
>> +
>> +          Documentation/devicetree/bindings/graph.txt
>> +          
>> Documentation/devicetree/bindings/media/video-interfaces.txt
>> +
>> +        properties:
>> +          port@0:
>> +            type: object
>> +            description: DPU_INTF1 (DSI1)
>> +
>> +          port@1:
>> +            type: object
>> +            description: DPU_INTF2 (DSI2)
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - power-domains
>> +  - clocks
>> +  - interrupts
>> +  - interrupt-controller
>> +  - iommus
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +- |
>> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    soc {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
> 
> I think we can drop the soc node from the examples.
Hi Stephen,

In latest dt schema, there is a rule that we have to specify the address 
and size cells or else it will take default value of 1 for both. If we 
use these default values, dt binding check will throw error as display 
uses 2 address cells and 2 size cells. That's why soc node was added to 
specify the values for mdss node.

Thanks,
Krishna
> 
>> +
>> +      mdss@ae00000 {
>> +          compatible = "qcom,sdm845-mdss";
>> +          #address-cells = <2>;
>> +          #size-cells = <2>;
>> +          reg = <0 0x0ae00000 0 0x1000>;
>> +          reg-names = "mdss";
>> +          power-domains = <&dispcc MDSS_GDSC>;
>> +
>> +          clocks = <&gcc GCC_DISP_AHB_CLK>,
>> +                   <&gcc GCC_DISP_AXI_CLK>,
>> +                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +          clock-names = "iface", "bus", "core";
>> +
>> +          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +          interrupt-controller;
>> +          #interrupt-cells = <1>;
>> +
>> +          iommus = <&apps_smmu 0x880 0x8>,
>> +                   <&apps_smmu 0xc80 0x8>;
>> +
>> +          display-controller@ae01000 {
>> +                    compatible = "qcom,sdm845-dpu";
>> +                    reg = <0 0x0ae01000 0 0x8f000>,
>> +                          <0 0x0aeb0000 0 0x2008>;
>> +                    reg-names = "mdp", "vbif";
>> +
>> +                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                             <&dispcc DISP_CC_MDSS_AXI_CLK>,
>> +                             <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +                             <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +                    clock-names = "iface", "bus", "core", "vsync";
>> +
>> +                    interrupt-parent = <&mdss>;
>> +                    interrupts = <0>;
>> +
>> +                    ports {
>> +                           #address-cells = <1>;
>> +                           #size-cells = <0>;
>> +
>> +                           port@0 {
>> +                                   reg = <0>;
>> +                                   dpu_intf1_out: endpoint {
>> +                                                  remote-endpoint = 
>> <&dsi0_in>;
>> +                                   };
>> +                           };
>> +
>> +                           port@1 {
>> +                                   reg = <1>;
>> +                                   dpu_intf2_out: endpoint {
>> +                                                  remote-endpoint = 
>> <&dsi1_in>;
>> +                                   };
>> +                           };
>> +                    };
>> +          };
>> +      };
>> +    };
>> +...
