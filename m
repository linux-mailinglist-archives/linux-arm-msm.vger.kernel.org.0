Return-Path: <linux-arm-msm+bounces-56900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB361AABBB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B88B95A1EA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9BA2367BC;
	Tue,  6 May 2025 06:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ms5kAG6l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F1F2367AD;
	Tue,  6 May 2025 06:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746512436; cv=none; b=lktv/w4vAvRYnR/+iGdddm5wBswoNxFfEXljRvSeAutQDG06VUqgVwQgZJMOAxSMQzcBgFVRDK/8mO7Vm1CzWzvWBLd1ZxpWoYMmlhcN3Iih4Om5TuwZwZ+fhwrE1Tb4NEDKbMue7486OR7NJkLVcXsLkbqwNOcMQZSDG7q9IDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746512436; c=relaxed/simple;
	bh=T1ht4zXHKNki2NJVaLxx/aL5knTllFTyrOPxPlIM7eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pJ+mxUNoISYfXZyUoNthlTjVX/L+I8h/utD0w3zEi92jZ7pX9RXDgif7HtJZXI3jPZvp0MHaqjXwyQru7uZ6dKvPGbptOofwiQu7oCQGfnrOhFAcvT4IPKedN5rD0Lo0EPgZNa0KWm6dbZZh/r45y/VobRGGTiOGZ5nwxiRTeUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ms5kAG6l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545M4uTu011184;
	Tue, 6 May 2025 06:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pm/hq5RxWKA3oBhwX5M3pYnjNEf8WRhoOjebq9Z0RwE=; b=ms5kAG6lvKTMV+ki
	v51pu7lSKLT3bXYKaLvDqyvaHm4rdsDAZxSrJjzqeDUzLoDsy1tiZ67pGkKSks5Q
	CjW3zfN2ZkuR5hmRDnWH6yexpeZztPDEQMYiVyCau1M/SQqiJ5lgn+s4NGbXGxXC
	7oIbSl5FgR8k6dL2Cl2Jjg4Z1uAjb0rderRgbYkILVUghZvCC3cd4gpXu0tn5V+P
	OoIh8UThfov83tvuMAl4xbI8YdE9L7CwXmPbXq4xgm8g8NrCxW3s7l17mOXUWXis
	ZsqYZh27WeX+YGJ7OISNL1UoOioPItBe0kjxN1EaaPcFssgep5PYkfSqV6DOPAyK
	XXILBw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tb95cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 06:20:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5466KMBZ016526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 06:20:22 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 23:20:19 -0700
Message-ID: <fe714aaf-8e0b-432e-b238-240b46be64e2@quicinc.com>
Date: Tue, 6 May 2025 14:20:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: Add Qualcomm extended CTI
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250429071841.1158315-1-quic_jinlmao@quicinc.com>
 <20250429071841.1158315-2-quic_jinlmao@quicinc.com>
 <20250502-notorious-granite-gibbon-1abf15@kuoka>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <20250502-notorious-granite-gibbon-1abf15@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JRacaERoASwWh4zXVuCOBYUfKxQt4QbP
X-Proofpoint-GUID: JRacaERoASwWh4zXVuCOBYUfKxQt4QbP
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=6819aa27 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=zLDVIwd1xLDUi3fjDS0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA1OCBTYWx0ZWRfX6lc+DLL4SLlR
 ioV7f11FpdY6/SIiiMDTFDm0pdIS8hpGaPLKwHKP4JcHThtcjPj8o8yyz992Bxbj7QrvWfIPtpR
 /oskDtQ7BStJGpUVZpR4UoGBJKEkKesiaqlUjoldzCCxCpSl7liXlLGzl2VgyeemuJjHP3pEjhQ
 qoPp2M6pzJ7/K+gmm6D5S/zIBEM4IvajwjMQ2xlBdiaIZZG443jKG+1sd6GwRhUAng281xPbIIj
 A+eWLYHw+Oc/k4ua8wAKX7BH9Pe62miFmUbjpruHlrvEF+moc6FTBWTXVC4tRXbqbdZbSecxarZ
 YldBXV15JkXSHMf47Hqvu0j5N+eQdbOAAisLucySBueKbIHYk/VpHryRqCxcl2FPXO5bA+oUg71
 yBAXO3znLWo2k2JE+q+BUrSzgmJzpadVq7YhwNapBvtzZOwP7nun3ZDftvMpG5TlsvKeXaeB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=826 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060058



On 2025/5/2 14:43, Krzysztof Kozlowski wrote:
> On Tue, Apr 29, 2025 at 12:18:40AM GMT, Mao Jinlong wrote:
>> Add Qualcomm extended CTI support in CTI binding file. Qualcomm
>> extended CTI supports up to 128 triggers.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> index 2d5545a2b49c..1aa27461f5bc 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> @@ -84,7 +84,9 @@ properties:
>>             - const: arm,coresight-cti
>>             - const: arm,primecell
>>         - items:
>> -          - const: arm,coresight-cti-v8-arch
>> +          - enum:
>> +              - arm,coresight-cti-v8-arch
>> +              - qcom,coresight-cti-extended
> 
> cpu phandle is not required? Or not even valid?

cpu phandle is not required for exteneded CTI.

> 
> Best regards,
> Krzysztof
> 


