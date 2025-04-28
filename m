Return-Path: <linux-arm-msm+bounces-55860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CEDA9E95D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 09:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D82F1896FDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 07:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A6A1C84AA;
	Mon, 28 Apr 2025 07:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jQ90LpaV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68261C5D7D;
	Mon, 28 Apr 2025 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825512; cv=none; b=D21fiTt2yIuiDQig+jBUUwXm1dVmmD9MiYUaWWA8CRdsONZHKJpsnPRmPHMTXwgxkRJY63jIhPOzgVfuDkJF1q+fA9ZIQeDHhG7YpZTUAFlYre3n905eGIayQbQuIKagYropOKBw/QVC16HBJf43uSlsDsZo/E62P0SW59EABR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825512; c=relaxed/simple;
	bh=HdtFIhLx9KoMChjuIEeQQHmfPcXNBOQZMAQpJ6I7xWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bqnH8eIGb+9dpeDIwr3e7PcrPvjmoTgOOAMFqjvj49ja/MuRNmZZx4NN5+lETIlhdKoxV8G7PLYDentlykuPlGgeHEaLx2Gu3+CWCdUo17ybvYy3TsuErEyH6B+V47t2HlRaOVOSyP3Q0u/ZpfpdoUga7xq8pgl781dVOPZU1rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jQ90LpaV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S3rMns012306;
	Mon, 28 Apr 2025 07:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5Tt7944qJjJ4KMmdRD5KDY8T/NskZ0ugtNihbgVNHI=; b=jQ90LpaVCaB9g8Mq
	2Jjcjy6k0irS9zpbLckFjtq11TfrVIuRRMzK+JqjbkRYx5JBV0CKcE33Xk5AAADh
	m9XBG904AXgYkKgHBlbI5sXUD6/lfYOLt1V5jcqcWc3rRf5kjdKmc9BXjdS2UY8Q
	EvvpMfMqcCY+pU2d4c6HZOR9406GmEcQmf/pfE8sy2liC6d8DEJP+aoIckRp1Zva
	4ZFIL+qVI+keg5TqlQFDPaBS7epzb+Qf4xanAE7eNgrNx8D/wKZJTfCf5Q6z1Qup
	4Y5Do3yFu3EWX5Nt7gPjmaxSJrw5yUW6j8sR78m5Sdmhln9u/7kjm6LnJnAXiDyJ
	O0X/Sw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hpuvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 07:31:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S7Vb5J018597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 07:31:37 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 00:31:33 -0700
Message-ID: <04d46109-d499-4e91-88aa-4187145b811d@quicinc.com>
Date: Mon, 28 Apr 2025 15:31:17 +0800
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
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <8d203417-e3da-4969-87ea-f77cdb720756@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aDsDaYIgclR7eS8pnA0nbiEW7aeN6APZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA2MiBTYWx0ZWRfX7EVVk9LNKvOj K0eTbT1JteIl+PlllryskKWOK8Jt+x2tQanwgSAcjyV2bqem670wEQhRF/vwWrof2G+PhU30bSk rPqSHsds4x9OFDalnlQCVRkYgWbNNV2Fd8Q923L8X86/7m6XJK11F7m+jDW9mmvNcvxaBcSX9wB
 qZPz7m4swNAwV3iMENhKSFNEvSQxYMnAbiJ/4CQUxPTWvlrx9C8COLmTeVf5WQf1NFnb5tQ7gm+ g2pp/Upsca3J1KAUuLwi1cMPwhqm9oyvLoovoHKkOkS7qjTXRmYu3ynbAi8jtqsLfYET4DQ6aaP JzHR9hENcQmv4WjQpI/3j3jcqMc0u4koQgH1C+VUvc5JKJhGKVwbYa26PiGQrAkIRWRbir1/D1m
 rb/VWxnXxVZ5jttiqT+CJdiCOzpJaXMT22JHqAXGhTk1JX6gGXndtatFG8iK8+B6ueRUg4v5
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680f2ed9 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=WjK4Y3n_-wVlLzch4jIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aDsDaYIgclR7eS8pnA0nbiEW7aeN6APZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280062



On 2024/9/3 20:42, Krzysztof Kozlowski wrote:
> On 03/09/2024 14:18, Mao Jinlong wrote:
>> Add Qualcomm extended CTI support in CTI binding file. Qualcomm
>> extended CTI supports up to 128 triggers.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   .../devicetree/bindings/arm/arm,coresight-cti.yaml | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> index 6a73eaa66a42..141efba7c697 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> @@ -87,6 +87,10 @@ properties:
>>             - const: arm,coresight-cti-v8-arch
>>             - const: arm,coresight-cti
>>             - const: arm,primecell
>> +      - items:
>> +          - const: qcom,coresight-cti-extended
> 
> That's just enum in previous entry/list.
Sorry for the late response. This is a new CTI type. Need the three 
items in compatible at the same time, just like other kind of CTIs.

> 
>> +          - const: arm,coresight-cti
>> +          - const: arm,primecell
>>   
>>     reg:
>>       maxItems: 1
>> @@ -254,6 +258,16 @@ examples:
>>         clocks = <&soc_smc50mhz>;
>>         clock-names = "apb_pclk";
>>       };
>> +  # minimum extended CTI definition.
>> +  - |
> 
> No need for new example. No differences here.
This is a new type CTI.

> 
> 
> Best regards,
> Krzysztof
> 


