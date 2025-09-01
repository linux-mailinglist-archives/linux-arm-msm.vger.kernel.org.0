Return-Path: <linux-arm-msm+bounces-71421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F948B3EBCF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 18:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 437973AB1BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 16:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F772FB625;
	Mon,  1 Sep 2025 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="due+l53p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3D62F1FFE;
	Mon,  1 Sep 2025 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742506; cv=none; b=guyEvH7I1CMvE1GwmZYYD0U4yBjOrx9LuapqqA0FddCm1+erb3zqcJNRHVKLQnDQ2N6o9d72mff9tdpTJzFwqeHLYC7LWO0NXGeFe/1jAaKIqPpnSGpKrgCvsXitww2pSDRvqWAggcdwtfydDzUn0O8hzi0UUs0cAy3sZFLu4qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742506; c=relaxed/simple;
	bh=CbuTuH+TBGhwVIFkBIL83TJMSHa8SRRB5lvz2oJbodc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YC9uC/+n8n6858Q5YmihkMDOBclU4kgMBqCYqFUbzIbx/+KwN6uhcGncuh/BpVXs4isNMQOCx+FKUlYINcpImOjMpqQ1aTqsCdxU21YcZQU7GE0q1NlRnFAiqctT0Yi63+x7g7yXaRV7sKPnW6Cky+HMrEnRAnm2EDW2j0rj9Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=due+l53p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4K9r015350;
	Mon, 1 Sep 2025 16:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSjAN16Iw0lGYq1u0vWwlJHyKeY8+e/J2VRH9cPhXtc=; b=due+l53pWbWAciUf
	KZnWo9ztP0CZEZNhluQBrYW6YjHJHFmiEwMO0yjFM+h8OSfxru8gi6rddw3ssrmn
	USMIzmHxJkQb8v1pE+WT8MMxV4X99lfJWU+oAj6qJLbaaGqy0Jzhmw3Axr6mqQ2q
	ZxhPqZfx7SlJpkxJq0feJV9cCHcMLwroZDmZJYYsLBuJOmWjxJUZRIkC1Ba0Kit7
	X6paji2eq1qJHLjhZRT143fxC8g4e+pyA9VX23Y/3G+AP4rLogdjqNloKkJ3FEuG
	itun4mB5rT3oVSHUc4UDCmr39QUIsbxujT+HcTpfmflL4BtvteNvwEy1DG1IjpPm
	aTEsiA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utfkd561-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 16:01:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 581G1XrE008156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Sep 2025 16:01:33 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 1 Sep
 2025 09:01:29 -0700
Message-ID: <922bd9d3-2148-4c26-a9a3-791586c67181@quicinc.com>
Date: Mon, 1 Sep 2025 21:31:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bart Van Assche
	<bvanassche@acm.org>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
 <20250826150855.7725-2-quic_rdwivedi@quicinc.com>
 <9944c595-da68-43c0-8364-6a8665a0fc3f@acm.org>
 <8d705694-498a-4592-b93a-7df6a1dd5211@quicinc.com>
 <cf203807-77ab-463c-b0b0-4a1cec891fe6@acm.org>
 <6xgsb7thoo7mquz3mxuyhliuqtvrbxj43nc6ga5qpcgcz4ro4u@doe2253ydjbj>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <6xgsb7thoo7mquz3mxuyhliuqtvrbxj43nc6ga5qpcgcz4ro4u@doe2253ydjbj>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=eaQ9f6EH c=1 sm=1 tr=0 ts=68b5c35d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=jy_iQL8k7Q2RHFkZsNwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 9o_bWBcIItoGcBJXTnIHbpisg9_rDKSv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MCBTYWx0ZWRfX1wBniPO4V0ln
 hyiYxJhQZl8eFzqTNVXxQj4mX2upheLuhs0JMzLRVCtUsfEdoSpVtbzkejK74GeyPz93j+/QqnG
 FCB7wFIyBMSXNRHDDbe6+Bn+EwtJgJDL62oskmDH3zth+EciDfKItNhMEdhPysWDBgl5In8wmv/
 nDqGQNA/Tl5/uBu+ASzawx5UunTIOz6XnJJ2g/X+PIwKS+ydkJNqoIDTGkdnck4ceysYPTpXDRA
 QB+WZmt8KePlYLQuCjKTMT1a2LNtiy7XYB0H7c6NEvdFjSGhbiBPMpp3fahKxB4dCYuhtEU2wpc
 qGIof+6C5X/RsUDkJdaBGlSEcjeLVfEbiGPIgq0e/iS9/ccowFs0Nd+XX21z4HyB1NYPG5BduuZ
 8EjMAwT7
X-Proofpoint-GUID: 9o_bWBcIItoGcBJXTnIHbpisg9_rDKSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300040



On 01-Sep-25 9:37 AM, Manivannan Sadhasivam wrote:
> On Thu, Aug 28, 2025 at 10:22:28AM GMT, Bart Van Assche wrote:
>> On 8/28/25 9:45 AM, Ram Kumar Dwivedi wrote:
>>> On 26-Aug-25 9:05 PM, Bart Van Assche wrote:
>>>> On 8/26/25 8:08 AM, Ram Kumar Dwivedi wrote:
>>>>> +  limit-rate:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    enum: [1, 2]
>>>>> +    default: 2
>>>>> +    description:
>>>>> +      Restricts the UFS controller to Rate A (1) or Rate B (2) for both
>>>>> +      TX and RX directions, often required in automotive environments due
>>>>> +      to hardware limitations.
>>>>
>>>> As far as I know no numeric values are associated with these rates in
>>>> the UFSHCI 4.1 standard nor in any of the previous versions of this
>>>> standard. Does the .yaml syntax support something like "enum: [A, B]"?
>>> Hi Bart,
>>>
>>> As per the MIPI UniPro spec:
>>>
>>> In Section 5.7.12.3.2, the hs_series is defined as:
>>> hs_series = Flags[3] + 1;
>>>
>>> In Section 5.7.7.1, Flags[3] is described as:
>>> Set to ‘0’ for Series A and ‘1’ for Series B (PA_HSSeries).
>>>
>>> While issuing the DME command from the UFS driver to set the rate,
>>> the values 1 and 2 are passed as arguments for Rate A and Rate B
>>> respectively. Additionally, the hs_rate variable is of type u32.
>>
>> Hi Ram,
>>
>> Thanks for having looked this up.
>>
>> Since it is much more common to refer to these rates as "Rate A" and
>> "Rate B" rather than using numbers for these rates, please change the
>> enumeration labels into something like "Rate_A" and "Rate_B".
>>
> 
> +1. Since this binding describes the HCI, let's stick to the terminologies in
> UFSHCI spec.

I have taken care of this in the next patchset.

Thanks,
Ram


> 
> - Mani
> 


