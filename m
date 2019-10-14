Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89348D5FE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2019 12:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731367AbfJNKSC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Oct 2019 06:18:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51396 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730860AbfJNKSC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Oct 2019 06:18:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A6E21607C3; Mon, 14 Oct 2019 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571048279;
        bh=ULCuz7f6VakLd7Q+JCOH3uihZpD9OWkyMMR/NSXqYhA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Ltaj/sHmP1xtO19+PnT9DfF62zn04MREtdsblsRioWxWL0NYaBMLCUmSZo61sMQ9V
         yTw611uKf9jkIqNq3nEI+7pQc7RYZtg9Z7uoByPG/he9YWS52PrJZQGppI2LLovs4l
         eroT3Ka1HV0OSKzKKFRaHh8ZSp1bYUEhUE4XXKEo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F16EE60610;
        Mon, 14 Oct 2019 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571048278;
        bh=ULCuz7f6VakLd7Q+JCOH3uihZpD9OWkyMMR/NSXqYhA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gNPJM5ohIGYFxVa5T6fl4WVvVezImvSgVMF17qXOLcFudxisbAHmNuxpNGjnxzYnK
         ObrhsM9gE73fVDproXDjOOewv44/raWFhwhQb8mTRozTHex64Lqx86+xMaQeyza6U4
         lh+X8u5eiStxjXjulJ5yRhorZFwYD92Gad5lrGZo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F16EE60610
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v3 2/3] dt-bindings: clk: qcom: Add YAML schemas for the
 GCC clock bindings
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20190918095018.17979-1-tdas@codeaurora.org>
 <20190918095018.17979-3-tdas@codeaurora.org>
 <20190918212614.448FC20882@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <a6d37020-61e3-826b-f281-3e51cba4668b@codeaurora.org>
Date:   Mon, 14 Oct 2019 15:47:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918212614.448FC20882@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for your review.

On 9/19/2019 2:56 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-09-18 02:50:17)
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> new file mode 100644
>> index 000000000000..056a7977c458
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> @@ -0,0 +1,157 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller Binding
>> +
>> +maintainers:
>> +  - Stephen Boyd <sboyd@kernel.org>
> 
> Why am I the maintainer? Shouldn't this be you?
> 
>> +
>> +properties:
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  "#reset-cells":
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  compatible :
>> +     enum:
>> +       - qcom,gcc-apq8064
>> +       - qcom,gcc-apq8084
>> +       - qcom,gcc-ipq8064
>> +       - qcom,gcc-ipq4019
>> +       - qcom,gcc-ipq8074
>> +       - qcom,gcc-msm8660
>> +       - qcom,gcc-msm8916
>> +       - qcom,gcc-msm8960
>> +       - qcom,gcc-msm8974
>> +       - qcom,gcc-msm8974pro
>> +       - qcom,gcc-msm8974pro-ac
>> +       - qcom,gcc-msm8994
>> +       - qcom,gcc-msm8996
>> +       - qcom,gcc-msm8998
>> +       - qcom,gcc-mdm9615
>> +       - qcom,gcc-qcs404
>> +       - qcom,gcc-sdm630
>> +       - qcom,gcc-sdm660
>> +       - qcom,gcc-sdm845
>> +       - qcom,gcc-sm8150
>> +       - qcom,gcc-sc7180
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +    items:
>> +      - description: Board XO source
>> +      - description: Board active XO source
>> +      - description: Sleep clock source(optional)
> 
> Why is sleep clk optional?
> 

Will remove optional.

>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 3
>> +    items:
>> +      - const: bi_tcxo
>> +      - const: bi_tcxo_ao
>> +      - const: sleep_clk
>> +
>> +  nvmem-cells:
>> +    minItems: 1
>> +    maxItems: 2
>> +    description:
>> +      Qualcomm TSENS (thermal sensor device) on some devices can
> 
> Can this be restricted to certain compatible strings where this is the
> case? I'd like to be able to confirm that the compatibles that expect to
> see the nvmem actually have it.
> 

I will add this in the next patch.

>> +      be part of GCC and hence the TSENS properties can also be part
>> +      of the GCC/clock-controller node.
>> +      For more details on the TSENS properties please refer
>> +      Documentation/devicetree/bindings/thermal/qcom-tsens.txt
>> +
>> +  nvmem-cell-names:
>> +    minItems: 1
>> +    maxItems: 2
>> +    description:
>> +      Names for each nvmem-cells specified.
>> +    items:
>> +      - const: calib
>> +      - const: calib_backup
>> +
>> +  "#thermal-sensor-cells":
>> +    const: 1
> 
> Same for this one.
> 
>> +
>> +  "#power-domain-cells":
>> +    const: 1
>> +
>> +  protected-clocks:
>> +    description:
>> +       Protected clock specifier list as per common clock binding
>> +
>> +required:
>> +  - "#clock-cells"
>> +  - "#reset-cells"
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +examples:

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
