Return-Path: <linux-arm-msm+bounces-71168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B7B3A6C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 18:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00E663BF41C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 16:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8A0239591;
	Thu, 28 Aug 2025 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gp3eUQDr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B880C22A4D5;
	Thu, 28 Aug 2025 16:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756399533; cv=none; b=HckIpRBDeU9+PS9FPDyqFCwE/q/YOOoxLJBOnWC6bLRANp7BVXB0rOihVdVR8Uzrkolb3Kuhp7Xk4aZxRxYhwiRJXavX2KiZmDzCKa5F11t+671rwqbXJyhbQxMgJtZkIxEXoduYqnb0RCNIO5ucw0FSJREE5L7UsrAtFCe8n4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756399533; c=relaxed/simple;
	bh=ybJ1f8sBP5axyBxUa6IjKhhSOFJ+7mVTnYkNAwqNI6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tEQdO4yK/6AY30swd0xTT9ydv1PKHOOa4IVgrStIst5nUIfIu0o7qnr6ztxsMKX7ZnV0y8n3Fat6912fFQshSXVPepNLZ6Ldua2g0IP3OElHCs6J84sleg1/jE6j4nr+zEPAHK87dJ+/AzZxcCdcOeNSwlCpqZG44ASWmkkoL/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gp3eUQDr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SEOjrX030104;
	Thu, 28 Aug 2025 16:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+zrw1XxE5Jzdovbrl0Kr12pWeJHN+sdic6+TdiAkcY=; b=Gp3eUQDry5LNXElk
	LialPHIcKeDtxqa2HTryv9BzHLxg2bV7kQ0+sLhBNdCANkwggG5AIPKhfbZowaLt
	voC+xXnA+EXrj0e8XkQcSZhm54erjX+m+Qb4JcM4kBoxHr+oMBO/xE3wrFYrldfg
	rhWQLMSmiP69wXJYteLmkqvmAzxnoEgUGVeWsh6GKW8CcXQ+IZhOdiF2zFe/H5cq
	oTKLJVo954iIuGwrS875hgfAc2AeGtGR8hBcp/obvILD00N9gYgkLVKg5AjZTez7
	CM1HOeEP/LWlEQPAPjbvo7Xwr8BmyLZL2WRtu+hFEYL9w7JVqiBxSkfNAwqKM9Fo
	ywxf9g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5up0tbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 16:45:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SGjHwY030600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 16:45:18 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 28 Aug
 2025 09:45:13 -0700
Message-ID: <8d705694-498a-4592-b93a-7df6a1dd5211@quicinc.com>
Date: Thu, 28 Aug 2025 22:15:10 +0530
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
X-Proofpoint-GUID: OIZbKr9G7_QKE2ZRxphkiSdihz1WdmEw
X-Proofpoint-ORIG-GUID: OIZbKr9G7_QKE2ZRxphkiSdihz1WdmEw
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b0879f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=1l4myg9UuvIpqwvpMjoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX9bjh0rHnDqbH
 CTKRTtbPPV3MLRG+bO747gUjE9Cl8bfKAFK32jbRkmxk6frppPoH1mC/as31a5uVQMGyfynlkpf
 C16WF205BOKDTOKfNMT4vVe/nxQjIdqJIq0Xwt92/1fXwz3b7MmDgdqYYITZIHgVVW7/VIEf7pE
 McgDLJrPpI+Qrte78KAuBmFI144BW89649rvRltcBCEA5VT8bmWTJ6+ccb7qNHUM/lBC8v6Cte6
 p5XaLbeyAUfI3bxq9pP1t+vdNqMMUMhfHbAhRtoHeM4wCtyMQUWqrMj1vftzZeXV3d31LMPXIXY
 x+ifwv2dlWK/sbltGashPoPo/GffC+NxesPhEKQjWBWzWJIiV6oxY0z5iFe/QGqsCV7PZPzo9Gj
 qCooHLb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031



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
Hi Bart,

As per the MIPI UniPro spec:

In Section 5.7.12.3.2, the hs_series is defined as:
hs_series = Flags[3] + 1;

In Section 5.7.7.1, Flags[3] is described as:
Set to ‘0’ for Series A and ‘1’ for Series B (PA_HSSeries).

While issuing the DME command from the UFS driver to set the rate,
the values 1 and 2 are passed as arguments for Rate A and Rate B
respectively. Additionally, the hs_rate variable is of type u32.

Thanks,
Ram

> 
> Thanks,
> 
> Bart.


