Return-Path: <linux-arm-msm+bounces-81338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DF4C50B43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 07:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8A81896FB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 06:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123792E11C7;
	Wed, 12 Nov 2025 06:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGlDYzIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgkMT9e8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DAC2DCC04
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762928855; cv=none; b=jlXZypxZbUDkhR3p57gzokSMMr34AIfxz1uBteKyddegNxCNEip/RSLNBbRQQViA198QYPD8N7pMQeSfqOMJDjHf2T24SRYIapUAQXnjOVzYYqzeT0RfDYNWqyLCHBUAUDwmclYY/uZsjUIv5dMKiXuPnGzffYetZlH36rEX1v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762928855; c=relaxed/simple;
	bh=6E3kbuqpWLhQAHpZzj+RKwY9DdwfA7KfczvhOXOREvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLf7LUh3qdQelFHfq8xQtXjijGmELRqdxYZhdEwoBkswMXncyKLU/kpfMAhM+2JJyiN3B6y9pDljU/lavQMTIq01QifPkZWL+ubzofQ20Wg51BEqKDj8KeMGNHdegqJanurNUcnL6QR7cLyp/VPR3KsXlLg5fzoSc9lkhelHFgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGlDYzIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgkMT9e8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC3HDiw4052888
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qBcU+bKowUpDK1UWnPZAN4aZ7FmvwfESIYHI+SdKi7c=; b=ZGlDYzIan21ghi3C
	a1Lo40AxQ3cCORugWdcJBGyYcuhsuxfDchjai3mkMBZgGWsuTrQXP3ikHw3baPz8
	Ymlp/GE7A3LuIiuWUwkEi05p7H/KK5iDMRxcm1OSHK+g2EbyL4o44liW4w/HQtEB
	SKs5IKUe7rBjT3cn1m0Q6em8HJZkFVpIX2wLZUn+rwv7NUvTH/kCyNAiIQAX99U9
	mhmyXyLvEbGr0MEIvSCWW9x1XGfscesaI7SexywLsOYX5ihVz/4BsCJDKcfc7ky6
	WOKCrb84wpOEjNGZjZjsC7AGf/NFEbJ1Qnt1ANZCgtR3dXSCWUukM0+3xXe3ssYZ
	zQqRUg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acj6v8ff5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:27:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7abb04253faso105558b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 22:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762928852; x=1763533652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBcU+bKowUpDK1UWnPZAN4aZ7FmvwfESIYHI+SdKi7c=;
        b=XgkMT9e8X2fbQqkQMRwKH3v5oCW60L4Vvf/RsJbmGqpvAYuINq0yuwMYT9SKBpD0Go
         v8UBE1O246TECR5MTrTw3IRd0fsItMEsSN4kusw2wEKoOr5vcGPGpg0LiBRxM2c95cyv
         9yOOkDpcCyCUILtONbmCMM3IWnvwQLJHWwnZj1ZQWGq0STn3FQvjqgLFBWMpc7W7djnU
         PMY8Kg4Q36gV8fNlePt5eDfI2+F26/iuiA+Q2gTDEeyTKyoUXn5iCi9lV+CrZW9q+WzU
         d1zHnoww6B3xqUUF9xylTUe4W0oyaZL9tMm6ewJMcWFOYyaHPQM+LsasHQ0ImvhIcFDz
         3Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762928852; x=1763533652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBcU+bKowUpDK1UWnPZAN4aZ7FmvwfESIYHI+SdKi7c=;
        b=fbwK6rzQb3dZgECxGX/g//JUimLP2iLMp/K352zch7vlU0ZbS/qgGsKNov4RQIGdMX
         +lVM9ucnc5b4JkdfGYhJ378CQptUaJthvvn9Ql5RKgwx7xk7VdRv4qyAgC/1U4ArK4kI
         BAevgajHQpUj92pxOppkxiScSVBrgfYs/DuPIVrU2XeGKGeohu4h68vQQjOyFiWixkBG
         Z1RSnkBRfYNuBtpDRb7xtRWGb2bIUVRM6RzMGVBubyO27vFGhCNLoO0cT7Ztx9M7RNCM
         m6Ad3A0qSBjdSQ+XBd+VpcA5WmvbArAWfsIlPuPucmlSsGkdv5zWf4dcYdB+xRUkVyzX
         di/g==
X-Gm-Message-State: AOJu0YxzVes1oTiUD8XZHd5j3QXyjn6hxCYjP6vsurURxsedm4j8vQWE
	PvedTbD3T99nQUQfCTvmMzQEQRvZCDNoEmCJkxwM8ADEB9n8v3TDG7HDa+Im/VVey/f+/8x/KMt
	/C8xrTJ5gTg4f1e+VAgNUPdQzSLt20JGxvI6VXiSZ16dkwugwy8U2fJ0jptpDzD0V5kSeWZ7eHH
	o=
