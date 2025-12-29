Return-Path: <linux-arm-msm+bounces-86819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9D2CE6864
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 321F73007C4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 11:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1834B3081A4;
	Mon, 29 Dec 2025 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfPfSQtg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7xZC+xw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ACC303C94
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767007665; cv=none; b=jjwyiyo8UDoxphYBSH66LNEN0hErrnF3m9D2tG/VrWsH+Zn+kP7GpNe5bMGePAh2QPMuYSzJJ6INZo4X5mqfNA1EgG9dsf3gXawW/lyrKcIR7JgfBwWTf8cLOxVyuQOb9ueFTTcVJSKHyAxFP3riwMURrO0koz9FX1GHK49TuKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767007665; c=relaxed/simple;
	bh=WObA+dks64xaEtrytbG3j5Rv/oJhqbmRhFv/A9hCTAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcuUN2Xv5gf06UJx5mvT8KeTaOA6ub1voPyOpDZfWltvE4mcGkaak3dGccAfrSFdLxGG89Bymng0Q4xqK0eafWWKiiKbYW+7wBcL24YM6aWrrCyLJRBmf3E1BrO5zOSao8k68AdP4y5gwLGqzHgjgYkx4IRwNRXaHX2E09P8DWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfPfSQtg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7xZC+xw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAT9Aa032721
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3syCLiEhrdZKGo9br19+DmfUp0rg1BL4EKlnIdrz26A=; b=FfPfSQtgzjI422fT
	mqOjbq0OVIDPtYztQqeBYy1rCkRqTuT6HecrY52L+BX5e4u9U45RlsSC3S1ud2ss
	9NTXF88EI0yWltSyPGXb7tfoLkpiP75An6PJFLHcmbQcTP1fs9QNoGSkBt1jjLgS
	kIzubHELqFg4pXNvI24dJ401Loh9/EN87alm4lE9jK/W/+qUi6IkIMl1uPY65P0l
	0Ld9wBtNcTSVQCUXiYYHPQ8eALEUYQA5XzvBxI/awifUU2GYHHhCTkHcs5mjQtFa
	aM3gs3SBufejNH0RAHR2Ye7x9ZtIHh2xd9TzNWa0MPEXrqeiGaxy5z81qh7wp06k
	YbxXRA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsc7ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:27:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1e17aa706so53070521cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 03:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767007661; x=1767612461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3syCLiEhrdZKGo9br19+DmfUp0rg1BL4EKlnIdrz26A=;
        b=K7xZC+xw3xxq+2JsXufBHm8/lUcZ4L/K9w2QQoYMdDIUQqlsWrPFAH2naXk6mjM065
         GkNfD1v9wJl9YJkaTSoJJaoIuSu826pwvJVUZ/LbE8z0W7jJGyHIWI75gInIvdJ4eZEE
         LipKYdP9ZeOROk8OAfjGGY0RIf94k+vxzgYKBd1roaae/2R2GHzu8ReFJayxcyl9Ag3E
         YyrOAfiDWD0NPzkI4XSYQvcFsNxMtPJHKOVWo27rrGuorRH8VCIN7peE7pN7kBfotTQd
         pMf9/AAgrVPA82wLE1fqPgyqNDnqng4A/LguE6gjjTuaG+RNSh30pYmsv02wHaXbDlq4
         dCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767007661; x=1767612461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3syCLiEhrdZKGo9br19+DmfUp0rg1BL4EKlnIdrz26A=;
        b=mxTTyBnHj+1P9MQrBhXDHg13Hr26Vwa2qEjDSCv8OosRMfWx0ebK2pPyFPTbJaky+e
         eSkT92+BmFcVDoHLKMC6xCCSYf/KbipdxuOeAdtKk1leIduI6AJUfG8kmEa36q4rExpp
         Wyuu5spE4lUxFX18K/GFpCx7/kMRBNoa89SU0bj8xZeKHBYSp785BGqFVZ5dVlT3Pf+U
         hAF+bhefUK6HAXkTvmp9ZlNpDrpC6r7iHAyaTNBq+RqWkpNwW2xiUnYmYA0RbiTmfbXB
         fpMhj80Vjj49fhrrCjRlehztrksJlj3bpyux4Ui+zpwhzCZnpUm3Sj8YyD2/BnrQ+6T2
         x5AA==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZiBx5zrdLWtKLOFoJaUpUBZ4lVnvV8IOK62n76qCzS/AUs1r6W0AMNHGt3VaCzUgQXzhu6bPGJ1OAShS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqnt+rfxdek0GLryK6YxyDCewIIRJl9nrZjbLLfE73MWUwMt/D
	jSZrxxzWnqVI/1dGzrO8Yn1icqhD1cy2vSvgWTygheOL2lJhWRiY0MnwVUvJAikWgVDHkAWsAg2
	rCe0kj4unfrNTCtBB/4MPycOSi9R4oX1D4jFJELQ7BQ6lv1Ec1K/rO83JLpY9SPU/opUH
