Return-Path: <linux-arm-msm+bounces-85543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBDDCC8AA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6684130194F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B752D350D77;
	Wed, 17 Dec 2025 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZROMkXAm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hd2/IzSO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0875534FF6A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765986618; cv=none; b=uxJ8SGEDg7FXI8C8VDPMspBB8dvZoGZgoBV7hRFWfegzSKCCtO+5X4FgX0pB3/aTZi9mY5mx6lUcoePwGNfNzc6HajZ1oFFBQyPCv3GaIpP64u4zzGXjhBYxqvFOQy2Lqkjr/NdGIMsKiKbEW/TeaxTL9kNgghAFx/Obn3fjLuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765986618; c=relaxed/simple;
	bh=1s+bHStxcwWIMOXM5pPxuiiHoOVEg7LkK+jslEE+r2U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KqzZtIGtKGuqTL3oSPuazbFI9rRTf1JjCgh+aiH4EGzcQl+zDuI+QsIgwMOb+Hbg2X8pxrO7U+m1HON7L6qUSXOTpbz7PVk+WDJtwyNrS8cxwjJBT0HsxgzLxWrV6IrBcnyTfU0E3F4HHplqkTLdMRuX4czC+lFeVkaqM2+lFeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZROMkXAm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hd2/IzSO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHEvTqS2720284
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/4QUxKEjBHYMFtRD8B12B6GRb83HFUlJRIfmrJQpEwM=; b=ZROMkXAmbm2IsDnI
	4ECsX2JKtHVozHxhBLD4PW2offnD/XuZtaBj6Od269XDrVeHRBzGNcWft199wHBz
	CofjgMh+n24IpVdOcCVuSMZAfEC10SgBkuPNACQQSFnOvnhOwv8GMv0G9acMbnVG
	f/d6Vmyx+H+F25JYIkUiZBAJbZ5rhkh26OrSj12oG+WaCmRRy7D5qx4CHrmgooNj
	Lzi1ASxPFxlHR9n2PWGppnMU5ZetYLgzuT8etttd7SJ2YG14xpPZS/Cq58r4PYPA
	vak21KnCIPzeGCp6cd1znoUfrNxLac9tpD50/GOpkjLB0ajxJ/RrXYa0tDHdXQ3J
	K5uOAg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr58511-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:50:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29da1ea0b97so151075955ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 07:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765986615; x=1766591415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/4QUxKEjBHYMFtRD8B12B6GRb83HFUlJRIfmrJQpEwM=;
        b=hd2/IzSOH93KEs549NNK2Rd4IH+iHs0Zyvjjyfy2QHRngpvMuIUoVZHy72pz/8YWI6
         r0fSwXslB3mODrFO3qc4U7F0Px9vyz49U4Zj4SoVEDBFpJIqDUl81o6G+XpvxPd12Ehk
         bvrLvvHA/+cCzPr0DxrIkMxjzsYwIEng1uLLpOA1tVtd6vb0pBbk9CcwVnKZWiiTLUr9
         bxKdKSNMFTUEfUSq+JfCIvDqJR+MaMluJ7Qb04BF1GKf2rk66lh/Ijum4uOlYaSU+uVY
         a52XcpbVovD9syAm45YuCSTwXapp8efOfwoz1fDb3TnO8lJWHx5RSHg0w9Pe8S5IlKXk
         r/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765986615; x=1766591415;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/4QUxKEjBHYMFtRD8B12B6GRb83HFUlJRIfmrJQpEwM=;
        b=jDLC9t+xfi5AWPb68Nxpp8oPPZDmfhhjbPKrzsD/6m7kxJYODKibnITAeDeS+g1TIF
         N97dDqUplQl0Mqn8ZvZYO+iTtjvelC89/dcMn42/KI4VKtu68Xcb0KDKxu1fwkf/o9Bx
         DtrnKGVOz+vxBNHNn9/OTrLNVQWzdU4h3X2fSupZZCSm/VxbilQbu89Hhoe/bUMvZo6Y
         lEJkt/S081e7QkyeofxW5O+o11ssvV6BzhRilhA4ynCT+7lNnnHKUp+PYfH/BqXIRQPi
         x8QTc8KlzGSW9QC2fmTkIWAIEOHsvuEiFXENv3NIljYb8SKvT2PlZut/oFDKVdyiLezK
         06Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUANJdwvJps/xItONmTu3hE62RiFi+yGvnAMLlVquh1LxVE55b+fwEvCJR1VEQML0vWf4dDymOJQKTalvYT@vger.kernel.org
