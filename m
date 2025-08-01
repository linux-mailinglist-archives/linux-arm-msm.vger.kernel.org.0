Return-Path: <linux-arm-msm+bounces-67323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C25F4B17F1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 11:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A58691AA0FF2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F933220F25;
	Fri,  1 Aug 2025 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m02Narbv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32FF14F70;
	Fri,  1 Aug 2025 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754039988; cv=none; b=s1/Jp9PaitrL7i5FxQ4B5hHpkLpjvticqLarL2B/BCPcZAzWyWD9bs94hqSQ4q2kvjGT0TpGoBia08oUfuj1Bda+/J/YD+2DNETvzX17JBrKhFi9yIHtpigpGWgj5Iqx2BUsl4K6Q28qsdcTsQGJ8/jHhYZ73WPs6db5aulIk4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754039988; c=relaxed/simple;
	bh=KUslAaHshNiP9XtKMRFYG5/AAWdTBX8QI/ME/Hmi5s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TSyFOSsDF4EyY70QGx0N+UftMbnsMdTBFHEv+qWVXvDH1461Mhh+DT67oMJBx6Em1EIjO4yOeVjZwWf4RTcg64hlYIzVHA73OjJ6NSbrcyspbVcC7dtI0dON0mlK7so3QuH6MKmT53KZDpgjby7KWuA2t5KGurEW/jLnN2pwcTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m02Narbv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718mdn2001318;
	Fri, 1 Aug 2025 09:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wkDHzH8PytjlT3iOlVClw/v1tB31SfTOT8w7bQO5blg=; b=m02Narbvil9W4U44
	Ar0h6sKWF22qWO1Cmjomemd6b83r1PyUBQ24rCS+/O7EiBau2l9Qr90Xv2QrYE7l
	3qhLWJCkrrOFI1LLhgtal+KEwspl7mn/F7PaaMHeqbzfOErB2DKEA1OoN+YD+ROh
	Odlz77RzyO8Sr+OBE0kWVn5TEDhvMw+q6JLSwdcj5eX+s4SWjT6KWoCyJPsvWgqX
	s5aoen9qB+7F2cEOhNSK9byWflGVd+MiQO8n4HYavu3x2jGhGgFxl/uLmJdLc6Vq
	Y8Q4aFNJZZ/0U6nv6CEEuGYZunApc1O4YfucTszxEYBxJ8fIi+wiDq3Jv9uc2/0N
	+iN+Zw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyubq01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 09:19:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5719JPlT012529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Aug 2025 09:19:25 GMT
Received: from [10.216.46.165] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 1 Aug
 2025 02:19:19 -0700
Message-ID: <e8cc99e1-d117-42cb-8dec-47809f637934@quicinc.com>
Date: Fri, 1 Aug 2025 14:49:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam
	<mani@kernel.org>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-3-quic_rdwivedi@quicinc.com>
 <2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>
 <jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
 <03efb3dc-108e-453e-91e4-160a0500cff1@kernel.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <03efb3dc-108e-453e-91e4-160a0500cff1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W9BHbRSc9VHVUMzzL9dDJakFIxci7FAv
X-Proofpoint-ORIG-GUID: W9BHbRSc9VHVUMzzL9dDJakFIxci7FAv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA2OCBTYWx0ZWRfX58DP2tsPUlNw
 TePdhd4wuy2/J0UYNDRJN5DJb31zhVAULG+lzdd/p79/SrFNuD0gRO2g+H9IPq8dE0VDSfhErlR
 khLbohR57n8y4TpvpDgUYGjCmTzuMqg0TjPQWSXJBVNWDg1Gzg5NorUzvOK9qq0Awtlmgo0+dYf
 tJYc5rAGI7/C/BSW5D16kfW1XXs+vyMFUPCGVH4OBIQLFNLZPqLrxokWJy1bHIlOe0S+NXh49Dv
 qUBSiQ2Md/OD/S/Ec/CQxW7eC7wOfvd5CIKghVnlHtKZT4WVfcoC+c0LIuDc9KsyPPFWvAHgVC1
 u83dVQEa/kQQR0aOCs//GmTRws03WKPjLQ0j0ySk339WPUT+U0KVx9lGZhTFHafOdYS+MyRaVz8
 PFGi4uc23bNV1AkHbyBAiPufKvvz03dWq2XqaU7AzrniNS+44IEvuPoi8kUL8XE8alaLUzNL
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688c869e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=l2YULQpEWTdrfJCYAS8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010068



On 01-Aug-25 2:34 PM, Krzysztof Kozlowski wrote:
> On 01/08/2025 10:28, Manivannan Sadhasivam wrote:
>> On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski wrote:
>>> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
>>>> Add optional limit-hs-gear and limit-rate properties to the UFS node to
>>>> support automotive use cases that require limiting the maximum Tx/Rx HS
>>>> gear and rate due to hardware constraints.
>>>
>>> What hardware constraints? This needs to be clearly documented.
>>>
>>
>> Ram, both Krzysztof and I asked this question, but you never bothered to reply,
>> but keep on responding to other comments. This won't help you to get this series
>> merged in any form.
>>
>> Please address *all* review comments before posting next iteration.
> 
> There was enough of time to respond to this, so I assume this patchset
> is abandoned and there will be no new version.



Hi Krzysztof,

I was waiting for your DT binding bifurcation patch to be merged before posting the next version, which is why I didn’t respond earlier. 
I had planned to include the hardware constraints explanation in the next commit message.

I’ll make sure to address all pending comments in the upcoming revision.

Thanks,
Ram.

> 
> Best regards,
> Krzysztof


