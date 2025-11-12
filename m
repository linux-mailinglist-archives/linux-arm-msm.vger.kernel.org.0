Return-Path: <linux-arm-msm+bounces-81434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AD7C52B1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BF274E2429
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A11222587;
	Wed, 12 Nov 2025 14:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSWdgjYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="exMQlao9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C92E1ADC83
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762956264; cv=none; b=Z8WysNZ8kcuUB9Hxe+yfWNwuQ6xKFfxahs9Pr9+pxTNqLIqNdB9nbe1gXn3F7gr113MulkrPAojAl4VkFjQMa714EBPqqNVB4HLver1XLz5iIGUxVoQOJOTW5PWG15AdJd9kUhcN1nQE3yvKIDtVjJeRh48o5vgJgnJcZU83pt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762956264; c=relaxed/simple;
	bh=OAryLYQkLLUmB/WMe+NZx5UWRsH3+TBfVnEaugxiuw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOPRDETHfuDZXUJk3GrxRD36Z9EgA+P4wTjvsPpqqmfJcFkhMbe5nZHrfG97Rxf3A50zh8G8Fsew+OqAY15aiTELrqoaMM7XhBJ3bGawxfxtGlPvRbOE3nA2c6gAF+T13YdSwT94HQjtbbEnSDR3AXcMPJFWVlSP+jXYcWC1wWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSWdgjYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exMQlao9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC7batW3503482
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTdtyUKWWBMzxYsC5nXPivGVgsscMtomVbfKa/HEHHo=; b=cSWdgjYkemJrNc1g
	pFfqjO1NFr+lWhKcYSBN7fNg0B9phMoU5W7dun4wLxb4ZFE12v6b/qKyaFp1z+dh
	pI3/hIHiz4SZqa7t7qWngw21byrArSI5wl3ivV1IRxI4VuIwTyj+HxHHT6182eNZ
	BiYCPXszvnAGl7xVByzRqLw9c4AntRPbjLeb8F3P8hVYotjfjT61CEKh6mVFSz4A
	wg1jy04dv8QNy1J7vR6T4BMUZoiVJ5dOqJeI4m68iIzg33F1GsFOhe5Vb7qe43/g
	PDlJm8t4vw4a51B4h4ZbmL3tqMfjC4a6EoP6PPyR7o+l9nwCWno+z9i6gDKe3TAP
	FG8EXg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acdcc2pjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:04:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29558b13bb9so1572035ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762956262; x=1763561062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTdtyUKWWBMzxYsC5nXPivGVgsscMtomVbfKa/HEHHo=;
        b=exMQlao9vmv1JyHEaYYaFiBzrdQxRJBDXfnE1A70LlfNG5XE5Dy+9Ld/Rc7+UFxBNk
         mgcvetZfaDsxPNVlC3BIrpZD/bdm3Qi/4vxdZyrK9MyI9yFs1lpXPtSZthexF5uFawpq
         m0Iq0GZneJTsY9GfU2MDz8Wn/fHzoLu0JlYPuYN6eZHkscLBnj9FnUev8M/uw+YloqGc
         hp0dzbYsYierB9+P3zAxszxcZHMMTmgbrmYRFge4WV4yF3xVShp3LICHnQgMzbTDCIC1
         JFpFih8MKUfffeRMgiAgodCKvdWGTS54Fx2Sbo00OP4WCShiSTFy8ubng8rneOecEsJt
         TUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762956262; x=1763561062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTdtyUKWWBMzxYsC5nXPivGVgsscMtomVbfKa/HEHHo=;
        b=l6IPfHRUVvEC0Z+Lxypm7pohNpcMK8BdsB2t0MQreONVFkT8yR+0Se3L832Tl5wTCE
         pHUk19VxwL6MU6nueMlKhSGpvJHaD/yrLl2hG+0UQyBlgamDNa+upPP28X+iaI/X+N9x
         Umycrm3Go6WcaindsUr7ixMOTdyhDV/WmOgpp2HnqM4VfQo0xYaKh9ITTChN5GyYauF4
         LpWhSMeABPqZbFQGyVoN5nwmA6OKictTz1fi9JZnpneUUibKE0n5wUeOPb/64Prps+LS
         0+fnXG/1O11AbaZNMWzUjRu5K59FtRJvPkTie0LPRk8hw+MvoW02oiOqbJ8FlQ61oFfZ
         8k2A==
X-Gm-Message-State: AOJu0YzpR9BJED8MpLdHWtMLBqW2QZCY6jSNb4lfJkJrs7SDn0kE4V4Y
	4/aP9ZsAX43RzaUVNAPkfgRgs82/MTdpDeL735Vu4RK3qQuh2T/RQmrKKp5q41/XEstpCoSeCHa
	+A2Kwk1LRVHjoMoZcdjzBNnCSmhpY6qDObz8wa5sp55w9brRCRy9HtY/SwMU6N9bK5mqs
