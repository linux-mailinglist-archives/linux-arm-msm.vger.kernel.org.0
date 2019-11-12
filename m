Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39157F953E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 17:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbfKLQLX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 11:11:23 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:55170 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfKLQLX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 11:11:23 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9621360397; Tue, 12 Nov 2019 16:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573575082;
        bh=nyTZd9ZgtiRgW6L8xASzv3KCDLtQ6mKZjXfVo5ZJGp4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=avm3EkiWpj6ulG+3QakuJiWCdSXyfh5xvxSp4d72LQvJMFjA0PfuEvSvGM5n5C+rj
         QNTVLEGc5JAVvo0UVOt1hJhJJyN0caBot+6gyJZdA1RYnS7EBr8kwqqtG/oeEss17y
         RO1qCY1N7lMgV0Tlp8N0O+Z5a5JK9t+yj0Z2u+Q0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 92A9260397;
        Tue, 12 Nov 2019 16:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573575078;
        bh=nyTZd9ZgtiRgW6L8xASzv3KCDLtQ6mKZjXfVo5ZJGp4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=QjLDMtmKRvo/9+35VMxanwXOfkbZUuL8YU+BHVlnXntY+uJHZ+Uf2RBPkzt1h0SAg
         B8D25h8hEqbJCbgwJgtWvKafUC+b5MWm9xqvtWHCzbkWBSBODPHkHNc3TRRPbChAzK
         +Cigf2m/2Ig6sFH7kycXbQ9btZw75kZ1dFDfz2dw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 92A9260397
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v8 2/4] dt-bindings: clock: Convert qcom,mmcc to DT schema
To:     Rob Herring <robh@kernel.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1573254987-10241-1-git-send-email-jhugo@codeaurora.org>
 <1573255053-10351-1-git-send-email-jhugo@codeaurora.org>
 <20191112005802.GA9638@bogus>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <d2919fc4-2e96-f50b-a19e-ce6afe22a5cd@codeaurora.org>
Date:   Tue, 12 Nov 2019 09:11:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112005802.GA9638@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2019 5:58 PM, Rob Herring wrote:
> On Fri, Nov 08, 2019 at 04:17:33PM -0700, Jeffrey Hugo wrote:
>> Convert the qcom,mmcc-X clock controller binding to DT schema.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,mmcc.txt        | 28 ----------
>>   .../devicetree/bindings/clock/qcom,mmcc.yaml       | 59 ++++++++++++++++++++++
>>   2 files changed, 59 insertions(+), 28 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/clock/qcom,mmcc.txt
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
>> deleted file mode 100644
>> index 8b0f784..0000000
>> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -Qualcomm Multimedia Clock & Reset Controller Binding
>> -----------------------------------------------------
>> -
>> -Required properties :
>> -- compatible : shall contain only one of the following:
>> -
>> -			"qcom,mmcc-apq8064"
>> -			"qcom,mmcc-apq8084"
>> -			"qcom,mmcc-msm8660"
>> -			"qcom,mmcc-msm8960"
>> -			"qcom,mmcc-msm8974"
>> -			"qcom,mmcc-msm8996"
>> -
>> -- reg : shall contain base register location and length
>> -- #clock-cells : shall contain 1
>> -- #reset-cells : shall contain 1
>> -
>> -Optional properties :
>> -- #power-domain-cells : shall contain 1
>> -
>> -Example:
>> -	clock-controller@4000000 {
>> -		compatible = "qcom,mmcc-msm8960";
>> -		reg = <0x4000000 0x1000>;
>> -		#clock-cells = <1>;
>> -		#reset-cells = <1>;
>> -		#power-domain-cells = <1>;
>> -	};
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>> new file mode 100644
>> index 0000000..61ed4a2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bindings/clock/qcom,mmcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Multimedia Clock & Reset Controller Binding
>> +
>> +maintainers:
>> +  - Jeffrey Hugo <jhugo@codeaurora.org>
>> +
>> +description: |
>> +  Qualcomm multimedia clock control module which supports the clocks, resets and
>> +  power domains.
>> +
>> +properties:
>> +  compatible :
>> +    enum:
>> +       - qcom,mmcc-apq8064
>> +       - qcom,mmcc-apq8084
>> +       - qcom,mmcc-msm8660
>> +       - qcom,mmcc-msm8960
>> +       - qcom,mmcc-msm8974
>> +       - qcom,mmcc-msm8996
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  '#power-domain-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  protected-clocks:
>> +    description:
>> +       Protected clock specifier list as per common clock binding
> 
> Wasn't documented before. Okay to add here, but mention it in the commit
> msg.

Its a generic property that applies to all providers.  In the non-yaml 
bindings, its was documented in the clock-binding.txt, thus implicitly 
documented for all the bindings.  That doesn't work in yaml, so I'm 
making it explicit here (following the GCC bindings you already 
approved).  Nothing changes.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
>> +  - '#reset-cells'
>> +  - '#power-domain-cells'
>> +
>> +examples:
>> +  # Example for MMCC for MSM8960:
>> +  - |
>> +    clock-controller@4000000 {
>> +      compatible = "qcom,mmcc-msm8960";
>> +      reg = <0x4000000 0x1000>;
>> +      #clock-cells = <1>;
>> +      #reset-cells = <1>;
>> +      #power-domain-cells = <1>;
>> +    };
>> +...
>> -- 
>> Qualcomm Technologies, Inc. is a member of the
>> Code Aurora Forum, a Linux Foundation Collaborative Project.
>>


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
