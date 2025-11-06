Return-Path: <linux-arm-msm+bounces-80496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B38C38AB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 02:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9FA81886D95
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 01:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FD31FE455;
	Thu,  6 Nov 2025 01:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzy7c9qd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtlciZRz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A680E1FA859
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 01:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762391708; cv=none; b=nnLODgD7N9GGEywNkqHW+9T64wV/++ET8fC2w32VR3GMPTzNb/HiNFsUEU/dby6r4TsfkFdzuogHKquIXcZsDTUBC8gj5FZnXzanYdq6uHu2IrZxDtuc+5Ca2s5I0ITrXLlagBkhWSMgG+/ue0j+n+ull1/gO0GJHgP33da0anU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762391708; c=relaxed/simple;
	bh=YHQ2Z8cvuptFnDiVEnJIENka4AntZF+cyo3DYJvNBDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sb8qL3pzdr7GQHxO2ogB0TZXO3FuoVCE+0R4bRO3ewQEu2CTA322trv66bgUdTT4P5WSG1s4IMbQbOb2BggzXlBQf5fw56jmHAOKiXfNVSRA3LmhKNRUIsMvzA1mN8mrf/9kAyQn+FYr4WdHc4SsgQVJEt6GUokQORGHU7Ptfkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzy7c9qd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtlciZRz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5N5kE82148405
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 01:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Y78qYNjDrbqNCW1Q25hl9wSuOKQlC4UcToVsEV3+Gk=; b=dzy7c9qdMtRhmsDH
	BwSy5I8lgO7vOVuAvB1ACzB01Zkt6zYcR3kFIUr5mzSCRxNVhG75xC1H0ptv7lwG
	jy1PZZwn5q4rAAvdgl8xl5wa12kGqVqa7LYOjHPL3kFWg5MmcjJZ93POeVn/eHCb
	P85Hkr/vcnmHCf20bNM55XiabpQ2oi3p71Oyy2hfz921Fvl8pC0jcaaTYls2pBVd
	fgPrqxcYSaNdrRiwU0IB+WvKl4yJeJKP8rE/iB2jsEV+ODOTgG+J2+NPmpcsfRWk
	T6WOq+uyYEGydBTP8C07964aWAvD6zCnrzL8nKJzu/r9VAYYG291wIHFAuPtH8Ht
	6hcfdQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8fxvr9jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 01:15:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956f09f382so3921655ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 17:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762391704; x=1762996504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Y78qYNjDrbqNCW1Q25hl9wSuOKQlC4UcToVsEV3+Gk=;
        b=GtlciZRz+m3xGlq9iagjGsxRl2yMeYaJzCxvtrrjrXySqaYm/GfzTxgqCoOe3v+bDY
         VUxr/+JXqhZaDB20y3N5mfFBvjEzxOMnsB+nPizaCNTCfaFyeyd1epmxeeyAte21pedw
         6ri8BYdACEfhr4QyWJJE9KXzD7LpdhJ4kGpRhLchQgF791ZJVbarAChJkHrcrGZppC8S
         UfnTZjpZWDAMi9ffae8slSuuA2n6Scmyd6fDgpm2qCUFjHTxWeSdoRrCatxDFOek9Lzq
         OAInO0WTdwDyDtjfzlUubT55knqts7WRepBtg/PM4KlgTb/Av/eWMFBUF/LKU7tN0OWY
         suaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762391704; x=1762996504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Y78qYNjDrbqNCW1Q25hl9wSuOKQlC4UcToVsEV3+Gk=;
        b=lY7ad9m4jOIgDPXTlBVbLuNdHdNH7CstSBMEOh/7bTcdlK+UiOQJYtmjGoLACh/VjZ
         FS7KElobSdE0qVD1VvZZ5TqfUpRtfYixZrt2/y9/UA76yMU2BUdWUapIl6HJUSV6nkE3
         +f9jjs206pGAhK9yDD0pu0dMM1DmXc5s+5AWDojwVZw7PIKzcbxqvRLU174e96rz08ot
         klcUmyK9Yx4kJb1MtScWLEldvtntJaT8GR/ivjCQV+zA/9NADfSwwMgFYqJATCiLbII3
         QcO+Rgm/6i3BQmezrdwP1NsdsJT3c/lAoqYIRlbEJxI9VDMk9hhICpknjm0AmmRXyU0e
         lANQ==
X-Gm-Message-State: AOJu0Ywf5C8CFxdKLWVD6VhnvrQlUOAC4YPTDuvwSbVo6MT1Dd1m5FAv
	xdfmlyqB3d9whH5UEcMUer6JBEaUTO3+ADLZkfBS2iyhjAMLo+d6wDsxenRhXoDhCj8aDaTOScC
	gjz5LyjmhF8Qfnv6OulJLwWIVrGwEjANbhBTXV/RR+mS1g88139UaUJMCkg9ZWKA7ISxa
