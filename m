Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92FAA135782
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 11:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729803AbgAIK5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 05:57:22 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:24723 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729790AbgAIK5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 05:57:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578567440; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=CbwJBAUFC8wSrCBzIxpxww8kltVie1tKpz9AG/THai8=;
 b=SUO+e25iQNTmTVNoT/60H4OVn8kgw++5Dm0zO5x/wTjvz6QImsHGS22s3i1jR4Uk+cutF3VI
 ZqrMQZJLoBL4WwHjjnrvu4IK+kmomZHKEhQGsCj8MyqQtUPfY9yQKDnQTaWMuI6PncFuizHr
 ZjMsBlUpeE2/59r7FebNiYd80pk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e17070f.7fe00a350d50-smtp-out-n03;
 Thu, 09 Jan 2020 10:57:19 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6CD49C447AC; Thu,  9 Jan 2020 10:57:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sthella)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 155C3C447A6;
        Thu,  9 Jan 2020 10:57:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 09 Jan 2020 16:27:16 +0530
From:   sthella@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, srinivas.kandagatla@linaro.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: add binding for QTI SPMI SDAM
In-Reply-To: <20200108163943.GA26863@bogus>
References: <1577165532-28772-1-git-send-email-sthella@codeaurora.org>
 <20200108163943.GA26863@bogus>
Message-ID: <8aeb91730552357db340f8bfb21e6d15@codeaurora.org>
X-Sender: sthella@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-01-08 22:09, Rob Herring wrote:
> On Tue, Dec 24, 2019 at 11:02:12AM +0530, Shyam Kumar Thella wrote:
>> QTI SDAM allows PMIC peripherals to access the shared memory that is
>> available on QTI PMICs. Add documentation for it.
>> 
>> Signed-off-by: Shyam Kumar Thella <sthella@codeaurora.org>
>> ---
>>  .../devicetree/bindings/nvmem/qcom,spmi-sdam.yaml  | 79 
>> ++++++++++++++++++++++
>>  1 file changed, 79 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml 
>> b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
>> new file mode 100644
>> index 0000000..8961a99
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> Dual license new bindings:
> 
> (GPL-2.0-only OR BSD-2-Clause)
> 
> Please spread the word in QCom.
Sure. I will add Dual license in next patchset.
> 
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/nvmem/qcom,spmi-sdam.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. SPMI SDAM DT bindings
>> +
>> +maintainers:
>> +  - Shyam Kumar Thella <sthella@codeaurora.org>
>> +
>> +description: |
>> +  The SDAM provides scratch register space for the PMIC clients. This
>> +  memory can be used by software to store information or communicate
>> +  to/from the PBUS.
>> +
>> +allOf:
>> +  - $ref: "nvmem.yaml#"
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,spmi-sdam
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
> 
> ranges? The child addresses should be translateable I assume.
The addresses are not memory mapped on the CPU's address domain. They 
are the SPMI addresses which can be accessed over SPMI controller.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +patternProperties:
>> +  "^.*@[0-9a-f]+$":
>> +    type: object
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +        description:
>> +          Offset and size in bytes within the storage device.
>> +
>> +      bits:
> 
> Needs a type reference.
Yes. I will add a reference in the next patch set.
> 
>> +        maxItems: 1
>> +        items:
>> +          items:
>> +            - minimum: 0
>> +              maximum: 7
>> +              description:
>> +                Offset in bit within the address range specified by 
>> reg.
>> +            - minimum: 1
> 
> max is 7?
I don't think it is limited to 7 as it is the size within the address 
range specified by reg. If the address range is more than a byte size 
can be more.
> 
>> +              description:
>> +                Size in bit within the address range specified by 
>> reg.
>> +
>> +    required:
>> +      - reg
>> +
>> +    additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +      sdam_1: nvram@b000 {
>> +         #address-cells = <1>;
>> +         #size-cells = <1>;
>> +         compatible = "qcom,spmi-sdam";
>> +          reg = <0xb000 0x100>;
>> +
>> +          /* Data cells */
>> +          restart_reason: restart@50 {
>> +              reg = <0x50 0x1>;
>> +              bits = <7 2>;
> 
> How do you have bit 8 in a 1 byte register?
You are right. Thanks for it. I will correct the example in next patch 
set.
> 
>> +          };
>> +      };
>> +...
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
>> 
