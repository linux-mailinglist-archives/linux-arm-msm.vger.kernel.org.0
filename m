Return-Path: <linux-arm-msm+bounces-28360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D24794FECB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 09:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13E9EB247CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 07:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F0278C6C;
	Tue, 13 Aug 2024 07:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bsnuZepN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67996F2EA;
	Tue, 13 Aug 2024 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723534246; cv=none; b=bIqxM8TDFPGlebchUDi099dfkTV+MYtPdCBTTjcP3nBZw2JMlVu86lpT4TW/53qEPDXsihBoVBltdAjwgLQSAIPFKWVjXJZp9WCIy1n33P9bh0+znrk0v+YGTWZQ0DhkfqRf65X9MJ+spg2DFd3pMBPw29iODtt1lcNLatEW0fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723534246; c=relaxed/simple;
	bh=scv8zDUxULs+clWyakYv/DgOoD+Rlx3zkr+ieUHfByI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FuW/W30iW53w0ZGuLKNAYYggnttvWlZYS6FKn30gftLr1zmdffgocoLIzB3MG0a5MIoQfdNqUwk4itov0iYOrkXUIGmsI/DF7J0K6RY8XYXn4y+bKtUrKBXF6e37uNw/7ian3f5e3Y1GSl+dQIgNfZdPAhLf7ibAifg9LXRaQ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bsnuZepN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D5LCpN005635;
	Tue, 13 Aug 2024 07:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NroixMePb+ayIUoTaVF6BwiuT3Qdon5N2GDAWk5KIM=; b=bsnuZepNxlY3mfnh
	QauaCR2OA0/XSyJwVNMhRbC25EE3thp958vGh5UUzsWXp3Zd4GqTGekrs5fNn0Sn
	lyrBR6P3BQ3AIJSX2CbwtLJaTqkkb3/lYW9qzml1LuGC26cbHEwyBKnOJSisakZq
	pJl8Ue/55VY8s7bZou4Dwe1XlKcrsIVahA0CrFRCVu2Gn+JQM37cOnyeX8MgPUVE
	uyUIhoKr5bvsquCn+gwDc4LvC3ty9ETI0mkxb7UOZ5cGfF+jQsFLsJpvqmVlEewu
	QCbQG/dSL6NEREe0ob+5osu599/HtnJKyTfWMJPSTMqgxk5LBocaFo8wKHvnpr13
	DnujYw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18xxm94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 07:30:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47D7UOuA009677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 07:30:24 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 00:30:21 -0700
Message-ID: <3baec804-c3b1-4a81-8115-96c081dacc96@quicinc.com>
Date: Tue, 13 Aug 2024 15:30:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: Add qcom,inst-id for remote etm
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240807071054.12742-1-quic_jinlmao@quicinc.com>
 <20240807071054.12742-2-quic_jinlmao@quicinc.com>
 <d72622bb-7dd8-4674-a2db-6c605e388ddb@arm.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <d72622bb-7dd8-4674-a2db-6c605e388ddb@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IDiHL63Edtq0cVQGEN806vRyr_f00mar
X-Proofpoint-ORIG-GUID: IDiHL63Edtq0cVQGEN806vRyr_f00mar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130053



On 2024/8/8 18:25, Suzuki K Poulose wrote:
> On 07/08/2024 08:10, Mao Jinlong wrote:
>> qcom,inst-id is the instance id used by qmi API to communicate with
>> remote processor.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml 
>> b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>> index 4fd5752978cd..a65121505c68 100644
>> --- 
>> a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>> @@ -20,6 +20,13 @@ properties:
>>     compatible:
>>       const: qcom,coresight-remote-etm
> 
> That is a generic name, without any clue of the QMI transport. Are there 
> other ways in which an ETM could be connected ? Given how this QMI 
> inst-id is added, I wonder if this is an after thought ? Why was the dt
> pushed without a proper driver for it ?
> 
> 
> Suzuki

Hi Suzuki,

This driver is to enable/disable ETM of remote processors by QMI 
service. QMI connection is the only way to communicate between kernel 
driver and remote QMI service. Instance id is required. The id is unique
for each remote processor.

The dt is pushed to solve the device tree warning in Qualcomm's devicetree.

https://lore.kernel.org/linux-arm-msm/20231210072633.4243-1-quic_jinlmao@quicinc.com/

https://lore.kernel.org/linux-arm-msm/20231210072633.4243-2-quic_jinlmao@quicinc.com/

Thanks
Jinlong Mao
> 
> 
>> +  qcom,inst-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      This id is used by qmi API to communicate with remote processor 
>> for
>> +      enabling and disabling remote etm. Each processor has its 
>> unique instance
>> +      id.
>> +
>>     out-ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>       additionalProperties: false
>> @@ -31,6 +38,7 @@ properties:
>>   required:
>>     - compatible
>> +  - qcom,inst-id
>>     - out-ports
>>   additionalProperties: false
>> @@ -40,6 +48,8 @@ examples:
>>       etm {
>>           compatible = "qcom,coresight-remote-etm";
>> +        qcom,inst-id = <5>;
>> +
>>           out-ports {
>>               port {
>>                   modem_etm0_out_funnel_modem: endpoint {
> 

