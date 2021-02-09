Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFB2314DA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 11:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhBIK5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 05:57:13 -0500
Received: from so15.mailgun.net ([198.61.254.15]:62816 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231977AbhBIKyw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 05:54:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612868062; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=QpNLMNxUY7iHy2iruJ0dokNbOkw08TgntoJvHFSIC9s=;
 b=oEPymhrUH5Mk3eAt1ZDLN4TEgbkhFP4S/oXxXNq7wEGNV152mmsQzmIlnc371Mw3fcAwIyv1
 WpCvOoidcuDO3t78gSkP0/093mnbNqEW11ECg9gxDY5Mdi5O4NxW7jKIzcxSR6U09hMirAbz
 DpN4WyF+dvjcXAxHTguVXyj8DkY=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 602269b781f6c45dce2d163c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 10:53:43
 GMT
Sender: mkrishn=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0662DC43464; Tue,  9 Feb 2021 10:53:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mkrishn)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 87DE1C433ED;
        Tue,  9 Feb 2021 10:53:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Feb 2021 16:23:41 +0530
From:   mkrishn@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        vinod.koul@linaro.org, rnayak@codeaurora.org,
        dianders@chromium.org, sibis@codeaurora.org
Subject: Re: [PATCH v10 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 bindings
In-Reply-To: <161256448377.76967.104870400778698831@swboyd.mtv.corp.google.com>
References: <1612420939-15502-1-git-send-email-mkrishn@codeaurora.org>
 <1612420939-15502-2-git-send-email-mkrishn@codeaurora.org>
 <161256448377.76967.104870400778698831@swboyd.mtv.corp.google.com>
Message-ID: <2411ac0b2de4b4324b41f08761af1dff@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-06 04:04, Stephen Boyd wrote:
> Quoting Krishna Manikandan (2021-02-03 22:42:17)
>> Add YAML schema for the device tree bindings for DSI
>> controller.
>> 
>> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>> 
>> Changes in v1:
>>     - Separate dsi controller bindings to a separate patch (Stephen 
>> Boyd)
>>     - Merge dsi-common-controller.yaml and dsi-controller-main.yaml to
>>       a single file (Stephen Boyd)
>>     - Drop supply entries and definitions from properties (Stephen 
>> Boyd)
>>     - Modify phy-names property for dsi controller (Stephen Boyd)
>>     - Remove boolean from description (Stephen Boyd)
>>     - Drop pinctrl properties as they are standard entries (Stephen 
>> Boyd)
>>     - Modify the description for ports property and keep the reference
>>       to the generic binding where this is defined (Stephen Boyd)
>>     - Add description to clock names (Stephen Boyd)
>>     - Correct the indendation (Stephen Boyd)
>>     - Drop the label for display dt nodes and correct the node
>>       name (Stephen Boyd)
>> ---
>>  .../bindings/display/msm/dsi-controller-main.yaml  | 233 
>> +++++++++++++++++++
>>  .../devicetree/bindings/display/msm/dsi.txt        | 249 
>> ---------------------
>>  2 files changed, 233 insertions(+), 249 deletions(-)
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>  delete mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi.txt
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> new file mode 100644
>> index 0000000..9177d01
>> --- /dev/null
>> +++ 
>> b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -0,0 +1,233 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: 
>> http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DSI controller dt properties
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
> Drop maxItems? Or are some clks optional sometimes?
> 
>> +    items:
>> +      - description: Display byte clock
>> +      - description: Display byte interface clock
>> +      - description: Display pixel clock
>> +      - description: Display escape clock
>> +      - description: Display AHB clock
>> +      - description: Display AXI clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: byte
>> +      - const: byte_intf
>> +      - const: pixel
>> +      - const: core
>> +      - const: iface
>> +      - const: bus
>> +
>> +  phys:
>> +    minItems: 1
>> +
>> +  phy-names:
>> +    const: dsi
>> +
>> +  syscon-sfpb:
>> +    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
>> +    $ref: "/schemas/types.yaml#/definitions/phandle"
>> +
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
> 
> Why is this in DT vs. being tweaked from userspace? This was there
> before but it isn't used anywhere in an upstream DTS file so please 
> drop
> it.
> 
>> +
>> +  qcom,dual-dsi-mode:
>> +    type: boolean
>> +    description: |
>> +      Indicates if the DSI controller is driving a panel which needs
>> +      2 DSI links.
> 
> Shouldn't this be apparent from the OF graph indicating two DSI
> endpoints?
Yes Stephen, you are correct. But these properties ( qcom,dual-dsi-mode 
and qcom,master-dsi) are defined in sdm845 dtsi file
and the current code is parsing these properties during dsi probe. That 
is why I defined these properties here.
> 
>> +
>> +  qcom,master-dsi:
>> +    type: boolean
>> +    description: |
>> +      Indicates if the DSI controller is driving the master link of
>> +      the 2-DSI panel.
> 
> When is this not the case? This property looks like some sort of
> workaround for driver probe ordering. It was there before though so I
> guess this is fine.
> 
>> +
>> +  qcom,sync-dual-dsi:
>> +    type: boolean
>> +    description: |
>> +      Indicates if the DSI controller is driving a 2-DSI panel whose
>> +      2 links need receive command simultaneously.
> 
> Feels like it should be a property of the panel node?
We are not using this property in any of the targets. I will remove this 
property.
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
>> +                items:
>> +                  - const: 0
>> +                  - const: 1
>> +                  - const: 2
>> +                  - const: 3
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
>> +                items:
>> +                  - const: 0
>> +                  - const: 1
>> +                  - const: 2
>> +                  - const: 3
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
>> +     soc {
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
> 
> The soc node can be left out.
Should I follow the same approach that you suggested in DP yaml patch 
here also ?
ie. soc {
         #address-cells = <2>;
         #size-cells = <2>;

         dsi@ae9400000{
           ...
         }
     }
Link : 
https://patchwork.kernel.org/project/linux-arm-msm/patch/1612420939-15502-4-git-send-email-mkrishn@codeaurora.org/
Comment:
            Please look at section "2.2.2 Generic Names Recommendation" 
of the DT
            spec[1] to find a proper name. I don't see 'subsystem' there 
but that
            may be because it shouldn't really exist as a node. Instead 
we should
            have the child nodes sit directly under the SoC node.
> 
>> +
>> +       mdss@ae00000 {
> 
> subsystem?
> 
>> +         #address-cells = <2>;
>> +         #size-cells = <2>;
>> +         reg = <0 0xae00000 0 0x1000>;
>> +         interrupt-controller;
>> +         #interrupt-cells = <1>;
>> +
>> +         dsi@ae94000 {
>> +           compatible = "qcom,mdss-dsi-ctrl";
