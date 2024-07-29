Return-Path: <linux-arm-msm+bounces-27235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A10E993F310
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16BF31F228AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C736313D29A;
	Mon, 29 Jul 2024 10:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DbtcPf63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6489A163;
	Mon, 29 Jul 2024 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250034; cv=none; b=LYjgf9EiFXB2shg7zom+deuzwedXsKZaCK+OKghpQW2fNdX+ex+RkXwqkEUHkTJL2mrMiGfUm6tHDzXk2dpHKV7leJDlV13WYdDo14ppvQQUdOYtQrp6e/2ZQMOGTQYbIssTKn29BEQv1UGQe6+yCVYQh0S5wyp0tVWpO5R6tFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250034; c=relaxed/simple;
	bh=b9bI8wUZikmqwq2909k7MKHP6UiqrDlVYbCzcp6ouho=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f9K9oFtthqI3xbLc+zq7lFEy8X3hQTGSkn+hOqHa96UQLnFA9CP85e5O0jITqsndpLDNsflHOqfyatXEJ//4CFu1tmktnNlPV3u9kRgv58Dtnlm7JeYSwhQk82BtrTcyrdUs7QtuDuBmbi7gO0qMsIoECazJjLEXWWSGTRh8dpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DbtcPf63; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAJJ3n021468;
	Mon, 29 Jul 2024 10:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QDmS9fIU1t0UqW3++dlX2LtdqKUcOSk5P6upLOLTP+0=; b=DbtcPf635ombhF8d
	DDOsMl50lUulJ3Ph4g5Y4+OCLGvB0Yx1ovj2+0lEWzSRTpicfz5FF5pP7lAC6WB5
	edo6voCOQEFsxvvghiaMnCh+4Oyi1h7+S42hk7EmM/ocXmao+LIuiAzrViUUTfHr
	xVcFKpTbOj0fXKzhJNraghUxeIrRGSsdb6b3ftCKmD2JnDyNUBSRHYAt9nURUrbL
	jxfOYljNWAlaOAAwA0Kw6DnVJBVawWltvVYwCGhsYe/soDbnMw2As6uysnItbhe5
	iYzWqSU7V9iGG+2iNarYAwwcN3j22CReg/nHfPf5eFB/C/J2+dyp5jUOINt+0aB4
	IU0Brw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms433xku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:47:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TAl98n026553
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:47:09 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:47:06 -0700
Message-ID: <f1d987d3-d1fc-4c3c-af4e-b23833c936d0@quicinc.com>
Date: Mon, 29 Jul 2024 18:47:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p: Add UART node
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>, <andersson@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>,
        Tingwei
	<quic_tingweiz@quicinc.com>,
        "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
References: <20240710094149.13299-1-quic_vdadhani@quicinc.com>
 <2e309d52-8180-4922-9a5a-022fc8bf8ef5@kernel.org>
 <f5ed3285-82da-4ba8-9b4d-a0cc7323fde4@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <f5ed3285-82da-4ba8-9b4d-a0cc7323fde4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zzi39QicOOrkfOXe103u-luHm4fcb9V4
X-Proofpoint-ORIG-GUID: zzi39QicOOrkfOXe103u-luHm4fcb9V4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_09,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290073



On 7/10/2024 6:39 PM, Konrad Dybcio wrote:
> On 10.07.2024 11:47 AM, Krzysztof Kozlowski wrote:
>> On 10/07/2024 11:41, Viken Dadhaniya wrote:
>>> Add missing UART configuration for sa8775.
>>>
>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 231 ++++++++++++++++++++++++++
>>>   1 file changed, 231 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index 23f1b2e5e624..c107ee40341d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -1,6 +1,7 @@
>>>   // SPDX-License-Identifier: BSD-3-Clause
>>>   /*
>>>    * Copyright (c) 2023, Linaro Limited
>>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>    */
>>>   
>>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>> @@ -657,6 +658,21 @@
>>>   				status = "disabled";
>>>   			};
>>>   
>>> +			uart14: serial@880000 {
>>> +				compatible = "qcom,geni-uart";
>>> +				reg = <0x0 0x00880000 0x0 0x4000>;
>>> +				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
>>> +				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
>>> +				clock-names = "se";
>>> +				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
>>> +						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
>>> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>> +						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
>>> +				interconnect-names = "qup-core", "qup-config";
>>> +				power-domains = <&rpmhpd SA8775P_CX>;
>>
>> All the clocks, interconenct and power domains look to me questionable.
>> AFAIK, most of it (if not all) is going to be removed.
> 
> Yeah.. I'm lukewarm on accepting any sa8775p changes until that qcs9100(?)
> situation is squared out first
> 
> Konrad

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Therefore, this patch is still needed, please continue to review this
patch.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

