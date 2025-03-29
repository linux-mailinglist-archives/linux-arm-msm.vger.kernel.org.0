Return-Path: <linux-arm-msm+bounces-52825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F08A756AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 15:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0229916F1D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 14:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698DA1922FB;
	Sat, 29 Mar 2025 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cifIv/QA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3096322E;
	Sat, 29 Mar 2025 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258685; cv=none; b=IoxCYtsy4rBkjeuWLbm4yWZjcneirSHJ8JQwnAxBd3fZbU6JEb1XUPpaIk/0mcN3CMHHo/0AfuWTz5gyxI2K2DVU0FHYdztrym4ZGCdTKywDsPoBHtVJ4uvxra3RewuGRM9uAKkgj0GZ5v/QH4B15NMgP7RpgL3HlLNlL4x0gRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258685; c=relaxed/simple;
	bh=Yx3IR/M3JUiaq7t3IZjt+0mZMncu92M93RmE0vOeBZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E7zxY/Dxls9ZzD2UgQhJcpf/JWIN1wNXH8uKILdzX8K8Uo1hT2kJ0RinsZ6/P8ee/rqTV2zVE5FhEbC2Zy0qITeVvDWKPEz6l8OS9fcFBU38B+SJXrIikAJvehBEkoAXGp0I+N8VBE6gkD9QpT74Vq5nq9BG23f/HpOryUZ4BD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cifIv/QA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52TD8DRl027703;
	Sat, 29 Mar 2025 14:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7JGWpf4zSqQHxjFlFAOFoBTH0UKM5nfoIZyrOVrklU=; b=cifIv/QAEV+lRetw
	Udchh9z3Nv4/ZnIOHgnydEm/SwNNnNFKDWjgpUGIEG1l3hg70ads47irsWBvZVtI
	s68ND21o1lyLnNYOrPHbrY+rg51qq3kj8Jm/cfHjmN50SLHhRWcFEVjRmrwWkt7K
	FyjNN17mxukBbJi+miFpVaUz5ZrdsmZGB6YAKEBNoNoktuAjWzBurPw9sABhm635
	6fHCp42MwaH3U7FVkO8Kga+q2mdfjYcjzWaullKZ1Ln70dcG17XuSzZaOJgskjN5
	8QjIwJ/QSUT2UBib68V9YLhEu5fAWKGDtz4TE5Nupr2+204ISNGA84t9XJtAyz3P
	FO6vDg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9890v22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 14:31:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52TEVBa2023088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 14:31:11 GMT
Received: from [10.216.2.59] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 29 Mar
 2025 07:31:07 -0700
Message-ID: <838dfc8d-24c3-4f03-9c24-863259bb22b1@quicinc.com>
Date: Sat, 29 Mar 2025 20:01:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
 <20250326141641.3471906-2-quic_msavaliy@quicinc.com>
 <991b0652-76f2-40d6-b49b-1e6f76e254ac@kernel.org>
 <661e1a21-0f3a-497a-9b3b-fab284e30d19@quicinc.com>
 <36b67f9c-5905-4fa6-8190-ab980850b3a2@kernel.org>
 <e997bd15-728c-4316-8050-d461f115fd9f@quicinc.com>
 <04945ad2-1372-4c73-beae-fc6449fb9a76@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <04945ad2-1372-4c73-beae-fc6449fb9a76@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67e80430 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=bnyXp7fuzn0CGs69xTYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: MLNCRU1aZpFZEFVeXiHbbgMVZQRbktZ8
X-Proofpoint-ORIG-GUID: MLNCRU1aZpFZEFVeXiHbbgMVZQRbktZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503290104



On 3/29/2025 4:36 PM, Krzysztof Kozlowski wrote:
> On 29/03/2025 10:08, Mukesh Kumar Savaliya wrote:
>>>>>> +  I3C in master mode supports up to 12.5MHz, SDR mode data transfer in mixed
>>>>>> +  bus mode (I2C and I3C target devices on same i3c bus). It also supports
>>>>>> +  hotjoin, IBI mechanism.
>>>>>> +
>>>>>> +  I3C Controller nodes must be child of GENI based Qualcomm Universal
>>>>>> +  Peripharal. Please refer GENI based QUP wrapper controller node bindings
>>>>>> +  described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
>>>>>> +
>>>>>> +allOf:
>>>>>> +  - $ref: i3c.yaml#
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: qcom,i3c-master
>>>>>
>>>>> And this got worse. It makes also no sense either: how can you claim
>>>>> that this covers all possible future I3C masters from Qualcomm?
>>>>>
>>>>> What was the resolution of previous discussion?
>>>>>
>>>> Below was my understanding and reply.
>>>> "
>>>> I think i should remove const. kept it for now as no other compatible to
>>>> be added as of now.
>>>> let me remove const.
>>>> SoC name is not required, as this compatible is generic to all the SOCs.
>>>
>>> I don't see any talks about const, what are you referring to?
>>>
>> +properties:
>> +  compatible:
>> +    : qcom,i3c-geni
>> will this be fine ?
> 
> Yes, I think that was also suggested by Rob. Or rather follow existing
> style so qcom,geni-i3c for the compatible and filename.
> 
Sure, makes sense. With below i3c becomes similar in naming conventions 
to spi, i2c, serial uart.

Driver file name : i3c-qcom-geni.c
dt-binding file name: qcom,i3c-geni-qcom.yaml
compatible = "qcom,geni-i3c";
> 
> Best regards,
> Krzysztof


