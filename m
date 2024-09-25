Return-Path: <linux-arm-msm+bounces-32418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252F2985157
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 05:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6B65284FBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 03:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44D314883B;
	Wed, 25 Sep 2024 03:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E358VeLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A412E83F;
	Wed, 25 Sep 2024 03:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727234204; cv=none; b=L4RyMFgdYYK2SGTFEM2lLRDR/+RMjcn+hqXqm63GbBZvsMy3oF/K/ItSQglVowMXTMZhrKhxLktvCm6EeA0ppc+LxQmZdWKMsmjDB+FCoCSE5Ed6h5Z3S+poKtEt3QLHn+0pHbpiJlPyKjhRISrz3PQleFanbK2Cy5w2OlN64VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727234204; c=relaxed/simple;
	bh=yckZRAtjv2+erTiywXe4fToHqpWBu16BWnOo1K0Owac=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r75uK6VcrNFTcgOtBngyR+xPofm9dUxu1RXhrZw1Ez8GoM+qc9Wd0COau7O5MCl/rFavCJUJ3e+ry4BPuCfFgXecGsUxMfMwTiyPpM4vXR/y//WIG4QU3KdRyn/VRrsozmu5vKtcTvYReyBNkz6H7S0EpqCxl1veUZBN69gBCDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E358VeLm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OJAkfM023720;
	Wed, 25 Sep 2024 03:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSu5BOH4547bOGz/uuDsU2GqijyNrkUbv6wZdQJRvUY=; b=E358VeLmd1wkBr/c
	11Etlk90/Hacb60+xJQppsBO1mF+vEuolUD4hVt7+So+kMMuDhUfX/4Uvd/4G1pe
	fBSfg40HB+hP4KgIHXeRd0KAZ8XbVwj99gdjfuWSkjqjfVDqVEVX7fn42IoYHbgT
	b6Wj6FbvnNySK8hK0TR7t1p2pC8BW/17Ywm8MFMqxixxL1Z7ps5CGnyg8q4rbQe5
	siZ/copsfyrbK9tmjx48nWRcm30HdkaYRew14T8RDkps3Pros0XwE7qQe06I3PIp
	cfXpJoE3hcqI/ZPeKdIeqo+10Umrtzcnx3fFk8BCQHadocng4Hig2UAKFDvJk9PC
	F+ta2w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnb4d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 03:16:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P3GXwr031999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 03:16:33 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 20:16:30 -0700
Message-ID: <6656171b-12d3-490b-b53c-f907b7454f99@quicinc.com>
Date: Wed, 25 Sep 2024 11:16:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: phy: Add QMP UFS PHY comptible for
 QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Xin Liu <quic_liuxin@quicinc.com>
References: <20240911-qcs8300_ufs_phy_binding-v2-1-c801a2d27a84@quicinc.com>
 <ztpetznwid2om6vylyl2boi665ch3wnkprkmzcq6bem6cqhqtf@ogsi657y4kex>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <ztpetznwid2om6vylyl2boi665ch3wnkprkmzcq6bem6cqhqtf@ogsi657y4kex>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: njFoIUCqwxsEuXUGijLC5iVPOUvMbOGd
X-Proofpoint-GUID: njFoIUCqwxsEuXUGijLC5iVPOUvMbOGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250023



On 9/16/2024 10:53 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 11, 2024 at 02:56:16PM +0800, Jingyi Wang wrote:
>> From: Xin Liu <quic_liuxin@quicinc.com>
>>
>> Document the QMP UFS PHY compatible for Qualcomm QCS8300 to support
>> physical layer functionality for UFS found on the SoC. Use fallback to
>> indicate the compatibility of the QMP UFS PHY on the QCS8300 with that
>> on the SA8775P.
>>
>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>> Changes in v2:
>> - decoupled from the original series.
>> - Use fallback to indicate compatibility with SA8775P.
>> - typo fixup
>> - Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
>> ---
>>  .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 46 ++++++++++++----------
>>  1 file changed, 26 insertions(+), 20 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> index f9cfbd0b2de6..626a2039e177 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> @@ -15,26 +15,31 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    enum:
>> -      - qcom,msm8996-qmp-ufs-phy
>> -      - qcom,msm8998-qmp-ufs-phy
>> -      - qcom,sa8775p-qmp-ufs-phy
>> -      - qcom,sc7180-qmp-ufs-phy
>> -      - qcom,sc7280-qmp-ufs-phy
>> -      - qcom,sc8180x-qmp-ufs-phy
>> -      - qcom,sc8280xp-qmp-ufs-phy
>> -      - qcom,sdm845-qmp-ufs-phy
>> -      - qcom,sm6115-qmp-ufs-phy
>> -      - qcom,sm6125-qmp-ufs-phy
>> -      - qcom,sm6350-qmp-ufs-phy
>> -      - qcom,sm7150-qmp-ufs-phy
>> -      - qcom,sm8150-qmp-ufs-phy
>> -      - qcom,sm8250-qmp-ufs-phy
>> -      - qcom,sm8350-qmp-ufs-phy
>> -      - qcom,sm8450-qmp-ufs-phy
>> -      - qcom,sm8475-qmp-ufs-phy
>> -      - qcom,sm8550-qmp-ufs-phy
>> -      - qcom,sm8650-qmp-ufs-phy
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8300-qmp-ufs-phy
>> +          - const: qcom,sa8775p-qmp-ufs-phy
>> +      - enum:
>> +          - qcom,msm8996-qmp-ufs-phy
>> +          - qcom,msm8998-qmp-ufs-phy
>> +          - qcom,sa8775p-qmp-ufs-phy
>> +          - qcom,sc7180-qmp-ufs-phy
>> +          - qcom,sc7280-qmp-ufs-phy
>> +          - qcom,sc8180x-qmp-ufs-phy
>> +          - qcom,sc8280xp-qmp-ufs-phy
>> +          - qcom,sdm845-qmp-ufs-phy
>> +          - qcom,sm6115-qmp-ufs-phy
>> +          - qcom,sm6125-qmp-ufs-phy
>> +          - qcom,sm6350-qmp-ufs-phy
>> +          - qcom,sm7150-qmp-ufs-phy
>> +          - qcom,sm8150-qmp-ufs-phy
>> +          - qcom,sm8250-qmp-ufs-phy
>> +          - qcom,sm8350-qmp-ufs-phy
>> +          - qcom,sm8450-qmp-ufs-phy
>> +          - qcom,sm8475-qmp-ufs-phy
>> +          - qcom,sm8550-qmp-ufs-phy
>> +          - qcom,sm8650-qmp-ufs-phy
>>  
>>    reg:
>>      maxItems: 1
>> @@ -85,6 +90,7 @@ allOf:
>>            contains:
>>              enum:
>>                - qcom,msm8998-qmp-ufs-phy
>> +              - qcom,qcs8300-qmp-ufs-phy
> 
> Not needed.
> 
Well noted.
> BTW, please be sure you organize your patchsets per subsystem. IOW, that
> you do not split same subsystem bindings patches into separate
> patchsets.
> 
Do you mean combine the binding of qmp-ufs-phy with ufs controller? I noticed
that this patch belongs to "GENERIC PHY FRAMEWORK" subsystem and ufs controller
binding belongs to "UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER". If necessary,
we can pay attention to combine them next time
> Best regards,
> Krzysztof
> 
Thanks,
Jingyi


