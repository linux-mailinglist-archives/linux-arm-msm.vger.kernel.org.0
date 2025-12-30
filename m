Return-Path: <linux-arm-msm+bounces-86893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 941C6CE870B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 01:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93158300C178
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 00:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B7A28641E;
	Tue, 30 Dec 2025 00:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URbNJSNs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAdzJgue"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A7013D638
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 00:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767055722; cv=none; b=Qnrh44IfML2fEJlU7TdWZ050czOt9BMaQSHxdTgmE6zlMGJyAdqB4OpwSEGtN8sKKa4ntQnEAnoovGONTj88M1pMhkH24z/7NpvM0MggbNIDdIWUgAJ1CcqF56pkdh/naQ0eBt6NQKzCTO5VjYSOB/M4TSPiSVL7VwEkp1RxRAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767055722; c=relaxed/simple;
	bh=SCav7Xh1WOgN3JTknxTrlyeaLMPfl6Q8XQZmijRLiK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZSjbyClkh8ILEZXtrKN6L41cft9lUCfmavH0eQfhUIAX9Z7WH1ACdI0KuIGraMR5pLM4M+2ocxlULFN2yzSw+MJBTb7jRggxCKen9JAOmsOxoSx411U8JqJC9ITN5zz3e5YJpxgr6+AgWwc/JvQj+gN3Rvlgqo13CF9+zS+ofI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URbNJSNs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAdzJgue; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU0k0Qo2672752
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 00:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y8GM0Fp1UaT9GVrANfYfNHw8unV8Ol5iqYkldQaK+ZU=; b=URbNJSNs1znaniOK
	h2VcdVwdYx16hwcrs466rzvAqPmYRn8e4OB1JS1y4KtQE3Wdmh+zqo7vVN69vrvt
	ALGOoaPmnwmftkpCL7idkqDPExZo9PdsNu5I5JayRZ1DTGUJMp2EWqtwdcXB84V/
	mTqVjISIhXXMZ3wxpa7uVPWhotA0vFkF6SRY1VbqsvVbvsrcjkVlb7jKGcAerzqY
	p45vMhEccR6JuLDskpgrXYig0eWipVCoBzEqaiUBstcSjLib6/zHOPGY1z5A4QAc
	cn+pakJFxETMGWiuHLZagxgtdyj/WmlY7SXljsqPtDm8486OEb3jt99mYEMOuwIF
	Q8HpiQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fcr04q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 00:48:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso10798509b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 16:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767055718; x=1767660518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8GM0Fp1UaT9GVrANfYfNHw8unV8Ol5iqYkldQaK+ZU=;
        b=kAdzJguemda6JBER8xp7WN8t/vqOphaOY9HZYyyf8vnJ+ffRE0Y0A14CJc6ZE8i4NH
         wh5rEXZMH5Nq5jkrHRlEP1pMigjkQ4VvqhctlXGZawavXIw0POi+OlKMBAf5jcy52nYV
         mn92qFHEQU7NjwoXvT0zwrm2bTRntGXD75tBYoMO15OSvBkaEtVzXtQMhLguNsSVo3g2
         VWgr7dLJozhQXLhUk22Ghv7UXG1+7bGHrvXwYYHKtULa+XR1oQZj3hojpC2iz+xjdxyf
         87hJ8Ee1+3ZOJmapUeFxTEv6wpNlsBWVsTZ+Xbs0sKBedTpL40LZbI0lEH3OPAUKaPYq
         kxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055718; x=1767660518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8GM0Fp1UaT9GVrANfYfNHw8unV8Ol5iqYkldQaK+ZU=;
        b=wYqIdktJZyqg1lyFfp7cOS/VioaZS0kazqeX8b22UShQDtAd91KCxzLNdHGiYOdf8u
         ngOGj4A1Io1IhaHN748mjPnU1btIF4knJYe1i6uguyVJm9lWIpnHn7zv2IgOHqII6mIK
         PUYziKWH0DGtFDT1rl0nl15NW4RiGsRTJPBV4OuRYmgYk7UbUdPyB8auM4clQ3CdrxeY
         rFVHIvkP3CVSuo5sobD87k8TChQhLmZmykdBSLfMMZWtmINtM5agAzBSHOz0E+ecDoLi
         XUS8pIJIrJvuKQE3IAnFGXonEJCy/3X8GXmgq8FP3cQ7XUzq+nXqszV/d4JXoSwt3K7Q
         JpNg==
