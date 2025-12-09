Return-Path: <linux-arm-msm+bounces-84729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAF3CAEFE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 07:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 663BC303A1AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 06:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A02323F417;
	Tue,  9 Dec 2025 06:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbRD9ZTL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCuaT73E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3803A262FD0
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 06:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765260243; cv=none; b=YHiRFFBVBCpCR/x+BCpo04wjLzgXOc1AJiZ5sE4b2/0x8zesfaDtV1Ib/F4UDGu3xIyBymFPPNX6bVo+ym+DqcvgNOD1FVSOtUHDzKdoGQ2INPHAiy9fsuW4X5xf2XyWShIP/27jaMb/kAx3eo4o4aMb0zICh+I04sttqchtA9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765260243; c=relaxed/simple;
	bh=vXFkP+d3gMvmrAvN2wkXRnnDx6q1pNTAOA68TYfbKPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KG35AL+zcV73ryPphvSp28xcMx4tqDf5Peo5GWlLvNnzG9Oxl80wnSTtqOU+ap8vdQFrfp4reJl4yAQoEs+BniydyPS+u02TGlnemb3HpUp3Zjuaz0PjKcBZKsGhhKoy39FF9nE/5zzUSVVzTW7GTN1gA/WhBdz1S6thQFQhs4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbRD9ZTL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCuaT73E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NWwZo2618394
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 06:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2v9iTDB9nFKe21YChQCY1Qq/GEGjDnH9kaVG13syLbo=; b=SbRD9ZTL0BAs1p3e
	se+cOxGov1JAGUHwQX6SwY8DuIY93kb4RLnetdSAO0QyDDwSMCfI84U7QkrLLuIO
	dabCWJT2O0W6NYM9rcTVbZXnkDBU88M09oPkfBpnEBtCi7BwyOLaFPNf65OQz9yB
	Qz4cmisJkrVLeSi8UjyIRw16jQLqy3CNBG9e7qebUTJYH5/vjwL0OhPd/PGEZoBY
	u7UHXL6QXTzkG9dxt2GtvNklFxLcijbD1gLWrMHItXc45SnVN2/Qd3xEHh7f/C2+
	5WNSxXO5azFOuYrz7cASk7uBLTpNI91JiSlm4JXxw0VhP+zf4+gxmrzEl1uG0SVq
	6yn4mA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax76u13tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 06:03:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295915934bfso72878255ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 22:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765260238; x=1765865038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2v9iTDB9nFKe21YChQCY1Qq/GEGjDnH9kaVG13syLbo=;
        b=OCuaT73Ei72IyohsHmrJ12bRYM+wGL3QHcznnbUltgj0/wBcqBkmySIqr4CTexh4Q3
         yXK3/zvf2YstysxMte2zHsrGJb4Tp/jV2fLcpa+eAKfqWG4qFg2Vak5SA1arojFWtqZw
         rwV7Vi3XFXE4xc6Ds09SjDsjK6CCijHvIuHiOMWF5rESbfVVek5niphJnr/KSYwzaj5G
         riJMtOxRZxeMFIhuZclgXspTZlQUSbR6oeG0aRxovlEUa3FVw3tQw0Q0noNf5bFbtlVm
         UjmCaROUmlsSU34lW4ua/7JLNvih/BhgKAkNIftlYWJXpNv5zvDbvnvumWEFq/PJgvS2
         AC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765260238; x=1765865038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2v9iTDB9nFKe21YChQCY1Qq/GEGjDnH9kaVG13syLbo=;
        b=EBoo/e3ATMDKqIUszszzsZpyE6yPlnVNSHDYU/3wyuF3kxhAN6aKr4/XlIQK9z9pkt
         YhPLTCLxfCIhFRPrXmoCZoAgDU6eEypNvGvKCp5kq9AEcsDE2R2RwlKV0asy9R4gQexq
         W/pxaWCJffHbhYRA91s83OcS+cXjIiNEFg3y4oT2XkQtv3irXaGjlokmdxCfmsgKIlRI
         g9zLw8fj3EpTByBwtn+91GFMNzvXSvSOhgDE+IP2A2seHh6FOs7PsACnu5Z53O5j7o0/
         WeEfmL1ERDl/tHsEZT2UPWRRtOoQ/4iUmsVOdCFUGk62k+yhLjDdrac4UiOu4LxoQkPn
         L5CQ==
