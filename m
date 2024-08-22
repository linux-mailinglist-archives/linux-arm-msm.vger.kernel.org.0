Return-Path: <linux-arm-msm+bounces-29278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AAC95B414
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 13:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3486328402F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 11:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667E31C93CE;
	Thu, 22 Aug 2024 11:43:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CEE17A584;
	Thu, 22 Aug 2024 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724327000; cv=none; b=N61ZFgc047wmPdcyTX0k62AJnEOyKoK47bVBnSjJEtDYtV+TL5okSGBK330wfvJ2c5SrrzQA2iKWLyJniOZmNXva4zIVwWg10MILrbmNd2m+/Q3U4KWzbcxgDbZhoIiuB5sXMRlajtKg8yMLkR0FnnwsNSBH7Uu4VJeQ9Af+vCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724327000; c=relaxed/simple;
	bh=CfE/PHW7QbfzWrvBuYqxbZsstrTnn8uwKc6a2/Ef8rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTXqFKxHkbiLH0V7o1EtJpHxp+oMQG7/B2sxLIdf8Wy7lC6Y5ZFd+k56bLkFpV6A+eDosbtfzUIEcmB+wcDG0UwD91n3VcYTHsd5yjgtSnJR4Yin1DqGl40Enb3EBnHinStJk6lALhT0xaFT7SmllrMj70wrxWN43Kktot5SMPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 517C8DA7;
	Thu, 22 Aug 2024 04:43:43 -0700 (PDT)
