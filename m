Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A4D3EF8B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 05:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236890AbhHRDgh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 23:36:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:22599 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236664AbhHRDgg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 23:36:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629257762; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=CzbIvaYKY86IkfIxOWY80ja1JGxTniQ/qIfiX8pSmd8=;
 b=WCZaKTCuWE/HZIXUWDfZd7EgXzixBbC8QZgUmaCr5MsTrrZTOhWEIPhmfO9GvqjJl3+I1fHl
 eXasJvXoarbI6gApU9rlhWOMeeJHXbxC1nYwJ6E6i5Rlw4qmS+daEnRif6ioSTiGRg7KsgDs
 yrtTFI+Khcu61XchAngKKUmU0g4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 611c8022454b7a558f5d9249 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Aug 2021 03:36:02
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2A1B2C43616; Wed, 18 Aug 2021 03:36:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 41DB0C4338F;
        Wed, 18 Aug 2021 03:36:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 18 Aug 2021 09:06:01 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 2/3] dt-bindings: msm: Add QTI download mode support
 binding
In-Reply-To: <YRwqBx4hNsbsPYY0@robh.at.kernel.org>
References: <cover.1628757036.git.saiprakash.ranjan@codeaurora.org>
 <217c22d40e0a9db713e2a55623408eca88166897.1628757036.git.saiprakash.ranjan@codeaurora.org>
 <YRwqBx4hNsbsPYY0@robh.at.kernel.org>
Message-ID: <94dcff64f64555d5ef398640e3895a9c@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-18 02:58, Rob Herring wrote:
> On Thu, Aug 12, 2021 at 02:47:41PM +0530, Sai Prakash Ranjan wrote:
>> Add device tree binding for QTI download mode cookies
>> region found in IMEM.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  .../bindings/arm/msm/qcom,dload-mode.yaml     | 53 
>> +++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml 
>> b/Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml
>> new file mode 100644
>> index 000000000000..90b9b6a9b75e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml
>> @@ -0,0 +1,53 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/msm/qcom,dload-mode.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Download Mode binding
>> +
>> +maintainers:
>> +  - Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> +
>> +description:
>> +  Qualcomm download mode cookies memory region in IMEM is used by SDI
>> +  (System Debug Image) firmware to determine whether to enter 
>> download
>> +  mode or not to collect ramdump for post mortem debug.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,dload-mode
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  qcom,sdi-disable-regs:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      Phandle reference to a syscon representing TCSR followed by the
>> +      offset and length for SDI disable register.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    imem@146aa000 {
>> +      compatible = "simple-mfd";
> 
> If this is just internal RAM, then we already have a binding for it and
> 'simple-mfd' is not it.
> 

Hmm, I followed qcom,pil-info.yaml as a reference but maybe that's old.

>> +      reg = <0x146aa000 0x2000>;
>> +
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +
>> +      ranges = <0 0x146aa000 0x2000>;
>> +
>> +      dload-mode@1c00 {
>> +        compatible = "qcom,dload-mode";
>> +        reg = <0x1c00 0x1000>;
> 
> 0x1c00 + 0x1000 > 0x2000
> 

Sorry my mistake. I am dropping this series as we will move
to using PSCI_SYSTEM_RESET2 as detailed in cover letter.

Thanks,
Sai

> 
>> +        qcom,sdi-disable-regs = <&tcsr_regs 0x3a000 0x4>;
>> +      };
>> +    };
>> +...
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
>> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
