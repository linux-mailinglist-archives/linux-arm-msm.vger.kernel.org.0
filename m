Return-Path: <linux-arm-msm+bounces-30515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6D969BCE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 13:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 941DF1C208B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 11:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C6A187855;
	Tue,  3 Sep 2024 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ay00BhWD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1530195;
	Tue,  3 Sep 2024 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725363066; cv=none; b=PaHwZ/nQLL8YAqO1NIu0Ggl1JtZ0H/ITopAnxAd+VcSOosz69liF13lwCZ81jqRQL80PlUGGJimPgfmawC+SqT5EazQnc9j7PfgrhjNx/LSvEdAUzGzyYqfVJvPa1ytPMs5znsuHST7uHDPdnoSC6tgZBbR89oDZY+5+ULiLczo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725363066; c=relaxed/simple;
	bh=+qwLCWYHeXVSdKM7YqprwtscUazD2JA57+RaPKBbaos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bumTny95B4LKmfOqlJ3VLZ/b1mQVhPaE8KW4lfisqGD2Yk8RXS/6OYdPFa0zlhjgOxzYDD0RrRgsjp0TaYHuqe2UvJpPYSSTmz0vutUfpHkqtq00QjbjhZbqY7B7wedKVTR7gQ/fGQXNxOb1ZzPzOdy3A+XMxEy4QJsvbMLHufM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ay00BhWD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF038C4CEC5;
	Tue,  3 Sep 2024 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725363066;
	bh=+qwLCWYHeXVSdKM7YqprwtscUazD2JA57+RaPKBbaos=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ay00BhWDaWC3mx3OWR/2YdwSjYRf8sxf6Tt8KzWImbsttnbHnX5dQ8AGc0MKX8am8
	 OLX9EFm8efDuDRQhl922xsaaUISEp25ZWxRULi/TK7gIWKjW02kI+WWs8ipcdQZj74
	 sv+EtFsTIcr8dPsHWmJvuilnv0X9CmFuBmp/AnVfCg5ArbB3T7/uep+zd40Yg0DItP
	 qVmUjS7T295A4uxaFY0WJNNalxiONNPtMzzyiIj790tMiDh+Etc+ZaXrG/+/CFSd7s
	 b1/ltKEcuUjpMq2rs5mzEei4q2rvLJ2/819FFKKHymZZxOcowTpuNBv7D2ye+H94QP
	 gf8rFVdMKkMRQ==
Message-ID: <e365b6da-f7f3-4a77-9ebc-a5db349bedbb@kernel.org>
Date: Tue, 3 Sep 2024 13:30:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
To: songchai <quic_songchai@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240830092311.14400-1-quic_songchai@quicinc.com>
 <20240830092311.14400-2-quic_songchai@quicinc.com>
 <0a79b9df-4ca4-4dc8-9930-3fa1dc7d3174@kernel.org>
 <65732921-988f-41f7-886e-94415b07608e@quicinc.com>
 <d4e424f0-5485-4ccc-83e1-d1eb3008af9f@kernel.org>
 <aef09e24-bdd0-4638-8ddc-55c4d39e37ec@quicinc.com>
 <51b9e189-7fa0-48b1-b5d2-b043fa1d8ed1@kernel.org>
 <686f4ff6-d7f0-483e-b5c4-4d2db0661c08@quicinc.com>
 <b6d0a93b-24bd-4af3-9294-7b069e819b14@kernel.org>
 <8dbe831f-d48a-4e4f-8681-d0b56b8c5213@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <8dbe831f-d48a-4e4f-8681-d0b56b8c5213@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2024 05:16, songchai wrote:
