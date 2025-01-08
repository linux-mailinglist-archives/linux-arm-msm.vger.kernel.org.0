Return-Path: <linux-arm-msm+bounces-44319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2986A05350
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 07:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F818164FF3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 06:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587B81A7AF7;
	Wed,  8 Jan 2025 06:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E201YjwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05B91A725A;
	Wed,  8 Jan 2025 06:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736318339; cv=none; b=eGy64Fwf4zgk57a3i5sTcxCNB00Kqvs3ICis00keTEO1BSpDPVZoj8qTwd+iqPLvMk+HsRAmX0/PCoxvWKbjrOBa8tQfa3eO37Tu7ymQLuke1vEffpHGppJHW5Q6EME2qjdoqhgYDrYD+l3kC/ePicn2alWMuTO8jouk3sN8l9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736318339; c=relaxed/simple;
	bh=YLhV3ED5XsXDU71YwqwfNjbJQyIYbUP9kLda7DVydc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XDJlFcv94GXXpASqp/mEpSP/PdaDyq1Cv1ajuntbXXEVavVURnq6T7o2cetbj3kZyFYavVvHUiPzgcMXrgqvG6ZpZo8I6Ed9f8yuIM4DbzU4+9Oze3OkKHp1V9s2cEbfM5qbrRt8OZR4g9lKGASSVAKQefBxuMqjw5w7rDtR5Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E201YjwP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507K5cYu019348;
	Wed, 8 Jan 2025 06:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFfyzcA7Lm6kRRoYwMuF7A+42NuA98iGiVzUrdklIT4=; b=E201YjwPbM7MFIuL
	vVHqkqrm+6B88gWFT44Hro8CllKDPM2QtVzsSpbsn8mrMc/N8EcPqhYM4cMbk1Kz
	WHqyR1uFudKnRIhBFzvJQqva+952dQCLiLUXZKr9clzkOz+rr7t/oI9CUGTyuMwJ
	Pf8tHj/4b4Xdh3/DoXTfimfYw80KNKyT/mAvuDW7atG6KIH/kLTGHADK0NfkOuHb
	nEmLhUqQH034KEYW6uYiEB+Sh1Q/l0A92FrNa912Im0m6gN2qyWeJ0A2VxMatVJh
	X3YrE+7jQ4PHvBRlalpRmhuRvVaFK1cGNWrI8DeXU6TY9dE+qAWUQEr6S+Fx2zIk
	jaI8QA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441b0k1739-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 06:38:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5086chNE022358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 06:38:43 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 22:38:36 -0800
Message-ID: <5d926560-4e90-4ff1-8d87-3286b469246d@quicinc.com>
Date: Wed, 8 Jan 2025 14:38:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] dt-bindings: phy: Add eDP PHY compatible for
 QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        "Kishon Vijay
 Abraham I" <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
 <20241226-mdssdt_qcs8300-v2-4-acba0db533ce@quicinc.com>
 <kz5qakmiy7n72p5yrrkgcjrmtvwl7knnkbzmh44g6cfunpjxad@3titlwwt32ux>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <kz5qakmiy7n72p5yrrkgcjrmtvwl7knnkbzmh44g6cfunpjxad@3titlwwt32ux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YVcG7DL6uPoQdo5y-ArqX2_PZPAG8Flq
X-Proofpoint-GUID: YVcG7DL6uPoQdo5y-ArqX2_PZPAG8Flq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080052



On 2024/12/29 12:42, Dmitry Baryshkov wrote:
> On Thu, Dec 26, 2024 at 05:40:48PM +0800, Yongxing Mou wrote:
>> Add compatible string for the supported eDP PHY on QCS8300 platform.
>> QCS8300 have the same eDP PHY with SA8775P.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   .../devicetree/bindings/phy/qcom,edp-phy.yaml         | 19 ++++++++++++-------
>>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> Everything else is display, this one is PHY. Consider separating this
> one to a separate series.
Got it. will separate in next version.
> 
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>> index 293fb6a9b1c330438bceba15226c91e392c840fb..eb97181cbb9579893b4ee26a39c3559ad87b2fba 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>> @@ -16,13 +16,18 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,sa8775p-edp-phy
>> -      - qcom,sc7280-edp-phy
>> -      - qcom,sc8180x-edp-phy
>> -      - qcom,sc8280xp-dp-phy
>> -      - qcom,sc8280xp-edp-phy
>> -      - qcom,x1e80100-dp-phy
>> +    oneOf:
>> +      - enum:
>> +          - qcom,sa8775p-edp-phy
>> +          - qcom,sc7280-edp-phy
>> +          - qcom,sc8180x-edp-phy
>> +          - qcom,sc8280xp-dp-phy
>> +          - qcom,sc8280xp-edp-phy
>> +          - qcom,x1e80100-dp-phy
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8300-edp-phy
>> +          - const: qcom,sa8775p-edp-phy
>>   
>>     reg:
>>       items:
>>
>> -- 
>> 2.34.1
>>
> 


