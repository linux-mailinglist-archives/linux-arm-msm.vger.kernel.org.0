Return-Path: <linux-arm-msm+bounces-83981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C94CC97A77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 14:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB2BB3A2751
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 13:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A0F313534;
	Mon,  1 Dec 2025 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzXVN4Wn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wa46xRVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC4331196F
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 13:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764596446; cv=none; b=MErU8a68q4JR83ZdCiGF1gcOc9UDduH/EhI50IZyvV7IuB/wGpmVvAQs4MdQwDCI6T9/eagsxDOv5njLEPyk2JvZpj0diejN4Fkx7OmCBh2aT0i1dF4MeUvVVmLorg3GO1WUTGufC4ofePWa5CU6rJtpScU3p+xxQkyvPX5hY7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764596446; c=relaxed/simple;
	bh=4L9DAcmCmIYe1wiODtkWq4OGSsc5ukW/GWK4LQo6AYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwbi1aWUyJznNjHoAinEqEjc9GLws4SBfgZcXRvdn6NyOSN+XGUjKN8TetU+R0Gs9PIsQxgxuHmEN42rmftlJI5rYHKzKEEx1SdJk8VS/NadZHLCgzZZtGxlMuq4WY4bKiiTEmb5ll0kMKab+XSchBNw+/GfwatC5vdTwTxOkmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzXVN4Wn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wa46xRVu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19MEaX3362398
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 13:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ke15MN1YvaWnhyXMfOc/kHTCr6V5+wblM0hgXYie3NQ=; b=mzXVN4WnxCLP/m9G
	rZ73oeY3SSH448DXx2tOsvhzW2T9hXvKjDEvxtZTEnNvKXopnfZFa8Z3HB2KyIac
	9Qnxqo99zkUR0kMGRMRxvhaB9gvPGoz4GrcDi8x/3iri61WSy5Fc1C2j21elZ1Ej
	nYV7/lchvQmWPQ2Md5Ucmfcca4BtokAk6zIXpRuNWaNBt45dUieaQubvDmT1VIS6
	uNqHl7FHXQHzdaFJqk34GfJGvcI0aVvov5s0xDDMaP5PqqSkldzpBwSWXxSaKLpJ
	V1apUZAqsk88nKRBpEUikOesV7KllqLn/mmb4Iireco2QNzJQYpLXo5KHywG5Z9H
	xrMxZA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8b00pye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 13:40:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5dfbe140bffso418923137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 05:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764596443; x=1765201243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ke15MN1YvaWnhyXMfOc/kHTCr6V5+wblM0hgXYie3NQ=;
        b=Wa46xRVuigp8Br3TT2AhA0/MuZjnq/sNaUARv/OjZkd+neMMImE2X2I2Li9QgavtG+
         NhCMa6jhwdN+d/Y8VubA5EttjwVFkBeBXuCHYzv9swJBtgMNOcXT5KLZyE+HdSvjk2Sm
         xusfKfRJK2ofBb704ncihaUASpK2qFv78vKoiwIJH2d5cUFSCgggf+Frm1MpDEM/NFMv
         s3qrOCiDCp58S4jBRrWJ7HEoNMGwPYPwiLmH8evTLN3YtMyza6UrXdRr7+3T5X0KttUz
         mDjTnlxIzMrXNEhAy2Qd/YimxMqTN55+wudc352CNc+9VC5PEEDyPXml8hAWPunEfXfe
         3Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764596443; x=1765201243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ke15MN1YvaWnhyXMfOc/kHTCr6V5+wblM0hgXYie3NQ=;
        b=oTQCjkDPsbVMXiWhxK5Ifmr3GVk22Vzx6XCbUtj1t0Gq+dIMHMEJoDjn3xES58CtLz
         rxQbyQoDI+dbKvsq27xkyQt63oyDBT2vWJSaYnGKIEI6WOQsqqTBhvV8Pi4Z5dCoz2N5
         6uD7bkI56dJtYjxExkCFUPrqC9RBg3OqXws/RFJi58M1rkz78UmcwG6k9oz2JsJAnRtU
         TKThhmcO+d125fJ1up3L7wozKakQhjORrJbMO8veQs4OgzLu8EnzGZQOWtInHUGRblba
         kN5jlZf3ZvZOagA+3ZFhY3aZCYn/Kkujy+FoTQAjuCtufW+WwO0XH+VgBWD7x6HSLgrB
         dINw==
