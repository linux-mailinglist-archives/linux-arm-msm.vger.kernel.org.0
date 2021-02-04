Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F0E30ECEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 08:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhBDHE1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 02:04:27 -0500
Received: from so15.mailgun.net ([198.61.254.15]:14665 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232633AbhBDHEZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 02:04:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612422242; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dx8ZRSkuSuGjqvWJVkttuCSgB53q/nXltybEFOcsApU=;
 b=NonHKz5zu8yw0K1XV+7/BTRE9mckbV4LsZZGJa+WTJEzXKWY1P505vR0/7vIRaSTvCnDgXob
 AbEbjSyfU4nBXfK70eH2Pi1IGewbrSLjtdcHRSMLKww7kFBhwkaESuq0usQhZQtthE5Oj0uB
 U7VajFiFIZtksDfDel2wxy2hzqE=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 601b9c4784d0ac89673b0888 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 07:03:35
 GMT
Sender: mkrishn=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AEFEEC43461; Thu,  4 Feb 2021 07:03:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mkrishn)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C6695C433C6;
        Thu,  4 Feb 2021 07:03:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 04 Feb 2021 12:33:30 +0530
From:   mkrishn@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        vinod.koul@linaro.org, rnayak@codeaurora.org,
        dianders@chromium.org, sibis@codeaurora.org
Subject: Re: [PATCH v9 1/2] dt-bindings: msm: disp: add yaml schemas for DPU
 and DSI bindings
In-Reply-To: <160772823551.1580929.17011175154206191008@swboyd.mtv.corp.google.com>
References: <1607670585-26438-1-git-send-email-mkrishn@codeaurora.org>
 <160772823551.1580929.17011175154206191008@swboyd.mtv.corp.google.com>
Message-ID: <0aa5d4dea4122bd4528268b0ce957215@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thank you for reviewing the patches. The latest patchsets have been 
uploaded in the below series. Please review the patches and provide your 
comments on them.

Series: 
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=427607


Also, please find my comments on few of your queries on earlier patch 
below. All the other review comments are addressed in the latest 
patchset.

