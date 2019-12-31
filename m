Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8985512D6A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2019 07:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfLaGnS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Dec 2019 01:43:18 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:40565 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726004AbfLaGnS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Dec 2019 01:43:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577774597; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=F847wiYtiWu9zLjLzGjKkB/KIgILEIIryO4cx7acaiI=;
 b=eDoRKXgrJ4nuFLDddi2gfURIdd98fUOTxs+YkETGbM9q/23HwLqhBK9UT2Pv9Oh9TtDPE/PW
 hONEBvqGpcjGsSUYHWQ+X7OH+0pYC3urDVgKEug97mxo+82h/QWGff1fORF8Kes7WLRO53Hr
 BkSyGFcLy0lvmDWKfkIl6hExAjQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0aee04.7fbad48cfb58-smtp-out-n01;
 Tue, 31 Dec 2019 06:43:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2A24FC433A2; Tue, 31 Dec 2019 06:43:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sthella)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 74374C43383;
        Tue, 31 Dec 2019 06:43:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 31 Dec 2019 12:13:15 +0530
From:   sthella@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: add binding for QTI SPMI SDAM
In-Reply-To: <20191229030140.GJ3755841@builder>
References: <1577165532-28772-1-git-send-email-sthella@codeaurora.org>
 <20191229030140.GJ3755841@builder>
Message-ID: <412459f3ebb4297b2c21adbb1b9903c6@codeaurora.org>
X-Sender: sthella@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-29 08:31, Bjorn Andersson wrote:
> On Mon 23 Dec 21:32 PST 2019, Shyam Kumar Thella wrote:
> 
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
>> +        maxItems: 1
>> +        items:
>> +          items:
>> +            - minimum: 0
>> +              maximum: 7
>> +              description:
>> +                Offset in bit within the address range specified by 
>> reg.
>> +            - minimum: 1
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
> 
> So this register has moved out of the PON register set? What component
> in the system is going to reference this? Should it have a compatible,
> in the same way as "syscon-reboot-mode" does?
This is just an example for using data cells. It is not used in the 
system.
> 
> Regards,
> Bjorn
> 
>> +              reg = <0x50 0x1>;
>> +              bits = <7 2>;
>> +          };
>> +      };
>> +...
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