X-Gm-Gg: AY/fxX7KBR+X9dzhXpRP7RlBIBJBc98v0uLSIX/XR5o68PgnV91YOvuTCUAu8FmG7hQ
	+wSLbGiSRaUC0akf3JNCWPJwfUYRYLq7UWCC5qUiFdPgMv1tVSdR24nYQLwlwmLFogxJa2Lxsvk
	bFuRZfL1jIxt9xjpPPV+9zMrKw/UHfK7//n+Ob6ZdPpmuHTweiwU0IJz4GMiOsVfPJI0JmGlAGW
	BYWH/9LoT1568EaRiGxrG09PI3Rg2omAsdJ9oVX1Qu3kd13ssVrIsIaDcuLUfoQrACWnPOWA/Sw
	y5EfF9ijo8XoKRjLoe2iGhOeTudpgKPucSWUkqaW0BDn9SkI+2uheH/+6yTmcO2WJ8EqYxCpl8H
	SZu56qGIsXasExoceIJ1UiJj1beqo+qZG1hJl5cI5FnDbN4ac3Bii0r+9EzDW/X11sQ==
X-Received: by 2002:ac8:66c7:0:b0:4f4:b373:ebf with SMTP id d75a77b69052e-4f4b3730f72mr230786941cf.8.1767007661435;
        Mon, 29 Dec 2025 03:27:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLYx4q6ZCPo7waNT1eWVSPZKEBNhfrRIO+LW9kl+WvbNPbjmEswyxWsnIaY21qfu3K5oiKNA==
X-Received: by 2002:ac8:66c7:0:b0:4f4:b373:ebf with SMTP id d75a77b69052e-4f4b3730f72mr230786801cf.8.1767007660972;
        Mon, 29 Dec 2025 03:27:40 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de004fsm3365178166b.45.2025.12.29.03.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:27:40 -0800 (PST)
Message-ID: <8cac29c3-6b05-479d-a06b-583f9def7beb@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:27:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>
 <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
 <b8f0e8d9-449e-4f32-832e-f1d5597ff496@oss.qualcomm.com>
 <6421f044-2b07-4518-9edc-b9b2ef49f4fb@kernel.org>
 <8bcf058f-5bf9-46ce-a188-e94954101f2f@oss.qualcomm.com>
 <4f79d090-7d1c-4fb3-a835-a7e4ff96f79c@oss.qualcomm.com>
 <448f2efa-5b1e-4855-a62d-2e375938b36f@kernel.org>
 <19f46c69-fbfc-4129-98ae-fc5aef3f75eb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <19f46c69-fbfc-4129-98ae-fc5aef3f75eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6wLJ73qz388XW5_kF36IUz6R09zkmvS9
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=695265ae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-EYVSfHI5QxSVCcxwr0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 6wLJ73qz388XW5_kF36IUz6R09zkmvS9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwNiBTYWx0ZWRfX9gipVYCuxxhA
 p96foqgZI42SYaztzya8BCqkOd//HFa5Vbqw1eNsJATMcp25j4kKTObFKFc0Nz/mUSvil1H0uFR
 CubQFao3GzKFq57Mt2a8uy0iYZozpXpRiqOrEuMIJ6Xk2c22LedBboaJ4ksDhkuAxmwlqhFKcDf
 hZLQtzEDbKKXJAYf/jbFTtFyd+UPKvXB9AM5XzVslhpmFXafAQaitx9OdNLhn4mwh4Hj7Vk06VR
 adHbLbBKAucmFJpVkyjZyGn0csbxnloS9QZTVdnNAJo3b51swPb41kd84dWeijo6fZWP3baEEMa
 fzBsDhbwIfjfcisAGM+cVGScR6pDyDPIkNbsuKNlQwqUk+cz5Dml07GNDJdABj/fVbU8IOAVgxY
 gwyP5Zu5QDtPwhhPdyYnUnk3SWvqpBzE/5fo7jYKCeLofZPncHGyLk3WI7cV+icH+brAEtxPHUl
 9fDY9MxFNBn36guj7Zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290106

