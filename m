Return-Path: <linux-arm-msm+bounces-35982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 381B79B1456
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 05:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C12C1F226DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 03:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45A913A268;
	Sat, 26 Oct 2024 03:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L/oc8TBG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6481D3C30;
	Sat, 26 Oct 2024 03:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729914443; cv=none; b=XpW2F9uu82lZyQD/fxSgAj3WWERcjDl2w555XEYddvdcMLbMymhTJOegCWn6CdmfX4YitLTmp3nsroxrB3ck3A3HjrYnjxDbdWAu3UClnPF0LIVCIuqauc0oBCGgJRu4aVlLPielRIOen4Dhw90gxTPEroR79rql1GdzsB9I8Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729914443; c=relaxed/simple;
	bh=0XuHRsycYrbUno0339TVdspUaKcZillIUcJgkqgRsB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AiwymSAhPhSHSrxlP8HRpnxQJBuxOnmx+n5LSNi4yWPKJkhx3MOFnxFYqwmZFZahJzHetXQj69ESUulJDqR3J85Vp18kIdcl9BdFb5udWqym5XTZ6rRzanKL2hE9n8hYeZpdpKtvRDNkbW3R4KOPSVzZChCo73M8TLxpkldJVhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L/oc8TBG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q2LEck021332;
	Sat, 26 Oct 2024 03:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sX7m1pkhQut4ZgyrblU/FwRILwa2N6FGHFItgEFvlE=; b=L/oc8TBGX0uLRTDd
	uZ93NXtaxI0vl6nxV4X6tlmW7Bh06W9wxtP6ALPvNVY8vPv5S008RzkS8bXiGoyl
	4OtUzX8spjNI+RrqRLMTIOg/a8wB9jNSnzy7laJJhYxSzI8UPx0MaK20vAT5wt4T
	02qup0dsg1f8fEk+sbU4TwBeaSnv4ygXupAsEDZKbY10TknQRlYOiwbRCSG4pY2x
	Jgv+v2spBrJJkopbesvZCWZrExdAR+oyjbe8M0vposiKUaclOAmi8GxpozG0qJ2J
	JyFzEt3q46AQnWxIxouhII/zrWA64vfzOSy9mUv72rajvANd4QAmAAGhOeXI2bCS
	XourSQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gnsmg7yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Oct 2024 03:46:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49Q3kqfn023284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Oct 2024 03:46:52 GMT
Received: from [10.253.35.162] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 20:46:49 -0700
Message-ID: <727d71aa-eb9e-4efe-a966-23552b782bca@quicinc.com>
Date: Sat, 26 Oct 2024 11:45:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20241024065306.14647-1-quic_taozha@quicinc.com>
 <20241024065306.14647-2-quic_taozha@quicinc.com>
 <b848ae69-aca4-43d1-aa38-2f424045ee6f@arm.com>
Content-Language: en-US
From: Tao Zhang <quic_taozha@quicinc.com>
In-Reply-To: <b848ae69-aca4-43d1-aa38-2f424045ee6f@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iEwDS_ALBrUxSrIQVIvjr0ck9dWn2NGV
X-Proofpoint-GUID: iEwDS_ALBrUxSrIQVIvjr0ck9dWn2NGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260030


On 10/24/2024 5:14 PM, Suzuki K Poulose wrote:
> On 24/10/2024 07:53, Tao Zhang wrote:
>> The is some "magic" hard coded filtering in the replicators,
>> which only passes through trace from a particular "source". Add
>> a new property "filter-src" to label a phandle to the coresight
>> trace source device matching the hard coded filtering for the port.
>
> As mentioned in here in v3 review :
>
> https://lkml.org/lkml/2024/8/21/597
>
> Please do not use "src", expand it to "source"

Sure, I will update in the next patch series.


Best,

Tao

>
> Rest looks fine.
>
> Suzuki
>
>>
>> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
>> ---
>>   .../arm/arm,coresight-static-replicator.yaml  | 19 ++++++++++++++++++-
>>   1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml 
>> b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml 
>>
>> index 1892a091ac35..0d258c79eb94 100644
>> --- 
>> a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
>> @@ -45,7 +45,22 @@ properties:
>>       patternProperties:
>>         '^port@[01]$':
>>           description: Output connections to CoreSight Trace bus
>> -        $ref: /schemas/graph.yaml#/properties/port
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              filter-src:
>> +                $ref: /schemas/types.yaml#/definitions/phandle
>> +                description:
>> +                  phandle to the coresight trace source device 
>> matching the
>> +                  hard coded filtering for this port
>> +
>> +              remote-endpoint: true
>>     required:
>>     - compatible
>> @@ -72,6 +87,7 @@ examples:
>>                   reg = <0>;
>>                   replicator_out_port0: endpoint {
>>                       remote-endpoint = <&etb_in_port>;
>> +                    filter-src = <&tpdm_video>;
>>                   };
>>               };
>>   @@ -79,6 +95,7 @@ examples:
>>                   reg = <1>;
>>                   replicator_out_port1: endpoint {
>>                       remote-endpoint = <&tpiu_in_port>;
>> +                    filter-src = <&tpdm_mdss>;
>>                   };
>>               };
>>           };
>

