Return-Path: <linux-arm-msm+bounces-67635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FB8B19B61
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 08:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3E06176E4E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 06:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F06B22A1D4;
	Mon,  4 Aug 2025 06:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c+ZH84dH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0BD2E36F4;
	Mon,  4 Aug 2025 06:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754287948; cv=none; b=FT8D1buRRLlujJeOGxAjeHS8wkvmAPesCpOLMdfuQCA2+7WbO7NNAyZF55oVW3N+Xb6ATUZOAax8v4cW1h3SMWLrtLDollY5p2ioHS3Orfd+TUbfO+P6g/dmrL98aC7GImfOLXgsklBFYrH/AQH7whWI/bVGtqytPPe8/LE7NLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754287948; c=relaxed/simple;
	bh=u4HIdVElw6RkyXB+mJ075zCh2NsleX66AIPJ+bsIDxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ES7hXeKaDxMpWP9tM7ug9KGNiupPX7SkSYeWV9aBTJ9peh3zjVmKQeJzS28gA9zH9Ebr1/B1TLKDkR4GjzXXzUvv4ouzv8Bpppn6LYoI7uZP1ttmLdqfE+hyYfN7mh72+1TsEsTuocrXs8QcHK/3i7bLQs5O8w9ElPmZy3z30+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c+ZH84dH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573LuEXw007793;
	Mon, 4 Aug 2025 06:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gGBwkDcpa8KTjBGTp6+vS9yUmGblXxtWNRSb0sPG4Mc=; b=c+ZH84dHVBN0mP4u
	bnRq1F50Q6xHXUWNWrr1mRs7wugmvkIo/6eorWplxApGwVR0mEULiSLsQGhQliGG
	k31y1cWkWgXUFl817d+KDlzwl14+yf8ToulLX65OKcnBA953MwhlxLHO7+DD63Kg
	sOHoLS5PIpG7387i4qiLEEIwk0S/SuuNBZY3D7tOTAuuaROvBNxqY9F1q0smyHLy
	q0nzgrGBKBbea+2cy9xzd1AeiETX1ppY0wtADPykREkTByJTDYzm9eR28VfS9zI0
	c3wC3JyWfSQFVe3tFZWX0Q4r/5Fy+T7irFAphSyom1aV1frSOkyjhjewlt72AUCF
	zUjXow==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqkkcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 06:12:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5746C2qr001084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Aug 2025 06:12:02 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 3 Aug
 2025 23:11:56 -0700
Message-ID: <eb87e18b-8dcf-4ed8-b60c-5673517b7009@quicinc.com>
Date: Mon, 4 Aug 2025 14:11:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
 <deefg7w3ot6cd3woexfwagetmkg4nvu37f66h4ulbdqegdgi3u@plj6puxcsil4>
 <477bebcc-2d1a-4183-8e3d-d792e876c63a@quicinc.com>
 <gkcy5rmtodvkgcyzv5mylq4fnlampwichvywcej7ncrbn35jni@ewvcda4o2s2l>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <gkcy5rmtodvkgcyzv5mylq4fnlampwichvywcej7ncrbn35jni@ewvcda4o2s2l>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i7lp5iemk3xiyXVN5r8jJzQH1ADL1jFE
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=68904f3b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=XyTV15-iCbcj3UDuXsEA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAzMSBTYWx0ZWRfX812Gj8ghY+Ew
 1kryj4hJpBcDkG0vt1+TTyu2arbcu31+G7dvT3ocClqMOfi9vhxCWHWPVrn5Xwsekoc2HOs2bH5
 W6T7HAGrIRJTBWeOmZabGRGBECXzQuMr0+8vnncI2yefrAN8lmkewolygNjqjPqRebuU3EFDgON
 xUPZA8NZQEil5kCNa+oD26QKXIwr+N5BcKG2Pbu+4UEEZROxHjSuyh5JAA4kD4S/zCSJtX2NejH
 UZete//T6m5G5tYjAeAXXFmlcMJaAt8zD1YS/yPiQwKOhyDFqD9NjCrSownlzUKiyrQG+i7s+7+
 O9aB9PRZ+N+xkDw4rHJZ4JUre+NHCb1Gg4psONJcuWDiF+ov7hOf1ejqiyZP40j2PW9uWge4weZ
 LJGNlddf+QaiUXCpS2yQ6YSUEhJPj35MEmAgEh9BYDS79cePrtimMNIN/jBGzCgiunYbTg2T
X-Proofpoint-ORIG-GUID: i7lp5iemk3xiyXVN5r8jJzQH1ADL1jFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040031



On 2025/8/4 12:52, Dmitry Baryshkov wrote:
> On Mon, Aug 04, 2025 at 12:31:31PM +0800, Yongxing Mou wrote:
>>
>>
>> On 2025/8/2 17:56, Dmitry Baryshkov wrote:
>>> On Wed, Jul 30, 2025 at 05:42:28PM +0800, Yongxing Mou wrote:
>>>> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
>>>>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
>>>>    .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 284 +++++++++++++++++++++
>>>>    1 file changed, 284 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..ae4bc16395326bffd6c9eff92778d9f207209526
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
>>>> @@ -0,0 +1,284 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/msm/qcom,qcs8300-mdss.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm Technologies, Inc. QCS8300 Display MDSS
>>>> +
>>>> +maintainers:
>>>> +  - Yongxing Mou <quic_yongmou@quicinc.com>
>>>> +
>>>> +description:
>>>> +  QCS8300 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
>>>> +  DPU display controller, DP interfaces and EDP etc.
>>>> +
>>>> +$ref: /schemas/display/msm/mdss-common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,qcs8300-mdss
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: Display AHB
>>>> +      - description: Display hf AXI
>>>> +      - description: Display core
>>>> +
>>>> +  iommus:
>>>> +    maxItems: 1
>>>> +
>>>> +  interconnects:
>>>> +    maxItems: 3
>>>> +
>>>> +  interconnect-names:
>>>> +    maxItems: 3
>>>> +
>>>> +patternProperties:
>>>> +  "^display-controller@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +
>>>> +    properties:
>>>> +      compatible:
>>>> +        items:
>>>> +          - const: qcom,qcs8300-dpu
>>>> +          - const: qcom,sa8775p-dpu
>>>
>>> Use contains: instead of listing both of them
>>>
>> Got it, thanks~ here we want to fallback qcs8300 to sa8775p.
>> Should we update it to :
>> +        contains:
>> +          enum:
>> +            - qcom,qcs8300-dpu
>> +            - qcom,sa8775p-dpu
>>
>>   above method can be validated using dt_binding_check.
> 
> 
> _instead_ of listing both of them
> 
> So:
> 
>    contains:
>      const: qcom,qcs8300-dpu
> 
Got it.. thanks~!
>>>> +
>>>> +  "^displayport-controller@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +
>>>> +    properties:
>>>> +      compatible:
>>>> +        items:
>>>> +          - const: qcom,qcs8300-dp
>>>> +
>>>> +  "^phy@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +    properties:
>>>> +      compatible:
>>>> +        items:
>>>> +          - const: qcom,qcs8300-edp-phy
>>>> +          - const: qcom,sa8775p-edp-phy
>>>
>>> Use contains: instead of listing both of them
>>>
>> Same as above
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>
>>
> 