On 12/29/25 11:19 AM, Tingwei Zhang wrote:
> 
> 
> On 12/29/2025 3:21 PM, Krzysztof Kozlowski wrote:
>> On 29/12/2025 02:23, Tingwei Zhang wrote:
>>>
>>> On 12/24/2025 8:12 AM, Tingwei Zhang wrote:
>>>> On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
>>>>> On 23/12/2025 04:38, Tingwei Zhang wrote:
>>>>>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>>>>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
>>>>>>>> the common components into separate files for better maintainability.
>>>>>>> SoMs do not share actual hardware. DTSI does not represent what looks
>>>>>>> similar to you, but actually common parts.
>>>>>> Purwa SOM board and Hamoa SOM board share same design. They share same PCB.
>>>>>> The difference is only on chip. Purwa SOM board has Purwa and Hamoa SOM board
>>>>>> has Hamoa on it. 
>>>>> I do not speak about boards. Read carefully feedback and respond to the
>>>>> actual feedback, not some other arguments.
>>>>>
>>>>> NAK
>>>> In this change, the SoM hardware except SoC is described by iq-x-iot-som.dtsi since it's common between Hamoa and Purwa. Hamoa and Purwa SoC hardware is described in hamoa.dtsi and purwa.dtsi. Hamoa-iot-som.dtsi includes iq-x-iot-som.dtsi and hamoa.dtsi. This change could reduce the duplicate code and review effort on a totally new purwa-iot-som.dtsi. If we found any bug, it can be fixed in one common file instead of two separate files. Same idea is used in x1-crd.dtsi. X1e80100-crd.dts include x1-crd.dtsi and hamoa.dtsi.
>>> Krzysztof,
>>> Please let me know your opinion on this. This could be a common case for
>>> Hamoa/Purwa boards share same PCB. Share same dtsi file like x1-crd.dtsi
>> It's not the same PCB.  You did not really respond to my first message,
>> so I responded to you - I do not speak about boards. Then again you did
>> not respond to it and brought some irrelevant arguments.
>>
>>> would reduce maintenance effort.
>> Does not matter, I do not question this. Why are you responding to some
>> questions which were never asked?
>>
>> DTSI represents actual shared physical aspect and you cannot share SoM
>> physically. It's not the same PCB, because you do not have a socket on
>> the SoM.
> I didn't make myself clear enough. The SOM PCB I referred here is just the circuit
> board excluding the components on it.  Let me rephrase.
> 
> Hamoa and Purwa SOM boards have very similar hardware design. They share
> same circuit board and most the components on it. The only difference is Hamoa
> SOM board has Hamoa SoC while Purwa SOM board has Purwa SoC.
> 
> I agree they are not same PCB since the SoCs are different. 
> 
> However, I still think it's better to use common dtsi iq-x-iot-som.dtsi since their
> hardware design is very similar. 
> 
> I'll invite Konrad to chime in here as author of x1-crd.dtsi and Qualcomm SoC
> maintainer. I think we are facing similar case on purwa evk and purwa crd.
> Align to same strategy for device tree topology would be good.

Hamoa CRD vs Purwa CRD are literally a just a SoC swapped PCB as far as
I'm aware

Konrad

