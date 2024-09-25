Return-Path: <linux-arm-msm+bounces-32419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61830985160
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 05:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE3C1284F1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 03:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5424614A09C;
	Wed, 25 Sep 2024 03:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="olkwWh75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F37F148304;
	Wed, 25 Sep 2024 03:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727234253; cv=none; b=ViE/UXqkffHE9kkMN0F1K4H7CsEfmmtnyzN0XqHN7O+BaQvuk96UPNygcsDrzeW002DryyZIpqMUA6yd8GLW36QJOiA2YJElZtkJiVNQtYdOiN93+BhkYId651dkelJHQWWxyXM85eRPiKRtLN5V6u2lolHBhSVzI8fDcDkafQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727234253; c=relaxed/simple;
	bh=7Rf1WPMMHzwR4cN/mSEBEBHU/HBB3cFfHxdJODffJMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ctVLaw8qICRsX8VgOUU4qNItTYmfE/ggKTT/ALntWyDLtmMTArdu7x7SmzD36jqs7n7Ou1HD9OEcO17R6Ysc1PyKA/VSZnWM3iXAjgtdG/8nclWtj6WcXZc3ljKAUgrZo8rOgxQtRiJpcb3BkXxCTH8Ku6/1rQkF/4eEFfMq0K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=olkwWh75; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OJTnxd007878;
	Wed, 25 Sep 2024 03:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9+Ho66y8WeZ0czVdVauMxfLgk0UIRhMmgGryu+9d/Q=; b=olkwWh75dkeHBkLd
	GpG8BIxDCCi7wyhuF1OwR7xJ1Hd6ioxd5DAiqbU0OJ3LJrjETZkyITDqNZPpWYlf
	jW7TPCsofNiMUoD0n3/d+wrPKtN1TZ5uOVhtUepM50ibbe2C1UD528eyF5j7Z9Wg
	7ZjVHVdYBnaa1pZJkNhD5VHe/mxsKq5euuCAHgYYHbj1sM8ulLIesmMlPwpoExFn
	aElPynYKYEG9Hb/s7OWOFCnbtjjsg8A5ZQo0PE+YvoylZ7ovluxoNfQVGTcDDnM5
	ZzzyrSFiW832jMbBeNwvRARTm15E6PYJcTDOaynNlgEGtzmgobQhiOs/4MYBTG/w
	sdTcxg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn5btt8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 03:17:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P3HPTY031569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 03:17:25 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 20:17:20 -0700
Message-ID: <d921cffe-bcea-4f96-8d8e-6b319af7e5ab@quicinc.com>
Date: Wed, 25 Sep 2024 11:17:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom,sa8775p-pas: Document
 QCS8300 remoteproc
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Xin Liu
	<quic_liuxin@quicinc.com>
References: <20240911-qcs8300_remoteproc_binding-v2-1-01921b110532@quicinc.com>
 <afa070b7-7aae-49ee-a983-24bda96bd6ec@kernel.org>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <afa070b7-7aae-49ee-a983-24bda96bd6ec@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fQ52S-We6sjEkhHqlhhuBsYdmjfcux_K
X-Proofpoint-GUID: fQ52S-We6sjEkhHqlhhuBsYdmjfcux_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=797
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250023



On 9/16/2024 10:57 PM, Krzysztof Kozlowski wrote:
> On 11/09/2024 08:41, Jingyi Wang wrote:
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
>> @@ -64,6 +77,7 @@ allOf:
>>        properties:
>>          compatible:
> 
> Instead add here "contains:" and no need for mentioning compatible
> second time. Same in other places.
> 
> Best regards,
> Krzysztof
> 
Well noted.
>>            enum:
>> +            - qcom,qcs8300-adsp-pas
>>              - qcom,sa8775p-adsp-pas
> 
> 
> 
> Best regards,
> Krzysztof
> 
Thanks,
Jingyi

