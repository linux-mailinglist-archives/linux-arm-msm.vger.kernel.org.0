Return-Path: <linux-arm-msm+bounces-30816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D4D96CCB3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 04:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F80D28800B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 02:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF381DDEA;
	Thu,  5 Sep 2024 02:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S7UBwNW6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748111FDA;
	Thu,  5 Sep 2024 02:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725503869; cv=none; b=HYi3UyEt7SC6v8lWU3DSBZPOiNeBZy9Orb4dgMWy3uB+HlM7Tg4KYzEh6ky1KgcYCPfHDR34Tu0sGhN+3t3pWn4DUrSSfpvSZg9X8yCqViqOMiLIUI89EuaHh0stDezkwLdidCsSX3v9PoO3b8qursD4kKhgKZsYzCo+4mOaFEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725503869; c=relaxed/simple;
	bh=M7204XcpStheL79uuy8gXm6TLMtxcnyMQMjGKf3csFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dBw1YGC3hZxAoeeHXzIh0Kv0N14kqBgDiB4uzCyeXiBAMNf4kztlIUDAkhH/HvecXFCLrmVZEXrN0jdZLgpVk0asfkE40tnAyl8ckyCBw+HCnohXqJZtIHHKKU8hXRGxYAsgFbAPkHT8+/JNVx99MMlNM3bMcQUfFzd2Tttf714=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S7UBwNW6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484LsmuU006270;
	Thu, 5 Sep 2024 02:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7z1n3WzCFDzaPiKb+fSXodr+w/IDY1h61mmxvBrfB7o=; b=S7UBwNW6WOPYtPku
	T4oj//xhcFdSwbaTDgHV4LtbPKw84EfLIscVfaJHIfDmIUc9wVrApdzQVVJO39M5
	hR0fihyY7WuPtnacyG7ZCre+L5TOCE1BsT94WjpiAio14g+xCNeV2LtMCHIajKI7
	Pmz7IdDEfLLWy3BHzWT0Rw+9Q6YRoe2yYPY6ddzlwZFbUYCnDO1swTHfceacTQUE
	l6bLqe3SXRSkvSt/OMaYRa3t8JOV6Zx2jpBiVdwIqHLMjyvjoj0pg3+bli5B4w+0
	gaNP5T614jbjQq0E4YRjHRn3Y0TCzmA26wWHnJQOrOLoPN92hydlyeIE6YhDi7W2
	gayVYw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41enbwj8ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 02:37:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4852bbc7005643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 02:37:37 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 19:37:34 -0700
Message-ID: <fb1c979d-1296-44ce-a985-5906a6d4a296@quicinc.com>
Date: Thu, 5 Sep 2024 10:37:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] dt-bindings: phy: Add QMP UFS PHY comptible for
 QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Xin
 Liu" <quic_liuxin@quicinc.com>, <linux-arm-msm@vger.kernel.org>
References: <20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com>
 <20240904-qcs8300_initial_dtsi-v1-3-d0ea9afdc007@quicinc.com>
 <e7qsuk3xoqgywubrkejoy3dztae2comlfn3mu6t226mvfvpfof@mlnj5s2xcsjf>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <e7qsuk3xoqgywubrkejoy3dztae2comlfn3mu6t226mvfvpfof@mlnj5s2xcsjf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8IBpnBWEVoiCJSENErM_5dxWIr4DhY1x
X-Proofpoint-GUID: 8IBpnBWEVoiCJSENErM_5dxWIr4DhY1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_01,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=794 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050018



On 9/4/2024 6:55 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 04, 2024 at 04:33:44PM GMT, Jingyi Wang wrote:
>> From: Xin Liu <quic_liuxin@quicinc.com>
>>
>> Document the QMP UFS PHY compatible for QCS8300 to support physical
>> layer functionality for USB found on the SoC.
> 
> So this is talking about USB, but the patch changes UFS. Please adjust.
> 
Thanks for review, will fix this.
>>
>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> index f9cfbd0b2de6..a3540f7a8ef8 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> @@ -18,6 +18,7 @@ properties:
>>      enum:
>>        - qcom,msm8996-qmp-ufs-phy
>>        - qcom,msm8998-qmp-ufs-phy
>> +      - qcom,qcs8300-qmp-ufs-phy
>>        - qcom,sa8775p-qmp-ufs-phy
>>        - qcom,sc7180-qmp-ufs-phy
>>        - qcom,sc7280-qmp-ufs-phy
>> @@ -85,6 +86,7 @@ allOf:
>>            contains:
>>              enum:
>>                - qcom,msm8998-qmp-ufs-phy
>> +              - qcom,qcs8300-qmp-ufs-phy
>>                - qcom,sa8775p-qmp-ufs-phy
>>                - qcom,sc7180-qmp-ufs-phy
>>                - qcom,sc7280-qmp-ufs-phy
>>
>> -- 
>> 2.25.1
>>
> 
Thanks,
Jingyi