X-Gm-Message-State: AOJu0YyqbwJDqmRVx8UaateJnXjQSfRYYKL3wI2eh/14FMMifVEfqMmy
	hnHo8igU8ii9jXvHiPyG67xo71v+3olcHqitTaKlJHFPuOtEG1AFv9JKVTfaSA4jBLbA4OUaDeR
	37Za/ygGByl7Hdyd/xkjc6YVPiz9n6zBIHxMH+mLou63WvYRdTQjNwCdtjeNMuD4gA2f9
X-Gm-Gg: ASbGncsQksq7pWooy6nAl9xw3l7WD0b5iMfCszlXEdOj2Apl9oQXMiRpEQJUxhv3Yr6
	89xI4Df6KBr04qNcQbxYnHnSLacUGxNAhi2/KnomAna4WbUkwu/SJjsVBR1ssOk8lojyR5gGglG
	cStgN1QqXBqRb/bPE7HDFf2mlMIJvvHqDfM5mCET7bmAuamv2Q78VXHDDrEt9tIXwtJEZWR6yAe
	DhUXy3lmz5Heucg0BFJnmuUJdt2FDR0WGOsE0U6NJvO0YpbOlnWS9vUEN7pfcIiw2k7M/Na1ODz
	My80VCAs2BkBqoVnkgs90dWoKKAUsEHZVYNIKneigawkDM6DueBcfmKky4Riu3Oxp/vKZb6zzce
	Xvvz9pa2eQjiLd5iLTv8jTnqZZZJle7p8nLOKCvHGUg==
X-Received: by 2002:a17:903:1965:b0:295:7f1d:b02d with SMTP id d9443c01a7336-29df5577ad0mr101780985ad.22.1765260237855;
        Mon, 08 Dec 2025 22:03:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTHt8eHhnlfCiek/YVp4SGyuMM+sc4pxcmHAtcjMxlASwGc0hHPuiTqq3tRmb9jtnzYBIw0A==
X-Received: by 2002:a17:903:1965:b0:295:7f1d:b02d with SMTP id d9443c01a7336-29df5577ad0mr101780605ad.22.1765260237249;
        Mon, 08 Dec 2025 22:03:57 -0800 (PST)