X-Forwarded-Encrypted: i=1; AJvYcCVi97apRNwAW3bzSbxpO6nPl9iRRPSWTZMY246HsCc3at2j2FW1pnwTPvCHcocvWbOin4W/+Auv3AcaHVRV@vger.kernel.org
X-Gm-Message-State: AOJu0YyrelmsEPp4u9hqdRhKjgEVjrt2voPZKe0rZBrOMu+xna77DIVc
	w1uFQipKRi+6BdjhqvYi9oHhPmDVTYTY1jhiV3Q+/Pow3jS+eKFQH5U6V7k08kFi+Wlu2Y4bS+i
	th4B3C2vPSzI6V+yFJJFLnTMxMS8E9tww9HvvXh2sxqpg/9IxVdK/dQGqcKRQqxyB5pvzp6hC6F
	FI+EA=
X-Gm-Gg: AY/fxX4bx9+4Dn7W9+TqbgAc0ziEpAfMy4EZtEzf8xEcVH6gmZsaeEKcKu3D0uh7eF3
	2NPRg4U8I1TzZ84gjajOk23nOx1vwG0GyJGeO7V1kwKSr95A71IfYDEYQIk6ogx9F4QxakiQrUG
	XuN+VEjk94ZPXlykKSLchluDFRI7NFDjWSFCLuQdhv3iTZxwfsQv5AEaXwn0Hn5l9QdDwCn1Jty
	GI9zqXq4bu3JhOrf20L+4OV5izMrNJeyTJ2ZcpYYXNVMaBk8lBo5GneF/rnaaeCDsAEw/WV8DeE
	LHdYwhewT+pVGxlKaybQyKhLXO6yrETP63Fee0dIn91/PVsEiN3CnDu0gibC13Qf7wCaN/jb9b9
	TWp2CGB31EmMHNfos9pBZIlRblUjTF3H4OlGYUnuuorqYX7KWh8LFUWI8fiU8jBkWNHvI
X-Received: by 2002:a05:6a00:f9b:b0:7f6:3f21:7d22 with SMTP id d2e1a72fcca58-7ff65f768d7mr26444735b3a.45.1767055718206;
        Mon, 29 Dec 2025 16:48:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUtkKvhymw8Xl8ay+KCoAJfW45Qb+Ibnnd83sYZQxUa0ZEf1vevTrmAqPjGAuIFuOeLCXXdg==
X-Received: by 2002:a05:6a00:f9b:b0:7f6:3f21:7d22 with SMTP id d2e1a72fcca58-7ff65f768d7mr26444718b3a.45.1767055717691;
        Mon, 29 Dec 2025 16:48:37 -0800 (PST)
Received: from [10.133.33.5] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f26asm30025450b3a.52.2025.12.29.16.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 16:48:37 -0800 (PST)
Message-ID: <0ed71599-e8be-4987-985e-785f2d47cf96@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 08:48:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <8cac29c3-6b05-479d-a06b-583f9def7beb@oss.qualcomm.com>
Content-Language: en-US
From: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
In-Reply-To: <8cac29c3-6b05-479d-a06b-583f9def7beb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YlAzp-WTja4W8KxLGcC-G04JA8cIHN6a
X-Proofpoint-ORIG-GUID: YlAzp-WTja4W8KxLGcC-G04JA8cIHN6a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDAwNCBTYWx0ZWRfXzSxDOXiWk1y2
 +ye7sreKJnRtPelSOAFuPrDIoa7Z3LYm3/ichA7Q1clOuigfOZNxE5mtSHiSadzJATWOmZvkJo1
 gq11G+ks8zSm4EbbK+F6kRU7Tddb12v/TWUAQqPJ7ubKQl54smMFCohoJC4yHgNjholSeLoPwfH
 p5ZdHrVlc3BO+OisapDlwDeQO9OiXbYhpY70rPYUP2WLEvRo7F/ymKvFnmCknH47PS5O34xb5x0
 adCYuDkIE5nuMeLbSFYTxYeKXXaSvcSDTgKhGUiUGBv1d/XvT24gAv9o/hNIDhVy52yZVrk0/ov
 0XEpjZf3Oxsdim26PzctdiY9eWXXvZ6lNuXOifYN8CrP/RIHRBPgFgOXSBsU43mTHOG6pR6mKy5
 fTsD3bXtM3NPY/Ls31OCdKCMtB2+sU+O0KTu/WU1XLXcW7kE/LRAndTU5CfzFglEoclWUE4G/EG
 XgqXdzh6ui6SzCHh8/g==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=69532167 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-EYVSfHI5QxSVCcxwr0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300004



