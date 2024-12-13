Return-Path: <linux-arm-msm+bounces-41960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 717689F0972
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9154F1889AC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7AB1B87DF;
	Fri, 13 Dec 2024 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hCOZoeP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836791AF0BA;
	Fri, 13 Dec 2024 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085738; cv=none; b=n4vaNbj7H1yHw89QDDWzM6ZyzPLLP/481gbfcsgfzBEi36ZPDvYJXyB3fffT0MhkFE+ztFTd1tiTBQCH2+nXd4kIFFX8juyBGVh9wICC739TzYdgaC1x7tMEBfF6Lld5byykiTNYbg8bmbTUvxeBENY1mIaBvQOAAOutk8ErMjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085738; c=relaxed/simple;
	bh=v49punjc8mU97RYfY/bfGjWSOdjVC+SUl68y6pmScGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ozQUJytOOvgxIJ7NxYTNF9HDUAnyu2XOoc46ObzLOGYNrn0/ylJF5DO+oQJt7s3Bk6TjChhxPzE21eEXtuThjrNl0Hj+xcaPyhoe5by74zlr3H6kB/ZwK088tI2B6o3xCT2zivFsDpUNCSAxGoE0Pv6KDOZNHXEVDIYGqLf34mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hCOZoeP2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCNlbta028140;
	Fri, 13 Dec 2024 10:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FeGtjd3ooOcj/j2uoxhqRcyAT0zdW07RyPWDGJAn9tA=; b=hCOZoeP2tM6Ym54u
	f/U/OY25aCiS4/R/HzN9GaUafW0NTVOxw1BFM3n2pvYTt1pwis+BOSLXzjbYHG2l
	fT0Wnz2PHuxIbxNFLBIqX7kLosFKy4AisdW0YiwAH0Jnr/13QozE3VDpz3ECtelu
	ihMi3ZFdnro35YZmR7NtM+QlDqeizGm+8boNLAHs2wGRwuM7mfM7zv4QOhw80Oaz
	PCMhUddQ7wrQcpMwIlCOTeWIGXp+f6is92oOo+uzwWFIRZhcBXZIPJOhs4iv6AKF
	K2CSrR3X1WLCm+p8jclfwAycalsVF9AK1JlY1Mb4z8H/EpwlvwaLBuyadZ/jAfj/
	HeFE9g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fxw4u9nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:28:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDASlfY006165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:28:47 GMT
Received: from [10.235.8.17] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 02:28:42 -0800
Message-ID: <0b9a1e91-a3bb-4cff-96b8-7c5e853354a1@quicinc.com>
Date: Fri, 13 Dec 2024 18:28:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-4-a5cfe09de485@quicinc.com>
 <22491b41-f081-45cc-8766-6b4c851516f4@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <22491b41-f081-45cc-8766-6b4c851516f4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Trk6MSK4OVkRuequNOU-GulbC6NbIOIG
X-Proofpoint-GUID: Trk6MSK4OVkRuequNOU-GulbC6NbIOIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130071



On 12/13/2024 2:32 AM, Konrad Dybcio wrote:
> On 7.11.2024 10:50 AM, Luo Jie wrote:
>> The CMN PLL clock controller allows selection of an input clock rate
>> from a defined set of input clock rates. It in-turn supplies fixed
>> rate output clocks to the hardware blocks that provide the ethernet
>> functions such as PPE (Packet Process Engine) and connected switch or
>> PHY, and to GCC.
>>
>> The reference clock of CMN PLL is routed from XO to the CMN PLL through
>> the internal WiFi block.
>> .XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)-->48 MHZ to CMN PLL.
>>
>> The reference input clock from WiFi to CMN PLL is fully controlled by
>> the bootstrap pins which select the XO frequency (48 MHZ or 96 MHZ).
>> Based on this frequency, the divider in the internal Wi-Fi block is
>> automatically configured by hardware (1 for 48 MHZ, 2 for 96 MHZ), to
>> ensure output clock to CMN PLL is 48 MHZ.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 16 ++++++++++++++-
>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 26 +++++++++++++++++++++++-
>>   2 files changed, 40 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> index 91e104b0f865..78f6a2e053d5 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> @@ -3,7 +3,7 @@
>>    * IPQ9574 RDP board common device tree source
>>    *
>>    * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   /dts-v1/;
>> @@ -164,6 +164,20 @@ &usb3 {
>>   	status = "okay";
>>   };
>>   
>> +/*
>> + * The bootstrap pins for the board select the XO clock frequency,
>> + * which automatically enables the right dividers to ensure the
>> + * reference clock output from WiFi is 48 MHZ.
> 
> I'm a bit puzzled by this comment. Does it mean this clock could
> run at some different speeds?

The reference clock of CMN PLL is routed from XO to the CMN PLL through
the internal WiFi block.

.XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)-->48 MHZ to CMN PLL.

The CMN PLL reference clock from WiFi always runs at 48 MHZ on IPQ9574,
but the XO clock could be 48 MHZ or 96 MHZ on different IPQ9574 boards.
The bootstrap pins select the right divider to ensure eventual clock
rate from Wi-Fi is always 48 MHZ.

To avoid confusion, I will update this comment to mention that the
XO clock frequency could run at 48 MHZ or 96 MHZ.

> 
> [...]
> 
>>   
>> +		cmn_pll: clock-controller@9b000 {
>> +			compatible = "qcom,ipq9574-cmn-pll";
>> +			reg = <0x0009b000 0x800>;
>> +			clocks = <&ref_48mhz_clk>,
>> +				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
>> +				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
>> +			clock-names = "ref", "ahb", "sys";
>> +			#clock-cells = <1>;
>> +			assigned-clocks = <&cmn_pll CMN_PLL_CLK>;
>> +			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
> 
> Does devlink not complain about self-referencing the clock here?
> 
> Konrad

This code is validated on IPQ9574 RDP433 reference board, there is no
complaint reported about this self-referencing the clock of the clock
supplier DT node. It seems the API of_clk_set_defaults(struct
device_node *node, bool clk_supplier) called by this DT property
"assigned-clocks" allows this kind of self-reference.