X-Gm-Gg: ASbGncsHSI7uq9ut7CEHLSZYnzBWeKFsoPRbKsn94lGCFmVfsNIagBfOEFOGQXqgJO7
	3/WYHVGfwfSJ7TIUMdjzxx+nGscYa9zigTh/bl+CZMgzQ4aYFfNvYSCm+pafrRSF4n3uOnlSAjH
	cM5Hfz5NSgAU7HhgijtJoY668eNsY/QbPYRRQQjRQXr34a3u0CJ01e+vFc5QQ1MgwCTQ4qE0txy
	5xZyjFVu3fUCpujs05uKaGxStp5V4HZmOrJs3WL4fQksBXi/L6ISaufUzofpOl40+ao5GtkMA9z
	KQ6HHpg+Fe5V51CXYpXd7rT7qqs6epYyAOorvzK6u1EOkgQVGU3axhdmF9g4ddAF1h0MFtLOxWO
	5KdNtdtMhi+V2+KViwINE+2a6Hg2S
X-Received: by 2002:a05:6a00:12e3:b0:77f:1a6a:e72b with SMTP id d2e1a72fcca58-7b7a52ca460mr1023996b3a.5.1762928851895;
        Tue, 11 Nov 2025 22:27:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8s95IVwQDFsnt3lcydXVwXi5aszhstkYZPnVfa45JBYvAr6D58rc+WOD2b+WVitwKA3EoAw==
X-Received: by 2002:a05:6a00:12e3:b0:77f:1a6a:e72b with SMTP id d2e1a72fcca58-7b7a52ca460mr1023977b3a.5.1762928851387;
        Tue, 11 Nov 2025 22:27:31 -0800 (PST)
Received: from [10.217.216.168] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9634f56sm17647131b3a.4.2025.11.11.22.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 22:27:30 -0800 (PST)
Message-ID: <efd1b2af-8beb-4d4c-91db-e622b09f3d40@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:57:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for
 sm8750 soc
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20251110085013.802976-1-sarthak.garg@oss.qualcomm.com>
 <20251110085013.802976-2-sarthak.garg@oss.qualcomm.com>
 <35e8ef89-3fbc-48ac-9b2b-10c2e95ab024@kernel.org>
 <268122d1-d629-4d8c-b88c-2999c77a1a18@oss.qualcomm.com>
 <77898b11-e039-4c62-b651-219c971a3be0@oss.qualcomm.com>
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
In-Reply-To: <77898b11-e039-4c62-b651-219c971a3be0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _qSw235X-YiC8nrGIyMwZoRco2IhiCGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA0OSBTYWx0ZWRfXzl/mNrV1rwHF
 z9fnt9U1XqCC8hMIFJiQ+r8Ip6XfJqqYUg3Uv1EbWWreWRgRdc9afrgHi4/NE40cmG1+AgUX5NN
 sXzYGlAeCRQ5TQ3QUJ41fj9HNP0FuPdowsvSsEAW44yFY5p7bO4EbZd0aOo5xge9pxnTJPEz92U
 vnU7bLZaI6PvFks9BRCBhVSffxelhWYvRkQhkHD37SzVuxyyTW14eWNHTCuWvXO/qMOapBEt19I
 /zldDX1ReA3l8NT7fx3hn4zTCa/zv8CPStdH1mNtMLRK5LKjFMkMHLh7Qer19eLs4USl7p22JUf
 WUOHtrsUggi2ESmkAYA5IjjxUj3amedeuLfs1+gBU/9e/+IRDhbFHgqpfD2EyaczcNhP+iHQXWh
 od2cYTe7JqhcSY9Lx8jyJGh2RX5IyA==
X-Authority-Analysis: v=2.4 cv=f8dFxeyM c=1 sm=1 tr=0 ts=691428d4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HSYfenSZfbn2dgnvCVMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: _qSw235X-YiC8nrGIyMwZoRco2IhiCGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120049


On 11/10/2025 4:38 PM, Konrad Dybcio wrote:
> On 11/10/25 10:25 AM, Sarthak Garg wrote:
>> On 11/10/2025 2:43 PM, Krzysztof Kozlowski wrote:
>>> On 10/11/2025 09:50, Sarthak Garg wrote:
>>>> Add SD Card host controller for sm8750 soc.
>>>>
>>>> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sm8750.dtsi | 54 ++++++++++++++++++++++++++++
>>>>    1 file changed, 54 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> index a82d9867c7cb..95b210fbfead 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> @@ -3482,6 +3482,60 @@ pcie0_phy: phy@1c06000 {
>>>>                status = "disabled";
>>>>            };
>>>>    +        sdhc_2: mmc@8804000 {
>>> Nothing improved.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> I moved the sdhc_2 node to follow alphanumeric ordering and used hex in reg.
>> What extra is needed ?
> Nodes with a unit address (numbers after @) are supposed to be sorted
> by that register, just like any other register map
>
> Konrad


Thanks for pointing out. Will update in V5.


Regards,
Sarthak



