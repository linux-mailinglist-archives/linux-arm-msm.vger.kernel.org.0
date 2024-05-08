Return-Path: <linux-arm-msm+bounces-19468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF3A8BF608
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 08:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9DC31F2346C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 06:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5392C17C60;
	Wed,  8 May 2024 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eDDk2Gc6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F0C22324;
	Wed,  8 May 2024 06:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715149294; cv=none; b=ZM5nd2hrQrzy0KDCt1052sahT6QNfzfHQTCCoIE5SevLuU8ewD+RxpRSH1+g5ieYoRkl1T/Oen8wZp8gQUK3qyeYKOJ4ZouosM/OucRp5FVZP9/7VvMpBy1phDBY7+g29+w6AfMIwzFn0cBPoR4iLiJXxVuWr0TFZDe29Neh8Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715149294; c=relaxed/simple;
	bh=koB9KjRCACYqvO5zQYyzJJVHaA/xr3oY+TisVzeadio=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KnsAXIXN1+OgRr7ks0lDHbWhhBvjrfDZrpSgOdbV2FQXiSgH1V3YqtcBLzXP2BsL5mWQ4VvS+aYTP4RLZZ0+wKRHskz4j6yhx/W8eZE1x9CWXRFMlHeGlDdKpkrezyuLTuh7E0VLfrYxFw+kjFkhiY/kKkBAmyVZByMRGIxRi6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eDDk2Gc6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4485fOw2022330;
	Wed, 8 May 2024 06:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=S59UCkcML8LZV3YRENrW3zpbmlTqLI7XVn7wkHOw4Kw=; b=eD
	Dk2Gc6K/n8eB8+HO3Z4pWDEwJRlxS9b/6dt/YNTm6aG494xosT/XdpH62Ggaxqmt
	oDF0eDP7DS0UXb8JAbJjMrnB2Tv/6V4oakxoqdbw/wVWk/lwoqFbFdy9wSVvrVwI
	Zf5LyvXBWYZg2iTDipMgnwYQqtIVmAMA2qgzTgBYwVnVGgZNsANth1a+T1CSbKuk
	zUlko9r2/nso20OMaCRJIXMj0VTzTTyMMbhAnrVUjk9kPthuJhPpIVnZA3KXVHoN
	tTqvQ+TfwCkUx/Y6/Nx0S+ch54+zLHlNFYiokUid6w2p1yGUWqVjvAr+mUCfK04X
	hD5y1sy0GgXh1mVAJTSg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyste12p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 06:21:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4486LR6O009667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 06:21:27 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 23:21:21 -0700
Message-ID: <fc1e0745-a226-4be4-9b08-379c81396a7e@quicinc.com>
Date: Wed, 8 May 2024 11:51:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/8] dt-bindings: clock: qcom: Fix SM8450 videocc
 incorrect header file name
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>
References: <20240430142757.16872-1-quic_jkona@quicinc.com>
 <20240430142757.16872-2-quic_jkona@quicinc.com>
 <3951a7ea-b469-42dc-8240-a5c593bc536f@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <3951a7ea-b469-42dc-8240-a5c593bc536f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9iI8pudK4sYzzSV4ASYdvZeui-EJ4Gzj
X-Proofpoint-ORIG-GUID: 9iI8pudK4sYzzSV4ASYdvZeui-EJ4Gzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_02,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=998 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080045



On 5/4/2024 6:15 PM, Krzysztof Kozlowski wrote:
> On 30/04/2024 16:27, Jagadeesh Kona wrote:
>> Fix incorrect header file name in SM8450 videocc bindings.
>>
>> Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
>>   .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml          | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index bad8f019a8d3..78a1bb5be878 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -13,7 +13,7 @@ description: |
>>     Qualcomm video clock control module provides the clocks, resets and power
>>     domains on SM8450.
>>   
>> -  See also:: include/dt-bindings/clock/qcom,videocc-sm8450.h
>> +  See also:: include/dt-bindings/clock/qcom,sm8450-videocc.h
> 
> Then also s/::/:/. It was a mistake to introduce it.
> 

Thanks Krzysztof for your review. Will update this in next series.

Thanks,
Jagadeesh

