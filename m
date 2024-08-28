Return-Path: <linux-arm-msm+bounces-29751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD69623B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 11:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7C23B22680
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DF815E5C8;
	Wed, 28 Aug 2024 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S6fUsIWB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AC0158DDC;
	Wed, 28 Aug 2024 09:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837937; cv=none; b=jbTVxV+RoXLMqoVrdyVADgpgv9JMkEqGeEmtzkNag6tHFJVAyvHEVCUpjUgPlMYw6JhUl+NMle7P3WLnQ2oJiQJZ6FD/t58w34TGyvEVfdP1uuIjuhFlKDVhiTZtKwupd/P3DaasdYCs/ptp8yCLwljmkUfyzfhhvh1fSa0VrKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837937; c=relaxed/simple;
	bh=F+4IBfp5hYA0hDceacjHZ+u1PjfCyZPICWDMjgaBaOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uXTTm0coZcvMlkdeddEEkQls/7+uUSpnpgeV/BwhwG0Du1Z8Ugw+DN+pcfcjFdpJjDEFdYFRqxUrfzcd8XAjZnwRS+Umk4k84CiDdxSNoCgSDV/jbiX2GuJSV+rXIENDUlB5uxH+cqZcyrLZrT9fEt0zt299hOXspv5tE43hzVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S6fUsIWB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RNmcfJ001796;
	Wed, 28 Aug 2024 09:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qLf6yXOq+LKI2sv3N2msJJOg3E0A9evdpaSYy6qDmSg=; b=S6fUsIWBKKynbUbk
	mCGa4kuf84fwSSZ80VFeUKs7iEXAwRiJbXiKB724+aiKWn76znik+qfqDqXJ1fC0
	t+j0hu6VnG8iXqynM1ZHENYlpC8FLopwWSjc1C9AnPbGrY3B4h6uEm8uq7P//9re
	/T5MeKmeJ9SczYbG8x/PyPLkdv7SEOcpRxNhwZ2DXiHHbixEhPgJs9MD8iZiwa/X
	BNlXgZUiUX2BBfYjVbzXtz3OJtwIvRlTqLd0hkXinmKIO/fJo925Vab1q9Z0iKgx
	/caI7uamrWwRAF9siQ3MOYOLPZxBOlDbEBqqnlAQWC0slglFshjuWgF+T1qGIdTr
	PBu68Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puw1bh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 09:38:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S9conx030094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 09:38:50 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 02:38:46 -0700
Message-ID: <c0a85aa3-9829-4ac9-ab79-0ceb6fff7075@quicinc.com>
Date: Wed, 28 Aug 2024 17:38:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sa8775p-pas: Document
 QCS8300 remoteproc
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mathieu.poirier@linaro.org>,
        <bartosz.golaszewski@linaro.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>,
        Xin Liu
	<quic_liuxin@quicinc.com>
References: <20240828030511.443605-1-quic_jingyw@quicinc.com>
 <20240828030511.443605-2-quic_jingyw@quicinc.com>
 <eetb73ycz7kzcgknuzorsnoszhpdljuxepuoflhakobli6dozl@q2sbmj77hedo>
 <51280d4a-ad55-466d-b9d8-c5bdc1a2f0ee@quicinc.com>
 <fcf59ffe-69f7-48d3-bf20-fc223a2c2d10@kernel.org>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <fcf59ffe-69f7-48d3-bf20-fc223a2c2d10@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C8vH2wtDsie5k-FtRuGTZjQj_R1vrIkP
X-Proofpoint-GUID: C8vH2wtDsie5k-FtRuGTZjQj_R1vrIkP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408280068



On 8/28/2024 5:07 PM, Krzysztof Kozlowski wrote:
> On 28/08/2024 09:28, Jingyi Wang wrote:
>>
>>
>> On 8/28/2024 3:22 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 28, 2024 at 11:05:10AM +0800, Jingyi Wang wrote:
>>>> Document the components used to boot the ADSP, CDSP and GPDSP on the
>>>> QCS8300 SoC.
>>>>
>>>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>>>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>>>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>>>> ---
>>>>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml | 22 +++++++++++++++++++
>>>>  1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>>>> index 7fe401a06805..44b070a17ca0 100644
>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>>>> @@ -16,6 +16,9 @@ description:
>>>>  properties:
>>>>    compatible:
>>>>      enum:
>>>> +      - qcom,qcs8300-adsp-pas
>>>> +      - qcom,qcs8300-cdsp-pas
>>>> +      - qcom,qcs8300-gpdsp-pas
>>>>        - qcom,sa8775p-adsp-pas
>>>>        - qcom,sa8775p-cdsp0-pas
>>>>        - qcom,sa8775p-cdsp1-pas
>>>> @@ -64,6 +67,7 @@ allOf:
>>>>        properties:
>>>>          compatible:
>>>>            enum:
>>>> +            - qcom,qcs8300-adsp-pas
>>>>              - qcom,sa8775p-adsp-pas
>>>>      then:
>>>>        properties:
>>>> @@ -75,6 +79,23 @@ allOf:
>>>>            items:
>>>>              - const: lcx
>>>>              - const: lmx
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          enum:
>>>> +            - qcom,qcs8300-cdsp-pas
>>>
>>> This looks the same as sa8775p cdsp. Why new entry?
>>>
>> There is difference in power domain, sa8775p use nsp while qcs8300 use nsp0
> 
> Please paste code where do you see the difference.
> 
> Best regards,
> Krzysztof
> 
sorry my mistake, I have checked that nsp0 is form the view of power domain, it
should be fine to use "nsp" to find the right power domain, will cleanup both
binding and driver patch.

Thanks,
Jingyi

