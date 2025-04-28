Return-Path: <linux-arm-msm+bounces-55870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F12A9EA55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 10:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5443C172973
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 08:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049DB22F17A;
	Mon, 28 Apr 2025 08:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GcIGvSa4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5BD19F120;
	Mon, 28 Apr 2025 08:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827816; cv=none; b=nYrgIE8mrVcJR9HIuzMP1nzJA9z2FmAiwQT1XIp48tp3WhmLL1Ol10D0ToCLfZo+5pC7N7isJBEvxSx+oD46Q0f+7PqcYNp2pbky5YD8wu1TkqjWvGNl5qe3LkIIRZik9/XMRoZ93lVPbuoxLWT7dJpoxQbB75Q4UjRvSly53Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827816; c=relaxed/simple;
	bh=k6GjsnctA/4cl8SfLk5wLQiT76FgSiWOFePnHmkkqu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Wu4yOP6Iag8ZjLUTtaSfvoyAMplQ3YcNMTXWtrZW0PnXjjdKq1iL1agMVyoYJfR2XmJaU8wSxo1tuv1asYrd7AK7lpvbyXsSMYycm5r/jJFlQn92bqTERJc33eTUIKAn3pZUWnIMRndUCC/mFS4fUPiGnqgd52ffdyYRkHeSUwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GcIGvSa4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6juTK018506;
	Mon, 28 Apr 2025 08:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ol6Xl6i68ZLMmEDC7rOpaP6hA8OHqTiZTmpHuGCG2KI=; b=GcIGvSa4eUsTamvs
	T8oTe7GYtlArMy9xuCHLE6m498iyx/ucGtpzzaKIXVsRupPcPXlb05q/09d8hw9m
	kTrWdq6LgFkDOSpez6svxmXG7Cc2rbyXQUccHvFu38tvtXADY+IpxYEzhSkvfHSK
	xFseIGUYFC8E2LE+BP1OSF4oQM1zj1WDV+0RAdVbLYpkRCQswOrRoWG3l0sHQYMh
	OHQRbWKYSMx7RTEVDRRbwb56vRLBWCwPu5YC7Gg1cZpjsNfEaAmOBDzvonmnJnq/
	Ds8RnGuFwBF93Cp1BwKbb63MX8LLaJtvKybc/LVXuXexQSgaU9A3Czjab1tc/qgx
	y6dyZA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jfbdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 08:10:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S8A2lT005357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 08:10:02 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 01:09:58 -0700
Message-ID: <b313ab73-850e-4d75-ae19-797a8c6a16f2@quicinc.com>
Date: Mon, 28 Apr 2025 16:09:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: Add Qualcomm extended CTI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240903121847.6964-1-quic_jinlmao@quicinc.com>
 <20240903121847.6964-2-quic_jinlmao@quicinc.com>
 <8d203417-e3da-4969-87ea-f77cdb720756@kernel.org>
 <04d46109-d499-4e91-88aa-4187145b811d@quicinc.com>
 <cbb1191d-4e90-4887-9227-e4e8761a9b46@kernel.org>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <cbb1191d-4e90-4887-9227-e4e8761a9b46@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA2NiBTYWx0ZWRfX9eHyGZaWihej jfrUeqzbopu3ZaXzKip2Xx6PCy0Kt84KlXPp3AhQKqJewb9HkpbyqT8W8L2RbnP35rBcJy4jTiR 9Z0UMitfi6fjm+A7E4qoj1KLxT4kSPR0FY16MRs4PAAdFF+wLt6QYPAxb1VmljAi+xSW96ogPCc
 BtZOjD4v+zKib0vtdplC2aRmh4XtA51VnVQEgfH3iSBS1RSu+syQ/GqBtwLnq1uebjK7Yjti6L/ jakkRZ+4IADmGF1GrjwS/ivQd/YDVNhsNzJP7Grf1iCu6S1bG+VXJXcbkk7cg2R+3i8PP84PkxE FXi/NcpQzGZo1ya1y6CkH8T0fGbp5F5zPOWrrqOtrBes+Z52bnc/fgNNEcB3awXdcJt4NJhOR7b
 ha35vtMUz0gHLd/f9DrfPAJE+zcWFZx/5NfkwsOCXQPvdE1j+opFF1vHmlmDJn960INkDJVE
X-Proofpoint-GUID: dL9IIffQcO9w4mMrV81tiS6lhBQH1eiZ
X-Proofpoint-ORIG-GUID: dL9IIffQcO9w4mMrV81tiS6lhBQH1eiZ
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680f37da cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=BB5YKCej9nSSSTOgEYYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280066



On 2025/4/28 15:39, Krzysztof Kozlowski wrote:
> On 28/04/2025 09:31, Jinlong Mao wrote:
>>
>>
>> On 2024/9/3 20:42, Krzysztof Kozlowski wrote:
>>> On 03/09/2024 14:18, Mao Jinlong wrote:
>>>> Add Qualcomm extended CTI support in CTI binding file. Qualcomm
>>>> extended CTI supports up to 128 triggers.
>>>>
>>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>>>> ---
>>>>    .../devicetree/bindings/arm/arm,coresight-cti.yaml | 14 ++++++++++++++
>>>>    1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>>> index 6a73eaa66a42..141efba7c697 100644
>>>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>>> @@ -87,6 +87,10 @@ properties:
>>>>              - const: arm,coresight-cti-v8-arch
>>>>              - const: arm,coresight-cti
>>>>              - const: arm,primecell
>>>> +      - items:
>>>> +          - const: qcom,coresight-cti-extended
>>>
>>> That's just enum in previous entry/list.
>> Sorry for the late response. This is a new CTI type. Need the three
>> items in compatible at the same time, just like other kind of CTIs.
> 
> 
> Comment stays valid, you did not address it at all.
Hi Krzysztof,

Do you mean we only need const: qcom,coresight-cti-extended here ?
No need const: arm,coresight-cti and const: arm,primecell as they are
in previous entry/list, right ?

> 
>>
>>>
>>>> +          - const: arm,coresight-cti
>>>> +          - const: arm,primecell
>>>>    
>>>>      reg:
>>>>        maxItems: 1
>>>> @@ -254,6 +258,16 @@ examples:
>>>>          clocks = <&soc_smc50mhz>;
>>>>          clock-names = "apb_pclk";
>>>>        };
>>>> +  # minimum extended CTI definition.
>>>> +  - |
>>>
>>> No need for new example. No differences here.
>> This is a new type CTI.
> 
> 
> Comment stays valid, you did not address it at all.
> 
> Best regards,
> Krzysztof