Received: from [10.57.71.237] (unknown [10.57.71.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B20823F58B;
	Thu, 22 Aug 2024 04:43:13 -0700 (PDT)
Message-ID: <4b51d5a9-3706-4630-83c1-01b01354d9a4@arm.com>
Date: Thu, 22 Aug 2024 12:43:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: arm: Add Coresight TMC Control Unit
 hardware
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>, JieGan <quic_jiegan@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Song Chai <quic_songchai@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
 <20240812024141.2867655-4-quic_jiegan@quicinc.com>
 <20240818142834.GA27754-robh@kernel.org>
 <ZsKkm/Pz0GYtH2Gl@jiegan-gv.ap.qualcomm.com>
 <9d9704ed-6ef8-4920-9874-29e0a815e2ba@kernel.org>
 <ZsMHnKKvOey4SA1O@jiegan-gv.ap.qualcomm.com>
 <d117e157-f2e2-4e17-bbe4-b84001eae1bb@kernel.org>
 <ZsQ5aMkXnyX9mumz@jiegan-gv.ap.qualcomm.com>
 <89690fa9-fb7f-4f9f-aeac-0f8cb22572a3@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <89690fa9-fb7f-4f9f-aeac-0f8cb22572a3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/08/2024 10:55, Krzysztof Kozlowski wrote:
> On 20/08/2024 08:36, JieGan wrote:
>> On Mon, Aug 19, 2024 at 11:51:41AM +0200, Krzysztof Kozlowski wrote:
>>> On 19/08/2024 10:51, JieGan wrote:
>>>> On Mon, Aug 19, 2024 at 08:25:33AM +0200, Krzysztof Kozlowski wrote:
>>>>> On 19/08/2024 03:49, JieGan wrote:
>>>>>> On Sun, Aug 18, 2024 at 08:28:34AM -0600, Rob Herring wrote:
>>>>>>> On Mon, Aug 12, 2024 at 10:41:39AM +0800, Jie Gan wrote:
>>>>>>>> Add binding file to specify how to define a Coresight TMC
>>>>>>>> Control Unit device in device tree.
>>>>>>>>
>>>>>>>> It is responsible for controlling the data filter function
>>>>>>>> based on the source device's Trace ID for TMC ETR device.
>>>>>>>> The trace data with that Trace id can get into ETR's buffer
>>>>>>>> while other trace data gets ignored.
>>>>>>>>
>>>>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>>>>> ---
>>>>>>>>   .../bindings/arm/qcom,coresight-ctcu.yaml     | 79 +++++++++++++++++++
>>>>>>>>   1 file changed, 79 insertions(+)
>>>>>>>>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..7a9580007942
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>>>> @@ -0,0 +1,79 @@
>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>>> +%YAML 1.2
>>>>>>>> +---
>>>>>>>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml#
>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>> +
>>>>>>>> +title: CoreSight TMC Control Unit
>>>>>>>> +
>>>>>>>> +maintainers:
>>>>>>>> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
>>>>>>>> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
>>>>>>>> +  - Jie Gan <quic_jiegan@quicinc.com>
>>>>>>>> +
>>>>>>>> +description:
>>>>>>>> +  The Coresight TMC Control unit controls various Coresight behaviors.
>>>>>>>> +  It works as a helper device when connected to TMC ETR device.
>>>>>>>> +  It is responsible for controlling the data filter function based on
>>>>>>>> +  the source device's Trace ID for TMC ETR device. The trace data with
>>>>>>>> +  that Trace id can get into ETR's buffer while other trace data gets
>>>>>>>> +  ignored.
>>>>>>>
>>>>>>> Nowhere is TMC defined.
>>>>>> The Coresight TMC control unit(CTCU) connected to Coresight TMC device via replicator and
>>>>>> works as a helper device to TMC device.
>>>>>
>>>>> Did you understand the feedback or just responding with whatever to get
>>>>> rid of reviewers?
>>>>
>>>> Sorry for the insufficient clarity in my response, I am just misunderstood the feedback and try
>>>> to explain the relationship between TMC and CTCU device.
>>>>
>>>> I will add the TMC description to explain what TMC is as shown below:
>>>> The Trace Memory Controller(TMC) is used for Embedded Trace Buffer(ETB), Embedded Trace FIFO(ETF)
>>>> and Embedded Trace Router(ETR) configurations. The configuration mode (ETB, ETF, ETR) is
>>>> discovered at boot time when the device is probed.
>>>
>>> Thanks.
>>>
>>>>
>>>>>
>>>>>>
>>>>>> The in-ports listed below illustrate their connection to TMC devices.
>>>>>>
>>>>>>>
>>>>>>>> +
>>>>>>>> +properties:
>>>>>>>> +  compatible:
>>>>>>>> +    enum:
>>>>>>>> +      - qcom,sa8775p-ctcu
>>>>>>>> +
>>>>>>>> +  reg:
>>>>>>>> +    maxItems: 1
>>>>>>>> +
>>>>>>>> +  clocks:
>>>>>>>> +    maxItems: 1
>>>>>>>> +
>>>>>>>> +  clock-names:
>>>>>>>> +    items:
>>>>>>>> +      - const: apb
>>>>>>>> +
>>>>>>>> +  in-ports:
>>>>>>>
>>>>>>> Use 'ports' unless you have both in and out ports.
>>>>>> The ‘in-ports’ and ‘out-ports’ properties will be parsed by ‘of_coresight_get_port_parent’
>>>>>> and their relationships to other devices will be stored in the coresight_platform_data structure.
>>>>>>
>>>>>> for example:
>>>>>> struct coresight_platform_data {
>>>>>> 	int nr_inconns;
>>>>>> 	int nr_outconns;
>>>>>> 	struct coresight_connection **out_conns;
>>>>>> 	struct coresight_connection **in_conns;
>>>>>> };
>>>>>>
>>>>>> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/hwtracing/coresight/coresight-platform.c#L147
>>>>>
>>>>> and? If you respond with some unrelated argument, we will respond with
>>>>> the same: Use 'ports' unless you have both in and out ports.
>>>>
>>>> Sorry for the insufficient response.
>>>>
>>>> The Coresight driver prefers using ‘in-ports’ and ‘out-ports’ instead of the ‘ports’ property, as each
>>>> Coresight component needs to specify its input and output directions.
>>>>
>>>> The Coresight system operates by integrating all Coresight components and construting its data flow path
>>>> based on the defined directions.
>>>>
>>>> Consequently, the data flow direction cannot be determined when utilizing the ‘ports’ property in the
>>>> Coresight system.
>>>
>>> It can be determined. Driver knows that there are only in-ports, so you
>>> cannot have here other direction. Maybe the drivers have somehow this
>>> hard-coded? But that's a bit annoying limitation.
>>>
>> In Coresight platform driver, the of_coresight_get_port_parent function is used to retrieve the parent of the 'ports' node.
>> The function is specifically hard-coded to recognize 'in-ports' and 'out-ports'. I think that's the limitation for
>> 'ports' property.
>>
>> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/hwtracing/coresight/coresight-platform.c#L147
> 
> That's a limitation of coresight platform driver, not bindings. Fix your
> drivers.

A bit more of context and history.
We have a generic platform parsing code for parsing the firmware tables
(DT and ACPI) in CoreSight. This will parse most generic bits (read, the
graph connections) to avoid duplicating the code. Most of the components
have both in and out connections (except trace sources and other helper
devices like this TMC CU).

Also, the "previous" (now legacy) DT graph bindings for CoreSight relied
on using standard "ports" with a property to indicate whether a given
port is "input". The platform driver still supports this for any legacy
platform that hasn't moved over (of course with a complaint of using
obsolete bindings in the dmesg).

Now the above proposal is going to conflict with the legacy binding
handling, where "ports" indicate output ports by default, without
the obsolete property and the driver can't differentiate this from
a legacy binding vs modern binding with individual driver to decide
the direction of the port. Nothing unfixable, but I don't understand
what is wrong in calling "input ports" in-ports. But if that is
definitely a no go area, we would need to add "fixup" logic in 
individual drivers to "correct" the type of a port (i.e, all output 
ports in the parsed data to input ports) and live with it.

Kind regards
Suzuki






> 
> Best regards,
> Krzysztof
> 


