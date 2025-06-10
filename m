Return-Path: <linux-arm-msm+bounces-60742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E00A2AD31DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE3B33B6D8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A05B28A409;
	Tue, 10 Jun 2025 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QU3NycOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AAC1FF5F9;
	Tue, 10 Jun 2025 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547449; cv=none; b=hHz1Z9sxeXTCKpc0zEDE7bEPjOxUrRLuP3d3E/WLvVAHXa7EeVUZ29pEmhJd9aIJEAbVyRaln1kF9YDxaOPxnob+8G6EjZXbfImV30XeS9dvNflkAYw2FYVZchQC0UNVCOPavbHsAAoVF0gXchuZbZ7c0K85vwkA3tvms3Wuud8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547449; c=relaxed/simple;
	bh=cbHTa7eH8HCFYh9dMh7/U0vdEyuqU847Ua4Nh4/c+b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jRB2Buj+8LA53DyGvz+2KJhLeS1vXsB9ugfGwa7Q044H25NEmbSUFE9V0tjEsnJU6GeAv4py0QdRkGPS1SVzQT0wUyC4wkD/KKQnJNHC//CqJHJnFTtifvzNmkuFspnzHVYpDBdZa8dQJBB3cXrt33kcFfQBDjp+vZReSWTQY2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QU3NycOY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559MfPp0008107;
	Tue, 10 Jun 2025 09:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SLhYKXUBlq/76Q8kCP0zJNioPnWqVmep9hlrNQUyLmg=; b=QU3NycOYoTGMHmlP
	oCwadU5LFsF+PLGcbyAJ3NorxQb19M/mq2KefjFhSc4lUkFFVPgHaVqMuu0O18tQ
	pRvzlH2CicPaDfSXBYSJzk12Bul65cDfut/PH8dqcvtxwQa9RlGSXPogFSj+UXeE
	QfZhzdzzSFlifdVfZvYaQhKHlYqmgrZrBm9CjVJV5a2kVT01v4Vfo7w9jpuBaSn2
	PCuuIsRwd4TjuQI7JszahyxmrujEotHcbjmqbTNjkx1QcrAzw9amzRqeSliyKkDB
	yeoKO2aXRB/YZvbKSfRXg+IgZpvyqOmMBGqCpZKOelbWY8fOZeLf7k68RoVgt5nE
	Y/voeg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d120y0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 09:23:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55A9Nans015791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 09:23:36 GMT
Received: from [10.217.217.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Jun
 2025 02:23:31 -0700
Message-ID: <814deadc-9b7d-49d6-88c4-cb8837486cdd@quicinc.com>
Date: Tue, 10 Jun 2025 14:53:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
 <20250424-qcs615-mm-v7-clock-controllers-v8-2-bacad5b3659a@quicinc.com>
 <b80d500b-6203-4d83-8396-3ba579abd980@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <b80d500b-6203-4d83-8396-3ba579abd980@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: paoPOxfTkq3Z8Db8VHkhp7K7FNbxtFRD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MiBTYWx0ZWRfX+xuEUv/2DpC/
 lIvcAmnFSA7A/gkwUEAVaVfDqxDr8CQ0e/MycgGXp028hOoRfjAdOFavxNPV3yvCZogNthqB83p
 MFz/iEOoUc1EGKs9jxOPZ9piimDJ23bapwuGDgHD5MH12oD/WuxATOz9EsGIme/TTH3btHeDAKc
 /kI+eWAfderfLVpIuzhbxkQCfUpN8nI9m6DgukPwxNU59mmb8gbM5sgdHFDrQSZ/KiykvcTYsdv
 pUtmKB6cZQ9sK2YjCj7XZq3k3uPsvbT4toB6Abo1FeYd3//oAe/BsZTBQ9sMC/wlEmA1Eyo2Pth
 a7xCUVzSJGu8hUli87+e2SvFeA2HbBSzEKeuV7HxVqZqJH/1Tvj3S6wJmSqJSA0BJyi76cV/19u
 uqsc7/3CXeuLqfFM7lWytXeH1o8InFMmZ3fU6910M/ZCpWVk3KMxQ0CGM15kp/Nze1VjAhFk
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6847f9ae cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=WPGCOMWRFNVID3d5GRAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: paoPOxfTkq3Z8Db8VHkhp7K7FNbxtFRD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100072



On 4/28/2025 6:38 PM, Vladimir Zapolskiy wrote:
> Hi Taniya.
> 
> On 4/24/25 12:32, Taniya Das wrote:
>> Add DT bindings for the Camera clock on QCS615 platforms. Add the
>> relevant DT include definitions as well.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,qcs615-camcc.yaml          |  43 ++++++++
>>   include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++
>> ++++++++++
>>   2 files changed, 153 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-
>> camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-
>> camcc.yaml
>> new file mode 100644
>> index
>> 0000000000000000000000000000000000000000..2b811e66d406c16c70004bb3a9fce294422a5914
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml
>> @@ -0,0 +1,43 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,qcs615-camcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Camera Clock & Reset Controller on QCS615
>> +
>> +maintainers:
>> +  - Taniya Das <quic_tdas@quicinc.com>
>> +
>> +description: |
>> +  Qualcomm camera clock control module provides the clocks, resets
>> and power
>> +  domains on QCS615.
>> +
>> +  See also: include/dt-bindings/clock/qcom,qcs615-camcc.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qcs615-camcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    clock-controller@ad00000 {
>> +      compatible = "qcom,qcs615-camcc";
>> +      reg = <0xad00000 0x10000>;
>> +      clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +
>> +      #clock-cells = <1>;
>> +      #reset-cells = <1>;
>> +      #power-domain-cells = <1>;
>> +    };
>> +...
> 
> Is there anything what prevents to add this clock controller dt bindings
> description into qcom,sm6350-camcc.yaml ?
> 
> Apart of compatible values I barely see any difference between two of them.
> 

Sure, I can re-use the bindings and push the next patch.


> -- 
> Best wishes,
> Vladimir


