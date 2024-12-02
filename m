Return-Path: <linux-arm-msm+bounces-39802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE609DFD33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D3D0281D4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79981FA827;
	Mon,  2 Dec 2024 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hXquKaNd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186AA1F9EAC;
	Mon,  2 Dec 2024 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131963; cv=none; b=pDiF4jKqmhVmh3KzY43GYvmYkZHO33IDrcrY0gygGLLa/W5Sie3cPvNrq1XJphAMWYBFgVXrGQGtnf0PR48kZgGiJT4ODmdg2BIG+UVC5MDOpSgBvZuymMH53z4IwRSfK7/VzNo0vd7YNNMU23FqDOynGX0nD8/upwPs0VDSDjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131963; c=relaxed/simple;
	bh=oHkAOh/IHXX64tT0YCgNja1f7VUTBdxdzMLog2og7P8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QPBNa+ZrkkJxOjzFB1F5rQ73gZHIuFEIbQO/J5WCZOlK0L/gHtXrWGn6Os05nddXXzttKLlKN8BgHT4LyGaZKLlzlkKbIGKEsT30G18qUmh8AchUlmZhwnJ46a83JsZ9aPlPW779PK4NR9vGljrJ4iC5Bkqdq3GVhNUifh6mW0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hXquKaNd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28aPvS003922;
	Mon, 2 Dec 2024 09:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVEM9kkXSwem9zYGgZ/+gGqeroLKiB9YExxMWql40e8=; b=hXquKaNdo0vVMcgY
	blo8DTX2fU3aKTC5PwuSztNLhO1fUQLq4oBVEBkV7cE1uEtTpJf5U538Yss58h8Z
	VJtMBh9LKw9NT6c+9iZzIKZNgfdvlUxDQzYSz7ZJ43KJ55BO1FaHYXXaGsnHRFuP
	xcnef5W4yUohejOQHf5uZV85l+tP2XgQ9B9fBM/GX7zZ5Oj3cfOscPJJqQsresTB
	s0LFEQaNjNCWtffqGdUn5+682SppERuZdPrkBghmBNRnFmdyEY7IlbXLLiA87Dz2
	sf/AWZJqFHQ/YecqqDkgKXvCYHcFcPbc88CdpcpP2swMAQF3RPhHxAwsQbItt4p+
	Ms3Qsg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ta2va48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 09:32:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B29WM24022262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 09:32:22 GMT
Received: from [10.219.1.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 01:32:18 -0800
Message-ID: <75dc7814-a55e-4a6f-9df9-39b7c875dee9@quicinc.com>
Date: Mon, 2 Dec 2024 15:02:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: enable Bluetooth
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_msavaliy@quicinc.com>
References: <20241022104600.3228-1-quic_janathot@quicinc.com>
 <dd008ff5-ee2a-47be-8a5b-d4f3a1e2bac3@kernel.org>
Content-Language: en-US
From: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
In-Reply-To: <dd008ff5-ee2a-47be-8a5b-d4f3a1e2bac3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: m-SV-lSlNH7HcIfgO18bRiKd6Gwa4nnJ
X-Proofpoint-GUID: m-SV-lSlNH7HcIfgO18bRiKd6Gwa4nnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020084


Hi Krzysztof,
Thanks for the valuable review comments.

On 10/22/2024 5:57 PM, Krzysztof Kozlowski wrote:
> On 22/10/2024 12:46, Janaki Ramaiah Thota wrote:
>> Add Bluetooth and UART7 support for qcs6490-rb3gen2.
>>
>> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 122 ++++++++++++++++++-
>>   1 file changed, 121 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 0d45662b8028..b774d89172ea 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: BSD-3-Clause
>>   /*
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   /dts-v1/;
>> @@ -31,7 +31,9 @@
>>   	chassis-type = "embedded";
>>   
>>   	aliases {
>> +		bluetooth0 = &bluetooth;
> 
> Which driver uses this alias?
> 
>>   		serial0 = &uart5;
>> +		serial1 = &uart7;
>>   	};
> 
> ...
> 
> 
>>   };
>>   
>>   &uart5 {
>>   	status = "okay";
>>   };
>>   
>> +&uart7 {
>> +	status = "okay";
>> +	/delete-property/interrupts;
>> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
>> +				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> 
> 
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>,
>> +			<&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
> 
> This could be just one phandle to state node with multiple pins subnode.
> 

Since we have different configuration for 3 GPIOs, it’s not good to 
combine all 4 GPIOs into one common sleep configuration. Each GPIO 
configuration is having separate requirements based on the Bluetooth SOC.
This is as per hardware recommendations.


>> +
>> +	bluetooth: bluetooth {
>> +		compatible = "qcom,wcn6750-bt";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&bt_en>, <&sw_ctrl>;
>> +		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
>> +		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
>> +		vddaon-supply = <&vreg_s7b_0p972>;
>> +		vddbtcxmx-supply = <&vreg_s7b_0p972>;
>> +		vddrfacmn-supply = <&vreg_s7b_0p972>;
>> +		vddrfa0p8-supply = <&vreg_s7b_0p972>;
>> +		vddrfa1p7-supply = <&vreg_s1b_1p872>;
>> +		vddrfa1p2-supply = <&vreg_s8b_1p272>;
>> +		vddrfa2p2-supply = <&vreg_s1c_2p19>;
>> +		vddasd-supply = <&vreg_l11c_2p8>;
>> +		max-speed = <3200000>;
> 
> There were warnings in the past. Please confirm that you addressed them
> and this is warning free.
> 

Sure.

> Best regards,
> Krzysztof
> 

Thanks,
Janakiram