X-Gm-Gg: ASbGnctESP27cKKfquAXhkvjLVzyGw8LcFeuJbKcvVBC0lVQePveOQyghhNVoGpr2lF
	b7K87m0xYJyWf7WRV8khbazQawTdnSY3mTnYjNDgiW3def5K8VDCywritoOlpZ6SgQaP8vO84St
	Q8sKVM4Z0yaheo4tP6e4DTp2jtB3casLQ0fK7JadXR0+a8hG6A/Rv37tX7nhenH7Pu/8fBNP6qQ
	i7mC6k033h8O8ot+iuJdA6o1NNTawDDKp5XTr+Yc4U2jRzwVBNlRX3w4uzYHVfbeKcK+I4le75B
	CLdedmng/pCCLZ/02nDZrC/9uzdmoDHPepq1EvyiIS8so2yNkAsmlZYy7zjws8PiGv0kTSZ9lap
	kFZCpBWUHjer7F75ozTn86UFLCJG7LBrquGqSuuCXCerRtURkqemRTTHl2drmkIVv
X-Received: by 2002:a17:902:d4cc:b0:295:6117:c597 with SMTP id d9443c01a7336-2965084026amr18676365ad.5.1762391704347;
        Wed, 05 Nov 2025 17:15:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMt8SljTKnN1uEPM9OZaqaoc8Hpel0dHroueOM1vIorT5unBLPbz6+6oK37/HktIzT5D59nQ==
X-Received: by 2002:a17:902:d4cc:b0:295:6117:c597 with SMTP id d9443c01a7336-2965084026amr18675675ad.5.1762391703682;
        Wed, 05 Nov 2025 17:15:03 -0800 (PST)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d08afb02sm323024a91.0.2025.11.05.17.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 17:15:03 -0800 (PST)
Message-ID: <f9dd8e69-d95f-4052-9604-aabe4f44c6c5@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 09:14:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
 <20251104-enable-etr-and-ctcu-for-hamoa-v1-2-af552cfb902c@oss.qualcomm.com>
 <25b7abfe-1881-41e5-914b-ee16ce63ed3e@oss.qualcomm.com>
 <8a7dd1b4-505a-4507-8cc1-75d955c706eb@oss.qualcomm.com>
 <7affc5e7-14b9-4959-9943-40e416f64d92@oss.qualcomm.com>
 <a1694c50-47a5-4f5c-abb1-6fec7a490e7a@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a1694c50-47a5-4f5c-abb1-6fec7a490e7a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAwOCBTYWx0ZWRfXxRVdU0EWxhG0
 oEYkSmF/G+cXAr15xbKNUhn91ICj/9Pfg9kr4FivmRrIRX40vZr9b8sJ0LHOE961wPsWhLTBsCr
 KlpnTxIzYLcWBZ6AcxGbMvtcEWhZ1sA73MEuXt+IF76xaBO7IUUMS0AdSJoSCo0TakgpJEPEpj0
 l5rZPXxkv09jDVv8KO6KXOLIH+rPBsJuFbUQtpq+KM4YdyoY3sJ9F8J66HGhHL0T2VAhZS8yVY7
 sFMuiaIdF9ewOODJCa+C55k+4x7FATp286kspH2aA2lWkH8wMIeS6A+CSLO665KypfHEc46CHvN
 bId3WCUeKKMA0fWw/mv+kHKVgw+1bYi4QFlUG01HX9sJxWF74+RWIUyg9Rjaod5Wu+IVVG932BA
 s8/ZrU26tJ9xtanPcreX1NRmquksjw==
X-Proofpoint-ORIG-GUID: jPlcaUFASbScJSDy5gFsqrjdmm7ZysgF
X-Authority-Analysis: v=2.4 cv=OZSVzxTY c=1 sm=1 tr=0 ts=690bf699 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=z7gAgxDoRBdO-O0LFwoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: jPlcaUFASbScJSDy5gFsqrjdmm7ZysgF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060008



On 11/5/2025 5:17 PM, Krzysztof Kozlowski wrote:
> On 05/11/2025 10:09, Konrad Dybcio wrote:
>> On 11/5/25 2:14 AM, Jie Gan wrote:
>>>
>>>
>>> On 11/4/2025 8:47 PM, Konrad Dybcio wrote:
>>>> On 11/4/25 9:10 AM, Jie Gan wrote:
>>>>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>>>>> tracing data from source device.
>>>>>
>>>>> The CTCU serves as the control unit for the ETR device, managing its
>>>>> behavior to determine how trace data is collected.
>>>>>
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>>>>>    1 file changed, 159 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>> index a17900eacb20..ca4a473614ee 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>> @@ -6713,6 +6713,35 @@ data-pins {
>>>>>                };
>>>>>            };
>>>>>    +        ctcu@10001000 {
>>>>> +            compatible = "qcom,hamoa-ctcu","qcom,sa8775p-ctcu";
>>>>
>>>> Missing space between after the comma
>>>>
>>>> no issues otherwise
>>>
>>> sorry for the mistake. Do I need send a new version to fix it?
>>
>> I think you do since Krzysztof made some comments
> 
> 
> Not a technical ones, but about the process.

will send a new version to address all comments.

Thanks,
Jie

> 
> Best regards,
> Krzysztof


