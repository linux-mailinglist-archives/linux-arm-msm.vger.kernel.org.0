Return-Path: <linux-arm-msm+bounces-67113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98880B15E1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88BED3B6876
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FC927FD54;
	Wed, 30 Jul 2025 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VQBV2thS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B358E84D13;
	Wed, 30 Jul 2025 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753871292; cv=none; b=AK8eIwOO3cUK7RpR8j8MlRutWl5FaxIjajpPnB+cE/fR3Qhdj0yN+p54ECNdDbORntDKKtNb7+LlnFcXXqXmW/WCxC+5vFB77M3cKv1MPQzRc5Gps+4hATuiTIJ/kFObffiTz7IyxeWN0Qwjea6dTHmLja1b/qE4wZ3LxhLZeAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753871292; c=relaxed/simple;
	bh=Gv57cJBE0m74Exg2wx8QeJh3UJgtEVvSnt1fyqYiPvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QH7UPIQzqABuD+iifvIBZ9JZl+l3ZcNOrFwJGVLqoz6b/75M+WcJgU20lOF09EZCZRetYSXIGpxHiIX2YOFIfvz7e6+Ac35MdFLiOLqejYGu6ly95mc1fA5nwagAMu8OcC+aWIekm+eRdZwFNeByvDSchA+Hfav7FK/nx2QjjNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VQBV2thS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6e9Tb031293;
	Wed, 30 Jul 2025 10:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQ+PASInDq2iompUCI6INIoTzoXoJSoL5bJIYyVpOFs=; b=VQBV2thSqcUA1Q5a
	ORNM0rDtGHC8n1xW4DcBz7tmubpchovHYVefp4muZYDyPI06ziuGdoJjvK7n7a+C
	V94J4L2KPhgAhk5eQv1eFNgUW5jlSHHNvNCM5NT19vC4E+g+w7uPuC+yNGeZn31Q
	RXPBpEFOpiFFPny1IMb0cdIE+dxH+FGCFc4ET0wMFy8kfwTryoY1HJ+J6etAf8dL
	ulNmGVRnVSBw5VjBe16a0OxJhBwrbJXNotuYLaX7YKuJhvlLlq9NfIIkDQyS5+gv
	VrTTep28a1rKRQ74CNMrD67d0RwJvt91h4jSP9X1vUX1zrCw01dLHTbh0lNaASuH
	sHMAtw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xgswd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 10:28:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56UAS14i023557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 10:28:01 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Jul
 2025 03:27:56 -0700
Message-ID: <78998e50-a20c-41de-a2b8-a467475210cf@quicinc.com>
Date: Wed, 30 Jul 2025 15:57:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/3] dt-bindings: ufs: qcom: Add reg and reg-names
To: Krzysztof Kozlowski <krzk@kernel.org>, <mani@kernel.org>,
        <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
 <20250730082229.23475-2-quic_rdwivedi@quicinc.com>
 <466a42c4-54f5-45b2-b7f0-2d51695eac8e@kernel.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <466a42c4-54f5-45b2-b7f0-2d51695eac8e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA3MiBTYWx0ZWRfXw3TqGzvpaXRD
 BgmKY5wHUE9XwMTHpZEWkAZUB+5SLV2pbk+XH9rdk/IUq94H20fvZlcTWrU1P0NUG/62EVmN2MI
 FNgpkSCn24zOjntMdeLesOSTB8sjB9+Qw3AT10o3jZCBh8Z7HZK4bi/7FoKn4Ec1kcGnrUujcob
 ScZ5fTzOExIppt8bS4ISm9kU0IxdN4wiR7SznfCoePsrGor6IeLllsuioHo6tXKSgTqpxJEDwat
 zNDks6sAo3dkMnydU3wvP5l4c0tTa/RTq6AFChvCf95GVgdUeZYVzwEtnfaU/k6LSKOLGyNhHZu
 fRIhz7/QWj0na3SmKLWBSguM9zlFuZAdmPznBO9Iom2wLKnmm14ueuHO1kMke252L1FqyM3lbhu
 Z5u94a1FeRFivk03uQjqqB7GGA3iagJU/3swgGJtepWBuq47dtuMBlNi2r2HTOWHRosfvWMr
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6889f3b2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=3haSe6uOQi2LDX7HHVAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wJTNOeDFrJLnNt-qQvo2FigjQarAQFpP
X-Proofpoint-GUID: wJTNOeDFrJLnNt-qQvo2FigjQarAQFpP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300072



On 30-Jul-25 2:41 PM, Krzysztof Kozlowski wrote:
> On 30/07/2025 10:22, Ram Kumar Dwivedi wrote:
>> Update the Qualcomm UFS device tree bindings to support Multi-Circular
>> Queue (MCQ) operation. This includes increasing the maximum number of
>> register entries from 2 to 3 and extending the accepted values for
>> reg-names to include "mcq_sqd" and "mcq_vs".
>>
>> These changes are required to enable MCQ support via Device Tree for
>> platforms such as SM8650 and SM8750.
>>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 21 ++++++++++++-------
>>  1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>> index 6c6043d9809e..de263118b552 100644
>> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>> @@ -86,12 +86,17 @@ properties:
>>  
>>    reg:
>>      minItems: 1
>> -    maxItems: 2
>> +    maxItems: 3
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
>> +          - const: mcq_sqd
>> +          - const: mcq_vs
> 
> This is incompatible change and commit msg is inaccurate here. It says
> "extending" but you are not extending at all.
> 
> Recent qcom patches love to break ABI and impact users. No.
> 
> Best regards,
> Krzysztof


Hi Krzysztof,

Thanks for your feedback.

Regarding your concern about this being an incompatible change — could you please clarify what specific aspect you believe breaks compatibility? 
From my side, I’ve carefully tested the patch and verified that it does not break any existing DTs. I ran the following command to validate against the schema:

make -j32 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
make -j32 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/ufs/qcom,ufs.yaml

There were no errors reported for any target DTB.

As for the commit message, I acknowledge your point and will revise it in the next patchset to more accurately reflect the nature of the change.

Best regards,
Ram.



