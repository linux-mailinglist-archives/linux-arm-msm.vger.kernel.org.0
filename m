Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3260A18468E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 13:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgCMMMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 08:12:00 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:43092 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726216AbgCMMMA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 08:12:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584101519; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Nb3SVCVO/QfeWP+jXoR7bSiSu0BJFe+yjrGG5KroHxk=; b=BcP7OsBMwiFLl9EuTJpUZ7rQ4iC59ZzWD+PzOcbdydncPjkTIbNuK3Yrvvnu+A7c7eompgLi
 A4JIOupequynMifz3iwygeHudI9cJkSPfml78SKuGT2P3QfQT01n1yp7aTpXYglo4PAryYVJ
 LVxPwLiifOrEoQJTH8k2oPnjZEA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b788e.7f158ca1d810-smtp-out-n02;
 Fri, 13 Mar 2020 12:11:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 39EE7C43636; Fri, 13 Mar 2020 12:11:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.160] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F05AC433BA;
        Fri, 13 Mar 2020 12:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1F05AC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3
 bindings
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
References: <1581316605-29202-1-git-send-email-sanm@codeaurora.org>
 <1581316605-29202-2-git-send-email-sanm@codeaurora.org>
 <158137029351.121156.8319119424832255457@swboyd.mtv.corp.google.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <fd63b608-7b73-b251-b603-642f7f89ac64@codeaurora.org>
Date:   Fri, 13 Mar 2020 17:41:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <158137029351.121156.8319119424832255457@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 2/11/2020 3:01 AM, Stephen Boyd wrote:
> Quoting Sandeep Maheswaram (2020-02-09 22:36:44)
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> new file mode 100644
>> index 0000000..0353401
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> @@ -0,0 +1,155 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SuperSpeed DWC3 USB SoC controller
>> +
>> +maintainers:
>> +  - Manu Gautam <mgautam@codeaurora.org>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - qcom,msm8996-dwc3
>> +          - qcom,msm8998-dwc3
>> +          - qcom,sdm845-dwc3
>> +      - const: qcom,dwc3
>> +
>> +  reg:
>> +    description: Offset and length of register set for QSCRATCH wrapper
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    enum: [ 1, 2 ]
>> +
>> +  "#size-cells":
>> +    enum: [ 1, 2 ]
>> +
>> +  power-domains:
>> +    description: specifies a phandle to PM domain provider node
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description:
>> +      A list of phandle and clock-specifier pairs for the clocks
>> +      listed in clock-names.
>> +    items:
>> +      - description: System Config NOC clock.
>> +      - description: Master/Core clock, has to be >= 125 MHz
>> +          for SS operation and >= 60MHz for HS operation.
>> +      - description: System bus AXI clock.
>> +      - description: Mock utmi clock needed for ITP/SOF generation
>> +          in host mode.Its frequency should be 19.2MHz.
> Please add a space between the end of sentence and next one.
will do in next version
>
>> +      - description: Sleep clock, used for wakeup when
>> +          USB3 core goes into low power mode (U3).
>> +
>> +  clock-names:
>> +    items:
>> +      - const: cfg_noc
>> +      - const: core
>> +      - const: iface
>> +      - const: mock_utmi
>> +      - const: sleep
>> +
>> +  assigned-clocks:
>> +    items:
>> +      - description: Phandle to MOCK_UTMI_CLK.
>> +      - description: Phandle to MASTER_CLK.
> It's a phandle and clock specifier pair, not always just a phandle.
> Maybe the base schema can enforce that somehow, but the description
> isn't accurate.
will do in next version
>
>> +
>> +  assigned-clock-rates:
>> +    items:
>> +      - description: Must be 19.2MHz (19200000).
>> +      - description: Must be >= 60 MHz in HS mode, >= 125 MHz in SS mode.
> Can this be more strict? I see in [1] that it was suggested to update
> the schema checker. Did you try that?

Tried that but need to add maximum value also and even after that 
getting some errors as below.

/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: 
usb@a6f8800: assigned-clock-rates: Additional items are not allowed 
([150000000] was unexpected)

/local/mnt/workspace/sandeep/bu_build/src/third_party/kernel/linux-next/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: 
usb@a6f8800: assigned-clock-rates:0: [19200000] is too short
>
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: The interrupt that is asserted
>> +          when a wakeup event is received on USB2 bus.
>> +      - description: The interrupt that is asserted
>> +          when a wakeup event is received on USB3 bus.
>> +      - description: Wakeup event on DM line.
>> +      - description: Wakeup event on DP line.
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: hs_phy_irq
>> +      - const: ss_phy_irq
>> +      - const: dm_hs_phy_irq
>> +      - const: dp_hs_phy_irq
>> +
>> +  qcom,select-utmi-as-pipe-clk:
>> +    description:
>> +      If present, disable USB3 pipe_clk requirement.
>> +      Used when dwc3 operates without SSPHY and only
>> +      HS/FS/LS modes are supported.
>> +    type: boolean
>> +
>> +# Required child node:
>> +
>> +patternProperties:
>> +  "^dwc3@[0-9a-f]+$":
>> +    type: object
>> +    description:
>> +      A child node must exist to represent the core DWC3 IP block
>> +      The content of the node is defined in dwc3.txt.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - power-domains
>> +  - clocks
>> +  - clock-names
> Why aren't interrupts required? They're always present, aren't they?
In qcom,dwc3.txt file interrupts are mentioned in Optional properties 
and I also didnt find any interrupts in 8996.dtsi
>
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> It would be good to include <dt-bindings/interrupt-controller/irq.h>
> here too, just in case someone wants to move that include out of
> arm-gic.h, which is possible.
>
>> +    usb_1: usb@a6f8800 {
> Can we drop the phandle? It's not used.
will do in next version
>
>> +        compatible = "qcom,sdm845-dwc3", "qcom,dwc3";
>> +        reg = <0 0x0a6f8800 0 0x400>;
>> +
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
>> +                 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
>> +                 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
>> +                 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>> +                 <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
>> +        clock-names = "cfg_noc", "core", "iface", "mock_utmi",
>> +                        "sleep";
> Spacing looks off. Are there tabs?
will correct in next version
>
>> +
>> +        assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>> +                          <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>> +        assigned-clock-rates = <19200000>, <150000000>;
>> +
>> +        interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "hs_phy_irq", "ss_phy_irq",
>> +                              "dm_hs_phy_irq", "dp_hs_phy_irq";
> Same spacing nit
will correct in next version
>
>> +
>> +            power-domains = <&gcc USB30_PRIM_GDSC>;
>> +
>> +            resets = <&gcc GCC_USB30_PRIM_BCR>;
>> +
>> +            usb_1_dwc3: dwc3@a600000 {
> Drop this phandle too? It isn't used.
will correct in next version
>
>> +                compatible = "snps,dwc3";
>> +                reg = <0 0x0a600000 0 0xcd00>;
>> +                interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>> +                iommus = <&apps_smmu 0x740 0>;
>> +                snps,dis_u2_susphy_quirk;
>> +                snps,dis_enblslpm_quirk;
>> +                phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>> +                phy-names = "usb2-phy", "usb3-phy";
>> +            };
> [1] https://lkml.kernel.org/r/20191218221310.GA4624@bogus

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