X-Gm-Gg: ASbGncv75MF1+XGqtcmC+deR+oRdTElEDZO83AmNAqyRiqZ5IDFJnntzfLqJQTOobaJ
	b75qGSR/RYzP9gpLMmbQbnrLcOpVkhq9PbLKn4/9X2TisI1BgqoMblNTOxhkqO/XQ2n2u9SNywJ
	4qlIK6f7OQ/xoDvsSkwq9Ezd4ilhyaUhrTtjdzLguo8+OkCxMypw0GThj3Z2L24bQpJULt5GmyL
	d/mYA/Dni9UPOFvCZ54DufHAtQD4CLtpdosSBGP+awcZNTMFZgEJSDHxTZjd+O156YYJ0cfXVag
	sV7waUbyCXQLy0+dKOrH1ocKwcM0omNr+8y9jaYPAn9YSBjavHWljPau/NpDMBotLfsgY2HnYIf
	LrFQF8fUafcCu3zr78kVvttDvsJ5KdMOUq+vNYPFNYd+vlKrMNN4V/6T5
X-Received: by 2002:a05:622a:1209:b0:4ec:ed46:ab6d with SMTP id d75a77b69052e-4eddbdad3damr29223851cf.9.1762955569064;
        Wed, 12 Nov 2025 05:52:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcy1zE3l/tMASsQZC9DN852+GpFxCEn0w3eDqVGBouDX1a9/hlv2AeSAGGjvnQlClfa38f9w==
X-Received: by 2002:a05:622a:1209:b0:4ec:ed46:ab6d with SMTP id d75a77b69052e-4eddbdad3damr29223501cf.9.1762955568364;
        Wed, 12 Nov 2025 05:52:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf723172sm1585335666b.32.2025.11.12.05.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 05:52:47 -0800 (PST)
Message-ID: <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 14:52:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
 <07066c46-4121-48da-846a-3a180d245589@oss.qualcomm.com>
 <47b40a91-8365-4431-9fd9-1e48fad2a4e1@mainlining.org>
 <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
 <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
 <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UmaYaL_r3yIMeqASOrL-OaKl2oupsG3F
X-Proofpoint-ORIG-GUID: UmaYaL_r3yIMeqASOrL-OaKl2oupsG3F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExNCBTYWx0ZWRfX6x4BMh8mp20s
 FRMaRJC2qOnPdGOat0w28fGqFeeqrjKmnVJLWcgsnqQdm9SWtaV1TMlqs1GXXzrN8eD+J9QDLhS
 9RouIZkZkcJhLheGzKSVZZgADV0SEgch7iIspbTT6UHLHQ7wLPVBF6MnaOLtwC2VrAKx5TnaNnF
 JjcGdIx8HVLWD1OPEftM3Ngq4zNr0z8GmNHq465qpCBDz4eakusBQGtA9S8aZTze6bOLkfHLhUF
 tGYfG6e2LG/bZzNKAFUTZCDsUVy1SM81xJWFT8SoOb5sjtb2mpheN2/0nX7VeGMgN1u/vQ2c1a+
 qetWbY12wroT8qiA0CMGGd/EtH75dNGc2u+fuxGSWmYwXKfQ40a/4aeWb1bFIxhoeABuDaMiov0
 6IA3sV0MdxL4fOfk33jmeAoO459/CA==
X-Authority-Analysis: v=2.4 cv=L/0QguT8 c=1 sm=1 tr=0 ts=691493e6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=eRqVM4IRrQ2YyvCDTyEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120114

On 11/10/25 6:41 PM, Srinivas Kandagatla wrote:
> On 11/3/25 12:52 PM, Konrad Dybcio wrote:
>> On 10/31/25 12:30 PM, Nickolay Goppen wrote:
>>>
>>> 24.10.2025 16:58, Nickolay Goppen пишет:
>>>>
>>>> 24.10.2025 11:28, Konrad Dybcio пишет:
>>>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
>>>>>> In order to enable CDSP support for SDM660 SoC:
>>>>>>   * add shared memory p2p nodes for CDSP
>>>>>>   * add CDSP-specific smmu node
>>>>>>   * add CDSP peripheral image loader node
>>>>>>
>>>>>> Memory region for CDSP in SDM660 occupies the same spot as
>>>>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>>>>> cdsp_region, which is also larger in size.
>>>>>>
>>>>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>>>>> related nodes and add buffer_mem back.
>>>>>>
>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>> ---
>>>>> [...]
>>>>>
>>>>>> +            label = "turing";
>>>>> "cdsp"
>>>> Ok, I'll change this in the next revision.
>>>>>> +            mboxes = <&apcs_glb 29>;
>>>>>> +            qcom,remote-pid = <5>;
>>>>>> +
>>>>>> +            fastrpc {
>>>>>> +                compatible = "qcom,fastrpc";
>>>>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>> +                label = "cdsp";
>>>>>> +                qcom,non-secure-domain;
>>>>> This shouldn't matter, both a secure and a non-secure device is
>>>>> created for CDSP
>>>> I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
>>> Is this property not neccessary anymore?
>>
>> +Srini?
> 
> That is true, we do not require this for CDSP, as CDSP allows both
> unsigned and signed loading, we create both secured and non-secure node
> by default. May be we can provide that clarity in yaml bindings so that
> it gets caught during dtb checks.
> 
> 
> However in ADSP case, we only support singed modules, due to historical
> reasons how this driver evolved over years, we have this flag to allow
> compatiblity for such users.

Does that mean that we can only load signed modules on the ADSP, but
the driver behavior was previously such that unsigned modules were
allowed (which was presumably fine on devboards, but not on fused
devices)?

Konrad

