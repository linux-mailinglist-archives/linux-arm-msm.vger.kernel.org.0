Return-Path: <linux-arm-msm+bounces-27200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8235393F180
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BD28B227F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 09:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B6A13E88B;
	Mon, 29 Jul 2024 09:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ivz3633o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165FA13DBB1;
	Mon, 29 Jul 2024 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722246449; cv=none; b=WXI37Wqo4qA8og3Nq/Nbi2cjfqj6q4tCbrVmb5mmigGG/w1cK++8vL0xeAKgHM6IacZLSI6ye1l/pnfQhqJGfJeYXDYskChaRIf15Fee7ii9xBGw3m1Z1AWgzZi1Z6dLkes89uIO8VVsWWCgIosiBUCnb9PUIOVb7BRubdfXmYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722246449; c=relaxed/simple;
	bh=HNIbBQm01jXPtQXTe3CcpuHXrwUo9KYaV3exGuzXmXo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=CvXjsohXMZYQaWMhyJ7uEP+IZpFpq1uhur6JykwpCDvP/4Q5CzsSOx2tV+IE0/8sd8DJf3XjVVxXDJxD+rwcloDSYp9PivIl7FaYW7jNJ6p4CIFXFoRRML3kVmwyhAOCijyDK5m+Eqe+Z+mqPj6oWvlTE2qFX6PnBVxUPzUX4zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ivz3633o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46T0K33K018457;
	Mon, 29 Jul 2024 09:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pxxdc/pYVKgzVeeMdjjBXMbhXRjZr78T908e+MFmHB0=; b=ivz3633oyDfDv3j7
	onp5fU+isjOxou4O8FhRvN3pLugQHzFQg6EeehW4PORw9ROtL8kgtoT3mcgS3EaA
	xAqhkI/nMXLyMcw9WXrGYgnxFkT6sz3TH5SCvXWXIWl+AHQa2AZso1Ui3D/v2mtz
	5L/aqmKbYS0QFU3KwY3fOPy/ucayCXdMEsVT+dvBtSFlk7JuRekd0dc8kpu+Mbph
	XCWIyianmPszYXpx40zl6JwdgK0c9Q/W/4ysnjfP6DdAcvt9Q8O1Sii7IVYWdXPI
	kZCWKuGSnyB46XcXm/F2EXjB9QUbw9xBdEbyEnT12LDNJL268r3TOGhXcTVWN0Fb
	wI8dng==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mrfxkqrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 09:47:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46T9lJYH022094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 09:47:19 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 02:47:13 -0700
Message-ID: <21c86552-4719-4e60-ab7e-9df3d732df46@quicinc.com>
Date: Mon, 29 Jul 2024 17:47:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: describe the Qualcomm SGMII PHY
 for QCS9100
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-0-5ffeb16252db@quicinc.com>
 <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-1-5ffeb16252db@quicinc.com>
 <1486c975-3cc8-46b9-b049-1df4dfed0040@kernel.org>
 <8ef27923-03ed-44d2-bfa3-6efc75f8d6be@quicinc.com>
In-Reply-To: <8ef27923-03ed-44d2-bfa3-6efc75f8d6be@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tg_MxtNkXlRMhuqreJSbhio9BbFLijZw
X-Proofpoint-ORIG-GUID: tg_MxtNkXlRMhuqreJSbhio9BbFLijZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_07,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 bulkscore=0 phishscore=0 clxscore=1011 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290065



On 7/11/2024 11:52 AM, Tengfei Fan wrote:
> 
> 
> On 7/10/2024 6:13 PM, Krzysztof Kozlowski wrote:
>> On 09/07/2024 17:15, Tengfei Fan wrote:
>>> Document the Qualcomm SGMII PHY for the QCS9100 platforms.
>>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>>> platform use non-SCMI resource. In the future, the SA8775p platform will
>>> move to use SCMI resources and it will have new sa8775p-related device
>>> tree. Consequently, introduce "qcom,qcs9100-dwmac-sgmii-phy" to describe
>>> non-SCMI based the Qualcomm SGMII PHY.
>>>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> ---
>>>   
>>> .../devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml        
>>> | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
>>> index b9107759b2a5..74ec4579c0d6 100644
>>> --- 
>>> a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
>>> +++ 
>>> b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
>>> @@ -15,7 +15,10 @@ description:
>>>   properties:
>>>     compatible:
>>> -    const: qcom,sa8775p-dwmac-sgmii-phy
>>> +    items:
>>
>> items is not needed here, this could be an enum directly.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Thanks Krzysztof!
> 
> In the next version patch series, I will check all the patch series, 
> using an enum instead od items.

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore all the current patches here.
Thank you for your input.

> 
>>
>>
>>
>> Best regards,
>> Krzysztof
>>
> 

-- 
Thx and BRs,
Tengfei Fan

