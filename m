Return-Path: <linux-arm-msm+bounces-20671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC58D1251
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 04:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD2E11F21552
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 02:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FAFF9D6;
	Tue, 28 May 2024 02:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="il4HGIDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015F31798C;
	Tue, 28 May 2024 02:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716865063; cv=none; b=gosedaOSo7XbnOf1dwcC6NKZTHYBmOTnkvetNyZfXSIQ8VRy1jz40v5RWRYbnz/uPBIJYUKwksBV0H1ouwKIneJj9J6DGsi2Wa6AG9MkRWQQWkGyhqFa7KUSszvVnNMK35RdgneWbuUS7u9OmcoO1E5DWGJhnnuvb4BC6NtxQ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716865063; c=relaxed/simple;
	bh=LWEXyrCsZhfgGNvfnW4zNLmRj7tKXbW/eXj75VT/WEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iYbf/SFMFm4wpUt1I2eLDrC9eZeVF9Qy6rPfKS9Y+yiqBp/yhAqQhSf97WQ3WHZRpJMp3IwGbeZlp2JyPdN4N/E6XSE5f/tN8dj0GsTZFvsbupTBjEEpF/C7jyLB2UsXBlGaSS5IABE/AxyIc6HBzrdjwnxbge76dS5YO1oRwYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=il4HGIDv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44RN0DZ0006748;
	Tue, 28 May 2024 02:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TR+/RmrYswSWIeLL7ozOdlwx4mSPbqV2rhZIvfSXYBU=; b=il4HGIDv5P0ExeOh
	cmLdYx6TjCYhzg83IGw5boo9UdH9IetRmm3hrXvsUgKRqiWdNvamrzjWfZimCjZR
	Til0fvGkrkB6X9GYpHDy5wsXLCXJmNdCOKaIvUpuToxzj3eq8ZdqJLvkCmplxe86
	6Fdxv40MmjVwlqkohrtovhaSLT1fPmBb6Vl6oJOcUu6t4ZJ/f83BdMkA8B5ofM0d
	CeR0rcmgEKY1zgnW191iqGFJ9JvNYiYN/Ud/VDxfrFLC1WTFirNYYrCTRJd2rV4a
	ynWjBw1PhYI4iCbGgGKPWyhSREVXTVrf03ouxsPoSh/IC7hJnKfQnBpzBueFke03
	/FXi0A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ybadx4x7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 02:57:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44S2vYKi008196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 02:57:34 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 27 May
 2024 19:57:30 -0700
Message-ID: <5d303643-1cbb-4fda-8fda-58d0002942e1@quicinc.com>
Date: Tue, 28 May 2024 10:57:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: qcom,sa8775p-pas:
 Document the SA8775p ADSP, CDSP and GPDSP
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Srini
 Kandagatla <srinivas.kandagatla@linaro.org>,
        Alex Elder <elder@kernel.org>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
 <20240527-topic-lemans-iot-remoteproc-v2-1-8d24e3409daf@linaro.org>
 <ae768bb2-cb96-4a05-8752-66bc6bfdab1b@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <ae768bb2-cb96-4a05-8752-66bc6bfdab1b@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: f-RUIYzTg3JHfrL-KQH7kWbNnmH4wB9L
X-Proofpoint-GUID: f-RUIYzTg3JHfrL-KQH7kWbNnmH4wB9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-27_06,2024-05-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=914 malwarescore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405280022



On 5/27/2024 4:56 PM, Krzysztof Kozlowski wrote:
> On 27/05/2024 10:43, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> Document the components used to boot the ADSP, CDSP0, CDSP1, GPDSP0 and
>> GPDSP1 on the SA8775p SoC.
>>
>> Co-developed-by: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> Missing SoB.
> 
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> ...
> 
> 
>> +
>> +allOf:
>> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,sa8775p-adsp-pas
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          items:
>> +            - description: LCX power domain
>> +            - description: LMX power domain
>> +        power-domain-names:
>> +          items:
>> +            - const: lcx
>> +            - const: lmx
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,sa8775p-cdsp-pas
> 
> cdsp0
> 
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          items:
>> +            - description: CX power domain
>> +            - description: MXC power domain
>> +            - description: NSP0 power domain
>> +        power-domain-names:
>> +          items:
>> +            - const: cx
>> +            - const: mxc
>> +            - const: nsp0
> 
> Shouldn't this be just nsp, so both cdsp0 and cdsp1 entries can be
> unified? That's the power domain from the device point of view, so the
> device expects to be in some NSP domain, not explicitly NSPn.
> 
Both cdsp0 and cdsp1 entries can uniformly use nsp.

> 
> 
> Best regards,
> Krzysztof
> 

-- 
Thx and BRs,
Tengfei Fan

