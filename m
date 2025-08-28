Return-Path: <linux-arm-msm+bounces-71166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6BFB3A635
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 18:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FD81167B80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 16:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2F4322A05;
	Thu, 28 Aug 2025 16:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NiKz9V7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B4A30ACF7;
	Thu, 28 Aug 2025 16:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756398379; cv=none; b=olgzLe4YDV8qNCcF26QwgDLNMO52iHDD2Wus64xwFqjt4pQVCBR8m7ZW2qqb3qjPbxrmhiuuc/KecmNyAEvSvsFy/8v6pVza5koD3boDiS8+yA5XIYxLyLDOa75QG3rG51WSZ7xfRYzt7uysOFqO+1cYmmi1KICrlcLocAAxDec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756398379; c=relaxed/simple;
	bh=ZrhL90mSFpWiyRiQ66giQmCc0rqGDxKFiIH0JgvGILQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LQ2s9s0xbEN4hggeSh+yvP7Y4UGx6n6NVDjEyJJrvZBJ9iIgMHteIIvn9+4GHKrBg2fwMpt265iXtqPq441KRA9SiZ0e0xYSQ3XeHfTOiYtiXSjKgiYyZKPY/+v7n+ppRiY1G/FRu7SUy9C2oq+NfO/Fopey/D7NyfYbREuQyC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NiKz9V7l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SEe2Da031265;
	Thu, 28 Aug 2025 16:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjiAeXzFybeA7E4LM8Uz/Vl1hr3bxMCWl4a7J0Ef13o=; b=NiKz9V7lKYP9y9g4
	M0PC2j/NdTqEO55STPRntRXlpDIs0P2NT0levLUx3zYOxToXcNNhyBkNkTmjZqi9
	M9YD983wGyfno4W5+uSNQs4GR1pyC7a0YrYGpwCujeb4dlLwFW6KXk5cQd4pp2MX
	x4uZKsSkhvRVbJOasy+fuSLgDrHNiFp2KOdvlfwqqpmZs5jojYFzD4/5qUbZWmE/
	e62gifby6sTPF9mGNGpcubwimnikoEjN8+BuxOc/vb7P5oGiEzbwpdQjRMR8Y/2f
	ilxyY10TQmA/rhWHNFTviojx9ZobSp8rWoCc8wCQ/NM/4C6UD+taXoxLkjryC2de
	3a3stA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615rugf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 16:26:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SGQ3QQ009300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 16:26:03 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 28 Aug
 2025 09:25:59 -0700
Message-ID: <03402267-3953-462b-9e3f-b0053a9cdcd8@quicinc.com>
Date: Thu, 28 Aug 2025 21:55:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
To: Bart Van Assche <bvanassche@acm.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
 <20250826150855.7725-2-quic_rdwivedi@quicinc.com>
 <9944c595-da68-43c0-8364-6a8665a0fc3f@acm.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <9944c595-da68-43c0-8364-6a8665a0fc3f@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX0CyFywQN/ddH
 3udbOGvLCq6178pIVN2McB+dSt7psGAQtNiKIY1uy+gaMpK+GffoGse6Vuiz8Ys3EYmOn/ks3p2
 NtZaMFQ1ya3goqVJzYlaL6BjnoRziUekjXZngKHs0aKtJQpY5RT7W9n9v7/oadd3HUl7hAx/Lr5
 TmIbtKhNXEW09VtdEijo2ZwX+4JkZVu7/lGYsUtpxI0/Bdb4iDNUZwg7GOPx39p70kleH0GYUhI
 Ljc52HUkYHaPyjMh9SV+/yS6bu4FL7S6V7o50OiHqtMxzwDpvFtV226BEMwtp9dlpklEq0vxEiV
 tIgxiVpMEEJxFh/U4fDtGdkp/gHmsGC2AHrZ58uxayZ8/gPTIpal3Fg3rFArmGTnV15J6eVHD3p
 OP4Bt/QU
X-Proofpoint-GUID: Q3IoQLpxS9zKfv_pv04WHPdTAo5Dhm7S
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b0831c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=1l4myg9UuvIpqwvpMjoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Q3IoQLpxS9zKfv_pv04WHPdTAo5Dhm7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034



On 26-Aug-25 9:05 PM, Bart Van Assche wrote:
> On 8/26/25 8:08 AM, Ram Kumar Dwivedi wrote:
>> +  limit-hs-gear:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 1
>> +    maximum: 5
>> +    default: 5
>> +    description:
>> +      Restricts the maximum HS gear used in both TX and RX directions,
>> +      typically for hardware or power constraints in automotive use cases.
> 
> The UFSHCI 5.0 spec will add gear 6 soon. So why to restrict the maximum
> gear to 5?

Hi Bart,

Thanks for the suggestion. I limited it to Gear 5 based on current upstream support. 
But I am fine with updating it to Gear 6 if you prefer, to align with the upcoming
spec and avoid future revisions.

Thanks,
Ram.

> 
>> +  limit-rate:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2]
>> +    default: 2
>> +    description:
>> +      Restricts the UFS controller to Rate A (1) or Rate B (2) for both
>> +      TX and RX directions, often required in automotive environments due
>> +      to hardware limitations.
> 
> As far as I know no numeric values are associated with these rates in
> the UFSHCI 4.1 standard nor in any of the previous versions of this
> standard. Does the .yaml syntax support something like "enum: [A, B]"?
> 
> Thanks,
> 
> Bart.