On 12/29/2025 7:27 PM, Konrad Dybcio wrote:
> On 12/29/25 11:19 AM, Tingwei Zhang wrote:
>>
>> On 12/29/2025 3:21 PM, Krzysztof Kozlowski wrote:
>>> On 29/12/2025 02:23, Tingwei Zhang wrote:
>>>> On 12/24/2025 8:12 AM, Tingwei Zhang wrote:
>>>>> On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
>>>>>> On 23/12/2025 04:38, Tingwei Zhang wrote:
>>>>>>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
>>>>>>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>>>>>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>>>>
>>>>>>>>> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
>>>>>>>>> the common components into separate files for better maintainability.
>>>>>>>> SoMs do not share actual hardware. DTSI does not represent what looks
>>>>>>>> similar to you, but actually common parts.
>>>>>>> Purwa SOM board and Hamoa SOM board share same design. They share same PCB.
>>>>>>> The difference is only on chip. Purwa SOM board has Purwa and Hamoa SOM board
>>>>>>> has Hamoa on it. 
>>>>>> I do not speak about boards. Read carefully feedback and respond to the
>>>>>> actual feedback, not some other arguments.
>>>>>>
>>>>>> NAK
>>>>> In this change, the SoM hardware except SoC is described by iq-x-iot-som.dtsi since it's common between Hamoa and Purwa. Hamoa and Purwa SoC hardware is described in hamoa.dtsi and purwa.dtsi. Hamoa-iot-som.dtsi includes iq-x-iot-som.dtsi and hamoa.dtsi. This change could reduce the duplicate code and review effort on a totally new purwa-iot-som.dtsi. If we found any bug, it can be fixed in one common file instead of two separate files. Same idea is used in x1-crd.dtsi. X1e80100-crd.dts include x1-crd.dtsi and hamoa.dtsi.
>>>> Krzysztof,
>>>> Please let me know your opinion on this. This could be a common case for
>>>> Hamoa/Purwa boards share same PCB. Share same dtsi file like x1-crd.dtsi
>>> It's not the same PCB.  You did not really respond to my first message,
>>> so I responded to you - I do not speak about boards. Then again you did
>>> not respond to it and brought some irrelevant arguments.
>>>
>>>> would reduce maintenance effort.
>>> Does not matter, I do not question this. Why are you responding to some
>>> questions which were never asked?
>>>
>>> DTSI represents actual shared physical aspect and you cannot share SoM
>>> physically. It's not the same PCB, because you do not have a socket on
>>> the SoM.
>> I didn't make myself clear enough. The SOM PCB I referred here is just the circuit
>> board excluding the components on it.  Let me rephrase.
>>
>> Hamoa and Purwa SOM boards have very similar hardware design. They share
>> same circuit board and most the components on it. The only difference is Hamoa
>> SOM board has Hamoa SoC while Purwa SOM board has Purwa SoC.
>>
>> I agree they are not same PCB since the SoCs are different. 
>>
>> However, I still think it's better to use common dtsi iq-x-iot-som.dtsi since their
>> hardware design is very similar. 
>>
>> I'll invite Konrad to chime in here as author of x1-crd.dtsi and Qualcomm SoC
>> maintainer. I think we are facing similar case on purwa evk and purwa crd.
>> Align to same strategy for device tree topology would be good.
> Hamoa CRD vs Purwa CRD are literally a just a SoC swapped PCB as far as
> I'm aware
It's the same case for Hamoa IOT SOM vs Purwa IOT SOM.
> Konrad