X-Gm-Message-State: AOJu0YwpswmbM+nBD5g7Ju5Uo6fVPPzGQFqEhOZkLlCIC4W88GGC2VZx
	KzYOOzXu58BIXF/vEwrcqUlRauxES+r0tP4XhpbJZ1yaXNcuNOkvTChBiUCJf+JHsuUrhBGnVK4
	rQqo+tRpPkGAEVGuDtzwIirqpegHMzHZocw5I7Euqv1Kb1gu3Tw+fMPpCgpEkbO2lzYBj
X-Gm-Gg: AY/fxX5pN1ql9kkn+5xCacCjINynq768nUWDIyMShNkhqffk7VTehlE1NVb8wvIYitn
	8Eep4LyukWUH0xqhmTuHZ4tF36HFyty68UIK7l8akkEjyE3eP/4/RbjtuWkWTBOCbryTFlqBykC
	pRSa0a+SQQNZifu72ZeWznTtzawQQiC5PKI44oGJ57Kdqr10ICDV0UjeDNW5nUDPeZ+y8pUhY3a
	Hc6v2QaB3Oc67yMrryfKJBTu3DUZ3oW7Y5nevvqQ0nbQrzVJK293v/CbsvS5abglGGeSM8/WCg2
	J91B5dmKxZtStu0AH5sBWFMHR9aDvf/03JkecLD4hCd9Fsp5E7Na/p0jXqJigjAXaw6gmyKSs29
	2uOyF3b9wYjokpruWeOvjzC8Qc8wGlVtJdktQ1nwybYxp
X-Received: by 2002:a17:902:d2ca:b0:29e:9c82:a920 with SMTP id d9443c01a7336-29f23de51d5mr215098115ad.6.1765986614714;
        Wed, 17 Dec 2025 07:50:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGr/NSSNMw40CeleOvDZ7LwBtVWgIRZm/LTuLHUAln8GG63qNEMGWxH5P9/R2/azpWRzoGFw==
X-Received: by 2002:a17:902:d2ca:b0:29e:9c82:a920 with SMTP id d9443c01a7336-29f23de51d5mr215097845ad.6.1765986614252;
        Wed, 17 Dec 2025 07:50:14 -0800 (PST)
