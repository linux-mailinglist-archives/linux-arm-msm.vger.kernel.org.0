Return-Path: <linux-arm-msm+bounces-47443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2964A2F2AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 17:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13ACF3A0121
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 16:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A8A24F5A4;
	Mon, 10 Feb 2025 16:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a8st6Q1r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C85C24F59B;
	Mon, 10 Feb 2025 16:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203937; cv=none; b=U2G8p87w3Svy99cxF4H625STDznEqlkUvYcJ6zk3NLSRYja1nqnK4Octh9tSB0Kz0bZdOusKNpbeJeDkhBkjaoD5ovml7jxfTsqdnhcBsIMezj2vxS+gi9RX8mvQncX9NCO44AzM3P9CkViC3FV6Kcro7MYYh8OEGSoGJ/TNkzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203937; c=relaxed/simple;
	bh=GYmInjceN7LFjtSNgUaVCtpsrQAUPv9WqJpuXTNqIaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=refvskXT+Hv6Ou3yBYKGGM6hu+SvjO2eS8w/368VEq4AuLh/wil3l1E/eozC2NgCnmsk7fZDPuqmIpXWXG0zN2WyIUbZ293I9Oh5hiCSoeR/jw8/r9fo0dUOIu/DwZpOcCOPHend9dxvTB8US04aVotLNwksgPHN3Q2M4xagu6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a8st6Q1r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9VnLO008240;
	Mon, 10 Feb 2025 16:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O5ZxRsXEL8Qchx184ZcGzMA0kX4PWaNwQG5mQFjUeoE=; b=a8st6Q1r25GWrnSc
	xozoT11J4mP2J2Xi7C2YUr6BiYRIBePeuIvPBNuha7Atgwa3ZaxeHVO0gnEtRK8o
	clL0VkaLrBB8qf4zMQ0kWtFvO8Ripsr0ah7+NF3FGRuoc9aZSdg13FmWp8fseVp9
	XFNaRfIQxI+c67ew/Dz5m5L1ubYiGWA68b+sSqpUOji3ICd38sl07aBslyVODRMN
	/Olc/45cpZUrVqnK+q0/X9F6z6IWVgieyjt/FiKOPAjP5vJ5YB5rkH2v4KkxvZ0l
	Z6rlFbQbFiM4P/RswkmHYHJasLgWk2zidP1UTSQEe5uC8piMw8hB5OJlmPAPycnW
	E9lLFA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh125h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:12:08 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51AGC748027796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:12:07 GMT
Received: from [10.216.47.54] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 08:12:03 -0800
Message-ID: <b7f2c973-e161-4b83-9b3a-415e84510bd2@quicinc.com>
Date: Mon, 10 Feb 2025 21:42:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-2-quic_msavaliy@quicinc.com>
 <248000f5-63db-492c-884d-ac72db337493@kernel.org>
 <0ae3f754-edcb-4b22-9d49-b20ef264554b@quicinc.com>
 <7c518972-75df-4c8a-8920-06d5aa2849ae@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <7c518972-75df-4c8a-8920-06d5aa2849ae@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gkd_6w2BDitqy_n_GmJ5g7ai6toF7e7X
X-Proofpoint-GUID: gkd_6w2BDitqy_n_GmJ5g7ai6toF7e7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100133

Thanks Krzysztof !

On 2/9/2025 5:15 PM, Krzysztof Kozlowski wrote:
> On 06/02/2025 14:43, Mukesh Kumar Savaliya wrote:
>> Hi Krzysztof,  Thanks !
>>
>> On 2/5/2025 8:12 PM, Krzysztof Kozlowski wrote:
>>> On 05/02/2025 15:31, Mukesh Kumar Savaliya wrote:
>>>> Add device tree bindings for the Qualcomm I3C master controller. This
>>>> includes the necessary documentation and properties required to describe
>>>> the hardware in the device tree.
>>>
>>> A nit, subject: drop second/last, redundant "bindings". The
>>> "dt-bindings" prefix is already stating that these are bindings.
>> Sure
>>> See also:
>>> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>>>
>>> Use modern terminology, which means:
>>> s/master/whatever else or even nothing/
>>> See other recent bindings and discussions.
>>>
>> Sure
>>>
>>>>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> ---
>>>>    .../bindings/i3c/qcom,i3c-master.yaml         | 57 +++++++++++++++++++
>>>>    1 file changed, 57 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>> new file mode 100644
>>>> index 000000000000..ad63ea779fd6
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>
>>> Filename matching compatible.
>>>
>> Changed compatible to "qcom,i3c-master"
>>>> @@ -0,0 +1,57 @@
>>>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/i3c/qcom,i3c-master.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm I3C master controller
>>>> +
>>>> +maintainers:
>>>> +  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> +
>>>> +allOf:
>>>> +  - $ref: i3c.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,geni-i3c
>>>
>>> No SoC? So to be sure: you claim all future SoCs will be using exactly
>>> the same interface. No new compatibles, no new properties will be added.
>>>
>> I think i should remove const. kept it for now as no other compatible to
>> be added as of now.
>>
>> let me remove const.
> 
> No, it does not matter. Keep const.
> 
Sure. I reviewed other files and seems i should write as below. Please 
help confirm.

   compatible:
     items:
       - enum:
           - qcom,sm8550-i3c-master
       - const: qcom,i3c-master
>>
>> SoC name is not required, as this compatible is generic to all the SOCs.
> 
> That's the statement you make. I accept it. I will bookmark this thread
> and use it whenever you try to add any future property here (to be
> clear: you agree you will not add new properties to fulfill *FUTURE* SoC
> differences).
> 
Sorry, i am not saying there won't be any other compatible but i was 
saying base driver will use "qcom,i3c-master".
After checking other files i realized there can be const compatible but 
other SOC specific can be added as enum.  Hope above given way is fine.


>>>> +
>>>> +  reg:
>>>> +    minItems: 1
>>>
>>> Drop
>>>
>> Not required ? I see other bindings are using it, so please confirm if i
>> can remove this.
>>>> +    maxItems: 2
>>>
>>> Drop and instead list and describe items
>>>
>> Okay, i can remove maxItems if not mandatory. Taken cdns,i3c-master.yaml
>> and added these.
>>
>>>
>>>> +
>>>> +  clocks:
>>>> +    minItems: 1
>>>
>>> Look at other bindings. There is never code like this.
>>>
>> cdns,i3c-master.yaml taken as reference.
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: se-clk
>>>
>>> Drop clock-names
>> Sure, took reference from cdns,i3c-master.yaml.
>>>
To confirm, i should drop complete clock-names and items too right ?

>>>> +
>>>> +  interrupts-extended:
>>>> +    minItems: 1
>>>> +    maxItems: 3
>>>
>>> As well - there is never an interrupts-extended property. Just interrupts.
>>>
>> No, i see this property many places. Do you mean to say
>> interrupts-extended  can be there in examples but not only add
> 
> I already wrote what you should do:
> 
> "Just interrupts."
> 
Sure, Changed interrupts-extended to interrupts. Done.

>> "interrupts" property here ?
>> e.g timer/riscv,timer.yaml +41 lists it in yaml also.
> 
> 
> Please do not take one file and create coding style out of it, but
> instead look what ~2300 other YAML files do.
> 
> 
I tried to look other many files including i2c and added. Please review 
latest or correct me before v2.

> Best regards,
> Krzysztof


