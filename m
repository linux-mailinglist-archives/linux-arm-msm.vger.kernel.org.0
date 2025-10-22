Return-Path: <linux-arm-msm+bounces-78269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8776BFA4E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A3D9426216
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3CF2F28F6;
	Wed, 22 Oct 2025 06:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n1VyAoBj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7B92F28E3;
	Wed, 22 Oct 2025 06:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115663; cv=none; b=je4UcdCVkBIknNRCkPNZxNtHkHXwu2QFAdf5y6hbRLm1M2PhCpvL59043mLYmytT+SmQnqRZnvSHZPxGnWgqgbwts1E7k4QNI89aQ3dBaY1CJX85GAX3tWxWsvZGZpbkIOz4OwahvC/iKnvibC7XD/S93e9YS4ZoBzdRkzWOQIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115663; c=relaxed/simple;
	bh=ALgviHrcmTySF8+IZ0SfQ0Ca0hGXSV4wn90tAj5w4Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OiFp915HGblMti3bgtiwvvYBh339Y+/OMVqNswu84uknLhXXQplCG36X6Bq3u9jsgNsxEOEHhb6Q95W4aHKNLelvl+7y0VGgoY4XPnJL0rrvKGvsnFJ9rWyP7qVQJ5kxgJ6hMKZMVKpg68vI7RjZWt5Zh8mG4HH2bozmfuz9WaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n1VyAoBj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LKgBTN013592;
	Wed, 22 Oct 2025 06:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTva7Kgviua/9WwAt7xR6VKt9gLR+Zs215bxSnCeN5w=; b=n1VyAoBj+e4bElwg
	gyUTtvbRsWNxLR3C6KoheTgPZXms4vo2CmYN9JUkNgzX140tPv0ZbfibdKv6b3IU
	U5TOoc/yt36M+m+qJPmLDJ8866nP9io5mBRv8altI6Cpbx7zeRp9jg+Rpgqyg4TQ
	WIvJTbb+r/O9AtlMCxawqbKixMGG5XG/LsLVBlBHaklOgAhruQLC7H55u0C22rJo
	3AKUf0Jx7O23LVwrul+tSwe1XZWykZYV63JJfBVozHuMONZQN7VBBYniQG+5lZd1
	KfMwVfhT8LJkdGgo9vpSHKmUap9VGd5ZOaccUI6w8lqYJSHUxpXSFsbdmr2T6oiP
	6c8fFQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0hd8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 06:47:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59M6lWfI007765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 06:47:32 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 21 Oct
 2025 23:47:27 -0700
Message-ID: <aaa3c616-a317-7a87-e6ef-82ebbb06d67d@quicinc.com>
Date: Wed, 22 Oct 2025 12:17:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 1/4] dt-bindings: mmc: Add dll-presets values for HS400
 and HS200 modes
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>,
        Sachin Gupta
	<quic_sachgupt@quicinc.com>
References: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
 <20251013145316.1087274-2-quic_rampraka@quicinc.com>
 <cb753c72-70ca-44b9-a33c-af2b1c7e69c8@kernel.org>
 <20251020-talented-inquisitive-bulldog-64aba0@kuoka>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <20251020-talented-inquisitive-bulldog-64aba0@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfXzL+ej0JXxK69
 2fv2GFnnlyeeirBCkuwCiq3Zog/+RFVooYFJDtKePvL92+8hmvO4iJC/JrDwy3ud7J0WunrqTJI
 1osPmIaFEjg1q/GzbLfzvp4NME+uAz7mS6ztjTbsXsnuzE8Q5z9+tNSU/960lDCfmL1aGlXnZRg
 01b5lZeWQdb9TJ3NlGaJRhNztl8MG12JAXYZFT3RiuirGohoEXr3UearpatCUpH74SyPI05EtBy
 2mQhigd6YUUY2JZg/OyUWM3+YeFgTNwhfSEU6JxMbvGF+aklQe1o6sw/BFIupuginDxfRdPl3PU
 CC1pbBivOvlthUrQrm5IaUJxDy7C/cIOW2cyKKkVJ5HuM7MdrV8mbOIIUsVht08dPAKuSACUEBo
 GWdehl/5KIkI9WQd/lBIvH0kWN6BIA==
X-Proofpoint-ORIG-GUID: g599ba8Dk9NYkIKWhXHs33IUlC_Xr7ey
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f87e05 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=NiIIUeHpgDCADS5x9L0A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: g599ba8Dk9NYkIKWhXHs33IUlC_Xr7ey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167


On 10/20/2025 3:39 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 14, 2025 at 02:06:46AM +0200, Krzysztof Kozlowski wrote:
>> On 13/10/2025 16:53, Ram Prakash Gupta wrote:
>>> From: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>
>>> Document the 'dll-presets' property for MMC device tree bindings.
>>> The 'dll-presets' property defines the DLL configurations for HS400
>>> and HS200 modes.
>>>
>>> QC SoCs can have 0 to 4 SDHCI instances, and each one may need
>>> different tuning.
>>>
>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>> ---
>>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>> index 594bd174ff21..f7b3b1ced3ce 100644
>>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>> @@ -138,6 +138,11 @@ properties:
>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>      description: platform specific settings for DLL_CONFIG reg.
>>>  
>>> +  qcom,dll-presets:
>>> +    maxItems: 10
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    description: platform specific settings for DLL registers.
>> One of my questions, never answered in original submission and in your
>> versions, was to see the DTS user of it. I still do not see the DTS user.
> There is no answer, so I mark the patch as changes requested.
>
> Best regards,
> Krzysztof

ok, I will provide this in next patchset.

Thanks,
Ram

>

