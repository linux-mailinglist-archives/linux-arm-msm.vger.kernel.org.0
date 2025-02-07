Return-Path: <linux-arm-msm+bounces-47141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7826A2C228
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 13:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5B043A9CAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 12:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAE81DED66;
	Fri,  7 Feb 2025 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SPLTILhM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFD02417C7;
	Fri,  7 Feb 2025 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738929840; cv=none; b=HGz2HUvm/mGL/HSc29aKHi4BC3BtBdcQ7YRacqbtdRLxbRDdIB3SVT/wIC3SdjJ02nh0ZQjpqoK7advkiP9vqkcUCELDjmcO6OWPz2QpG7VF+8+MV50gXCNCgdnCPOsKp5/APUArqMWUjTJ/nMFX98Ip8yOtkW+PGg5hFjvOmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738929840; c=relaxed/simple;
	bh=vSe2aqlxgdYJkzNq04vgzJKNQSxYHU5xnjh0uAfSsco=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=MHql9cIteNaAr5zVfL7MG/OiCJZzKxkmsk86gTYogYpuY4X9GXoczdn7Sb9BJsqT17Yj6227axHIguENhRHw/TP4fK6+v6TgAUHiGnNr3n3/+hJnggPB+3zGyVURdFLLV2w0r/Qbf2qJOtApzvTzb9i6lzIDCb0s0IhmtuRXFW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SPLTILhM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517BNkpv032714;
	Fri, 7 Feb 2025 12:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KB5ry0822fOnZO8OHnNGA51DXxbTzPAyb6lNTnpm0SY=; b=SPLTILhMnRumfKXc
	DGZsN/ISYCLQrAPXO68P1RE7OC18H/Viu1uakQ2AjWAAcoHRc4M9KM7A9SUDEUdf
	dat4r1wREUiO/Pw66Dtns+9us8eKgmi01fLf21xlXcqzMUHQL/esbTdrQpl1V7Xm
	37qbM4a/uuIwOHc/VzBQpTa0wuo5rHIcoZlZ7myWb4T3lQ55Lyepn8E7scp0BfOs
	kkoyntBxBQH1FJqdSjXkkNKgXpuUD4Vgmkn51yoI1nC/u8dLy4o9ESuipBZBea8Q
	64Sq247MN05QS0iIn3t8NHyNwJHgOgPoZy6p7pPHa/FsgjMS6CT7jWQ8HCKdEQRy
	0YCSCA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nh8ur31c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 12:03:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517C3np7018892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 12:03:49 GMT
Received: from [10.216.49.103] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 04:03:46 -0800
Message-ID: <f643c57e-de01-4372-a1b1-7ebde319d0a4@quicinc.com>
Date: Fri, 7 Feb 2025 17:33:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller bindings
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-2-quic_msavaliy@quicinc.com>
 <248000f5-63db-492c-884d-ac72db337493@kernel.org>
 <0ae3f754-edcb-4b22-9d49-b20ef264554b@quicinc.com>
Content-Language: en-US
In-Reply-To: <0ae3f754-edcb-4b22-9d49-b20ef264554b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vkhAe4T5TKsvZ_7DZJX4KB0oPC5tPaJN
X-Proofpoint-ORIG-GUID: vkhAe4T5TKsvZ_7DZJX4KB0oPC5tPaJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_05,2025-02-07_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070093

Hi Krzysztof,

On 2/6/2025 7:13 PM, Mukesh Kumar Savaliya wrote:
> Hi Krzysztof,  Thanks !
> 
> On 2/5/2025 8:12 PM, Krzysztof Kozlowski wrote:
>> On 05/02/2025 15:31, Mukesh Kumar Savaliya wrote:
>>> Add device tree bindings for the Qualcomm I3C master controller. This
>>> includes the necessary documentation and properties required to describe
>>> the hardware in the device tree.
>>
>> A nit, subject: drop second/last, redundant "bindings". The
>> "dt-bindings" prefix is already stating that these are bindings.
> Sure
>> See also:
>> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/ 
>> devicetree/bindings/submitting-patches.rst#L18
>>
>> Use modern terminology, which means:
>> s/master/whatever else or even nothing/
>> See other recent bindings and discussions.
>>
> Sure
>>
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---
>>>   .../bindings/i3c/qcom,i3c-master.yaml         | 57 +++++++++++++++++++
>>>   1 file changed, 57 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c- 
>>> master.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/i3c/qcom,i3c- 
>>> master.yaml b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>> new file mode 100644
>>> index 000000000000..ad63ea779fd6
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>
>> Filename matching compatible.
>>
> Changed compatible to "qcom,i3c-master"
>>> @@ -0,0 +1,57 @@
>>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/i3c/qcom,i3c-master.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm I3C master controller
>>> +
>>> +maintainers:
>>> +  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> +
>>> +allOf:
>>> +  - $ref: i3c.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,geni-i3c
>>
>> No SoC? So to be sure: you claim all future SoCs will be using exactly
>> the same interface. No new compatibles, no new properties will be added.
>>
> I think i should remove const. kept it for now as no other compatible to 
> be added as of now.
> 
> let me remove const.
> 
> SoC name is not required, as this compatible is generic to all the SOCs.
>>> +
>>> +  reg:
>>> +    minItems: 1
>>
>> Drop
>>
> Not required ? I see other bindings are using it, so please confirm if i 
> can remove this.
>>> +    maxItems: 2
>>
>> Drop and instead list and describe items
>>
> Okay, i can remove maxItems if not mandatory. Taken cdns,i3c-master.yaml 
> and added these.
> 
>>
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>
>> Look at other bindings. There is never code like this.
>>
> cdns,i3c-master.yaml taken as reference.
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: se-clk
>>
>> Drop clock-names
> Sure, took reference from cdns,i3c-master.yaml.
>>
>>> +
>>> +  interrupts-extended:
>>> +    minItems: 1
>>> +    maxItems: 3
>>
>> As well - there is never an interrupts-extended property. Just 
>> interrupts.
>>
> No, i see this property many places. Do you mean to say interrupts- 
> extended  can be there in examples but not only add "interrupts" 
> property here ?
> e.g timer/riscv,timer.yaml +41 lists it in yaml also.
>> Also drop constraints and list items.
>>
> I will remove minItems and MaxItems, will list Items with description.
>>
Wanted to check if below way is fine ? Because some of the ask to drop 
constraints are already present in other i3c yaml files.

if not, could you please help share example removing constraints and 
listing item ?

== Sample ==
properties:
   compatible:
     enum:
       - qcom,i3c-controller

   reg:
     type: array
     minItems: 1
     maxItems: 1
     items:
       type: integer
     description: Base address and size of the I3C controller registers.

   interrupts:
     type: array
     minItems: 1
     maxItems: 1
     items:
       type: integer
     description: Interrupt number for the I3C controller.

   clocks:
     type: array
     minItems: 1
     maxItems: 1
     items:
       type: object
     description: Clock specifier for the I3C controller.
===

>>
>> Best regards,
>> Krzysztof
> 
> 


