Return-Path: <linux-arm-msm+bounces-68537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DFCB212A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7059D2A1CF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF10296BC3;
	Mon, 11 Aug 2025 16:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M9EzzwHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F01296BDF;
	Mon, 11 Aug 2025 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754931166; cv=none; b=n3E6W8wiLIi1e2FibAk0yh3wHwefgunufeaNy1zfKK88ZVaeB8ttyTd8LH8+i5HlrbzIATDrpqu0oRkmlRBOLrfwD8zz8ZXdMDRAXb0KwUnawyuPXYmOw2UVpQX7gFeisfxtOsTtbM+wpWrxQjUArjOyiL0zWVkOSvPzkm2G51o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754931166; c=relaxed/simple;
	bh=QhIuSCDFrq1k7ejUPwGZuy1nLlASiwPlTvlN8z7Q/0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sgHj7jC+aI1VLR09MqbC02etTbZAvnds8DLO88zYDGfr/qLtgi54Vo9dXdvcJz8nqykzcZczfLMXXEgOLhuGyT8wQtUZMX2ThsLUv74anmJXEFqBdO7Jph/2y1zMIZPjaOZpWIEKdPd1cyoy6sZnn7Ca25m0GCXWbRIGEn4F4x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M9EzzwHc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFBgMr005801;
	Mon, 11 Aug 2025 16:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbquycwaXo6caiYxBhni/nLpdKOY8gGfCoYGrbW2v/o=; b=M9EzzwHc96pBROLu
	vBpFRxlLDHvbpeb5Gh6VL/JmTgdJCSNXSvybYwUZGvZvacXJOUR9SHGHlrhVv9vr
	pon1W9Lr6ItHsbfhlmS0uMIeehIbZYpXsMeMQxJ39imjAsZK0Q7yUbJN9UXuU6YU
	NAKLwhOfTZML4Dzmhr8YfP5DciSxO17AGYIZ2XpSgmKnfFtq/nLTiLqm9o1bSTLk
	xWZNSklHvt3hODsvLZF8FAFGZp7RqR3elD3SuW9xqhk4oaGEsh8gxeCubpTorYFV
	RtCgzw+dWMizp8t9fuCFlbhZNBnEZ+Xjwtn8DTOgmGtYi3kJSmNeYUJ6eEDP+b0J
	LaCOXA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxb89cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 16:52:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BGqWlE030437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 16:52:32 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 11 Aug
 2025 09:52:26 -0700
Message-ID: <4da84288-1e1b-4e12-b163-e6e00c879347@quicinc.com>
Date: Mon, 11 Aug 2025 22:22:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/4] dt-bindings: ufs: qcom: Document MCQ register
 space for UFS
To: Bjorn Andersson <andersson@kernel.org>
CC: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250811143139.16422-1-quic_rdwivedi@quicinc.com>
 <20250811143139.16422-2-quic_rdwivedi@quicinc.com>
 <gcjyrmfxv7s2j7zkm5gcfn7bmuihq4lrm7cwjgpax6hnok7pxm@wanm5thogmzd>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <gcjyrmfxv7s2j7zkm5gcfn7bmuihq4lrm7cwjgpax6hnok7pxm@wanm5thogmzd>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689a1fd0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=-i4v5njgqiUzmYyuTuwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfXxnXDSVF/3Vmp
 1liGyF7oVVXLO9qyPoK9tk9mpVH3hr3FZSld3euZthxUAIX4az7Pph7UwrJNzI/C3/C3WWDsVYR
 1bX4Gj9yzF3gZS6afbt3ELKDozKHVrUVLQNFfX83YpQHL2NN5D1aaQ6d1BlK6HlVrHWdW/rJ3xr
 gozm54XCMQu1ZFP58hCVogmwsGNEV6tzQ9QzHcMLnXYKSLTA/artBSQubweok5t9hTioKbk+oEM
 HH2ObYi6MmJH7zCOmHl8hMEhaOPw1XXFX9jfRxg2D+gVBRGfBNOFNznDyFu//DIKh6zJXulrx5D
 BZvUwuznUaisuYClvOFtUOPqQSlHJSFyIrIfNuIsIREqb2NfPIaPatPS+RCsMb8Id1EzVEOUBuP
 ZqgHXx81
X-Proofpoint-ORIG-GUID: z86_u3vFnOvwKoInWnRRYnanTjCJZYPO
X-Proofpoint-GUID: z86_u3vFnOvwKoInWnRRYnanTjCJZYPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097



On 11-Aug-25 8:32 PM, Bjorn Andersson wrote:
> On Mon, Aug 11, 2025 at 08:01:36PM +0530, Ram Kumar Dwivedi wrote:
>> Document Multi-Circular Queue (MCQ) register space for
>> Qualcomm UFS controllers.
>>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>>  .../devicetree/bindings/ufs/qcom,ufs.yaml        | 16 ++++++++++------
>>  1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>> index 6c6043d9809e..daf681b0e23b 100644
>> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>> @@ -89,9 +89,13 @@ properties:
>>      maxItems: 2
>>  
>>    reg-names:
>> -    items:
>> -      - const: std
>> -      - const: ice
>> +    oneOf:
>> +      - items:
>> +          - const: std
>> +          - const: ice
>> +      - items:
>> +          - const: ufs_mem
>> +          - const: mcq
> 
> So you can either "std" and "ice", or "ufs_mem" and "mcq".
> 
> Does this imply that "std" changes name to "ufs_mem"? Why?

Hi Bjorn,

The "std" is renamed to "ufs_mem" to more accurately represent the memory-mapped region associated with UFS controller.



> Is MCQ incompatible with ICE?


Yes, MCQ is compatible with ICE. 
Actually there are 3 possible cases:
- Case 1: Older Targets (e.g., SM8150)
  The UFS controller node includes both "std" and "ice" in the reg-name.

- Case 2: Recent Non-MCQ Targets(SM8550)  
  ICE is defined in a separate node, outside the UFS node, and the `reg-name` is not specified.

- Case 3: MCQ-Enabled Targets(SM8650,SM8750 - Part of Current Patch)  
  The reg-name includes both "ufs_mem" and "mcq" regions.

In summary, across all three scenarios, the configuration may include:
- "std" and "ice" together,
- "ufs_mem" and "mcq" together, or
- no reg-name defined at all.




> 
> 
> Please use the commit message to document why this is.

I will mention this in commit message of next patch set.


Thanks,
Ram.



> 
> Regards,
> Bjorn
> 
>>  
>>    required-opps:
>>      maxItems: 1
>> @@ -177,9 +181,9 @@ allOf:
>>              - const: rx_lane1_sync_clk
>>          reg:
>>            minItems: 1
>> -          maxItems: 1
>> +          maxItems: 2
>>          reg-names:
>> -          maxItems: 1
>> +          maxItems: 2
>>  
>>    - if:
>>        properties:
>> @@ -280,7 +284,7 @@ allOf:
>>      then:
>>        properties:
>>          reg:
>> -          maxItems: 1
>> +          maxItems: 2
>>          clocks:
>>            minItems: 7
>>            maxItems: 8
>> -- 
>> 2.50.1
>>