Received: from [10.217.218.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4d3b5dsm140595955ad.40.2025.12.08.22.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 22:03:56 -0800 (PST)
Message-ID: <af3f57a1-8a9d-4b00-8c0b-f6fc6033609e@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 11:33:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Add host mode support for
 USB1 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        andersson@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, konradybcio@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com>
 <ffd6dc9a-372d-4db9-9c2e-92f126cb5ebe@oss.qualcomm.com>
 <49ecd190-1aee-42d9-9e6b-c155170aa38b@oss.qualcomm.com>
 <638f4184-b582-4a48-ad63-7c1fd2db492f@oss.qualcomm.com>
 <9937db19-de90-459f-844d-bce60abe9f7b@oss.qualcomm.com>
 <3476de25-f0e7-48f1-8bec-3888db2f1fc9@oss.qualcomm.com>
Content-Language: en-US
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
In-Reply-To: <3476de25-f0e7-48f1-8bec-3888db2f1fc9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA0NCBTYWx0ZWRfX5cwVQnJXvGnv
 o2j8K/fedWF7VAk7KMVusiqQJwSIotK095q9VEb3cY5K55HihSPU9syake7wMLQyp1ZjuaWvSSe
 0kuk53F0dLiLgUVM3LC5PszfMOP2/yg9xHyhi+ypRbuylqEc+TbagG+8JB1isg4MlFvY64z+jhi
 KuDFfFmnlTzRGcJl///14jGKQIEPEm/UZr7olb4z3Uw/ObzsnDKjIJ1B9ZgWuJnMl/lRBsG3UM7
 M1Kj1YH5mmHb3NHnmwoHzbC+zb5nI6N6auWoWpDuwYSsXDLoLqPT5V/jt7ncizPRfqz3obAUD2U
 tkxOB4+hSL/eWSJpKNwKbtuyQxSZ+D3sRQKmNZ71N9eE3Y5+bmz4t5qMOfZBCKcKtbPIAz0Ce/D
 DShYLHEteTMHT3AwjNJ/1r6LYYsQdg==
X-Proofpoint-ORIG-GUID: Q0uMcjmgn1ZqtqxD7NRs5S6cAxw0w7Pa
X-Authority-Analysis: v=2.4 cv=PYTyRyhd c=1 sm=1 tr=0 ts=6937bbce cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ykCLjXogPZHFRvyc8YQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Q0uMcjmgn1ZqtqxD7NRs5S6cAxw0w7Pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090044



On 12/8/2025 10:12 PM, Konrad Dybcio wrote:
> On 12/8/25 11:49 AM, Swati Agarwal wrote:
>> Hi,
>>
>>
>> On 12/3/2025 5:17 PM, Konrad Dybcio wrote:
>>> On 12/3/25 12:41 PM, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 12/3/2025 4:59 PM, Konrad Dybcio wrote:
>>>>> On 12/3/25 3:42 AM, Swati Agarwal wrote:
>>>>>> Enable Host mode support for USB1 controller on EVK Platform.
>>>>>>
>>>>>> For secondary USB Typec port, there is a genesys USB HUB sitting in between
>>>>>> SOC and HD3SS3220 Type-C port controller and SS lines run from the SoC
>>>>>> through the hub to the Port controller. Mark the second USB controller as
>>>>>> host only capable.
>>>>>>
>>>>>> Added HD3SS3220 Type-C port controller along with Type-c connector for
>>>>>> controlling vbus supply.
>>>>>>
>>>>>> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
>>>>>> ---
>>>
>>> [...]
>>>
>>>>>> +                hd3ss3220_47_in_ep: endpoint {
>>>>>
>>>>> How about rename the other one to hd3ss3220_0 and name this one hd3ss322_1?
>>>>> _47 doesn't really tell us anything and may re-appear if there's another
>>>>> instance of this IC on another I2C bus
>>
>> Thanks Konrad and Dmitry for the review.
>> For addressing this renaming for USB0 controller, shall i keep a separate patch and should i address in same DT patch for USB1?>>>
> 
> Separate patch, please
> 
>>>>
>>>> ACK. Can we rename them as "usb-typec_1" and "usb_typec_2" ?
>>>> Krzysztof suggested to use generic names and hence we used "usb-typec" instead of hd3ss3220.
>>>
>>> The generic names rule only applies to node names (text before '@'),
>>> the labels are generally only expected to "make overall sense", I think
>>>
>>>>>> +&usb_1 {
>>>>>> +    dr_mode = "host";
>>>>>
>>>>> The connector states it's a dual-role data and power device. Is there any
>>>>> reason to keep this in host-only mode?
>>>>>
>>>>
>>>> As mentioned in commit text, there is a onboard hub sitting between SoC and the HD3SS3220 port controller. Hence device mode can't be used. This was the reason we left the above port nodes empty since we can't connect them to port nodes of controller.
>>>
>>> It would have helped if I had paid more attention to that message then..
>>>
>>>> Can we mark the connector as host only and remove the empty endpoints ? Would that we sufficient ?
>>>
>>> The connector should definitely be marked host-only, but the endpoints should
>>> still reflect the physical connectivity.
>>>
>>> If I understood your case properly, this is analogous to what &usb2_2_dwc3
>>> does in arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts - see Commit
>>> c02716951e66 ("arm64: dts: qcom: sdm850-lenovo-yoga-c630: add routing for
>>> second USB connector")
>>
>> For adding, onboard hub which is GL3590 in DT, it requires adding SS hub bindings in genesys,gl850g.yaml.
>> My plan is to first submit the binding patch and then follow up with this DT patch on top of it.
> 
> There's already *some* SS hub described in there - what needs updating?
Genesys hub used here has PID 0610 for HS hub and 0625 for SS hub. HS hub PID is available but SS hub PID not available. 

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml?h=next-20251209

Regards,
Swati