On 2020-12-12 04:40, Stephen Boyd wrote:
> Quoting Krishna Manikandan (2020-12-10 23:09:44)
>>  .../bindings/display/msm/dpu-sc7180.yaml           | 235 
>> +++++++++++++++++++
>>  .../bindings/display/msm/dpu-sdm845.yaml           | 216 
>> ++++++++++++++++++
>>  .../devicetree/bindings/display/msm/dpu.txt        | 141 ------------
>>  .../display/msm/dsi-common-controller.yaml         | 235 
>> +++++++++++++++++++
>>  .../bindings/display/msm/dsi-controller-main.yaml  | 119 ++++++++++
>>  .../bindings/display/msm/dsi-phy-10nm.yaml         |  64 ++++++
>>  .../bindings/display/msm/dsi-phy-14nm.yaml         |  64 ++++++
>>  .../bindings/display/msm/dsi-phy-20nm.yaml         |  68 ++++++
>>  .../bindings/display/msm/dsi-phy-28nm.yaml         |  64 ++++++
>>  .../devicetree/bindings/display/msm/dsi-phy.yaml   |  81 +++++++
>>  .../devicetree/bindings/display/msm/dsi.txt        | 249 
>> ---------------------
>>  11 files changed, 1146 insertions(+), 390 deletions(-)
> 
> This is quite a bit to review. Any chance to split it up into different
> patches? Looks like that could be: dpu, phy, and dsi to make this a bit
> more reviewable.
> 
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>>  delete mode 100644 
>> Documentation/devicetree/bindings/display/msm/dpu.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
>>  delete mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi.txt
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> new file mode 100644
>> index 0000000..8397ea8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> @@ -0,0 +1,235 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DPU dt properties.
> 
> Drop the full stop?
> 
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
> 
> Add a newline here please.
> 
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    const: mdss
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 3
> 
> items:
>  - const: "description"
>  ...
> 
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
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  ranges: true
>> +
>> +  interconnects:
>> +    description: |
>> +      Interconnect path specifier for MDSS according to
>> +      
>> Documentation/devicetree/bindings/interconnect/interconnect.txt.
>> +      An entry should contain 2 paths corresponding to 2 AXI ports 
>> representing
>> +      source and destination ports.
> 
> Why such a long description?
> 
>> +    minItems: 1
> 
> Why not items: and then a const element with description?
> 
>> +
>> +  interconnect-names:
>> +    description: |
>> +      MDSS will have 2 port names to differentiate between the
>> +      2 interconnect paths defined with interconnect specifier.
> 
> Drop description?
> 
>> +    items:
>> +      - const: mdp0-mem
>> +
>> +  assigned-clocks:
>> +    maxItems: 1
>> +
>> +  assigned-clock-rates:
>> +    maxItems: 1
> 
> Are these properties necessary? Aren't they able to be applied to any
> node? Seems like they don't need to be called out here.
> 
>> +
>> +patternProperties:
>> +  "^mdp@[0-9a-f]+$":
> 
> Name should be 'display-controller'?
Display node name is mdp in the current dpu code
> 
>> +    type: object
>> +    description: Node containing the properties of DPU.
>> +
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,sc7180-dpu
>> +
>> +      reg:
>> +        maxItems: 2
>> +
>> +      reg-names:
>> +        items:
>> +          - const: mdp
>> +          - const: vbif
>> +
>> +      clocks:
>> +        maxItems: 6
>> +
>> +      clock-names:
>> +        description: |
>> +          Device clock names, must be in same order as clocks 
>> property.
>> +          The following clocks are required.
> 
> Just drop this description and have items.
> 
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
> 
> It's optional?
> 
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
> 
> Add a newline please.
> 
>> +          port@1:
>> +            type: object
>> +            description: DPU_INTF2 (DSI2)
>> +
>> +      assigned-clocks:
>> +        maxItems: 4
>> +
>> +      assigned-clock-rates:
>> +        maxItems: 4
> 
> These two properties can be dropped.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
> 
> reg-names shouldn't be required.
If reg-names are not defined, then probe will fail as io_remap uses 
register names during init in the current code.
We can work on the source file changes to handle it  for future chipsets
> 
>> +  - power-domains
>> +  - clocks
>> +  - clock-names
> 
> Same for clock-names technically.
> 
>> +  - interrupts
>> +  - interrupt-controller
>> +  - iommus
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
>> +    soc: soc {
> 
> Is this node needed? Seems like we can remove it.
In latest dt schema, there is a rule that we have to specify the address 
and size cells or else it will take default value of 1. This will result 
in error
as display uses 2 address cells and 2 size cells.
> 
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      mdss: mdss@ae00000 {
> 
> Node name should be something like 'subsystem@<reg>'.
> 
>> +         compatible = "qcom,sc7180-mdss";
>> +         reg = <0 0xae00000 0 0x1000>;
>> +         reg-names = "mdss";
> 
> Please drop this useless reg-names.
> 
>> +         power-domains = <&dispcc MDSS_GDSC>;
>> +
>> +         clocks = <&gcc GCC_DISP_AHB_CLK>,
>> +                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +
> 
> Drop newline?
> 
>> +         clock-names = "iface", "ahb", "core";
>> +
>> +         assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +         assigned-clock-rates = <300000000>;
> 
> Ok I guess.
> 
>> +
>> +         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +         interrupt-controller;
>> +         #interrupt-cells = <1>;
>> +
>> +         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
>> +
> 
> Drop newline please.
> 
>> +         interconnect-names = "mdp0-mem";
>> +
>> +         iommus = <&apps_smmu 0x800 0x2>;
>> +
>> +         #address-cells = <2>;
>> +         #size-cells = <2>;
> 
> Can this be much higher up?
> 
>> +
>> +         mdp: mdp@ae01000 {
> 
> Node name needs some work. Drop label?
> 
>> +                   compatible = "qcom,sc7180-dpu";
>> +                   reg = <0 0x0ae01000 0 0x8f000>,
>> +                         <0 0x0aeb0000 0 0x2008>;
> 
> Wow size ends in 8!
These are register definition for 2 register ranges for mdp and vbif. 
Here, 2 cells are used to specify address and size cells.
> 
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
>> +                   assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +                                     <&dispcc 
>> DISP_CC_MDSS_VSYNC_CLK>,
>> +                                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
>> +                                     <&dispcc DISP_CC_MDSS_ROT_CLK>;
> 
> Is ROT_CLK here twice for some reason?
> 
>> +                   assigned-clock-rates = <300000000>,
>> +                                          <19200000>,
>> +                                          <19200000>,
>> +                                          <19200000>;
>> +
>> +                   interrupt-parent = <&mdss>;
>> +                   interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> 
> Drop flags?
> 
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
>> index 0000000..17395f6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>> @@ -0,0 +1,216 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DPU dt properties.
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
> 
> Is this substantially different from the previous binding? Can they 
> just
> be merged together?
Sc7180 and sdm845 bindings have differences in some display 
properties.eg:clock
> 
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,sdm845-mdss
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    const: mdss
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    description: |
>> +      Device clock names in the same order as mentioned in clocks 
>> property.
>> +      The required clocks are mentioned below.
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
>> +    maxItems: 2
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  ranges: true
>> +
>> +  assigned-clocks:
>> +    maxItems: 1
>> +
>> +  assigned-clock-rates:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  "^mdp@[0-9a-f]+$":
>> +    type: object
>> +    description: Node containing the properties of DPU.
>> +
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,sdm845-dpu
>> +      reg:
>> +        maxItems: 2
>> +
>> +      reg-names:
>> +        items:
>> +          - const: mdp
>> +          - const: vbif
>> +
>> +      clocks:
>> +        maxItems: 4
>> +
>> +      clock-names:
>> +        description: |
>> +          Device clock names, must be in same order as clocks 
>> property.
>> +          The following clocks are required.
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
>> +          port@1:
>> +            type: object
>> +            description: DPU_INTF2 (DSI2)
>> +
>> +      assigned-clocks:
>> +        maxItems: 2
>> +
>> +      assigned-clock-rates:
>> +        maxItems: 2
>> +
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - power-domains
>> +  - clocks
>> +  - clock-names
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
>> +    soc: soc {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      mdss: mdss@ae00000 {
>> +          compatible = "qcom,sdm845-mdss";
>> +          reg = <0 0x0ae00000 0 0x1000>;
>> +          reg-names = "mdss";
>> +          power-domains = <&dispcc MDSS_GDSC>;
>> +
>> +          clocks = <&gcc GCC_DISP_AHB_CLK>,
>> +                   <&gcc GCC_DISP_AXI_CLK>,
>> +                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +          clock-names = "iface", "bus", "core";
>> +
>> +          assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +          assigned-clock-rates = <300000000>;
>> +
>> +          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +          interrupt-controller;
>> +          #interrupt-cells = <1>;
>> +
>> +          iommus = <&apps_smmu 0x880 0x8>,
>> +                   <&apps_smmu 0xc80 0x8>;
>> +
>> +          #address-cells = <2>;
>> +          #size-cells = <2>;
>> +
>> +          mdss_mdp: mdp@ae01000 {
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
>> +                    assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +                                      <&dispcc 
>> DISP_CC_MDSS_VSYNC_CLK>;
>> +                    assigned-clock-rates = <300000000>,
>> +                                           <19200000>;
>> +
>> +                    interrupt-parent = <&mdss>;
>> +                    interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
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
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt 
>> b/Documentation/devicetree/bindings/display/msm/dpu.txt
>> deleted file mode 100644
>> index 551ae26..0000000
>> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
>> +++ /dev/null
>> @@ -1,141 +0,0 @@
>> -Qualcomm Technologies, Inc. DPU KMS
>> -
>> -Description:
>> -
>> -Device tree bindings for MSM Mobile Display Subsytem(MDSS) that 
>> encapsulates
>> -sub-blocks like DPU display controller, DSI and DP interfaces etc.
>> -The DPU display controller is found in SDM845 SoC.
>> -
>> -MDSS:
>> -Required properties:
>> -- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
>> -- reg: physical base address and length of contoller's registers.
>> -- reg-names: register region names. The following region is required:
>> -  * "mdss"
>> -- power-domains: a power domain consumer specifier according to
>> -  Documentation/devicetree/bindings/power/power_domain.txt
>> -- clocks: list of clock specifiers for clocks needed by the device.
>> -- clock-names: device clock names, must be in same order as clocks 
>> property.
>> -  The following clocks are required:
>> -  * "iface"
>> -  * "bus"
>> -  * "core"
>> -- interrupts: interrupt signal from MDSS.
>> -- interrupt-controller: identifies the node as an interrupt 
>> controller.
>> -- #interrupt-cells: specifies the number of cells needed to encode an 
>> interrupt
>> -  source, should be 1.
>> -- iommus: phandle of iommu device node.
>> -- #address-cells: number of address cells for the MDSS children. 
>> Should be 1.
>> -- #size-cells: Should be 1.
>> -- ranges: parent bus address space is the same as the child bus 
>> address space.
>> -- interconnects : interconnect path specifier for MDSS according to
>> -  Documentation/devicetree/bindings/interconnect/interconnect.txt. 
>> Should be
>> -  2 paths corresponding to 2 AXI ports.
>> -- interconnect-names : MDSS will have 2 port names to differentiate 
>> between the
>> -  2 interconnect paths defined with interconnect specifier.
>> -
>> -Optional properties:
>> -- assigned-clocks: list of clock specifiers for clocks needing rate 
>> assignment
>> -- assigned-clock-rates: list of clock frequencies sorted in the same 
>> order as
>> -  the assigned-clocks property.
>> -
>> -MDP:
>> -Required properties:
>> -- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
>> -- reg: physical base address and length of controller's registers.
>> -- reg-names : register region names. The following region is 
>> required:
>> -  * "mdp"
>> -  * "vbif"
>> -- clocks: list of clock specifiers for clocks needed by the device.
>> -- clock-names: device clock names, must be in same order as clocks 
>> property.
>> -  The following clocks are required.
>> -  * "bus"
>> -  * "iface"
>> -  * "core"
>> -  * "vsync"
>> -- interrupts: interrupt line from DPU to MDSS.
>> -- ports: contains the list of output ports from DPU device. These 
>> ports connect
>> -  to interfaces that are external to the DPU hardware, such as DSI, 
>> DP etc.
>> -
>> -  Each output port contains an endpoint that describes how it is 
>> connected to an
>> -  external interface. These are described by the standard properties 
>> documented
>> -  here:
>> -       Documentation/devicetree/bindings/graph.txt
>> -       Documentation/devicetree/bindings/media/video-interfaces.txt
>> -
>> -       Port 0 -> DPU_INTF1 (DSI1)
>> -       Port 1 -> DPU_INTF2 (DSI2)
>> -
>> -Optional properties:
>> -- assigned-clocks: list of clock specifiers for clocks needing rate 
>> assignment
>> -- assigned-clock-rates: list of clock frequencies sorted in the same 
>> order as
>> -  the assigned-clocks property.
>> -
>> -Example:
>> -
>> -       mdss: mdss@ae00000 {
>> -               compatible = "qcom,sdm845-mdss";
>> -               reg = <0xae00000 0x1000>;
>> -               reg-names = "mdss";
>> -
>> -               power-domains = <&clock_dispcc 0>;
>> -
>> -               clocks = <&gcc GCC_DISP_AHB_CLK>, <&gcc 
>> GCC_DISP_AXI_CLK>,
>> -                        <&clock_dispcc DISP_CC_MDSS_MDP_CLK>;
>> -               clock-names = "iface", "bus", "core";
>> -
>> -               assigned-clocks = <&clock_dispcc 
>> DISP_CC_MDSS_MDP_CLK>;
>> -               assigned-clock-rates = <300000000>;
>> -
>> -               interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> -               interrupt-controller;
>> -               #interrupt-cells = <1>;
>> -
>> -               interconnects = <&rsc_hlos MASTER_MDP0 &rsc_hlos 
>> SLAVE_EBI1>,
>> -                               <&rsc_hlos MASTER_MDP1 &rsc_hlos 
>> SLAVE_EBI1>;
>> -
>> -               interconnect-names = "mdp0-mem", "mdp1-mem";
>> -
>> -               iommus = <&apps_iommu 0>;
>> -
>> -               #address-cells = <2>;
>> -               #size-cells = <1>;
>> -               ranges = <0 0 0xae00000 0xb2008>;
>> -
>> -               mdss_mdp: mdp@ae01000 {
>> -                       compatible = "qcom,sdm845-dpu";
>> -                       reg = <0 0x1000 0x8f000>, <0 0xb0000 0x2008>;
>> -                       reg-names = "mdp", "vbif";
>> -
>> -                       clocks = <&clock_dispcc DISP_CC_MDSS_AHB_CLK>,
>> -                                <&clock_dispcc DISP_CC_MDSS_AXI_CLK>,
>> -                                <&clock_dispcc DISP_CC_MDSS_MDP_CLK>,
>> -                                <&clock_dispcc 
>> DISP_CC_MDSS_VSYNC_CLK>;
>> -                       clock-names = "iface", "bus", "core", "vsync";
>> -
>> -                       assigned-clocks = <&clock_dispcc 
>> DISP_CC_MDSS_MDP_CLK>,
>> -                                         <&clock_dispcc 
>> DISP_CC_MDSS_VSYNC_CLK>;
>> -                       assigned-clock-rates = <0 0 300000000 
>> 19200000>;
>> -
>> -                       interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
>> -
>> -                       ports {
>> -                               #address-cells = <1>;
>> -                               #size-cells = <0>;
>> -
>> -                               port@0 {
>> -                                       reg = <0>;
>> -                                       dpu_intf1_out: endpoint {
>> -                                               remote-endpoint = 
>> <&dsi0_in>;
>> -                                       };
>> -                               };
>> -
>> -                               port@1 {
>> -                                       reg = <1>;
>> -                                       dpu_intf2_out: endpoint {
>> -                                               remote-endpoint = 
>> <&dsi1_in>;
>> -                                       };
>> -                               };
>> -                       };
>> -               };
>> -       };
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
>> new file mode 100644
>> index 0000000..2b7d928
>> --- /dev/null
>> +++ 
>> b/Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
>> @@ -0,0 +1,235 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: 
>> http://devicetree.org/schemas/display/msm/dsi-common-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DSI controller dt properties.
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +description: |
>> +  Common Device tree bindings for DSI controller.
>> +
>> +allOf:
>> +  - $ref: "../dsi-controller.yaml#"
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,mdss-dsi-ctrl
>> +
>> +  vdd-supply:
>> +    description: Phandle to vdd regulator device node.
>> +
>> +  vddio-supply:
>> +    description: Phandle to vdd-io regulator device node.
>> +
>> +  vdda-supply:
>> +    description: Phandle to vdda regulator device node.
>> +
>> +  phys:
>> +    description: Phandle to DSI PHY device node.
> 
> Don't think we need descriptions on these.
> 
>> +    maxItems: 1
> 
> It's optional?
> 
>> +
>> +  phy-names:
>> +    description: Name of the corresponding PHY device.
> 
> Doesn't seem like it's optional so just items: const?
> 
>> +    maxItems: 1
>> +
>> +  syscon-sfpb:
>> +    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
>> +    $ref: "/schemas/types.yaml#/definitions/phandle"
>> +
>> +      # Optional Properties for dsi controller
> 
> Weird tab?
> 
>> +  qcom,mdss-mdp-transfer-time-us:
>> +    description: |
>> +      Specifies the DSI transfer time for command mode
>> +      panels in microseconds. Driver uses this number to adjust
>> +      the clock rate according to the expected transfer time.
>> +      Increasing this value would slow down the mdp processing
>> +      and can result in slower performance.
>> +      Decreasing this value can speed up the mdp processing,
>> +      but this can also impact power consumption.
>> +      As a rule this time should not be higher than the time
>> +      that would be expected with the processing at the
>> +      DSI link rate since anyways this would be the maximum
>> +      transfer time that could be achieved.
>> +      If ping pong split is enabled, this time should not be higher
>> +      than two times the DSI link rate time.
>> +      This is an optional property.
>> +    default: 14000
>> +
>> +  qcom,dual-dsi-mode:
>> +    type: boolean
>> +    description: |
>> +      Boolean value indicating if the DSI controller is
> 
> "Boolean value" is redundant.
> 
>> +      driving a panel which needs 2 DSI links.
> 
> Shouldn't this be a property of the panel?
Currently we are defining this as part of dsi controller. We can work on 
the source file changes to define it as a panel property.
> 
>> +
>> +  qcom,master-dsi:
>> +    type: boolean
>> +    description: |
>> +      Boolean value indicating if the DSI controller is driving
>> +      the master link of the 2-DSI panel.
> 
> Shouldn't this be a property of the panel?
> 
>> +
>> +  qcom,sync-dual-dsi:
>> +    type: boolean
>> +    description: |
>> +      Boolean value indicating if the DSI controller is driving a
>> +      2-DSI panel whose 2 links need receive command simultaneously.
> 
> Shouldn't this be a property of the panel?
> 
>> +
>> +  pinctrl-names:
>> +    description: The pin control state names.
>> +    items:
>> +      - const: default
>> +      - const: sleep
>> +
>> +  pinctrl-0:
>> +    description: The default pinctrl state (active)
>> +
>> +  pinctrl-1:
>> +    description: The sleep pinctrl state (suspend)
> 
> These can be left out? Doesn't seem like they're non-standard.
> 
>> +
>> +  ports:
>> +    type: object
>> +    description: |
>> +      Contains DSI controller input and output ports as children, 
>> each
>> +      containing one endpoint subnode as defined in
>> +      Documentation/devicetree/bindings/graph.txt and
>> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +
>> +    properties:
>> +      port@0:
>> +        type: object
>> +        description: |
>> +          Input endpoints of the controller.
>> +
>> +        properties:
>> +          reg:
>> +            const: 0
>> +
>> +          endpoint:
>> +            type: object
>> +            properties:
>> +              remote-endpoint:
> 
> Can this and the properties below go into some generic binding instead
> of here?
> 
>> +                description: |
>> +                  For port@0, set to phandle of the connected 
>> panel/bridge's
>> +                  input endpoint. For port@1, set to the MDP 
>> interface output.
>> +                  See Documentation/devicetree/bindings/graph.txt for
>> +                  device graph info.
>> +
>> +              data-lanes:
>> +                description: |
>> +                  This describes how the physical DSI data lanes are 
>> mapped
>> +                  to the logical lanes on the given platform. The 
>> value contained in
>> +                  index n describes what physical lane is mapped to 
>> the logical lane n
>> +                  (DATAn, where n lies between 0 and 3). The clock 
>> lane position is fixed
>> +                  and can't be changed. Hence, they aren't a part of 
>> the DT bindings. See
>> +                  
>> Documentation/devicetree/bindings/media/video-interfaces.txt for
>> +                  more info on the data-lanes property.
>> +
>> +                  For example:
>> +                  data-lanes = <3 0 1 2>;
>> +
>> +                  The above mapping describes that the logical data 
>> lane DATA0 is mapped
>> +                  to the physical data lane DATA3, logical DATA1 to 
>> physical DATA0,
>> +                  logic DATA2 to phys DATA1 and logic DATA3 to phys 
>> DATA2. There are
>> +                  only a limited number of physical to logical 
>> mappings possible.
>> +                oneOf:
> 
> That is a lot.
> 
>> +                  - items:
>> +                    - const: 0
>> +                    - const: 1
>> +                    - const: 2
>> +                    - const: 3
>> +                  - items:
>> +                    - const: 1
>> +                    - const: 2
>> +                    - const: 3
>> +                    - const: 0
>> +                  - items:
>> +                    - const: 2
>> +                    - const: 3
>> +                    - const: 0
>> +                    - const: 1
>> +                  - items:
>> +                    - const: 3
>> +                    - const: 0
>> +                    - const: 1
>> +                    - const: 2
>> +                  - items:
>> +                    - const: 0
>> +                    - const: 3
>> +                    - const: 2
>> +                    - const: 1
>> +                  - items:
>> +                    - const: 1
>> +                    - const: 0
>> +                    - const: 3
>> +                    - const: 2
>> +                  - items:
>> +                    - const: 2
>> +                    - const: 1
>> +                    - const: 0
>> +                    - const: 3
>> +                  - items:
>> +                    - const: 3
>> +                    - const: 2
>> +                    - const: 1
>> +                    - const: 0
>> +      port@1:
>> +        type: object
>> +        description: |
>> +          Output endpoints of the controller.
>> +        properties:
>> +          reg:
>> +            const: 1
>> +
>> +          endpoint:
>> +            type: object
>> +            properties:
>> +              remote-endpoint: true
>> +              data-lanes:
>> +                oneOf:
>> +                  - items:
>> +                    - const: 0
>> +                    - const: 1
>> +                    - const: 2
>> +                    - const: 3
>> +                  - items:
>> +                    - const: 1
>> +                    - const: 2
>> +                    - const: 3
>> +                    - const: 0
>> +                  - items:
>> +                    - const: 2
>> +                    - const: 3
>> +                    - const: 0
>> +                    - const: 1
>> +                  - items:
>> +                    - const: 3
>> +                    - const: 0
>> +                    - const: 1
>> +                    - const: 2
>> +                  - items:
>> +                    - const: 0
>> +                    - const: 3
>> +                    - const: 2
>> +                    - const: 1
>> +                  - items:
>> +                    - const: 1
>> +                    - const: 0
>> +                    - const: 3
>> +                    - const: 2
>> +                  - items:
>> +                    - const: 2
>> +                    - const: 1
>> +                    - const: 0
>> +                    - const: 3
>> +                  - items:
>> +                    - const: 3
>> +                    - const: 2
>> +                    - const: 1
>> +                    - const: 0
>> +
>> +unevaluatedProperties: false
>> +...
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> new file mode 100644
>> index 0000000..418b3efe
>> --- /dev/null
>> +++ 
>> b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -0,0 +1,119 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: 
>> http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DSI controller dt properties.
> 
> Drop full stop?
> 
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +description: |
>> +  Device tree bindings for DSI controller.
>> +
>> +allOf:
>> +  - $ref: dsi-common-controller.yaml#
> 
> That's neat, but now makes this harder to read?
> 
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,mdss-dsi-ctrl
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    const: dsi_ctrl
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 6
> 
> items:
>  - description:
>  - description:
>  - description:
>  - description:
> 
>> +
>> +  clock-names:
>> +    items:
>> +         - const: byte
>> +         - const: byte_intf
>> +         - const: pixel
>> +         - const: core
>> +         - const: iface
>> +         - const: bus
> 
> Indent seems wrong.
> 
>> +
>> +  phys:
>> +    maxItems: 1
>> +
>> +  phy-names:
>> +    const: dsi
>> +
>> +  ports: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - phys
>> +  - phy-names
>> +  - ports
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>> +
>> +     mdss: mdss {
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
>> +       interrupt-controller;
>> +       #interrupt-cells = <1>;
>> +
>> +       dsi0: dsi@ae94000 {
>> +           compatible = "qcom,mdss-dsi-ctrl";
>> +           reg = <0 0x0ae94000 0 0x400>;
>> +           reg-names = "dsi_ctrl";
>> +
>> +           interrupt-parent = <&mdss>;
>> +           interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
>> +                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
>> +                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
>> +                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
>> +                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                    <&dispcc DISP_CC_MDSS_AXI_CLK>;
>> +           clock-names = "byte",
>> +                         "byte_intf",
>> +                         "pixel",
>> +                         "core",
>> +                         "iface",
>> +                         "bus";
>> +
>> +           phys = <&dsi0_phy>;
>> +           phy-names = "dsi";
>> +
>> +           ports {
>> +                  #address-cells = <1>;
>> +                  #size-cells = <0>;
>> +
>> +                  port@0 {
>> +                          reg = <0>;
>> +                          dsi0_in: endpoint {
>> +                                   remote-endpoint = 
>> <&dpu_intf1_out>;
>> +                          };
>> +                  };
>> +
>> +                  port@1 {
>> +                          reg = <1>;
>> +                          dsi0_out: endpoint {
>> +                          };
>> +                  };
>> +           };
>> +       };
>> +     };
>> +...
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>> new file mode 100644
>> index 0000000..40d2c6b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>> @@ -0,0 +1,64 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DSI 10nm PHY dt properties.
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +description: |
>> +  Common Device tree bindings for DSI 10nm PHY.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,dsi-phy-10nm
>> +      - const: qcom,dsi-phy-10nm-8998
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dsi_phy
>> +      - const: dsi_phy_lane
>> +      - const: dsi_pll
>> +
>> +  clock-cells:
>> +    description: |
>> +      The DSI PHY block acts as a clock provider, creating
>> +      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
>> +    const: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    description: |
>> +      The following clocks are required.
>> +    items:
>> +      - const: iface
>> +      - const: ref
>> +
>> +  vdds-supply:
>> +    description: |
>> +      Phandle to vdds regulator device node.
>> +
>> +  qcom,dsi-phy-regulator-ldo-mode:
>> +    type: boolean
>> +    description: |
>> +      Boolean value indicating if the LDO mode PHY regulator is 
>> wanted (optional).
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - vdds-supply
>> +
>> +additionalProperties: true
>> +...
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> new file mode 100644
>> index 0000000..8407255
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> @@ -0,0 +1,64 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DSI 14nm PHY dt properties.
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +description: |
>> +  Common Device tree bindings for DSI 14nm PHY.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,dsi-phy-14nm
>> +      - const: qcom,dsi-phy-14nm-660
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dsi_phy
>> +      - const: dsi_phy_lane
>> +      - const: dsi_pll
>> +
>> +  clock-cells:
>> +    description: |
>> +      The DSI PHY block acts as a clock provider, creating
>> +      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
>> +    const: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    description: |
>> +      The following clocks are required.
>> +    items:
>> +      - const: iface
>> +      - const: ref
>> +
>> +  qcom,dsi-phy-regulator-ldo-mode:
> 
> Please remove this property.
> 
>> +    type: boolean
>> +    description: |
>> +      Boolean value indicating if the LDO mode PHY regulator is 
>> wanted (optional).
>> +
>> +  vcca-supply:
>> +    description: |
>> +      Phandle to vcca regulator device node.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - vcca-supply
>> +
>> +additionalProperties: true
>> +...
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>> new file mode 100644
>> index 0000000..ad7c1c9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-20nm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DSI 20nm PHY dt properties.
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +description: |
>> +  Common Device tree bindings for DSI 20nm PHY.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,dsi-phy-20nm
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dsi_pll
>> +      - const: dsi_phy
>> +      - const: dsi_phy_regulator
>> +
>> +  clock-cells:
> 
> Should be '#clock-cells'
> 
>> +    description: |
>> +      The DSI PHY block acts as a clock provider, creating
>> +      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
>> +    const: 1
> 
> i.e.
> 
> '#clock-cells':
>   const: 1
> 
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    description: |
>> +      The following clocks are required.
> 
> Please remove description.
> 
>> +    items:
>> +      - const: iface
>> +      - const: ref
>> +
>> +  qcom,dsi-phy-regulator-ldo-mode:
>> +    type: boolean
>> +    description: |
>> +      Boolean value indicating if the LDO mode PHY regulator is 
>> wanted (optional).
> 
> Please remove this property.
> 
>> +
>> +  vcca-supply:
>> +    description: |
>> +      Phandle to vcca regulator device node.
>> +
>> +  vddio-supply:
>> +    description: |
>> +      Phandle to vdd-io regulator device node.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - vddio-supply
>> +  - vcca-supply
>> +
>> +additionalProperties: true
>> +...
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>> new file mode 100644
>> index 0000000..d48359b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>> @@ -0,0 +1,64 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-28nm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DSI 28nm PHY dt properties.
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +description: |
>> +  Common Device tree bindings for DSI 28nm PHY.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,dsi-phy-28nm-hpm
>> +      - const: qcom,dsi-phy-28nm-lp
>> +      - const: qcom,dsi-phy-28nm-8960
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dsi_pll
>> +      - const: dsi_phy
>> +      - const: dsi_phy_regulator
>> +
>> +  clock-cells:
>> +    description: |
>> +      The DSI PHY block acts as a clock provider, creating
>> +      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
>> +    const: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    description: |
>> +      The following clocks are required.
>> +    items:
>> +      - const: iface
>> +      - const: ref
>> +
>> +  qcom,dsi-phy-regulator-ldo-mode:
>> +    type: boolean
>> +    description: |
>> +      Boolean value indicating if the LDO mode PHY regulator is 
>> wanted (optional).
> 
> Please remove this property.
> 
>> +
>> +  vddio-supply:
>> +    description: |
>> +      Phandle to vdd-io regulator device node.
> 
> Don't think we need | here, i.e just
> 
> vddio-supply:
>   description: vddIO supply for dsi controller.
> 
> Honestly it would be GREAT if this told us which PX_<N> pin on the SoC
> this is connected to so we don't have to dig through docs to figure out
> how the hardware block is connected to the power pins on the SoC. My
> understanding is the PX pins fan out to various hardware blocks inside
> the SoC, so 'vddio-supply' makes sense from the internal hardware block
> but at the edge of the SoC it is basically meaningless.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - vddio-supply
>> +
>> +additionalProperties: true
>> +...
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-phy.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
>> new file mode 100644
>> index 0000000..d729d89
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
>> @@ -0,0 +1,81 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dsi-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DSI PHY dt properties.
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +description: |
>> +  Device tree bindings for DSI PHY.
>> +
>> +allOf:
>> +  - $ref: dsi-phy-10nm.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,dsi-phy-10nm
> 
> This should be merged with dsi-phy-10nm? Nothing else references the
> dsi-phy-10nm.yaml binding so I'm confused why this is split from it.
> 
>> +
>> +  reg:
>> +    maxItems: 3
>> +
>> +  reg-names:
>> +    maxItems: 3
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: ref
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> 
> This include is not used.
> 
>> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> 
> This include is not used.
> 
>> +     #include <dt-bindings/clock/qcom,rpmh.h>
>> +
>> +     mdss: mdss {
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
> 
> Do we need this wrapper node? I guess it helps to know where to put 
> this
> node but it's not enforced in the binding at all.
> 
>> +
>> +       dsi0_phy: dsi-phy@ae94400 {
> 
> Why not just 'phy@ae94400'?
> 
>> +               compatible = "qcom,dsi-phy-10nm";
>> +               reg = <0 0x0ae94400 0 0x200>,
>> +                     <0 0x0ae94600 0 0x280>,
>> +                     <0 0x0ae94a00 0 0x1e0>;
>> +               reg-names = "dsi_phy",
>> +                           "dsi_phy_lane",
>> +                           "dsi_pll";
>> +
>> +               #clock-cells = <1>;
>> +               #phy-cells = <0>;
>> +
>> +               vdds-supply = <&vdda_mipi_dsi0_pll>;
>> +               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                        <&rpmhcc RPMH_CXO_CLK>;
>> +               clock-names = "iface", "ref";
>> +
>> +       };
>> +     };
>> +...

Regards,
Krishna