X-Gm-Message-State: AOJu0Yznn+rNqUIgg475IXByvs+uMQVjdfdVk7893vFXypI+LhHc12iw
	rmmgylYdDGhGpk1WdBeoARAk+P5IPoGW+kaWogcQ11hF/VuYTrEnx8AWlUzn2BHBz3Y5qzNY0pj
	6FitKyCkADmWcYaE3FKmwr1woejJrldk7Jb3wOj7rJYClgT3z8MOpDHE5+RnElOJnYwzkKs269y
	vi
X-Gm-Gg: ASbGnctPDvBklg6wZyZo9xY5yde+cu1hb/IxKX861uWnHl+gYNgV27QkkYQDaSFTuIO
	OxX70pksWY7f9hEtT4dUB9pB3OZmiXKlMGrDc/+C42acuqGw4g/LmzKbqWqkYeSoFT+Q08eO5KP
	0s1AMj58Yyz/f7uQl/m1XcnubEiiNx+bkwGqhKth2Ng0KApz12TDI5ZVkOmP/G6wOtmEkvZa7xe
	ZUzOAOQ7wDSGLGdveou1qxJbVCFPCDMNvAQl97nkgfDpt+iuMDNFNtQBzK6xFEUE1td4e042X4b
	0QmJO8LivKNOgya0aCRRUDucWhHMj2n9kwAEjnuh7xRVoUA5FHEbHTePniQopRV25CMh3Bu/lRw
	Lbc/LMd5P/lbgzL+BC1fk29pWaLicHuy4j0YSvbCM8sBfDf1gvOK1OiWDxpFpR6URr10=
X-Received: by 2002:a05:6102:3908:b0:5db:f553:4ca0 with SMTP id ada2fe7eead31-5e1de229ba7mr8191779137.1.1764596442626;
        Mon, 01 Dec 2025 05:40:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPOeIK1hAyKionCk0QoJjPzVJmxLdVTpZGvaiKXINTbDe2uaGwGDoCpySRFUD4/3kz1oLRNA==
X-Received: by 2002:a05:6102:3908:b0:5db:f553:4ca0 with SMTP id ada2fe7eead31-5e1de229ba7mr8191770137.1.1764596442107;
        Mon, 01 Dec 2025 05:40:42 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f4d533f2sm1231551266b.0.2025.12.01.05.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:40:41 -0800 (PST)
Message-ID: <509b970e-89bb-4331-a558-8b6fc54b470b@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:40:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
To: Jonathan Marek <jonathan@marek.ca>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251127212943.24480-1-jonathan@marek.ca>
 <aSl48gV9laFb-MR1@linaro.org>
 <1f2c4e5b-2d7d-41cd-9772-374e3de46a50@oss.qualcomm.com>
 <45bee524-d960-5b24-83bd-4dfb3e78fb1d@marek.ca>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <45bee524-d960-5b24-83bd-4dfb3e78fb1d@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TcKbdBQh c=1 sm=1 tr=0 ts=692d9adb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=SEy8FXNfZs6TXO5W6OgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: GUnCGpgtpvDWian4ME_8Z8J5d4aEFFse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDExMSBTYWx0ZWRfXz+e5E7oNxV/o
 ChpeO1IlrJlsNduE5IiwLnDIzK0bf7P6X2BqiZ9ueP4++o9VEJoSxzVQcMmLYqsSkAbXEBFD9VR
 BAElW06ra0w8y3QOwecRoyas2+WTjocd5LW9DrCqRxdNieug/GeNzgkhv9xGWIQ6NzHJttvxIg8
 OgXb3i1RWGqe43tf+Vj/HKgUHUJe6VAzZPMIOSUQROsOPvL0pMkxnim5Jf6WwrzsLuYa2XAzCVW
 bQOkmhd/LDsAYWxBmOzJHYzFYTJT5cH3Tv0Eks6541ZS1LrFgqRGBJWsr9fP5FQSEzsI+uDRBYG
 58rniHUJOvnQXMJlBD1gUNQbvKOTzjpIdCsgwRYBT7d4B/gzJE1gzy3B23zqv57iGEUoRy9I13p
 h6GqY/Zxw4lKzyttDuICscUeYDhQgA==
