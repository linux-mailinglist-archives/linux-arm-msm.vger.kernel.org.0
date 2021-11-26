Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C759E45E6FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 05:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241449AbhKZE7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 23:59:25 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:51328 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229798AbhKZE5Z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 23:57:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637902452; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=i1cn9N7jCKCUnk586WJ+l06/e3VDw48f/KLbV2Eakpo=;
 b=M1+KVX3mLeO8bdeqqe2do6OQFgXqp+X6h/6Y7aAHmOuyzihoANVbk+i8a5ETBoec9BocMzeB
 U0dE+5cnBWKFAhcOhLwIXzthBNukv0AtygBd01qG+oTMBuk29csjl4L2TIX2LKsJdXh1vXG+
 BwrWkAaVO+4MolroX2dkmXO95Cw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 61a068743553c354be439928 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 04:54:12
 GMT
Sender: jeyr=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ADB4FC43617; Fri, 26 Nov 2021 04:54:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jeyr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A0273C4338F;
        Fri, 26 Nov 2021 04:54:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Nov 2021 10:24:10 +0530
From:   jeyr@codeaurora.org
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH 1/5] dt-bindings: misc: convert fastrpc bindings to yaml
 and add property
In-Reply-To: <be50fe57-e109-370d-621b-66bff479b46e@linaro.org>
References: <1637849744-24844-1-git-send-email-jeyr@codeaurora.org>
 <1637849744-24844-2-git-send-email-jeyr@codeaurora.org>
 <be50fe57-e109-370d-621b-66bff479b46e@linaro.org>
Message-ID: <9fc77d606794bbad7666942691b1c7ee@codeaurora.org>
X-Sender: jeyr@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-11-25 20:11, Srinivas Kandagatla wrote:
> Hi Jeya,
> 
> You should retain the original patch ownership while sending the 
> patches.
Sure Srini, will add new property as dependent to yaml conversion patch.
> 
> On 25/11/2021 14:15, Jeya R wrote:
>> Convert Qualcomm FastRPC bindings to yaml format and add a property
>> to set dsp domain as non-secure.
>> 
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Jeya R <jeyr@codeaurora.org>
>> ---
>>   .../devicetree/bindings/misc/qcom,fastrpc.txt      | 78 
>> -----------------
>>   .../devicetree/bindings/misc/qcom,fastrpc.yaml     | 97 
>> ++++++++++++++++++++++
>>   2 files changed, 97 insertions(+), 78 deletions(-)
>>   delete mode 100644 
>> Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
>>   create mode 100644 
>> Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt 
>> b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
>> deleted file mode 100644
>> index 2a1827a..0000000
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
>> +++ /dev/null
>> @@ -1,78 +0,0 @@
>> -Qualcomm Technologies, Inc. FastRPC Driver
>> -
>> -The FastRPC implements an IPC (Inter-Processor Communication)
>> -mechanism that allows for clients to transparently make remote method
>> -invocations across DSP and APPS boundaries. This enables developers
>> -to offload tasks to the DSP and free up the application processor for
>> -other tasks.
>> -
>> -- compatible:
>> -	Usage: required
>> -	Value type: <stringlist>
>> -	Definition: must be "qcom,fastrpc"
>> -
>> -- label
>> -	Usage: required
>> -	Value type: <string>
>> -	Definition: should specify the dsp domain name this fastrpc
>> -	corresponds to. must be one of this: "adsp", "mdsp", "sdsp", "cdsp"
>> -
>> -- #address-cells
>> -	Usage: required
>> -	Value type: <u32>
>> -	Definition: Must be 1
>> -
>> -- #size-cells
>> -	Usage: required
>> -	Value type: <u32>
>> -	Definition: Must be 0
>> -
>> -= COMPUTE BANKS
>> -Each subnode of the Fastrpc represents compute context banks 
>> available
>> -on the dsp.
>> -- All Compute context banks MUST contain the following properties:
>> -
>> -- compatible:
>> -	Usage: required
>> -	Value type: <stringlist>
>> -	Definition: must be "qcom,fastrpc-compute-cb"
>> -
>> -- reg
>> -	Usage: required
>> -	Value type: <u32>
>> -	Definition: Context Bank ID.
>> -
>> -- qcom,nsessions:
>> -	Usage: Optional
>> -	Value type: <u32>
>> -	Defination: A value indicating how many sessions can share this
>> -		    context bank. Defaults to 1 when this property
>> -		    is not specified.
>> -
>> -Example:
>> -
>> -adsp-pil {
>> -	compatible = "qcom,msm8996-adsp-pil";
>> -	...
>> -	smd-edge {
>> -		label = "lpass";
>> -		fastrpc {
>> -			compatible = "qcom,fastrpc";
>> -			qcom,smd-channels = "fastrpcsmd-apps-dsp";
>> -			label = "adsp";
>> -			#address-cells = <1>;
>> -			#size-cells = <0>;
>> -
>> -			cb@1 {
>> -				compatible = "qcom,fastrpc-compute-cb";
>> -				reg = <1>;
>> -			};
>> -
>> -			cb@2 {
>> -				compatible = "qcom,fastrpc-compute-cb";
>> -				reg = <2>;
>> -			};
>> -			...
>> -		};
>> -	};
>> -};
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml 
>> b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> new file mode 100644
>> index 0000000..c3fe39b2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -0,0 +1,97 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm Technologies, Inc. FastRPC Driver
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description: |
>> +  This binding describes Qualcomm FastRPC an IPC (Inter-Processor 
>> Communication)
>> +  mechanism that allows for clients to transparently make remote 
>> method
>> +  invocations across DSP and APPS boundaries. This enables developers
>> +  to offload tasks to the DSP and free up the application processor 
>> for
>> +  other tasks.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,fastrpc
>> +
>> +  label:
>> +    enum:
>> +      - adsp
>> +      - mdsp
>> +      - sdsp
>> +      - cdsp
>> +
>> +  qcom,non-secure-domain: true
>> +    # Specify that dsp domain is non-secure.
>> +
> 
> This change was not there in the original patch that I shared, you
> should add this change in a separate patch, as first patch converts to
> yaml and next one adds new bindings.
> 
> This is also not following yaml style bindings.
> Please take some time to look at
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/example-schema.yaml?h=v5.16-rc2
> to add new binding.
> 
> 
> 
> --srini
This will be corrected as a new patch. Thanks.

> 
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^cb@[0-9a-f]$":
>> +    type: object
>> +    description: |
>> +      Compute context bank
>> +
>> +    properties:
>> +      compatible:
>> +        const: qcom,fastrpc-compute-cb
>> +
>> +      reg:
>> +        maxItems: 1
>> +        description: Context Bank ID
>> +
>> +      qcom,nsessions:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: How many sessions can share this context bank.
>> +                     Defaults to 1 when this property is not 
>> specified.
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - label
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    adsp-pil {
>> +        compatible = "qqcom,msm8996-adsp-pil";
>> +
>> +        smd-edge {
>> +            label = "lpass";
>> +
>> +            fastrpc {
>> +                compatible = "qcom,fastrpc";
>> +                label = "adsp";
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                cb@1 {
>> +                    compatible = "qcom,fastrpc-compute-cb";
>> +                    reg = <1>;
>> +                };
>> +
>> +                cb@2 {
>> +                    compatible = "qcom,fastrpc-compute-cb";
>> +                    reg = <2>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +
>> 
