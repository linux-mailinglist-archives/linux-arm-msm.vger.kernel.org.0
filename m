Return-Path: <linux-arm-msm+bounces-22171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD2D901E01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A4FA28259C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 09:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5006F309;
	Mon, 10 Jun 2024 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XYBT5td7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D2A18C31;
	Mon, 10 Jun 2024 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011337; cv=none; b=kkJWM+FFnHyyv1Zwhm0Fh4l/o0AvYWYA4jRDGnSAfnho3KANGhZunEsi3AZpOo/J9qbhJszfdok8NYwIL9xqHewxsfydzIwQn/Y/x0w+RsmVToQEGgl0aB/xEotA5gmWkEVWUwKl9wEIVEJ2uHoF9pPHacEKs5mwr8/dfSTLATY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011337; c=relaxed/simple;
	bh=9Q7ZRrvBw1HngC/8JqQY662b7DwrBeFxThmoGs606B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J9+L/Tfu/KSC9jtTdbiVcKuDUblVprxj6w1qW2JJ3F1YJGeg+Fb+k9wkyJxGlMKEFRCYauRuj3L5dYcHODjgUWJxBMtuxiKaa0OcDx4NG+Tq5mw+E4graiHST3Cbj7S/gK555IdxCZWlg0WTLpRD2Iy3GDVeL7eqCCe7o20k/+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XYBT5td7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459NpCsL001377;
	Mon, 10 Jun 2024 09:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MKY77ydEwIBP5MDipWGtvDGKKH7Mpup6H8qSlmlBmto=; b=XYBT5td7di36beJI
	SgihsM0nRQxJuAlscyNwo0pBw2mv30YjXQ8mUgwWJxzLpPj0dNHLtLOs0LYYwEel
	4IJ92TeZca/lKVbYlRUEMgt8v2A6LPF3LnTbs7YaLrd0NlxCmrNsSXABNJMv0m+V
	3GZmJNgIJQLJcE5XstZCmR6wqTBcQlVb+8OYNYIBLszc5BpyMkF+SKCMhfBBVP/Z
	DXG+3DwUS6wFkgDHTS0ztQSh2b3Ptxsc1MGOUa++/pAQ4/a38/LWktXtQHV15Nbf
	IX/p/3eH3jJ+mkvRyGtI/0ocEr5JylS2S5+hK2vDcBj/AU9f00z2NWsGvOgvTgoO
	XrJ0JA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yme8rueqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:22:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A9MBOu005310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:22:11 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 02:22:07 -0700
Message-ID: <b481f2d9-d8c1-44e1-a639-1efc8931e8dd@quicinc.com>
Date: Mon, 10 Jun 2024 14:52:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: clock: qcom: Add SA8775P video clock
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
 <20240531090249.10293-8-quic_tdas@quicinc.com>
 <6add7e35-a290-44cb-9a3d-376ace65c058@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <6add7e35-a290-44cb-9a3d-376ace65c058@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: d1R0-mjhAhgxYDgGsBhNoTkqv_BoOxy8
X-Proofpoint-GUID: d1R0-mjhAhgxYDgGsBhNoTkqv_BoOxy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100071



On 5/31/2024 7:29 PM, Krzysztof Kozlowski wrote:
> On 31/05/2024 11:02, Taniya Das wrote:
>> Add device tree bindings for the video clock controller on Qualcomm
>> SA8775P platform.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,sa8775p-videocc.yaml  | 75 +++++++++++++++++++
>>   .../dt-bindings/clock/qcom,sa8775p-videocc.h  | 47 ++++++++++++
>>   2 files changed, 122 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,sa8775p-videocc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
>> new file mode 100644
>> index 000000000000..3edb29d0e5eb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sa8775p-videocc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Video Clock & Reset Controller on SA8775P
>> +
>> +maintainers:
>> +  - Taniya Das <quic_tdas@quicinc.com>
>> +
>> +description: |
>> +  Qualcomm video clock control module provides the clocks, resets and power
>> +  domains on SA8775P.
>> +
>> +  See also:: include/dt-bindings/clock/qcom,sa8775p-videocc.h
> 
> Just single ':'
> 

Will be fixed.

>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sa8775p-videocc
> 
> I am not sure if you are sure what you are doing... so to clarify:
> SA8775p is going significant bindings rework, so in general please post
> bindings matching new firmware (so SCMI consensus) or something which
> will be stable.
> 
> Don't post something which tomorrow will need changes.
> 
> Does this binding fits new style or is going to be considered stable?
>

Both these approaches should be supported for SA8775p.
1. SCMI to control the clock/NoC resources.
2. Clocks to be controlled via High Level OS(e.g. VideoCC driver).

The expectation of the 1st approach is not to change/update any driver 
supported.

Hope I am able to clarify. Please let me know if you have more queries 
on the same.


>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Video AHB clock from GCC
>> +      - description: Board XO source
>> +      - description: Board active XO source
>> +      - description: Sleep Clock source
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +    description:
>> +      MMCX power domain.
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  '#power-domain-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - power-domains
>> +  - '#clock-cells'
>> +  - '#reset-cells'
>> +  - '#power-domain-cells'
> 
> Drop redundant properties and reference qcom,gcc.yaml.
> 

I will update in the next series.

>> +#endif
> 
> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

