Return-Path: <linux-arm-msm+bounces-59648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A8AC610E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 07:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB33D1BC25D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 05:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4627F1F582E;
	Wed, 28 May 2025 05:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SiUG03Wj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1931311AC;
	Wed, 28 May 2025 05:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748409034; cv=none; b=AihNlYPDE0zCPlTGLdo2WSllJ4BPnB9nxxI4NasVK+lC76nQ+Ss2nEPWYUFLMjj7j/EqBX0U0k2i7m+sYPsjQCeEXS4sC0gxz6uejTJaQ2hsp2M0ec+uxLzZfLRpOrImWjmTGzB+pAJTq8mGfTo5F7eAwFsXPHhN5EQpRGnIDBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748409034; c=relaxed/simple;
	bh=ouTR8OMSlzgRcCFldOeftgpUh1qdqQW/Oq/iU4E+u5Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=tUQY053088Evmm8Epszah9sVRX8qxDjS+OvCcJs23l5EvR8hWAzjr7/8ZN2E8AqIieceO956ehEYs54RopGA0InMD3xwoY/X7LP5hPBnvXrV5UJFBxgRwtV9mACc8xgpFVd7j1whOS+SsU/j5hqnuK05q32EGQ+d2lccdEe3T8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SiUG03Wj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJnYOe027383;
	Wed, 28 May 2025 05:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJdDHVkAnG0QT0R+tJQOwTJayaRqYiOsuAxnnKUq950=; b=SiUG03Wj/Ra0DXFc
	zPXRAbPSt4njBxFPwKbfCHAqL2TYT2ryB7kWYxXbwWMf9va6Ihv4srhl5Kj2+x7C
	zW3d6Gw10L0wRYxm9A+9jlj5Sb6Gyh1+d8u/UoTN1sKhDEn29TGitP26SRX5NKIY
	z6kDIKMA4CEZxHl4+NTLfgMgkrHgmvrPco/J28xGTEOnAVUdHi2otUVMN67G53sO
	qZo3wdlwDUaSwg6/ozaEqfk11FNSA0D4+sXEkyOscut3RtP2P7wJ3tW87x/mm1Xb
	1fcTdVeNnukCt4QvXA/E3EKasMDurMSO9RZVwvta8V6REfw3ClMoebT5nD7F3Oni
	frM0CQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p94vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 05:10:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54S5AQkw027223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 05:10:26 GMT
Received: from [10.218.32.171] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 May
 2025 22:10:21 -0700
Message-ID: <1bde9d17-4e99-435d-952f-efeea0dd6761@quicinc.com>
Date: Wed, 28 May 2025 10:40:18 +0530
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
X-Proofpoint-GUID: 5JhaxWHAcCKc9OISxS8eJ0izZzKaulAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA0NCBTYWx0ZWRfXyv+pUT4K+iWb
 +1W/Hljcw5rdTgpTX5F28zx2/svS8p9+BZwB7ogT6amXh5dv6pzuNW7PeT0ZKKOl9O8+E+4IfHt
 9SI3NEMsnszeElBCUsTreWm/J8JWXeoTzyH9xA9wCN3yuUu3who8D6Yr1pB1rh+4vjKVLuQQNjt
 hdg7WPU6KB54QkyWDDqfqvtJb/nMBEw7bFmlDtzJQDBr0ynQVFTVWc3/0OjuFB9pcUMZ795zezh
 PhMLHcKLCXEkCSvybtZphfQ12jX9uYCM1cD7Vtnz5d7P5tx0fXMqglcjaYRhGHt6G8xKToEnSgA
 AlW3FrWFEC+0cnC70V7sedC/KQebgEF10cJoCLCIAEsB+hMCZFHulExx5p+UKdv2Xd75g/8gjIe
 g2vi6HIX8NDRAhv2QCkkXKeF30XhLnlTwCWcHbUdPn5w8uZRjH8NgvQMFimBCHjup5RhEGby
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68369ac3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=Am187KbwW9CzcosyEMcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 5JhaxWHAcCKc9OISxS8eJ0izZzKaulAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_02,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=952 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280044

Hi Krzysztof,

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

Praveen Talari

>
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

