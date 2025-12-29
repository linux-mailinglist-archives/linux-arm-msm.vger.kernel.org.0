Return-Path: <linux-arm-msm+bounces-86813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60353CE65C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 11:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C895430054AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 10:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6290F13B7A3;
	Mon, 29 Dec 2025 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfG0DGs3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzPMtbkF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB7721A444
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767003573; cv=none; b=dpieziyaJgcUtavqbTrRacjIhqAF0T9Jwm0Gmv0vMSNBY0Y2cI36Q5iy4FE9VQ0DQe1tAL7ziDjZvAK1yj4L+gL4KzGTQih1xfT5bj6sGEXA9aZU3prAXHPkBcQzraYuu1HoN9JSdfsvFmUFHHlHp4J3xOaZ2e+TOTZI+A6s8Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767003573; c=relaxed/simple;
	bh=bAlbsLq2CbFPJyLvOnaYwzljMRSxyhtx+g0Q0M0KB4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NvbwI0g7sAZFN4eEeIxrLyzrmpwUzKd/Vaqam2vZGzJ7SYphmm4jhfLZtcnO9l6Nd7WdgFEx65dhuzjgfYW00J/RVBKr1M5EkJ1HZvz07qEkmwWriGaxZMPaOeVvMSSRZNKoMcnY2pOGFVekRKsY/5jfPMDKXiv0h6O0KL8HbdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfG0DGs3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzPMtbkF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9QuoP3762485
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 10:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yBrqNsep9SvRFRsP0TEHPmoDqVkS06GgAJCQ8yqPKEs=; b=dfG0DGs30+P4p9VZ
	i0KCZpvNpD0VKNYEkw/1DkD7kFdAF1Xg+E8kkMCCuqG5gvRRLT+A0g1BclbJ/aPn
	yth2ZbNj40U601V0xe/Fd1+DaOHYdL0dCZOE5M3g+VU2b/XiBiVwp2/pjygo07yR
	bAfdW3/dyg45gzvlONsU2fcmafWVPOrfgG4x6Iqv6MmujFlAb/WMtvM4qNoHUlua
	nHxwk87SLdJh35b2XShN7a6CuglSDJ5cRG6S5DLb+4q1c7/5MlbYz8GyY/EHnU6T
	SAhRoRB5aApxDiodJbciBGW2tSS3pyyv65uFVw0K3gIZ1SGgLu7lGrOXJaotBk4c
	0fNoqg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bv3f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 10:19:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34cc88eca7eso16515718a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767003570; x=1767608370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBrqNsep9SvRFRsP0TEHPmoDqVkS06GgAJCQ8yqPKEs=;
        b=AzPMtbkF7Dj0pldLpqnbvs2ov/8ZL+rgBRFc69cK6FHawoH5yO+8R0ZBcevt5cBXD0
         u1/o1yY5Xr7KnZO/POqfeIUnw4X2rR9EnYrVwlde9eWlJzlJu6baDEEz+fOCUQ02PaRV
         zqzn17lT1GzTkDk7TZfHpHOFQFc2ouSw3KzaS6iNwBBoVfuuRYx0V7ASsEExEG4Q8oFH
         XWPMbizOZhnGxFRp2H4npte1SgSNWlHuJqHOHwRkW9L7jAAKfbGe/z3y2mlIuUgvxyfX
         7S1nTMCFeOvsYdPmpeIR0qfMOKRk+9kpsw5w1S++TOgG0pIxUPO+skLCTKuaEMgvgx67
         aKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003570; x=1767608370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBrqNsep9SvRFRsP0TEHPmoDqVkS06GgAJCQ8yqPKEs=;
        b=AdQNezi4E8ahwp3gm41T70pAjsppW/jqU2djnWDXLJAfT3hGxl4JPEInLGOY0kNOUG
         Flpz0QhxWSILUOG14WdvUOz8StDlafVuXfLgh1Yjs2ChsnVSMR0V+ZdqGYdXLyorxleU
         vl8aglkEtrRBF+tYpIeJc0Vr85x6h18ylAgZoNQEiVWL7qNuKxM22SIREW2I7zL2Pa04
         xH5j8c100eZSoBkFrTJZGv89+QIaGfIP6kPMX8KZPZ/NZqdVduUuexupvhiMw2Bb6dMN
         jCFTQLWkiGFASNISfu/dtnM0hnDKse0QbWJzTXrY3ls603iOryQU0kRlvsIubmbAO0Ln
         mHFA==