X-Proofpoint-GUID: GUnCGpgtpvDWian4ME_8Z8J5d4aEFFse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010111

On 11/28/25 3:49 PM, Jonathan Marek wrote:
> On 11/28/25 5:52 AM, Konrad Dybcio wrote:
>> On 11/28/25 11:26 AM, Stephan Gerhold wrote:
>>> On Thu, Nov 27, 2025 at 04:29:42PM -0500, Jonathan Marek wrote:
>>>> Unlike the phone SoCs this was copied from, x1e has a 40-bit physical bus.
>>>> The upper address space is used to support more than 32GB of memory.
>>>>
>>>> This fixes issues when DMA buffers are allocated outside the 36-bit range.
>>>>
>>>> Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
>>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>> index cff34d1c74b60..cd34ce5dfd63a 100644
>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>> @@ -792,8 +792,8 @@ soc: soc@0 {
>>>>             #address-cells = <2>;
>>>>           #size-cells = <2>;
>>>> -        dma-ranges = <0 0 0 0 0x10 0>;
>>>> -        ranges = <0 0 0 0 0x10 0>;
>>>> +        dma-ranges = <0 0 0 0 0x100 0>;
>>>> +        ranges = <0 0 0 0 0x100 0>;
>>>>   
>>>
>>> Could you clarify which "issues" (crashes?) you are referring to?
>>>
>>> We need to distinguish two distinct use cases here, which are both
>>> (somewhat) supported upstream: Running in EL1 with the Gunyah hypervisor
>>> with the regular DTB and in EL2 with the x1-el2.dtbo applied.
>>>
>>> # EL2 with x1-el2.dtbo
>>>
>>> For EL2, I think the 40-bit dma-ranges should indeed work correctly, so
>>> we could add your proposed change inside x1-el2.dtso. I'm not sure which
>>> issues we are fixing with that though (besides correctness of the
>>> hardware description). In EL2, all DMA devices should be behind an
>>> IOMMU. In this case, the dma-ranges limit the size of the I/O virtual
>>> addresses (DMA addresses) that are given to the devices. The IOMMU maps
>>> the DMA buffers to arbitrary physical memory addresses (including
>>> outside of the 36-bit range, dma-ranges limits only the DMA address).
>>
>> I've been carrying something similar in my working tree for quite
>> some time too.. The USB4 PCIe controllers have BAR spaces in the >36b
>> region, so this will be necessary anyway.
>>
>> As for the broken-firmware laptops, there's only so much we can do.
>> A fix for this has been *long* released, but it's up to the OEMs to
>> pull it in.
>>
>>
>> I'm not fully sure, but I think certain subsystems still have the 36b
>> address limitation (camera?), so it would be good to know whether that
>> needs to be accounted for
>>
>> Konrad
>>
> 
> Most devices only support 32-bit address space, and use a 32-bit DMA mask (which is the default, I think?) to only get 32-bit virtual addresses. Camera driver can set a 36-bit DMA mask if it wants to use its whole range.

Right

> This patch is about the physical addresses, not virtual. Every device can access the full range (without this, the iommu dma driver thinks buffers with physical addresses outside 36-bit range are not accessible, and tries to use bounce buffers)

Yeah this definitely checks out

With discussions about some broken firmware devices becoming more
obviously broken in mind:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