Received: from [192.168.1.8] ([106.222.232.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0cf143804sm112063765ad.73.2025.12.17.07.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 07:50:13 -0800 (PST)
Message-ID: <e5cef414-912e-4387-9a47-494567fe2360@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 21:20:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: talos: Drop opp-shared from QUP OPP
 table
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@linaro.org,
        mukesh.savaliya@oss.qualcomm.com
References: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>
 <ivinuu2ofm2hf7jvnw67gjfwo46bepunconf5g4kzdcaxs4jvm@6dm5btokf2zi>
 <efec8f09-8bb7-9739-5a1f-ce4a1c54771e@oss.qualcomm.com>
 <nm4hiy6vd5b3t65dagjx5m5qjfjdcnehz2s5w4lyu44eaqnwkc@hnmyhokxufz5>
 <13ea5fd7-b28b-b6c0-752f-a7d4b4677298@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <13ea5fd7-b28b-b6c0-752f-a7d4b4677298@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l2b1QkJ5SHNI-qv7QJ8bOcL73Mww8Spy
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6942d137 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=00/2rs7gRTLD851aB34Rjw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9lPpWIWHvWp9pA5eUzgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyNCBTYWx0ZWRfXzGweSSfDqxZV
 srOZdFypvyrwKcgtwojrH//v8FZAruMzmD8m/ZPImZ4suHjNbv453+v6CJwf1Or3g+670x7/k2g
 7Rxe/ineW5N+5pPQ7dS46JMSN4ve4JKfUEfb2ONDBLip+Tz+cuzLEpy/wnV2dN6mAIqURv9ECDL
 S2fmVZ9Y0qXy8ZCzxNxjOZs1WofexhwBNEugiPSZ5Xz8z+Hxx7FAso4imK4XvGSxBWPYggFwQqq
 4ezlXJKelIugPBqk0kZ15NkDGMgSx+uxYmuqMx8Wqub7c7iNvYl2T2o9ImabAWFXLCI7yLkbniE
 pSxymV1qlQBjo4scT+Pv+hUk8amoyJT1GAQZCEweEG0K0M2vCC6UNM1Lwy5f23wBD0Z4S+3LMfE
 DCZYgk+k9CgDpwF0JiB8LvLjaEd2qQ==
X-Proofpoint-ORIG-GUID: l2b1QkJ5SHNI-qv7QJ8bOcL73Mww8Spy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170124

Hi Bjorn and Dmitry,

On 11/24/2025 3:10 PM, Viken Dadhaniya wrote:
> 
> 
> On 11/21/2025 5:33 PM, Dmitry Baryshkov wrote:
>> On Fri, Nov 21, 2025 at 03:37:21PM +0530, Viken Dadhaniya wrote:
>>>
>>>
>>> On 11/12/2025 1:25 AM, Bjorn Andersson wrote:
>>>> On Tue, Nov 11, 2025 at 10:33:50PM +0530, Viken Dadhaniya wrote:
>>>>> QUP devices are currently marked with opp-shared in their OPP table,
>>>>> causing the kernel to treat them as part of a shared OPP domain. This
>>>>> leads to the qcom_geni_serial driver failing to probe with error
>>>>> -EBUSY (-16).
>>>>>
>>>>> Remove the opp-shared property to ensure the OPP framework treats the
>>>>> QUP OPP table as device-specific, allowing the serial driver to probe
>>>>> successfully
>>>>>
>>>>> Fixes: f6746dc9e379 ("arm64: dts: qcom: qcs615: Add QUPv3 configuration")
>>>>
>>>> This was merged 11 months ago, and Yu Zhang added bluetooth support 3
>>>> months ago. What changed to break the QUP users? I think it's reasonable
>>>> to use this "Fixes", but we should document - at least on the mailing
>>>> list, where the regression happened.
>>>>
>>>> Regards,
>>>> Bjorn
>>>
>>> I’ve checked the older Linux versions and found that this issue started occurring after the following change:
>>> https://lore.kernel.org/linux-devicetree/20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com/
>>
>> Hmm, but it's your patch. How was it tested?
> 
> For this patch, I had verified only the I²C instance and compared it against other SoCs (like sc7280.dtsi). But missed to validate all other instances from  SPI/Serial.
> I realized now and will make sure to test all possible nodes in future changes to avoid such gap.
> 

I hope the above information addresses your question. 
The current change has been validated for the SPI, Serial, and I2C drivers,
and it is functioning as expected.
Please let us know if you have any further queries.

>>
>>>
>>>>
>>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/talos.dtsi | 1 -
>>>>>  1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>>>>> index eb6f69be4a82..ed89d2d509d5 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>>>>> @@ -536,7 +536,6 @@ cdsp_smp2p_in: slave-kernel {
>>>>>  
>>>>>  	qup_opp_table: opp-table-qup {
>>>>>  		compatible = "operating-points-v2";
>>>>> -		opp-shared;
>>>>>  
>>>>>  		opp-75000000 {
>>>>>  			opp-hz = /bits/ 64 <75000000>;
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>

