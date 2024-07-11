Return-Path: <linux-arm-msm+bounces-25933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 886DB92E383
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 11:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC3001C20C67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 09:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A495A1553B1;
	Thu, 11 Jul 2024 09:32:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCB154903;
	Thu, 11 Jul 2024 09:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720690345; cv=none; b=LVNYDortkbsfk44UD6s4wgl7NGAg/2qDhA8O+hG519CcCzOgNGidlf9ORe2sEmhyRXOmTfepak2bUUUk9d4uKTbkUa78p0Dr6HDW7L7KKPkE+oMBt1o5LprjST0MX9Ob31ouFN+xB8CwAUKxEcYgrCWDrFQ+YTpRpHLqEb2hNvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720690345; c=relaxed/simple;
	bh=ESjU4U/vqGXBGOI2eW3uQx7iiVRFq+EIA5cecxbiHhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9KQ7k6RiZrJbo9I9R3VcBjsFxIdi/zCdQo0f/FK6T7prvNqu63q3sRpkz1rL7R34RLqfPLDAur3OGdqujS+H9Napgo+p8VDsEFbWTWjozHzYpITqOfP3U1DR/2CmxrthotjPw1IjpnyR6wLxFLtmbgrT+aEDtTnY8lbcQgu73E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C89ED1007;
	Thu, 11 Jul 2024 02:32:46 -0700 (PDT)
Received: from [10.57.74.191] (unknown [10.57.74.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 445DD3F766;
	Thu, 11 Jul 2024 02:32:19 -0700 (PDT)
Message-ID: <8a7c65dc-fef8-47ee-bd7a-d7f20db4f6b5@arm.com>
Date: Thu, 11 Jul 2024 10:32:17 +0100
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
 <6a23eb7f-2fad-4a44-bf7c-ab7f01c342f3@arm.com>
 <ZozR+c7ggXWFwyOG@jiegan-gv.ap.qualcomm.com>
 <Zo+Zd96GHcQc5AnT@jiegan-gv.ap.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <Zo+Zd96GHcQc5AnT@jiegan-gv.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/07/2024 09:36, JieGan wrote:
> On Tue, Jul 09, 2024 at 02:00:25PM +0800, JieGan wrote:
>> On Mon, Jul 08, 2024 at 01:50:11PM +0100, Suzuki K Poulose wrote:
>>> On 08/07/2024 11:25, JieGan wrote:
>>>> On Mon, Jul 08, 2024 at 06:10:28PM +0800, JieGan wrote:
>>>>> On Mon, Jul 08, 2024 at 10:41:55AM +0100, Suzuki K Poulose wrote:
>>>>>> On 05/07/2024 10:00, Jie Gan wrote:
>>>>>>> Add binding document for Coresight Control Unit device.
>>>>>>
>>>>>> nit: This is again too generic ? corsight-tmc-control-unit ? After all
>>>>>> thats what it is and not a *generic* coresight control unit ?
>>>>>>
>>>>> coresight-tmc-control-unit is much better. We will check it.
>>>>>>>
>>>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>>>> ---
>>>>>>>     .../bindings/arm/qcom,coresight-ccu.yaml      | 87 +++++++++++++++++++
>>>>>>>     1 file changed, 87 insertions(+)
>>>>>>>     create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..9bb8ced393a7
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
>>>>>>> @@ -0,0 +1,87 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-ccu.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: CoreSight Control Unit
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
>>>>>>> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
>>>>>>> +  - Jie Gan <quic_jiegan@quicinc.com>
>>>>>>> +
>>>>>>> +description:
>>>>>>> +  The Coresight Control unit controls various Coresight behaviors.
>>>>>>> +  Used to enable/disable ETR’s data filter function based on trace ID.
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    const: qcom,coresight-ccu
>>>>>>> +
>>>>>>> +  reg:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  clocks:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  clock-names:
>>>>>>> +    items:
>>>>>>> +      - const: apb_pclk
>>>>>>> +
>>>>>>> +  reg-names:
>>>>>>> +    items:
>>>>>>> +      - const: ccu-base
>>>>>>> +
>>>>>>> +  in-ports:
>>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>>> +
>>>>>>> +    unevaluatedProperties:
>>>>>>> +      patternProperties:
>>>>>>> +        '^port(@[0-7])?$':
>>>>>>> +          description: Input connections from CoreSight Trace bus
>>>>>>> +          $ref: /schemas/graph.yaml#/properties/port
>>>>>>> +
>>>>>>> +          properties:
>>>>>>> +            qcom,ccu-atid-offset:
>>>>>>
>>>>>> Why do we need this atid offset ? Couldn't this be mapped to the "port"
>>>>>> number ?
>>>>>>
>>>>>> e.g, input-port 0 on CCU => Offset x
>>>>>>        input-port 1 on CCU => (Offset x + Size of 1 region)
>>>>> If the first ATID offset remains constant, it appears to be feasible.
>>>>> We will consider the possibility of this solution.
>>>> We just checked the ATID offset varies across different hardware platforms.
>>>> It defined as 0xf4 on some platforms, and some others defined as 0xf8.
>>>
>>> What do you mean ? The offset where you apply the filter changes across
>>> different platforms ? or different "tmc-control-unit" implementations ?
>>> Is this discoverable from the device ? We could use different
>>> compatibles for different "types" of the "devices". Simply adding
>>> something in the DT is not the right way.
>>
>> I got your point here. I believe we should consult our hardware engineers first to check it.
>> We need to figure out the design of ATID offset from hardware perspective. Then we can
>> propose an alternative approach, such as associating the offset with a compitable value,
>> to resolve this issue.
>>
>>>
>>>>
>>>> So I think it should be better to define it in device tree node.
>>>
>>> No. See above.
> 
> 
> Hi Suzuki
> 
> There is a new solution for CCU device. We would like to separate one CCU device into several helper
> devices, each responsible for one feature of the CCU device.
> 
> For the data filter feature, we will define the address of the AITD Register that included by CCU in DT
> as base address of the helper node. So the driver code can easily program the register field with the base address.
> With this solution, we may need define several helper nodes in DT file to support different features for CCU and each
> helper device needs a driver to support its behavior.
> 
> for example, ATID register for ETR0 with base address 0x10000f8: (tmp name used, TDFU for tmc data filter unit)

That looks like a hack to me and don't prefer that and there would be
multiple mappings for a single device and that could complicate device
resource accounting.

> 
> TDFU@10000f8 {
> ...
> }
> 
> ATID register for ETR1 with base address 0x1000108:
> TDFU@1000108 {
> ...
> }
> 
> The CCU device supports various features and the data filter feature for ETR is one of those features. How to support
> those features with one helper_enable function is a serious challenge. That's why we would like to separate it.
> Meanwhile, This solution can also resolve the offset issue.
> 
> We are looking forward your opinions with this proposal.

We need to know what other functionalities are supported and how that
will be used ?

In the worst case, you could define register bases for each port in the
CCU device node.

TDFU@.. {
	reg = <base-address 4K>

	<I don't know the standard property name for> =
	List of {
	<port number>, <Offset from base>,
	}
}

Suzuki


