Return-Path: <linux-arm-msm+bounces-58170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D1AB9611
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 08:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DA467B1C6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 06:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C295922370C;
	Fri, 16 May 2025 06:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZacF8oTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4ED21CC4D;
	Fri, 16 May 2025 06:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747377390; cv=none; b=pBYo81BvZLLZAUaAWpaNWvz1YDxfXFXRgVLW4NgH2se/ntQgDnMkfGNy/BoXj5iDHt3kwZCVGzYbo5zJIgRikRbLDfxzRWwsOunDhqP2McRQwktRrz0iMwTM06LiSNeEjdKbLZYGFVayOJVIR6lAYPHApXxpe9XFaZaqcyY/zSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747377390; c=relaxed/simple;
	bh=ha4URqno53+8IBqXFpktJS1GXjWV40bui4aNG0QuF8g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Xr+1Gv54EIm66w/Xzwo293QbOh8d0g+/rThTSFir0HpSSw0ks+9yxMyDjBLNF5UYwVkhAu5D62jD31HPkqAyqJTAO1V6l67v8m6gSOr6Ss9TVFquwsSnkkdPIJx+pst4U7BjOns12+L64ip5bhlAbHIJ3bSQaO3BPCMafVjwz/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZacF8oTr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G37mmC001154;
	Fri, 16 May 2025 06:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WaMAGfBbgDWG1NFAeAULSkUJlJOsNpmee8ZzO7nXfBc=; b=ZacF8oTrBc0LqKLx
	P0TgtGmMl5Muu690TCV8cZlH52BH0NOj8ltic8NRNgE+sUzpVPHwnQuszZLvoiBo
	0LDg4/zVCUf0/vF8qmFlfdwz9OvDGr+o6fFkowoasFXLDCwhCSIVHrZjl1SSehGi
	kVfrq9ttV4f/peQrPchYdH19+5Mhx4rGEfsfl3q+QaqKgPX38QedT7rue8wM5+O4
	57BhgQVeeRGfbb+MvSNoaj7KRcHHH2teuCpW209cAtPeOWHDta4ylcu5ezYDgRWl
	6J0iJ+AlkNIdRA/v5WTYNxqC3s7cIavhMqOxZEMs6FCCJ5y+liI5w3OB3pLj5fQr
	JqC/EQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp0w6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 06:36:24 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54G6aN4s010065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 06:36:23 GMT
Received: from [10.218.32.171] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 23:36:17 -0700
Message-ID: <df6386a1-5b4e-46d5-a431-6ca136a87980@quicinc.com>
Date: Fri, 16 May 2025 12:06:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] dt-bindings: serial: describe SA8255p
From: Praveen Talari <quic_ptalari@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>,
        Nikunj Kela
	<quic_nkela@quicinc.com>
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <20250506180232.1299-2-quic_ptalari@quicinc.com>
 <35659475-862a-4678-a2a5-173c2254ae60@kernel.org>
 <2f3e608b-5536-4c6d-b7ca-c8cf4c9d0b1b@quicinc.com>
 <4b2c24e4-d515-481d-a00b-d50ae57304dd@quicinc.com>
Content-Language: en-US
In-Reply-To: <4b2c24e4-d515-481d-a00b-d50ae57304dd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9LDWp9enGqWWGUhQVSS3gMVl2DXkuiyY
X-Proofpoint-ORIG-GUID: 9LDWp9enGqWWGUhQVSS3gMVl2DXkuiyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA2MCBTYWx0ZWRfX8QSRwKutBXH1
 ZTw81ApNsrFIp8iecc7noiNQ6l3Gc7NvTl9krPdGVlBbfZjbBdvzv2qhJ08RnUylaaQExr9Cgfz
 gatUHQ7vr5bIA8ReKdI8pNa5Vupi3FOGVn/MX/K77MBhTTlwnzd0YSzpVJo/7FRr4XPV8nBPDNw
 fftTO6svgaamIvfBmsTx+bL5WnSKFO4LPkXNrN85qGQcIUsEXS0Drain/WqBVFwbDTlp1o3Vd2c
 K1qZd4n4So78WpEP/IBejfOw5Ks85RUnPhNUIakD2iibRjFwfDNJwrnNyVSjN0WXO56qqMZ9cLu
 GPX/QMDSU1hxTABD+Jc8gfcoRALFRNqQn9yVdnqF8FvfbkcJssMu1b6e7MrCd9L/UsVOoONZ5bm
 AdQuCroGNwkCee1TOT5YHWr2yt5KQbb+QXvjmtrUMaeidd+IE/K3AyUsJ8VJcBrLm5gQXx+1
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6826dce8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=Am187KbwW9CzcosyEMcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_02,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=943 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160060

Hi Krzysztof

Gentle reminder!!

On 5/9/2025 10:02 AM, Praveen Talari wrote:
> Hi Krzysztof,
>
> Thank for you review and valuable inputs.
>
> On 5/8/2025 11:15 AM, Praveen Talari wrote:
>> Hi Krzysztof
>>
>> Thank you for your patience. I consider your inputs as valuable 
>> learning.
>>
>> On 5/6/2025 11:53 PM, Krzysztof Kozlowski wrote:
>>> On 06/05/2025 20:02, Praveen Talari wrote:
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - qcom,sa8255p-geni-uart
>>>> +      - qcom,sa8255p-geni-debug-uart
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    minItems: 1
>>> Nothing changed here, this should be dropped based on previous 
>>> discussion.
>>>
>>> You sent this v5 on 8:02 PM of my time. *THEN* you responded to my
>>> comment at v4 at 8:05 PM. That's the way to waste everyone's time.
>>>
>>> I do not understand why interrupt is optional for a new, complete 
>>> device
>>> description.
>
> To put it simply, because we are using the RX GPIO line as wake up IRQ 
> and not all SE related pins are mapped in the PDC,
>
> there is no specific wake-up pin to define. Therefore, the wake-up IRQ 
> should be considered optional.

I hope this response has addressed your query.

Thanks,

Praveen

>
> Thanks,
>
> Praveen
>
>>
>> On this platform, there is no use case of waking up UART, so we 
>> consider the  wake up IRQ as optional.
>>
>> Thanks,
>>
>> Praveen
>>
>>>
>>> Best regards,
>>> Krzysztof