X-Forwarded-Encrypted: i=1; AJvYcCWEqqawpRa8xsTq1MsytwyP/uHWQWiszo5JZlCJP09CFlJ7IPqD/JxOFR4LWNRXpNy0YRWLVCx1IFpl1I70@vger.kernel.org
X-Gm-Message-State: AOJu0YzR+WGuNhWNmDScsmWfC1LsVzTBk3UzX8huedJo0kR5BepYlMY1
	dQ7c+7I2ffSNO2EQTeCpzpljmFSaCMu9mSSEjFid+Wk66+59JF+8tcIQ7VBsB+truMSvMreZ4BL
	qhP//uZf6sJvcm/48SDjn7DIoKNrCvy6jHT4OozKu3Sxa4A6f2Ugc/PEET6mNPhfNJcGzMlWeam
	LwcAw=
X-Gm-Gg: AY/fxX7LPWQni6IawIJLzHOGk3qYC/uWXB6EbKVrW07Z+nqnBqg+9l46OvN8B8drgzK
	Odk9vvF8VAoj9CbCg794qEDzN7GcGDqp/WEaCAD6MgNL3zShdighy/rp/QRdTSwVXANDzUBN1rM
	RcsO09ZG4B55TTZl1A5k+bEqUC5hTNjSOY1doVz5bGPeSrVFFXpswnTvvMASB6k9WES/P0S1sVY
	736gkZqU/MMQEgWre9VIBG/suJj5jA4Tbt4j87UFzw3EG33aY9v4w4nb+wIVGhkLJADEv+/XfhU
	EHc+FHGsRjy9IoFljgYnAAFwGAD3ST4wOsCV435zcdyKBDpZJtwBRGmXSS4qhQMiS+w1nwCQMsb
	TS44QqWIZItmLCbBESR7nB+AVivr4xd9FmEuxl8OapE1Ny1fkZP+3Lpq8E/6qPfej+zeZ
X-Received: by 2002:a17:90b:2585:b0:340:bb51:17eb with SMTP id 98e67ed59e1d1-34e92131db5mr27227362a91.15.1767003569822;
        Mon, 29 Dec 2025 02:19:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpI1tIheAK3Jc5YakDDEgyL6hZjQFrDx1wSiLJUOLGWDC/LzO6W44QB/3UCmbiVxqphTxoVA==
X-Received: by 2002:a17:90b:2585:b0:340:bb51:17eb with SMTP id 98e67ed59e1d1-34e92131db5mr27227348a91.15.1767003569321;
        Mon, 29 Dec 2025 02:19:29 -0800 (PST)
