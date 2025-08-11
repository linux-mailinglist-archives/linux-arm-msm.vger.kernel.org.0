Return-Path: <linux-arm-msm+bounces-68532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A0FB211B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 883033AED92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FE02E040C;
	Mon, 11 Aug 2025 16:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dHnp3DXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3172E06EA;
	Mon, 11 Aug 2025 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754928774; cv=none; b=Nrs9lldOxuizuUwmm+0Dq6pyCPxJULrRMSj9GzaFslVo9d56QUGwk5hWtr/sLk1h3vuEydTrgla7GhT7CUL/FNTqppORDg5BTwVXccLet/ugciKeOwZR1BZjJ62CxN6uhtQkL7QwvuGK67onvcrrqJd/K2HJusV0V88BPlcfwmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754928774; c=relaxed/simple;
	bh=PJzclgFaw/7oF3ER7+6r3nUI9ZR5wx5E/Dkl3HE0Hc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ADjcFtVUOA2ijeaLulGjXXNh7IAcTnHky/fVhwM6gs5Z9TDV4b/WVtAiH16Ffx5HQyAGNSfKMKlKSI3qZt5f0KHNauz1wqvYIfHAftbuyKub1hBI69MEJoSFZy/LTH6GPyik8PZVdaXam5BNod1KVs3uDB5EdZwev21424W9jG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dHnp3DXe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFxiNA005283;
	Mon, 11 Aug 2025 16:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I1o1Pk0355qzwcIB30VXMUZsa3a58W/7wwbkNHvqf0w=; b=dHnp3DXeQBRpj79L
	meSqUFVq/lf129/r7sotIAA3+xJMRtr3Un62fcv5ZKz41QhrJ3h5xwcQi7FThzpe
	76E63C5AMWTKXNOvjCqi1Fw07sR6L9MQdHo7dkA2owZnzT+HwbfvD4G69bR+mT6B
	Ex1dSvMV1K2wsMHezMlXV73gpa/Q4a6os6s0izhaGdATbbe2n79i6vTRXwQZfUWt
	JAqz8sFBsdVujS+jaQcjTfYZSESUy/hqmku0Hk8KXTnAOs2BdSHSEx97KYbhl1vI
	cU66m2HAG7shf6GeR7GVbjo75abJqg0AljEHe8jNNsXwh0kxyxz2IAtsiDEaQDlc
	ySBWhw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx393h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 16:12:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BGCbLG018631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 16:12:38 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 11 Aug
 2025 09:12:32 -0700
Message-ID: <adb94e86-38a2-4456-9363-d02c487ff7b8@quicinc.com>
Date: Mon, 11 Aug 2025 21:42:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/4] dt-bindings: ufs: qcom: Document MCQ register
 space for UFS
To: Krzysztof Kozlowski <krzk@kernel.org>, <mani@kernel.org>,
        <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250811143139.16422-1-quic_rdwivedi@quicinc.com>
 <20250811143139.16422-2-quic_rdwivedi@quicinc.com>
 <f8405e89-9449-4564-82d1-3146d9b75655@kernel.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <f8405e89-9449-4564-82d1-3146d9b75655@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX65p4MT9gqbCI
 LooDpNESSd/n3QnsMVWpl9cU4V7/i9Ogo3ipIFmeJ+rNYdgvNdzJpwuuI2eKpzEBcrDlIS3rcLi
 hkHST/ktkG4Iq2tCbfuwy3WOfBft30KVo4U2A4pTMQluRnBRuUtjyV+ujKvBIDeXndtoHwS5m+b
 /J9u3uDgc+zMoN0Ok2DFItSEyzNGDSoTnx47zQOQ6Ulz4TqHRwv1KnVc4ns9q0ZvL6JJX8lFjg6
 b+vfB21Z75/4U+r7KFktPxeAamdGMcionJ7ZsumyyXLuy268FFYc+ZzDIyZCtFGmc2BQ9nmfKfu
 6YxsUa7gygiZZIE3kMQdCpvAUzSh9xhQlDqFhGdaWryjkhiu8N1RlkYKKLhyhxmLTzJTEijmpk5
 gslGXMw1
X-Proofpoint-GUID: Q8K1_Sdj4k2ZPaEeTCCQJ1VxD4V1rQSC
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689a1677 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=n52dHJ6fqxtmaawsWVAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Q8K1_Sdj4k2ZPaEeTCCQJ1VxD4V1rQSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057



On 11-Aug-25 8:12 PM, Krzysztof Kozlowski wrote:
> On 11/08/2025 16:31, Ram Kumar Dwivedi wrote:
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
> No. Why are you sending this? You have been Cc-ed here:
> 
> https://lore.kernel.org/all/20250731-dt-bindings-ufs-qcom-v2-3-53bb634bf95a@linaro.org/

Hi Krzysztof,

I understand I was Cc-ed on the patch thread you linked. However, if I send my patch on top of yours before it’s merged, the kernel bot might flag it due to missing base changes. Please let me know if you're okay with that — I can proceed with pushing my patch on top of yours.

Thanks,
Ram.


> 
> Above is neither correct nor aligned with what I told you.
> 
> Best regards,
> Krzysztof