> 
> On 9/2/2024 6:24 PM, Krzysztof Kozlowski wrote:
>> On 02/09/2024 12:10, songchai wrote:
>>> On 9/2/2024 4:05 PM, Krzysztof Kozlowski wrote:
>>>> On 02/09/2024 09:24, songchai wrote:
>>>>> On 9/2/2024 3:02 PM, Krzysztof Kozlowski wrote:
>>>>>> On 02/09/2024 05:14, songchai wrote:
>>>>>>> On 8/30/2024 6:11 PM, Krzysztof Kozlowski wrote:
>>>>>>>> On 30/08/2024 11:23, songchai wrote:
>>>>>>>>> The Trigger Generation Unit (TGU) is designed to detect patterns or
>>>>>>>>> sequences within a specific region of the System on Chip (SoC). Once
>>>>>>>>> configured and activated, it monitors sense inputs and can detect a
>>>>>>>>> pre-programmed state or sequence across clock cycles, subsequently
>>>>>>>>> producing a trigger.
>>>>>>>>>
>>>>>>>>>        TGU configuration space
>>>>>>>>>             offset table
>>>>>>>>>      x-------------------------x
>>>>>>>>>      |                         |
>>>>>>>>>      |                         |
>>>>>>>>>      |                         |                           Step configuration
>>>>>>>>>      |                         |                             space layout
>>>>>>>>>      |   coresight management  |                           x-------------x
>>>>>>>>>      |        registers        |                     |---> |             |
>>>>>>>>>      |                         |                     |     |  reserve    |
>>>>>>>>>      |                         |                     |     |             |
>>>>>>>>>      |-------------------------|                     |     |-------------|
>>>>>>>>>      |                         |                     |     | prioroty[3] |
>>>>>>>>>      |         step[7]         |<--                  |     |-------------|
>>>>>>>>>      |-------------------------|   |                 |     | prioroty[2] |
>>>>>>>>>      |                         |   |                 |     |-------------|
>>>>>>>>>      |           ...           |   |Steps region     |     | prioroty[1] |
>>>>>>>>>      |                         |   |                 |     |-------------|
>>>>>>>>>      |-------------------------|   |                 |     | prioroty[0] |
>>>>>>>>>      |                         |<--                  |     |-------------|
>>>>>>>>>      |         step[0]         |-------------------->      |             |
>>>>>>>>>      |-------------------------|                           |  condition  |
>>>>>>>>>      |                         |                           |             |
>>>>>>>>>      |     control and status  |                           x-------------x
>>>>>>>>>      |           space         |                           |             |
>>>>>>>>>      x-------------------------x                           |Timer/Counter|
>>>>>>>>>                                                            |             |
>>>>>>>>> 						       x-------------x
>>>>>>>>> TGU Configuration in Hardware
>>>>>>>>>
>>>>>>>>> The TGU provides a step region for user configuration, similar
>>>>>>>>> to a flow chart. Each step region consists of three register clusters:
>>>>>>>>>
>>>>>>>>> 1.Priority Region: Sets the required signals with priority.
>>>>>>>>> 2.Condition Region: Defines specific requirements (e.g., signal A
>>>>>>>>> reaches three times) and the subsequent action once the requirement is
>>>>>>>>> met.
>>>>>>>>> 3.Timer/Counter (Optional): Provides timing or counting functionality.
>>>>>>>>>
>>>>>>>>> Add a new coresight-tgu.yaml file to describe the bindings required to
>>>>>>>>> define the TGU in the device trees.
>>>>>>>>>
>>>>>>>>> Signed-off-by: songchai<quic_songchai@quicinc.com>
>>>>>>>> It feels like you are using login name as real name. Please investigate
>>>>>>>> this and confirm whether latin transcription/transliteration of your
>>>>>>>> name is like above.
>>>>>>> yes.. it's my login name. Will use my real name in next version.
>>>>>>>>> ---
>>>>>>>>>      .../bindings/arm/qcom,coresight-tgu.yaml      | 136 ++++++++++++++++++
>>>>>>>>>      1 file changed, 136 insertions(+)
>>>>>>>>>      create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>>>>>>>> new file mode 100644
>>>>>>>>> index 000000000000..c261252e33e0
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>>>>>>>> @@ -0,0 +1,136 @@
>>>>>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>>>>>> +# Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>>>>> +%YAML 1.2
>>>>>>>>> +---
>>>>>>>>> +$id:http://devicetree.org/schemas/arm/qcom,coresight-tgu.yaml#
>>>>>>>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>>> +
>>>>>>>>> +title: Trigger Generation Unit - TGU
>>>>>>>>> +
>>>>>>>>> +description: |
>>>>>>>>> +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
>>>>>>>>> +  to sense a plurality of signals and create a trigger into the CTI or
>>>>>>>>> +  generate interrupts to processors. The TGU is like the trigger circuit
>>>>>>>>> +  of a Logic Analyzer.The corresponding trigger logic can be realized by
>>>>>>>>> +  configuring the conditions for each step after sensing the signal.
>>>>>>>>> +  Once setup and enabled, it will observe sense inputs and based upon
>>>>>>>>> +  the activity of those inputs, even over clock cycles, may detect a
>>>>>>>>> +  preprogrammed state/sequence and then produce a trigger or interrupt.
>>>>>>>>> +
>>>>>>>>> +  The primary use case of the TGU is to detect patterns or sequences on a
>>>>>>>>> +  given set of signals within some region of the SoC.
>>>>>>>>> +
>>>>>>>>> +maintainers:
>>>>>>>>> +  - Mao Jinlong<quic_jinlmao@quicinc.com>
>>>>>>>>> +  - Sam Chai<quic_songchai@quicinc.com>
>>>>>>>>> +
>>>>>>>>> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
>>>>>>>>> +select:
>>>>>>>>> +  properties:
>>>>>>>>> +    compatible:
>>>>>>>>> +      contains:
>>>>>>>>> +        enum:
>>>>>>>>> +          - qcom,coresight-tgu
>>>>>>>>> +  required:
>>>>>>>>> +    - compatible
>>>>>>>>> +
>>>>>>>>> +properties:
>>>>>>>>> +  $nodename:
>>>>>>>>> +    pattern: "^tgu(@[0-9a-f]+)$"
>>>>>>>> Drop the pattern (and anyway @ is not optional).
>>>>>>> There will be several TGUs in the SoC, and we want to use the address of
>>>>>>> each to distinguish them.
>>>>>> How is this related?
>>>>>>
>>>>>>> This is why we added the nodename pattern here.
>>>>>> How is this related?
>>>>>>
>>>>>>> Additionally, I noticed that both TPDM and CTI also use this format to
>>>>>>> define the nodename.
>>>>>>>
>>>>>>> Could you please share any concerns you have about using this pattern?
>>>>>> I don't get why you insist, but sure:
>>>>>> The name does not follow DT spec recommendation, plus child schema is
>>>>>> not really supposed to define the names.
>>>>> Thanks for you clarification, will drop in the next version.
>>>>>>>>> +  compatible:
>>>>>>>>> +    items:
>>>>>>>>> +      - const: qcom,coresight-tgu
>>>>>>>>> +      - const: arm,primecell
>>>>>>>>> +
>>>>>>>>> +  reg:
>>>>>>>>> +    maxItems: 1
>>>>>>>>> +
>>>>>>>>> +  clocks:
>>>>>>>>> +    maxItems: 1
>>>>>>>>> +
>>>>>>>>> +  clock-names:
>>>>>>>>> +    items:
>>>>>>>>> +      - const: apb_pclk
>>>>>>>>> +
>>>>>>>>> +  qcom,tgu-steps:
>>>>>>>>> +    description:
>>>>>>>>> +      The trigger logic is realized by configuring each step after sensing
>>>>>>>>> +      the signal. The parameter here is used to describe the maximum of steps
>>>>>>>>> +      that could be configured in the current TGU.
>>>>>>>> Why this is board or SoC level property? All below also feel like
>>>>>>>> unnecessary stuff from downstream.
>>>>>>> There are actually four properties used to describe the number of
>>>>>>> registers with different functionality for TGUs at the SoC level.
>>>>>>>
>>>>>>> Each TGU may have a different number of registers, so we need to add
>>>>>>> these four properties to describe each TGU’s hardware design.
>>>>>> Each TGU on the same SoC?
>>>>> yes, in other words, there will be several TGUs in the SoC.
>>>> This I understood, but I am asking if each TGU on the same SoC will have
>>>> different number of registers and other properties?
>>> yes, each TGU has a different number of registers.
>>>
>>> For example, some TGUs support 6 steps, while others support only 4 steps.
>>>
>>> These variations depend on the hardware design, so we need properties to
>>> describe.
>> You keep avoiding the answer. ON THE SAME SOC.
>>
>> Point to your upstream DTS using this.
> 
> I reviewed the hardware design of our chipset and found the following:
> 
>   * In the SM8450, there are three TGUs on the same SoC. However, only
>     one TGU has timer and counter registers to support time/counter
>     functionality.
>   * Additionally, in the SM8450, the “tgu-regs” configuration varies:
>     some TGUs have 8 registers, while others have only 5 registers.
> 
> To answer question - yes, on the same soc, will have different number of 
> registers and other properties.

Thank you, this is valid reason for the property.

Best regards,
Krzysztof


