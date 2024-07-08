Return-Path: <linux-arm-msm+bounces-25494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F32F92A32F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 14:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEEA61F2321D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 12:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB45C824A1;
	Mon,  8 Jul 2024 12:50:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1DA7E0EA;
	Mon,  8 Jul 2024 12:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720443019; cv=none; b=L4WEbWOgsBTm4bsKL4uDqsLWfWbYdjkNkv/Dd7SRWkwd2C7/Du0xBpXVWCgYNpBOQL3NFXRC34PEck9+To416aJ0Bdm05iE67bKtmU84RYqcDljGtxNt5DOSJfLvfpjsZgyZ3cyE8b9G5BG/fXmdILJiHEe7CmYfSCrrYQManE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720443019; c=relaxed/simple;
	bh=OFqD32J3lAHI3ENFac/jIZMKqrQ93Cts5OasYxedmXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qlO3B3N+CtJFbFjDJvXZvHkUlWvkBwI8iY5YlEt6k925nHQ23uCKODv0CTgDmddyg6lZqkp4XY8Gd5WuiKUvvSXJ/KfNHlwGBC5ifSmc/3QHNw5eXreD6u8T7r0nW8ZM7Q11devtgtxghVMPQGoHsLPjjc+xVmrGx/snXHP79cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 096651042;
	Mon,  8 Jul 2024 05:50:41 -0700 (PDT)
Received: from [10.57.74.191] (unknown [10.57.74.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19AFC3F766;
	Mon,  8 Jul 2024 05:50:12 -0700 (PDT)
Message-ID: <6a23eb7f-2fad-4a44-bf7c-ab7f01c342f3@arm.com>
Date: Mon, 8 Jul 2024 13:50:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: Add binding document for
 Coresight Control Unit device.
Content-Language: en-GB
To: JieGan <quic_jiegan@quicinc.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 James Clark <james.clark@arm.com>, Jinlong Mao <quic_jinlmao@quicinc.com>,
 Leo Yan <leo.yan@linaro.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 Song Chai <quic_songchai@quicinc.com>, linux-arm-msm@vger.kernel.org
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-3-quic_jiegan@quicinc.com>
 <208b3861-6898-4506-9152-c9d770ef1555@arm.com>
 <Zou7FA2Av7CJO+ds@jiegan-gv.ap.qualcomm.com>
 <Zou+fmUJoyzamWcw@jiegan-gv.ap.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <Zou+fmUJoyzamWcw@jiegan-gv.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/07/2024 11:25, JieGan wrote:
> On Mon, Jul 08, 2024 at 06:10:28PM +0800, JieGan wrote:
>> On Mon, Jul 08, 2024 at 10:41:55AM +0100, Suzuki K Poulose wrote:
>>> On 05/07/2024 10:00, Jie Gan wrote:
>>>> Add binding document for Coresight Control Unit device.
>>>
>>> nit: This is again too generic ? corsight-tmc-control-unit ? After all
>>> thats what it is and not a *generic* coresight control unit ?
>>>
>> coresight-tmc-control-unit is much better. We will check it.
>>   
>>>>
>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>> ---
>>>>    .../bindings/arm/qcom,coresight-ccu.yaml      | 87 +++++++++++++++++++
>>>>    1 file changed, 87 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
>>>> new file mode 100644
>>>> index 000000000000..9bb8ced393a7
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
>>>> @@ -0,0 +1,87 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-ccu.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: CoreSight Control Unit
>>>> +
>>>> +maintainers:
>>>> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
>>>> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
>>>> +  - Jie Gan <quic_jiegan@quicinc.com>
>>>> +
>>>> +description:
>>>> +  The Coresight Control unit controls various Coresight behaviors.
>>>> +  Used to enable/disable ETR’s data filter function based on trace ID.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,coresight-ccu
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: apb_pclk
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: ccu-base
>>>> +
>>>> +  in-ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>> +    unevaluatedProperties:
>>>> +      patternProperties:
>>>> +        '^port(@[0-7])?$':
>>>> +          description: Input connections from CoreSight Trace bus
>>>> +          $ref: /schemas/graph.yaml#/properties/port
>>>> +
>>>> +          properties:
>>>> +            qcom,ccu-atid-offset:
>>>
>>> Why do we need this atid offset ? Couldn't this be mapped to the "port"
>>> number ?
>>>
>>> e.g, input-port 0 on CCU => Offset x
>>>       input-port 1 on CCU => (Offset x + Size of 1 region)
>> If the first ATID offset remains constant, it appears to be feasible.
>> We will consider the possibility of this solution.
> We just checked the ATID offset varies across different hardware platforms.
> It defined as 0xf4 on some platforms, and some others defined as 0xf8.

What do you mean ? The offset where you apply the filter changes across
different platforms ? or different "tmc-control-unit" implementations ?
Is this discoverable from the device ? We could use different
compatibles for different "types" of the "devices". Simply adding
something in the DT is not the right way.

> 
> So I think it should be better to define it in device tree node.

No. See above.

Suzuki

> 
>>
>>>
>>> I believe I mentioned this in the previous posting too ?
>> Yes, you mentioned before. I moved it from TMC filed to CCU filed.
>>
>>>
>>> Suzuki
>>>
>>


