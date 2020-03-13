Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F140C18454A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 11:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgCMKvh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 06:51:37 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:33711 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726387AbgCMKvg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 06:51:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584096696; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To:
 Subject: From: Sender; bh=kBNQDM77aAPD7s08izeo3UtypHJmtrzkhedefworo6c=;
 b=WX2QUpKQVNEkRS8fljGVsqSXuJltB0JnNE+vqR9yKM7udVNxS/2+pbI+INu5qvwWoKn/c8KK
 31ldB5odegh1pm9OZd088Bj6EO9Jmi7thiMyAfygm2S1IgeGSImIdFOCUabbVd/eFk+ymlDI
 G0BkwXQpGDOynVmo18MZ3lb2R7M=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b65b2.7f246bda0fb8-smtp-out-n02;
 Fri, 13 Mar 2020 10:51:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E9C05C432C2; Fri, 13 Mar 2020 10:51:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.252.222.65] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C2900C433D2;
        Fri, 13 Mar 2020 10:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C2900C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: spi: Convert QSPI bindings to YAML
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org
References: <1581932974-21654-1-git-send-email-akashast@codeaurora.org>
 <1581932974-21654-2-git-send-email-akashast@codeaurora.org>
 <158216578112.184098.9357700822184458798@swboyd.mtv.corp.google.com>
Message-ID: <66c79dcb-4102-e138-cf4f-303f17367175@codeaurora.org>
Date:   Fri, 13 Mar 2020 16:21:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158216578112.184098.9357700822184458798@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 2/20/2020 7:59 AM, Stephen Boyd wrote:
> Quoting Akash Asthana (2020-02-17 01:49:33)
>> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> new file mode 100644
>> index 0000000..977070a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> @@ -0,0 +1,89 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +
>> +%YAML 1.2
>> +---
>> +$id:"http://devicetree.org/schemas/spi/qcom,spi-qcom-qspi.yaml#"
>> +$schema:"http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm Quad Serial Peripheral Interface (QSPI)
>> +
>> +maintainers:
>> + - Mukesh Savaliya<msavaliy@codeaurora.org>
>> + - Akash Asthana<akashast@codeaurora.org>
>> +
>> +description: |
> Drop the | because it doesn't look like any formatting needs to be
> maintained in the text for the description.
ok
>> + The QSPI controller allows SPI protocol communication in single, dual, or quad
>> + wire transmission modes for read/write access to slaves such as NOR flash.
>> +
>> +allOf:
>> +  - $ref: /spi/spi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,sdm845-qspi
>> +      - const: qcom,qspi-v1
>> +
>> +  reg:
>> +    description: Base register location and length.
> Drop description? It doesn't seem useful.
ok
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: core
>> +
>> +  clocks:
>> +    items:
>> +      - description: AHB clock
>> +      - description: QSPI core clock.
> Please drop the full-stop on core clock.
ok
>> +
>> +  "#address-cells":
>> +     const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
> Aren't these two unnecessary because they're covered by the
> spi-controller.yaml binding?
ok
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clock-names
>> +  - clocks
>> +  - "#address-cells"
>> +  - "#size-cells"
> These last two are also covered by spi-controller binding.
ok will remove
>> +
>> +
> Why two newlines instead of one?
>
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    soc: soc@0 {
> Remove this node from example please.

If I remove this node I am getting below compilation error.

Error: 
Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.example.dts:46.1-2 
syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:311: recipe for target 
'Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.example.dt.yaml' 
failed
make[1]: *** 
[Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.example.dt.yaml] 
Error 1
Makefile:1264: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

>
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        qspi: spi@88df000 {
>> +            compatible = "qcom,sdm845-qspi", "qcom,qspi-v1";
>> +            reg = <0 0x88df000 0 0x600>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
>> +            clock-names = "iface", "core";
>> +            clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>> +                <&gcc GCC_QSPI_CORE_CLK>;
> Weird tabbing here. Just use spaces and align it up.
Ok, I will align it better.
>
>> +
>> +                flash@0 {
>> +                    compatible = "jedec,spi-nor";
>> +                    reg = <0>;
>> +                    spi-max-frequency = <25000000>;
>> +                    spi-tx-bus-width = <2>;
>> +                    spi-rx-bus-width = <2>;
>> +                };
> Is this flash node necessary for the example?

It's not neccessary.

I just preserved the original example from .txt binding file.

>
>> +        };
>> +    };
>> +
> Nitpick: Why newline here?

Will remove it.

Thankyou for reviewing the patch.


Regards,

Akash

>
>> +...

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
