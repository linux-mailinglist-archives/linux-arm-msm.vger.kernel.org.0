Return-Path: <linux-arm-msm+bounces-56817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C78EAA9836
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 18:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9407E18805CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 16:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494B615AF6;
	Mon,  5 May 2025 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFji+27z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711584C85
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460903; cv=none; b=TTrmns48qrkVm7Q+cH49WvUKuInooI33XRj+H8qADkG3Y+uN3F+jEviW/VrRhj0qQx32QKacxl6DKspwulROH2z7QjjJkXsEGnCD613dlPjXpWKiqEHuwJlmH+r/+AVJNXXVRo/ZKVTZnRwCRKODaWZWG7rL+jhswPVgPGwtDiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460903; c=relaxed/simple;
	bh=oksWoz/qfjF62lhOVwkmnzE68DlyPmns5CNFXyzzkwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGLZK4W9vLkBa7h4Jz9n8nxPV/DuRdYkOreXAuFn6c0IIHHwG41B7AjUsBRGD3d2CdCXlme/IDTmC3muvTNsR5EDJY7KLboeaC1CrMEKgSpHk6PWuphC1yxuuUkBY0F2EukUzKYKn1isbLo6kkpJJUQRMekshG/REBAAv9UxOg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFji+27z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545C5pf5014013
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 16:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4u8e0uMKU6snjywf73T2BPJqst0pyG3KVo1RsgJxxg=; b=VFji+27zWJlXNPRE
	IZhTs13tWR+rM99hSJepJ+Ma1MDn/1cec/06WQOPN6uO1SkELyLSEANbtgJ+AE/X
	FZ7N8haGB4r71tSzMAr2pDbAAQ+eFXjGLrFRg2ktpgkmqEiQaj2rzwFxrPyQmR++
	rqWqiJt6Zu2bRhwRybVzbheZFUekZ/AzxdJBSVad3CN8jYsg2mYgRvfrXYqbhaiL
	dagzqowDbFrWH1ty6aRLmZCzEvmSdh09QH0EPS6N0myiwojzCazYxAb9IGVWOvqN
	WK5dKDa4wBi9B6tPYAnVfg4vj2guvA5NyP17NrB2s6zXKp0GmWt1qrYnLdXFcmD4
	35Y6OQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7chq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 16:01:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f52195347bso8832386d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 09:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460899; x=1747065699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4u8e0uMKU6snjywf73T2BPJqst0pyG3KVo1RsgJxxg=;
        b=lqNYgnDGQ8KJfMhuIN9Nt8wZZMxTLEPS+mJPPnp//Z/gnzmhWed7MUxPtrFYCdfFnv
         SSxPxCdGeSfZfdLCefKYQfaPYst2OKgLllOwcgQ70LJ1lRUPS9hAfLJEx0/BwBFk0jhj
         NJ2EfiuhFQLZb3gG0vY58McSPylfS6NBcFktjgjfuSbVqmqwrJ8Y1doq1GG5FId9MiZu
         m80jSMLLjxiWb9cXnLdCnZCDeLVdA7mMWuNbTnuYh5CGi+xOxu1V3QF6QZ1z3wvFa7W3
         mRPabzFhvmIAFoZmY/+Ze8VA7VCHa4EZXCebaPmVVXomYlzLxA2oiQTOHPM4um8POl1s
         PgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7QFv81gQq0eu9C0EvhgBKFkyhlMwBFtec+2sKfQ7kurat90IhEGgG9AwlXbZ0r3cIERkE+vxITYPuDpEG@vger.kernel.org
X-Gm-Message-State: AOJu0YwbJrTLeZt6Ut7T2uRfcsIDPWbIFxv4ZgrhOueRJu1qkFoD5B3l
	HQnMOojhBOI24+Lr32g82yJv80Za7VGU2eXoIqWB/C59FicYzqkY0tJ6hHbPZJrp7Z3xVgudw3R
	O7qeudWMOBrEIEdC2z2NsfHJxzpBJkg9BMHAqc5Mkyx0OTN22Zdxxt+6TqXW0Ahwb
X-Gm-Gg: ASbGncsdKW6dYBk9fXvO3BWRxdwMe8tDTtre5TvVC1MjTenzcuA/C+c9NWiLzeMnAvv
	oheHv5QtM+2kI1IqRVBVs8y5u5OZQdQtezoOhKUWjR3bUX18nRJfa1tLdENXM9tkU8wsseZ7Ioi
	s4W79whJeKXWdipS5/rXS4Kt0c0ctxl5rDLcjWvYwsa5YHxSCPIi5KGNvHPQ/tjMugWnCeKNQwS
	oyvNIFu1DQT2XRoQ9IXzcnTdH5KfC0cpdPAZdDKsrAkijW03SoRRZA9H+Qa0x0I3GDK1n2fYah0
	rd/jQ8QvEATdB43CRaGxpF3ZaOl56R2TOsxyPTH9Ts4a09gizlhwat33cEzvtczYrik=
