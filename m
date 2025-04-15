Return-Path: <linux-arm-msm+bounces-54410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC036A89B80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 13:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC094440230
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 11:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92D428E606;
	Tue, 15 Apr 2025 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hi5hOqjw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F4228DEF1;
	Tue, 15 Apr 2025 11:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715337; cv=none; b=VH7lgSJI6TInfTV4Pytz9P9aQxfTIGl2DFofGnIuI05m9U/MR+rWwu2iYu7vMNAcXh1couBk62INcmugrHqGX3rXSE4g4ABI3iqh86iOgJ6S3J6rNjhcZKXSFKKIylYOAruYqOutXVIZTUY3N/EUKpw+qy3pAy0lwg18ergPm8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715337; c=relaxed/simple;
	bh=cyf6aOq5K5ci6RMx4xG3AbjsXQn9rINF7Xjd0gLpgdI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=IJ9IXyuDBHWwKLm+/8dVkdHjJWbQoImU4i/re+Ccjn1EuICkofQ659Jw2W6hp5JfXKeaugBlWbCZ65iz9YGxPniREsIi151ct1kpeeN7meH4DOfAOsOinto9rDdt4lbAqMZunmlNok5rJXolbbUL78UdSQtbzpMpRuELzgn9j3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hi5hOqjw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tXTD002470;
	Tue, 15 Apr 2025 11:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SPJQT/eSawmiTnqZoilA6dL0SuUb0o3I9TRPtunBS4=; b=hi5hOqjwpRef4TMU
	cF04y9TFXOQd7kYHyEEK/Nc67av1cQ1uyIfq4/iyne+doeobKuTpMmvznuKKmfya
	xaxt+/n1HPAPSfgzaBXLcY9tseMj12ZN1xHKCwOvfZheO/ynJM+hoBui3jqSdgcT
	1mkMfYi0XAcGRR5vN3Map3kUN99wI2Jbm63KsHvmaCPFUAh/NUMbYeM1auNKmTF9
	+BDz7iq/iOJEe52/a6hc72lvpcHsQ27TvQF3TVTiroxlcZku97DLkK3eETm3UOBI
	vgZ+5iiMJn6GuqGFh4StouAMQ3Aunk16xWfAWzSuYV06shxiu3uVIsXV88ba/Ovo
	pd6VoA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vfw8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 11:08:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53FB8pa9019631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 11:08:51 GMT
Received: from [10.216.26.146] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Apr
 2025 04:08:47 -0700
Message-ID: <2b132133-9c03-4b7a-b59a-e0f701dfbd01@quicinc.com>
Date: Tue, 15 Apr 2025 16:38:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] dt-bindings: mailbox: Document qcom,ipq5424-tmel
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-2-quic_srichara@quicinc.com>
 <20250328-lively-axiomatic-starfish-f9c0df@krzk-bin>
 <321e1d4a-5aa3-49cb-8a85-e05dbaa08e78@quicinc.com>
Content-Language: en-US
In-Reply-To: <321e1d4a-5aa3-49cb-8a85-e05dbaa08e78@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qv3EqA0K8bhk-H5MKt6cVM8nNBweeZYZ
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fe3e43 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=O0SNEarKJYvUgdu6pMAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qv3EqA0K8bhk-H5MKt6cVM8nNBweeZYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150078



On 4/1/2025 12:59 PM, Sricharan Ramabadhran wrote:
> 
> 
> On 3/28/2025 1:32 PM, Krzysztof Kozlowski wrote:
>> On Thu, Mar 27, 2025 at 11:47:49PM +0530, Sricharan R wrote:
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - qcom,ipq5424-tmel
>>
>> blank line
> ok
> 
>>
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  mboxes:
>>> +    maxItems: 1
>>
>> Why mbox is having an mbox? This does not look right and suggest the
>> block is misrepresented. I read the diagram and description two times
>> and still do not see how this fits there.
> TMEL/QMP secure functionalities are exposed to clients (like rproc) by 
> registering TMEL as mailbox controller. The IPC bit to communicate with 
> the TMEL/QMP controller itself is handled by the apcs mailbox. Hence
> it looks like a mbox inside mbox.
> 
> Alternatively, would it be fine to fold the IPC bit handling in this 
> driver itself for doing the regmap_write (instead of connecting to
> apcs mailbox separately) ?
> 
> Also, there are couple of other ways of designing this as well.
> Earlier i mentioned this in the RFC post [1] for getting the design
> sorted out.
> 
> [1] https://lore.kernel.org/lkml/20241205080633.2623142-1- 
> quic_srichara@quicinc.com/T/
> 
> -------------------------------------------------------------
> Had the below mentioned in the RFC earlier.
> 
> The intention of posting this is to get the design reviewed/corrected 
> since there are also other possible ways of having this SS support like:
> 
> a) Make TMEL QMP as a 'rpmsg' driver and clients can connect using
>     rmpsg_send
> 
> b) Keep TMEL APIs seperately in drivers/firmware which would export APIs
>     and QMP mailbox seperately.
>     Clients can then call the exported APIS.
> 
> c) Combine both TMEL and QMP as mailbox (this is the approach used here)
> 

Hi Krysztof,

Can you kindly provide your suggestion on how to proceed for the above ?
Would want to align on the design approach before posting the next
version.

Regards,
  Sricharan

