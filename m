Return-Path: <linux-arm-msm+bounces-28729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C1395410D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F8AB1F2531F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 05:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA9E811F1;
	Fri, 16 Aug 2024 05:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fJ7KtDIk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71B07F460;
	Fri, 16 Aug 2024 05:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723785553; cv=none; b=ChEyqsGtydSD9wuIViQSwUTrMA6bW3+cjGr+B9Xg0QEbxd/9MArZift9WcOtupiG9DVyYkfnM2259dlwV3d6tznBNnnoB/Z6Ocj5+zTxphL9iaWuk13mCzSMtS97tWSIjdcsxzOBemDV56SS/QN7BC5tWAt9rpGaKlSZ2n6IuxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723785553; c=relaxed/simple;
	bh=3S0ycsPmv/9VQNbBrJKlYMi77FQkTlM8k48sw0l0IkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZXU3b1yyVvA3Fnis0jHDfTBXK6Y0LlQ4mRi6NNRHS9vdbxjcKx6smHBboDu6W9rG1BJduLqcbaW8JMd+zehLHnykjf0mOQOBtpebTXwKnMY3eylO7C5t17HnQMquXxXVxQymB8o6MgkpvUy4cQKgL6wOOY2DgJaPxdU78ldcr74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fJ7KtDIk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FKbxGQ017861;
	Fri, 16 Aug 2024 05:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZprBQ3ZbaZNdCgXSwUoma0g1S3f3R/4jG9Zzjh1lnQ=; b=fJ7KtDIk97J8fE05
	xxezMhtNZR7dPYHbyCaZuSmtM113I8zct5OxLma8d0PccIx8uEru/swnZlv+HiL5
	9jYn94ZQgkxlJySW78bkA/2wNu5gVUWlNNDsIDA+kSM7C8xrpVWrdBDhjyFnAQ+P
	OlqlVbiBIetmB1S/f77Gp7Nd3x9+zp4NfWkKVe7maifa4NfwYuV8JQiaU1aiLvdc
	fx4URHJjpRUAUN7dCAFUzycyj3s1+Lh+7YCXDfnnUTWPH0G4Hvq+YWt9XhR+BTtb
	UzG7SRJGQM11k5bTtH/w9h9xfutosr2GcIUbYyt8QAYy7WOBI+wTGEQltZUxZqGT
	K0cS7Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411rvr8t7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 05:19:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G5J52h025737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 05:19:05 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 22:18:59 -0700
Message-ID: <47ac5ac0-f1d5-4506-aceb-22a02045fe75@quicinc.com>
Date: Fri, 16 Aug 2024 10:48:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: Add support for multimedia clock
 controllers
To: Tengfei Fan <quic_tengfan@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>,
        Tingwei
	<quic_tingweiz@quicinc.com>,
        "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
References: <20240715-sa8775p-mm-v3-v1-0-badaf35ed670@quicinc.com>
 <20240715-sa8775p-mm-v3-v1-7-badaf35ed670@quicinc.com>
 <d40d540c-a3b9-449d-8f34-cb2972ddc2ef@kernel.org>
 <12be3f5a-5bc6-40cc-a7af-7f098a7be04e@linaro.org>
 <080b47dc-c8e0-4962-a358-aa4c39e5e868@quicinc.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <080b47dc-c8e0-4962-a358-aa4c39e5e868@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: a6cawQ4YL-pY-FFC-gVQqydxiRHdLeRy
X-Proofpoint-ORIG-GUID: a6cawQ4YL-pY-FFC-gVQqydxiRHdLeRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160036



On 7/29/2024 4:12 PM, Tengfei Fan wrote:
> 
> 
> On 7/16/2024 8:09 PM, Konrad Dybcio wrote:
>> On 16.07.2024 9:45 AM, Krzysztof Kozlowski wrote:
>>> On 15/07/2024 10:23, Taniya Das wrote:
>>>> Add support for video, camera, display0 and display1 clock
>>>> controllers on SA8775P platform.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 56 
>>>> +++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 56 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi 
>>>> b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>>> index 23f1b2e5e624..8fd68a8aa916 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>>> @@ -2911,6 +2911,47 @@ llcc: system-cache-controller@9200000 {
>>>>               interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>>>>           };
>>>> +        videocc: clock-controller@abf0000 {
>>>> +            compatible = "qcom,sa8775p-videocc";
>>>> +            reg = <0x0 0x0abf0000 0x0 0x10000>;
>>>> +            clocks = <&gcc GCC_VIDEO_AHB_CLK>,
>>>> +                 <&rpmhcc RPMH_CXO_CLK>,
>>>> +                 <&rpmhcc RPMH_CXO_CLK_A>,
>>>> +                 <&sleep_clk>;
>>>> +            power-domains = <&rpmhpd SA8775P_MMCX>;
>>>
>>> Not sure if these are correct. I had impression the clocks are going
>>> away from sa8775p?
>>
>> Right, the patches look mostly good, but are still going to be on hold
>> until the 8775 situation is cleared out.. We recently had the gigantic
>> patchset [1] that shifted things around, and seemingly there was rather
>> little closure on that, so we're waiting for the dust to settle and
>> people to agree on things..
>>
>> Konrad
>>
>> [1] 
>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> After considering the feedback provided on the subject, We have decided
> to keep current SA8775p compatible and ABI compatibility in drivers.
> Therefore, this patch is still needed, please continue to review this
> patch.
> Thank you for your input.
> 

Thank you Tengfei, I will post the patches again.

-- 
Thanks & Regards,
Taniya Das.