X-Received: by 2002:a05:620a:319a:b0:7c5:6fee:246f with SMTP id af79cd13be357-7cad5b37edfmr776320985a.1.1746460899151;
        Mon, 05 May 2025 09:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+/p0BrecmIrDNm5RILVrBtCb7WrTDff8xHjP9/Y7QIwhw3Dv3HKuLgZUUhA3XQT8Z4ktRng==
X-Received: by 2002:a05:620a:319a:b0:7c5:6fee:246f with SMTP id af79cd13be357-7cad5b37edfmr776317885a.1.1746460898565;
        Mon, 05 May 2025 09:01:38 -0700 (PDT)
Received: from [192.168.65.169] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3cc5sm521149566b.51.2025.05.05.09.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 09:01:38 -0700 (PDT)
Message-ID: <0f64aadb-badd-497c-b936-7644f5c5021a@oss.qualcomm.com>
Date: Mon, 5 May 2025 18:01:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] dt-bindings: serial: describe SA8255p
To: Praveen Talari <quic_ptalari@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_mnaresh@quicinc.com,
        quic_shazhuss@quicinc.com, Nikunj Kela <quic_nkela@quicinc.com>
References: <20250502171417.28856-1-quic_ptalari@quicinc.com>
 <20250502171417.28856-2-quic_ptalari@quicinc.com>
 <20250504-hilarious-ultra-grebe-d67e7d@kuoka>
 <6f97510c-eb6c-4f3b-b219-aa8d895b060b@quicinc.com>
 <20250505-ostrich-of-impossible-conversion-a0f8ac@kuoka>
 <4ebe065e-9686-4e35-bb00-a9e816fb8926@quicinc.com>
 <1de5c0b7-7761-4d0c-bced-7e26150e995f@kernel.org>
 <d96eb6b7-5b48-446c-8b33-ba282d896e85@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d96eb6b7-5b48-446c-8b33-ba282d896e85@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=6818e0e4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=4zt5D2LFsg2i9ozxeDMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: I9n3es1CS50CvwfLOe1dXOC42kYrmdDB
X-Proofpoint-ORIG-GUID: I9n3es1CS50CvwfLOe1dXOC42kYrmdDB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE1MiBTYWx0ZWRfXzZCUeE236Mxz
 1C1Z+VZSrGhUmSNGJQPe0jZiUcO/T+yB5p4uoJYbEzeRVYDpNUr9jknQvvY2ipkK0WFxJI+/Nak
 lPaaXR/2a4yWqXxg+gsf077vZEZbZQQSS4m1hrLaLOcB36DxdEQy36VfpEe7791ICVFsdvimkdN
 aECP8OgqiFkeStWo8LWa+iNnPTws3ijs6FMT2wjCyUtiT/VVk1394fEiMZmdfzneSfDapSb8mA+
 1YT+rStUsHQl0okCuLerLJ7qsqq7nKWEvEOgecPy8jce5We1pAMnTZPMk1prEiiZGC8YcKKiodi
 4MAMIc7JTgbsErxCcjS8XbLR3DlA72QeoSD6erAnDmo4Ygtq8NBjYgWGCVg7eYD+yy0DXZs77Jz
 Aq+w9g4o7cWlOmSyllNUyr4ddPkpKGPzaFD8EJVMauS2xUobRYum/pnOPRL4ig8ZyRKW0Gzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050152

On 5/5/25 3:42 PM, Praveen Talari wrote:
> Hi Krzysztof
> 
> On 5/5/2025 3:29 PM, Krzysztof Kozlowski wrote:
>> On 05/05/2025 08:51, Praveen Talari wrote:
>>>>>>> +    serial@990000 {
>>>>>>> +        compatible = "qcom,sa8255p-geni-uart";
>>>>>>> +        reg = <0x990000 0x4000>;
>>>>>>> +        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
>>>>>> Why isn't here wakeup interrupt? Commit msg also does not help me to
>>>>>> understand why number of interrupts varies.
>>>>> Currently we are not using wake-irq because it is optional for our current
>>>>> implementation.
>>>> Great explanation. I asked why is it optional, answer because it is
>>>> optional.
>>> sorry.
>>>> What does it mean optional? This is part of the SoC, so how given one,
>>>> fixed SoC can have it routed or not routed in the same time?
>>> the serial driver doesn't enter runtime suspend mode until the port is
>>> closed.
>>>
>>> therefore, there is no need for a wake IRQ when the driver is in an
>>> active state
>> You described current Linux driver, so if we change Linux driver or we
>> try for example FreeBSD, then bindings are different?
> 
> Currently, the driver includes code to register the device's wakeup capability
> 
> but it lacks the necessary handler code for wakeup IRQ. According to the serial driver,
> 
> the wake IRQ is meant to wake up the device but the device remains active because
> 
> the serial driver does not enter runtime suspend mode until the port closed.
> 
> So it is better to exclude the wake IRQ until the appropriate code is added.

No, dt-bindings must describe the hardware in its entirety (to the
extent that software differentiates it), to the best of our
understanding, the drivers are free to exist or not, similarly they
may not implement all the features

DTB and kernel versions can be out of sync, so having a complete DT
description saves us from having to add explicit backwards
compatibility clauses in each driver and maintain them for the next 15
years, as well as letting the user update the kernel without worrying
about a breakage

Konrad

