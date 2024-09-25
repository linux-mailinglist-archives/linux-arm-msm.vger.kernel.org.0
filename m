Return-Path: <linux-arm-msm+bounces-32455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EA4985591
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 10:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66E52B21F78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 08:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DAD158DCA;
	Wed, 25 Sep 2024 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GKf0QUl0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2127E574;
	Wed, 25 Sep 2024 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727253322; cv=none; b=i8tdyMYs7+0yToCh4L3RJtuSQn73gN+T3ahJ3qE2437z5wX1pP0BBAPznplVT4/+Ts4myNww5O7/DnY7U4Z1iKuIwIel6Vf7Uhp3xGsUfwamlwD+lEEy6zuKUvpT4X+sXYQxRGUz39B4JfaPn6Mv3owMsmj3baXLHQ26WEPeA1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727253322; c=relaxed/simple;
	bh=xlPqrbJPXVE7wan+59bxGDR4Ggy2KqMregQ/uHCASr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ak0MNs6WieNmyi0TRMIkBHi7ztCdDt2Wd1kpoCmqasZ/SNXPby3RfbEVlvJJ9wnSjH3cVwWlKcWxvtSPXSRNGQBPdMXvns3yjkGzIUvUFNO9WOf+MlvW0Ixjq8IrPSbrKwvUvPIVB1OTLdhgDu2cG9kx7VaXDeyH1VpGDsaVRgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GKf0QUl0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P8GTaR025590;
	Wed, 25 Sep 2024 08:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3FAkH6d418feTnfCXosHaU3P+44x+E4HdZmGGvo8FM=; b=GKf0QUl0MTBC01eD
	1Eunmd97bUCTPGmIDCnsjuhtOEK1jDViF0y/XuVVqlNaK4EHRxlpGDNrPHOn2est
	55G9mHzRR3zK7IBDVlm2c/cJbXcoIRAk5eMJauVL/xjHijdLH5359Z58U2y1znIM
	AfRenjHozdvhYL1McAkyzlVsto1BBK8QgukBb10VVwgRWHYzlhiAj3bJ/wg1KTdW
	y7QkEIt3rJswQzYJkMhts7xM6Ks+jZR//JEGNfYAOU0xBPZld0MOu0GT8XPCaBWl
	JF9vs3n9HLkfgbE3uqLLHUeZyZG5z729UnWgnaGrkJV0J56/X5m9uTByx+i7+TXE
	X4IhAw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn3sbajh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 08:35:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P8ZFTV010347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 08:35:15 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 01:35:12 -0700
Message-ID: <2144d060-7454-46a3-96ed-6173e1ba2523@quicinc.com>
Date: Wed, 25 Sep 2024 16:35:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: remoteproc: qcom,sa8775p-pas: Document
 QCS8300 remoteproc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Xin Liu
	<quic_liuxin@quicinc.com>
References: <20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com>
 <bxkkqezsvvgf7xi6nhxjdpxhr76lrcjp65gtk56x45nhkygdmh@z3lzuz6honcg>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <bxkkqezsvvgf7xi6nhxjdpxhr76lrcjp65gtk56x45nhkygdmh@z3lzuz6honcg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hDinfHGBngBjAtQcwJghIrejhRmXjMNw
X-Proofpoint-ORIG-GUID: hDinfHGBngBjAtQcwJghIrejhRmXjMNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250061



On 9/25/2024 4:01 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 25, 2024 at 03:21:37PM GMT, Jingyi Wang wrote:
>> Document the components used to boot the ADSP, CDSP and GPDSP on the
>> Qualcomm QCS8300 SoC. Use fallback to indicate the compatibility of the
>> remoteproc on the QCS8300 with that on the SA8775P.

Hi Dmitry,

> 
> Are there any SoC-specific quirks that demand a separate compat string?
> 
> In other similar cases (sm8250 vs qrb5165, sc7280 vs qcm6490 vs qcs6490
> we are adding new compatibles only if it is expected that the hardware
> (or firmware) is actually different.
> 

This case is different from the cases above as qcs8300 and sa8775p are
different SoCs.(sm8250 and qrb5165 are different variants for the same
SoC). QCS8300 has one cdsp&gpdsp while SA8775P has 2, but they share the
same driver data, we used to discuss with Krzysztof how to deal case
like this and got the following suggestion to use fallback in yaml:
https://lore.kernel.org/all/6652a08e-7143-4214-a864-9f27c10d7571@kernel.org/

>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>> Changes in v3:
>> - add "contains" and remove redundant compatible.
>> - Link to v2: https://lore.kernel.org/r/20240911-qcs8300_remoteproc_binding-v2-1-01921b110532@quicinc.com
>>
>> Changes in v2:
>> - decoupled from the original series.
>> - Use fallback to indicate compatibility with SA8775P.
>> - Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
>> ---
>>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml      | 44 +++++++++++++++-------
>>  1 file changed, 30 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> index 7fe401a06805..a66007951d58 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> @@ -15,12 +15,25 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    enum:
>> -      - qcom,sa8775p-adsp-pas
>> -      - qcom,sa8775p-cdsp0-pas
>> -      - qcom,sa8775p-cdsp1-pas
>> -      - qcom,sa8775p-gpdsp0-pas
>> -      - qcom,sa8775p-gpdsp1-pas
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8300-adsp-pas
>> +          - const: qcom,sa8775p-adsp-pas
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8300-cdsp-pas
>> +          - const: qcom,sa8775p-cdsp0-pas
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8300-gpdsp-pas
>> +          - const: qcom,sa8775p-gpdsp0-pas
>> +      - enum:
>> +          - qcom,sa8775p-adsp-pas
>> +          - qcom,sa8775p-cdsp0-pas
>> +          - qcom,sa8775p-cdsp1-pas
>> +          - qcom,sa8775p-gpdsp0-pas
>> +          - qcom,sa8775p-gpdsp1-pas
>>  
>>    reg:
>>      maxItems: 1
>> @@ -63,8 +76,9 @@ allOf:
>>    - if:
>>        properties:
>>          compatible:
>> -          enum:
>> -            - qcom,sa8775p-adsp-pas
>> +          contains:
>> +            enum:
>> +              - qcom,sa8775p-adsp-pas
>>      then:
>>        properties:
>>          power-domains:
>> @@ -79,9 +93,10 @@ allOf:
>>    - if:
>>        properties:
>>          compatible:
>> -          enum:
>> -            - qcom,sa8775p-cdsp0-pas
>> -            - qcom,sa8775p-cdsp1-pas
>> +          contains:
>> +            enum:
>> +              - qcom,sa8775p-cdsp0-pas
>> +              - qcom,sa8775p-cdsp1-pas
>>      then:
>>        properties:
>>          power-domains:
>> @@ -98,9 +113,10 @@ allOf:
>>    - if:
>>        properties:
>>          compatible:
>> -          enum:
>> -            - qcom,sa8775p-gpdsp0-pas
>> -            - qcom,sa8775p-gpdsp1-pas
>> +          contains:
>> +            enum:
>> +              - qcom,sa8775p-gpdsp0-pas
>> +              - qcom,sa8775p-gpdsp1-pas
>>      then:
>>        properties:
>>          power-domains:
>>
>> ---
>> base-commit: 4d0326b60bb753627437fff0f76bf1525bcda422
>> change-id: 20240925-qcs8300_remoteproc_binding-a2837bab2150
>>
>> Best regards,
>> -- 
>> Jingyi Wang <quic_jingyw@quicinc.com>
>>
> 
Thanks,
Jingyi