Received: from [10.133.33.5] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dcc7bcsm29853573a91.13.2025.12.29.02.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 02:19:29 -0800 (PST)
Message-ID: <19f46c69-fbfc-4129-98ae-fc5aef3f75eb@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 18:19:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
Content-Language: en-US
From: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
In-Reply-To: <448f2efa-5b1e-4855-a62d-2e375938b36f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4-8jecRDV5f9-KJyFL-8T1M_hqmGPsdO
X-Proofpoint-GUID: 4-8jecRDV5f9-KJyFL-8T1M_hqmGPsdO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA5NCBTYWx0ZWRfX1ejqdlqLQbFV
 91kDatZg0pPpkEVQwjXxBtzBgQai6Fbe3eGLbQknfgRa+nPlxgtZWpL7v1903ZhthqUOQZBVFIx
 ecredpHBdUtAE8c87CoVKL5R0B3rUfn/LUlQmKKueic0z2pcWwUskO+NmkcnoCfxdSp0GnTLI5Y
 Sv3j9SMew5ZPvAec3MpyPoCZ16XoDwy3KVX3D7LVW/DDgG+6kMFUEMHthusTQ25Vjgm6d85yVgq
 oIwI8jle3POOi7cdnjyWGa5GKELvwI2GU1SwtX+h4uDKZnewCgMZNGeMGs/4ytvJgnTaPZvcW+3
 jMy+iyQKpaq0CN7AZ+r9e68slPuypDXNxBqnctu/n/tGD7I2pwDG07zwY8aD0AkjEcqgX7rax/T
 uM2dKj/P0il/1zIhCXQIUBNcd6PnPKYY2Myp5ppfCAM15dFCGufjNU3D4QIX+S63n+XdRSfT2vS
 iOoZmhUrAtxUkRdd92A==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=695255b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-EYVSfHI5QxSVCcxwr0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290094



On 12/29/2025 3:21 PM, Krzysztof Kozlowski wrote:
> On 29/12/2025 02:23, Tingwei Zhang wrote:
>>
>> On 12/24/2025 8:12 AM, Tingwei Zhang wrote:
>>> On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
>>>> On 23/12/2025 04:38, Tingwei Zhang wrote:
>>>>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
>>>>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>>>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>>
>>>>>>> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
>>>>>>> the common components into separate files for better maintainability.
>>>>>> SoMs do not share actual hardware. DTSI does not represent what looks
>>>>>> similar to you, but actually common parts.
>>>>> Purwa SOM board and Hamoa SOM board share same design. They share same PCB.
>>>>> The difference is only on chip. Purwa SOM board has Purwa and Hamoa SOM board
>>>>> has Hamoa on it. 
>>>> I do not speak about boards. Read carefully feedback and respond to the
>>>> actual feedback, not some other arguments.
>>>>
>>>> NAK
>>> In this change, the SoM hardware except SoC is described by iq-x-iot-som.dtsi since it's common between Hamoa and Purwa. Hamoa and Purwa SoC hardware is described in hamoa.dtsi and purwa.dtsi. Hamoa-iot-som.dtsi includes iq-x-iot-som.dtsi and hamoa.dtsi. This change could reduce the duplicate code and review effort on a totally new purwa-iot-som.dtsi. If we found any bug, it can be fixed in one common file instead of two separate files. Same idea is used in x1-crd.dtsi. X1e80100-crd.dts include x1-crd.dtsi and hamoa.dtsi.
>> Krzysztof,
>> Please let me know your opinion on this. This could be a common case for
>> Hamoa/Purwa boards share same PCB. Share same dtsi file like x1-crd.dtsi
> It's not the same PCB.  You did not really respond to my first message,
> so I responded to you - I do not speak about boards. Then again you did
> not respond to it and brought some irrelevant arguments.
>
>> would reduce maintenance effort.
> Does not matter, I do not question this. Why are you responding to some
> questions which were never asked?
>
> DTSI represents actual shared physical aspect and you cannot share SoM
> physically. It's not the same PCB, because you do not have a socket on
> the SoM.
I didn't make myself clear enough. The SOM PCB I referred here is just the circuit
board excluding the components on it.  Let me rephrase.

Hamoa and Purwa SOM boards have very similar hardware design. They share
same circuit board and most the components on it. The only difference is Hamoa
SOM board has Hamoa SoC while Purwa SOM board has Purwa SoC.

I agree they are not same PCB since the SoCs are different. 

However, I still think it's better to use common dtsi iq-x-iot-som.dtsi since their
hardware design is very similar. 

I'll invite Konrad to chime in here as author of x1-crd.dtsi and Qualcomm SoC
maintainer. I think we are facing similar case on purwa evk and purwa crd.
Align to same strategy for device tree topology would be good.

> Best regards,
> Krzysztof


