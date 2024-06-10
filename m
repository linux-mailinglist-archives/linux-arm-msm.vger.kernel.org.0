Return-Path: <linux-arm-msm+bounces-22172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D7901E0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32E692844C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 09:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D737405F;
	Mon, 10 Jun 2024 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZITW329C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF367770E3;
	Mon, 10 Jun 2024 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011420; cv=none; b=NfyN5naSM+7FwHyjoSyv6vJTDIiMa0NCqMHc0DgrPQPLEk02wwjD6oG2Hai+OqWdaMyCaZrOy5dUJehydjgY2yn7mvzA0dZ2vstWfqT7j4wPMUYspvazicBbnVsUV614FeQF1rMFni2K2eAlSBFTrLoUX2646CgMPfVnCjJ3H74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011420; c=relaxed/simple;
	bh=najXh1VKTi/df34WIGn4qEbd2NCGuahuZcq0jwwVRZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OZU0W5SRCWyrzDXGrz93ASoxVc+To5Td+kLNOpWxZRzlC5AFHPnEtX6E/XpCVrRiEv/dYfYlmmC01Ex3Ycr62x+/bYEL6zOKF4JvvBQo2o0jvak1G2bEsvrK/se0S1RjSbVjWRQB3ir01S7b8tLNhssRJGurO6ziAC2Aw6q1uiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZITW329C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459McUJG011399;
	Mon, 10 Jun 2024 09:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9k4dk3OsIPLgGWaiObHsZrow+I/G+rwRWjCaJtmV4M=; b=ZITW329CfnTMDPTI
	/SvB7PKTVOfHT5iB4q98S8yDHRVgwcZYrpXTQNBXu6mBybR/oAq8KZySKHcyxOSR
	9syLmYzl+iweI4nbnnHgcY3fvUI9hcw5IpVobZB4/p/B2TXuNbnHKxlJBXDcu3yS
	6VP9dttMZu7D2owweMXQOtJIGBxOTbY4d5xgYLmR+JkbJdydO08KEBYdpIrooLeC
	xqMiwfjL2+mARnFoxbdTcksAW44X+TkKpEzsxPzJhASGHwP75oXC3/2lh9S9oCE4
	7RyNSzJlhB+cJJ0Xg3uX3mp2WiRScEAIKmgL6swhieEOQZnHKBkWXAInBjnQnNun
	OnKSlA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymemgk3k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:23:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A9NX9r006609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:23:33 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 02:23:29 -0700
Message-ID: <7032bc78-f04e-4e09-ab34-6fe7dfb52adc@quicinc.com>
Date: Mon, 10 Jun 2024 14:53:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] dt-bindings: clock: qcom: Add SA8775P camera
 controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-10-quic_tdas@quicinc.com>
 <5ee9142e-2e7a-4e5a-9225-20b71eb07ce9@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <5ee9142e-2e7a-4e5a-9225-20b71eb07ce9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6vZEvUslr3g51Zq9VHUaZgYs05RyF7ip
X-Proofpoint-ORIG-GUID: 6vZEvUslr3g51Zq9VHUaZgYs05RyF7ip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406100071



On 5/31/2024 7:40 PM, Krzysztof Kozlowski wrote:
> On 31/05/2024 11:02, Taniya Das wrote:
>> Add device tree bindings for the camera clock controller
>> on Qualcomm SA8775P platform.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,sa8775p-camcc.yaml    |  76 +++++++++++++
>>   .../dt-bindings/clock/qcom,sa8775p-camcc.h    | 107 ++++++++++++++++++
>>   2 files changed, 183 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,sa8775p-camcc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
>> new file mode 100644
>> index 000000000000..0f8e4ee5e386
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Camera Clock & Reset Controller on SA8775P
>> +
>> +maintainers:
>> +  - Taniya Das <quic_tdas@quicinc.com>
>> +
>> +description: |
>> +  Qualcomm camera clock control module provides the clocks, resets and power
>> +  domains on SA8775p.
>> +
>> +  See also::
>> +    include/dt-bindings/clock/qcom,sa8775p-camcc.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sa8775p-camcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Camera AHB clock from GCC
>> +      - description: Board XO source
>> +      - description: Board active XO source
>> +      - description: Sleep clock source
> 
> Same comments (see my patchset adding qcom,gcc.yaml ref).
> 
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +    description:
>> +      A phandle and PM domain specifier for the MMCX power domain.
> 
> Here and in other patches, just replace it with
> items:
>   - description: MMCX power domain
> 
> (two lines instead of three, dropping redundant pieces of sentence)
> 
> In general, please avoid making redundant code. We all understand how it
> works and efficient binding or code is better than obfuscated long
> sentence saying that phandle is a phandle.
> 

Thanks Krzysztof, I will take care in the next patch.

> 
> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

